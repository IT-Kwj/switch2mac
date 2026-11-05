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
    float4 m_67 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_85 [[user(locn3)]];
    float4 m_75 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_47 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_63 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 m_81 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_59 [[attribute(9)]];
    float4 m_71 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1405 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_104);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1691 = as_type<float>(_120);
        out.gl_Position.z = _1691;
    }
    if (!_108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_134)
    {
        float _140 = float(_104);
        _112 = _140;
    }
    float _142 = _112;
    bool _144 = _138 >= _142;
    bool _146 = !_134;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_47.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _122 = as_type<int>(_154);
    }
    int _156 = _122;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1760 = as_type<float>(_156);
        out.gl_Position.z = _1760;
    }
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _158 = in.m_51.x;
    float _160 = in.m_51.y;
    float _162 = in.m_51.z;
    float _164 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _166 = in.m_53.x;
    float _168 = in.m_53.y;
    float _170 = in.m_53.z;
    bool _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _174 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _176 = _172 || _174;
    bool _178 = isnan(1.0);
    bool _180 = _176 || _178;
    float _182 = in.m_51.w;
    float _184 = in.m_49.x;
    float _186 = in.m_49.y;
    float _188 = in.m_49.z;
    float _190 = in.m_44.x;
    float _192 = in.m_44.y;
    float _194 = in.m_44.z;
    float _196 = _158 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _198 = _160 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _200 = _162 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _202 = _196 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _204 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _166);
    float _206 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _168);
    float _208 = _198 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _210 = _196;
    float _212 = _164;
    if (!_180)
    {
        float _214 = _164 * _164;
        float _216 = _214 * 0.5;
        _210 = _216;
    }
    float _218 = _210;
    float _220 = _202 * _204;
    float _222 = _208 * _206;
    float _224 = _218;
    if (!_180)
    {
        float _226 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _224 = _226;
    }
    float _228 = _224;
    bool _230 = !_180;
    float _232 = _228;
    if (!_230)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = _164 * _236;
        float _246 = 1.0 / _240;
        float _248 = _242 * 0.693147182464599609375;
        float _250 = exp2(_244);
        float _252 = 1.0 / _248;
        float _254 = _250 + (-1.0);
        float _256 = -_254;
        float _258 = fma(_256, _252, _164);
        float _260 = _258 * _246;
        float _262 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _232 = _262;
    }
    float _264 = _232;
    bool _266 = !_180;
    if (!_266)
    {
        float _268 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _270 = log2(_268);
        float _272 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _274 = _272 + 1.0;
        float _276 = 1.0 / _274;
        float _278 = _164 * _270;
        float _280 = exp2(_278);
        float _282 = -_280;
        float _284 = _282 + 1.0;
        float _286 = _284 * _276;
        _212 = _286;
    }
    float _288 = _212;
    float _290 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _292 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _294 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _296 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _170);
    float _298 = fma(_288, _186, _290);
    float _300 = fma(_288, _184, _292);
    float _302 = _222 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _304 = fma(_288, _188, _294);
    float _306 = fma(_298, _182, _192);
    float _308 = fma(_300, _182, _190);
    float _310 = _222 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _312 = fma(_220, (*spvDescriptorSet0.vp_c10)._m0[8].x, _302);
    float _314 = _306 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _316 = _200 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _318 = fma(_304, _182, _194);
    float _320 = _306 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _322 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[5].x, _314);
    float _324 = fma(_220, (*spvDescriptorSet0.vp_c10)._m0[9].x, _310);
    float _326 = _316 * _296;
    float _328 = _306 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _330 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[4].x, _320);
    float _332 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[5].z, _322);
    float _334 = _222 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _336 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[6].x, _328);
    float _338 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[9].z, _324);
    float _340 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[4].z, _330);
    float _342 = _332 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _344 = fma(_220, (*spvDescriptorSet0.vp_c10)._m0[10].x, _334);
    float _346 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[6].z, _336);
    float _348 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[8].z, _312);
    float _350 = _340 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _352 = _342 + _338;
    float _354 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[10].z, _344);
    float _356 = _346 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _358 = _350 + _348;
    float _360 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _362 = _352 + _360;
    bool _364 = _168 != 0.0;
    bool _366 = isnan(_168);
    bool _368 = _364 || _366;
    bool _370 = isnan(0.0);
    bool _372 = _368 || _370;
    float _374 = _356 + _354;
    float _376 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _378 = _358 + _376;
    float _380 = _362 * _362;
    bool _382 = _166 == 0.0;
    bool _384 = !_372;
    bool _386 = _382 && _384;
    float _388 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _390 = _374 + _388;
    float _392 = fma(_378, _378, _380);
    bool _394 = _170 == 0.0;
    bool _396 = _394 && _386;
    float _398 = in.m_55.x;
    float _400 = in.m_55.y;
    float _402 = in.m_55.z;
    float _404 = fma(_390, _390, _392);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[191].z + _406;
    float _410 = 1.0 / _408;
    float _412 = sqrt(_404);
    float _414 = _400;
    float _416 = _398;
    float _418 = _402;
    if (!_396)
    {
        float _420 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[17].y, _400);
        _414 = _420;
    }
    float _422 = _414;
    if (!_396)
    {
        float _424 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[17].y, _398);
        _416 = _424;
    }
    float _426 = _416;
    if (!_396)
    {
        float _428 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[17].y, _402);
        _418 = _428;
    }
    float _430 = _418;
    float _432 = _422 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _434 = _422 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _436 = _422 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _438 = precise::max(_412, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _440 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[10].x, _432);
    float _442 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[8].x, _434);
    float _444 = precise::min(_438, (*spvDescriptorSet0.vp_c9)._m0[191].z);
    float _446 = fma(_430, (*spvDescriptorSet0.vp_c10)._m0[10].z, _440);
    float _448 = fma(_430, (*spvDescriptorSet0.vp_c10)._m0[8].z, _442);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _452 = _444 + _450;
    float _454 = -_452;
    float _456 = fma(_454, _410, 1.0);
    float _458 = _456 * (*spvDescriptorSet0.vp_c9)._m0[191].w;
    float _460 = -_446;
    float _462 = fma(_460, _458, _374);
    float _464 = -_448;
    float _466 = fma(_464, _458, _358);
    float _468 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _470 = _462 + _468;
    float _472 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _474 = _466 + _472;
    float _476 = _470 * _470;
    float _478 = fma(_474, _474, _476);
    float _480 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[9].x, _436);
    float _482 = sqrt(_478);
    float _484 = fma(_430, (*spvDescriptorSet0.vp_c10)._m0[9].z, _480);
    float _486 = -_484;
    float _488 = fma(_486, _458, _352);
    bool _490 = _482 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _492 = 0.0;
    float _494 = _466;
    float _496 = _462;
    float _498 = _478;
    if (!_490)
    {
        _492 = _488;
    }
    float _500 = _492;
    bool _502 = !_490;
    float _504 = _500;
    if (!_502)
    {
        float _506 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _508 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _510 = _482 + _508;
        float _512 = _488 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _514 = rsqrt(_478);
        float _516 = _510 * _506;
        float _518 = _516 * 0.15915493667125701904296875;
        float _520 = _518 * 6.283185482025146484375;
        float _522 = cos(_520);
        float _524 = _518 * 6.283185482025146484375;
        float _526 = sin(_524);
        float _528 = _522 + (-1.0);
        float _530 = fma(_526, _512, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _532 = _528 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _534 = _514 * _530;
        float _536 = fma(_488, _522, _532);
        float _538 = fma(_474, _534, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _540 = fma(_470, _534, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _504 = _536;
        _494 = _538;
        _496 = _540;
    }
    float _542 = _504;
    float _544 = _494;
    float _546 = _496;
    float _548 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _550 = _542 + _548;
    float _552 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _554 = _544 + _552;
    float _556 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _558 = _546 + _556;
    float _560 = _550 * _550;
    float _562 = fma(_554, _554, _560);
    float _564 = fma(_558, _558, _562);
    float _566 = rsqrt(_564);
    float _568 = sqrt(_564);
    float _570 = _566 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _572 = _554 * _570;
    float _574 = _558 * _570;
    float _576 = _572 * _572;
    float _578 = _574 * _574;
    float _580 = _576 + _578;
    float _582 = sqrt(_580);
    bool _584 = _582 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _586 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _588 = _582 + _586;
    float _590 = _562;
    float _592 = _580;
    float _594 = _588;
    float _596 = _570;
    float _598 = _572;
    float _600 = _558;
    float _602 = _550;
    float _604 = _554;
    if (_584)
    {
        float _606 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _590 = _606;
    }
    float _608 = _590;
    if (_584)
    {
        float _610 = rsqrt(_580);
        _592 = _610;
    }
    float _612 = _592;
    float _614 = _612;
    if (_584)
    {
        float _616 = _588 * _608;
        _594 = _616;
    }
    float _618 = _594;
    if (_584)
    {
        float _620 = _618 * 0.15915493667125701904296875;
        _498 = _620;
    }
    float _622 = _498;
    float _624 = _608;
    float _626 = _622;
    if (_584)
    {
        float _628 = _622 * 6.283185482025146484375;
        float _630 = sin(_628);
        _624 = _630;
    }
    float _632 = _624;
    float _634 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _636 = precise::max(0.0, _634);
    float _638 = _488;
    float _640 = _636;
    if (_584)
    {
        float _642 = _622 * 6.283185482025146484375;
        float _644 = cos(_642);
        _638 = _644;
    }
    float _646 = _638;
    float _648 = -_570;
    float _650 = -_636;
    float _652 = fma(_550, _648, _650);
    if (_584)
    {
        float _654 = _652 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _640 = _654;
    }
    float _656 = _640;
    float _658 = _632;
    float _660 = _656;
    if (_584)
    {
        float _662 = fma(_632, _656, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _658 = _662;
    }
    float _664 = _658;
    float _666 = _664;
    float _668 = _646;
    if (_584)
    {
        float _670 = _646 + (-1.0);
        _660 = _670;
    }
    float _672 = _660;
    float _674 = _672;
    if (_584)
    {
        float _676 = _612 * _664;
        _596 = _676;
    }
    float _678 = _596;
    if (!_584)
    {
        _666 = _652;
    }
    float _680 = _666;
    float _682 = _680;
    if (_584)
    {
        float _684 = _672 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _626 = _684;
    }
    float _686 = _626;
    if (_584)
    {
        float _688 = _572 * _678;
        _598 = _688;
    }
    float _690 = _598;
    if (!_584)
    {
        _674 = _574;
    }
    float _692 = _674;
    float _694 = _692;
    if (_584)
    {
        float _696 = _574 * _678;
        _694 = _696;
    }
    float _698 = _694;
    if (!_584)
    {
        _614 = _576;
    }
    float _700 = _614;
    float _702 = _700;
    if (_584)
    {
        float _704 = fma(_652, _646, _686);
        _682 = _704;
    }
    float _706 = _682;
    if (_584)
    {
        float _708 = _690 * _690;
        _702 = _708;
    }
    float _710 = _702;
    if (!_584)
    {
        _668 = _578;
    }
    float _712 = _668;
    float _714 = _712;
    if (_584)
    {
        float _716 = _698 * _698;
        _714 = _716;
    }
    float _718 = _714;
    float _720 = fma(_706, _706, _710);
    float _722 = _542 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _724 = _542 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _726 = _720 + _718;
    float _728 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _730 = fma(_568, (*spvDescriptorSet0.vp_c15)._m0[23].w, _728);
    float _732 = precise::clamp(_730, 0.0, 1.0);
    float _734 = fma(_544, (*spvDescriptorSet0.vp_c8)._m0[2].x, _722);
    float _736 = _542 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _738 = rsqrt(_726);
    float _740 = -_732;
    float _742 = _740 + 1.0;
    float _744 = fma(_546, (*spvDescriptorSet0.vp_c8)._m0[2].z, _734);
    float _746 = _542 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _748 = fma(_544, (*spvDescriptorSet0.vp_c8)._m0[1].x, _736);
    float _750 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _752 = _744 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _754 = fma(_544, (*spvDescriptorSet0.vp_c8)._m0[0].x, _746);
    float _756 = abs(_742);
    float _758 = log2(_756);
    float _760 = fma(_546, (*spvDescriptorSet0.vp_c8)._m0[1].z, _748);
    float _762 = _752 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _764 = fma(_546, (*spvDescriptorSet0.vp_c8)._m0[0].z, _754);
    float _766 = fma(_544, (*spvDescriptorSet0.vp_c8)._m0[3].x, _724);
    float _768 = _760 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _770 = -_762;
    float _772 = fma(_770, _750, 1.0);
    float _774 = _764 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _776 = _738 * _690;
    float _778 = _768 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _780 = _738 * _706;
    float _782 = fma(_546, (*spvDescriptorSet0.vp_c8)._m0[3].z, _766);
    float _784 = _776 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _786 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[7].x, _778);
    float _788 = _738 * _698;
    float _790 = _782 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _792 = -_784;
    float _794 = fma(_780, (*spvDescriptorSet0.vp_c15)._m0[21].y, _792);
    float _796 = _758 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _798 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[7].z, _786);
    float _800 = log2(_772);
    float _802 = -_788;
    float _804 = fma(_802, (*spvDescriptorSet0.vp_c15)._m0[21].z, _794);
    float _806 = _768 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _808 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[7].w, _798);
    float _810 = _768 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _812 = fma(_804, -0.5, 0.5);
    float _814 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[4].x, _806);
    float _816 = fma(_804, 0.5, 0.5);
    float _818 = exp2(_796);
    float _820 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[5].x, _810);
    float _822 = _780 + 1.0;
    float _824 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[4].z, _814);
    float _826 = fma(_816, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _828 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[5].z, _820);
    float _830 = 1.0 / _808;
    float _832 = fma(_816, _826, -0.212114393711090087890625);
    float _834 = _800 * 0.693147182464599609375;
    float _836 = fma(_816, _832, 1.570728778839111328125);
    float _838 = _834 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _840 = sqrt(_812);
    float _842 = -_780;
    float _844 = fma(_818, _822, _842);
    float _846 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[4].w, _824);
    float _848 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[5].w, _828);
    float _850 = fma(_844, 0.5, 0.5);
    float _852 = _846 * _830;
    float _854 = _848 * _830;
    float _856 = fma(_852, 0.5, 0.5);
    float _858 = fma(_854, -0.5, 0.5);
    float _860 = _840 * 0.636619746685028076171875;
    float3 _2925 = float3(_856, _858, _838);
    float _862 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2925, float3(0.0), isnan(_2925)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2925, float3(0.0), isnan(_2925)), level(0.0)).x;
    float _864 = -_836;
    float _866 = fma(_860, _864, 1.0);
    float3 _2941 = float3(_856, _858, _838);
    float4 _869 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2941, float3(0.0), isnan(_2941)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2941, float3(0.0), isnan(_2941)), level(0.0)).xyzw;
    float _871 = _869.x;
    float _873 = _869.y;
    float _875 = _869.z;
    float _877 = _869.w;
    float2 _2958 = float2(_866, _850);
    float3 _881 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2958, float2(0.0), isnan(_2958)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2958, float2(0.0), isnan(_2958)), level(0.0)).xyz;
    float _883 = _881.x;
    float _885 = _881.y;
    float _887 = _881.z;
    float _889 = in.m_57.w;
    float _891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _893 = in.m_59.y;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _897 = in.m_57.y;
    float _899 = _768 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _901 = in.m_57.x;
    float _903 = in.m_59.x;
    float _905 = in.m_57.z;
    float _907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _911 = _889 > 0.5;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _917 = -_893;
    float _919 = _917 + 1.0;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _925 = _923 != 0;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _929 = _897 > 0.5;
    float _931 = _897 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _935 = _933 != 0;
    float _937 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[6].x, _899);
    float _939 = _929 ? _919 : _893;
    out.m_61.x = _412;
    int _941 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _943 = _941 != 0;
    float _945 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[6].z, _937);
    float _947 = _935 ? _939 : _893;
    float _949 = _846 + _808;
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _953 = _951 != 0;
    float _955 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[6].w, _945);
    int _957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _959 = _957 != 0;
    float _961 = _949 * 0.5;
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _965 = _963 != 0;
    float _967 = _901 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _969 = _939;
    float _971 = _967;
    float _973 = _893;
    bool _975 = _965;
    float _977 = _909;
    float _979 = _905;
    float _981 = _897;
    float _983 = _848;
    float _985 = _846;
    if (!_925)
    {
        _969 = _903;
    }
    float _987 = _969;
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _991 = _955 + _989;
    int _993 = _911 ? as_type<int>(_919) : as_type<int>(_893);
    float _995 = -_895;
    float _997 = fma(_967, 2.0, _995);
    float _999 = _987;
    if (!_925)
    {
        _971 = _987;
    }
    float _1001 = _971;
    float _1003 = _808 + _991;
    float _1005 = _1001;
    if (_925)
    {
        _999 = _903;
    }
    float _1007 = _999;
    float _1009 = -_138;
    float _1011 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[76].x, _997);
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1015 = _1013 != 0;
    float _1017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1019 = fma(_931, -2.0, _915);
    float _1021 = _907 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1023 = _959 ? as_type<float>(_993) : _893;
    int _1025 = 0;
    float _1027 = _1007;
    if (_943)
    {
        float _1029 = -_1007;
        float _1031 = _1029 + 1.0;
        _1025 = as_type<int>(_1031);
    }
    int _1033 = _1025;
    bool _1035 = _905 > 0.5;
    float _1037 = fma(_1021, _947, -0.5);
    int _1039 = 0;
    int _1041 = as_type<int>(_1037);
    float _1043 = as_type<float>(_1033);
    if (_953)
    {
        float _1045 = -_1007;
        float _1047 = _1045 + 1.0;
        _1039 = as_type<int>(_1047);
    }
    int _1049 = _1039;
    if (_965)
    {
        float _1051 = _1035 ? _919 : _893;
        _973 = _1051;
    }
    float _1053 = _973;
    float _1055 = _1003 * 0.5;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1059 = _1057;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    if (_925)
    {
        bool _1063 = _901 > 0.5;
        _975 = _1063;
    }
    bool _1065 = _975;
    out.m_63.x = _448;
    out.m_63.y = _484;
    out.m_63.z = _446;
    float _1067 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1057);
    float _1069 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1071 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1019);
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1075 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1067);
    if (_1015)
    {
        _1059 = _901;
    }
    float _1077 = _1059;
    float _1079 = fma(_1023, _1069, -0.5);
    float _1081 = _1077;
    if (!_1015)
    {
        _1061 = _897;
    }
    float _1083 = _1061;
    float _1085 = -_1071;
    float _1087 = fma(_1075, _1037, _1085);
    float _1089 = _1083;
    if (!_1015)
    {
        _1081 = _905;
    }
    float _1091 = _1081;
    if (_925)
    {
        float _1093 = -_1007;
        float _1095 = _1093 + 1.0;
        _1041 = as_type<int>(_1095);
    }
    int _1097 = _1041;
    float _1099 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1073);
    if (_1015)
    {
        _1089 = _901;
    }
    float _1101 = _1089;
    float _1103 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1105 = _891 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_925)
    {
        float _1107 = _1065 ? as_type<float>(_1097) : _1007;
        _1005 = _1107;
    }
    float _1109 = _1005;
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1113 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1117 = fma(_1105, _1053, -0.5);
    float _1119 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1111);
    float _1121 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1123 = -_1115;
    float _1125 = fma(_1113, 2.0, _1123);
    float _1127 = -_909;
    float _1129 = fma(_1103, 2.0, _1127);
    if (!_943)
    {
        _977 = _1007;
    }
    float _1131 = _977;
    float _1133 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[88].z, _913);
    float _1135 = _1131;
    if (_943)
    {
        float _1137 = _1035 ? as_type<float>(_1033) : _1007;
        _1135 = _1137;
    }
    float _1139 = _1135;
    float _1141 = -_138;
    float _1143 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1125);
    if (_953)
    {
        float _1145 = _929 ? as_type<float>(_1049) : _1007;
        _1027 = _1145;
    }
    float _1147 = _1027;
    float _1149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1151 = -_138;
    float _1153 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1129);
    if (!_1015)
    {
        _1043 = _905;
    }
    float _1155 = _1043;
    out.m_65.x = _554;
    out.m_65.y = _550;
    out.m_65.z = _558;
    float _1157 = _1155;
    if (_1015)
    {
        _1157 = _897;
    }
    float _1159 = _1157;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_1015)
    {
        _979 = _897;
    }
    float _1163 = _979;
    float _1165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (!_1015)
    {
        _981 = _901;
    }
    float _1167 = _981;
    float _1169 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1161);
    float _1171 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1173 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1175 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[83].w, _927);
    float _1177 = fma(_1171, -2.0, _921);
    float _1179 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1181 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1169);
    float _1183 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1185 = fma(_1179, _1139, -0.5);
    float _1187 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1189 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1191 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1193 = fma(_1173, _1109, -0.5);
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1197 = fma(_1191, _1147, -0.5);
    float _1199 = fma(_1181, _1193, _1011);
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1205 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1119);
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1213 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1215 = _1201 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1217 = _1203 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1219 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1221 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1223 = fma(_1187, -2.0, _1209);
    out.m_67.x = _1213;
    out.m_67.y = _1215;
    out.m_67.z = _1189;
    float _1225 = fma(_1205, _1185, _1143);
    float _1227 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1175);
    float _1229 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1177);
    out.m_69.x = _1217;
    out.m_69.y = _1219;
    out.m_69.z = _1221;
    float _1231 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1223);
    bool _1233 = _568 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1235 = isnan(_568);
    bool _1237 = _1233 || _1235;
    bool _1239 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1241 = _1237 || _1239;
    float _1243 = -_1229;
    float _1245 = fma(_1227, _1079, _1243);
    float _1247 = in.m_71.x;
    float _1249 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1133);
    float _1251 = in.m_71.y;
    float _1253 = _1199 + 0.5;
    float _1255 = _1225 + 0.5;
    float _1257 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1099);
    float _1259 = _758 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1261 = fma(_1249, _1197, _1153);
    float _1263 = _1087 + 0.5;
    float _1265 = _1245 + 0.5;
    float _1267 = -_1231;
    float _1269 = fma(_1257, _1117, _1267);
    float _1271 = _808 * 0.5;
    float _1273 = exp2(_1259);
    float _1275 = _1261 + 0.5;
    out.m_73.x = _1253;
    out.m_73.y = _1263;
    out.m_73.z = _1255;
    out.m_73.w = _1265;
    float _1277 = fma(_848, -0.5, _1271);
    float _1279 = _1269 + 0.5;
    out.gl_Position.x = _846;
    out.gl_Position.y = _848;
    out.gl_Position.z = _991;
    out.gl_Position.w = _808;
    if (!_1241)
    {
        _600 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1281 = _600;
    float _1283 = _1281;
    float _1285 = _1281;
    if (!_1241)
    {
        _602 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1287 = _602;
    out.m_75.x = _1247;
    float _1289 = _1287;
    float _1291 = _1287;
    if (!_1241)
    {
        _604 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1293 = _604;
    out.m_75.y = _1251;
    float _1295 = -_1273;
    float _1297 = _1295 + 1.0;
    out.m_77.x = _1275;
    out.m_77.y = _1279;
    float _1299 = _1297 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1301 = _1297;
    float _1303 = _1293;
    float _1305 = _1293;
    if (!_1241)
    {
        _983 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1307 = _983;
    out.m_79.x = _961;
    out.m_79.y = _1277;
    out.m_79.z = _1055;
    out.m_79.w = _808;
    float _1309 = _1307;
    float _1311 = _1307;
    if (!_1241)
    {
        _985 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1313 = _985;
    float _1315 = _1313;
    float _1317 = _1313;
    if (!_1241)
    {
        _1301 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1319 = _1301;
    float _1321 = _1299 * _862;
    float _1323 = -_1299;
    float _1325 = _1323 + 1.0;
    float _1327 = _877 * _1321;
    float _1329 = _877 * _1325;
    float _1331 = _887 * _1321;
    float _1333 = fma(_883, _1327, _871);
    float _1335 = fma(_885, _1327, _873);
    float _1337 = fma(_877, _1331, _875);
    out.m_81.x = _1333;
    out.m_81.y = _1335;
    out.m_81.z = _1337;
    out.m_81.w = _1329;
    bool _1339 = !_1241;
    float _1341 = _1319;
    float _1343 = _1319;
    if (!_1339)
    {
        bool _1345 = _568 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1347 = isnan(_568);
        bool _1349 = _1345 || _1347;
        bool _1351 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1353 = _1349 || _1351;
        if (!_1353)
        {
            float _1355 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1357 = _568 + _1355;
            float _1359 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1361 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1359;
            float _1363 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1365 = _1363 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1367 = 1.0 / _1361;
            float _1369 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1371 = _1369 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1373 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1375 = _1373 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1377 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1379 = _1377 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1381 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1383 = _1381 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1385 = _1357 * _1367;
            float _1387 = precise::clamp(_1385, 0.0, 1.0);
            float _1389 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1391 = _1389 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1393 = fma(_1387, _1365, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1395 = fma(_1387, _1391, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1397 = fma(_1387, _1371, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1399 = fma(_1387, _1375, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1401 = fma(_1387, _1379, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1403 = fma(_1387, _1383, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1317 = _1397;
            _1291 = _1401;
            _1311 = _1393;
            _1285 = _1399;
            _1343 = _1395;
            _1305 = _1403;
            _1405 = true;
        }
        else
        {
            bool _1407 = _568 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1409 = isnan(_568);
            bool _1411 = _1407 || _1409;
            bool _1413 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1415 = _1411 || _1413;
            if (!_1415)
            {
                _1309 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1417 = _1309;
            _1311 = _1417;
            if (!_1415)
            {
                _1315 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1419 = _1315;
            _1317 = _1419;
            if (!_1415)
            {
                _1341 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1421 = _1341;
            _1343 = _1421;
            if (!_1415)
            {
                _1283 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1423 = _1283;
            _1285 = _1423;
            if (!_1415)
            {
                _1289 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1425 = _1289;
            _1291 = _1425;
            if (!_1415)
            {
                _1303 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1427 = _1303;
            bool _1429 = !_1415;
            _1305 = _1427;
            if (!_1429)
            {
                bool _1431 = _568 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1433 = isnan(_568);
                bool _1435 = _1431 || _1433;
                bool _1437 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1439 = _1435 || _1437;
                if (!_1439)
                {
                    float _1441 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1443 = _568 + _1441;
                    float _1445 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1447 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1445;
                    float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1451 = _1449 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1453 = 1.0 / _1447;
                    float _1455 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1457 = _1455 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1459 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1461 = _1459 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1463 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1465 = _1463 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1467 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1469 = _1467 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1471 = _1443 * _1453;
                    float _1473 = precise::clamp(_1471, 0.0, 1.0);
                    float _1475 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1477 = _1475 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1479 = fma(_1473, _1451, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1481 = fma(_1473, _1477, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1483 = fma(_1473, _1457, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1485 = fma(_1473, _1461, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1487 = fma(_1473, _1465, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1489 = fma(_1473, _1469, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1317 = _1483;
                    _1291 = _1487;
                    _1311 = _1479;
                    _1285 = _1485;
                    _1343 = _1481;
                    _1305 = _1489;
                    _1405 = true;
                }
                else
                {
                    _1317 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1291 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1311 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1285 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1343 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1305 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1405 = false;
    float _1491 = _1317;
    float _1493 = _1291;
    float _1495 = _1311;
    float _1497 = _1285;
    float _1499 = _1343;
    float _1501 = _1305;
    float _1503 = fma(_484, -0.5, 0.5);
    float _1505 = precise::clamp(_1503, 0.0, 1.0);
    float _1507 = -_1491;
    float _1509 = _1507 + _1493;
    float _1511 = -_1495;
    float _1513 = _1511 + _1497;
    float _1515 = -_1499;
    float _1517 = _1515 + _1501;
    bool _1519 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1521 = fma(_1505, _1509, _1491);
    float _1523 = fma(_1505, _1513, _1495);
    float _1525 = fma(_1505, _1517, _1499);
    float _1527 = _1521 * 0.586610972881317138671875;
    out.m_83.x = 0.0;
    float _1529 = fma(_1523, 0.298911988735198974609375, _1527);
    float _1531 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1533 = fma(_1525, 0.114477999508380889892578125, _1529);
    out.m_47.x = _1531;
    float _1535 = -_1533;
    float _1537 = _1523 + _1535;
    float _1539 = -_1533;
    float _1541 = _1521 + _1539;
    float _1543 = -_1533;
    float _1545 = _1525 + _1543;
    float _1547 = fma(_1537, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1533);
    float _1549 = fma(_1541, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1533);
    float _1551 = fma(_1545, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1533);
    out.m_85.x = _1547;
    out.m_85.y = _1549;
    out.m_85.z = _1551;
    if (!_1519)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1553 = -_542;
    float _1555 = _1553 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1557 = -_544;
    float _1559 = _1557 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1561 = -_546;
    float _1563 = _1561 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1565 = _1555 * _1555;
    float _1567 = fma(_1559, _1559, _1565);
    float _1569 = fma(_1563, _1563, _1567);
    float _1571 = sqrt(_1569);
    float _1573 = rsqrt(_1569);
    float _1575 = -_1571;
    float _1577 = _1575 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1579 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1581 = precise::clamp(_1579, 0.0, 1.0);
    float _1583 = _1559 * _1573;
    float _1585 = _1555 * _1573;
    float _1587 = abs(_1581);
    float _1589 = log2(_1587);
    float _1591 = _1563 * _1573;
    float _1593 = _1583 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1595 = _484 * _1585;
    float _1597 = -_1585;
    float _1599 = -_1593;
    float _1601 = fma(_1597, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1599);
    float _1603 = fma(_448, _1583, _1595);
    float _1605 = -_1591;
    float _1607 = fma(_1605, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1601);
    float _1609 = fma(_446, _1591, _1603);
    float _1611 = precise::clamp(_1609, 0.0, 1.0);
    float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1615 = _1607 + _1613;
    float _1617 = _1589 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1619 = _1615 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1621 = precise::clamp(_1619, 0.0, 1.0);
    float _1623 = exp2(_1617);
    float _1625 = _1623 * _1621;
    float _1627 = _1611 * _1625;
    float _1629 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1631 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1633 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_83.x = _1629;
    out.m_83.y = _1631;
    out.m_83.z = _1633;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1405 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_104);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1691 = as_type<float>(_120);
        out.gl_Position.z = _1691;
    }
    if (!_108)
    {
        return out;
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_134)
    {
        float _140 = float(_104);
        _112 = _140;
    }
    float _142 = _112;
    bool _144 = _138 >= _142;
    bool _146 = !_134;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_47.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _122 = as_type<int>(_154);
    }
    int _156 = _122;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1760 = as_type<float>(_156);
        out.gl_Position.z = _1760;
    }
    if (_148)
    {
        return out;
    }
    float _158 = in.m_51.x;
    float _160 = in.m_51.y;
    float _162 = in.m_51.z;
    float _164 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _166 = in.m_53.x;
    float _168 = in.m_53.y;
    float _170 = in.m_53.z;
    bool _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _174 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _176 = _172 || _174;
    bool _178 = isnan(1.0);
    bool _180 = _176 || _178;
    float _182 = in.m_51.w;
    float _184 = in.m_49.x;
    float _186 = in.m_49.y;
    float _188 = in.m_49.z;
    float _190 = in.m_44.x;
    float _192 = in.m_44.y;
    float _194 = in.m_44.z;
    float _196 = _158 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _198 = _160 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _200 = _162 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _202 = _196 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _204 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _166);
    float _206 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _168);
    float _208 = _198 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _210 = _196;
    float _212 = _164;
    if (!_180)
    {
        float _214 = _164 * _164;
        float _216 = _214 * 0.5;
        _210 = _216;
    }
    float _218 = _210;
    float _220 = _202 * _204;
    float _222 = _208 * _206;
    float _224 = _218;
    if (!_180)
    {
        float _226 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _224 = _226;
    }
    float _228 = _224;
    bool _230 = !_180;
    float _232 = _228;
    if (!_230)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = _164 * _236;
        float _246 = 1.0 / _240;
        float _248 = _242 * 0.693147182464599609375;
        float _250 = exp2(_244);
        float _252 = 1.0 / _248;
        float _254 = _250 + (-1.0);
        float _256 = -_254;
        float _258 = fma(_256, _252, _164);
        float _260 = _258 * _246;
        float _262 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _232 = _262;
    }
    float _264 = _232;
    bool _266 = !_180;
    if (!_266)
    {
        float _268 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _270 = log2(_268);
        float _272 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _274 = _272 + 1.0;
        float _276 = 1.0 / _274;
        float _278 = _164 * _270;
        float _280 = exp2(_278);
        float _282 = -_280;
        float _284 = _282 + 1.0;
        float _286 = _284 * _276;
        _212 = _286;
    }
    float _288 = _212;
    float _290 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _292 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _294 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _296 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _170);
    float _298 = fma(_288, _186, _290);
    float _300 = fma(_288, _184, _292);
    float _302 = _222 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _304 = fma(_288, _188, _294);
    float _306 = fma(_298, _182, _192);
    float _308 = fma(_300, _182, _190);
    float _310 = _222 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _312 = fma(_220, (*spvDescriptorSet0.vp_c10)._m0[8].x, _302);
    float _314 = _306 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _316 = _200 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _318 = fma(_304, _182, _194);
    float _320 = _306 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _322 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[5].x, _314);
    float _324 = fma(_220, (*spvDescriptorSet0.vp_c10)._m0[9].x, _310);
    float _326 = _316 * _296;
    float _328 = _306 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _330 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[4].x, _320);
    float _332 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[5].z, _322);
    float _334 = _222 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _336 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[6].x, _328);
    float _338 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[9].z, _324);
    float _340 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[4].z, _330);
    float _342 = _332 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _344 = fma(_220, (*spvDescriptorSet0.vp_c10)._m0[10].x, _334);
    float _346 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[6].z, _336);
    float _348 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[8].z, _312);
    float _350 = _340 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _352 = _342 + _338;
    float _354 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[10].z, _344);
    float _356 = _346 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _358 = _350 + _348;
    float _360 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _362 = _352 + _360;
    bool _364 = _168 != 0.0;
    bool _366 = isnan(_168);
    bool _368 = _364 || _366;
    bool _370 = isnan(0.0);
    bool _372 = _368 || _370;
    float _374 = _356 + _354;
    float _376 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _378 = _358 + _376;
    float _380 = _362 * _362;
    bool _382 = _166 == 0.0;
    bool _384 = !_372;
    bool _386 = _382 && _384;
    float _388 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _390 = _374 + _388;
    float _392 = fma(_378, _378, _380);
    bool _394 = _170 == 0.0;
    bool _396 = _394 && _386;
    float _398 = in.m_55.x;
    float _400 = in.m_55.y;
    float _402 = in.m_55.z;
    float _404 = fma(_390, _390, _392);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[191].z + _406;
    float _410 = 1.0 / _408;
    float _412 = sqrt(_404);
    float _414 = _400;
    float _416 = _398;
    float _418 = _402;
    if (!_396)
    {
        float _420 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[17].y, _400);
        _414 = _420;
    }
    float _422 = _414;
    if (!_396)
    {
        float _424 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[17].y, _398);
        _416 = _424;
    }
    float _426 = _416;
    if (!_396)
    {
        float _428 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[17].y, _402);
        _418 = _428;
    }
    float _430 = _418;
    float _432 = _422 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _434 = _422 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _436 = _422 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _438 = precise::max(_412, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _440 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[10].x, _432);
    float _442 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[8].x, _434);
    float _444 = precise::min(_438, (*spvDescriptorSet0.vp_c9)._m0[191].z);
    float _446 = fma(_430, (*spvDescriptorSet0.vp_c10)._m0[10].z, _440);
    float _448 = fma(_430, (*spvDescriptorSet0.vp_c10)._m0[8].z, _442);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _452 = _444 + _450;
    float _454 = -_452;
    float _456 = fma(_454, _410, 1.0);
    float _458 = _456 * (*spvDescriptorSet0.vp_c9)._m0[191].w;
    float _460 = -_446;
    float _462 = fma(_460, _458, _374);
    float _464 = -_448;
    float _466 = fma(_464, _458, _358);
    float _468 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _470 = _462 + _468;
    float _472 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _474 = _466 + _472;
    float _476 = _470 * _470;
    float _478 = fma(_474, _474, _476);
    float _480 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[9].x, _436);
    float _482 = sqrt(_478);
    float _484 = fma(_430, (*spvDescriptorSet0.vp_c10)._m0[9].z, _480);
    float _486 = -_484;
    float _488 = fma(_486, _458, _352);
    bool _490 = _482 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _492 = 0.0;
    float _494 = _466;
    float _496 = _462;
    float _498 = _478;
    if (!_490)
    {
        _492 = _488;
    }
    float _500 = _492;
    bool _502 = !_490;
    float _504 = _500;
    if (!_502)
    {
        float _506 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _508 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _510 = _482 + _508;
        float _512 = _488 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _514 = rsqrt(_478);
        float _516 = _510 * _506;
        float _518 = _516 * 0.15915493667125701904296875;
        float _520 = _518 * 6.283185482025146484375;
        float _522 = cos(_520);
        float _524 = _518 * 6.283185482025146484375;
        float _526 = sin(_524);
        float _528 = _522 + (-1.0);
        float _530 = fma(_526, _512, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _532 = _528 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _534 = _514 * _530;
        float _536 = fma(_488, _522, _532);
        float _538 = fma(_474, _534, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _540 = fma(_470, _534, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _504 = _536;
        _494 = _538;
        _496 = _540;
    }
    float _542 = _504;
    float _544 = _494;
    float _546 = _496;
    float _548 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _550 = _542 + _548;
    float _552 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _554 = _544 + _552;
    float _556 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _558 = _546 + _556;
    float _560 = _550 * _550;
    float _562 = fma(_554, _554, _560);
    float _564 = fma(_558, _558, _562);
    float _566 = rsqrt(_564);
    float _568 = sqrt(_564);
    float _570 = _566 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _572 = _554 * _570;
    float _574 = _558 * _570;
    float _576 = _572 * _572;
    float _578 = _574 * _574;
    float _580 = _576 + _578;
    float _582 = sqrt(_580);
    bool _584 = _582 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _586 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _588 = _582 + _586;
    float _590 = _562;
    float _592 = _580;
    float _594 = _588;
    float _596 = _570;
    float _598 = _572;
    float _600 = _558;
    float _602 = _550;
    float _604 = _554;
    if (_584)
    {
        float _606 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _590 = _606;
    }
    float _608 = _590;
    if (_584)
    {
        float _610 = rsqrt(_580);
        _592 = _610;
    }
    float _612 = _592;
    float _614 = _612;
    if (_584)
    {
        float _616 = _588 * _608;
        _594 = _616;
    }
    float _618 = _594;
    if (_584)
    {
        float _620 = _618 * 0.15915493667125701904296875;
        _498 = _620;
    }
    float _622 = _498;
    float _624 = _608;
    float _626 = _622;
    if (_584)
    {
        float _628 = _622 * 6.283185482025146484375;
        float _630 = sin(_628);
        _624 = _630;
    }
    float _632 = _624;
    float _634 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _636 = precise::max(0.0, _634);
    float _638 = _488;
    float _640 = _636;
    if (_584)
    {
        float _642 = _622 * 6.283185482025146484375;
        float _644 = cos(_642);
        _638 = _644;
    }
    float _646 = _638;
    float _648 = -_570;
    float _650 = -_636;
    float _652 = fma(_550, _648, _650);
    if (_584)
    {
        float _654 = _652 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _640 = _654;
    }
    float _656 = _640;
    float _658 = _632;
    float _660 = _656;
    if (_584)
    {
        float _662 = fma(_632, _656, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _658 = _662;
    }
    float _664 = _658;
    float _666 = _664;
    float _668 = _646;
    if (_584)
    {
        float _670 = _646 + (-1.0);
        _660 = _670;
    }
    float _672 = _660;
    float _674 = _672;
    if (_584)
    {
        float _676 = _612 * _664;
        _596 = _676;
    }
    float _678 = _596;
    if (!_584)
    {
        _666 = _652;
    }
    float _680 = _666;
    float _682 = _680;
    if (_584)
    {
        float _684 = _672 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _626 = _684;
    }
    float _686 = _626;
    if (_584)
    {
        float _688 = _572 * _678;
        _598 = _688;
    }
    float _690 = _598;
    if (!_584)
    {
        _674 = _574;
    }
    float _692 = _674;
    float _694 = _692;
    if (_584)
    {
        float _696 = _574 * _678;
        _694 = _696;
    }
    float _698 = _694;
    if (!_584)
    {
        _614 = _576;
    }
    float _700 = _614;
    float _702 = _700;
    if (_584)
    {
        float _704 = fma(_652, _646, _686);
        _682 = _704;
    }
    float _706 = _682;
    if (_584)
    {
        float _708 = _690 * _690;
        _702 = _708;
    }
    float _710 = _702;
    if (!_584)
    {
        _668 = _578;
    }
    float _712 = _668;
    float _714 = _712;
    if (_584)
    {
        float _716 = _698 * _698;
        _714 = _716;
    }
    float _718 = _714;
    float _720 = fma(_706, _706, _710);
    float _722 = _542 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _724 = _542 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _726 = _720 + _718;
    float _728 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _730 = fma(_568, (*spvDescriptorSet0.vp_c15)._m0[23].w, _728);
    float _732 = precise::clamp(_730, 0.0, 1.0);
    float _734 = fma(_544, (*spvDescriptorSet0.vp_c8)._m0[2].x, _722);
    float _736 = _542 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _738 = rsqrt(_726);
    float _740 = -_732;
    float _742 = _740 + 1.0;
    float _744 = fma(_546, (*spvDescriptorSet0.vp_c8)._m0[2].z, _734);
    float _746 = _542 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _748 = fma(_544, (*spvDescriptorSet0.vp_c8)._m0[1].x, _736);
    float _750 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _752 = _744 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _754 = fma(_544, (*spvDescriptorSet0.vp_c8)._m0[0].x, _746);
    float _756 = abs(_742);
    float _758 = log2(_756);
    float _760 = fma(_546, (*spvDescriptorSet0.vp_c8)._m0[1].z, _748);
    float _762 = _752 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _764 = fma(_546, (*spvDescriptorSet0.vp_c8)._m0[0].z, _754);
    float _766 = fma(_544, (*spvDescriptorSet0.vp_c8)._m0[3].x, _724);
    float _768 = _760 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _770 = -_762;
    float _772 = fma(_770, _750, 1.0);
    float _774 = _764 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _776 = _738 * _690;
    float _778 = _768 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _780 = _738 * _706;
    float _782 = fma(_546, (*spvDescriptorSet0.vp_c8)._m0[3].z, _766);
    float _784 = _776 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _786 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[7].x, _778);
    float _788 = _738 * _698;
    float _790 = _782 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _792 = -_784;
    float _794 = fma(_780, (*spvDescriptorSet0.vp_c15)._m0[21].y, _792);
    float _796 = _758 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _798 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[7].z, _786);
    float _800 = log2(_772);
    float _802 = -_788;
    float _804 = fma(_802, (*spvDescriptorSet0.vp_c15)._m0[21].z, _794);
    float _806 = _768 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _808 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[7].w, _798);
    float _810 = _768 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _812 = fma(_804, -0.5, 0.5);
    float _814 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[4].x, _806);
    float _816 = fma(_804, 0.5, 0.5);
    float _818 = exp2(_796);
    float _820 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[5].x, _810);
    float _822 = _780 + 1.0;
    float _824 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[4].z, _814);
    float _826 = fma(_816, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _828 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[5].z, _820);
    float _830 = 1.0 / _808;
    float _832 = fma(_816, _826, -0.212114393711090087890625);
    float _834 = _800 * 0.693147182464599609375;
    float _836 = fma(_816, _832, 1.570728778839111328125);
    float _838 = _834 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _840 = sqrt(_812);
    float _842 = -_780;
    float _844 = fma(_818, _822, _842);
    float _846 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[4].w, _824);
    float _848 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[5].w, _828);
    float _850 = fma(_844, 0.5, 0.5);
    float _852 = _846 * _830;
    float _854 = _848 * _830;
    float _856 = fma(_852, 0.5, 0.5);
    float _858 = fma(_854, -0.5, 0.5);
    float _860 = _840 * 0.636619746685028076171875;
    float3 _2925 = float3(_856, _858, _838);
    float _862 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2925, float3(0.0), isnan(_2925)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2925, float3(0.0), isnan(_2925)), level(0.0)).x;
    float _864 = -_836;
    float _866 = fma(_860, _864, 1.0);
    float3 _2941 = float3(_856, _858, _838);
    float4 _869 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2941, float3(0.0), isnan(_2941)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2941, float3(0.0), isnan(_2941)), level(0.0)).xyzw;
    float _871 = _869.x;
    float _873 = _869.y;
    float _875 = _869.z;
    float _877 = _869.w;
    float2 _2958 = float2(_866, _850);
    float3 _881 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2958, float2(0.0), isnan(_2958)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2958, float2(0.0), isnan(_2958)), level(0.0)).xyz;
    float _883 = _881.x;
    float _885 = _881.y;
    float _887 = _881.z;
    float _889 = in.m_57.w;
    float _891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _893 = in.m_59.y;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _897 = in.m_57.y;
    float _899 = _768 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _901 = in.m_57.x;
    float _903 = in.m_59.x;
    float _905 = in.m_57.z;
    float _907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _911 = _889 > 0.5;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _917 = -_893;
    float _919 = _917 + 1.0;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _925 = _923 != 0;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _929 = _897 > 0.5;
    float _931 = _897 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _935 = _933 != 0;
    float _937 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[6].x, _899);
    float _939 = _929 ? _919 : _893;
    out.m_61.x = _412;
    int _941 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _943 = _941 != 0;
    float _945 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[6].z, _937);
    float _947 = _935 ? _939 : _893;
    float _949 = _846 + _808;
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _953 = _951 != 0;
    float _955 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[6].w, _945);
    int _957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _959 = _957 != 0;
    float _961 = _949 * 0.5;
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _965 = _963 != 0;
    float _967 = _901 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _969 = _939;
    float _971 = _967;
    float _973 = _893;
    bool _975 = _965;
    float _977 = _909;
    float _979 = _905;
    float _981 = _897;
    float _983 = _848;
    float _985 = _846;
    if (!_925)
    {
        _969 = _903;
    }
    float _987 = _969;
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _991 = _955 + _989;
    int _993 = _911 ? as_type<int>(_919) : as_type<int>(_893);
    float _995 = -_895;
    float _997 = fma(_967, 2.0, _995);
    float _999 = _987;
    if (!_925)
    {
        _971 = _987;
    }
    float _1001 = _971;
    float _1003 = _808 + _991;
    float _1005 = _1001;
    if (_925)
    {
        _999 = _903;
    }
    float _1007 = _999;
    float _1009 = -_138;
    float _1011 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[76].x, _997);
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1015 = _1013 != 0;
    float _1017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1019 = fma(_931, -2.0, _915);
    float _1021 = _907 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1023 = _959 ? as_type<float>(_993) : _893;
    int _1025 = 0;
    float _1027 = _1007;
    if (_943)
    {
        float _1029 = -_1007;
        float _1031 = _1029 + 1.0;
        _1025 = as_type<int>(_1031);
    }
    int _1033 = _1025;
    bool _1035 = _905 > 0.5;
    float _1037 = fma(_1021, _947, -0.5);
    int _1039 = 0;
    int _1041 = as_type<int>(_1037);
    float _1043 = as_type<float>(_1033);
    if (_953)
    {
        float _1045 = -_1007;
        float _1047 = _1045 + 1.0;
        _1039 = as_type<int>(_1047);
    }
    int _1049 = _1039;
    if (_965)
    {
        float _1051 = _1035 ? _919 : _893;
        _973 = _1051;
    }
    float _1053 = _973;
    float _1055 = _1003 * 0.5;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1059 = _1057;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    if (_925)
    {
        bool _1063 = _901 > 0.5;
        _975 = _1063;
    }
    bool _1065 = _975;
    out.m_63.x = _448;
    out.m_63.y = _484;
    out.m_63.z = _446;
    float _1067 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1057);
    float _1069 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1071 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1019);
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1075 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1067);
    if (_1015)
    {
        _1059 = _901;
    }
    float _1077 = _1059;
    float _1079 = fma(_1023, _1069, -0.5);
    float _1081 = _1077;
    if (!_1015)
    {
        _1061 = _897;
    }
    float _1083 = _1061;
    float _1085 = -_1071;
    float _1087 = fma(_1075, _1037, _1085);
    float _1089 = _1083;
    if (!_1015)
    {
        _1081 = _905;
    }
    float _1091 = _1081;
    if (_925)
    {
        float _1093 = -_1007;
        float _1095 = _1093 + 1.0;
        _1041 = as_type<int>(_1095);
    }
    int _1097 = _1041;
    float _1099 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1073);
    if (_1015)
    {
        _1089 = _901;
    }
    float _1101 = _1089;
    float _1103 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1105 = _891 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_925)
    {
        float _1107 = _1065 ? as_type<float>(_1097) : _1007;
        _1005 = _1107;
    }
    float _1109 = _1005;
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1113 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1117 = fma(_1105, _1053, -0.5);
    float _1119 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1111);
    float _1121 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1123 = -_1115;
    float _1125 = fma(_1113, 2.0, _1123);
    float _1127 = -_909;
    float _1129 = fma(_1103, 2.0, _1127);
    if (!_943)
    {
        _977 = _1007;
    }
    float _1131 = _977;
    float _1133 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[88].z, _913);
    float _1135 = _1131;
    if (_943)
    {
        float _1137 = _1035 ? as_type<float>(_1033) : _1007;
        _1135 = _1137;
    }
    float _1139 = _1135;
    float _1141 = -_138;
    float _1143 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1125);
    if (_953)
    {
        float _1145 = _929 ? as_type<float>(_1049) : _1007;
        _1027 = _1145;
    }
    float _1147 = _1027;
    float _1149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1151 = -_138;
    float _1153 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1129);
    if (!_1015)
    {
        _1043 = _905;
    }
    float _1155 = _1043;
    out.m_65.x = _554;
    out.m_65.y = _550;
    out.m_65.z = _558;
    float _1157 = _1155;
    if (_1015)
    {
        _1157 = _897;
    }
    float _1159 = _1157;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_1015)
    {
        _979 = _897;
    }
    float _1163 = _979;
    float _1165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (!_1015)
    {
        _981 = _901;
    }
    float _1167 = _981;
    float _1169 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1161);
    float _1171 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1173 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1175 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[83].w, _927);
    float _1177 = fma(_1171, -2.0, _921);
    float _1179 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1181 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1169);
    float _1183 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1185 = fma(_1179, _1139, -0.5);
    float _1187 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1189 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1191 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1193 = fma(_1173, _1109, -0.5);
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1197 = fma(_1191, _1147, -0.5);
    float _1199 = fma(_1181, _1193, _1011);
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1205 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1119);
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1213 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1215 = _1201 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1217 = _1203 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1219 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1221 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1223 = fma(_1187, -2.0, _1209);
    out.m_67.x = _1213;
    out.m_67.y = _1215;
    out.m_67.z = _1189;
    float _1225 = fma(_1205, _1185, _1143);
    float _1227 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1175);
    float _1229 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1177);
    out.m_69.x = _1217;
    out.m_69.y = _1219;
    out.m_69.z = _1221;
    float _1231 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1223);
    bool _1233 = _568 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1235 = isnan(_568);
    bool _1237 = _1233 || _1235;
    bool _1239 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1241 = _1237 || _1239;
    float _1243 = -_1229;
    float _1245 = fma(_1227, _1079, _1243);
    float _1247 = in.m_71.x;
    float _1249 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1133);
    float _1251 = in.m_71.y;
    float _1253 = _1199 + 0.5;
    float _1255 = _1225 + 0.5;
    float _1257 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1099);
    float _1259 = _758 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1261 = fma(_1249, _1197, _1153);
    float _1263 = _1087 + 0.5;
    float _1265 = _1245 + 0.5;
    float _1267 = -_1231;
    float _1269 = fma(_1257, _1117, _1267);
    float _1271 = _808 * 0.5;
    float _1273 = exp2(_1259);
    float _1275 = _1261 + 0.5;
    out.m_73.x = _1253;
    out.m_73.y = _1263;
    out.m_73.z = _1255;
    out.m_73.w = _1265;
    float _1277 = fma(_848, -0.5, _1271);
    float _1279 = _1269 + 0.5;
    out.gl_Position.x = _846;
    out.gl_Position.y = _848;
    out.gl_Position.z = _991;
    out.gl_Position.w = _808;
    if (!_1241)
    {
        _600 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1281 = _600;
    float _1283 = _1281;
    float _1285 = _1281;
    if (!_1241)
    {
        _602 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1287 = _602;
    out.m_75.x = _1247;
    float _1289 = _1287;
    float _1291 = _1287;
    if (!_1241)
    {
        _604 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1293 = _604;
    out.m_75.y = _1251;
    float _1295 = -_1273;
    float _1297 = _1295 + 1.0;
    out.m_77.x = _1275;
    out.m_77.y = _1279;
    float _1299 = _1297 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1301 = _1297;
    float _1303 = _1293;
    float _1305 = _1293;
    if (!_1241)
    {
        _983 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1307 = _983;
    out.m_79.x = _961;
    out.m_79.y = _1277;
    out.m_79.z = _1055;
    out.m_79.w = _808;
    float _1309 = _1307;
    float _1311 = _1307;
    if (!_1241)
    {
        _985 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1313 = _985;
    float _1315 = _1313;
    float _1317 = _1313;
    if (!_1241)
    {
        _1301 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1319 = _1301;
    float _1321 = _1299 * _862;
    float _1323 = -_1299;
    float _1325 = _1323 + 1.0;
    float _1327 = _877 * _1321;
    float _1329 = _877 * _1325;
    float _1331 = _887 * _1321;
    float _1333 = fma(_883, _1327, _871);
    float _1335 = fma(_885, _1327, _873);
    float _1337 = fma(_877, _1331, _875);
    out.m_81.x = _1333;
    out.m_81.y = _1335;
    out.m_81.z = _1337;
    out.m_81.w = _1329;
    bool _1339 = !_1241;
    float _1341 = _1319;
    float _1343 = _1319;
    if (!_1339)
    {
        bool _1345 = _568 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1347 = isnan(_568);
        bool _1349 = _1345 || _1347;
        bool _1351 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1353 = _1349 || _1351;
        if (!_1353)
        {
            float _1355 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1357 = _568 + _1355;
            float _1359 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1361 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1359;
            float _1363 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1365 = _1363 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1367 = 1.0 / _1361;
            float _1369 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1371 = _1369 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1373 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1375 = _1373 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1377 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1379 = _1377 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1381 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1383 = _1381 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1385 = _1357 * _1367;
            float _1387 = precise::clamp(_1385, 0.0, 1.0);
            float _1389 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1391 = _1389 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1393 = fma(_1387, _1365, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1395 = fma(_1387, _1391, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1397 = fma(_1387, _1371, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1399 = fma(_1387, _1375, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1401 = fma(_1387, _1379, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1403 = fma(_1387, _1383, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1317 = _1397;
            _1291 = _1401;
            _1311 = _1393;
            _1285 = _1399;
            _1343 = _1395;
            _1305 = _1403;
            _1405 = true;
        }
        else
        {
            bool _1407 = _568 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1409 = isnan(_568);
            bool _1411 = _1407 || _1409;
            bool _1413 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1415 = _1411 || _1413;
            if (!_1415)
            {
                _1309 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1417 = _1309;
            _1311 = _1417;
            if (!_1415)
            {
                _1315 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1419 = _1315;
            _1317 = _1419;
            if (!_1415)
            {
                _1341 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1421 = _1341;
            _1343 = _1421;
            if (!_1415)
            {
                _1283 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1423 = _1283;
            _1285 = _1423;
            if (!_1415)
            {
                _1289 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1425 = _1289;
            _1291 = _1425;
            if (!_1415)
            {
                _1303 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1427 = _1303;
            bool _1429 = !_1415;
            _1305 = _1427;
            if (!_1429)
            {
                bool _1431 = _568 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1433 = isnan(_568);
                bool _1435 = _1431 || _1433;
                bool _1437 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1439 = _1435 || _1437;
                if (!_1439)
                {
                    float _1441 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1443 = _568 + _1441;
                    float _1445 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1447 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1445;
                    float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1451 = _1449 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1453 = 1.0 / _1447;
                    float _1455 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1457 = _1455 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1459 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1461 = _1459 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1463 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1465 = _1463 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1467 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1469 = _1467 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1471 = _1443 * _1453;
                    float _1473 = precise::clamp(_1471, 0.0, 1.0);
                    float _1475 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1477 = _1475 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1479 = fma(_1473, _1451, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1481 = fma(_1473, _1477, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1483 = fma(_1473, _1457, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1485 = fma(_1473, _1461, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1487 = fma(_1473, _1465, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1489 = fma(_1473, _1469, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1317 = _1483;
                    _1291 = _1487;
                    _1311 = _1479;
                    _1285 = _1485;
                    _1343 = _1481;
                    _1305 = _1489;
                    _1405 = true;
                }
                else
                {
                    _1317 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1291 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1311 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1285 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1343 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1305 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1405 = false;
    float _1491 = _1317;
    float _1493 = _1291;
    float _1495 = _1311;
    float _1497 = _1285;
    float _1499 = _1343;
    float _1501 = _1305;
    float _1503 = fma(_484, -0.5, 0.5);
    float _1505 = precise::clamp(_1503, 0.0, 1.0);
    float _1507 = -_1491;
    float _1509 = _1507 + _1493;
    float _1511 = -_1495;
    float _1513 = _1511 + _1497;
    float _1515 = -_1499;
    float _1517 = _1515 + _1501;
    bool _1519 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1521 = fma(_1505, _1509, _1491);
    float _1523 = fma(_1505, _1513, _1495);
    float _1525 = fma(_1505, _1517, _1499);
    float _1527 = _1521 * 0.586610972881317138671875;
    out.m_83.x = 0.0;
    float _1529 = fma(_1523, 0.298911988735198974609375, _1527);
    float _1531 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1533 = fma(_1525, 0.114477999508380889892578125, _1529);
    out.m_47.x = _1531;
    float _1535 = -_1533;
    float _1537 = _1523 + _1535;
    float _1539 = -_1533;
    float _1541 = _1521 + _1539;
    float _1543 = -_1533;
    float _1545 = _1525 + _1543;
    float _1547 = fma(_1537, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1533);
    float _1549 = fma(_1541, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1533);
    float _1551 = fma(_1545, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1533);
    out.m_85.x = _1547;
    out.m_85.y = _1549;
    out.m_85.z = _1551;
    if (!_1519)
    {
        return out;
    }
    float _1553 = -_542;
    float _1555 = _1553 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1557 = -_544;
    float _1559 = _1557 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1561 = -_546;
    float _1563 = _1561 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1565 = _1555 * _1555;
    float _1567 = fma(_1559, _1559, _1565);
    float _1569 = fma(_1563, _1563, _1567);
    float _1571 = sqrt(_1569);
    float _1573 = rsqrt(_1569);
    float _1575 = -_1571;
    float _1577 = _1575 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1579 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1581 = precise::clamp(_1579, 0.0, 1.0);
    float _1583 = _1559 * _1573;
    float _1585 = _1555 * _1573;
    float _1587 = abs(_1581);
    float _1589 = log2(_1587);
    float _1591 = _1563 * _1573;
    float _1593 = _1583 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1595 = _484 * _1585;
    float _1597 = -_1585;
    float _1599 = -_1593;
    float _1601 = fma(_1597, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1599);
    float _1603 = fma(_448, _1583, _1595);
    float _1605 = -_1591;
    float _1607 = fma(_1605, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1601);
    float _1609 = fma(_446, _1591, _1603);
    float _1611 = precise::clamp(_1609, 0.0, 1.0);
    float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1615 = _1607 + _1613;
    float _1617 = _1589 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1619 = _1615 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1621 = precise::clamp(_1619, 0.0, 1.0);
    float _1623 = exp2(_1617);
    float _1625 = _1623 * _1621;
    float _1627 = _1611 * _1625;
    float _1629 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1631 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1633 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_83.x = _1629;
    out.m_83.y = _1631;
    out.m_83.z = _1633;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1405 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_104);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1691 = as_type<float>(_120);
        out.gl_Position.z = _1691;
    }
    if (!_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_134)
    {
        float _140 = float(_104);
        _112 = _140;
    }
    float _142 = _112;
    bool _144 = _138 >= _142;
    bool _146 = !_134;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_47.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _122 = as_type<int>(_154);
    }
    int _156 = _122;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1760 = as_type<float>(_156);
        out.gl_Position.z = _1760;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _158 = in.m_51.x;
    float _160 = in.m_51.y;
    float _162 = in.m_51.z;
    float _164 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _166 = in.m_53.x;
    float _168 = in.m_53.y;
    float _170 = in.m_53.z;
    bool _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _174 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _176 = _172 || _174;
    bool _178 = isnan(1.0);
    bool _180 = _176 || _178;
    float _182 = in.m_51.w;
    float _184 = in.m_49.x;
    float _186 = in.m_49.y;
    float _188 = in.m_49.z;
    float _190 = in.m_44.x;
    float _192 = in.m_44.y;
    float _194 = in.m_44.z;
    float _196 = _158 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _198 = _160 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _200 = _162 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _202 = _196 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _204 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _166);
    float _206 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _168);
    float _208 = _198 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _210 = _196;
    float _212 = _164;
    if (!_180)
    {
        float _214 = _164 * _164;
        float _216 = _214 * 0.5;
        _210 = _216;
    }
    float _218 = _210;
    float _220 = _202 * _204;
    float _222 = _208 * _206;
    float _224 = _218;
    if (!_180)
    {
        float _226 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _224 = _226;
    }
    float _228 = _224;
    bool _230 = !_180;
    float _232 = _228;
    if (!_230)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = _164 * _236;
        float _246 = 1.0 / _240;
        float _248 = _242 * 0.693147182464599609375;
        float _250 = exp2(_244);
        float _252 = 1.0 / _248;
        float _254 = _250 + (-1.0);
        float _256 = -_254;
        float _258 = fma(_256, _252, _164);
        float _260 = _258 * _246;
        float _262 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _232 = _262;
    }
    float _264 = _232;
    bool _266 = !_180;
    if (!_266)
    {
        float _268 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _270 = log2(_268);
        float _272 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _274 = _272 + 1.0;
        float _276 = 1.0 / _274;
        float _278 = _164 * _270;
        float _280 = exp2(_278);
        float _282 = -_280;
        float _284 = _282 + 1.0;
        float _286 = _284 * _276;
        _212 = _286;
    }
    float _288 = _212;
    float _290 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _292 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _294 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _296 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _170);
    float _298 = fma(_288, _186, _290);
    float _300 = fma(_288, _184, _292);
    float _302 = _222 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _304 = fma(_288, _188, _294);
    float _306 = fma(_298, _182, _192);
    float _308 = fma(_300, _182, _190);
    float _310 = _222 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _312 = fma(_220, (*spvDescriptorSet0.vp_c10)._m0[8].x, _302);
    float _314 = _306 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _316 = _200 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _318 = fma(_304, _182, _194);
    float _320 = _306 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _322 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[5].x, _314);
    float _324 = fma(_220, (*spvDescriptorSet0.vp_c10)._m0[9].x, _310);
    float _326 = _316 * _296;
    float _328 = _306 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _330 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[4].x, _320);
    float _332 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[5].z, _322);
    float _334 = _222 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _336 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[6].x, _328);
    float _338 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[9].z, _324);
    float _340 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[4].z, _330);
    float _342 = _332 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _344 = fma(_220, (*spvDescriptorSet0.vp_c10)._m0[10].x, _334);
    float _346 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[6].z, _336);
    float _348 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[8].z, _312);
    float _350 = _340 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _352 = _342 + _338;
    float _354 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[10].z, _344);
    float _356 = _346 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _358 = _350 + _348;
    float _360 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _362 = _352 + _360;
    bool _364 = _168 != 0.0;
    bool _366 = isnan(_168);
    bool _368 = _364 || _366;
    bool _370 = isnan(0.0);
    bool _372 = _368 || _370;
    float _374 = _356 + _354;
    float _376 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _378 = _358 + _376;
    float _380 = _362 * _362;
    bool _382 = _166 == 0.0;
    bool _384 = !_372;
    bool _386 = _382 && _384;
    float _388 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _390 = _374 + _388;
    float _392 = fma(_378, _378, _380);
    bool _394 = _170 == 0.0;
    bool _396 = _394 && _386;
    float _398 = in.m_55.x;
    float _400 = in.m_55.y;
    float _402 = in.m_55.z;
    float _404 = fma(_390, _390, _392);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[191].z + _406;
    float _410 = 1.0 / _408;
    float _412 = sqrt(_404);
    float _414 = _400;
    float _416 = _398;
    float _418 = _402;
    if (!_396)
    {
        float _420 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[17].y, _400);
        _414 = _420;
    }
    float _422 = _414;
    if (!_396)
    {
        float _424 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[17].y, _398);
        _416 = _424;
    }
    float _426 = _416;
    if (!_396)
    {
        float _428 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[17].y, _402);
        _418 = _428;
    }
    float _430 = _418;
    float _432 = _422 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _434 = _422 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _436 = _422 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _438 = precise::max(_412, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _440 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[10].x, _432);
    float _442 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[8].x, _434);
    float _444 = precise::min(_438, (*spvDescriptorSet0.vp_c9)._m0[191].z);
    float _446 = fma(_430, (*spvDescriptorSet0.vp_c10)._m0[10].z, _440);
    float _448 = fma(_430, (*spvDescriptorSet0.vp_c10)._m0[8].z, _442);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _452 = _444 + _450;
    float _454 = -_452;
    float _456 = fma(_454, _410, 1.0);
    float _458 = _456 * (*spvDescriptorSet0.vp_c9)._m0[191].w;
    float _460 = -_446;
    float _462 = fma(_460, _458, _374);
    float _464 = -_448;
    float _466 = fma(_464, _458, _358);
    float _468 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _470 = _462 + _468;
    float _472 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _474 = _466 + _472;
    float _476 = _470 * _470;
    float _478 = fma(_474, _474, _476);
    float _480 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[9].x, _436);
    float _482 = sqrt(_478);
    float _484 = fma(_430, (*spvDescriptorSet0.vp_c10)._m0[9].z, _480);
    float _486 = -_484;
    float _488 = fma(_486, _458, _352);
    bool _490 = _482 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _492 = 0.0;
    float _494 = _466;
    float _496 = _462;
    float _498 = _478;
    if (!_490)
    {
        _492 = _488;
    }
    float _500 = _492;
    bool _502 = !_490;
    float _504 = _500;
    if (!_502)
    {
        float _506 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _508 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _510 = _482 + _508;
        float _512 = _488 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _514 = rsqrt(_478);
        float _516 = _510 * _506;
        float _518 = _516 * 0.15915493667125701904296875;
        float _520 = _518 * 6.283185482025146484375;
        float _522 = cos(_520);
        float _524 = _518 * 6.283185482025146484375;
        float _526 = sin(_524);
        float _528 = _522 + (-1.0);
        float _530 = fma(_526, _512, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _532 = _528 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _534 = _514 * _530;
        float _536 = fma(_488, _522, _532);
        float _538 = fma(_474, _534, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _540 = fma(_470, _534, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _504 = _536;
        _494 = _538;
        _496 = _540;
    }
    float _542 = _504;
    float _544 = _494;
    float _546 = _496;
    float _548 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _550 = _542 + _548;
    float _552 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _554 = _544 + _552;
    float _556 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _558 = _546 + _556;
    float _560 = _550 * _550;
    float _562 = fma(_554, _554, _560);
    float _564 = fma(_558, _558, _562);
    float _566 = rsqrt(_564);
    float _568 = sqrt(_564);
    float _570 = _566 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _572 = _554 * _570;
    float _574 = _558 * _570;
    float _576 = _572 * _572;
    float _578 = _574 * _574;
    float _580 = _576 + _578;
    float _582 = sqrt(_580);
    bool _584 = _582 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _586 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _588 = _582 + _586;
    float _590 = _562;
    float _592 = _580;
    float _594 = _588;
    float _596 = _570;
    float _598 = _572;
    float _600 = _558;
    float _602 = _550;
    float _604 = _554;
    if (_584)
    {
        float _606 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _590 = _606;
    }
    float _608 = _590;
    if (_584)
    {
        float _610 = rsqrt(_580);
        _592 = _610;
    }
    float _612 = _592;
    float _614 = _612;
    if (_584)
    {
        float _616 = _588 * _608;
        _594 = _616;
    }
    float _618 = _594;
    if (_584)
    {
        float _620 = _618 * 0.15915493667125701904296875;
        _498 = _620;
    }
    float _622 = _498;
    float _624 = _608;
    float _626 = _622;
    if (_584)
    {
        float _628 = _622 * 6.283185482025146484375;
        float _630 = sin(_628);
        _624 = _630;
    }
    float _632 = _624;
    float _634 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _636 = precise::max(0.0, _634);
    float _638 = _488;
    float _640 = _636;
    if (_584)
    {
        float _642 = _622 * 6.283185482025146484375;
        float _644 = cos(_642);
        _638 = _644;
    }
    float _646 = _638;
    float _648 = -_570;
    float _650 = -_636;
    float _652 = fma(_550, _648, _650);
    if (_584)
    {
        float _654 = _652 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _640 = _654;
    }
    float _656 = _640;
    float _658 = _632;
    float _660 = _656;
    if (_584)
    {
        float _662 = fma(_632, _656, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _658 = _662;
    }
    float _664 = _658;
    float _666 = _664;
    float _668 = _646;
    if (_584)
    {
        float _670 = _646 + (-1.0);
        _660 = _670;
    }
    float _672 = _660;
    float _674 = _672;
    if (_584)
    {
        float _676 = _612 * _664;
        _596 = _676;
    }
    float _678 = _596;
    if (!_584)
    {
        _666 = _652;
    }
    float _680 = _666;
    float _682 = _680;
    if (_584)
    {
        float _684 = _672 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _626 = _684;
    }
    float _686 = _626;
    if (_584)
    {
        float _688 = _572 * _678;
        _598 = _688;
    }
    float _690 = _598;
    if (!_584)
    {
        _674 = _574;
    }
    float _692 = _674;
    float _694 = _692;
    if (_584)
    {
        float _696 = _574 * _678;
        _694 = _696;
    }
    float _698 = _694;
    if (!_584)
    {
        _614 = _576;
    }
    float _700 = _614;
    float _702 = _700;
    if (_584)
    {
        float _704 = fma(_652, _646, _686);
        _682 = _704;
    }
    float _706 = _682;
    if (_584)
    {
        float _708 = _690 * _690;
        _702 = _708;
    }
    float _710 = _702;
    if (!_584)
    {
        _668 = _578;
    }
    float _712 = _668;
    float _714 = _712;
    if (_584)
    {
        float _716 = _698 * _698;
        _714 = _716;
    }
    float _718 = _714;
    float _720 = fma(_706, _706, _710);
    float _722 = _542 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _724 = _542 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _726 = _720 + _718;
    float _728 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _730 = fma(_568, (*spvDescriptorSet0.vp_c15)._m0[23].w, _728);
    float _732 = precise::clamp(_730, 0.0, 1.0);
    float _734 = fma(_544, (*spvDescriptorSet0.vp_c8)._m0[2].x, _722);
    float _736 = _542 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _738 = rsqrt(_726);
    float _740 = -_732;
    float _742 = _740 + 1.0;
    float _744 = fma(_546, (*spvDescriptorSet0.vp_c8)._m0[2].z, _734);
    float _746 = _542 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _748 = fma(_544, (*spvDescriptorSet0.vp_c8)._m0[1].x, _736);
    float _750 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _752 = _744 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _754 = fma(_544, (*spvDescriptorSet0.vp_c8)._m0[0].x, _746);
    float _756 = abs(_742);
    float _758 = log2(_756);
    float _760 = fma(_546, (*spvDescriptorSet0.vp_c8)._m0[1].z, _748);
    float _762 = _752 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _764 = fma(_546, (*spvDescriptorSet0.vp_c8)._m0[0].z, _754);
    float _766 = fma(_544, (*spvDescriptorSet0.vp_c8)._m0[3].x, _724);
    float _768 = _760 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _770 = -_762;
    float _772 = fma(_770, _750, 1.0);
    float _774 = _764 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _776 = _738 * _690;
    float _778 = _768 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _780 = _738 * _706;
    float _782 = fma(_546, (*spvDescriptorSet0.vp_c8)._m0[3].z, _766);
    float _784 = _776 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _786 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[7].x, _778);
    float _788 = _738 * _698;
    float _790 = _782 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _792 = -_784;
    float _794 = fma(_780, (*spvDescriptorSet0.vp_c15)._m0[21].y, _792);
    float _796 = _758 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _798 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[7].z, _786);
    float _800 = log2(_772);
    float _802 = -_788;
    float _804 = fma(_802, (*spvDescriptorSet0.vp_c15)._m0[21].z, _794);
    float _806 = _768 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _808 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[7].w, _798);
    float _810 = _768 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _812 = fma(_804, -0.5, 0.5);
    float _814 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[4].x, _806);
    float _816 = fma(_804, 0.5, 0.5);
    float _818 = exp2(_796);
    float _820 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[5].x, _810);
    float _822 = _780 + 1.0;
    float _824 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[4].z, _814);
    float _826 = fma(_816, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _828 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[5].z, _820);
    float _830 = 1.0 / _808;
    float _832 = fma(_816, _826, -0.212114393711090087890625);
    float _834 = _800 * 0.693147182464599609375;
    float _836 = fma(_816, _832, 1.570728778839111328125);
    float _838 = _834 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _840 = sqrt(_812);
    float _842 = -_780;
    float _844 = fma(_818, _822, _842);
    float _846 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[4].w, _824);
    float _848 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[5].w, _828);
    float _850 = fma(_844, 0.5, 0.5);
    float _852 = _846 * _830;
    float _854 = _848 * _830;
    float _856 = fma(_852, 0.5, 0.5);
    float _858 = fma(_854, -0.5, 0.5);
    float _860 = _840 * 0.636619746685028076171875;
    float3 _2925 = float3(_856, _858, _838);
    float _862 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2925, float3(0.0), isnan(_2925)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2925, float3(0.0), isnan(_2925)), level(0.0)).x;
    float _864 = -_836;
    float _866 = fma(_860, _864, 1.0);
    float3 _2941 = float3(_856, _858, _838);
    float4 _869 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2941, float3(0.0), isnan(_2941)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2941, float3(0.0), isnan(_2941)), level(0.0)).xyzw;
    float _871 = _869.x;
    float _873 = _869.y;
    float _875 = _869.z;
    float _877 = _869.w;
    float2 _2958 = float2(_866, _850);
    float3 _881 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2958, float2(0.0), isnan(_2958)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2958, float2(0.0), isnan(_2958)), level(0.0)).xyz;
    float _883 = _881.x;
    float _885 = _881.y;
    float _887 = _881.z;
    float _889 = in.m_57.w;
    float _891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _893 = in.m_59.y;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _897 = in.m_57.y;
    float _899 = _768 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _901 = in.m_57.x;
    float _903 = in.m_59.x;
    float _905 = in.m_57.z;
    float _907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _911 = _889 > 0.5;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _917 = -_893;
    float _919 = _917 + 1.0;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _925 = _923 != 0;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _929 = _897 > 0.5;
    float _931 = _897 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _935 = _933 != 0;
    float _937 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[6].x, _899);
    float _939 = _929 ? _919 : _893;
    out.m_61.x = _412;
    int _941 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _943 = _941 != 0;
    float _945 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[6].z, _937);
    float _947 = _935 ? _939 : _893;
    float _949 = _846 + _808;
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _953 = _951 != 0;
    float _955 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[6].w, _945);
    int _957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _959 = _957 != 0;
    float _961 = _949 * 0.5;
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _965 = _963 != 0;
    float _967 = _901 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _969 = _939;
    float _971 = _967;
    float _973 = _893;
    bool _975 = _965;
    float _977 = _909;
    float _979 = _905;
    float _981 = _897;
    float _983 = _848;
    float _985 = _846;
    if (!_925)
    {
        _969 = _903;
    }
    float _987 = _969;
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _991 = _955 + _989;
    int _993 = _911 ? as_type<int>(_919) : as_type<int>(_893);
    float _995 = -_895;
    float _997 = fma(_967, 2.0, _995);
    float _999 = _987;
    if (!_925)
    {
        _971 = _987;
    }
    float _1001 = _971;
    float _1003 = _808 + _991;
    float _1005 = _1001;
    if (_925)
    {
        _999 = _903;
    }
    float _1007 = _999;
    float _1009 = -_138;
    float _1011 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[76].x, _997);
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1015 = _1013 != 0;
    float _1017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1019 = fma(_931, -2.0, _915);
    float _1021 = _907 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1023 = _959 ? as_type<float>(_993) : _893;
    int _1025 = 0;
    float _1027 = _1007;
    if (_943)
    {
        float _1029 = -_1007;
        float _1031 = _1029 + 1.0;
        _1025 = as_type<int>(_1031);
    }
    int _1033 = _1025;
    bool _1035 = _905 > 0.5;
    float _1037 = fma(_1021, _947, -0.5);
    int _1039 = 0;
    int _1041 = as_type<int>(_1037);
    float _1043 = as_type<float>(_1033);
    if (_953)
    {
        float _1045 = -_1007;
        float _1047 = _1045 + 1.0;
        _1039 = as_type<int>(_1047);
    }
    int _1049 = _1039;
    if (_965)
    {
        float _1051 = _1035 ? _919 : _893;
        _973 = _1051;
    }
    float _1053 = _973;
    float _1055 = _1003 * 0.5;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1059 = _1057;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    if (_925)
    {
        bool _1063 = _901 > 0.5;
        _975 = _1063;
    }
    bool _1065 = _975;
    out.m_63.x = _448;
    out.m_63.y = _484;
    out.m_63.z = _446;
    float _1067 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1057);
    float _1069 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1071 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1019);
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1075 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1067);
    if (_1015)
    {
        _1059 = _901;
    }
    float _1077 = _1059;
    float _1079 = fma(_1023, _1069, -0.5);
    float _1081 = _1077;
    if (!_1015)
    {
        _1061 = _897;
    }
    float _1083 = _1061;
    float _1085 = -_1071;
    float _1087 = fma(_1075, _1037, _1085);
    float _1089 = _1083;
    if (!_1015)
    {
        _1081 = _905;
    }
    float _1091 = _1081;
    if (_925)
    {
        float _1093 = -_1007;
        float _1095 = _1093 + 1.0;
        _1041 = as_type<int>(_1095);
    }
    int _1097 = _1041;
    float _1099 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1073);
    if (_1015)
    {
        _1089 = _901;
    }
    float _1101 = _1089;
    float _1103 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1105 = _891 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_925)
    {
        float _1107 = _1065 ? as_type<float>(_1097) : _1007;
        _1005 = _1107;
    }
    float _1109 = _1005;
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1113 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1117 = fma(_1105, _1053, -0.5);
    float _1119 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1111);
    float _1121 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1123 = -_1115;
    float _1125 = fma(_1113, 2.0, _1123);
    float _1127 = -_909;
    float _1129 = fma(_1103, 2.0, _1127);
    if (!_943)
    {
        _977 = _1007;
    }
    float _1131 = _977;
    float _1133 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[88].z, _913);
    float _1135 = _1131;
    if (_943)
    {
        float _1137 = _1035 ? as_type<float>(_1033) : _1007;
        _1135 = _1137;
    }
    float _1139 = _1135;
    float _1141 = -_138;
    float _1143 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1125);
    if (_953)
    {
        float _1145 = _929 ? as_type<float>(_1049) : _1007;
        _1027 = _1145;
    }
    float _1147 = _1027;
    float _1149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1151 = -_138;
    float _1153 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1129);
    if (!_1015)
    {
        _1043 = _905;
    }
    float _1155 = _1043;
    out.m_65.x = _554;
    out.m_65.y = _550;
    out.m_65.z = _558;
    float _1157 = _1155;
    if (_1015)
    {
        _1157 = _897;
    }
    float _1159 = _1157;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_1015)
    {
        _979 = _897;
    }
    float _1163 = _979;
    float _1165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (!_1015)
    {
        _981 = _901;
    }
    float _1167 = _981;
    float _1169 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1161);
    float _1171 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1173 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1175 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[83].w, _927);
    float _1177 = fma(_1171, -2.0, _921);
    float _1179 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1181 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1169);
    float _1183 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1185 = fma(_1179, _1139, -0.5);
    float _1187 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1189 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1191 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1193 = fma(_1173, _1109, -0.5);
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1197 = fma(_1191, _1147, -0.5);
    float _1199 = fma(_1181, _1193, _1011);
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1205 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1119);
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1213 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1215 = _1201 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1217 = _1203 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1219 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1221 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1223 = fma(_1187, -2.0, _1209);
    out.m_67.x = _1213;
    out.m_67.y = _1215;
    out.m_67.z = _1189;
    float _1225 = fma(_1205, _1185, _1143);
    float _1227 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1175);
    float _1229 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1177);
    out.m_69.x = _1217;
    out.m_69.y = _1219;
    out.m_69.z = _1221;
    float _1231 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1223);
    bool _1233 = _568 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1235 = isnan(_568);
    bool _1237 = _1233 || _1235;
    bool _1239 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1241 = _1237 || _1239;
    float _1243 = -_1229;
    float _1245 = fma(_1227, _1079, _1243);
    float _1247 = in.m_71.x;
    float _1249 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1133);
    float _1251 = in.m_71.y;
    float _1253 = _1199 + 0.5;
    float _1255 = _1225 + 0.5;
    float _1257 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1099);
    float _1259 = _758 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1261 = fma(_1249, _1197, _1153);
    float _1263 = _1087 + 0.5;
    float _1265 = _1245 + 0.5;
    float _1267 = -_1231;
    float _1269 = fma(_1257, _1117, _1267);
    float _1271 = _808 * 0.5;
    float _1273 = exp2(_1259);
    float _1275 = _1261 + 0.5;
    out.m_73.x = _1253;
    out.m_73.y = _1263;
    out.m_73.z = _1255;
    out.m_73.w = _1265;
    float _1277 = fma(_848, -0.5, _1271);
    float _1279 = _1269 + 0.5;
    out.gl_Position.x = _846;
    out.gl_Position.y = _848;
    out.gl_Position.z = _991;
    out.gl_Position.w = _808;
    if (!_1241)
    {
        _600 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1281 = _600;
    float _1283 = _1281;
    float _1285 = _1281;
    if (!_1241)
    {
        _602 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1287 = _602;
    out.m_75.x = _1247;
    float _1289 = _1287;
    float _1291 = _1287;
    if (!_1241)
    {
        _604 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1293 = _604;
    out.m_75.y = _1251;
    float _1295 = -_1273;
    float _1297 = _1295 + 1.0;
    out.m_77.x = _1275;
    out.m_77.y = _1279;
    float _1299 = _1297 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1301 = _1297;
    float _1303 = _1293;
    float _1305 = _1293;
    if (!_1241)
    {
        _983 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1307 = _983;
    out.m_79.x = _961;
    out.m_79.y = _1277;
    out.m_79.z = _1055;
    out.m_79.w = _808;
    float _1309 = _1307;
    float _1311 = _1307;
    if (!_1241)
    {
        _985 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1313 = _985;
    float _1315 = _1313;
    float _1317 = _1313;
    if (!_1241)
    {
        _1301 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1319 = _1301;
    float _1321 = _1299 * _862;
    float _1323 = -_1299;
    float _1325 = _1323 + 1.0;
    float _1327 = _877 * _1321;
    float _1329 = _877 * _1325;
    float _1331 = _887 * _1321;
    float _1333 = fma(_883, _1327, _871);
    float _1335 = fma(_885, _1327, _873);
    float _1337 = fma(_877, _1331, _875);
    out.m_81.x = _1333;
    out.m_81.y = _1335;
    out.m_81.z = _1337;
    out.m_81.w = _1329;
    bool _1339 = !_1241;
    float _1341 = _1319;
    float _1343 = _1319;
    if (!_1339)
    {
        bool _1345 = _568 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1347 = isnan(_568);
        bool _1349 = _1345 || _1347;
        bool _1351 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1353 = _1349 || _1351;
        if (!_1353)
        {
            float _1355 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1357 = _568 + _1355;
            float _1359 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1361 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1359;
            float _1363 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1365 = _1363 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1367 = 1.0 / _1361;
            float _1369 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1371 = _1369 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1373 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1375 = _1373 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1377 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1379 = _1377 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1381 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1383 = _1381 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1385 = _1357 * _1367;
            float _1387 = precise::clamp(_1385, 0.0, 1.0);
            float _1389 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1391 = _1389 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1393 = fma(_1387, _1365, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1395 = fma(_1387, _1391, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1397 = fma(_1387, _1371, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1399 = fma(_1387, _1375, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1401 = fma(_1387, _1379, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1403 = fma(_1387, _1383, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1317 = _1397;
            _1291 = _1401;
            _1311 = _1393;
            _1285 = _1399;
            _1343 = _1395;
            _1305 = _1403;
            _1405 = true;
        }
        else
        {
            bool _1407 = _568 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1409 = isnan(_568);
            bool _1411 = _1407 || _1409;
            bool _1413 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1415 = _1411 || _1413;
            if (!_1415)
            {
                _1309 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1417 = _1309;
            _1311 = _1417;
            if (!_1415)
            {
                _1315 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1419 = _1315;
            _1317 = _1419;
            if (!_1415)
            {
                _1341 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1421 = _1341;
            _1343 = _1421;
            if (!_1415)
            {
                _1283 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1423 = _1283;
            _1285 = _1423;
            if (!_1415)
            {
                _1289 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1425 = _1289;
            _1291 = _1425;
            if (!_1415)
            {
                _1303 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1427 = _1303;
            bool _1429 = !_1415;
            _1305 = _1427;
            if (!_1429)
            {
                bool _1431 = _568 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1433 = isnan(_568);
                bool _1435 = _1431 || _1433;
                bool _1437 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1439 = _1435 || _1437;
                if (!_1439)
                {
                    float _1441 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1443 = _568 + _1441;
                    float _1445 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1447 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1445;
                    float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1451 = _1449 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1453 = 1.0 / _1447;
                    float _1455 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1457 = _1455 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1459 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1461 = _1459 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1463 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1465 = _1463 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1467 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1469 = _1467 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1471 = _1443 * _1453;
                    float _1473 = precise::clamp(_1471, 0.0, 1.0);
                    float _1475 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1477 = _1475 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1479 = fma(_1473, _1451, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1481 = fma(_1473, _1477, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1483 = fma(_1473, _1457, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1485 = fma(_1473, _1461, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1487 = fma(_1473, _1465, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1489 = fma(_1473, _1469, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1317 = _1483;
                    _1291 = _1487;
                    _1311 = _1479;
                    _1285 = _1485;
                    _1343 = _1481;
                    _1305 = _1489;
                    _1405 = true;
                }
                else
                {
                    _1317 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1291 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1311 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1285 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1343 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1305 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1405 = false;
    float _1491 = _1317;
    float _1493 = _1291;
    float _1495 = _1311;
    float _1497 = _1285;
    float _1499 = _1343;
    float _1501 = _1305;
    float _1503 = fma(_484, -0.5, 0.5);
    float _1505 = precise::clamp(_1503, 0.0, 1.0);
    float _1507 = -_1491;
    float _1509 = _1507 + _1493;
    float _1511 = -_1495;
    float _1513 = _1511 + _1497;
    float _1515 = -_1499;
    float _1517 = _1515 + _1501;
    bool _1519 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1521 = fma(_1505, _1509, _1491);
    float _1523 = fma(_1505, _1513, _1495);
    float _1525 = fma(_1505, _1517, _1499);
    float _1527 = _1521 * 0.586610972881317138671875;
    out.m_83.x = 0.0;
    float _1529 = fma(_1523, 0.298911988735198974609375, _1527);
    float _1531 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1533 = fma(_1525, 0.114477999508380889892578125, _1529);
    out.m_47.x = _1531;
    float _1535 = -_1533;
    float _1537 = _1523 + _1535;
    float _1539 = -_1533;
    float _1541 = _1521 + _1539;
    float _1543 = -_1533;
    float _1545 = _1525 + _1543;
    float _1547 = fma(_1537, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1533);
    float _1549 = fma(_1541, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1533);
    float _1551 = fma(_1545, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1533);
    out.m_85.x = _1547;
    out.m_85.y = _1549;
    out.m_85.z = _1551;
    if (!_1519)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1553 = -_542;
    float _1555 = _1553 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1557 = -_544;
    float _1559 = _1557 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1561 = -_546;
    float _1563 = _1561 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1565 = _1555 * _1555;
    float _1567 = fma(_1559, _1559, _1565);
    float _1569 = fma(_1563, _1563, _1567);
    float _1571 = sqrt(_1569);
    float _1573 = rsqrt(_1569);
    float _1575 = -_1571;
    float _1577 = _1575 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1579 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1581 = precise::clamp(_1579, 0.0, 1.0);
    float _1583 = _1559 * _1573;
    float _1585 = _1555 * _1573;
    float _1587 = abs(_1581);
    float _1589 = log2(_1587);
    float _1591 = _1563 * _1573;
    float _1593 = _1583 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1595 = _484 * _1585;
    float _1597 = -_1585;
    float _1599 = -_1593;
    float _1601 = fma(_1597, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1599);
    float _1603 = fma(_448, _1583, _1595);
    float _1605 = -_1591;
    float _1607 = fma(_1605, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1601);
    float _1609 = fma(_446, _1591, _1603);
    float _1611 = precise::clamp(_1609, 0.0, 1.0);
    float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1615 = _1607 + _1613;
    float _1617 = _1589 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1619 = _1615 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1621 = precise::clamp(_1619, 0.0, 1.0);
    float _1623 = exp2(_1617);
    float _1625 = _1623 * _1621;
    float _1627 = _1611 * _1625;
    float _1629 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1631 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1633 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_83.x = _1629;
    out.m_83.y = _1631;
    out.m_83.z = _1633;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

