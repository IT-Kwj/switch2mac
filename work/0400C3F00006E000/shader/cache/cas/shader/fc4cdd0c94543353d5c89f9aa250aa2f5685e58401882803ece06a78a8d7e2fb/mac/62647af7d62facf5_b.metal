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
    float4 m_51 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_91 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
    float4 m_81 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_69 [[user(locn9)]];
    float4 m_75 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
    float4 m_89 [[user(locn12)]];
    float4 m_85 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_65 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_71 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
    float4 m_61 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2275 = false;
    bool _212 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_44.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (!_114)
    {
        out.m_47.x = 0.0;
    }
    int _120 = 0;
    if (!_114)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2559 = as_type<float>(_124);
        out.gl_Position.z = _2559;
    }
    if (!_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_49.w;
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
    float _152 = _128;
    float _154 = _134;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2624 = as_type<float>(_160);
        out.gl_Position.z = _2624;
    }
    if (_150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _164 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _166 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _168 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _170 = _162 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _174 = _164 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _178 = _166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _180 = _168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _182 = _172 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _184 = _176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _186 = 1.0 / _130;
    out.m_51.x = _170;
    out.m_51.y = _174;
    out.m_51.z = _178;
    bool _188 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    out.m_53.x = _180;
    out.m_53.y = _182;
    out.m_53.z = _184;
    float _190 = _134 * _186;
    bool _192 = !_188;
    float _210;
    if (!_192)
    {
        float _194 = in.m_55.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[14].x, _134);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        _210 = _190;
    }
    _212 = false;
    float _214 = _210;
    float _216 = in.m_57.x;
    float _218 = in.m_57.y;
    float _220 = in.m_57.z;
    float _222 = in.m_55.z;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _226 = _224 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _230 = _228 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _232 = 1.0 / _226;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _242 = in.m_55.y;
    int _244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _246 = _244 != 0;
    float _248 = 1.0 / _230;
    float _250 = in.m_59.x;
    float _252 = _218 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _254 = 1.0 / _236;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _258 = _256 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _260 = _216 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _262;
    bool _266 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _268 = isnan(_214);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = _252 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _282 = _280 != 0;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _286 = _284 != 0;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _290 = _288 != 0;
    float _292 = 1.0 / _240;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _298 = _260 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _300 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _302 = isnan(_214);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _314 = 1.0 / _258;
    float _316 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _312);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _326 = _220 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _328 = 1.0 / _296;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _330;
    float _334 = _222 * 2.0;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _336;
    float _340 = _320 * _232;
    float _342 = _242 * 2.0;
    float _344 = _332 * _248;
    float _346 = 1.0 / _324;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _356 = _338 * _314;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _360 = _214 + _358;
    float _362 = _354 * _292;
    float _364 = _326 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _366 = floor(_334);
    float _368 = _350 * _254;
    float _370 = _242 + _222;
    float _372 = fma((*spvDescriptorSet0.vp_c8)._m0[2].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _316);
    float _374 = _370 + (-1.0);
    float _376 = _372 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _378 = floor(_342);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _384 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _386 = in.m_61.x;
    float _388 = in.m_61.y;
    float _390 = in.m_61.z;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _394 = _214 + _392;
    float _396 = _382 * _328;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _400 = _214 + _398;
    float _402 = _264 * _346;
    bool _404 = _366 > 0.0;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _408 = _214 + _406;
    bool _410 = _366 >= 0.0;
    bool _412 = isnan(_366);
    bool _414 = _410 || _412;
    bool _416 = isnan(0.0);
    bool _418 = _414 || _416;
    float _420 = fma(_344, _394, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _424 = _214 + _422;
    float _426 = fma(_340, _400, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _428 = _418 ? 0 : 1;
    float _430 = fma(_368, _424, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _432 = fma(_362, _360, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _434 = fma(_356, _408, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _436 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _438 = isnan(_214);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _444 = _440 || _442;
    float _446 = float(_444);
    bool _448 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _450 = isnan(_214);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    bool _460 = _378 > 0.0;
    float _462 = -_446;
    float _464 = _462 + 1.0;
    bool _466 = _378 >= 0.0;
    bool _468 = isnan(_378);
    bool _470 = _466 || _468;
    bool _472 = isnan(0.0);
    bool _474 = _470 || _472;
    float _476 = -_458;
    float _478 = _476 + 1.0;
    float _480 = _386 * 12.98980045318603515625;
    int _482 = ~_428;
    int _484 = _482 + 1;
    int _486 = _484 + 1;
    float _488 = _458 * _464;
    int _490 = _486;
    float _492 = _420;
    float _494 = _214;
    if (!_404)
    {
        int _496 = ~_428;
        int _498 = _496 + 1;
        _490 = _498;
    }
    int _500 = _490;
    float _502 = fma(_388, 78.233001708984375, _480);
    bool _504 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _506 = isnan(_214);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = fma(_390, 78.233001708984375, _480);
    float _518 = _388 * 12.98980045318603515625;
    float _520 = _502 * 0.15915493667125701904296875;
    bool _522 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _524 = isnan(_214);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = _516 * 0.15915493667125701904296875;
    float _536 = _514 * _478;
    float _538 = -_514;
    float _540 = _538 + 1.0;
    float _542 = fma(_386, 78.233001708984375, _518);
    float _544 = _520 * 6.283185482025146484375;
    float _546 = sin(_544);
    float _548 = in.m_55.x;
    float _550 = _532 * _540;
    float _552 = -_532;
    float _554 = _552 + 1.0;
    float _556 = _542 * 0.15915493667125701904296875;
    float _558 = -_276;
    float _560 = _558 + 1.0;
    bool _562 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _564 = isnan(_214);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = _276 * _554;
    float _576 = _534 * 6.283185482025146484375;
    float _578 = sin(_576);
    float _580 = fma(_390, 78.233001708984375, _518);
    bool _582 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _584 = isnan(_214);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = _572 * _560;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _598 = _596 != 0;
    float _600 = -_572;
    float _602 = _600 + 1.0;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _606 = _214 + _604;
    float _608 = _556 * 6.283185482025146484375;
    float _610 = sin(_608);
    float _612 = _580 * 0.15915493667125701904296875;
    float _614 = _592 * _602;
    float _616 = -_592;
    float _618 = _616 + 1.0;
    float _620 = fma(_396, _606, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _622 = _546 * 43758.546875;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _626 = _214 + _624;
    float _628 = _310 * _618;
    float _630 = _578 * 43758.546875;
    float _632 = -_310;
    float _634 = _632 + 1.0;
    float _636 = _606;
    float _638 = _634;
    if (!_598)
    {
        _636 = _250;
    }
    float _640 = _636;
    float _642 = _420 * _628;
    float _644 = floor(_630);
    float _646 = fma(_402, _626, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _648 = _640;
    if (!_598)
    {
        _492 = _640;
    }
    float _650 = _492;
    float _652 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[159].x, _642);
    float _654 = _610 * 43758.546875;
    float _656 = _650;
    if (_598)
    {
        _648 = _250;
    }
    float _658 = _648;
    if (_246)
    {
        _638 = _242;
    }
    float _660 = _638;
    float _662 = floor(_622);
    float _664 = fma(_426, _614, _652);
    float _666 = _660;
    float _668 = _548;
    if (!_246)
    {
        _666 = _548;
    }
    float _670 = _666;
    if (_246)
    {
        _494 = _548;
    }
    float _672 = _494;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _676 = -_376;
    float _678 = precise::max(_676, 1.0);
    float _680 = floor(_654);
    float _682 = -_644;
    float _684 = _630 + _682;
    float _686 = _670 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _688 = _672;
    if (!_246)
    {
        _688 = _222;
    }
    float _690 = _688;
    float _692 = _222 + _548;
    float _694 = precise::min(_678, 4.0);
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _698 = _612 * 6.283185482025146484375;
    float _700 = sin(_698);
    float _702 = _690 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _704 = _474 ? 0 : 1;
    float _706 = fma(_686, -2.0, _674);
    float _708 = -_662;
    float _710 = _622 + _708;
    float _712 = fma(_694, 0.3333333432674407958984375, -0.3333333432674407958984375);
    float _714 = -_696;
    float _716 = fma(_702, 2.0, _714);
    float _718 = _242 + _548;
    float _720 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _722 = log2(_720);
    float _724 = -_680;
    float _726 = _654 + _724;
    float _728 = _692 + (-1.0);
    int _730 = ~_704;
    int _732 = _730 + 1;
    int _734 = _732 + 1;
    float _736 = _718 + (-1.0);
    bool _738 = !_282;
    int _740 = _738 ? 0 : 1;
    float _742 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _744 = _700 * 43758.546875;
    int _746 = _734;
    if (!_460)
    {
        int _748 = ~_704;
        int _750 = _748 + 1;
        _746 = _750;
    }
    int _752 = _746;
    float _754 = fma(_430, _594, _664);
    float _756 = floor(_744);
    bool _758 = !_290;
    int _760 = _758 ? 0 : 1;
    int _762 = abs(_740);
    float _764 = _722 * _134;
    int _766 = abs(_760);
    float _768 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _770 = exp2(_764);
    float _772 = fma(_432, _574, _754);
    float _774 = float(_762);
    float _776 = float(_500);
    float _778 = fma(_434, _550, _772);
    float _780 = -_756;
    float _782 = _744 + _780;
    float _784 = _548 * 2.0;
    float _786 = _774 * _776;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _790 = 1.0 + _788;
    float _792 = float(_766);
    float _794 = fma(_620, _536, _778);
    float _796 = float(_752);
    float _798 = 1.0 / _790;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _802 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _804 = isnan(1.0);
    bool _806 = _802 || _804;
    bool _808 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _810 = _806 || _808;
    float _812 = _792 * _796;
    float _814 = -_770;
    float _816 = _814 + 1.0;
    float _818 = in.m_63.x;
    float _820 = in.m_63.y;
    float _822 = in.m_63.z;
    float _824 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[88].z, _800);
    float _826 = floor(_784);
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _830 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _832 = isnan(0.0);
    bool _834 = _830 || _832;
    bool _836 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _838 = _834 || _836;
    float _840 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _824);
    float _842 = _710 + _658;
    float _844 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[88].w, _828);
    float _846 = _838 ? _816 : 0.0;
    float _848 = -_134;
    float _850 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[86].x, _716);
    float _852 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[86].y, _706);
    float _854 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].w, _844);
    float _856 = fma(_134, 0.02500000037252902984619140625, _842);
    if (_810)
    {
        float _858 = _846 * _798;
        _154 = _858;
    }
    float _860 = _154;
    float _862 = _726 * _726;
    float _864 = _812 * (-2.0);
    float _866 = _856 * 16.0;
    float _868 = fma(_646, _488, _794);
    bool _870 = _826 > 0.0;
    float _872 = fma(_684, _684, _862);
    bool _874 = _826 >= 0.0;
    bool _876 = isnan(_826);
    bool _878 = _874 || _876;
    bool _880 = isnan(0.0);
    bool _882 = _878 || _880;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _886 = 1.0 + _884;
    float _888 = _548 + (-0.5);
    float _890 = fma(_782, _782, _872);
    int _892 = _882 ? 0 : 1;
    float _894 = fma(_190, _886, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    float _896 = fma(_864, _822, _822);
    float _898 = fma(_742, _864, _742);
    float _900 = _222 + (-0.5);
    float _902 = fma(_710, 0.4000000059604644775390625, _894);
    float _904 = precise::clamp(_902, 0.0, 1.0);
    float _906 = rsqrt(_890);
    int _908 = ~_892;
    int _910 = _908 + 1;
    int _912 = _910 + 1;
    float _914 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[196].z, _896);
    int _916 = _912;
    if (!_870)
    {
        int _918 = ~_892;
        int _920 = _918 + 1;
        _916 = _920;
    }
    int _922 = _916;
    float _924 = _786 * (-2.0);
    float _926 = _904 * _904;
    float _928 = _866 * 0.15915493667125701904296875;
    float _930 = fma(_710, -0.4000000059604644775390625, 1.0);
    float _932 = in.m_65.x;
    float _934 = in.m_65.y;
    float _936 = in.m_65.z;
    float _938 = fma(_924, _818, _818);
    float _940 = -_926;
    float _942 = fma(_940, _926, 1.0);
    float _944 = fma(_768, _924, _768);
    float _946 = -_190;
    float _948 = fma(_946, _930, 1.0);
    float _950 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[196].x, _938);
    float _952 = _942 * _712;
    bool _954 = !_286;
    int _956 = _954 ? 0 : 1;
    float _958 = _726 * _906;
    float _960 = fma(_944, _860, _950);
    int _962 = abs(_956);
    float _964 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[166].x, _868);
    float _966 = -_948;
    float _968 = fma(_966, _948, 1.0);
    float _970 = fma(_684, 2.0, -1.0);
    float _972 = in.m_67.x;
    float _974 = in.m_67.y;
    float _976 = in.m_67.z;
    float _978 = _684 * _906;
    float _980 = _782 * _906;
    float _982 = _960 * 0.15915493667125701904296875;
    float _984 = _958 * _958;
    float _986 = float(_962);
    float _988 = _930 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _990 = float(_922);
    float _992 = _928 * 6.283185482025146484375;
    float _994 = sin(_992);
    float _996 = _968 * _386;
    float _998 = fma(_978, _978, _984);
    float _1000 = _964 * _970;
    float _1002 = _1000 * 4.0;
    float _1004 = _986 * _990;
    float _1006 = fma(_996, _988, _386);
    float _1008 = _968 * _388;
    float _1010 = fma(_980, _980, _998);
    float _1012 = _1004 * (-2.0);
    float _1014 = fma(_996, _988, _932);
    float _1016 = _1002 * 0.15915493667125701904296875;
    float _1018 = fma(_1008, _988, _388);
    float _1020 = fma(_1008, _988, _934);
    float _1022 = _968 * _390;
    float _1024 = fma(_1012, _820, _820);
    float _1026 = rsqrt(_1010);
    float _1028 = fma(_898, _860, _914);
    float _1030 = fma(_1022, _988, _390);
    float _1032 = _242 + (-0.5);
    float _1034 = fma(_1022, _988, _936);
    float _1036 = _994 * 0.119999997317790985107421875;
    float _1038 = fma(_384, _1012, _384);
    float _1040 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1024);
    float _1042 = _1016 * 6.283185482025146484375;
    float _1044 = cos(_1042);
    float _1046 = fma(_976, _1036, _1034);
    float _1048 = fma(_972, _1036, _1014);
    float _1050 = fma(_974, _1036, _1020);
    float _1052 = fma(_1038, _860, _1040);
    float _1054 = -_1030;
    float _1056 = _1054 + _1046;
    float _1058 = -_1006;
    float _1060 = _1058 + _1048;
    float _1062 = -_1018;
    float _1064 = _1062 + _1050;
    float _1066 = _1016 * 6.283185482025146484375;
    float _1068 = sin(_1066);
    float _1070 = _952 * _1056;
    float _1072 = _952 * _1060;
    float _1074 = _952 * _1064;
    float _1076 = _978 * _1026;
    float _1078 = _980 * _1026;
    float _1080 = _958 * _1026;
    float _1082 = _1052 * 0.15915493667125701904296875;
    float _1084 = -_1044;
    float _1086 = _1084 + 1.0;
    float _1088 = _1028 * 0.15915493667125701904296875;
    float _1090 = _982 * 6.283185482025146484375;
    float _1092 = sin(_1090);
    float _1094 = _1076 * _1086;
    float _1096 = _1080 * _1086;
    float _1098 = _1078 * _1068;
    float _1100 = _1076 * _1068;
    float _1102 = _1080 * _1068;
    float _1104 = _982 * 6.283185482025146484375;
    float _1106 = cos(_1104);
    float _1108 = fma(_1080, _1094, _1098);
    float _1110 = -_1098;
    float _1112 = fma(_1080, _1094, _1110);
    float _1114 = fma(_1080, _1096, _1044);
    float _1116 = fma(_1078, _1096, _1100);
    float _1118 = -_1100;
    float _1120 = fma(_1078, _1096, _1118);
    float _1122 = _1078 * _1078;
    float _1124 = _1074 * _1114;
    float _1126 = -_1102;
    float _1128 = fma(_1078, _1094, _1126);
    float _1130 = fma(_1078, _1094, _1102);
    float _1132 = fma(_1076, _1094, _1044);
    float _1134 = fma(_1086, _1122, _1044);
    float _1136 = _1088 * 6.283185482025146484375;
    float _1138 = cos(_1136);
    float _1140 = fma(_1072, _1108, _1124);
    float _1142 = _1074 * _1112;
    float _1144 = _1074 * _1116;
    float _1146 = fma(_1070, _1120, _1140);
    float _1148 = fma(_1072, _1132, _1142);
    float _1150 = fma(_1072, _1128, _1144);
    float _1152 = _1082 * 6.283185482025146484375;
    float _1154 = sin(_1152);
    float _1156 = in.m_44.x;
    float _1158 = in.m_44.y;
    float _1160 = in.m_44.z;
    float _1162 = _1018 + _1146;
    float _1164 = fma(_1070, _1130, _1148);
    float _1166 = fma(_1070, _1134, _1150);
    bool _1168 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1170 = isnan(0.5);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1176 = _1172 || _1174;
    float _1178 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1162);
    float _1180 = _1006 + _1164;
    float _1182 = _1082 * 6.283185482025146484375;
    float _1184 = cos(_1182);
    float _1186 = _1106 * _1138;
    float _1188 = _1092 * _1138;
    float _1190 = _1178 * _278;
    float _1192 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1180);
    float _1194 = _1186 * _1190;
    float _1196 = _1088 * 6.283185482025146484375;
    float _1198 = sin(_1196);
    float _1200 = _1106 * _1154;
    float _1202 = _1092 * _1154;
    float _1204 = _1154 * _1138;
    float _1206 = _1192 * _298;
    float _1208 = _1188 * _1190;
    float _1210 = _1106 * _1184;
    float _1212 = _1184 * _1138;
    float _1214 = _1030 + _1166;
    float _1216 = _1092 * _1184;
    float _1218 = fma(_1198, _1210, _1202);
    float _1220 = fma(_1198, _1202, _1210);
    float _1222 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1214);
    float _1224 = -_1200;
    float _1226 = fma(_1198, _1216, _1224);
    float _1228 = -_1216;
    float _1230 = fma(_1198, _1200, _1228);
    float _1232 = -_1190;
    float _1234 = _1198 * _1232;
    float _1236 = _1222 * _364;
    float _1238 = fma(_1218, _1206, _1194);
    float _1240 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1242 = fma(_1212, _1206, _1234);
    float _1244 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1246 = fma(_1230, _1236, _1238);
    float _1248 = fma(_1226, _1206, _1208);
    float _1250 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1240);
    float _1252 = fma(_1204, _1236, _1242);
    float _1254 = _1246 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1256 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1244);
    float _1258 = fma(_1220, _1236, _1248);
    float _1260 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1250);
    float _1262 = _1246 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1264 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1254);
    float _1266 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1256);
    float _1268 = _1260 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1270 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1262);
    float _1272 = fma(_1258, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1264);
    float _1274 = _1266 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1276 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1278 = fma(_1258, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1270);
    float _1280 = _1268 + _1272;
    float _1282 = _1246 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1284 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1276);
    float _1286 = _1274 + _1278;
    float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1290 = _1280 + _1288;
    float _1292 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1282);
    float _1294 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1284);
    float _1296 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1298 = _1286 + _1296;
    float _1300 = _1290 * _1290;
    float _1302 = fma(_1258, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1292);
    float _1304 = fma(_1298, _1298, _1300);
    float _1306 = _1294 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1308 = sqrt(_1304);
    float _1310 = _1306 + _1302;
    bool _1312 = _1308 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1314 = _1156;
    float _1316 = _1160;
    float _1318 = _1294;
    float _1320 = _1286;
    float _1322 = _1180;
    float _1324 = _1214;
    float _1326 = _1162;
    if (!_1312)
    {
        _1314 = _1286;
    }
    float _1328 = _1314;
    float _1330 = _1328;
    if (!_1312)
    {
        _1316 = _1280;
    }
    float _1332 = _1316;
    float _1334 = _1332;
    if (!_1312)
    {
        _1318 = _1310;
    }
    float _1336 = _1318;
    bool _1338 = !_1312;
    float _1340 = _1336;
    if (!_1338)
    {
        float _1342 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1346 = _1308 + _1344;
        float _1348 = _1310 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1350 = rsqrt(_1304);
        float _1352 = _1346 * _1342;
        float _1354 = _1352 * 0.15915493667125701904296875;
        float _1356 = _1354 * 6.283185482025146484375;
        float _1358 = cos(_1356);
        float _1360 = _1354 * 6.283185482025146484375;
        float _1362 = sin(_1360);
        float _1364 = _1358 + (-1.0);
        float _1366 = _1364 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1368 = fma(_1362, _1348, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1370 = fma(_1310, _1358, _1366);
        float _1372 = _1350 * _1368;
        float _1374 = fma(_1298, _1372, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1376 = fma(_1290, _1372, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1330 = _1374;
        _1340 = _1370;
        _1334 = _1376;
    }
    float _1378 = _1330;
    float _1380 = _1340;
    float _1382 = _1334;
    float _1384 = _1380;
    float _1386 = _1378;
    float _1388 = _1382;
    if (!_1176)
    {
        float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1392 = _1306 + _1390;
        float _1394 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1396 = _1274 + _1394;
        float _1398 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1400 = -_1274;
        float _1402 = _1400 + _1378;
        float _1404 = _1392 * _1392;
        float _1406 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1408 = _1268 + _1406;
        float _1410 = -_1306;
        float _1412 = _1410 + _1380;
        float _1414 = -_1268;
        float _1416 = _1414 + _1382;
        float _1418 = fma(_1396, _1396, _1404);
        float _1420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1422 = fma(_1408, _1408, _1418);
        float _1424 = sqrt(_1422);
        float _1426 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1428 = precise::min(_1424, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1430 = _1428 * _1420;
        float _1432 = _1426 * _1430;
        float _1434 = fma(_1402, _1432, _1274);
        float _1436 = fma(_1412, _1432, _1306);
        float _1438 = fma(_1416, _1432, _1268);
        _1384 = _1436;
        _1386 = _1434;
        _1388 = _1438;
        _1320 = _1430;
    }
    float _1440 = _1384;
    float _1442 = _1386;
    float _1444 = _1388;
    float _1446 = _1320;
    float _1448 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1450 = _1440 + _1448;
    float _1452 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1454 = _1442 + _1452;
    float _1456 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1458 = _1444 + _1456;
    float _1460 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1462 = _1450 * _1450;
    float _1464 = fma(_1454, _1454, _1462);
    float _1466 = fma(_1458, _1458, _1464);
    float _1468 = rsqrt(_1466);
    float _1470 = sqrt(_1466);
    float _1472 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1474 = _1454 * _1472;
    float _1476 = _1458 * _1472;
    float _1478 = _1474 * _1474;
    float _1480 = _1476 * _1476;
    float _1482 = _1478 + _1480;
    float _1484 = sqrt(_1482);
    bool _1486 = _1484 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1488 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1490 = _1484 + _1488;
    float _1492 = _1458;
    float _1494 = _1482;
    float _1496 = _1490;
    float _1498 = _1446;
    float _1500 = _1472;
    if (_1486)
    {
        float _1502 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1492 = _1502;
    }
    float _1504 = _1492;
    if (_1486)
    {
        float _1506 = rsqrt(_1482);
        _1494 = _1506;
    }
    float _1508 = _1494;
    if (_1486)
    {
        float _1510 = _1490 * _1504;
        _1496 = _1510;
    }
    float _1512 = _1496;
    if (_1486)
    {
        float _1514 = _1512 * 0.15915493667125701904296875;
        _1498 = _1514;
    }
    float _1516 = _1498;
    float _1518 = _1468;
    float _1520 = _1516;
    if (_1486)
    {
        float _1522 = _1516 * 6.283185482025146484375;
        float _1524 = sin(_1522);
        _1518 = _1524;
    }
    float _1526 = _1518;
    float _1528 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1530 = precise::max(0.0, _1528);
    float _1532 = _1462;
    float _1534 = _1530;
    float _1536 = _1528;
    if (_1486)
    {
        float _1538 = _1516 * 6.283185482025146484375;
        float _1540 = cos(_1538);
        _1532 = _1540;
    }
    float _1542 = _1532;
    float _1544 = -_1472;
    float _1546 = -_1530;
    float _1548 = fma(_1450, _1544, _1546);
    float _1550 = _1548;
    if (_1486)
    {
        float _1552 = _1548 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1534 = _1552;
    }
    float _1554 = _1534;
    float _1556 = _1526;
    float _1558 = _1554;
    if (_1486)
    {
        float _1560 = fma(_1526, _1554, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1556 = _1560;
    }
    float _1562 = _1556;
    float _1564 = _1562;
    if (!_1486)
    {
        _1558 = _1478;
    }
    float _1566 = _1558;
    float _1568 = _1566;
    float _1570 = _1542;
    if (_1486)
    {
        float _1572 = _1542 + (-1.0);
        _1536 = _1572;
    }
    float _1574 = _1536;
    float _1576 = _1574;
    if (_1486)
    {
        float _1578 = _1508 * _1562;
        _1500 = _1578;
    }
    float _1580 = _1500;
    if (!_1486)
    {
        _1564 = _1474;
    }
    float _1582 = _1564;
    float _1584 = _1582;
    if (_1486)
    {
        float _1586 = _1574 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1520 = _1586;
    }
    float _1588 = _1520;
    if (_1486)
    {
        float _1590 = _1474 * _1580;
        _1584 = _1590;
    }
    float _1592 = _1584;
    if (!_1486)
    {
        _1576 = _1476;
    }
    float _1594 = _1576;
    float _1596 = _1594;
    if (_1486)
    {
        float _1598 = _1476 * _1580;
        _1596 = _1598;
    }
    float _1600 = _1596;
    if (_1486)
    {
        float _1602 = fma(_1548, _1542, _1588);
        _1550 = _1602;
    }
    float _1604 = _1550;
    if (_1486)
    {
        float _1606 = _1592 * _1592;
        _1568 = _1606;
    }
    float _1608 = _1568;
    if (!_1486)
    {
        _1570 = _1480;
    }
    float _1610 = _1570;
    float _1612 = _1610;
    if (_1486)
    {
        float _1614 = _1600 * _1600;
        _1612 = _1614;
    }
    float _1616 = _1612;
    float _1618 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1620 = fma(_1604, _1604, _1608);
    float _1622 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1618);
    float _1624 = _1620 + _1616;
    float _1626 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1628 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1630 = fma(_1470, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1628);
    float _1632 = precise::clamp(_1630, 0.0, 1.0);
    float _1634 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1622);
    float _1636 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1638 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1626);
    float _1640 = rsqrt(_1624);
    float _1642 = -_1632;
    float _1644 = _1642 + 1.0;
    float _1646 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1636);
    float _1648 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1638);
    float _1650 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1652 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1654 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1646);
    float _1656 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1658 = abs(_1644);
    float _1660 = log2(_1658);
    float _1662 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1650);
    float _1664 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1666 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1668 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1670 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1662);
    float _1672 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1666);
    float _1674 = _1640 * _1592;
    float _1676 = _1640 * _1604;
    float _1678 = _1640 * _1600;
    float _1680 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1672);
    float _1682 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1684 = _1670 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1686 = -_1668;
    float _1688 = fma(_1686, _1460, 1.0);
    float _1690 = -_1682;
    float _1692 = fma(_1676, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1690);
    float _1694 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1680);
    float _1696 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1698 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1700 = -_1678;
    float _1702 = fma(_1700, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1692);
    float _1704 = log2(_1688);
    float _1706 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1708 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1698);
    float _1710 = fma(_1702, -0.5, 0.5);
    float _1712 = fma(_1702, 0.5, 0.5);
    float _1714 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1706);
    float _1716 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1708);
    float _1718 = _1676 + 1.0;
    float _1720 = 1.0 / _1694;
    float _1722 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1714);
    float _1724 = sqrt(_1710);
    float _1726 = _1704 * 0.693147182464599609375;
    float _1728 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1730 = exp2(_1696);
    float _1732 = _1724 * 0.636619746685028076171875;
    float _1734 = fma(_1712, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1736 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1722);
    float _1738 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1716);
    float _1740 = fma(_1712, _1734, -0.212114393711090087890625);
    float _1742 = _1736 * _1720;
    float _1744 = -_1676;
    float _1746 = fma(_1730, _1718, _1744);
    float _1748 = fma(_1712, _1740, 1.570728778839111328125);
    float _1750 = _1738 * _1720;
    float _1752 = fma(_1742, 0.5, 0.5);
    float _1754 = -_1748;
    float _1756 = fma(_1732, _1754, 1.0);
    float _1758 = fma(_1750, -0.5, 0.5);
    float _1760 = fma(_1746, 0.5, 0.5);
    float3 _5125 = float3(_1752, _1758, _1728);
    float _1762 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5125, float3(0.0), isnan(_5125)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5125, float3(0.0), isnan(_5125)), level(0.0)).x;
    float3 _5136 = float3(_1752, _1758, _1728);
    float4 _1765 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5136, float3(0.0), isnan(_5136)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5136, float3(0.0), isnan(_5136)), level(0.0)).xyzw;
    float _1767 = _1765.x;
    float _1769 = _1765.y;
    float _1771 = _1765.z;
    float _1773 = _1765.w;
    float2 _5153 = float2(_1756, _1760);
    float3 _1777 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5153, float2(0.0), isnan(_5153)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5153, float2(0.0), isnan(_5153)), level(0.0)).xyz;
    float _1779 = _1777.x;
    float _1781 = _1777.y;
    float _1783 = _1777.z;
    float _1785 = in.m_59.y;
    bool _1787 = _242 > 0.5;
    float _1789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1793 = _1791 != 0;
    float _1795 = in.m_55.w;
    int _1797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1799 = _1797 != 0;
    int _1801 = 0;
    float _1803 = _1694;
    float _1805 = _1738;
    if (_598)
    {
        float _1807 = -_658;
        float _1809 = _1807 + 1.0;
        _1801 = as_type<int>(_1809);
    }
    int _1811 = _1801;
    int _1813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1815 = _1813 != 0;
    float _1817 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1821 = _1819 != 0;
    float _1823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_69.x = _1442;
    out.m_69.y = _1440;
    out.m_69.z = _1444;
    int _1825 = 0;
    if (_1793)
    {
        float _1827 = -_658;
        float _1829 = _1827 + 1.0;
        _1825 = as_type<int>(_1829);
    }
    int _1831 = _1825;
    float _1833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1835 = 0;
    if (_1815)
    {
        float _1837 = -_658;
        float _1839 = _1837 + 1.0;
        _1835 = as_type<int>(_1839);
    }
    int _1841 = _1835;
    float _1843 = -_1785;
    float _1845 = _1843 + 1.0;
    float _1847 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1849 = _1795 > 0.5;
    int _1851 = _1787 ? as_type<int>(_1845) : as_type<int>(_1785);
    int _1853 = _1849 ? as_type<int>(_1845) : as_type<int>(_1785);
    int _1855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1857 = _1855 != 0;
    float _1859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1861 = _1799 ? as_type<float>(_1851) : _1785;
    float _1863 = _1833 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1865 = _222 > 0.5;
    float _1867 = _1857 ? as_type<float>(_1853) : _1785;
    float _1869 = _1861 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1871 = in.m_71.x;
    float _1873 = in.m_71.y;
    float _1875 = in.m_71.z;
    float _1877 = in.m_71.w;
    float _1879 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1881 = _1857;
    float _1883 = _1785;
    float _1885 = _1845;
    if (_598)
    {
        bool _1887 = _548 > 0.5;
        _1881 = _1887;
    }
    bool _1889 = _1881;
    if (!_1793)
    {
        _668 = _658;
    }
    float _1891 = _668;
    float _1893 = _1891;
    if (_1821)
    {
        float _1895 = _1865 ? _1845 : _1785;
        _1883 = _1895;
    }
    float _1897 = _1883;
    if (_1793)
    {
        float _1899 = _1787 ? as_type<float>(_1831) : _658;
        _1893 = _1899;
    }
    float _1901 = _1893;
    float _1903 = _1789 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (!_1815)
    {
        _1885 = _658;
    }
    float _1905 = _1885;
    float _1907 = fma(_1863, _1897, -0.5);
    float _1909 = _1905;
    if (_1815)
    {
        float _1911 = _1865 ? as_type<float>(_1841) : _658;
        _1909 = _1911;
    }
    float _1913 = _1909;
    float _1915 = fma(_1903, _1901, -0.5);
    float _1917 = _1867 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_598)
    {
        float _1919 = _1889 ? as_type<float>(_1811) : _658;
        _656 = _1919;
    }
    float _1921 = _656;
    float _1923 = _1869 * _1847;
    float _1925 = _1913 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1927 = _1917 * _1823;
    float _1929 = -_1018;
    bool _1931 = _1146 != _1929;
    bool _1933 = isnan(_1146);
    bool _1935 = _1931 || _1933;
    bool _1937 = isnan(_1929);
    bool _1939 = _1935 || _1937;
    float _1941 = _1921 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1943 = _1925 * _1879;
    float _1945 = fma(_840, _1915, _850);
    float _1947 = -_852;
    float _1949 = fma(_854, _1907, _1947);
    float _1951 = _1186 * _1873;
    float _1953 = -_1873;
    float _1955 = _1198 * _1953;
    float _1957 = _1941 * _1859;
    float _1959 = _1188 * _1873;
    float _1961 = fma(_1218, _1871, _1951);
    float _1963 = fma(_1212, _1871, _1955);
    float _1965 = _1180 * _1875;
    out.m_73.x = _1957;
    out.m_73.y = _1923;
    out.m_73.z = _1943;
    out.m_73.w = _1927;
    float _1967 = fma(_1230, _1875, _1961);
    float _1969 = fma(_1204, _1875, _1963);
    float _1971 = fma(_1226, _1871, _1959);
    float _1973 = -_1006;
    bool _1975 = _1164 == _1973;
    bool _1977 = !_1939;
    bool _1979 = _1975 && _1977;
    float _1981 = _1967 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1983 = _1162 * _1871;
    float _1985 = fma(_1220, _1875, _1971);
    float _1987 = -_1965;
    float _1989 = fma(_1214, _1871, _1987);
    float _1991 = fma(_1969, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1981);
    float _1993 = -_1030;
    bool _1995 = _1166 == _1993;
    bool _1997 = _1995 && _1979;
    float _1999 = -_1983;
    float _2001 = fma(_1180, _1873, _1999);
    float _2003 = exp2(_1817);
    float _2005 = _1945 + 0.5;
    float _2007 = _1967 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2009 = _1967 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2011 = fma(_1985, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1991);
    float _2013 = _2001 * _1877;
    float _2015 = fma(_1969, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2007);
    float _2017 = fma(_1969, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2009);
    float _2019 = _1949 + 0.5;
    float _2021 = fma(_1985, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2015);
    float _2023 = fma(_1985, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2017);
    float _2025 = _1214 * _1873;
    float _2027 = _1989 * _1877;
    if (!_1997)
    {
        float _2029 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1180);
        _1322 = _2029;
    }
    float _2031 = _1322;
    if (!_1997)
    {
        float _2033 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1214);
        _1324 = _2033;
    }
    float _2035 = _1324;
    float _2037 = -_2025;
    float _2039 = fma(_1162, _1875, _2037);
    float _2041 = _1186 * _2027;
    float _2043 = -_2027;
    float _2045 = _1198 * _2043;
    out.m_75.x = _2011;
    out.m_75.y = _2021;
    out.m_75.z = _2023;
    float _2047 = _2039 * _1877;
    if (!_1997)
    {
        float _2049 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1162);
        _1326 = _2049;
    }
    float _2051 = _1326;
    float _2053 = -_2003;
    float _2055 = _2053 + 1.0;
    out.m_77.x = _2005;
    out.m_77.y = _2019;
    float _2057 = fma(_1218, _2047, _2041);
    float _2059 = fma(_1212, _2047, _2045);
    float _2061 = _1186 * _2051;
    float _2063 = -_2051;
    float _2065 = _1198 * _2063;
    float _2067 = fma(_1230, _2013, _2057);
    float _2069 = fma(_1204, _2013, _2059);
    float _2071 = fma(_1218, _2031, _2061);
    float _2073 = _1188 * _2027;
    float _2075 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2077 = _1188 * _2051;
    float _2079 = _2067 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2081 = fma(_1226, _2047, _2073);
    float _2083 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2075);
    float _2085 = _2067 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2087 = _2067 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2089 = fma(_1226, _2031, _2077);
    float _2091 = fma(_1220, _2013, _2081);
    float _2093 = fma(_2069, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2085);
    float _2095 = fma(_2069, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2079);
    float _2097 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2083);
    float _2099 = fma(_1212, _2031, _2065);
    float _2101 = fma(_1230, _2035, _2071);
    float _2103 = fma(_2069, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2087);
    float _2105 = fma(_1220, _2035, _2089);
    float _2107 = fma(_2091, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2093);
    float _2109 = fma(_2091, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2095);
    float _2111 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2097);
    float _2113 = fma(_1204, _2035, _2099);
    float _2115 = _2101 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2117 = _2055 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2119 = fma(_2091, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2103);
    float _2121 = _2111 + _1694;
    float _2123 = _2101 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2125 = fma(_2113, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2115);
    float _2127 = _2101 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2129 = _2121 * 0.5;
    float _2131 = fma(_2113, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2123);
    float _2133 = fma(_2105, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2125);
    float _2135 = fma(_2113, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2127);
    float _2137 = -_2117;
    float _2139 = _2137 + 1.0;
    out.m_79.z = _2129;
    out.m_79.w = _1694;
    float _2141 = fma(_2105, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2131);
    float _2143 = fma(_2105, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2135);
    bool _2145 = _1470 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2147 = isnan(_1470);
    bool _2149 = _2145 || _2147;
    bool _2151 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2153 = _2149 || _2151;
    out.m_81.x = _2107;
    out.m_81.y = _2109;
    out.m_81.z = _2119;
    out.m_83.x = _2133;
    out.m_83.y = _2141;
    out.m_83.z = _2143;
    out.gl_Position.x = _1736;
    out.gl_Position.y = _1738;
    out.gl_Position.z = _2111;
    out.gl_Position.w = _1694;
    float _2155 = _2109;
    float _2157 = _2107;
    float _2159 = _2111;
    float _2161 = _1736;
    if (!_2153)
    {
        _2155 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2163 = _2155;
    float _2165 = _2163;
    float _2167 = _2163;
    if (!_2153)
    {
        _2157 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2169 = _2157;
    float _2171 = _2169;
    float _2173 = _2169;
    if (!_2153)
    {
        _1803 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2175 = _1803;
    float _2177 = _2175;
    float _2179 = _2175;
    if (!_2153)
    {
        _2159 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2181 = _2159;
    float _2183 = _2181;
    float _2185 = _2181;
    if (!_2153)
    {
        _1805 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2187 = _1805;
    float _2189 = _2187;
    float _2191 = _2187;
    if (!_2153)
    {
        _2161 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2193 = _2161;
    float _2195 = _2117 * _1762;
    float _2197 = _1773 * _2139;
    float _2199 = _1773 * _2195;
    float _2201 = _1783 * _2195;
    float _2203 = fma(_1779, _2199, _1767);
    float _2205 = fma(_1781, _2199, _1769);
    float _2207 = fma(_1773, _2201, _1771);
    out.m_85.x = _2203;
    out.m_85.y = _2205;
    out.m_85.z = _2207;
    out.m_85.w = _2197;
    bool _2209 = !_2153;
    float _2211 = _2193;
    float _2213 = _2193;
    if (!_2209)
    {
        bool _2215 = _1470 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2217 = isnan(_1470);
        bool _2219 = _2215 || _2217;
        bool _2221 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2223 = _2219 || _2221;
        if (!_2223)
        {
            float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2227 = _1470 + _2225;
            float _2229 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2231 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2229;
            float _2233 = 1.0 / _2231;
            float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2237 = _2235 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2239 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2241 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2245 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2249 = _2247 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2255 = _2227 * _2233;
            float _2257 = precise::clamp(_2255, 0.0, 1.0);
            float _2259 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2261 = _2259 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2263 = fma(_2257, _2237, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2265 = fma(_2257, _2261, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2267 = fma(_2257, _2241, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2269 = fma(_2257, _2245, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2271 = fma(_2257, _2249, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2273 = fma(_2257, _2253, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2173 = _2265;
            _2191 = _2271;
            _2167 = _2263;
            _2185 = _2269;
            _2179 = _2267;
            _2213 = _2273;
            _2275 = true;
        }
        else
        {
            bool _2277 = _1470 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2279 = isnan(_1470);
            bool _2281 = _2277 || _2279;
            bool _2283 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2285 = _2281 || _2283;
            if (!_2285)
            {
                _2165 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2287 = _2165;
            _2167 = _2287;
            if (!_2285)
            {
                _2171 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2289 = _2171;
            _2173 = _2289;
            if (!_2285)
            {
                _2177 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2291 = _2177;
            _2179 = _2291;
            if (!_2285)
            {
                _2183 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2293 = _2183;
            _2185 = _2293;
            if (!_2285)
            {
                _2189 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2295 = _2189;
            _2191 = _2295;
            if (!_2285)
            {
                _2211 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2297 = _2211;
            bool _2299 = !_2285;
            _2213 = _2297;
            if (!_2299)
            {
                bool _2301 = _1470 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2303 = isnan(_1470);
                bool _2305 = _2301 || _2303;
                bool _2307 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2309 = _2305 || _2307;
                if (!_2309)
                {
                    float _2311 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2313 = _1470 + _2311;
                    float _2315 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2317 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2315;
                    float _2319 = 1.0 / _2317;
                    float _2321 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2323 = _2321 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2327 = _2325 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2329 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2331 = _2329 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2337 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2339 = _2337 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2341 = _2313 * _2319;
                    float _2343 = precise::clamp(_2341, 0.0, 1.0);
                    float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2347 = _2345 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2349 = fma(_2343, _2323, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2351 = fma(_2343, _2347, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2353 = fma(_2343, _2327, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2355 = fma(_2343, _2331, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2357 = fma(_2343, _2335, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2359 = fma(_2343, _2339, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2173 = _2351;
                    _2191 = _2357;
                    _2167 = _2349;
                    _2185 = _2355;
                    _2179 = _2353;
                    _2213 = _2359;
                    _2275 = true;
                }
                else
                {
                    _2173 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2191 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2167 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2185 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2179 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2213 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2275 = false;
    float _2361 = _2173;
    float _2363 = _2191;
    float _2365 = _2167;
    float _2367 = _2185;
    float _2369 = _2179;
    float _2371 = _2213;
    float _2373 = fma(_2141, -0.5, 0.5);
    float _2375 = precise::clamp(_2373, 0.0, 1.0);
    float _2377 = -_2361;
    float _2379 = _2377 + _2363;
    float _2381 = -_2365;
    float _2383 = _2381 + _2367;
    float _2385 = -_2369;
    float _2387 = _2385 + _2371;
    bool _2389 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2391 = fma(_2375, _2379, _2361);
    float _2393 = fma(_2375, _2383, _2365);
    float _2395 = fma(_2375, _2387, _2369);
    float _2397 = _2391 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _2399 = fma(_2393, 0.298911988735198974609375, _2397);
    float _2401 = fma(_2395, 0.114477999508380889892578125, _2399);
    out.m_87.x = 0.0;
    float _2403 = -_2401;
    float _2405 = _2393 + _2403;
    float _2407 = -_2401;
    float _2409 = _2391 + _2407;
    float _2411 = -_2401;
    float _2413 = _2395 + _2411;
    float _2415 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2417 = fma(_2405, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2401);
    float _2419 = fma(_2409, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2401);
    float _2421 = fma(_2413, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2401);
    out.m_89.w = _2415;
    out.m_91.x = _2417;
    out.m_91.y = _2419;
    out.m_91.z = _2421;
    if (!_2389)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2423 = -_1440;
    float _2425 = _2423 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2427 = -_1442;
    float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2431 = -_1444;
    float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2435 = _2425 * _2425;
    float _2437 = fma(_2429, _2429, _2435);
    float _2439 = fma(_2433, _2433, _2437);
    float _2441 = sqrt(_2439);
    float _2443 = rsqrt(_2439);
    float _2445 = -_2441;
    float _2447 = _2445 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2449 = _2447 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2451 = precise::clamp(_2449, 0.0, 1.0);
    float _2453 = _2429 * _2443;
    float _2455 = _2425 * _2443;
    float _2457 = abs(_2451);
    float _2459 = log2(_2457);
    float _2461 = _2433 * _2443;
    float _2463 = _2453 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2465 = _2141 * _2455;
    float _2467 = -_2455;
    float _2469 = -_2463;
    float _2471 = fma(_2467, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2469);
    float _2473 = fma(_2133, _2453, _2465);
    float _2475 = -_2461;
    float _2477 = fma(_2475, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2471);
    float _2479 = fma(_2143, _2461, _2473);
    float _2481 = precise::clamp(_2479, 0.0, 1.0);
    float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2485 = _2477 + _2483;
    float _2487 = _2459 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2489 = _2485 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2491 = precise::clamp(_2489, 0.0, 1.0);
    float _2493 = exp2(_2487);
    float _2495 = _2493 * _2491;
    float _2497 = _2481 * _2495;
    float _2499 = _2497 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2501 = _2497 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2503 = _2497 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2499;
    out.m_87.y = _2501;
    out.m_87.z = _2503;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2275 = false;
    bool _212 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_44.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (!_114)
    {
        out.m_47.x = 0.0;
    }
    int _120 = 0;
    if (!_114)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2559 = as_type<float>(_124);
        out.gl_Position.z = _2559;
    }
    if (!_114)
    {
        return out;
    }
    float _128 = in.m_49.w;
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
    float _152 = _128;
    float _154 = _134;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2624 = as_type<float>(_160);
        out.gl_Position.z = _2624;
    }
    if (_150)
    {
        return out;
    }
    float _162 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _164 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _166 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _168 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _170 = _162 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _174 = _164 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _178 = _166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _180 = _168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _182 = _172 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _184 = _176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _186 = 1.0 / _130;
    out.m_51.x = _170;
    out.m_51.y = _174;
    out.m_51.z = _178;
    bool _188 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    out.m_53.x = _180;
    out.m_53.y = _182;
    out.m_53.z = _184;
    float _190 = _134 * _186;
    bool _192 = !_188;
    float _210;
    if (!_192)
    {
        float _194 = in.m_55.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[14].x, _134);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        _210 = _190;
    }
    _212 = false;
    float _214 = _210;
    float _216 = in.m_57.x;
    float _218 = in.m_57.y;
    float _220 = in.m_57.z;
    float _222 = in.m_55.z;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _226 = _224 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _230 = _228 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _232 = 1.0 / _226;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _242 = in.m_55.y;
    int _244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _246 = _244 != 0;
    float _248 = 1.0 / _230;
    float _250 = in.m_59.x;
    float _252 = _218 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _254 = 1.0 / _236;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _258 = _256 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _260 = _216 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _262;
    bool _266 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _268 = isnan(_214);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = _252 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _282 = _280 != 0;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _286 = _284 != 0;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _290 = _288 != 0;
    float _292 = 1.0 / _240;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _298 = _260 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _300 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _302 = isnan(_214);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _314 = 1.0 / _258;
    float _316 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _312);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _326 = _220 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _328 = 1.0 / _296;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _330;
    float _334 = _222 * 2.0;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _336;
    float _340 = _320 * _232;
    float _342 = _242 * 2.0;
    float _344 = _332 * _248;
    float _346 = 1.0 / _324;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _356 = _338 * _314;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _360 = _214 + _358;
    float _362 = _354 * _292;
    float _364 = _326 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _366 = floor(_334);
    float _368 = _350 * _254;
    float _370 = _242 + _222;
    float _372 = fma((*spvDescriptorSet0.vp_c8)._m0[2].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _316);
    float _374 = _370 + (-1.0);
    float _376 = _372 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _378 = floor(_342);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _384 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _386 = in.m_61.x;
    float _388 = in.m_61.y;
    float _390 = in.m_61.z;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _394 = _214 + _392;
    float _396 = _382 * _328;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _400 = _214 + _398;
    float _402 = _264 * _346;
    bool _404 = _366 > 0.0;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _408 = _214 + _406;
    bool _410 = _366 >= 0.0;
    bool _412 = isnan(_366);
    bool _414 = _410 || _412;
    bool _416 = isnan(0.0);
    bool _418 = _414 || _416;
    float _420 = fma(_344, _394, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _424 = _214 + _422;
    float _426 = fma(_340, _400, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _428 = _418 ? 0 : 1;
    float _430 = fma(_368, _424, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _432 = fma(_362, _360, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _434 = fma(_356, _408, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _436 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _438 = isnan(_214);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _444 = _440 || _442;
    float _446 = float(_444);
    bool _448 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _450 = isnan(_214);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    bool _460 = _378 > 0.0;
    float _462 = -_446;
    float _464 = _462 + 1.0;
    bool _466 = _378 >= 0.0;
    bool _468 = isnan(_378);
    bool _470 = _466 || _468;
    bool _472 = isnan(0.0);
    bool _474 = _470 || _472;
    float _476 = -_458;
    float _478 = _476 + 1.0;
    float _480 = _386 * 12.98980045318603515625;
    int _482 = ~_428;
    int _484 = _482 + 1;
    int _486 = _484 + 1;
    float _488 = _458 * _464;
    int _490 = _486;
    float _492 = _420;
    float _494 = _214;
    if (!_404)
    {
        int _496 = ~_428;
        int _498 = _496 + 1;
        _490 = _498;
    }
    int _500 = _490;
    float _502 = fma(_388, 78.233001708984375, _480);
    bool _504 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _506 = isnan(_214);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = fma(_390, 78.233001708984375, _480);
    float _518 = _388 * 12.98980045318603515625;
    float _520 = _502 * 0.15915493667125701904296875;
    bool _522 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _524 = isnan(_214);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = _516 * 0.15915493667125701904296875;
    float _536 = _514 * _478;
    float _538 = -_514;
    float _540 = _538 + 1.0;
    float _542 = fma(_386, 78.233001708984375, _518);
    float _544 = _520 * 6.283185482025146484375;
    float _546 = sin(_544);
    float _548 = in.m_55.x;
    float _550 = _532 * _540;
    float _552 = -_532;
    float _554 = _552 + 1.0;
    float _556 = _542 * 0.15915493667125701904296875;
    float _558 = -_276;
    float _560 = _558 + 1.0;
    bool _562 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _564 = isnan(_214);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = _276 * _554;
    float _576 = _534 * 6.283185482025146484375;
    float _578 = sin(_576);
    float _580 = fma(_390, 78.233001708984375, _518);
    bool _582 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _584 = isnan(_214);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = _572 * _560;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _598 = _596 != 0;
    float _600 = -_572;
    float _602 = _600 + 1.0;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _606 = _214 + _604;
    float _608 = _556 * 6.283185482025146484375;
    float _610 = sin(_608);
    float _612 = _580 * 0.15915493667125701904296875;
    float _614 = _592 * _602;
    float _616 = -_592;
    float _618 = _616 + 1.0;
    float _620 = fma(_396, _606, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _622 = _546 * 43758.546875;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _626 = _214 + _624;
    float _628 = _310 * _618;
    float _630 = _578 * 43758.546875;
    float _632 = -_310;
    float _634 = _632 + 1.0;
    float _636 = _606;
    float _638 = _634;
    if (!_598)
    {
        _636 = _250;
    }
    float _640 = _636;
    float _642 = _420 * _628;
    float _644 = floor(_630);
    float _646 = fma(_402, _626, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _648 = _640;
    if (!_598)
    {
        _492 = _640;
    }
    float _650 = _492;
    float _652 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[159].x, _642);
    float _654 = _610 * 43758.546875;
    float _656 = _650;
    if (_598)
    {
        _648 = _250;
    }
    float _658 = _648;
    if (_246)
    {
        _638 = _242;
    }
    float _660 = _638;
    float _662 = floor(_622);
    float _664 = fma(_426, _614, _652);
    float _666 = _660;
    float _668 = _548;
    if (!_246)
    {
        _666 = _548;
    }
    float _670 = _666;
    if (_246)
    {
        _494 = _548;
    }
    float _672 = _494;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _676 = -_376;
    float _678 = precise::max(_676, 1.0);
    float _680 = floor(_654);
    float _682 = -_644;
    float _684 = _630 + _682;
    float _686 = _670 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _688 = _672;
    if (!_246)
    {
        _688 = _222;
    }
    float _690 = _688;
    float _692 = _222 + _548;
    float _694 = precise::min(_678, 4.0);
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _698 = _612 * 6.283185482025146484375;
    float _700 = sin(_698);
    float _702 = _690 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _704 = _474 ? 0 : 1;
    float _706 = fma(_686, -2.0, _674);
    float _708 = -_662;
    float _710 = _622 + _708;
    float _712 = fma(_694, 0.3333333432674407958984375, -0.3333333432674407958984375);
    float _714 = -_696;
    float _716 = fma(_702, 2.0, _714);
    float _718 = _242 + _548;
    float _720 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _722 = log2(_720);
    float _724 = -_680;
    float _726 = _654 + _724;
    float _728 = _692 + (-1.0);
    int _730 = ~_704;
    int _732 = _730 + 1;
    int _734 = _732 + 1;
    float _736 = _718 + (-1.0);
    bool _738 = !_282;
    int _740 = _738 ? 0 : 1;
    float _742 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _744 = _700 * 43758.546875;
    int _746 = _734;
    if (!_460)
    {
        int _748 = ~_704;
        int _750 = _748 + 1;
        _746 = _750;
    }
    int _752 = _746;
    float _754 = fma(_430, _594, _664);
    float _756 = floor(_744);
    bool _758 = !_290;
    int _760 = _758 ? 0 : 1;
    int _762 = abs(_740);
    float _764 = _722 * _134;
    int _766 = abs(_760);
    float _768 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _770 = exp2(_764);
    float _772 = fma(_432, _574, _754);
    float _774 = float(_762);
    float _776 = float(_500);
    float _778 = fma(_434, _550, _772);
    float _780 = -_756;
    float _782 = _744 + _780;
    float _784 = _548 * 2.0;
    float _786 = _774 * _776;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _790 = 1.0 + _788;
    float _792 = float(_766);
    float _794 = fma(_620, _536, _778);
    float _796 = float(_752);
    float _798 = 1.0 / _790;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _802 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _804 = isnan(1.0);
    bool _806 = _802 || _804;
    bool _808 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _810 = _806 || _808;
    float _812 = _792 * _796;
    float _814 = -_770;
    float _816 = _814 + 1.0;
    float _818 = in.m_63.x;
    float _820 = in.m_63.y;
    float _822 = in.m_63.z;
    float _824 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[88].z, _800);
    float _826 = floor(_784);
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _830 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _832 = isnan(0.0);
    bool _834 = _830 || _832;
    bool _836 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _838 = _834 || _836;
    float _840 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _824);
    float _842 = _710 + _658;
    float _844 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[88].w, _828);
    float _846 = _838 ? _816 : 0.0;
    float _848 = -_134;
    float _850 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[86].x, _716);
    float _852 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[86].y, _706);
    float _854 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].w, _844);
    float _856 = fma(_134, 0.02500000037252902984619140625, _842);
    if (_810)
    {
        float _858 = _846 * _798;
        _154 = _858;
    }
    float _860 = _154;
    float _862 = _726 * _726;
    float _864 = _812 * (-2.0);
    float _866 = _856 * 16.0;
    float _868 = fma(_646, _488, _794);
    bool _870 = _826 > 0.0;
    float _872 = fma(_684, _684, _862);
    bool _874 = _826 >= 0.0;
    bool _876 = isnan(_826);
    bool _878 = _874 || _876;
    bool _880 = isnan(0.0);
    bool _882 = _878 || _880;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _886 = 1.0 + _884;
    float _888 = _548 + (-0.5);
    float _890 = fma(_782, _782, _872);
    int _892 = _882 ? 0 : 1;
    float _894 = fma(_190, _886, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    float _896 = fma(_864, _822, _822);
    float _898 = fma(_742, _864, _742);
    float _900 = _222 + (-0.5);
    float _902 = fma(_710, 0.4000000059604644775390625, _894);
    float _904 = precise::clamp(_902, 0.0, 1.0);
    float _906 = rsqrt(_890);
    int _908 = ~_892;
    int _910 = _908 + 1;
    int _912 = _910 + 1;
    float _914 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[196].z, _896);
    int _916 = _912;
    if (!_870)
    {
        int _918 = ~_892;
        int _920 = _918 + 1;
        _916 = _920;
    }
    int _922 = _916;
    float _924 = _786 * (-2.0);
    float _926 = _904 * _904;
    float _928 = _866 * 0.15915493667125701904296875;
    float _930 = fma(_710, -0.4000000059604644775390625, 1.0);
    float _932 = in.m_65.x;
    float _934 = in.m_65.y;
    float _936 = in.m_65.z;
    float _938 = fma(_924, _818, _818);
    float _940 = -_926;
    float _942 = fma(_940, _926, 1.0);
    float _944 = fma(_768, _924, _768);
    float _946 = -_190;
    float _948 = fma(_946, _930, 1.0);
    float _950 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[196].x, _938);
    float _952 = _942 * _712;
    bool _954 = !_286;
    int _956 = _954 ? 0 : 1;
    float _958 = _726 * _906;
    float _960 = fma(_944, _860, _950);
    int _962 = abs(_956);
    float _964 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[166].x, _868);
    float _966 = -_948;
    float _968 = fma(_966, _948, 1.0);
    float _970 = fma(_684, 2.0, -1.0);
    float _972 = in.m_67.x;
    float _974 = in.m_67.y;
    float _976 = in.m_67.z;
    float _978 = _684 * _906;
    float _980 = _782 * _906;
    float _982 = _960 * 0.15915493667125701904296875;
    float _984 = _958 * _958;
    float _986 = float(_962);
    float _988 = _930 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _990 = float(_922);
    float _992 = _928 * 6.283185482025146484375;
    float _994 = sin(_992);
    float _996 = _968 * _386;
    float _998 = fma(_978, _978, _984);
    float _1000 = _964 * _970;
    float _1002 = _1000 * 4.0;
    float _1004 = _986 * _990;
    float _1006 = fma(_996, _988, _386);
    float _1008 = _968 * _388;
    float _1010 = fma(_980, _980, _998);
    float _1012 = _1004 * (-2.0);
    float _1014 = fma(_996, _988, _932);
    float _1016 = _1002 * 0.15915493667125701904296875;
    float _1018 = fma(_1008, _988, _388);
    float _1020 = fma(_1008, _988, _934);
    float _1022 = _968 * _390;
    float _1024 = fma(_1012, _820, _820);
    float _1026 = rsqrt(_1010);
    float _1028 = fma(_898, _860, _914);
    float _1030 = fma(_1022, _988, _390);
    float _1032 = _242 + (-0.5);
    float _1034 = fma(_1022, _988, _936);
    float _1036 = _994 * 0.119999997317790985107421875;
    float _1038 = fma(_384, _1012, _384);
    float _1040 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1024);
    float _1042 = _1016 * 6.283185482025146484375;
    float _1044 = cos(_1042);
    float _1046 = fma(_976, _1036, _1034);
    float _1048 = fma(_972, _1036, _1014);
    float _1050 = fma(_974, _1036, _1020);
    float _1052 = fma(_1038, _860, _1040);
    float _1054 = -_1030;
    float _1056 = _1054 + _1046;
    float _1058 = -_1006;
    float _1060 = _1058 + _1048;
    float _1062 = -_1018;
    float _1064 = _1062 + _1050;
    float _1066 = _1016 * 6.283185482025146484375;
    float _1068 = sin(_1066);
    float _1070 = _952 * _1056;
    float _1072 = _952 * _1060;
    float _1074 = _952 * _1064;
    float _1076 = _978 * _1026;
    float _1078 = _980 * _1026;
    float _1080 = _958 * _1026;
    float _1082 = _1052 * 0.15915493667125701904296875;
    float _1084 = -_1044;
    float _1086 = _1084 + 1.0;
    float _1088 = _1028 * 0.15915493667125701904296875;
    float _1090 = _982 * 6.283185482025146484375;
    float _1092 = sin(_1090);
    float _1094 = _1076 * _1086;
    float _1096 = _1080 * _1086;
    float _1098 = _1078 * _1068;
    float _1100 = _1076 * _1068;
    float _1102 = _1080 * _1068;
    float _1104 = _982 * 6.283185482025146484375;
    float _1106 = cos(_1104);
    float _1108 = fma(_1080, _1094, _1098);
    float _1110 = -_1098;
    float _1112 = fma(_1080, _1094, _1110);
    float _1114 = fma(_1080, _1096, _1044);
    float _1116 = fma(_1078, _1096, _1100);
    float _1118 = -_1100;
    float _1120 = fma(_1078, _1096, _1118);
    float _1122 = _1078 * _1078;
    float _1124 = _1074 * _1114;
    float _1126 = -_1102;
    float _1128 = fma(_1078, _1094, _1126);
    float _1130 = fma(_1078, _1094, _1102);
    float _1132 = fma(_1076, _1094, _1044);
    float _1134 = fma(_1086, _1122, _1044);
    float _1136 = _1088 * 6.283185482025146484375;
    float _1138 = cos(_1136);
    float _1140 = fma(_1072, _1108, _1124);
    float _1142 = _1074 * _1112;
    float _1144 = _1074 * _1116;
    float _1146 = fma(_1070, _1120, _1140);
    float _1148 = fma(_1072, _1132, _1142);
    float _1150 = fma(_1072, _1128, _1144);
    float _1152 = _1082 * 6.283185482025146484375;
    float _1154 = sin(_1152);
    float _1156 = in.m_44.x;
    float _1158 = in.m_44.y;
    float _1160 = in.m_44.z;
    float _1162 = _1018 + _1146;
    float _1164 = fma(_1070, _1130, _1148);
    float _1166 = fma(_1070, _1134, _1150);
    bool _1168 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1170 = isnan(0.5);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1176 = _1172 || _1174;
    float _1178 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1162);
    float _1180 = _1006 + _1164;
    float _1182 = _1082 * 6.283185482025146484375;
    float _1184 = cos(_1182);
    float _1186 = _1106 * _1138;
    float _1188 = _1092 * _1138;
    float _1190 = _1178 * _278;
    float _1192 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1180);
    float _1194 = _1186 * _1190;
    float _1196 = _1088 * 6.283185482025146484375;
    float _1198 = sin(_1196);
    float _1200 = _1106 * _1154;
    float _1202 = _1092 * _1154;
    float _1204 = _1154 * _1138;
    float _1206 = _1192 * _298;
    float _1208 = _1188 * _1190;
    float _1210 = _1106 * _1184;
    float _1212 = _1184 * _1138;
    float _1214 = _1030 + _1166;
    float _1216 = _1092 * _1184;
    float _1218 = fma(_1198, _1210, _1202);
    float _1220 = fma(_1198, _1202, _1210);
    float _1222 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1214);
    float _1224 = -_1200;
    float _1226 = fma(_1198, _1216, _1224);
    float _1228 = -_1216;
    float _1230 = fma(_1198, _1200, _1228);
    float _1232 = -_1190;
    float _1234 = _1198 * _1232;
    float _1236 = _1222 * _364;
    float _1238 = fma(_1218, _1206, _1194);
    float _1240 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1242 = fma(_1212, _1206, _1234);
    float _1244 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1246 = fma(_1230, _1236, _1238);
    float _1248 = fma(_1226, _1206, _1208);
    float _1250 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1240);
    float _1252 = fma(_1204, _1236, _1242);
    float _1254 = _1246 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1256 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1244);
    float _1258 = fma(_1220, _1236, _1248);
    float _1260 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1250);
    float _1262 = _1246 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1264 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1254);
    float _1266 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1256);
    float _1268 = _1260 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1270 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1262);
    float _1272 = fma(_1258, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1264);
    float _1274 = _1266 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1276 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1278 = fma(_1258, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1270);
    float _1280 = _1268 + _1272;
    float _1282 = _1246 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1284 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1276);
    float _1286 = _1274 + _1278;
    float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1290 = _1280 + _1288;
    float _1292 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1282);
    float _1294 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1284);
    float _1296 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1298 = _1286 + _1296;
    float _1300 = _1290 * _1290;
    float _1302 = fma(_1258, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1292);
    float _1304 = fma(_1298, _1298, _1300);
    float _1306 = _1294 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1308 = sqrt(_1304);
    float _1310 = _1306 + _1302;
    bool _1312 = _1308 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1314 = _1156;
    float _1316 = _1160;
    float _1318 = _1294;
    float _1320 = _1286;
    float _1322 = _1180;
    float _1324 = _1214;
    float _1326 = _1162;
    if (!_1312)
    {
        _1314 = _1286;
    }
    float _1328 = _1314;
    float _1330 = _1328;
    if (!_1312)
    {
        _1316 = _1280;
    }
    float _1332 = _1316;
    float _1334 = _1332;
    if (!_1312)
    {
        _1318 = _1310;
    }
    float _1336 = _1318;
    bool _1338 = !_1312;
    float _1340 = _1336;
    if (!_1338)
    {
        float _1342 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1346 = _1308 + _1344;
        float _1348 = _1310 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1350 = rsqrt(_1304);
        float _1352 = _1346 * _1342;
        float _1354 = _1352 * 0.15915493667125701904296875;
        float _1356 = _1354 * 6.283185482025146484375;
        float _1358 = cos(_1356);
        float _1360 = _1354 * 6.283185482025146484375;
        float _1362 = sin(_1360);
        float _1364 = _1358 + (-1.0);
        float _1366 = _1364 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1368 = fma(_1362, _1348, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1370 = fma(_1310, _1358, _1366);
        float _1372 = _1350 * _1368;
        float _1374 = fma(_1298, _1372, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1376 = fma(_1290, _1372, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1330 = _1374;
        _1340 = _1370;
        _1334 = _1376;
    }
    float _1378 = _1330;
    float _1380 = _1340;
    float _1382 = _1334;
    float _1384 = _1380;
    float _1386 = _1378;
    float _1388 = _1382;
    if (!_1176)
    {
        float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1392 = _1306 + _1390;
        float _1394 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1396 = _1274 + _1394;
        float _1398 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1400 = -_1274;
        float _1402 = _1400 + _1378;
        float _1404 = _1392 * _1392;
        float _1406 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1408 = _1268 + _1406;
        float _1410 = -_1306;
        float _1412 = _1410 + _1380;
        float _1414 = -_1268;
        float _1416 = _1414 + _1382;
        float _1418 = fma(_1396, _1396, _1404);
        float _1420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1422 = fma(_1408, _1408, _1418);
        float _1424 = sqrt(_1422);
        float _1426 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1428 = precise::min(_1424, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1430 = _1428 * _1420;
        float _1432 = _1426 * _1430;
        float _1434 = fma(_1402, _1432, _1274);
        float _1436 = fma(_1412, _1432, _1306);
        float _1438 = fma(_1416, _1432, _1268);
        _1384 = _1436;
        _1386 = _1434;
        _1388 = _1438;
        _1320 = _1430;
    }
    float _1440 = _1384;
    float _1442 = _1386;
    float _1444 = _1388;
    float _1446 = _1320;
    float _1448 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1450 = _1440 + _1448;
    float _1452 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1454 = _1442 + _1452;
    float _1456 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1458 = _1444 + _1456;
    float _1460 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1462 = _1450 * _1450;
    float _1464 = fma(_1454, _1454, _1462);
    float _1466 = fma(_1458, _1458, _1464);
    float _1468 = rsqrt(_1466);
    float _1470 = sqrt(_1466);
    float _1472 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1474 = _1454 * _1472;
    float _1476 = _1458 * _1472;
    float _1478 = _1474 * _1474;
    float _1480 = _1476 * _1476;
    float _1482 = _1478 + _1480;
    float _1484 = sqrt(_1482);
    bool _1486 = _1484 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1488 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1490 = _1484 + _1488;
    float _1492 = _1458;
    float _1494 = _1482;
    float _1496 = _1490;
    float _1498 = _1446;
    float _1500 = _1472;
    if (_1486)
    {
        float _1502 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1492 = _1502;
    }
    float _1504 = _1492;
    if (_1486)
    {
        float _1506 = rsqrt(_1482);
        _1494 = _1506;
    }
    float _1508 = _1494;
    if (_1486)
    {
        float _1510 = _1490 * _1504;
        _1496 = _1510;
    }
    float _1512 = _1496;
    if (_1486)
    {
        float _1514 = _1512 * 0.15915493667125701904296875;
        _1498 = _1514;
    }
    float _1516 = _1498;
    float _1518 = _1468;
    float _1520 = _1516;
    if (_1486)
    {
        float _1522 = _1516 * 6.283185482025146484375;
        float _1524 = sin(_1522);
        _1518 = _1524;
    }
    float _1526 = _1518;
    float _1528 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1530 = precise::max(0.0, _1528);
    float _1532 = _1462;
    float _1534 = _1530;
    float _1536 = _1528;
    if (_1486)
    {
        float _1538 = _1516 * 6.283185482025146484375;
        float _1540 = cos(_1538);
        _1532 = _1540;
    }
    float _1542 = _1532;
    float _1544 = -_1472;
    float _1546 = -_1530;
    float _1548 = fma(_1450, _1544, _1546);
    float _1550 = _1548;
    if (_1486)
    {
        float _1552 = _1548 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1534 = _1552;
    }
    float _1554 = _1534;
    float _1556 = _1526;
    float _1558 = _1554;
    if (_1486)
    {
        float _1560 = fma(_1526, _1554, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1556 = _1560;
    }
    float _1562 = _1556;
    float _1564 = _1562;
    if (!_1486)
    {
        _1558 = _1478;
    }
    float _1566 = _1558;
    float _1568 = _1566;
    float _1570 = _1542;
    if (_1486)
    {
        float _1572 = _1542 + (-1.0);
        _1536 = _1572;
    }
    float _1574 = _1536;
    float _1576 = _1574;
    if (_1486)
    {
        float _1578 = _1508 * _1562;
        _1500 = _1578;
    }
    float _1580 = _1500;
    if (!_1486)
    {
        _1564 = _1474;
    }
    float _1582 = _1564;
    float _1584 = _1582;
    if (_1486)
    {
        float _1586 = _1574 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1520 = _1586;
    }
    float _1588 = _1520;
    if (_1486)
    {
        float _1590 = _1474 * _1580;
        _1584 = _1590;
    }
    float _1592 = _1584;
    if (!_1486)
    {
        _1576 = _1476;
    }
    float _1594 = _1576;
    float _1596 = _1594;
    if (_1486)
    {
        float _1598 = _1476 * _1580;
        _1596 = _1598;
    }
    float _1600 = _1596;
    if (_1486)
    {
        float _1602 = fma(_1548, _1542, _1588);
        _1550 = _1602;
    }
    float _1604 = _1550;
    if (_1486)
    {
        float _1606 = _1592 * _1592;
        _1568 = _1606;
    }
    float _1608 = _1568;
    if (!_1486)
    {
        _1570 = _1480;
    }
    float _1610 = _1570;
    float _1612 = _1610;
    if (_1486)
    {
        float _1614 = _1600 * _1600;
        _1612 = _1614;
    }
    float _1616 = _1612;
    float _1618 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1620 = fma(_1604, _1604, _1608);
    float _1622 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1618);
    float _1624 = _1620 + _1616;
    float _1626 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1628 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1630 = fma(_1470, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1628);
    float _1632 = precise::clamp(_1630, 0.0, 1.0);
    float _1634 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1622);
    float _1636 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1638 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1626);
    float _1640 = rsqrt(_1624);
    float _1642 = -_1632;
    float _1644 = _1642 + 1.0;
    float _1646 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1636);
    float _1648 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1638);
    float _1650 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1652 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1654 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1646);
    float _1656 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1658 = abs(_1644);
    float _1660 = log2(_1658);
    float _1662 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1650);
    float _1664 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1666 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1668 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1670 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1662);
    float _1672 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1666);
    float _1674 = _1640 * _1592;
    float _1676 = _1640 * _1604;
    float _1678 = _1640 * _1600;
    float _1680 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1672);
    float _1682 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1684 = _1670 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1686 = -_1668;
    float _1688 = fma(_1686, _1460, 1.0);
    float _1690 = -_1682;
    float _1692 = fma(_1676, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1690);
    float _1694 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1680);
    float _1696 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1698 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1700 = -_1678;
    float _1702 = fma(_1700, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1692);
    float _1704 = log2(_1688);
    float _1706 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1708 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1698);
    float _1710 = fma(_1702, -0.5, 0.5);
    float _1712 = fma(_1702, 0.5, 0.5);
    float _1714 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1706);
    float _1716 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1708);
    float _1718 = _1676 + 1.0;
    float _1720 = 1.0 / _1694;
    float _1722 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1714);
    float _1724 = sqrt(_1710);
    float _1726 = _1704 * 0.693147182464599609375;
    float _1728 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1730 = exp2(_1696);
    float _1732 = _1724 * 0.636619746685028076171875;
    float _1734 = fma(_1712, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1736 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1722);
    float _1738 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1716);
    float _1740 = fma(_1712, _1734, -0.212114393711090087890625);
    float _1742 = _1736 * _1720;
    float _1744 = -_1676;
    float _1746 = fma(_1730, _1718, _1744);
    float _1748 = fma(_1712, _1740, 1.570728778839111328125);
    float _1750 = _1738 * _1720;
    float _1752 = fma(_1742, 0.5, 0.5);
    float _1754 = -_1748;
    float _1756 = fma(_1732, _1754, 1.0);
    float _1758 = fma(_1750, -0.5, 0.5);
    float _1760 = fma(_1746, 0.5, 0.5);
    float3 _5125 = float3(_1752, _1758, _1728);
    float _1762 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5125, float3(0.0), isnan(_5125)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5125, float3(0.0), isnan(_5125)), level(0.0)).x;
    float3 _5136 = float3(_1752, _1758, _1728);
    float4 _1765 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5136, float3(0.0), isnan(_5136)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5136, float3(0.0), isnan(_5136)), level(0.0)).xyzw;
    float _1767 = _1765.x;
    float _1769 = _1765.y;
    float _1771 = _1765.z;
    float _1773 = _1765.w;
    float2 _5153 = float2(_1756, _1760);
    float3 _1777 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5153, float2(0.0), isnan(_5153)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5153, float2(0.0), isnan(_5153)), level(0.0)).xyz;
    float _1779 = _1777.x;
    float _1781 = _1777.y;
    float _1783 = _1777.z;
    float _1785 = in.m_59.y;
    bool _1787 = _242 > 0.5;
    float _1789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1793 = _1791 != 0;
    float _1795 = in.m_55.w;
    int _1797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1799 = _1797 != 0;
    int _1801 = 0;
    float _1803 = _1694;
    float _1805 = _1738;
    if (_598)
    {
        float _1807 = -_658;
        float _1809 = _1807 + 1.0;
        _1801 = as_type<int>(_1809);
    }
    int _1811 = _1801;
    int _1813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1815 = _1813 != 0;
    float _1817 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1821 = _1819 != 0;
    float _1823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_69.x = _1442;
    out.m_69.y = _1440;
    out.m_69.z = _1444;
    int _1825 = 0;
    if (_1793)
    {
        float _1827 = -_658;
        float _1829 = _1827 + 1.0;
        _1825 = as_type<int>(_1829);
    }
    int _1831 = _1825;
    float _1833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1835 = 0;
    if (_1815)
    {
        float _1837 = -_658;
        float _1839 = _1837 + 1.0;
        _1835 = as_type<int>(_1839);
    }
    int _1841 = _1835;
    float _1843 = -_1785;
    float _1845 = _1843 + 1.0;
    float _1847 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1849 = _1795 > 0.5;
    int _1851 = _1787 ? as_type<int>(_1845) : as_type<int>(_1785);
    int _1853 = _1849 ? as_type<int>(_1845) : as_type<int>(_1785);
    int _1855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1857 = _1855 != 0;
    float _1859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1861 = _1799 ? as_type<float>(_1851) : _1785;
    float _1863 = _1833 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1865 = _222 > 0.5;
    float _1867 = _1857 ? as_type<float>(_1853) : _1785;
    float _1869 = _1861 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1871 = in.m_71.x;
    float _1873 = in.m_71.y;
    float _1875 = in.m_71.z;
    float _1877 = in.m_71.w;
    float _1879 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1881 = _1857;
    float _1883 = _1785;
    float _1885 = _1845;
    if (_598)
    {
        bool _1887 = _548 > 0.5;
        _1881 = _1887;
    }
    bool _1889 = _1881;
    if (!_1793)
    {
        _668 = _658;
    }
    float _1891 = _668;
    float _1893 = _1891;
    if (_1821)
    {
        float _1895 = _1865 ? _1845 : _1785;
        _1883 = _1895;
    }
    float _1897 = _1883;
    if (_1793)
    {
        float _1899 = _1787 ? as_type<float>(_1831) : _658;
        _1893 = _1899;
    }
    float _1901 = _1893;
    float _1903 = _1789 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (!_1815)
    {
        _1885 = _658;
    }
    float _1905 = _1885;
    float _1907 = fma(_1863, _1897, -0.5);
    float _1909 = _1905;
    if (_1815)
    {
        float _1911 = _1865 ? as_type<float>(_1841) : _658;
        _1909 = _1911;
    }
    float _1913 = _1909;
    float _1915 = fma(_1903, _1901, -0.5);
    float _1917 = _1867 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_598)
    {
        float _1919 = _1889 ? as_type<float>(_1811) : _658;
        _656 = _1919;
    }
    float _1921 = _656;
    float _1923 = _1869 * _1847;
    float _1925 = _1913 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1927 = _1917 * _1823;
    float _1929 = -_1018;
    bool _1931 = _1146 != _1929;
    bool _1933 = isnan(_1146);
    bool _1935 = _1931 || _1933;
    bool _1937 = isnan(_1929);
    bool _1939 = _1935 || _1937;
    float _1941 = _1921 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1943 = _1925 * _1879;
    float _1945 = fma(_840, _1915, _850);
    float _1947 = -_852;
    float _1949 = fma(_854, _1907, _1947);
    float _1951 = _1186 * _1873;
    float _1953 = -_1873;
    float _1955 = _1198 * _1953;
    float _1957 = _1941 * _1859;
    float _1959 = _1188 * _1873;
    float _1961 = fma(_1218, _1871, _1951);
    float _1963 = fma(_1212, _1871, _1955);
    float _1965 = _1180 * _1875;
    out.m_73.x = _1957;
    out.m_73.y = _1923;
    out.m_73.z = _1943;
    out.m_73.w = _1927;
    float _1967 = fma(_1230, _1875, _1961);
    float _1969 = fma(_1204, _1875, _1963);
    float _1971 = fma(_1226, _1871, _1959);
    float _1973 = -_1006;
    bool _1975 = _1164 == _1973;
    bool _1977 = !_1939;
    bool _1979 = _1975 && _1977;
    float _1981 = _1967 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1983 = _1162 * _1871;
    float _1985 = fma(_1220, _1875, _1971);
    float _1987 = -_1965;
    float _1989 = fma(_1214, _1871, _1987);
    float _1991 = fma(_1969, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1981);
    float _1993 = -_1030;
    bool _1995 = _1166 == _1993;
    bool _1997 = _1995 && _1979;
    float _1999 = -_1983;
    float _2001 = fma(_1180, _1873, _1999);
    float _2003 = exp2(_1817);
    float _2005 = _1945 + 0.5;
    float _2007 = _1967 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2009 = _1967 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2011 = fma(_1985, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1991);
    float _2013 = _2001 * _1877;
    float _2015 = fma(_1969, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2007);
    float _2017 = fma(_1969, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2009);
    float _2019 = _1949 + 0.5;
    float _2021 = fma(_1985, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2015);
    float _2023 = fma(_1985, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2017);
    float _2025 = _1214 * _1873;
    float _2027 = _1989 * _1877;
    if (!_1997)
    {
        float _2029 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1180);
        _1322 = _2029;
    }
    float _2031 = _1322;
    if (!_1997)
    {
        float _2033 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1214);
        _1324 = _2033;
    }
    float _2035 = _1324;
    float _2037 = -_2025;
    float _2039 = fma(_1162, _1875, _2037);
    float _2041 = _1186 * _2027;
    float _2043 = -_2027;
    float _2045 = _1198 * _2043;
    out.m_75.x = _2011;
    out.m_75.y = _2021;
    out.m_75.z = _2023;
    float _2047 = _2039 * _1877;
    if (!_1997)
    {
        float _2049 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1162);
        _1326 = _2049;
    }
    float _2051 = _1326;
    float _2053 = -_2003;
    float _2055 = _2053 + 1.0;
    out.m_77.x = _2005;
    out.m_77.y = _2019;
    float _2057 = fma(_1218, _2047, _2041);
    float _2059 = fma(_1212, _2047, _2045);
    float _2061 = _1186 * _2051;
    float _2063 = -_2051;
    float _2065 = _1198 * _2063;
    float _2067 = fma(_1230, _2013, _2057);
    float _2069 = fma(_1204, _2013, _2059);
    float _2071 = fma(_1218, _2031, _2061);
    float _2073 = _1188 * _2027;
    float _2075 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2077 = _1188 * _2051;
    float _2079 = _2067 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2081 = fma(_1226, _2047, _2073);
    float _2083 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2075);
    float _2085 = _2067 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2087 = _2067 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2089 = fma(_1226, _2031, _2077);
    float _2091 = fma(_1220, _2013, _2081);
    float _2093 = fma(_2069, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2085);
    float _2095 = fma(_2069, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2079);
    float _2097 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2083);
    float _2099 = fma(_1212, _2031, _2065);
    float _2101 = fma(_1230, _2035, _2071);
    float _2103 = fma(_2069, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2087);
    float _2105 = fma(_1220, _2035, _2089);
    float _2107 = fma(_2091, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2093);
    float _2109 = fma(_2091, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2095);
    float _2111 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2097);
    float _2113 = fma(_1204, _2035, _2099);
    float _2115 = _2101 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2117 = _2055 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2119 = fma(_2091, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2103);
    float _2121 = _2111 + _1694;
    float _2123 = _2101 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2125 = fma(_2113, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2115);
    float _2127 = _2101 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2129 = _2121 * 0.5;
    float _2131 = fma(_2113, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2123);
    float _2133 = fma(_2105, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2125);
    float _2135 = fma(_2113, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2127);
    float _2137 = -_2117;
    float _2139 = _2137 + 1.0;
    out.m_79.z = _2129;
    out.m_79.w = _1694;
    float _2141 = fma(_2105, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2131);
    float _2143 = fma(_2105, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2135);
    bool _2145 = _1470 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2147 = isnan(_1470);
    bool _2149 = _2145 || _2147;
    bool _2151 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2153 = _2149 || _2151;
    out.m_81.x = _2107;
    out.m_81.y = _2109;
    out.m_81.z = _2119;
    out.m_83.x = _2133;
    out.m_83.y = _2141;
    out.m_83.z = _2143;
    out.gl_Position.x = _1736;
    out.gl_Position.y = _1738;
    out.gl_Position.z = _2111;
    out.gl_Position.w = _1694;
    float _2155 = _2109;
    float _2157 = _2107;
    float _2159 = _2111;
    float _2161 = _1736;
    if (!_2153)
    {
        _2155 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2163 = _2155;
    float _2165 = _2163;
    float _2167 = _2163;
    if (!_2153)
    {
        _2157 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2169 = _2157;
    float _2171 = _2169;
    float _2173 = _2169;
    if (!_2153)
    {
        _1803 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2175 = _1803;
    float _2177 = _2175;
    float _2179 = _2175;
    if (!_2153)
    {
        _2159 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2181 = _2159;
    float _2183 = _2181;
    float _2185 = _2181;
    if (!_2153)
    {
        _1805 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2187 = _1805;
    float _2189 = _2187;
    float _2191 = _2187;
    if (!_2153)
    {
        _2161 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2193 = _2161;
    float _2195 = _2117 * _1762;
    float _2197 = _1773 * _2139;
    float _2199 = _1773 * _2195;
    float _2201 = _1783 * _2195;
    float _2203 = fma(_1779, _2199, _1767);
    float _2205 = fma(_1781, _2199, _1769);
    float _2207 = fma(_1773, _2201, _1771);
    out.m_85.x = _2203;
    out.m_85.y = _2205;
    out.m_85.z = _2207;
    out.m_85.w = _2197;
    bool _2209 = !_2153;
    float _2211 = _2193;
    float _2213 = _2193;
    if (!_2209)
    {
        bool _2215 = _1470 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2217 = isnan(_1470);
        bool _2219 = _2215 || _2217;
        bool _2221 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2223 = _2219 || _2221;
        if (!_2223)
        {
            float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2227 = _1470 + _2225;
            float _2229 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2231 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2229;
            float _2233 = 1.0 / _2231;
            float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2237 = _2235 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2239 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2241 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2245 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2249 = _2247 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2255 = _2227 * _2233;
            float _2257 = precise::clamp(_2255, 0.0, 1.0);
            float _2259 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2261 = _2259 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2263 = fma(_2257, _2237, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2265 = fma(_2257, _2261, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2267 = fma(_2257, _2241, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2269 = fma(_2257, _2245, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2271 = fma(_2257, _2249, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2273 = fma(_2257, _2253, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2173 = _2265;
            _2191 = _2271;
            _2167 = _2263;
            _2185 = _2269;
            _2179 = _2267;
            _2213 = _2273;
            _2275 = true;
        }
        else
        {
            bool _2277 = _1470 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2279 = isnan(_1470);
            bool _2281 = _2277 || _2279;
            bool _2283 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2285 = _2281 || _2283;
            if (!_2285)
            {
                _2165 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2287 = _2165;
            _2167 = _2287;
            if (!_2285)
            {
                _2171 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2289 = _2171;
            _2173 = _2289;
            if (!_2285)
            {
                _2177 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2291 = _2177;
            _2179 = _2291;
            if (!_2285)
            {
                _2183 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2293 = _2183;
            _2185 = _2293;
            if (!_2285)
            {
                _2189 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2295 = _2189;
            _2191 = _2295;
            if (!_2285)
            {
                _2211 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2297 = _2211;
            bool _2299 = !_2285;
            _2213 = _2297;
            if (!_2299)
            {
                bool _2301 = _1470 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2303 = isnan(_1470);
                bool _2305 = _2301 || _2303;
                bool _2307 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2309 = _2305 || _2307;
                if (!_2309)
                {
                    float _2311 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2313 = _1470 + _2311;
                    float _2315 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2317 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2315;
                    float _2319 = 1.0 / _2317;
                    float _2321 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2323 = _2321 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2327 = _2325 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2329 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2331 = _2329 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2337 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2339 = _2337 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2341 = _2313 * _2319;
                    float _2343 = precise::clamp(_2341, 0.0, 1.0);
                    float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2347 = _2345 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2349 = fma(_2343, _2323, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2351 = fma(_2343, _2347, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2353 = fma(_2343, _2327, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2355 = fma(_2343, _2331, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2357 = fma(_2343, _2335, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2359 = fma(_2343, _2339, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2173 = _2351;
                    _2191 = _2357;
                    _2167 = _2349;
                    _2185 = _2355;
                    _2179 = _2353;
                    _2213 = _2359;
                    _2275 = true;
                }
                else
                {
                    _2173 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2191 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2167 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2185 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2179 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2213 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2275 = false;
    float _2361 = _2173;
    float _2363 = _2191;
    float _2365 = _2167;
    float _2367 = _2185;
    float _2369 = _2179;
    float _2371 = _2213;
    float _2373 = fma(_2141, -0.5, 0.5);
    float _2375 = precise::clamp(_2373, 0.0, 1.0);
    float _2377 = -_2361;
    float _2379 = _2377 + _2363;
    float _2381 = -_2365;
    float _2383 = _2381 + _2367;
    float _2385 = -_2369;
    float _2387 = _2385 + _2371;
    bool _2389 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2391 = fma(_2375, _2379, _2361);
    float _2393 = fma(_2375, _2383, _2365);
    float _2395 = fma(_2375, _2387, _2369);
    float _2397 = _2391 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _2399 = fma(_2393, 0.298911988735198974609375, _2397);
    float _2401 = fma(_2395, 0.114477999508380889892578125, _2399);
    out.m_87.x = 0.0;
    float _2403 = -_2401;
    float _2405 = _2393 + _2403;
    float _2407 = -_2401;
    float _2409 = _2391 + _2407;
    float _2411 = -_2401;
    float _2413 = _2395 + _2411;
    float _2415 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2417 = fma(_2405, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2401);
    float _2419 = fma(_2409, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2401);
    float _2421 = fma(_2413, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2401);
    out.m_89.w = _2415;
    out.m_91.x = _2417;
    out.m_91.y = _2419;
    out.m_91.z = _2421;
    if (!_2389)
    {
        return out;
    }
    float _2423 = -_1440;
    float _2425 = _2423 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2427 = -_1442;
    float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2431 = -_1444;
    float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2435 = _2425 * _2425;
    float _2437 = fma(_2429, _2429, _2435);
    float _2439 = fma(_2433, _2433, _2437);
    float _2441 = sqrt(_2439);
    float _2443 = rsqrt(_2439);
    float _2445 = -_2441;
    float _2447 = _2445 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2449 = _2447 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2451 = precise::clamp(_2449, 0.0, 1.0);
    float _2453 = _2429 * _2443;
    float _2455 = _2425 * _2443;
    float _2457 = abs(_2451);
    float _2459 = log2(_2457);
    float _2461 = _2433 * _2443;
    float _2463 = _2453 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2465 = _2141 * _2455;
    float _2467 = -_2455;
    float _2469 = -_2463;
    float _2471 = fma(_2467, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2469);
    float _2473 = fma(_2133, _2453, _2465);
    float _2475 = -_2461;
    float _2477 = fma(_2475, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2471);
    float _2479 = fma(_2143, _2461, _2473);
    float _2481 = precise::clamp(_2479, 0.0, 1.0);
    float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2485 = _2477 + _2483;
    float _2487 = _2459 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2489 = _2485 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2491 = precise::clamp(_2489, 0.0, 1.0);
    float _2493 = exp2(_2487);
    float _2495 = _2493 * _2491;
    float _2497 = _2481 * _2495;
    float _2499 = _2497 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2501 = _2497 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2503 = _2497 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2499;
    out.m_87.y = _2501;
    out.m_87.z = _2503;
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
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2275 = false;
    bool _212 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_44.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (!_114)
    {
        out.m_47.x = 0.0;
    }
    int _120 = 0;
    if (!_114)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2559 = as_type<float>(_124);
        out.gl_Position.z = _2559;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_49.w;
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
    float _152 = _128;
    float _154 = _134;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2624 = as_type<float>(_160);
        out.gl_Position.z = _2624;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _164 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _166 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _168 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _170 = _162 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _174 = _164 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _178 = _166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _180 = _168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _182 = _172 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _184 = _176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _186 = 1.0 / _130;
    out.m_51.x = _170;
    out.m_51.y = _174;
    out.m_51.z = _178;
    bool _188 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    out.m_53.x = _180;
    out.m_53.y = _182;
    out.m_53.z = _184;
    float _190 = _134 * _186;
    bool _192 = !_188;
    float _210;
    if (!_192)
    {
        float _194 = in.m_55.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[14].x, _134);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        _210 = _190;
    }
    _212 = false;
    float _214 = _210;
    float _216 = in.m_57.x;
    float _218 = in.m_57.y;
    float _220 = in.m_57.z;
    float _222 = in.m_55.z;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _226 = _224 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _230 = _228 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _232 = 1.0 / _226;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _242 = in.m_55.y;
    int _244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _246 = _244 != 0;
    float _248 = 1.0 / _230;
    float _250 = in.m_59.x;
    float _252 = _218 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _254 = 1.0 / _236;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _258 = _256 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _260 = _216 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _262;
    bool _266 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _268 = isnan(_214);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = _252 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _282 = _280 != 0;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _286 = _284 != 0;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _290 = _288 != 0;
    float _292 = 1.0 / _240;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _298 = _260 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _300 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _302 = isnan(_214);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _314 = 1.0 / _258;
    float _316 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _312);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _326 = _220 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _328 = 1.0 / _296;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _330;
    float _334 = _222 * 2.0;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _336;
    float _340 = _320 * _232;
    float _342 = _242 * 2.0;
    float _344 = _332 * _248;
    float _346 = 1.0 / _324;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _356 = _338 * _314;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _360 = _214 + _358;
    float _362 = _354 * _292;
    float _364 = _326 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _366 = floor(_334);
    float _368 = _350 * _254;
    float _370 = _242 + _222;
    float _372 = fma((*spvDescriptorSet0.vp_c8)._m0[2].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _316);
    float _374 = _370 + (-1.0);
    float _376 = _372 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _378 = floor(_342);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _384 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _386 = in.m_61.x;
    float _388 = in.m_61.y;
    float _390 = in.m_61.z;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _394 = _214 + _392;
    float _396 = _382 * _328;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _400 = _214 + _398;
    float _402 = _264 * _346;
    bool _404 = _366 > 0.0;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _408 = _214 + _406;
    bool _410 = _366 >= 0.0;
    bool _412 = isnan(_366);
    bool _414 = _410 || _412;
    bool _416 = isnan(0.0);
    bool _418 = _414 || _416;
    float _420 = fma(_344, _394, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _424 = _214 + _422;
    float _426 = fma(_340, _400, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _428 = _418 ? 0 : 1;
    float _430 = fma(_368, _424, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _432 = fma(_362, _360, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _434 = fma(_356, _408, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _436 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _438 = isnan(_214);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _444 = _440 || _442;
    float _446 = float(_444);
    bool _448 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _450 = isnan(_214);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    bool _460 = _378 > 0.0;
    float _462 = -_446;
    float _464 = _462 + 1.0;
    bool _466 = _378 >= 0.0;
    bool _468 = isnan(_378);
    bool _470 = _466 || _468;
    bool _472 = isnan(0.0);
    bool _474 = _470 || _472;
    float _476 = -_458;
    float _478 = _476 + 1.0;
    float _480 = _386 * 12.98980045318603515625;
    int _482 = ~_428;
    int _484 = _482 + 1;
    int _486 = _484 + 1;
    float _488 = _458 * _464;
    int _490 = _486;
    float _492 = _420;
    float _494 = _214;
    if (!_404)
    {
        int _496 = ~_428;
        int _498 = _496 + 1;
        _490 = _498;
    }
    int _500 = _490;
    float _502 = fma(_388, 78.233001708984375, _480);
    bool _504 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _506 = isnan(_214);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = fma(_390, 78.233001708984375, _480);
    float _518 = _388 * 12.98980045318603515625;
    float _520 = _502 * 0.15915493667125701904296875;
    bool _522 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _524 = isnan(_214);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = _516 * 0.15915493667125701904296875;
    float _536 = _514 * _478;
    float _538 = -_514;
    float _540 = _538 + 1.0;
    float _542 = fma(_386, 78.233001708984375, _518);
    float _544 = _520 * 6.283185482025146484375;
    float _546 = sin(_544);
    float _548 = in.m_55.x;
    float _550 = _532 * _540;
    float _552 = -_532;
    float _554 = _552 + 1.0;
    float _556 = _542 * 0.15915493667125701904296875;
    float _558 = -_276;
    float _560 = _558 + 1.0;
    bool _562 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _564 = isnan(_214);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = _276 * _554;
    float _576 = _534 * 6.283185482025146484375;
    float _578 = sin(_576);
    float _580 = fma(_390, 78.233001708984375, _518);
    bool _582 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _584 = isnan(_214);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = _572 * _560;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _598 = _596 != 0;
    float _600 = -_572;
    float _602 = _600 + 1.0;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _606 = _214 + _604;
    float _608 = _556 * 6.283185482025146484375;
    float _610 = sin(_608);
    float _612 = _580 * 0.15915493667125701904296875;
    float _614 = _592 * _602;
    float _616 = -_592;
    float _618 = _616 + 1.0;
    float _620 = fma(_396, _606, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _622 = _546 * 43758.546875;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _626 = _214 + _624;
    float _628 = _310 * _618;
    float _630 = _578 * 43758.546875;
    float _632 = -_310;
    float _634 = _632 + 1.0;
    float _636 = _606;
    float _638 = _634;
    if (!_598)
    {
        _636 = _250;
    }
    float _640 = _636;
    float _642 = _420 * _628;
    float _644 = floor(_630);
    float _646 = fma(_402, _626, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _648 = _640;
    if (!_598)
    {
        _492 = _640;
    }
    float _650 = _492;
    float _652 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[159].x, _642);
    float _654 = _610 * 43758.546875;
    float _656 = _650;
    if (_598)
    {
        _648 = _250;
    }
    float _658 = _648;
    if (_246)
    {
        _638 = _242;
    }
    float _660 = _638;
    float _662 = floor(_622);
    float _664 = fma(_426, _614, _652);
    float _666 = _660;
    float _668 = _548;
    if (!_246)
    {
        _666 = _548;
    }
    float _670 = _666;
    if (_246)
    {
        _494 = _548;
    }
    float _672 = _494;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _676 = -_376;
    float _678 = precise::max(_676, 1.0);
    float _680 = floor(_654);
    float _682 = -_644;
    float _684 = _630 + _682;
    float _686 = _670 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _688 = _672;
    if (!_246)
    {
        _688 = _222;
    }
    float _690 = _688;
    float _692 = _222 + _548;
    float _694 = precise::min(_678, 4.0);
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _698 = _612 * 6.283185482025146484375;
    float _700 = sin(_698);
    float _702 = _690 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _704 = _474 ? 0 : 1;
    float _706 = fma(_686, -2.0, _674);
    float _708 = -_662;
    float _710 = _622 + _708;
    float _712 = fma(_694, 0.3333333432674407958984375, -0.3333333432674407958984375);
    float _714 = -_696;
    float _716 = fma(_702, 2.0, _714);
    float _718 = _242 + _548;
    float _720 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _722 = log2(_720);
    float _724 = -_680;
    float _726 = _654 + _724;
    float _728 = _692 + (-1.0);
    int _730 = ~_704;
    int _732 = _730 + 1;
    int _734 = _732 + 1;
    float _736 = _718 + (-1.0);
    bool _738 = !_282;
    int _740 = _738 ? 0 : 1;
    float _742 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _744 = _700 * 43758.546875;
    int _746 = _734;
    if (!_460)
    {
        int _748 = ~_704;
        int _750 = _748 + 1;
        _746 = _750;
    }
    int _752 = _746;
    float _754 = fma(_430, _594, _664);
    float _756 = floor(_744);
    bool _758 = !_290;
    int _760 = _758 ? 0 : 1;
    int _762 = abs(_740);
    float _764 = _722 * _134;
    int _766 = abs(_760);
    float _768 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _770 = exp2(_764);
    float _772 = fma(_432, _574, _754);
    float _774 = float(_762);
    float _776 = float(_500);
    float _778 = fma(_434, _550, _772);
    float _780 = -_756;
    float _782 = _744 + _780;
    float _784 = _548 * 2.0;
    float _786 = _774 * _776;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _790 = 1.0 + _788;
    float _792 = float(_766);
    float _794 = fma(_620, _536, _778);
    float _796 = float(_752);
    float _798 = 1.0 / _790;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _802 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _804 = isnan(1.0);
    bool _806 = _802 || _804;
    bool _808 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _810 = _806 || _808;
    float _812 = _792 * _796;
    float _814 = -_770;
    float _816 = _814 + 1.0;
    float _818 = in.m_63.x;
    float _820 = in.m_63.y;
    float _822 = in.m_63.z;
    float _824 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[88].z, _800);
    float _826 = floor(_784);
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _830 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _832 = isnan(0.0);
    bool _834 = _830 || _832;
    bool _836 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _838 = _834 || _836;
    float _840 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _824);
    float _842 = _710 + _658;
    float _844 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[88].w, _828);
    float _846 = _838 ? _816 : 0.0;
    float _848 = -_134;
    float _850 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[86].x, _716);
    float _852 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[86].y, _706);
    float _854 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].w, _844);
    float _856 = fma(_134, 0.02500000037252902984619140625, _842);
    if (_810)
    {
        float _858 = _846 * _798;
        _154 = _858;
    }
    float _860 = _154;
    float _862 = _726 * _726;
    float _864 = _812 * (-2.0);
    float _866 = _856 * 16.0;
    float _868 = fma(_646, _488, _794);
    bool _870 = _826 > 0.0;
    float _872 = fma(_684, _684, _862);
    bool _874 = _826 >= 0.0;
    bool _876 = isnan(_826);
    bool _878 = _874 || _876;
    bool _880 = isnan(0.0);
    bool _882 = _878 || _880;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _886 = 1.0 + _884;
    float _888 = _548 + (-0.5);
    float _890 = fma(_782, _782, _872);
    int _892 = _882 ? 0 : 1;
    float _894 = fma(_190, _886, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    float _896 = fma(_864, _822, _822);
    float _898 = fma(_742, _864, _742);
    float _900 = _222 + (-0.5);
    float _902 = fma(_710, 0.4000000059604644775390625, _894);
    float _904 = precise::clamp(_902, 0.0, 1.0);
    float _906 = rsqrt(_890);
    int _908 = ~_892;
    int _910 = _908 + 1;
    int _912 = _910 + 1;
    float _914 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[196].z, _896);
    int _916 = _912;
    if (!_870)
    {
        int _918 = ~_892;
        int _920 = _918 + 1;
        _916 = _920;
    }
    int _922 = _916;
    float _924 = _786 * (-2.0);
    float _926 = _904 * _904;
    float _928 = _866 * 0.15915493667125701904296875;
    float _930 = fma(_710, -0.4000000059604644775390625, 1.0);
    float _932 = in.m_65.x;
    float _934 = in.m_65.y;
    float _936 = in.m_65.z;
    float _938 = fma(_924, _818, _818);
    float _940 = -_926;
    float _942 = fma(_940, _926, 1.0);
    float _944 = fma(_768, _924, _768);
    float _946 = -_190;
    float _948 = fma(_946, _930, 1.0);
    float _950 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[196].x, _938);
    float _952 = _942 * _712;
    bool _954 = !_286;
    int _956 = _954 ? 0 : 1;
    float _958 = _726 * _906;
    float _960 = fma(_944, _860, _950);
    int _962 = abs(_956);
    float _964 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[166].x, _868);
    float _966 = -_948;
    float _968 = fma(_966, _948, 1.0);
    float _970 = fma(_684, 2.0, -1.0);
    float _972 = in.m_67.x;
    float _974 = in.m_67.y;
    float _976 = in.m_67.z;
    float _978 = _684 * _906;
    float _980 = _782 * _906;
    float _982 = _960 * 0.15915493667125701904296875;
    float _984 = _958 * _958;
    float _986 = float(_962);
    float _988 = _930 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _990 = float(_922);
    float _992 = _928 * 6.283185482025146484375;
    float _994 = sin(_992);
    float _996 = _968 * _386;
    float _998 = fma(_978, _978, _984);
    float _1000 = _964 * _970;
    float _1002 = _1000 * 4.0;
    float _1004 = _986 * _990;
    float _1006 = fma(_996, _988, _386);
    float _1008 = _968 * _388;
    float _1010 = fma(_980, _980, _998);
    float _1012 = _1004 * (-2.0);
    float _1014 = fma(_996, _988, _932);
    float _1016 = _1002 * 0.15915493667125701904296875;
    float _1018 = fma(_1008, _988, _388);
    float _1020 = fma(_1008, _988, _934);
    float _1022 = _968 * _390;
    float _1024 = fma(_1012, _820, _820);
    float _1026 = rsqrt(_1010);
    float _1028 = fma(_898, _860, _914);
    float _1030 = fma(_1022, _988, _390);
    float _1032 = _242 + (-0.5);
    float _1034 = fma(_1022, _988, _936);
    float _1036 = _994 * 0.119999997317790985107421875;
    float _1038 = fma(_384, _1012, _384);
    float _1040 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1024);
    float _1042 = _1016 * 6.283185482025146484375;
    float _1044 = cos(_1042);
    float _1046 = fma(_976, _1036, _1034);
    float _1048 = fma(_972, _1036, _1014);
    float _1050 = fma(_974, _1036, _1020);
    float _1052 = fma(_1038, _860, _1040);
    float _1054 = -_1030;
    float _1056 = _1054 + _1046;
    float _1058 = -_1006;
    float _1060 = _1058 + _1048;
    float _1062 = -_1018;
    float _1064 = _1062 + _1050;
    float _1066 = _1016 * 6.283185482025146484375;
    float _1068 = sin(_1066);
    float _1070 = _952 * _1056;
    float _1072 = _952 * _1060;
    float _1074 = _952 * _1064;
    float _1076 = _978 * _1026;
    float _1078 = _980 * _1026;
    float _1080 = _958 * _1026;
    float _1082 = _1052 * 0.15915493667125701904296875;
    float _1084 = -_1044;
    float _1086 = _1084 + 1.0;
    float _1088 = _1028 * 0.15915493667125701904296875;
    float _1090 = _982 * 6.283185482025146484375;
    float _1092 = sin(_1090);
    float _1094 = _1076 * _1086;
    float _1096 = _1080 * _1086;
    float _1098 = _1078 * _1068;
    float _1100 = _1076 * _1068;
    float _1102 = _1080 * _1068;
    float _1104 = _982 * 6.283185482025146484375;
    float _1106 = cos(_1104);
    float _1108 = fma(_1080, _1094, _1098);
    float _1110 = -_1098;
    float _1112 = fma(_1080, _1094, _1110);
    float _1114 = fma(_1080, _1096, _1044);
    float _1116 = fma(_1078, _1096, _1100);
    float _1118 = -_1100;
    float _1120 = fma(_1078, _1096, _1118);
    float _1122 = _1078 * _1078;
    float _1124 = _1074 * _1114;
    float _1126 = -_1102;
    float _1128 = fma(_1078, _1094, _1126);
    float _1130 = fma(_1078, _1094, _1102);
    float _1132 = fma(_1076, _1094, _1044);
    float _1134 = fma(_1086, _1122, _1044);
    float _1136 = _1088 * 6.283185482025146484375;
    float _1138 = cos(_1136);
    float _1140 = fma(_1072, _1108, _1124);
    float _1142 = _1074 * _1112;
    float _1144 = _1074 * _1116;
    float _1146 = fma(_1070, _1120, _1140);
    float _1148 = fma(_1072, _1132, _1142);
    float _1150 = fma(_1072, _1128, _1144);
    float _1152 = _1082 * 6.283185482025146484375;
    float _1154 = sin(_1152);
    float _1156 = in.m_44.x;
    float _1158 = in.m_44.y;
    float _1160 = in.m_44.z;
    float _1162 = _1018 + _1146;
    float _1164 = fma(_1070, _1130, _1148);
    float _1166 = fma(_1070, _1134, _1150);
    bool _1168 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1170 = isnan(0.5);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1176 = _1172 || _1174;
    float _1178 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1162);
    float _1180 = _1006 + _1164;
    float _1182 = _1082 * 6.283185482025146484375;
    float _1184 = cos(_1182);
    float _1186 = _1106 * _1138;
    float _1188 = _1092 * _1138;
    float _1190 = _1178 * _278;
    float _1192 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1180);
    float _1194 = _1186 * _1190;
    float _1196 = _1088 * 6.283185482025146484375;
    float _1198 = sin(_1196);
    float _1200 = _1106 * _1154;
    float _1202 = _1092 * _1154;
    float _1204 = _1154 * _1138;
    float _1206 = _1192 * _298;
    float _1208 = _1188 * _1190;
    float _1210 = _1106 * _1184;
    float _1212 = _1184 * _1138;
    float _1214 = _1030 + _1166;
    float _1216 = _1092 * _1184;
    float _1218 = fma(_1198, _1210, _1202);
    float _1220 = fma(_1198, _1202, _1210);
    float _1222 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1214);
    float _1224 = -_1200;
    float _1226 = fma(_1198, _1216, _1224);
    float _1228 = -_1216;
    float _1230 = fma(_1198, _1200, _1228);
    float _1232 = -_1190;
    float _1234 = _1198 * _1232;
    float _1236 = _1222 * _364;
    float _1238 = fma(_1218, _1206, _1194);
    float _1240 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1242 = fma(_1212, _1206, _1234);
    float _1244 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1246 = fma(_1230, _1236, _1238);
    float _1248 = fma(_1226, _1206, _1208);
    float _1250 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1240);
    float _1252 = fma(_1204, _1236, _1242);
    float _1254 = _1246 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1256 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1244);
    float _1258 = fma(_1220, _1236, _1248);
    float _1260 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1250);
    float _1262 = _1246 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1264 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1254);
    float _1266 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1256);
    float _1268 = _1260 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1270 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1262);
    float _1272 = fma(_1258, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1264);
    float _1274 = _1266 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1276 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1278 = fma(_1258, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1270);
    float _1280 = _1268 + _1272;
    float _1282 = _1246 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1284 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1276);
    float _1286 = _1274 + _1278;
    float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1290 = _1280 + _1288;
    float _1292 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1282);
    float _1294 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1284);
    float _1296 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1298 = _1286 + _1296;
    float _1300 = _1290 * _1290;
    float _1302 = fma(_1258, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1292);
    float _1304 = fma(_1298, _1298, _1300);
    float _1306 = _1294 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1308 = sqrt(_1304);
    float _1310 = _1306 + _1302;
    bool _1312 = _1308 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1314 = _1156;
    float _1316 = _1160;
    float _1318 = _1294;
    float _1320 = _1286;
    float _1322 = _1180;
    float _1324 = _1214;
    float _1326 = _1162;
    if (!_1312)
    {
        _1314 = _1286;
    }
    float _1328 = _1314;
    float _1330 = _1328;
    if (!_1312)
    {
        _1316 = _1280;
    }
    float _1332 = _1316;
    float _1334 = _1332;
    if (!_1312)
    {
        _1318 = _1310;
    }
    float _1336 = _1318;
    bool _1338 = !_1312;
    float _1340 = _1336;
    if (!_1338)
    {
        float _1342 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1346 = _1308 + _1344;
        float _1348 = _1310 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1350 = rsqrt(_1304);
        float _1352 = _1346 * _1342;
        float _1354 = _1352 * 0.15915493667125701904296875;
        float _1356 = _1354 * 6.283185482025146484375;
        float _1358 = cos(_1356);
        float _1360 = _1354 * 6.283185482025146484375;
        float _1362 = sin(_1360);
        float _1364 = _1358 + (-1.0);
        float _1366 = _1364 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1368 = fma(_1362, _1348, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1370 = fma(_1310, _1358, _1366);
        float _1372 = _1350 * _1368;
        float _1374 = fma(_1298, _1372, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1376 = fma(_1290, _1372, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1330 = _1374;
        _1340 = _1370;
        _1334 = _1376;
    }
    float _1378 = _1330;
    float _1380 = _1340;
    float _1382 = _1334;
    float _1384 = _1380;
    float _1386 = _1378;
    float _1388 = _1382;
    if (!_1176)
    {
        float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1392 = _1306 + _1390;
        float _1394 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1396 = _1274 + _1394;
        float _1398 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1400 = -_1274;
        float _1402 = _1400 + _1378;
        float _1404 = _1392 * _1392;
        float _1406 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1408 = _1268 + _1406;
        float _1410 = -_1306;
        float _1412 = _1410 + _1380;
        float _1414 = -_1268;
        float _1416 = _1414 + _1382;
        float _1418 = fma(_1396, _1396, _1404);
        float _1420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1422 = fma(_1408, _1408, _1418);
        float _1424 = sqrt(_1422);
        float _1426 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1428 = precise::min(_1424, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1430 = _1428 * _1420;
        float _1432 = _1426 * _1430;
        float _1434 = fma(_1402, _1432, _1274);
        float _1436 = fma(_1412, _1432, _1306);
        float _1438 = fma(_1416, _1432, _1268);
        _1384 = _1436;
        _1386 = _1434;
        _1388 = _1438;
        _1320 = _1430;
    }
    float _1440 = _1384;
    float _1442 = _1386;
    float _1444 = _1388;
    float _1446 = _1320;
    float _1448 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1450 = _1440 + _1448;
    float _1452 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1454 = _1442 + _1452;
    float _1456 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1458 = _1444 + _1456;
    float _1460 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1462 = _1450 * _1450;
    float _1464 = fma(_1454, _1454, _1462);
    float _1466 = fma(_1458, _1458, _1464);
    float _1468 = rsqrt(_1466);
    float _1470 = sqrt(_1466);
    float _1472 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1474 = _1454 * _1472;
    float _1476 = _1458 * _1472;
    float _1478 = _1474 * _1474;
    float _1480 = _1476 * _1476;
    float _1482 = _1478 + _1480;
    float _1484 = sqrt(_1482);
    bool _1486 = _1484 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1488 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1490 = _1484 + _1488;
    float _1492 = _1458;
    float _1494 = _1482;
    float _1496 = _1490;
    float _1498 = _1446;
    float _1500 = _1472;
    if (_1486)
    {
        float _1502 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1492 = _1502;
    }
    float _1504 = _1492;
    if (_1486)
    {
        float _1506 = rsqrt(_1482);
        _1494 = _1506;
    }
    float _1508 = _1494;
    if (_1486)
    {
        float _1510 = _1490 * _1504;
        _1496 = _1510;
    }
    float _1512 = _1496;
    if (_1486)
    {
        float _1514 = _1512 * 0.15915493667125701904296875;
        _1498 = _1514;
    }
    float _1516 = _1498;
    float _1518 = _1468;
    float _1520 = _1516;
    if (_1486)
    {
        float _1522 = _1516 * 6.283185482025146484375;
        float _1524 = sin(_1522);
        _1518 = _1524;
    }
    float _1526 = _1518;
    float _1528 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1530 = precise::max(0.0, _1528);
    float _1532 = _1462;
    float _1534 = _1530;
    float _1536 = _1528;
    if (_1486)
    {
        float _1538 = _1516 * 6.283185482025146484375;
        float _1540 = cos(_1538);
        _1532 = _1540;
    }
    float _1542 = _1532;
    float _1544 = -_1472;
    float _1546 = -_1530;
    float _1548 = fma(_1450, _1544, _1546);
    float _1550 = _1548;
    if (_1486)
    {
        float _1552 = _1548 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1534 = _1552;
    }
    float _1554 = _1534;
    float _1556 = _1526;
    float _1558 = _1554;
    if (_1486)
    {
        float _1560 = fma(_1526, _1554, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1556 = _1560;
    }
    float _1562 = _1556;
    float _1564 = _1562;
    if (!_1486)
    {
        _1558 = _1478;
    }
    float _1566 = _1558;
    float _1568 = _1566;
    float _1570 = _1542;
    if (_1486)
    {
        float _1572 = _1542 + (-1.0);
        _1536 = _1572;
    }
    float _1574 = _1536;
    float _1576 = _1574;
    if (_1486)
    {
        float _1578 = _1508 * _1562;
        _1500 = _1578;
    }
    float _1580 = _1500;
    if (!_1486)
    {
        _1564 = _1474;
    }
    float _1582 = _1564;
    float _1584 = _1582;
    if (_1486)
    {
        float _1586 = _1574 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1520 = _1586;
    }
    float _1588 = _1520;
    if (_1486)
    {
        float _1590 = _1474 * _1580;
        _1584 = _1590;
    }
    float _1592 = _1584;
    if (!_1486)
    {
        _1576 = _1476;
    }
    float _1594 = _1576;
    float _1596 = _1594;
    if (_1486)
    {
        float _1598 = _1476 * _1580;
        _1596 = _1598;
    }
    float _1600 = _1596;
    if (_1486)
    {
        float _1602 = fma(_1548, _1542, _1588);
        _1550 = _1602;
    }
    float _1604 = _1550;
    if (_1486)
    {
        float _1606 = _1592 * _1592;
        _1568 = _1606;
    }
    float _1608 = _1568;
    if (!_1486)
    {
        _1570 = _1480;
    }
    float _1610 = _1570;
    float _1612 = _1610;
    if (_1486)
    {
        float _1614 = _1600 * _1600;
        _1612 = _1614;
    }
    float _1616 = _1612;
    float _1618 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1620 = fma(_1604, _1604, _1608);
    float _1622 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1618);
    float _1624 = _1620 + _1616;
    float _1626 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1628 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1630 = fma(_1470, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1628);
    float _1632 = precise::clamp(_1630, 0.0, 1.0);
    float _1634 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1622);
    float _1636 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1638 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1626);
    float _1640 = rsqrt(_1624);
    float _1642 = -_1632;
    float _1644 = _1642 + 1.0;
    float _1646 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1636);
    float _1648 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1638);
    float _1650 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1652 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1654 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1646);
    float _1656 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1658 = abs(_1644);
    float _1660 = log2(_1658);
    float _1662 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1650);
    float _1664 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1666 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1668 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1670 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1662);
    float _1672 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1666);
    float _1674 = _1640 * _1592;
    float _1676 = _1640 * _1604;
    float _1678 = _1640 * _1600;
    float _1680 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1672);
    float _1682 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1684 = _1670 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1686 = -_1668;
    float _1688 = fma(_1686, _1460, 1.0);
    float _1690 = -_1682;
    float _1692 = fma(_1676, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1690);
    float _1694 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1680);
    float _1696 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1698 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1700 = -_1678;
    float _1702 = fma(_1700, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1692);
    float _1704 = log2(_1688);
    float _1706 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1708 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1698);
    float _1710 = fma(_1702, -0.5, 0.5);
    float _1712 = fma(_1702, 0.5, 0.5);
    float _1714 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1706);
    float _1716 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1708);
    float _1718 = _1676 + 1.0;
    float _1720 = 1.0 / _1694;
    float _1722 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1714);
    float _1724 = sqrt(_1710);
    float _1726 = _1704 * 0.693147182464599609375;
    float _1728 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1730 = exp2(_1696);
    float _1732 = _1724 * 0.636619746685028076171875;
    float _1734 = fma(_1712, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1736 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1722);
    float _1738 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1716);
    float _1740 = fma(_1712, _1734, -0.212114393711090087890625);
    float _1742 = _1736 * _1720;
    float _1744 = -_1676;
    float _1746 = fma(_1730, _1718, _1744);
    float _1748 = fma(_1712, _1740, 1.570728778839111328125);
    float _1750 = _1738 * _1720;
    float _1752 = fma(_1742, 0.5, 0.5);
    float _1754 = -_1748;
    float _1756 = fma(_1732, _1754, 1.0);
    float _1758 = fma(_1750, -0.5, 0.5);
    float _1760 = fma(_1746, 0.5, 0.5);
    float3 _5125 = float3(_1752, _1758, _1728);
    float _1762 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5125, float3(0.0), isnan(_5125)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5125, float3(0.0), isnan(_5125)), level(0.0)).x;
    float3 _5136 = float3(_1752, _1758, _1728);
    float4 _1765 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5136, float3(0.0), isnan(_5136)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5136, float3(0.0), isnan(_5136)), level(0.0)).xyzw;
    float _1767 = _1765.x;
    float _1769 = _1765.y;
    float _1771 = _1765.z;
    float _1773 = _1765.w;
    float2 _5153 = float2(_1756, _1760);
    float3 _1777 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5153, float2(0.0), isnan(_5153)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5153, float2(0.0), isnan(_5153)), level(0.0)).xyz;
    float _1779 = _1777.x;
    float _1781 = _1777.y;
    float _1783 = _1777.z;
    float _1785 = in.m_59.y;
    bool _1787 = _242 > 0.5;
    float _1789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1793 = _1791 != 0;
    float _1795 = in.m_55.w;
    int _1797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1799 = _1797 != 0;
    int _1801 = 0;
    float _1803 = _1694;
    float _1805 = _1738;
    if (_598)
    {
        float _1807 = -_658;
        float _1809 = _1807 + 1.0;
        _1801 = as_type<int>(_1809);
    }
    int _1811 = _1801;
    int _1813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1815 = _1813 != 0;
    float _1817 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1821 = _1819 != 0;
    float _1823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_69.x = _1442;
    out.m_69.y = _1440;
    out.m_69.z = _1444;
    int _1825 = 0;
    if (_1793)
    {
        float _1827 = -_658;
        float _1829 = _1827 + 1.0;
        _1825 = as_type<int>(_1829);
    }
    int _1831 = _1825;
    float _1833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1835 = 0;
    if (_1815)
    {
        float _1837 = -_658;
        float _1839 = _1837 + 1.0;
        _1835 = as_type<int>(_1839);
    }
    int _1841 = _1835;
    float _1843 = -_1785;
    float _1845 = _1843 + 1.0;
    float _1847 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1849 = _1795 > 0.5;
    int _1851 = _1787 ? as_type<int>(_1845) : as_type<int>(_1785);
    int _1853 = _1849 ? as_type<int>(_1845) : as_type<int>(_1785);
    int _1855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1857 = _1855 != 0;
    float _1859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1861 = _1799 ? as_type<float>(_1851) : _1785;
    float _1863 = _1833 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1865 = _222 > 0.5;
    float _1867 = _1857 ? as_type<float>(_1853) : _1785;
    float _1869 = _1861 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1871 = in.m_71.x;
    float _1873 = in.m_71.y;
    float _1875 = in.m_71.z;
    float _1877 = in.m_71.w;
    float _1879 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1881 = _1857;
    float _1883 = _1785;
    float _1885 = _1845;
    if (_598)
    {
        bool _1887 = _548 > 0.5;
        _1881 = _1887;
    }
    bool _1889 = _1881;
    if (!_1793)
    {
        _668 = _658;
    }
    float _1891 = _668;
    float _1893 = _1891;
    if (_1821)
    {
        float _1895 = _1865 ? _1845 : _1785;
        _1883 = _1895;
    }
    float _1897 = _1883;
    if (_1793)
    {
        float _1899 = _1787 ? as_type<float>(_1831) : _658;
        _1893 = _1899;
    }
    float _1901 = _1893;
    float _1903 = _1789 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (!_1815)
    {
        _1885 = _658;
    }
    float _1905 = _1885;
    float _1907 = fma(_1863, _1897, -0.5);
    float _1909 = _1905;
    if (_1815)
    {
        float _1911 = _1865 ? as_type<float>(_1841) : _658;
        _1909 = _1911;
    }
    float _1913 = _1909;
    float _1915 = fma(_1903, _1901, -0.5);
    float _1917 = _1867 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_598)
    {
        float _1919 = _1889 ? as_type<float>(_1811) : _658;
        _656 = _1919;
    }
    float _1921 = _656;
    float _1923 = _1869 * _1847;
    float _1925 = _1913 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1927 = _1917 * _1823;
    float _1929 = -_1018;
    bool _1931 = _1146 != _1929;
    bool _1933 = isnan(_1146);
    bool _1935 = _1931 || _1933;
    bool _1937 = isnan(_1929);
    bool _1939 = _1935 || _1937;
    float _1941 = _1921 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1943 = _1925 * _1879;
    float _1945 = fma(_840, _1915, _850);
    float _1947 = -_852;
    float _1949 = fma(_854, _1907, _1947);
    float _1951 = _1186 * _1873;
    float _1953 = -_1873;
    float _1955 = _1198 * _1953;
    float _1957 = _1941 * _1859;
    float _1959 = _1188 * _1873;
    float _1961 = fma(_1218, _1871, _1951);
    float _1963 = fma(_1212, _1871, _1955);
    float _1965 = _1180 * _1875;
    out.m_73.x = _1957;
    out.m_73.y = _1923;
    out.m_73.z = _1943;
    out.m_73.w = _1927;
    float _1967 = fma(_1230, _1875, _1961);
    float _1969 = fma(_1204, _1875, _1963);
    float _1971 = fma(_1226, _1871, _1959);
    float _1973 = -_1006;
    bool _1975 = _1164 == _1973;
    bool _1977 = !_1939;
    bool _1979 = _1975 && _1977;
    float _1981 = _1967 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1983 = _1162 * _1871;
    float _1985 = fma(_1220, _1875, _1971);
    float _1987 = -_1965;
    float _1989 = fma(_1214, _1871, _1987);
    float _1991 = fma(_1969, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1981);
    float _1993 = -_1030;
    bool _1995 = _1166 == _1993;
    bool _1997 = _1995 && _1979;
    float _1999 = -_1983;
    float _2001 = fma(_1180, _1873, _1999);
    float _2003 = exp2(_1817);
    float _2005 = _1945 + 0.5;
    float _2007 = _1967 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2009 = _1967 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2011 = fma(_1985, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1991);
    float _2013 = _2001 * _1877;
    float _2015 = fma(_1969, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2007);
    float _2017 = fma(_1969, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2009);
    float _2019 = _1949 + 0.5;
    float _2021 = fma(_1985, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2015);
    float _2023 = fma(_1985, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2017);
    float _2025 = _1214 * _1873;
    float _2027 = _1989 * _1877;
    if (!_1997)
    {
        float _2029 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1180);
        _1322 = _2029;
    }
    float _2031 = _1322;
    if (!_1997)
    {
        float _2033 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1214);
        _1324 = _2033;
    }
    float _2035 = _1324;
    float _2037 = -_2025;
    float _2039 = fma(_1162, _1875, _2037);
    float _2041 = _1186 * _2027;
    float _2043 = -_2027;
    float _2045 = _1198 * _2043;
    out.m_75.x = _2011;
    out.m_75.y = _2021;
    out.m_75.z = _2023;
    float _2047 = _2039 * _1877;
    if (!_1997)
    {
        float _2049 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1162);
        _1326 = _2049;
    }
    float _2051 = _1326;
    float _2053 = -_2003;
    float _2055 = _2053 + 1.0;
    out.m_77.x = _2005;
    out.m_77.y = _2019;
    float _2057 = fma(_1218, _2047, _2041);
    float _2059 = fma(_1212, _2047, _2045);
    float _2061 = _1186 * _2051;
    float _2063 = -_2051;
    float _2065 = _1198 * _2063;
    float _2067 = fma(_1230, _2013, _2057);
    float _2069 = fma(_1204, _2013, _2059);
    float _2071 = fma(_1218, _2031, _2061);
    float _2073 = _1188 * _2027;
    float _2075 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2077 = _1188 * _2051;
    float _2079 = _2067 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2081 = fma(_1226, _2047, _2073);
    float _2083 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2075);
    float _2085 = _2067 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2087 = _2067 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2089 = fma(_1226, _2031, _2077);
    float _2091 = fma(_1220, _2013, _2081);
    float _2093 = fma(_2069, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2085);
    float _2095 = fma(_2069, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2079);
    float _2097 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2083);
    float _2099 = fma(_1212, _2031, _2065);
    float _2101 = fma(_1230, _2035, _2071);
    float _2103 = fma(_2069, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2087);
    float _2105 = fma(_1220, _2035, _2089);
    float _2107 = fma(_2091, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2093);
    float _2109 = fma(_2091, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2095);
    float _2111 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2097);
    float _2113 = fma(_1204, _2035, _2099);
    float _2115 = _2101 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2117 = _2055 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2119 = fma(_2091, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2103);
    float _2121 = _2111 + _1694;
    float _2123 = _2101 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2125 = fma(_2113, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2115);
    float _2127 = _2101 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2129 = _2121 * 0.5;
    float _2131 = fma(_2113, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2123);
    float _2133 = fma(_2105, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2125);
    float _2135 = fma(_2113, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2127);
    float _2137 = -_2117;
    float _2139 = _2137 + 1.0;
    out.m_79.z = _2129;
    out.m_79.w = _1694;
    float _2141 = fma(_2105, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2131);
    float _2143 = fma(_2105, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2135);
    bool _2145 = _1470 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2147 = isnan(_1470);
    bool _2149 = _2145 || _2147;
    bool _2151 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2153 = _2149 || _2151;
    out.m_81.x = _2107;
    out.m_81.y = _2109;
    out.m_81.z = _2119;
    out.m_83.x = _2133;
    out.m_83.y = _2141;
    out.m_83.z = _2143;
    out.gl_Position.x = _1736;
    out.gl_Position.y = _1738;
    out.gl_Position.z = _2111;
    out.gl_Position.w = _1694;
    float _2155 = _2109;
    float _2157 = _2107;
    float _2159 = _2111;
    float _2161 = _1736;
    if (!_2153)
    {
        _2155 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2163 = _2155;
    float _2165 = _2163;
    float _2167 = _2163;
    if (!_2153)
    {
        _2157 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2169 = _2157;
    float _2171 = _2169;
    float _2173 = _2169;
    if (!_2153)
    {
        _1803 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2175 = _1803;
    float _2177 = _2175;
    float _2179 = _2175;
    if (!_2153)
    {
        _2159 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2181 = _2159;
    float _2183 = _2181;
    float _2185 = _2181;
    if (!_2153)
    {
        _1805 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2187 = _1805;
    float _2189 = _2187;
    float _2191 = _2187;
    if (!_2153)
    {
        _2161 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2193 = _2161;
    float _2195 = _2117 * _1762;
    float _2197 = _1773 * _2139;
    float _2199 = _1773 * _2195;
    float _2201 = _1783 * _2195;
    float _2203 = fma(_1779, _2199, _1767);
    float _2205 = fma(_1781, _2199, _1769);
    float _2207 = fma(_1773, _2201, _1771);
    out.m_85.x = _2203;
    out.m_85.y = _2205;
    out.m_85.z = _2207;
    out.m_85.w = _2197;
    bool _2209 = !_2153;
    float _2211 = _2193;
    float _2213 = _2193;
    if (!_2209)
    {
        bool _2215 = _1470 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2217 = isnan(_1470);
        bool _2219 = _2215 || _2217;
        bool _2221 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2223 = _2219 || _2221;
        if (!_2223)
        {
            float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2227 = _1470 + _2225;
            float _2229 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2231 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2229;
            float _2233 = 1.0 / _2231;
            float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2237 = _2235 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2239 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2241 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2245 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2249 = _2247 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2255 = _2227 * _2233;
            float _2257 = precise::clamp(_2255, 0.0, 1.0);
            float _2259 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2261 = _2259 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2263 = fma(_2257, _2237, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2265 = fma(_2257, _2261, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2267 = fma(_2257, _2241, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2269 = fma(_2257, _2245, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2271 = fma(_2257, _2249, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2273 = fma(_2257, _2253, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2173 = _2265;
            _2191 = _2271;
            _2167 = _2263;
            _2185 = _2269;
            _2179 = _2267;
            _2213 = _2273;
            _2275 = true;
        }
        else
        {
            bool _2277 = _1470 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2279 = isnan(_1470);
            bool _2281 = _2277 || _2279;
            bool _2283 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2285 = _2281 || _2283;
            if (!_2285)
            {
                _2165 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2287 = _2165;
            _2167 = _2287;
            if (!_2285)
            {
                _2171 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2289 = _2171;
            _2173 = _2289;
            if (!_2285)
            {
                _2177 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2291 = _2177;
            _2179 = _2291;
            if (!_2285)
            {
                _2183 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2293 = _2183;
            _2185 = _2293;
            if (!_2285)
            {
                _2189 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2295 = _2189;
            _2191 = _2295;
            if (!_2285)
            {
                _2211 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2297 = _2211;
            bool _2299 = !_2285;
            _2213 = _2297;
            if (!_2299)
            {
                bool _2301 = _1470 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2303 = isnan(_1470);
                bool _2305 = _2301 || _2303;
                bool _2307 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2309 = _2305 || _2307;
                if (!_2309)
                {
                    float _2311 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2313 = _1470 + _2311;
                    float _2315 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2317 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2315;
                    float _2319 = 1.0 / _2317;
                    float _2321 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2323 = _2321 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2327 = _2325 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2329 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2331 = _2329 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2337 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2339 = _2337 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2341 = _2313 * _2319;
                    float _2343 = precise::clamp(_2341, 0.0, 1.0);
                    float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2347 = _2345 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2349 = fma(_2343, _2323, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2351 = fma(_2343, _2347, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2353 = fma(_2343, _2327, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2355 = fma(_2343, _2331, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2357 = fma(_2343, _2335, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2359 = fma(_2343, _2339, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2173 = _2351;
                    _2191 = _2357;
                    _2167 = _2349;
                    _2185 = _2355;
                    _2179 = _2353;
                    _2213 = _2359;
                    _2275 = true;
                }
                else
                {
                    _2173 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2191 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2167 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2185 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2179 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2213 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2275 = false;
    float _2361 = _2173;
    float _2363 = _2191;
    float _2365 = _2167;
    float _2367 = _2185;
    float _2369 = _2179;
    float _2371 = _2213;
    float _2373 = fma(_2141, -0.5, 0.5);
    float _2375 = precise::clamp(_2373, 0.0, 1.0);
    float _2377 = -_2361;
    float _2379 = _2377 + _2363;
    float _2381 = -_2365;
    float _2383 = _2381 + _2367;
    float _2385 = -_2369;
    float _2387 = _2385 + _2371;
    bool _2389 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2391 = fma(_2375, _2379, _2361);
    float _2393 = fma(_2375, _2383, _2365);
    float _2395 = fma(_2375, _2387, _2369);
    float _2397 = _2391 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _2399 = fma(_2393, 0.298911988735198974609375, _2397);
    float _2401 = fma(_2395, 0.114477999508380889892578125, _2399);
    out.m_87.x = 0.0;
    float _2403 = -_2401;
    float _2405 = _2393 + _2403;
    float _2407 = -_2401;
    float _2409 = _2391 + _2407;
    float _2411 = -_2401;
    float _2413 = _2395 + _2411;
    float _2415 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2417 = fma(_2405, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2401);
    float _2419 = fma(_2409, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2401);
    float _2421 = fma(_2413, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2401);
    out.m_89.w = _2415;
    out.m_91.x = _2417;
    out.m_91.y = _2419;
    out.m_91.z = _2421;
    if (!_2389)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2423 = -_1440;
    float _2425 = _2423 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2427 = -_1442;
    float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2431 = -_1444;
    float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2435 = _2425 * _2425;
    float _2437 = fma(_2429, _2429, _2435);
    float _2439 = fma(_2433, _2433, _2437);
    float _2441 = sqrt(_2439);
    float _2443 = rsqrt(_2439);
    float _2445 = -_2441;
    float _2447 = _2445 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2449 = _2447 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2451 = precise::clamp(_2449, 0.0, 1.0);
    float _2453 = _2429 * _2443;
    float _2455 = _2425 * _2443;
    float _2457 = abs(_2451);
    float _2459 = log2(_2457);
    float _2461 = _2433 * _2443;
    float _2463 = _2453 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2465 = _2141 * _2455;
    float _2467 = -_2455;
    float _2469 = -_2463;
    float _2471 = fma(_2467, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2469);
    float _2473 = fma(_2133, _2453, _2465);
    float _2475 = -_2461;
    float _2477 = fma(_2475, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2471);
    float _2479 = fma(_2143, _2461, _2473);
    float _2481 = precise::clamp(_2479, 0.0, 1.0);
    float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2485 = _2477 + _2483;
    float _2487 = _2459 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2489 = _2485 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2491 = precise::clamp(_2489, 0.0, 1.0);
    float _2493 = exp2(_2487);
    float _2495 = _2493 * _2491;
    float _2497 = _2481 * _2495;
    float _2499 = _2497 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2501 = _2497 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2503 = _2497 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2499;
    out.m_87.y = _2501;
    out.m_87.z = _2503;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

