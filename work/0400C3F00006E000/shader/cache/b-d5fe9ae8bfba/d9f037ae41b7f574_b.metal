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
    float4 m_55 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_75 [[user(locn3)]];
    float4 m_85 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 m_65 [[user(locn10)]];
    float4 m_67 [[user(locn11)]];
    float4 m_83 [[user(locn12)]];
    float4 m_81 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_61 [[attribute(5)]];
    float4 m_59 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_51 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1639 = false;
    bool _318 = false;
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
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1938 = as_type<float>(_120);
        out.gl_Position.z = _1938;
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
    float _140 = 0.0;
    float _142 = _138;
    if (_134)
    {
        float _144 = float(_104);
        _140 = _144;
    }
    float _146 = _140;
    bool _148 = _138 >= _146;
    bool _150 = !_134;
    bool _152 = _148 || _150;
    if (_152)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _114;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2007 = as_type<float>(_158);
        out.gl_Position.z = _2007;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = in.m_51.y;
    float _162 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = in.m_53.w;
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _178 = in.m_49.x;
    float _180 = in.m_49.y;
    float _182 = in.m_49.z;
    float _184 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _186 = _176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _188 = in.m_44.x;
    float _190 = in.m_44.y;
    float _192 = in.m_44.z;
    float _194 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _196 = _184 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _198 = 0.0;
    float _200 = _162;
    if (!_172)
    {
        float _202 = _162 * _162;
        float _204 = _202 * 0.5;
        _198 = _204;
    }
    float _206 = _198;
    float _208 = _194 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _210 = _206;
    if (!_172)
    {
        float _212 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _212;
    }
    float _214 = _210;
    bool _216 = !_172;
    float _218 = _214;
    float _220 = _160;
    if (!_216)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = _162 * _224;
        float _234 = 1.0 / _228;
        float _236 = _230 * 0.693147182464599609375;
        float _238 = exp2(_232);
        float _240 = 1.0 / _236;
        float _242 = _238 + (-1.0);
        float _244 = -_242;
        float _246 = fma(_244, _240, _162);
        float _248 = _246 * _234;
        float _250 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _250;
    }
    float _252 = _218;
    bool _254 = !_172;
    if (!_254)
    {
        float _256 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _258 = log2(_256);
        float _260 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _262 = _260 + 1.0;
        float _264 = 1.0 / _262;
        float _266 = _162 * _258;
        float _268 = exp2(_266);
        float _270 = -_268;
        float _272 = _270 + 1.0;
        float _274 = _272 * _264;
        _200 = _274;
    }
    float _276 = _200;
    out.m_55.x = _186;
    out.m_55.y = _196;
    out.m_55.z = _208;
    bool _278 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _280 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _282 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    out.m_57.y = _160;
    float _284 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _286 = fma(_276, _178, _280);
    float _288 = fma(_276, _180, _282);
    float _290 = fma(_276, _182, _284);
    float _292 = fma(_286, _174, _188);
    float _294 = fma(_288, _174, _190);
    float _296 = fma(_290, _174, _192);
    bool _298 = !_278;
    float _316;
    if (!_298)
    {
        float _300 = in.m_59.x;
        float _302 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _304 = _300 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _306 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[11].w, _138);
        float _308 = _306 * _302;
        float _310 = floor(_308);
        float _312 = -_310;
        float _314 = _308 + _312;
        _316 = _314;
        _318 = true;
    }
    else
    {
        float _320 = float(_104);
        float _322 = 1.0 / _320;
        float _324 = _138 * _322;
        _316 = _324;
    }
    _318 = false;
    float _326 = _316;
    float _328 = in.m_61.x;
    float _330 = in.m_61.y;
    float _332 = in.m_61.z;
    float _334 = in.m_63.x;
    float _336 = in.m_63.y;
    float _338 = in.m_63.z;
    float _340 = fma((*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c10)._m0[2].x, _332);
    float _342 = _336 * _336;
    float _344 = _340 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _346 = fma(_334, _334, _342);
    float _348 = _344 * 0.15915493667125701904296875;
    float _350 = fma(_338, _338, _346);
    float _352 = _348 * 6.283185482025146484375;
    float _354 = sin(_352);
    float _356 = in.m_53.x;
    float _358 = in.m_53.y;
    float _360 = in.m_53.z;
    float _362 = rsqrt(_350);
    float _364 = _354 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _366 = -_160;
    float _368 = _366 + 1.0;
    float _370 = _362 * _364;
    float _372 = _356 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _374 = _358 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _376 = _360 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _378 = _368 * _370;
    float _380 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _382 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _384 = _376 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _386 = fma(_334, _378, _328);
    float _388 = fma(_336, _378, _330);
    float _390 = fma(_338, _378, _332);
    float _392 = _294 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _394 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _386);
    float _396 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _390);
    float _398 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[6].x, _392);
    float _400 = _394 * _380;
    float _402 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _388);
    float _404 = _396 * _384;
    float _406 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].z, _398);
    float _408 = _402 * _382;
    float _410 = _294 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _412 = _406 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _414 = _408 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _416 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[4].x, _410);
    float _418 = _408 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _420 = _408 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _422 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[10].x, _414);
    float _424 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].z, _416);
    float _426 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[8].x, _418);
    float _428 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[9].x, _420);
    float _430 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[10].z, _422);
    float _432 = _424 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _434 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[8].z, _426);
    float _436 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[9].z, _428);
    float _438 = _412 + _430;
    float _440 = _432 + _434;
    float _442 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _444 = _438 + _442;
    float _446 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _448 = _440 + _446;
    float _450 = _444 * _444;
    float _452 = fma(_448, _448, _450);
    float _454 = _294 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _456 = sqrt(_452);
    float _458 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[5].x, _454);
    float _460 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].z, _458);
    float _462 = _460 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _464 = _462 + _436;
    bool _466 = _456 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _468 = _460;
    float _470 = _436;
    float _472 = _404;
    float _474 = _444;
    float _476 = _438;
    int _478 = as_type<int>(_462);
    float _480 = _336;
    float _482 = _334;
    float _484 = _338;
    if (!_466)
    {
        _468 = _440;
    }
    float _486 = _468;
    float _488 = _486;
    if (!_466)
    {
        _470 = _438;
    }
    float _490 = _470;
    float _492 = _490;
    if (!_466)
    {
        _472 = _464;
    }
    float _494 = _472;
    bool _496 = !_466;
    float _498 = _494;
    if (!_496)
    {
        float _500 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _502 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _504 = _456 + _502;
        float _506 = _464 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _508 = rsqrt(_452);
        float _510 = _504 * _500;
        float _512 = _510 * 0.15915493667125701904296875;
        float _514 = _512 * 6.283185482025146484375;
        float _516 = cos(_514);
        float _518 = _512 * 6.283185482025146484375;
        float _520 = sin(_518);
        float _522 = _516 + (-1.0);
        float _524 = _522 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _526 = fma(_520, _506, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _528 = fma(_464, _516, _524);
        float _530 = _508 * _526;
        float _532 = fma(_448, _530, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _534 = fma(_444, _530, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _498 = _528;
        _488 = _532;
        _492 = _534;
    }
    float _536 = _498;
    float _538 = _488;
    float _540 = _492;
    float _542 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _544 = _536 + _542;
    float _546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _548 = _538 + _546;
    float _550 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _552 = _540 + _550;
    float _554 = _544 * _544;
    float _556 = fma(_548, _548, _554);
    float _558 = fma(_552, _552, _556);
    float _560 = rsqrt(_558);
    float _562 = _560 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _564 = _548 * _562;
    float _566 = _552 * _562;
    float _568 = _564 * _564;
    float _570 = _566 * _566;
    float _572 = _568 + _570;
    float _574 = sqrt(_572);
    bool _576 = _574 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _578 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _580 = _574 + _578;
    float _582 = _552;
    float _584 = _572;
    float _586 = _580;
    float _588 = _544;
    if (_576)
    {
        float _590 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _582 = _590;
    }
    float _592 = _582;
    if (_576)
    {
        float _594 = rsqrt(_572);
        _584 = _594;
    }
    float _596 = _584;
    float _598 = _596;
    if (_576)
    {
        float _600 = _580 * _592;
        _586 = _600;
    }
    float _602 = _586;
    if (_576)
    {
        float _604 = _602 * 0.15915493667125701904296875;
        _474 = _604;
    }
    float _606 = _474;
    float _608 = _560;
    if (_576)
    {
        float _610 = _606 * 6.283185482025146484375;
        float _612 = sin(_610);
        _608 = _612;
    }
    float _614 = _608;
    float _616 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _618 = precise::max(0.0, _616);
    float _620 = _554;
    float _622 = _618;
    float _624 = _616;
    if (_576)
    {
        float _626 = _606 * 6.283185482025146484375;
        float _628 = cos(_626);
        _620 = _628;
    }
    float _630 = _620;
    float _632 = -_562;
    float _634 = -_618;
    float _636 = fma(_544, _632, _634);
    if (!_576)
    {
        _588 = _566;
    }
    float _638 = _588;
    float _640 = _638;
    if (_576)
    {
        float _642 = _636 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _622 = _642;
    }
    float _644 = _622;
    float _646 = _644;
    float _648 = _614;
    if (_576)
    {
        float _650 = fma(_614, _644, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _646 = _650;
    }
    float _652 = _646;
    float _654 = _652;
    if (!_576)
    {
        _648 = _564;
    }
    float _656 = _648;
    float _658 = _656;
    float _660 = _630;
    if (_576)
    {
        float _662 = _630 + (-1.0);
        _624 = _662;
    }
    float _664 = _624;
    float _666 = 0.0;
    if (_576)
    {
        float _668 = _596 * _652;
        _666 = _668;
    }
    float _670 = _666;
    if (!_576)
    {
        _654 = _636;
    }
    float _672 = _654;
    float _674 = _672;
    if (_576)
    {
        float _676 = _664 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _476 = _676;
    }
    float _678 = _476;
    if (_576)
    {
        float _680 = _564 * _670;
        _658 = _680;
    }
    float _682 = _658;
    float _684 = sqrt(_558);
    if (!_576)
    {
        _598 = _568;
    }
    float _686 = _598;
    float _688 = _686;
    if (_576)
    {
        float _690 = fma(_636, _630, _678);
        _674 = _690;
    }
    float _692 = _674;
    if (_576)
    {
        float _694 = _566 * _670;
        _640 = _694;
    }
    float _696 = _640;
    if (_576)
    {
        float _698 = _682 * _682;
        _688 = _698;
    }
    float _700 = _688;
    if (!_576)
    {
        _660 = _570;
    }
    float _702 = _660;
    float _704 = _702;
    if (_576)
    {
        float _706 = _696 * _696;
        _704 = _706;
    }
    float _708 = _704;
    float _710 = fma(_692, _692, _700);
    float _712 = _536 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _714 = _536 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _716 = _710 + _708;
    float _718 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[2].x, _712);
    float _720 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[1].x, _714);
    float _722 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _724 = fma(_684, (*spvDescriptorSet0.vp_c15)._m0[23].w, _722);
    float _726 = precise::clamp(_724, 0.0, 1.0);
    float _728 = rsqrt(_716);
    float _730 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[2].z, _718);
    float _732 = -_726;
    float _734 = _732 + 1.0;
    float _736 = _536 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _738 = _536 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _740 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[1].z, _720);
    float _742 = _730 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _744 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[0].x, _736);
    float _746 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[3].x, _738);
    float _748 = _740 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _750 = abs(_734);
    float _752 = log2(_750);
    float _754 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[0].z, _744);
    float _756 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[3].z, _746);
    float _758 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _760 = _742 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _762 = _754 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _764 = _728 * _682;
    float _766 = _756 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _768 = _748 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _770 = _728 * _692;
    float _772 = _764 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _774 = _728 * _696;
    float _776 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[7].x, _768);
    float _778 = -_760;
    float _780 = fma(_778, _758, 1.0);
    float _782 = -_772;
    float _784 = fma(_770, (*spvDescriptorSet0.vp_c15)._m0[21].y, _782);
    float _786 = _748 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _788 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[7].z, _776);
    float _790 = log2(_780);
    float _792 = -_774;
    float _794 = fma(_792, (*spvDescriptorSet0.vp_c15)._m0[21].z, _784);
    float _796 = _752 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _798 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[7].w, _788);
    float _800 = _748 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _802 = fma(_794, -0.5, 0.5);
    float _804 = fma(_794, 0.5, 0.5);
    float _806 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[5].x, _786);
    float _808 = 1.0 / _798;
    float _810 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[4].x, _800);
    float _812 = fma(_804, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _814 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[5].z, _806);
    float _816 = _770 + 1.0;
    float _818 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[4].z, _810);
    float _820 = fma(_804, _812, -0.212114393711090087890625);
    float _822 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[5].w, _814);
    float _824 = sqrt(_802);
    float _826 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[4].w, _818);
    float _828 = _790 * 0.693147182464599609375;
    float _830 = fma(_804, _820, 1.570728778839111328125);
    float _832 = _828 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _834 = exp2(_796);
    float _836 = _826 * _808;
    float _838 = _822 * _808;
    float _840 = fma(_838, -0.5, 0.5);
    float _842 = _824 * 0.636619746685028076171875;
    float _844 = fma(_836, 0.5, 0.5);
    float _846 = -_830;
    float _848 = fma(_842, _846, 1.0);
    float _850 = -_770;
    float _852 = fma(_834, _816, _850);
    float3 _3157 = float3(_844, _840, _832);
    float _854 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3157, float3(0.0), isnan(_3157)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3157, float3(0.0), isnan(_3157)), level(0.0)).x;
    float3 _3168 = float3(_844, _840, _832);
    float4 _857 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3168, float3(0.0), isnan(_3168)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3168, float3(0.0), isnan(_3168)), level(0.0)).xyzw;
    float _859 = _857.x;
    float _861 = _857.y;
    float _863 = _857.z;
    float _865 = _857.w;
    float _867 = fma(_852, 0.5, 0.5);
    float2 _3187 = float2(_848, _867);
    float3 _871 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3187, float2(0.0), isnan(_3187)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3187, float2(0.0), isnan(_3187)), level(0.0)).xyz;
    float _873 = _871.x;
    float _875 = _871.y;
    float _877 = _871.z;
    float _879 = in.m_59.w;
    float _881 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _883 = in.m_59.y;
    float _885 = _752 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _887 = in.m_59.x;
    float _889 = in.m_59.z;
    float _891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _895 = _893 != 0;
    float _897 = in.m_51.x;
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _901 = _899 != 0;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _905 = _748 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _909 = _907 != 0;
    float _911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _915 = _913 != 0;
    float _917 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[6].x, _905);
    bool _919 = _879 > 0.5;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _927 = _925 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _929 = _883 > 0.5;
    float _931 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[6].z, _917);
    float _933 = 1.0 / _923;
    float _935 = _891 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _937 = _929 ? as_type<int>(_368) : as_type<int>(_160);
    float _939 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[6].w, _931);
    int _941 = _919 ? as_type<int>(_368) : as_type<int>(_160);
    out.m_65.x = _538;
    out.m_65.y = _536;
    out.m_65.z = _540;
    float _943 = _895 ? as_type<float>(_937) : _160;
    float _945 = 1.0 / _927;
    float _947 = _887 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _951 = _949 != 0;
    int _953 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _955 = _953 != 0;
    float _957 = -_903;
    float _959 = fma(_947, 2.0, _957);
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _961;
    float _965 = _901 ? as_type<float>(_941) : _160;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _973 = _326 + _971;
    float _975 = _963 * _933;
    bool _977 = _889 > 0.5;
    float _979 = _883 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _983 = _981 != 0;
    float _985 = fma(_975, _973, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _987 = _881 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _989 = _969 * _945;
    float _991 = fma(_987, _943, -0.5);
    float _993 = _965;
    bool _995 = _951;
    float _997 = _979;
    float _999 = _897;
    float _1001 = _889;
    float _1003 = _883;
    float _1005 = _798;
    float _1007 = _939;
    float _1009 = _822;
    float _1011 = _826;
    if (_951)
    {
        float _1013 = _977 ? _368 : _160;
        _220 = _1013;
    }
    float _1015 = _220;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1019 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1021 = isnan(_326);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1027 = _1023 || _1025;
    float _1029 = float(_1027);
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1035 = _326 + _1033;
    bool _1037 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1039 = isnan(_326);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1045 = _1041 || _1043;
    float _1047 = float(_1045);
    float _1049 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1017);
    float _1051 = -_1029;
    float _1053 = _1051 + 1.0;
    float _1055 = fma(_979, -2.0, _1031);
    float _1057 = fma(_965, _935, -0.5);
    int _1059 = as_type<int>(_1049);
    if (_955)
    {
        _993 = _887;
    }
    float _1061 = _993;
    float _1063 = fma(_989, _1035, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1065 = _1061;
    if (!_955)
    {
        _1065 = _889;
    }
    float _1067 = _1065;
    float _1069 = _1047 * _1053;
    bool _1071 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1073 = isnan(_326);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1049);
    float _1085 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1055);
    float _1087 = -_1047;
    float _1089 = _1087 + 1.0;
    float _1091 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1093 = _911 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1095 = -_1085;
    float _1097 = fma(_1083, _991, _1095);
    float _1099 = _462 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1101 = _462 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1103 = _1081 * _1089;
    float _1105 = fma(_1093, _1015, -0.5);
    int _1107 = as_type<int>(_1103);
    float _1109 = _1105;
    if (_909)
    {
        float _1111 = -_897;
        float _1113 = _1111 + 1.0;
        _478 = as_type<int>(_1113);
    }
    int _1115 = _478;
    float _1117 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1099);
    float _1119 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1101);
    float _1121 = _985 * _1103;
    if (_909)
    {
        bool _1123 = _887 > 0.5;
        _995 = _1123;
    }
    bool _1125 = _995;
    if (_915)
    {
        float _1127 = -_897;
        float _1129 = _1127 + 1.0;
        _1107 = as_type<int>(_1129);
    }
    int _1131 = _1107;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[83].z;
    float _1135 = as_type<float>(_1131);
    if (_983)
    {
        float _1137 = -_897;
        float _1139 = _1137 + 1.0;
        _1059 = as_type<int>(_1139);
    }
    int _1141 = _1059;
    if (!_909)
    {
        _997 = _897;
    }
    float _1143 = _997;
    float _1145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1147 = _1143;
    if (_909)
    {
        float _1149 = _1125 ? as_type<float>(_1115) : _897;
        _1147 = _1149;
    }
    float _1151 = _1147;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1157 = _1153;
    if (!_915)
    {
        _1133 = _897;
    }
    float _1159 = _1133;
    float _1161 = -_1081;
    float _1163 = _1161 + 1.0;
    float _1165 = _1159;
    if (_915)
    {
        float _1167 = _977 ? as_type<float>(_1131) : _897;
        _1165 = _1167;
    }
    float _1169 = _1165;
    float _1171 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1153);
    float _1173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_983)
    {
        float _1175 = _929 ? as_type<float>(_1141) : _897;
        _999 = _1175;
    }
    float _1177 = _999;
    float _1179 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1121);
    float _1181 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1117);
    float _1183 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1119);
    if (!_955)
    {
        _1157 = _883;
    }
    float _1185 = _1157;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1189 = _1185;
    if (_955)
    {
        _1189 = _887;
    }
    float _1191 = _1189;
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1195 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1187);
    if (!_955)
    {
        _1135 = _889;
    }
    float _1197 = _1135;
    float _1199 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1155);
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1203 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1205 = _1197;
    if (_955)
    {
        _1001 = _883;
    }
    float _1207 = _1001;
    float _1209 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1193);
    if (_955)
    {
        _1205 = _883;
    }
    float _1211 = _1205;
    float _1213 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_955)
    {
        _1003 = _887;
    }
    float _1215 = _1003;
    float _1217 = -_1201;
    float _1219 = fma(_1203, 2.0, _1217);
    float _1221 = _1173 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1225 = fma(_1063, _1069, _1179);
    float _1227 = fma(_1213, _1151, -0.5);
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1231 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1195);
    float _1233 = -_138;
    float _1235 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[76].x, _959);
    float _1237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1239 = fma(_1221, _1169, -0.5);
    float _1241 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1199);
    float _1243 = -_138;
    float _1245 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1219);
    float _1247 = -_1223;
    float _1249 = fma(_1091, 2.0, _1247);
    float _1251 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1253 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1255 = fma(_1231, _1227, _1235);
    float _1257 = fma(_1241, _1239, _1245);
    float _1259 = fma(_1251, -2.0, _1229);
    float _1261 = -_138;
    float _1263 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1249);
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1267 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1269 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1253);
    bool _1271 = _388 != 0.0;
    bool _1273 = isnan(_388);
    bool _1275 = _1271 || _1273;
    bool _1277 = isnan(0.0);
    bool _1279 = _1275 || _1277;
    float _1281 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1259);
    float _1283 = fma(_1267, -2.0, _1265);
    float _1285 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1269);
    bool _1287 = _386 == 0.0;
    bool _1289 = !_1279;
    bool _1291 = _1287 && _1289;
    float _1293 = _1237 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1295 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1283);
    float _1297 = -_1281;
    float _1299 = fma(_1285, _1057, _1297);
    float _1301 = _1183 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1303 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1305 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[17].y, _336);
    bool _1307 = _390 == 0.0;
    bool _1309 = _1307 && _1291;
    float _1311 = fma(_1293, _1177, -0.5);
    float _1313 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1209);
    float _1315 = 1.0 / _1301;
    float _1317 = _1303 + _1301;
    float _1319 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[17].y, _338);
    float _1321 = fma(_1313, _1311, _1263);
    bool _1323 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1325 = isnan(0.5);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1331 = _1327 || _1329;
    float _1333 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1225);
    float _1335 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1171);
    bool _1337 = !_1309;
    float _1339 = _1337 ? _1319 : _338;
    float _1341 = exp2(_885);
    bool _1343 = !_1309;
    float _1345 = _1343 ? _1305 : _336;
    float _1347 = -_1295;
    float _1349 = fma(_1335, _1105, _1347);
    float _1351 = _1097 + 0.5;
    float _1353 = _1345 * _1345;
    float _1355 = _1317 * _1315;
    float _1357 = _1355 * 0.5;
    float _1359 = _1315;
    float _1361 = _1215;
    float _1363 = _1349;
    if (!_1331)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1365 = _142;
    float _1367 = fma(_1339, _1339, _1353);
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1373 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (!_1331)
    {
        float _1375 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1377 = fma(_1357, _1365, _1375);
        _1359 = _1377;
    }
    float _1379 = _1359;
    float _1381 = rsqrt(_1367);
    float _1383 = _1371 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1385 = _1369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1387 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1389 = _1333 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1391 = _1255 + 0.5;
    out.m_67.x = (*spvDescriptorSet0.vp_c10)._m0[8].x;
    out.m_67.y = (*spvDescriptorSet0.vp_c10)._m0[9].x;
    out.m_67.z = (*spvDescriptorSet0.vp_c10)._m0[10].x;
    float _1393 = _1257 + 0.5;
    float _1395 = _1299 + 0.5;
    if (!_1309)
    {
        _480 = _1305;
    }
    float _1397 = _480;
    out.m_69.x = _1383;
    out.m_69.y = _1385;
    out.m_69.z = _1387;
    out.m_69.w = _1389;
    float _1399 = -_1341;
    float _1401 = _1399 + 1.0;
    if (!_1309)
    {
        float _1403 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[17].y, _334);
        _482 = _1403;
    }
    float _1405 = _482;
    if (!_1309)
    {
        _484 = _1319;
    }
    float _1407 = _484;
    float _1409 = _1345 * _1381;
    out.m_71.x = _1391;
    out.m_71.y = _1351;
    out.m_71.z = _1393;
    out.m_71.w = _1395;
    float _1411 = _1401 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1331)
    {
        _1361 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1413 = _1361;
    float _1415 = _1339 * _1381;
    float _1417 = -(*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1419 = _1409 * _1417;
    float _1421 = _1321 + 0.5;
    float _1423 = _1349 + 0.5;
    float _1425 = _1413;
    if (!_1331)
    {
        float _1427 = -_1413;
        float _1429 = _1427 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1109 = _1429;
    }
    float _1431 = _1109;
    float _1433 = fma(_1415, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1419);
    float _1435 = -(*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1437 = _1409 * _1435;
    float _1439 = -(*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1441 = _1409 * _1439;
    float _1443 = _939 + _798;
    float _1445 = _826 + _798;
    float _1447 = fma(_1415, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1437);
    float _1449 = fma(_1415, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1441);
    float _1451 = _1397 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1453 = _1397 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1455 = _798 * 0.5;
    float _1457 = _1397 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1459 = fma(_1405, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1451);
    float _1461 = fma(_1405, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1453);
    float _1463 = fma(_822, -0.5, _1455);
    float _1465 = fma(_1405, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1457);
    float _1467 = fma(_1407, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1459);
    float _1469 = fma(_1407, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1461);
    float _1471 = fma(_1407, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1465);
    float _1473 = _1443 * 0.5;
    float _1475 = _1445 * 0.5;
    float _1477 = _1379;
    float _1479 = _1433;
    if (!_1331)
    {
        float _1481 = 1.0 / _1379;
        _1477 = _1481;
    }
    float _1483 = _1477;
    out.m_73.x = _1421;
    out.m_73.y = _1423;
    bool _1485 = _684 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1487 = isnan(_684);
    bool _1489 = _1485 || _1487;
    bool _1491 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1493 = _1489 || _1491;
    out.m_75.x = _1475;
    out.m_75.y = _1463;
    out.m_75.z = _1473;
    out.m_75.w = _798;
    float _1495 = _1431;
    if (!_1331)
    {
        float _1497 = 1.0 / _1431;
        _1495 = _1497;
    }
    float _1499 = _1495;
    out.m_77.x = _1467;
    out.m_77.y = _1469;
    out.m_77.z = _1471;
    out.m_79.x = _1433;
    out.m_79.y = _1447;
    out.m_79.z = _1449;
    if (!_1331)
    {
        float _1501 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1503 = -_1413;
        float _1505 = fma(_1483, _1501, _1503);
        _1363 = _1505;
    }
    float _1507 = _1363;
    if (_1331)
    {
        _1425 = 1.0;
    }
    float _1509 = _1425;
    out.gl_Position.x = _826;
    out.gl_Position.y = _822;
    out.gl_Position.z = _939;
    out.gl_Position.w = _798;
    float _1511 = _1509;
    if (!_1331)
    {
        float _1513 = _1507 * _1499;
        float _1515 = precise::clamp(_1513, 0.0, 1.0);
        _1511 = _1515;
    }
    float _1517 = _1511;
    if (!_1493)
    {
        _1479 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1519 = _1479;
    float _1521 = _1517 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1523 = _1519;
    float _1525 = _1519;
    if (!_1493)
    {
        _1005 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1527 = _1005;
    float _1529 = _1527;
    float _1531 = _1527;
    if (!_1493)
    {
        _1007 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1533 = _1007;
    float _1535 = _1533;
    float _1537 = _1533;
    if (!_1493)
    {
        _1009 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1539 = _1009;
    float _1541 = _1539;
    float _1543 = _1539;
    if (!_1493)
    {
        _1011 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1545 = _1011;
    float _1547 = _1411 * _854;
    float _1549 = -_1411;
    float _1551 = _1549 + 1.0;
    float _1553 = _854;
    float _1555 = _1545;
    float _1557 = _1545;
    if (!_1493)
    {
        _1553 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1559 = _1553;
    float _1561 = _865 * _1547;
    float _1563 = _865 * _1551;
    float _1565 = _877 * _1547;
    float _1567 = fma(_873, _1561, _859);
    float _1569 = fma(_875, _1561, _861);
    float _1571 = fma(_865, _1565, _863);
    out.m_81.x = _1567;
    out.m_81.y = _1569;
    out.m_81.z = _1571;
    out.m_81.w = _1563;
    bool _1573 = !_1493;
    float _1575 = _1559;
    float _1577 = _1559;
    if (!_1573)
    {
        bool _1579 = _684 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1581 = isnan(_684);
        bool _1583 = _1579 || _1581;
        bool _1585 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1587 = _1583 || _1585;
        if (!_1587)
        {
            float _1589 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1591 = _684 + _1589;
            float _1593 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1595 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1593;
            float _1597 = 1.0 / _1595;
            float _1599 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1601 = _1599 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1603 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1605 = _1603 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1609 = _1607 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1611 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1613 = _1611 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1617 = _1615 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1619 = _1591 * _1597;
            float _1621 = precise::clamp(_1619, 0.0, 1.0);
            float _1623 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1625 = _1623 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1627 = fma(_1621, _1601, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1629 = fma(_1621, _1625, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1631 = fma(_1621, _1605, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1633 = fma(_1621, _1609, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1635 = fma(_1621, _1613, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1637 = fma(_1621, _1617, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1531 = _1629;
            _1557 = _1635;
            _1525 = _1627;
            _1543 = _1633;
            _1537 = _1631;
            _1577 = _1637;
            _1639 = true;
        }
        else
        {
            bool _1641 = _684 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1643 = isnan(_684);
            bool _1645 = _1641 || _1643;
            bool _1647 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1649 = _1645 || _1647;
            if (!_1649)
            {
                _1523 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1651 = _1523;
            _1525 = _1651;
            if (!_1649)
            {
                _1529 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1653 = _1529;
            _1531 = _1653;
            if (!_1649)
            {
                _1535 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1655 = _1535;
            _1537 = _1655;
            if (!_1649)
            {
                _1541 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1657 = _1541;
            _1543 = _1657;
            if (!_1649)
            {
                _1555 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1659 = _1555;
            _1557 = _1659;
            if (!_1649)
            {
                _1575 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1661 = _1575;
            bool _1663 = !_1649;
            _1577 = _1661;
            if (!_1663)
            {
                bool _1665 = _684 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1667 = isnan(_684);
                bool _1669 = _1665 || _1667;
                bool _1671 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1673 = _1669 || _1671;
                if (!_1673)
                {
                    float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1677 = _684 + _1675;
                    float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1681 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1679;
                    float _1683 = 1.0 / _1681;
                    float _1685 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1687 = _1685 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1689 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1691 = _1689 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1699 = _1697 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1705 = _1677 * _1683;
                    float _1707 = precise::clamp(_1705, 0.0, 1.0);
                    float _1709 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1711 = _1709 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1713 = fma(_1707, _1687, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1715 = fma(_1707, _1711, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1717 = fma(_1707, _1691, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1719 = fma(_1707, _1695, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1721 = fma(_1707, _1699, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1723 = fma(_1707, _1703, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1531 = _1715;
                    _1557 = _1721;
                    _1525 = _1713;
                    _1543 = _1719;
                    _1537 = _1717;
                    _1577 = _1723;
                    _1639 = true;
                }
                else
                {
                    _1531 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1557 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1525 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1543 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1537 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1577 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1639 = false;
    float _1725 = _1531;
    float _1727 = _1557;
    float _1729 = _1525;
    float _1731 = _1543;
    float _1733 = _1537;
    float _1735 = _1577;
    float _1737 = fma(_1469, -0.5, 0.5);
    float _1739 = precise::clamp(_1737, 0.0, 1.0);
    float _1741 = -_1725;
    float _1743 = _1741 + _1727;
    float _1745 = _1521 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1747 = -_1729;
    float _1749 = _1747 + _1731;
    out.m_83.x = 0.0;
    float _1751 = fma(_1739, _1743, _1725);
    float _1753 = fma(_1739, _1749, _1729);
    out.m_47.x = _1745;
    float _1755 = -_1733;
    float _1757 = _1755 + _1735;
    float _1759 = _1751 * 0.586610972881317138671875;
    bool _1761 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1763 = fma(_1739, _1757, _1733);
    float _1765 = fma(_1753, 0.298911988735198974609375, _1759);
    bool _1767 = _1517 > 0.0;
    bool _1769 = isnan(_1517);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan(0.0);
    bool _1775 = _1771 || _1773;
    float _1777 = fma(_1763, 0.114477999508380889892578125, _1765);
    float _1779 = -_1777;
    float _1781 = _1753 + _1779;
    float _1783 = -_1777;
    float _1785 = _1751 + _1783;
    float _1787 = -_1777;
    float _1789 = _1763 + _1787;
    float _1791 = fma(_1781, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1777);
    float _1793 = fma(_1785, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1777);
    float _1795 = fma(_1789, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1777);
    bool _1797 = !_1761;
    if (!_1797)
    {
        float _1799 = -_536;
        float _1801 = _1799 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1803 = -_538;
        float _1805 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1807 = -_540;
        float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1811 = _1801 * _1801;
        float _1813 = fma(_1805, _1805, _1811);
        float _1815 = fma(_1809, _1809, _1813);
        float _1817 = sqrt(_1815);
        float _1819 = rsqrt(_1815);
        float _1821 = -_1817;
        float _1823 = _1821 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1825 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1827 = precise::clamp(_1825, 0.0, 1.0);
        float _1829 = _1805 * _1819;
        float _1831 = _1801 * _1819;
        float _1833 = abs(_1827);
        float _1835 = log2(_1833);
        float _1837 = _1809 * _1819;
        float _1839 = _1829 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1841 = _1469 * _1831;
        float _1843 = -_1831;
        float _1845 = -_1839;
        float _1847 = fma(_1843, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1845);
        float _1849 = fma(_1467, _1829, _1841);
        float _1851 = -_1837;
        float _1853 = fma(_1851, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1847);
        float _1855 = fma(_1471, _1837, _1849);
        float _1857 = precise::clamp(_1855, 0.0, 1.0);
        float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1861 = _1853 + _1859;
        float _1863 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1865 = _1861 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1867 = precise::clamp(_1865, 0.0, 1.0);
        float _1869 = exp2(_1863);
        float _1871 = _1869 * _1867;
        float _1873 = _1857 * _1871;
        float _1875 = _1873 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1877 = _1873 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1879 = _1873 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_83.x = _1875;
        out.m_83.y = _1877;
        out.m_83.z = _1879;
    }
    out.m_85.x = _1791;
    out.m_85.y = _1793;
    out.m_85.z = _1795;
    if (_1775)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1881 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1881;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1639 = false;
    bool _318 = false;
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
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1938 = as_type<float>(_120);
        out.gl_Position.z = _1938;
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
    float _140 = 0.0;
    float _142 = _138;
    if (_134)
    {
        float _144 = float(_104);
        _140 = _144;
    }
    float _146 = _140;
    bool _148 = _138 >= _146;
    bool _150 = !_134;
    bool _152 = _148 || _150;
    if (_152)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _114;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2007 = as_type<float>(_158);
        out.gl_Position.z = _2007;
    }
    if (_152)
    {
        return out;
    }
    float _160 = in.m_51.y;
    float _162 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = in.m_53.w;
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _178 = in.m_49.x;
    float _180 = in.m_49.y;
    float _182 = in.m_49.z;
    float _184 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _186 = _176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _188 = in.m_44.x;
    float _190 = in.m_44.y;
    float _192 = in.m_44.z;
    float _194 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _196 = _184 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _198 = 0.0;
    float _200 = _162;
    if (!_172)
    {
        float _202 = _162 * _162;
        float _204 = _202 * 0.5;
        _198 = _204;
    }
    float _206 = _198;
    float _208 = _194 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _210 = _206;
    if (!_172)
    {
        float _212 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _212;
    }
    float _214 = _210;
    bool _216 = !_172;
    float _218 = _214;
    float _220 = _160;
    if (!_216)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = _162 * _224;
        float _234 = 1.0 / _228;
        float _236 = _230 * 0.693147182464599609375;
        float _238 = exp2(_232);
        float _240 = 1.0 / _236;
        float _242 = _238 + (-1.0);
        float _244 = -_242;
        float _246 = fma(_244, _240, _162);
        float _248 = _246 * _234;
        float _250 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _250;
    }
    float _252 = _218;
    bool _254 = !_172;
    if (!_254)
    {
        float _256 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _258 = log2(_256);
        float _260 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _262 = _260 + 1.0;
        float _264 = 1.0 / _262;
        float _266 = _162 * _258;
        float _268 = exp2(_266);
        float _270 = -_268;
        float _272 = _270 + 1.0;
        float _274 = _272 * _264;
        _200 = _274;
    }
    float _276 = _200;
    out.m_55.x = _186;
    out.m_55.y = _196;
    out.m_55.z = _208;
    bool _278 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _280 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _282 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    out.m_57.y = _160;
    float _284 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _286 = fma(_276, _178, _280);
    float _288 = fma(_276, _180, _282);
    float _290 = fma(_276, _182, _284);
    float _292 = fma(_286, _174, _188);
    float _294 = fma(_288, _174, _190);
    float _296 = fma(_290, _174, _192);
    bool _298 = !_278;
    float _316;
    if (!_298)
    {
        float _300 = in.m_59.x;
        float _302 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _304 = _300 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _306 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[11].w, _138);
        float _308 = _306 * _302;
        float _310 = floor(_308);
        float _312 = -_310;
        float _314 = _308 + _312;
        _316 = _314;
        _318 = true;
    }
    else
    {
        float _320 = float(_104);
        float _322 = 1.0 / _320;
        float _324 = _138 * _322;
        _316 = _324;
    }
    _318 = false;
    float _326 = _316;
    float _328 = in.m_61.x;
    float _330 = in.m_61.y;
    float _332 = in.m_61.z;
    float _334 = in.m_63.x;
    float _336 = in.m_63.y;
    float _338 = in.m_63.z;
    float _340 = fma((*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c10)._m0[2].x, _332);
    float _342 = _336 * _336;
    float _344 = _340 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _346 = fma(_334, _334, _342);
    float _348 = _344 * 0.15915493667125701904296875;
    float _350 = fma(_338, _338, _346);
    float _352 = _348 * 6.283185482025146484375;
    float _354 = sin(_352);
    float _356 = in.m_53.x;
    float _358 = in.m_53.y;
    float _360 = in.m_53.z;
    float _362 = rsqrt(_350);
    float _364 = _354 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _366 = -_160;
    float _368 = _366 + 1.0;
    float _370 = _362 * _364;
    float _372 = _356 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _374 = _358 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _376 = _360 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _378 = _368 * _370;
    float _380 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _382 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _384 = _376 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _386 = fma(_334, _378, _328);
    float _388 = fma(_336, _378, _330);
    float _390 = fma(_338, _378, _332);
    float _392 = _294 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _394 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _386);
    float _396 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _390);
    float _398 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[6].x, _392);
    float _400 = _394 * _380;
    float _402 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _388);
    float _404 = _396 * _384;
    float _406 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].z, _398);
    float _408 = _402 * _382;
    float _410 = _294 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _412 = _406 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _414 = _408 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _416 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[4].x, _410);
    float _418 = _408 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _420 = _408 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _422 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[10].x, _414);
    float _424 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].z, _416);
    float _426 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[8].x, _418);
    float _428 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[9].x, _420);
    float _430 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[10].z, _422);
    float _432 = _424 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _434 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[8].z, _426);
    float _436 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[9].z, _428);
    float _438 = _412 + _430;
    float _440 = _432 + _434;
    float _442 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _444 = _438 + _442;
    float _446 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _448 = _440 + _446;
    float _450 = _444 * _444;
    float _452 = fma(_448, _448, _450);
    float _454 = _294 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _456 = sqrt(_452);
    float _458 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[5].x, _454);
    float _460 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].z, _458);
    float _462 = _460 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _464 = _462 + _436;
    bool _466 = _456 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _468 = _460;
    float _470 = _436;
    float _472 = _404;
    float _474 = _444;
    float _476 = _438;
    int _478 = as_type<int>(_462);
    float _480 = _336;
    float _482 = _334;
    float _484 = _338;
    if (!_466)
    {
        _468 = _440;
    }
    float _486 = _468;
    float _488 = _486;
    if (!_466)
    {
        _470 = _438;
    }
    float _490 = _470;
    float _492 = _490;
    if (!_466)
    {
        _472 = _464;
    }
    float _494 = _472;
    bool _496 = !_466;
    float _498 = _494;
    if (!_496)
    {
        float _500 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _502 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _504 = _456 + _502;
        float _506 = _464 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _508 = rsqrt(_452);
        float _510 = _504 * _500;
        float _512 = _510 * 0.15915493667125701904296875;
        float _514 = _512 * 6.283185482025146484375;
        float _516 = cos(_514);
        float _518 = _512 * 6.283185482025146484375;
        float _520 = sin(_518);
        float _522 = _516 + (-1.0);
        float _524 = _522 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _526 = fma(_520, _506, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _528 = fma(_464, _516, _524);
        float _530 = _508 * _526;
        float _532 = fma(_448, _530, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _534 = fma(_444, _530, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _498 = _528;
        _488 = _532;
        _492 = _534;
    }
    float _536 = _498;
    float _538 = _488;
    float _540 = _492;
    float _542 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _544 = _536 + _542;
    float _546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _548 = _538 + _546;
    float _550 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _552 = _540 + _550;
    float _554 = _544 * _544;
    float _556 = fma(_548, _548, _554);
    float _558 = fma(_552, _552, _556);
    float _560 = rsqrt(_558);
    float _562 = _560 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _564 = _548 * _562;
    float _566 = _552 * _562;
    float _568 = _564 * _564;
    float _570 = _566 * _566;
    float _572 = _568 + _570;
    float _574 = sqrt(_572);
    bool _576 = _574 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _578 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _580 = _574 + _578;
    float _582 = _552;
    float _584 = _572;
    float _586 = _580;
    float _588 = _544;
    if (_576)
    {
        float _590 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _582 = _590;
    }
    float _592 = _582;
    if (_576)
    {
        float _594 = rsqrt(_572);
        _584 = _594;
    }
    float _596 = _584;
    float _598 = _596;
    if (_576)
    {
        float _600 = _580 * _592;
        _586 = _600;
    }
    float _602 = _586;
    if (_576)
    {
        float _604 = _602 * 0.15915493667125701904296875;
        _474 = _604;
    }
    float _606 = _474;
    float _608 = _560;
    if (_576)
    {
        float _610 = _606 * 6.283185482025146484375;
        float _612 = sin(_610);
        _608 = _612;
    }
    float _614 = _608;
    float _616 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _618 = precise::max(0.0, _616);
    float _620 = _554;
    float _622 = _618;
    float _624 = _616;
    if (_576)
    {
        float _626 = _606 * 6.283185482025146484375;
        float _628 = cos(_626);
        _620 = _628;
    }
    float _630 = _620;
    float _632 = -_562;
    float _634 = -_618;
    float _636 = fma(_544, _632, _634);
    if (!_576)
    {
        _588 = _566;
    }
    float _638 = _588;
    float _640 = _638;
    if (_576)
    {
        float _642 = _636 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _622 = _642;
    }
    float _644 = _622;
    float _646 = _644;
    float _648 = _614;
    if (_576)
    {
        float _650 = fma(_614, _644, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _646 = _650;
    }
    float _652 = _646;
    float _654 = _652;
    if (!_576)
    {
        _648 = _564;
    }
    float _656 = _648;
    float _658 = _656;
    float _660 = _630;
    if (_576)
    {
        float _662 = _630 + (-1.0);
        _624 = _662;
    }
    float _664 = _624;
    float _666 = 0.0;
    if (_576)
    {
        float _668 = _596 * _652;
        _666 = _668;
    }
    float _670 = _666;
    if (!_576)
    {
        _654 = _636;
    }
    float _672 = _654;
    float _674 = _672;
    if (_576)
    {
        float _676 = _664 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _476 = _676;
    }
    float _678 = _476;
    if (_576)
    {
        float _680 = _564 * _670;
        _658 = _680;
    }
    float _682 = _658;
    float _684 = sqrt(_558);
    if (!_576)
    {
        _598 = _568;
    }
    float _686 = _598;
    float _688 = _686;
    if (_576)
    {
        float _690 = fma(_636, _630, _678);
        _674 = _690;
    }
    float _692 = _674;
    if (_576)
    {
        float _694 = _566 * _670;
        _640 = _694;
    }
    float _696 = _640;
    if (_576)
    {
        float _698 = _682 * _682;
        _688 = _698;
    }
    float _700 = _688;
    if (!_576)
    {
        _660 = _570;
    }
    float _702 = _660;
    float _704 = _702;
    if (_576)
    {
        float _706 = _696 * _696;
        _704 = _706;
    }
    float _708 = _704;
    float _710 = fma(_692, _692, _700);
    float _712 = _536 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _714 = _536 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _716 = _710 + _708;
    float _718 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[2].x, _712);
    float _720 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[1].x, _714);
    float _722 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _724 = fma(_684, (*spvDescriptorSet0.vp_c15)._m0[23].w, _722);
    float _726 = precise::clamp(_724, 0.0, 1.0);
    float _728 = rsqrt(_716);
    float _730 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[2].z, _718);
    float _732 = -_726;
    float _734 = _732 + 1.0;
    float _736 = _536 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _738 = _536 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _740 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[1].z, _720);
    float _742 = _730 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _744 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[0].x, _736);
    float _746 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[3].x, _738);
    float _748 = _740 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _750 = abs(_734);
    float _752 = log2(_750);
    float _754 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[0].z, _744);
    float _756 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[3].z, _746);
    float _758 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _760 = _742 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _762 = _754 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _764 = _728 * _682;
    float _766 = _756 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _768 = _748 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _770 = _728 * _692;
    float _772 = _764 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _774 = _728 * _696;
    float _776 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[7].x, _768);
    float _778 = -_760;
    float _780 = fma(_778, _758, 1.0);
    float _782 = -_772;
    float _784 = fma(_770, (*spvDescriptorSet0.vp_c15)._m0[21].y, _782);
    float _786 = _748 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _788 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[7].z, _776);
    float _790 = log2(_780);
    float _792 = -_774;
    float _794 = fma(_792, (*spvDescriptorSet0.vp_c15)._m0[21].z, _784);
    float _796 = _752 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _798 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[7].w, _788);
    float _800 = _748 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _802 = fma(_794, -0.5, 0.5);
    float _804 = fma(_794, 0.5, 0.5);
    float _806 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[5].x, _786);
    float _808 = 1.0 / _798;
    float _810 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[4].x, _800);
    float _812 = fma(_804, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _814 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[5].z, _806);
    float _816 = _770 + 1.0;
    float _818 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[4].z, _810);
    float _820 = fma(_804, _812, -0.212114393711090087890625);
    float _822 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[5].w, _814);
    float _824 = sqrt(_802);
    float _826 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[4].w, _818);
    float _828 = _790 * 0.693147182464599609375;
    float _830 = fma(_804, _820, 1.570728778839111328125);
    float _832 = _828 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _834 = exp2(_796);
    float _836 = _826 * _808;
    float _838 = _822 * _808;
    float _840 = fma(_838, -0.5, 0.5);
    float _842 = _824 * 0.636619746685028076171875;
    float _844 = fma(_836, 0.5, 0.5);
    float _846 = -_830;
    float _848 = fma(_842, _846, 1.0);
    float _850 = -_770;
    float _852 = fma(_834, _816, _850);
    float3 _3157 = float3(_844, _840, _832);
    float _854 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3157, float3(0.0), isnan(_3157)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3157, float3(0.0), isnan(_3157)), level(0.0)).x;
    float3 _3168 = float3(_844, _840, _832);
    float4 _857 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3168, float3(0.0), isnan(_3168)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3168, float3(0.0), isnan(_3168)), level(0.0)).xyzw;
    float _859 = _857.x;
    float _861 = _857.y;
    float _863 = _857.z;
    float _865 = _857.w;
    float _867 = fma(_852, 0.5, 0.5);
    float2 _3187 = float2(_848, _867);
    float3 _871 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3187, float2(0.0), isnan(_3187)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3187, float2(0.0), isnan(_3187)), level(0.0)).xyz;
    float _873 = _871.x;
    float _875 = _871.y;
    float _877 = _871.z;
    float _879 = in.m_59.w;
    float _881 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _883 = in.m_59.y;
    float _885 = _752 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _887 = in.m_59.x;
    float _889 = in.m_59.z;
    float _891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _895 = _893 != 0;
    float _897 = in.m_51.x;
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _901 = _899 != 0;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _905 = _748 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _909 = _907 != 0;
    float _911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _915 = _913 != 0;
    float _917 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[6].x, _905);
    bool _919 = _879 > 0.5;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _927 = _925 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _929 = _883 > 0.5;
    float _931 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[6].z, _917);
    float _933 = 1.0 / _923;
    float _935 = _891 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _937 = _929 ? as_type<int>(_368) : as_type<int>(_160);
    float _939 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[6].w, _931);
    int _941 = _919 ? as_type<int>(_368) : as_type<int>(_160);
    out.m_65.x = _538;
    out.m_65.y = _536;
    out.m_65.z = _540;
    float _943 = _895 ? as_type<float>(_937) : _160;
    float _945 = 1.0 / _927;
    float _947 = _887 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _951 = _949 != 0;
    int _953 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _955 = _953 != 0;
    float _957 = -_903;
    float _959 = fma(_947, 2.0, _957);
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _961;
    float _965 = _901 ? as_type<float>(_941) : _160;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _973 = _326 + _971;
    float _975 = _963 * _933;
    bool _977 = _889 > 0.5;
    float _979 = _883 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _983 = _981 != 0;
    float _985 = fma(_975, _973, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _987 = _881 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _989 = _969 * _945;
    float _991 = fma(_987, _943, -0.5);
    float _993 = _965;
    bool _995 = _951;
    float _997 = _979;
    float _999 = _897;
    float _1001 = _889;
    float _1003 = _883;
    float _1005 = _798;
    float _1007 = _939;
    float _1009 = _822;
    float _1011 = _826;
    if (_951)
    {
        float _1013 = _977 ? _368 : _160;
        _220 = _1013;
    }
    float _1015 = _220;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1019 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1021 = isnan(_326);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1027 = _1023 || _1025;
    float _1029 = float(_1027);
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1035 = _326 + _1033;
    bool _1037 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1039 = isnan(_326);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1045 = _1041 || _1043;
    float _1047 = float(_1045);
    float _1049 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1017);
    float _1051 = -_1029;
    float _1053 = _1051 + 1.0;
    float _1055 = fma(_979, -2.0, _1031);
    float _1057 = fma(_965, _935, -0.5);
    int _1059 = as_type<int>(_1049);
    if (_955)
    {
        _993 = _887;
    }
    float _1061 = _993;
    float _1063 = fma(_989, _1035, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1065 = _1061;
    if (!_955)
    {
        _1065 = _889;
    }
    float _1067 = _1065;
    float _1069 = _1047 * _1053;
    bool _1071 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1073 = isnan(_326);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1049);
    float _1085 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1055);
    float _1087 = -_1047;
    float _1089 = _1087 + 1.0;
    float _1091 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1093 = _911 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1095 = -_1085;
    float _1097 = fma(_1083, _991, _1095);
    float _1099 = _462 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1101 = _462 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1103 = _1081 * _1089;
    float _1105 = fma(_1093, _1015, -0.5);
    int _1107 = as_type<int>(_1103);
    float _1109 = _1105;
    if (_909)
    {
        float _1111 = -_897;
        float _1113 = _1111 + 1.0;
        _478 = as_type<int>(_1113);
    }
    int _1115 = _478;
    float _1117 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1099);
    float _1119 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1101);
    float _1121 = _985 * _1103;
    if (_909)
    {
        bool _1123 = _887 > 0.5;
        _995 = _1123;
    }
    bool _1125 = _995;
    if (_915)
    {
        float _1127 = -_897;
        float _1129 = _1127 + 1.0;
        _1107 = as_type<int>(_1129);
    }
    int _1131 = _1107;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[83].z;
    float _1135 = as_type<float>(_1131);
    if (_983)
    {
        float _1137 = -_897;
        float _1139 = _1137 + 1.0;
        _1059 = as_type<int>(_1139);
    }
    int _1141 = _1059;
    if (!_909)
    {
        _997 = _897;
    }
    float _1143 = _997;
    float _1145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1147 = _1143;
    if (_909)
    {
        float _1149 = _1125 ? as_type<float>(_1115) : _897;
        _1147 = _1149;
    }
    float _1151 = _1147;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1157 = _1153;
    if (!_915)
    {
        _1133 = _897;
    }
    float _1159 = _1133;
    float _1161 = -_1081;
    float _1163 = _1161 + 1.0;
    float _1165 = _1159;
    if (_915)
    {
        float _1167 = _977 ? as_type<float>(_1131) : _897;
        _1165 = _1167;
    }
    float _1169 = _1165;
    float _1171 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1153);
    float _1173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_983)
    {
        float _1175 = _929 ? as_type<float>(_1141) : _897;
        _999 = _1175;
    }
    float _1177 = _999;
    float _1179 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1121);
    float _1181 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1117);
    float _1183 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1119);
    if (!_955)
    {
        _1157 = _883;
    }
    float _1185 = _1157;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1189 = _1185;
    if (_955)
    {
        _1189 = _887;
    }
    float _1191 = _1189;
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1195 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1187);
    if (!_955)
    {
        _1135 = _889;
    }
    float _1197 = _1135;
    float _1199 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1155);
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1203 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1205 = _1197;
    if (_955)
    {
        _1001 = _883;
    }
    float _1207 = _1001;
    float _1209 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1193);
    if (_955)
    {
        _1205 = _883;
    }
    float _1211 = _1205;
    float _1213 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_955)
    {
        _1003 = _887;
    }
    float _1215 = _1003;
    float _1217 = -_1201;
    float _1219 = fma(_1203, 2.0, _1217);
    float _1221 = _1173 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1225 = fma(_1063, _1069, _1179);
    float _1227 = fma(_1213, _1151, -0.5);
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1231 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1195);
    float _1233 = -_138;
    float _1235 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[76].x, _959);
    float _1237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1239 = fma(_1221, _1169, -0.5);
    float _1241 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1199);
    float _1243 = -_138;
    float _1245 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1219);
    float _1247 = -_1223;
    float _1249 = fma(_1091, 2.0, _1247);
    float _1251 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1253 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1255 = fma(_1231, _1227, _1235);
    float _1257 = fma(_1241, _1239, _1245);
    float _1259 = fma(_1251, -2.0, _1229);
    float _1261 = -_138;
    float _1263 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1249);
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1267 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1269 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1253);
    bool _1271 = _388 != 0.0;
    bool _1273 = isnan(_388);
    bool _1275 = _1271 || _1273;
    bool _1277 = isnan(0.0);
    bool _1279 = _1275 || _1277;
    float _1281 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1259);
    float _1283 = fma(_1267, -2.0, _1265);
    float _1285 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1269);
    bool _1287 = _386 == 0.0;
    bool _1289 = !_1279;
    bool _1291 = _1287 && _1289;
    float _1293 = _1237 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1295 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1283);
    float _1297 = -_1281;
    float _1299 = fma(_1285, _1057, _1297);
    float _1301 = _1183 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1303 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1305 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[17].y, _336);
    bool _1307 = _390 == 0.0;
    bool _1309 = _1307 && _1291;
    float _1311 = fma(_1293, _1177, -0.5);
    float _1313 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1209);
    float _1315 = 1.0 / _1301;
    float _1317 = _1303 + _1301;
    float _1319 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[17].y, _338);
    float _1321 = fma(_1313, _1311, _1263);
    bool _1323 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1325 = isnan(0.5);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1331 = _1327 || _1329;
    float _1333 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1225);
    float _1335 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1171);
    bool _1337 = !_1309;
    float _1339 = _1337 ? _1319 : _338;
    float _1341 = exp2(_885);
    bool _1343 = !_1309;
    float _1345 = _1343 ? _1305 : _336;
    float _1347 = -_1295;
    float _1349 = fma(_1335, _1105, _1347);
    float _1351 = _1097 + 0.5;
    float _1353 = _1345 * _1345;
    float _1355 = _1317 * _1315;
    float _1357 = _1355 * 0.5;
    float _1359 = _1315;
    float _1361 = _1215;
    float _1363 = _1349;
    if (!_1331)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1365 = _142;
    float _1367 = fma(_1339, _1339, _1353);
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1373 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (!_1331)
    {
        float _1375 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1377 = fma(_1357, _1365, _1375);
        _1359 = _1377;
    }
    float _1379 = _1359;
    float _1381 = rsqrt(_1367);
    float _1383 = _1371 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1385 = _1369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1387 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1389 = _1333 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1391 = _1255 + 0.5;
    out.m_67.x = (*spvDescriptorSet0.vp_c10)._m0[8].x;
    out.m_67.y = (*spvDescriptorSet0.vp_c10)._m0[9].x;
    out.m_67.z = (*spvDescriptorSet0.vp_c10)._m0[10].x;
    float _1393 = _1257 + 0.5;
    float _1395 = _1299 + 0.5;
    if (!_1309)
    {
        _480 = _1305;
    }
    float _1397 = _480;
    out.m_69.x = _1383;
    out.m_69.y = _1385;
    out.m_69.z = _1387;
    out.m_69.w = _1389;
    float _1399 = -_1341;
    float _1401 = _1399 + 1.0;
    if (!_1309)
    {
        float _1403 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[17].y, _334);
        _482 = _1403;
    }
    float _1405 = _482;
    if (!_1309)
    {
        _484 = _1319;
    }
    float _1407 = _484;
    float _1409 = _1345 * _1381;
    out.m_71.x = _1391;
    out.m_71.y = _1351;
    out.m_71.z = _1393;
    out.m_71.w = _1395;
    float _1411 = _1401 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1331)
    {
        _1361 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1413 = _1361;
    float _1415 = _1339 * _1381;
    float _1417 = -(*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1419 = _1409 * _1417;
    float _1421 = _1321 + 0.5;
    float _1423 = _1349 + 0.5;
    float _1425 = _1413;
    if (!_1331)
    {
        float _1427 = -_1413;
        float _1429 = _1427 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1109 = _1429;
    }
    float _1431 = _1109;
    float _1433 = fma(_1415, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1419);
    float _1435 = -(*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1437 = _1409 * _1435;
    float _1439 = -(*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1441 = _1409 * _1439;
    float _1443 = _939 + _798;
    float _1445 = _826 + _798;
    float _1447 = fma(_1415, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1437);
    float _1449 = fma(_1415, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1441);
    float _1451 = _1397 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1453 = _1397 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1455 = _798 * 0.5;
    float _1457 = _1397 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1459 = fma(_1405, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1451);
    float _1461 = fma(_1405, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1453);
    float _1463 = fma(_822, -0.5, _1455);
    float _1465 = fma(_1405, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1457);
    float _1467 = fma(_1407, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1459);
    float _1469 = fma(_1407, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1461);
    float _1471 = fma(_1407, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1465);
    float _1473 = _1443 * 0.5;
    float _1475 = _1445 * 0.5;
    float _1477 = _1379;
    float _1479 = _1433;
    if (!_1331)
    {
        float _1481 = 1.0 / _1379;
        _1477 = _1481;
    }
    float _1483 = _1477;
    out.m_73.x = _1421;
    out.m_73.y = _1423;
    bool _1485 = _684 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1487 = isnan(_684);
    bool _1489 = _1485 || _1487;
    bool _1491 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1493 = _1489 || _1491;
    out.m_75.x = _1475;
    out.m_75.y = _1463;
    out.m_75.z = _1473;
    out.m_75.w = _798;
    float _1495 = _1431;
    if (!_1331)
    {
        float _1497 = 1.0 / _1431;
        _1495 = _1497;
    }
    float _1499 = _1495;
    out.m_77.x = _1467;
    out.m_77.y = _1469;
    out.m_77.z = _1471;
    out.m_79.x = _1433;
    out.m_79.y = _1447;
    out.m_79.z = _1449;
    if (!_1331)
    {
        float _1501 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1503 = -_1413;
        float _1505 = fma(_1483, _1501, _1503);
        _1363 = _1505;
    }
    float _1507 = _1363;
    if (_1331)
    {
        _1425 = 1.0;
    }
    float _1509 = _1425;
    out.gl_Position.x = _826;
    out.gl_Position.y = _822;
    out.gl_Position.z = _939;
    out.gl_Position.w = _798;
    float _1511 = _1509;
    if (!_1331)
    {
        float _1513 = _1507 * _1499;
        float _1515 = precise::clamp(_1513, 0.0, 1.0);
        _1511 = _1515;
    }
    float _1517 = _1511;
    if (!_1493)
    {
        _1479 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1519 = _1479;
    float _1521 = _1517 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1523 = _1519;
    float _1525 = _1519;
    if (!_1493)
    {
        _1005 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1527 = _1005;
    float _1529 = _1527;
    float _1531 = _1527;
    if (!_1493)
    {
        _1007 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1533 = _1007;
    float _1535 = _1533;
    float _1537 = _1533;
    if (!_1493)
    {
        _1009 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1539 = _1009;
    float _1541 = _1539;
    float _1543 = _1539;
    if (!_1493)
    {
        _1011 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1545 = _1011;
    float _1547 = _1411 * _854;
    float _1549 = -_1411;
    float _1551 = _1549 + 1.0;
    float _1553 = _854;
    float _1555 = _1545;
    float _1557 = _1545;
    if (!_1493)
    {
        _1553 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1559 = _1553;
    float _1561 = _865 * _1547;
    float _1563 = _865 * _1551;
    float _1565 = _877 * _1547;
    float _1567 = fma(_873, _1561, _859);
    float _1569 = fma(_875, _1561, _861);
    float _1571 = fma(_865, _1565, _863);
    out.m_81.x = _1567;
    out.m_81.y = _1569;
    out.m_81.z = _1571;
    out.m_81.w = _1563;
    bool _1573 = !_1493;
    float _1575 = _1559;
    float _1577 = _1559;
    if (!_1573)
    {
        bool _1579 = _684 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1581 = isnan(_684);
        bool _1583 = _1579 || _1581;
        bool _1585 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1587 = _1583 || _1585;
        if (!_1587)
        {
            float _1589 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1591 = _684 + _1589;
            float _1593 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1595 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1593;
            float _1597 = 1.0 / _1595;
            float _1599 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1601 = _1599 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1603 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1605 = _1603 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1609 = _1607 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1611 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1613 = _1611 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1617 = _1615 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1619 = _1591 * _1597;
            float _1621 = precise::clamp(_1619, 0.0, 1.0);
            float _1623 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1625 = _1623 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1627 = fma(_1621, _1601, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1629 = fma(_1621, _1625, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1631 = fma(_1621, _1605, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1633 = fma(_1621, _1609, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1635 = fma(_1621, _1613, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1637 = fma(_1621, _1617, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1531 = _1629;
            _1557 = _1635;
            _1525 = _1627;
            _1543 = _1633;
            _1537 = _1631;
            _1577 = _1637;
            _1639 = true;
        }
        else
        {
            bool _1641 = _684 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1643 = isnan(_684);
            bool _1645 = _1641 || _1643;
            bool _1647 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1649 = _1645 || _1647;
            if (!_1649)
            {
                _1523 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1651 = _1523;
            _1525 = _1651;
            if (!_1649)
            {
                _1529 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1653 = _1529;
            _1531 = _1653;
            if (!_1649)
            {
                _1535 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1655 = _1535;
            _1537 = _1655;
            if (!_1649)
            {
                _1541 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1657 = _1541;
            _1543 = _1657;
            if (!_1649)
            {
                _1555 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1659 = _1555;
            _1557 = _1659;
            if (!_1649)
            {
                _1575 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1661 = _1575;
            bool _1663 = !_1649;
            _1577 = _1661;
            if (!_1663)
            {
                bool _1665 = _684 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1667 = isnan(_684);
                bool _1669 = _1665 || _1667;
                bool _1671 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1673 = _1669 || _1671;
                if (!_1673)
                {
                    float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1677 = _684 + _1675;
                    float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1681 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1679;
                    float _1683 = 1.0 / _1681;
                    float _1685 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1687 = _1685 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1689 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1691 = _1689 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1699 = _1697 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1705 = _1677 * _1683;
                    float _1707 = precise::clamp(_1705, 0.0, 1.0);
                    float _1709 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1711 = _1709 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1713 = fma(_1707, _1687, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1715 = fma(_1707, _1711, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1717 = fma(_1707, _1691, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1719 = fma(_1707, _1695, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1721 = fma(_1707, _1699, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1723 = fma(_1707, _1703, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1531 = _1715;
                    _1557 = _1721;
                    _1525 = _1713;
                    _1543 = _1719;
                    _1537 = _1717;
                    _1577 = _1723;
                    _1639 = true;
                }
                else
                {
                    _1531 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1557 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1525 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1543 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1537 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1577 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1639 = false;
    float _1725 = _1531;
    float _1727 = _1557;
    float _1729 = _1525;
    float _1731 = _1543;
    float _1733 = _1537;
    float _1735 = _1577;
    float _1737 = fma(_1469, -0.5, 0.5);
    float _1739 = precise::clamp(_1737, 0.0, 1.0);
    float _1741 = -_1725;
    float _1743 = _1741 + _1727;
    float _1745 = _1521 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1747 = -_1729;
    float _1749 = _1747 + _1731;
    out.m_83.x = 0.0;
    float _1751 = fma(_1739, _1743, _1725);
    float _1753 = fma(_1739, _1749, _1729);
    out.m_47.x = _1745;
    float _1755 = -_1733;
    float _1757 = _1755 + _1735;
    float _1759 = _1751 * 0.586610972881317138671875;
    bool _1761 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1763 = fma(_1739, _1757, _1733);
    float _1765 = fma(_1753, 0.298911988735198974609375, _1759);
    bool _1767 = _1517 > 0.0;
    bool _1769 = isnan(_1517);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan(0.0);
    bool _1775 = _1771 || _1773;
    float _1777 = fma(_1763, 0.114477999508380889892578125, _1765);
    float _1779 = -_1777;
    float _1781 = _1753 + _1779;
    float _1783 = -_1777;
    float _1785 = _1751 + _1783;
    float _1787 = -_1777;
    float _1789 = _1763 + _1787;
    float _1791 = fma(_1781, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1777);
    float _1793 = fma(_1785, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1777);
    float _1795 = fma(_1789, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1777);
    bool _1797 = !_1761;
    if (!_1797)
    {
        float _1799 = -_536;
        float _1801 = _1799 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1803 = -_538;
        float _1805 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1807 = -_540;
        float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1811 = _1801 * _1801;
        float _1813 = fma(_1805, _1805, _1811);
        float _1815 = fma(_1809, _1809, _1813);
        float _1817 = sqrt(_1815);
        float _1819 = rsqrt(_1815);
        float _1821 = -_1817;
        float _1823 = _1821 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1825 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1827 = precise::clamp(_1825, 0.0, 1.0);
        float _1829 = _1805 * _1819;
        float _1831 = _1801 * _1819;
        float _1833 = abs(_1827);
        float _1835 = log2(_1833);
        float _1837 = _1809 * _1819;
        float _1839 = _1829 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1841 = _1469 * _1831;
        float _1843 = -_1831;
        float _1845 = -_1839;
        float _1847 = fma(_1843, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1845);
        float _1849 = fma(_1467, _1829, _1841);
        float _1851 = -_1837;
        float _1853 = fma(_1851, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1847);
        float _1855 = fma(_1471, _1837, _1849);
        float _1857 = precise::clamp(_1855, 0.0, 1.0);
        float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1861 = _1853 + _1859;
        float _1863 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1865 = _1861 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1867 = precise::clamp(_1865, 0.0, 1.0);
        float _1869 = exp2(_1863);
        float _1871 = _1869 * _1867;
        float _1873 = _1857 * _1871;
        float _1875 = _1873 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1877 = _1873 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1879 = _1873 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_83.x = _1875;
        out.m_83.y = _1877;
        out.m_83.z = _1879;
    }
    out.m_85.x = _1791;
    out.m_85.y = _1793;
    out.m_85.z = _1795;
    if (_1775)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1881 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1881;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1639 = false;
    bool _318 = false;
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
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1938 = as_type<float>(_120);
        out.gl_Position.z = _1938;
    }
    if (!_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = 0.0;
    float _142 = _138;
    if (_134)
    {
        float _144 = float(_104);
        _140 = _144;
    }
    float _146 = _140;
    bool _148 = _138 >= _146;
    bool _150 = !_134;
    bool _152 = _148 || _150;
    if (_152)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _114;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2007 = as_type<float>(_158);
        out.gl_Position.z = _2007;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = in.m_51.y;
    float _162 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = in.m_53.w;
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _178 = in.m_49.x;
    float _180 = in.m_49.y;
    float _182 = in.m_49.z;
    float _184 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _186 = _176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _188 = in.m_44.x;
    float _190 = in.m_44.y;
    float _192 = in.m_44.z;
    float _194 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _196 = _184 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _198 = 0.0;
    float _200 = _162;
    if (!_172)
    {
        float _202 = _162 * _162;
        float _204 = _202 * 0.5;
        _198 = _204;
    }
    float _206 = _198;
    float _208 = _194 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _210 = _206;
    if (!_172)
    {
        float _212 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _212;
    }
    float _214 = _210;
    bool _216 = !_172;
    float _218 = _214;
    float _220 = _160;
    if (!_216)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = _162 * _224;
        float _234 = 1.0 / _228;
        float _236 = _230 * 0.693147182464599609375;
        float _238 = exp2(_232);
        float _240 = 1.0 / _236;
        float _242 = _238 + (-1.0);
        float _244 = -_242;
        float _246 = fma(_244, _240, _162);
        float _248 = _246 * _234;
        float _250 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _250;
    }
    float _252 = _218;
    bool _254 = !_172;
    if (!_254)
    {
        float _256 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _258 = log2(_256);
        float _260 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _262 = _260 + 1.0;
        float _264 = 1.0 / _262;
        float _266 = _162 * _258;
        float _268 = exp2(_266);
        float _270 = -_268;
        float _272 = _270 + 1.0;
        float _274 = _272 * _264;
        _200 = _274;
    }
    float _276 = _200;
    out.m_55.x = _186;
    out.m_55.y = _196;
    out.m_55.z = _208;
    bool _278 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _280 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _282 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    out.m_57.y = _160;
    float _284 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _286 = fma(_276, _178, _280);
    float _288 = fma(_276, _180, _282);
    float _290 = fma(_276, _182, _284);
    float _292 = fma(_286, _174, _188);
    float _294 = fma(_288, _174, _190);
    float _296 = fma(_290, _174, _192);
    bool _298 = !_278;
    float _316;
    if (!_298)
    {
        float _300 = in.m_59.x;
        float _302 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _304 = _300 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _306 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[11].w, _138);
        float _308 = _306 * _302;
        float _310 = floor(_308);
        float _312 = -_310;
        float _314 = _308 + _312;
        _316 = _314;
        _318 = true;
    }
    else
    {
        float _320 = float(_104);
        float _322 = 1.0 / _320;
        float _324 = _138 * _322;
        _316 = _324;
    }
    _318 = false;
    float _326 = _316;
    float _328 = in.m_61.x;
    float _330 = in.m_61.y;
    float _332 = in.m_61.z;
    float _334 = in.m_63.x;
    float _336 = in.m_63.y;
    float _338 = in.m_63.z;
    float _340 = fma((*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c10)._m0[2].x, _332);
    float _342 = _336 * _336;
    float _344 = _340 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _346 = fma(_334, _334, _342);
    float _348 = _344 * 0.15915493667125701904296875;
    float _350 = fma(_338, _338, _346);
    float _352 = _348 * 6.283185482025146484375;
    float _354 = sin(_352);
    float _356 = in.m_53.x;
    float _358 = in.m_53.y;
    float _360 = in.m_53.z;
    float _362 = rsqrt(_350);
    float _364 = _354 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _366 = -_160;
    float _368 = _366 + 1.0;
    float _370 = _362 * _364;
    float _372 = _356 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _374 = _358 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _376 = _360 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _378 = _368 * _370;
    float _380 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _382 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _384 = _376 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _386 = fma(_334, _378, _328);
    float _388 = fma(_336, _378, _330);
    float _390 = fma(_338, _378, _332);
    float _392 = _294 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _394 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _386);
    float _396 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _390);
    float _398 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[6].x, _392);
    float _400 = _394 * _380;
    float _402 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _388);
    float _404 = _396 * _384;
    float _406 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].z, _398);
    float _408 = _402 * _382;
    float _410 = _294 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _412 = _406 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _414 = _408 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _416 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[4].x, _410);
    float _418 = _408 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _420 = _408 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _422 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[10].x, _414);
    float _424 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].z, _416);
    float _426 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[8].x, _418);
    float _428 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[9].x, _420);
    float _430 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[10].z, _422);
    float _432 = _424 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _434 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[8].z, _426);
    float _436 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[9].z, _428);
    float _438 = _412 + _430;
    float _440 = _432 + _434;
    float _442 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _444 = _438 + _442;
    float _446 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _448 = _440 + _446;
    float _450 = _444 * _444;
    float _452 = fma(_448, _448, _450);
    float _454 = _294 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _456 = sqrt(_452);
    float _458 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[5].x, _454);
    float _460 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].z, _458);
    float _462 = _460 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _464 = _462 + _436;
    bool _466 = _456 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _468 = _460;
    float _470 = _436;
    float _472 = _404;
    float _474 = _444;
    float _476 = _438;
    int _478 = as_type<int>(_462);
    float _480 = _336;
    float _482 = _334;
    float _484 = _338;
    if (!_466)
    {
        _468 = _440;
    }
    float _486 = _468;
    float _488 = _486;
    if (!_466)
    {
        _470 = _438;
    }
    float _490 = _470;
    float _492 = _490;
    if (!_466)
    {
        _472 = _464;
    }
    float _494 = _472;
    bool _496 = !_466;
    float _498 = _494;
    if (!_496)
    {
        float _500 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _502 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _504 = _456 + _502;
        float _506 = _464 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _508 = rsqrt(_452);
        float _510 = _504 * _500;
        float _512 = _510 * 0.15915493667125701904296875;
        float _514 = _512 * 6.283185482025146484375;
        float _516 = cos(_514);
        float _518 = _512 * 6.283185482025146484375;
        float _520 = sin(_518);
        float _522 = _516 + (-1.0);
        float _524 = _522 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _526 = fma(_520, _506, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _528 = fma(_464, _516, _524);
        float _530 = _508 * _526;
        float _532 = fma(_448, _530, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _534 = fma(_444, _530, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _498 = _528;
        _488 = _532;
        _492 = _534;
    }
    float _536 = _498;
    float _538 = _488;
    float _540 = _492;
    float _542 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _544 = _536 + _542;
    float _546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _548 = _538 + _546;
    float _550 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _552 = _540 + _550;
    float _554 = _544 * _544;
    float _556 = fma(_548, _548, _554);
    float _558 = fma(_552, _552, _556);
    float _560 = rsqrt(_558);
    float _562 = _560 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _564 = _548 * _562;
    float _566 = _552 * _562;
    float _568 = _564 * _564;
    float _570 = _566 * _566;
    float _572 = _568 + _570;
    float _574 = sqrt(_572);
    bool _576 = _574 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _578 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _580 = _574 + _578;
    float _582 = _552;
    float _584 = _572;
    float _586 = _580;
    float _588 = _544;
    if (_576)
    {
        float _590 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _582 = _590;
    }
    float _592 = _582;
    if (_576)
    {
        float _594 = rsqrt(_572);
        _584 = _594;
    }
    float _596 = _584;
    float _598 = _596;
    if (_576)
    {
        float _600 = _580 * _592;
        _586 = _600;
    }
    float _602 = _586;
    if (_576)
    {
        float _604 = _602 * 0.15915493667125701904296875;
        _474 = _604;
    }
    float _606 = _474;
    float _608 = _560;
    if (_576)
    {
        float _610 = _606 * 6.283185482025146484375;
        float _612 = sin(_610);
        _608 = _612;
    }
    float _614 = _608;
    float _616 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _618 = precise::max(0.0, _616);
    float _620 = _554;
    float _622 = _618;
    float _624 = _616;
    if (_576)
    {
        float _626 = _606 * 6.283185482025146484375;
        float _628 = cos(_626);
        _620 = _628;
    }
    float _630 = _620;
    float _632 = -_562;
    float _634 = -_618;
    float _636 = fma(_544, _632, _634);
    if (!_576)
    {
        _588 = _566;
    }
    float _638 = _588;
    float _640 = _638;
    if (_576)
    {
        float _642 = _636 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _622 = _642;
    }
    float _644 = _622;
    float _646 = _644;
    float _648 = _614;
    if (_576)
    {
        float _650 = fma(_614, _644, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _646 = _650;
    }
    float _652 = _646;
    float _654 = _652;
    if (!_576)
    {
        _648 = _564;
    }
    float _656 = _648;
    float _658 = _656;
    float _660 = _630;
    if (_576)
    {
        float _662 = _630 + (-1.0);
        _624 = _662;
    }
    float _664 = _624;
    float _666 = 0.0;
    if (_576)
    {
        float _668 = _596 * _652;
        _666 = _668;
    }
    float _670 = _666;
    if (!_576)
    {
        _654 = _636;
    }
    float _672 = _654;
    float _674 = _672;
    if (_576)
    {
        float _676 = _664 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _476 = _676;
    }
    float _678 = _476;
    if (_576)
    {
        float _680 = _564 * _670;
        _658 = _680;
    }
    float _682 = _658;
    float _684 = sqrt(_558);
    if (!_576)
    {
        _598 = _568;
    }
    float _686 = _598;
    float _688 = _686;
    if (_576)
    {
        float _690 = fma(_636, _630, _678);
        _674 = _690;
    }
    float _692 = _674;
    if (_576)
    {
        float _694 = _566 * _670;
        _640 = _694;
    }
    float _696 = _640;
    if (_576)
    {
        float _698 = _682 * _682;
        _688 = _698;
    }
    float _700 = _688;
    if (!_576)
    {
        _660 = _570;
    }
    float _702 = _660;
    float _704 = _702;
    if (_576)
    {
        float _706 = _696 * _696;
        _704 = _706;
    }
    float _708 = _704;
    float _710 = fma(_692, _692, _700);
    float _712 = _536 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _714 = _536 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _716 = _710 + _708;
    float _718 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[2].x, _712);
    float _720 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[1].x, _714);
    float _722 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _724 = fma(_684, (*spvDescriptorSet0.vp_c15)._m0[23].w, _722);
    float _726 = precise::clamp(_724, 0.0, 1.0);
    float _728 = rsqrt(_716);
    float _730 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[2].z, _718);
    float _732 = -_726;
    float _734 = _732 + 1.0;
    float _736 = _536 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _738 = _536 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _740 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[1].z, _720);
    float _742 = _730 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _744 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[0].x, _736);
    float _746 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[3].x, _738);
    float _748 = _740 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _750 = abs(_734);
    float _752 = log2(_750);
    float _754 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[0].z, _744);
    float _756 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[3].z, _746);
    float _758 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _760 = _742 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _762 = _754 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _764 = _728 * _682;
    float _766 = _756 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _768 = _748 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _770 = _728 * _692;
    float _772 = _764 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _774 = _728 * _696;
    float _776 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[7].x, _768);
    float _778 = -_760;
    float _780 = fma(_778, _758, 1.0);
    float _782 = -_772;
    float _784 = fma(_770, (*spvDescriptorSet0.vp_c15)._m0[21].y, _782);
    float _786 = _748 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _788 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[7].z, _776);
    float _790 = log2(_780);
    float _792 = -_774;
    float _794 = fma(_792, (*spvDescriptorSet0.vp_c15)._m0[21].z, _784);
    float _796 = _752 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _798 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[7].w, _788);
    float _800 = _748 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _802 = fma(_794, -0.5, 0.5);
    float _804 = fma(_794, 0.5, 0.5);
    float _806 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[5].x, _786);
    float _808 = 1.0 / _798;
    float _810 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[4].x, _800);
    float _812 = fma(_804, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _814 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[5].z, _806);
    float _816 = _770 + 1.0;
    float _818 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[4].z, _810);
    float _820 = fma(_804, _812, -0.212114393711090087890625);
    float _822 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[5].w, _814);
    float _824 = sqrt(_802);
    float _826 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[4].w, _818);
    float _828 = _790 * 0.693147182464599609375;
    float _830 = fma(_804, _820, 1.570728778839111328125);
    float _832 = _828 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _834 = exp2(_796);
    float _836 = _826 * _808;
    float _838 = _822 * _808;
    float _840 = fma(_838, -0.5, 0.5);
    float _842 = _824 * 0.636619746685028076171875;
    float _844 = fma(_836, 0.5, 0.5);
    float _846 = -_830;
    float _848 = fma(_842, _846, 1.0);
    float _850 = -_770;
    float _852 = fma(_834, _816, _850);
    float3 _3157 = float3(_844, _840, _832);
    float _854 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3157, float3(0.0), isnan(_3157)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3157, float3(0.0), isnan(_3157)), level(0.0)).x;
    float3 _3168 = float3(_844, _840, _832);
    float4 _857 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3168, float3(0.0), isnan(_3168)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3168, float3(0.0), isnan(_3168)), level(0.0)).xyzw;
    float _859 = _857.x;
    float _861 = _857.y;
    float _863 = _857.z;
    float _865 = _857.w;
    float _867 = fma(_852, 0.5, 0.5);
    float2 _3187 = float2(_848, _867);
    float3 _871 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3187, float2(0.0), isnan(_3187)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3187, float2(0.0), isnan(_3187)), level(0.0)).xyz;
    float _873 = _871.x;
    float _875 = _871.y;
    float _877 = _871.z;
    float _879 = in.m_59.w;
    float _881 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _883 = in.m_59.y;
    float _885 = _752 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _887 = in.m_59.x;
    float _889 = in.m_59.z;
    float _891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _895 = _893 != 0;
    float _897 = in.m_51.x;
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _901 = _899 != 0;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _905 = _748 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _909 = _907 != 0;
    float _911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _915 = _913 != 0;
    float _917 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[6].x, _905);
    bool _919 = _879 > 0.5;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _927 = _925 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _929 = _883 > 0.5;
    float _931 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[6].z, _917);
    float _933 = 1.0 / _923;
    float _935 = _891 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _937 = _929 ? as_type<int>(_368) : as_type<int>(_160);
    float _939 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[6].w, _931);
    int _941 = _919 ? as_type<int>(_368) : as_type<int>(_160);
    out.m_65.x = _538;
    out.m_65.y = _536;
    out.m_65.z = _540;
    float _943 = _895 ? as_type<float>(_937) : _160;
    float _945 = 1.0 / _927;
    float _947 = _887 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _951 = _949 != 0;
    int _953 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _955 = _953 != 0;
    float _957 = -_903;
    float _959 = fma(_947, 2.0, _957);
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _961;
    float _965 = _901 ? as_type<float>(_941) : _160;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _973 = _326 + _971;
    float _975 = _963 * _933;
    bool _977 = _889 > 0.5;
    float _979 = _883 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _983 = _981 != 0;
    float _985 = fma(_975, _973, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _987 = _881 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _989 = _969 * _945;
    float _991 = fma(_987, _943, -0.5);
    float _993 = _965;
    bool _995 = _951;
    float _997 = _979;
    float _999 = _897;
    float _1001 = _889;
    float _1003 = _883;
    float _1005 = _798;
    float _1007 = _939;
    float _1009 = _822;
    float _1011 = _826;
    if (_951)
    {
        float _1013 = _977 ? _368 : _160;
        _220 = _1013;
    }
    float _1015 = _220;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1019 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1021 = isnan(_326);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1027 = _1023 || _1025;
    float _1029 = float(_1027);
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1035 = _326 + _1033;
    bool _1037 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1039 = isnan(_326);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1045 = _1041 || _1043;
    float _1047 = float(_1045);
    float _1049 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1017);
    float _1051 = -_1029;
    float _1053 = _1051 + 1.0;
    float _1055 = fma(_979, -2.0, _1031);
    float _1057 = fma(_965, _935, -0.5);
    int _1059 = as_type<int>(_1049);
    if (_955)
    {
        _993 = _887;
    }
    float _1061 = _993;
    float _1063 = fma(_989, _1035, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1065 = _1061;
    if (!_955)
    {
        _1065 = _889;
    }
    float _1067 = _1065;
    float _1069 = _1047 * _1053;
    bool _1071 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1073 = isnan(_326);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1049);
    float _1085 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1055);
    float _1087 = -_1047;
    float _1089 = _1087 + 1.0;
    float _1091 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1093 = _911 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1095 = -_1085;
    float _1097 = fma(_1083, _991, _1095);
    float _1099 = _462 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1101 = _462 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1103 = _1081 * _1089;
    float _1105 = fma(_1093, _1015, -0.5);
    int _1107 = as_type<int>(_1103);
    float _1109 = _1105;
    if (_909)
    {
        float _1111 = -_897;
        float _1113 = _1111 + 1.0;
        _478 = as_type<int>(_1113);
    }
    int _1115 = _478;
    float _1117 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1099);
    float _1119 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1101);
    float _1121 = _985 * _1103;
    if (_909)
    {
        bool _1123 = _887 > 0.5;
        _995 = _1123;
    }
    bool _1125 = _995;
    if (_915)
    {
        float _1127 = -_897;
        float _1129 = _1127 + 1.0;
        _1107 = as_type<int>(_1129);
    }
    int _1131 = _1107;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[83].z;
    float _1135 = as_type<float>(_1131);
    if (_983)
    {
        float _1137 = -_897;
        float _1139 = _1137 + 1.0;
        _1059 = as_type<int>(_1139);
    }
    int _1141 = _1059;
    if (!_909)
    {
        _997 = _897;
    }
    float _1143 = _997;
    float _1145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1147 = _1143;
    if (_909)
    {
        float _1149 = _1125 ? as_type<float>(_1115) : _897;
        _1147 = _1149;
    }
    float _1151 = _1147;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1157 = _1153;
    if (!_915)
    {
        _1133 = _897;
    }
    float _1159 = _1133;
    float _1161 = -_1081;
    float _1163 = _1161 + 1.0;
    float _1165 = _1159;
    if (_915)
    {
        float _1167 = _977 ? as_type<float>(_1131) : _897;
        _1165 = _1167;
    }
    float _1169 = _1165;
    float _1171 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1153);
    float _1173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_983)
    {
        float _1175 = _929 ? as_type<float>(_1141) : _897;
        _999 = _1175;
    }
    float _1177 = _999;
    float _1179 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1121);
    float _1181 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1117);
    float _1183 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1119);
    if (!_955)
    {
        _1157 = _883;
    }
    float _1185 = _1157;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1189 = _1185;
    if (_955)
    {
        _1189 = _887;
    }
    float _1191 = _1189;
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1195 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1187);
    if (!_955)
    {
        _1135 = _889;
    }
    float _1197 = _1135;
    float _1199 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1155);
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1203 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1205 = _1197;
    if (_955)
    {
        _1001 = _883;
    }
    float _1207 = _1001;
    float _1209 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1193);
    if (_955)
    {
        _1205 = _883;
    }
    float _1211 = _1205;
    float _1213 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_955)
    {
        _1003 = _887;
    }
    float _1215 = _1003;
    float _1217 = -_1201;
    float _1219 = fma(_1203, 2.0, _1217);
    float _1221 = _1173 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1225 = fma(_1063, _1069, _1179);
    float _1227 = fma(_1213, _1151, -0.5);
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1231 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1195);
    float _1233 = -_138;
    float _1235 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[76].x, _959);
    float _1237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1239 = fma(_1221, _1169, -0.5);
    float _1241 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1199);
    float _1243 = -_138;
    float _1245 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1219);
    float _1247 = -_1223;
    float _1249 = fma(_1091, 2.0, _1247);
    float _1251 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1253 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1255 = fma(_1231, _1227, _1235);
    float _1257 = fma(_1241, _1239, _1245);
    float _1259 = fma(_1251, -2.0, _1229);
    float _1261 = -_138;
    float _1263 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1249);
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1267 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1269 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1253);
    bool _1271 = _388 != 0.0;
    bool _1273 = isnan(_388);
    bool _1275 = _1271 || _1273;
    bool _1277 = isnan(0.0);
    bool _1279 = _1275 || _1277;
    float _1281 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1259);
    float _1283 = fma(_1267, -2.0, _1265);
    float _1285 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1269);
    bool _1287 = _386 == 0.0;
    bool _1289 = !_1279;
    bool _1291 = _1287 && _1289;
    float _1293 = _1237 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1295 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1283);
    float _1297 = -_1281;
    float _1299 = fma(_1285, _1057, _1297);
    float _1301 = _1183 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1303 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1305 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[17].y, _336);
    bool _1307 = _390 == 0.0;
    bool _1309 = _1307 && _1291;
    float _1311 = fma(_1293, _1177, -0.5);
    float _1313 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1209);
    float _1315 = 1.0 / _1301;
    float _1317 = _1303 + _1301;
    float _1319 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[17].y, _338);
    float _1321 = fma(_1313, _1311, _1263);
    bool _1323 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1325 = isnan(0.5);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1331 = _1327 || _1329;
    float _1333 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1225);
    float _1335 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1171);
    bool _1337 = !_1309;
    float _1339 = _1337 ? _1319 : _338;
    float _1341 = exp2(_885);
    bool _1343 = !_1309;
    float _1345 = _1343 ? _1305 : _336;
    float _1347 = -_1295;
    float _1349 = fma(_1335, _1105, _1347);
    float _1351 = _1097 + 0.5;
    float _1353 = _1345 * _1345;
    float _1355 = _1317 * _1315;
    float _1357 = _1355 * 0.5;
    float _1359 = _1315;
    float _1361 = _1215;
    float _1363 = _1349;
    if (!_1331)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1365 = _142;
    float _1367 = fma(_1339, _1339, _1353);
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1373 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (!_1331)
    {
        float _1375 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1377 = fma(_1357, _1365, _1375);
        _1359 = _1377;
    }
    float _1379 = _1359;
    float _1381 = rsqrt(_1367);
    float _1383 = _1371 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1385 = _1369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1387 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1389 = _1333 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1391 = _1255 + 0.5;
    out.m_67.x = (*spvDescriptorSet0.vp_c10)._m0[8].x;
    out.m_67.y = (*spvDescriptorSet0.vp_c10)._m0[9].x;
    out.m_67.z = (*spvDescriptorSet0.vp_c10)._m0[10].x;
    float _1393 = _1257 + 0.5;
    float _1395 = _1299 + 0.5;
    if (!_1309)
    {
        _480 = _1305;
    }
    float _1397 = _480;
    out.m_69.x = _1383;
    out.m_69.y = _1385;
    out.m_69.z = _1387;
    out.m_69.w = _1389;
    float _1399 = -_1341;
    float _1401 = _1399 + 1.0;
    if (!_1309)
    {
        float _1403 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[17].y, _334);
        _482 = _1403;
    }
    float _1405 = _482;
    if (!_1309)
    {
        _484 = _1319;
    }
    float _1407 = _484;
    float _1409 = _1345 * _1381;
    out.m_71.x = _1391;
    out.m_71.y = _1351;
    out.m_71.z = _1393;
    out.m_71.w = _1395;
    float _1411 = _1401 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1331)
    {
        _1361 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1413 = _1361;
    float _1415 = _1339 * _1381;
    float _1417 = -(*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1419 = _1409 * _1417;
    float _1421 = _1321 + 0.5;
    float _1423 = _1349 + 0.5;
    float _1425 = _1413;
    if (!_1331)
    {
        float _1427 = -_1413;
        float _1429 = _1427 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1109 = _1429;
    }
    float _1431 = _1109;
    float _1433 = fma(_1415, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1419);
    float _1435 = -(*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1437 = _1409 * _1435;
    float _1439 = -(*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1441 = _1409 * _1439;
    float _1443 = _939 + _798;
    float _1445 = _826 + _798;
    float _1447 = fma(_1415, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1437);
    float _1449 = fma(_1415, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1441);
    float _1451 = _1397 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1453 = _1397 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1455 = _798 * 0.5;
    float _1457 = _1397 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1459 = fma(_1405, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1451);
    float _1461 = fma(_1405, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1453);
    float _1463 = fma(_822, -0.5, _1455);
    float _1465 = fma(_1405, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1457);
    float _1467 = fma(_1407, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1459);
    float _1469 = fma(_1407, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1461);
    float _1471 = fma(_1407, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1465);
    float _1473 = _1443 * 0.5;
    float _1475 = _1445 * 0.5;
    float _1477 = _1379;
    float _1479 = _1433;
    if (!_1331)
    {
        float _1481 = 1.0 / _1379;
        _1477 = _1481;
    }
    float _1483 = _1477;
    out.m_73.x = _1421;
    out.m_73.y = _1423;
    bool _1485 = _684 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1487 = isnan(_684);
    bool _1489 = _1485 || _1487;
    bool _1491 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1493 = _1489 || _1491;
    out.m_75.x = _1475;
    out.m_75.y = _1463;
    out.m_75.z = _1473;
    out.m_75.w = _798;
    float _1495 = _1431;
    if (!_1331)
    {
        float _1497 = 1.0 / _1431;
        _1495 = _1497;
    }
    float _1499 = _1495;
    out.m_77.x = _1467;
    out.m_77.y = _1469;
    out.m_77.z = _1471;
    out.m_79.x = _1433;
    out.m_79.y = _1447;
    out.m_79.z = _1449;
    if (!_1331)
    {
        float _1501 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1503 = -_1413;
        float _1505 = fma(_1483, _1501, _1503);
        _1363 = _1505;
    }
    float _1507 = _1363;
    if (_1331)
    {
        _1425 = 1.0;
    }
    float _1509 = _1425;
    out.gl_Position.x = _826;
    out.gl_Position.y = _822;
    out.gl_Position.z = _939;
    out.gl_Position.w = _798;
    float _1511 = _1509;
    if (!_1331)
    {
        float _1513 = _1507 * _1499;
        float _1515 = precise::clamp(_1513, 0.0, 1.0);
        _1511 = _1515;
    }
    float _1517 = _1511;
    if (!_1493)
    {
        _1479 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1519 = _1479;
    float _1521 = _1517 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1523 = _1519;
    float _1525 = _1519;
    if (!_1493)
    {
        _1005 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1527 = _1005;
    float _1529 = _1527;
    float _1531 = _1527;
    if (!_1493)
    {
        _1007 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1533 = _1007;
    float _1535 = _1533;
    float _1537 = _1533;
    if (!_1493)
    {
        _1009 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1539 = _1009;
    float _1541 = _1539;
    float _1543 = _1539;
    if (!_1493)
    {
        _1011 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1545 = _1011;
    float _1547 = _1411 * _854;
    float _1549 = -_1411;
    float _1551 = _1549 + 1.0;
    float _1553 = _854;
    float _1555 = _1545;
    float _1557 = _1545;
    if (!_1493)
    {
        _1553 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1559 = _1553;
    float _1561 = _865 * _1547;
    float _1563 = _865 * _1551;
    float _1565 = _877 * _1547;
    float _1567 = fma(_873, _1561, _859);
    float _1569 = fma(_875, _1561, _861);
    float _1571 = fma(_865, _1565, _863);
    out.m_81.x = _1567;
    out.m_81.y = _1569;
    out.m_81.z = _1571;
    out.m_81.w = _1563;
    bool _1573 = !_1493;
    float _1575 = _1559;
    float _1577 = _1559;
    if (!_1573)
    {
        bool _1579 = _684 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1581 = isnan(_684);
        bool _1583 = _1579 || _1581;
        bool _1585 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1587 = _1583 || _1585;
        if (!_1587)
        {
            float _1589 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1591 = _684 + _1589;
            float _1593 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1595 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1593;
            float _1597 = 1.0 / _1595;
            float _1599 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1601 = _1599 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1603 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1605 = _1603 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1609 = _1607 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1611 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1613 = _1611 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1617 = _1615 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1619 = _1591 * _1597;
            float _1621 = precise::clamp(_1619, 0.0, 1.0);
            float _1623 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1625 = _1623 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1627 = fma(_1621, _1601, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1629 = fma(_1621, _1625, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1631 = fma(_1621, _1605, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1633 = fma(_1621, _1609, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1635 = fma(_1621, _1613, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1637 = fma(_1621, _1617, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1531 = _1629;
            _1557 = _1635;
            _1525 = _1627;
            _1543 = _1633;
            _1537 = _1631;
            _1577 = _1637;
            _1639 = true;
        }
        else
        {
            bool _1641 = _684 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1643 = isnan(_684);
            bool _1645 = _1641 || _1643;
            bool _1647 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1649 = _1645 || _1647;
            if (!_1649)
            {
                _1523 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1651 = _1523;
            _1525 = _1651;
            if (!_1649)
            {
                _1529 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1653 = _1529;
            _1531 = _1653;
            if (!_1649)
            {
                _1535 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1655 = _1535;
            _1537 = _1655;
            if (!_1649)
            {
                _1541 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1657 = _1541;
            _1543 = _1657;
            if (!_1649)
            {
                _1555 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1659 = _1555;
            _1557 = _1659;
            if (!_1649)
            {
                _1575 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1661 = _1575;
            bool _1663 = !_1649;
            _1577 = _1661;
            if (!_1663)
            {
                bool _1665 = _684 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1667 = isnan(_684);
                bool _1669 = _1665 || _1667;
                bool _1671 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1673 = _1669 || _1671;
                if (!_1673)
                {
                    float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1677 = _684 + _1675;
                    float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1681 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1679;
                    float _1683 = 1.0 / _1681;
                    float _1685 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1687 = _1685 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1689 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1691 = _1689 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1699 = _1697 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1705 = _1677 * _1683;
                    float _1707 = precise::clamp(_1705, 0.0, 1.0);
                    float _1709 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1711 = _1709 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1713 = fma(_1707, _1687, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1715 = fma(_1707, _1711, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1717 = fma(_1707, _1691, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1719 = fma(_1707, _1695, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1721 = fma(_1707, _1699, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1723 = fma(_1707, _1703, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1531 = _1715;
                    _1557 = _1721;
                    _1525 = _1713;
                    _1543 = _1719;
                    _1537 = _1717;
                    _1577 = _1723;
                    _1639 = true;
                }
                else
                {
                    _1531 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1557 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1525 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1543 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1537 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1577 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1639 = false;
    float _1725 = _1531;
    float _1727 = _1557;
    float _1729 = _1525;
    float _1731 = _1543;
    float _1733 = _1537;
    float _1735 = _1577;
    float _1737 = fma(_1469, -0.5, 0.5);
    float _1739 = precise::clamp(_1737, 0.0, 1.0);
    float _1741 = -_1725;
    float _1743 = _1741 + _1727;
    float _1745 = _1521 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1747 = -_1729;
    float _1749 = _1747 + _1731;
    out.m_83.x = 0.0;
    float _1751 = fma(_1739, _1743, _1725);
    float _1753 = fma(_1739, _1749, _1729);
    out.m_47.x = _1745;
    float _1755 = -_1733;
    float _1757 = _1755 + _1735;
    float _1759 = _1751 * 0.586610972881317138671875;
    bool _1761 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1763 = fma(_1739, _1757, _1733);
    float _1765 = fma(_1753, 0.298911988735198974609375, _1759);
    bool _1767 = _1517 > 0.0;
    bool _1769 = isnan(_1517);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan(0.0);
    bool _1775 = _1771 || _1773;
    float _1777 = fma(_1763, 0.114477999508380889892578125, _1765);
    float _1779 = -_1777;
    float _1781 = _1753 + _1779;
    float _1783 = -_1777;
    float _1785 = _1751 + _1783;
    float _1787 = -_1777;
    float _1789 = _1763 + _1787;
    float _1791 = fma(_1781, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1777);
    float _1793 = fma(_1785, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1777);
    float _1795 = fma(_1789, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1777);
    bool _1797 = !_1761;
    if (!_1797)
    {
        float _1799 = -_536;
        float _1801 = _1799 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1803 = -_538;
        float _1805 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1807 = -_540;
        float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1811 = _1801 * _1801;
        float _1813 = fma(_1805, _1805, _1811);
        float _1815 = fma(_1809, _1809, _1813);
        float _1817 = sqrt(_1815);
        float _1819 = rsqrt(_1815);
        float _1821 = -_1817;
        float _1823 = _1821 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1825 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1827 = precise::clamp(_1825, 0.0, 1.0);
        float _1829 = _1805 * _1819;
        float _1831 = _1801 * _1819;
        float _1833 = abs(_1827);
        float _1835 = log2(_1833);
        float _1837 = _1809 * _1819;
        float _1839 = _1829 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1841 = _1469 * _1831;
        float _1843 = -_1831;
        float _1845 = -_1839;
        float _1847 = fma(_1843, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1845);
        float _1849 = fma(_1467, _1829, _1841);
        float _1851 = -_1837;
        float _1853 = fma(_1851, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1847);
        float _1855 = fma(_1471, _1837, _1849);
        float _1857 = precise::clamp(_1855, 0.0, 1.0);
        float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1861 = _1853 + _1859;
        float _1863 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1865 = _1861 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1867 = precise::clamp(_1865, 0.0, 1.0);
        float _1869 = exp2(_1863);
        float _1871 = _1869 * _1867;
        float _1873 = _1857 * _1871;
        float _1875 = _1873 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1877 = _1873 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1879 = _1873 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_83.x = _1875;
        out.m_83.y = _1877;
        out.m_83.z = _1879;
    }
    out.m_85.x = _1791;
    out.m_85.y = _1793;
    out.m_85.z = _1795;
    if (_1775)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1881 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1881;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

