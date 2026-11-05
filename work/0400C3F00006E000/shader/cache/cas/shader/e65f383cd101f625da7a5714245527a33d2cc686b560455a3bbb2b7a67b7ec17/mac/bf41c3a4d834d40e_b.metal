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
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_63 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_81 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 m_59 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_73 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
    float4 m_49 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_42.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    float _110 = as_type<float>(_102);
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _108;
    if (!_106)
    {
        out.m_45.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1820 = as_type<float>(_118);
        out.gl_Position.z = _1820;
    }
    if (!_106)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _122 = in.m_47.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = _136;
    if (_132)
    {
        float _140 = float(_102);
        _110 = _140;
    }
    float _142 = _110;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _120 = as_type<int>(_154);
    }
    int _156 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1890 = as_type<float>(_156);
        out.gl_Position.z = _1890;
    }
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _158 = in.m_49.w;
    float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _162 = in.m_49.x;
    float _164 = in.m_49.y;
    float _166 = in.m_49.z;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _170 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _172 = in.m_51.x;
    float _174 = in.m_53.x;
    float _176 = in.m_53.y;
    float _178 = in.m_53.z;
    float _180 = -(*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[194].y + _180;
    float _184 = in.m_55.w;
    float _186 = 0.0;
    if (_168)
    {
        float _188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _186 = _188;
    }
    float _190 = _186;
    float _192 = in.m_47.x;
    float _194 = in.m_47.y;
    float _196 = in.m_47.z;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _208 = _206 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _210 = _158 * 78.233001708984375;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _214 = _212 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _218 = _216 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _220;
    float _224 = -_160;
    float _226 = fma(_170, _224, _164);
    float _228 = fma(_162, 12.98980045318603515625, _210);
    float _230 = fma(_182, _164, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    bool _232 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _236 = _232 || _234;
    bool _238 = isnan(1.0);
    bool _240 = _236 || _238;
    float _242 = floor(_226);
    float _244 = _228 * 0.15915493667125701904296875;
    float _246 = 0.0;
    if (_168)
    {
        float _248 = _172 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        _246 = _248;
    }
    float _250 = _246;
    float _252 = fma(_218, _162, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    float _254 = fma(_222, _166, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _256 = precise::max(_230, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    float _258 = _244 * 6.283185482025146484375;
    float _260 = sin(_258);
    float _262 = precise::min(_256, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _264 = precise::max(_252, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    float _266 = precise::max(_254, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _268 = -_262;
    float _270 = _268 + _176;
    float _272 = precise::min(_264, (*spvDescriptorSet0.vp_c9)._m0[194].x);
    float _274 = -_242;
    float _276 = _226 + _274;
    float _278 = 1.0 / _200;
    float _280 = in.m_42.x;
    float _282 = in.m_42.y;
    float _284 = in.m_42.z;
    float _286 = precise::min(_266, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _288 = _250;
    float _290 = _262;
    float _292 = _256;
    if (_168)
    {
        float _294 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[14].x, _276);
        _288 = _294;
    }
    float _296 = _288;
    float _298 = -_272;
    float _300 = _298 + _174;
    float _302 = _276 * _276;
    float _304 = _260 * 43758.546875;
    float _306 = _296;
    if (_168)
    {
        float _308 = _296 * _190;
        _306 = _308;
    }
    float _310 = _306;
    float _312 = 1.0 / _208;
    float _314 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _316 = -_286;
    float _318 = _316 + _178;
    float _320 = _314;
    if (!_240)
    {
        float _322 = _314 * _314;
        float _324 = _322 * 0.5;
        _290 = _324;
    }
    float _326 = _290;
    float _328 = 1.0 / _204;
    float _330 = _326;
    if (!_240)
    {
        float _332 = _326 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _330 = _332;
    }
    float _334 = _330;
    float _336 = 1.0 / _214;
    float _338 = floor(_304);
    float _340 = 0.0;
    float _342 = _334;
    if (_168)
    {
        float _344 = floor(_310);
        _340 = _344;
    }
    float _346 = _340;
    bool _348 = !_240;
    if (!_348)
    {
        float _350 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _352 = log2(_350);
        float _354 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _356 = _354 + 1.0;
        float _358 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _360 = _314 * _352;
        float _362 = 1.0 / _356;
        float _364 = _358 * 0.693147182464599609375;
        float _366 = exp2(_360);
        float _368 = 1.0 / _364;
        float _370 = _366 + (-1.0);
        float _372 = -_370;
        float _374 = fma(_372, _368, _314);
        float _376 = _374 * _362;
        float _378 = _376 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _342 = _378;
        _292 = _368;
    }
    float _380 = _342;
    float _382 = _292;
    bool _384 = !_240;
    float _386 = _382;
    if (!_384)
    {
        float _388 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _390 = log2(_388);
        float _392 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _394 = _392 + 1.0;
        float _396 = 1.0 / _394;
        float _398 = _314 * _390;
        float _400 = exp2(_398);
        float _402 = -_400;
        float _404 = _402 + 1.0;
        float _406 = _404 * _396;
        _320 = _406;
    }
    float _408 = _320;
    float _410 = _302 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    if (!_168)
    {
        _386 = _276;
    }
    float _412 = _386;
    float _414 = _412;
    if (_168)
    {
        float _416 = -_346;
        float _418 = _310 + _416;
        _414 = _418;
    }
    float _420 = _414;
    float _422 = _380 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _424 = fma(_182, _410, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    float _426 = _380 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _428 = _380 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _430;
    float _434 = -_338;
    float _436 = _304 + _434;
    float _438 = fma(_408, _196, _428);
    float _440 = fma(_408, _192, _426);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _446;
    float _450 = 1.0 / _432;
    float _452 = fma(_438, _184, _284);
    float _454 = fma(_408, _194, _422);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _458 = _420 + _456;
    float _460 = fma(_440, _184, _280);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _464 = _420 + _462;
    float _466 = fma(_454, _184, _282);
    float _468 = _458 * _336;
    float _470 = 1.0 / _448;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _474 = _420 + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _478 = _420 + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _482 = _420 + _480;
    float _484 = _464 * _278;
    float _486 = _474 * _312;
    float _488 = 1.0 / _444;
    float _490 = _478 * _328;
    float _492 = _482 * _450;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _496 = _420 + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _514 = _496 * _470;
    float _516 = fma(_500, _484, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _518 = fma(_504, _484, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _520;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _532;
    float _536 = fma(_522, _484, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _538;
    float _542 = fma(_508, _486, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _544 = fma(_526, _486, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _546 = fma(_512, _486, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    bool _556 = _436 >= 0.5;
    bool _558 = isnan(_436);
    bool _560 = _556 || _558;
    bool _562 = isnan(0.5);
    bool _564 = _560 || _562;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _570 = fma(_530, _490, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _572 = fma(_540, _490, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _574 = fma(_534, _490, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _576 = fma(_550, _468, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _578 = fma(_554, _468, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    bool _580 = !_564;
    float _582 = _580 ? (-1.0) : 1.0;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _586 = _420 + _584;
    float _588 = fma(_568, _468, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _594;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _598;
    bool _602 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _604 = isnan(_420);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = _586 * _488;
    float _616 = _582 * 0.4000000059604644775390625;
    float _618 = _302 * 5.0;
    float _620 = fma(_592, _492, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _622 = fma(_596, _492, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _624 = fma(_600, _492, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    bool _626 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _628 = isnan(_420);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = -_612;
    float _640 = _638 + 1.0;
    float _642 = _618 * _616;
    bool _644 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _646 = isnan(_420);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _660 = _636 * _640;
    float _662 = -_636;
    float _664 = _662 + 1.0;
    bool _666 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _668 = isnan(_420);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = fma(_436, 3.1415927410125732421875, _642);
    bool _680 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _682 = isnan(_420);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = _654 * _664;
    float _694 = -_654;
    float _696 = _694 + 1.0;
    float _698 = -_676;
    float _700 = _698 + 1.0;
    bool _702 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _704 = isnan(_420);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _710 = _706 || _708;
    float _712 = float(_710);
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _718 = _676 * _696;
    float _720 = _690 * _700;
    float _722 = -_690;
    float _724 = _722 + 1.0;
    float _726 = _678 * 0.15915493667125701904296875;
    bool _728 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _730 = isnan(_420);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _744 = _712 * _724;
    bool _746 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _748 = isnan(_420);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = fma(_658, _614, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _760 = fma(_716, _614, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _762 = -_712;
    float _764 = _762 + 1.0;
    float _766 = _516 * _744;
    float _768 = _726 * 6.283185482025146484375;
    float _770 = sin(_768);
    float _772 = _536 * _744;
    float _774 = _518 * _744;
    float _776 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[159].x, _766);
    float _778 = -_738;
    float _780 = _778 + 1.0;
    float _782 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[159].y, _772);
    float _784 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[159].z, _774);
    float _786 = fma(_542, _720, _776);
    float _788 = fma(_544, _720, _782);
    float _790 = _612 * _780;
    float _792 = fma(_570, _718, _786);
    float _794 = fma(_546, _720, _784);
    float _796 = fma(_572, _718, _788);
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _798;
    float _802 = fma(_576, _692, _792);
    float _804 = _770 * 1.256637096405029296875;
    float _806 = fma(_742, _614, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _808 = -_756;
    float _810 = _808 + 1.0;
    float _812 = fma(_620, _660, _802);
    float _814 = _804 * 0.15915493667125701904296875;
    float _816 = fma(_578, _692, _796);
    float _818 = fma(_574, _718, _794);
    float _820 = fma(_800, _514, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _822 = _738 * _810;
    float _824 = fma(_806, _790, _812);
    float _826 = _814 * 6.283185482025146484375;
    float _828 = sin(_826);
    float _830 = fma(_588, _692, _818);
    float _832 = _642 * 0.15915493667125701904296875;
    float _834 = fma(_820, _822, _824);
    float _836 = in.m_55.x;
    float _838 = in.m_55.y;
    float _840 = in.m_55.z;
    float _842 = fma(_624, _660, _830);
    float _844 = _814 * 6.283185482025146484375;
    float _846 = cos(_844);
    float _848 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[166].x, _834);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _850;
    float _854 = fma(_622, _660, _816);
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _856;
    float _860 = _848 * _318;
    float _862 = fma(_852, _514, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _864 = fma(_760, _790, _842);
    float _866 = _832 * 6.283185482025146484375;
    float _868 = sin(_866);
    float _870 = fma(_858, _514, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _872 = fma(_758, _790, _854);
    float _874 = _848 * _270;
    float _876 = _860 * _828;
    float _878 = fma(_862, _822, _864);
    float _880 = fma(_870, _822, _872);
    float _882 = _848 * _300;
    float _884 = _832 * 6.283185482025146484375;
    float _886 = cos(_884);
    float _888 = _860 * _846;
    float _890 = -_876;
    float _892 = fma(_874, _846, _890);
    float _894 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[166].z, _878);
    float _896 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[166].y, _880);
    float _898 = fma(_874, _828, _888);
    float _900 = _840 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _902 = _892 * _868;
    float _904 = fma(_286, _894, _898);
    float _906 = _838 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _908 = _900 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _910 = _836 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _912 = _906 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _914 = _892 * _886;
    float _916 = -_902;
    float _918 = fma(_882, _886, _916);
    float _920 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _904);
    float _922 = _910 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _924 = fma(_882, _868, _914);
    float _926 = fma(_272, _896, _918);
    float _928 = _920 * _908;
    float _930 = _466 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _932 = _924 + _424;
    float _934 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _926);
    float _936 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[6].x, _930);
    float _938 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _932);
    float _940 = _934 * _922;
    float _942 = fma(_452, (*spvDescriptorSet0.vp_c10)._m0[6].z, _936);
    float _944 = _938 * _912;
    float _946 = _466 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _948 = _466 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _950 = _944 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _952 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[4].x, _946);
    float _954 = _944 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _956 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[5].x, _948);
    float _958 = fma(_940, (*spvDescriptorSet0.vp_c10)._m0[10].x, _950);
    float _960 = fma(_452, (*spvDescriptorSet0.vp_c10)._m0[4].z, _952);
    float _962 = _942 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _964 = fma(_940, (*spvDescriptorSet0.vp_c10)._m0[8].x, _954);
    float _966 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[10].z, _958);
    float _968 = _960 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _970 = _944 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _972 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[8].z, _964);
    float _974 = _962 + _966;
    float _976 = fma(_940, (*spvDescriptorSet0.vp_c10)._m0[9].x, _970);
    float _978 = _968 + _972;
    float _980 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _982 = _974 + _980;
    float _984 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[9].z, _976);
    float _986 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _988 = _978 + _986;
    float _990 = _982 * _982;
    float _992 = fma(_988, _988, _990);
    float _994 = fma(_452, (*spvDescriptorSet0.vp_c10)._m0[5].z, _956);
    float _996 = sqrt(_992);
    float _998 = _994 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1000 = _998 + _984;
    bool _1002 = _996 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1004 = _970;
    float _1006 = _452;
    float _1008 = _956;
    float _1010 = _974;
    float _1012 = _1000;
    if (!_1002)
    {
        _1004 = _978;
    }
    float _1014 = _1004;
    float _1016 = _1014;
    if (!_1002)
    {
        _1006 = _974;
    }
    float _1018 = _1006;
    float _1020 = _1018;
    if (!_1002)
    {
        _1008 = _1000;
    }
    float _1022 = _1008;
    bool _1024 = !_1002;
    float _1026 = _1022;
    if (!_1024)
    {
        float _1028 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1030 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1032 = _996 + _1030;
        float _1034 = rsqrt(_992);
        float _1036 = _1032 * _1028;
        float _1038 = _1000 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1040 = _1036 * 0.15915493667125701904296875;
        float _1042 = _1040 * 6.283185482025146484375;
        float _1044 = cos(_1042);
        float _1046 = _1040 * 6.283185482025146484375;
        float _1048 = sin(_1046);
        float _1050 = _1044 + (-1.0);
        float _1052 = _1050 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1054 = fma(_1048, _1038, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1056 = fma(_1000, _1044, _1052);
        float _1058 = _1034 * _1054;
        float _1060 = fma(_988, _1058, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1062 = fma(_982, _1058, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1026 = _1056;
        _1016 = _1060;
        _1020 = _1062;
    }
    float _1064 = _1026;
    float _1066 = _1016;
    float _1068 = _1020;
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1072 = _1064 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1076 = _1066 + _1074;
    float _1078 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1080 = _1068 + _1078;
    float _1082 = _1072 * _1072;
    float _1084 = fma(_1076, _1076, _1082);
    float _1086 = fma(_1080, _1080, _1084);
    float _1088 = rsqrt(_1086);
    float _1090 = sqrt(_1086);
    float _1092 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1094 = _1076 * _1092;
    float _1096 = _1080 * _1092;
    float _1098 = _1094 * _1094;
    float _1100 = _1096 * _1096;
    float _1102 = _1098 + _1100;
    float _1104 = sqrt(_1102);
    bool _1106 = _1104 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1108 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1110 = _1104 + _1108;
    float _1112 = _1088;
    float _1114 = _1110;
    float _1116 = _1092;
    if (_1106)
    {
        float _1118 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1112 = _1118;
    }
    float _1120 = _1112;
    if (_1106)
    {
        float _1122 = rsqrt(_1102);
        _1010 = _1122;
    }
    float _1124 = _1010;
    float _1126 = _1124;
    if (_1106)
    {
        float _1128 = _1110 * _1120;
        _1114 = _1128;
    }
    float _1130 = _1114;
    if (_1106)
    {
        float _1132 = _1130 * 0.15915493667125701904296875;
        _1012 = _1132;
    }
    float _1134 = _1012;
    float _1136 = _1080;
    if (_1106)
    {
        float _1138 = _1134 * 6.283185482025146484375;
        float _1140 = sin(_1138);
        _1136 = _1140;
    }
    float _1142 = _1136;
    float _1144 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1146 = precise::max(0.0, _1144);
    float _1148 = _978;
    float _1150 = _1146;
    float _1152 = _1144;
    if (_1106)
    {
        float _1154 = _1134 * 6.283185482025146484375;
        float _1156 = cos(_1154);
        _1148 = _1156;
    }
    float _1158 = _1148;
    float _1160 = -_1092;
    float _1162 = -_1146;
    float _1164 = fma(_1072, _1160, _1162);
    float _1166 = _1164;
    if (_1106)
    {
        float _1168 = _1164 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1150 = _1168;
    }
    float _1170 = _1150;
    float _1172 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1174 = _1142;
    float _1176 = _1170;
    if (_1106)
    {
        float _1178 = fma(_1142, _1170, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1174 = _1178;
    }
    float _1180 = _1174;
    float _1182 = _1180;
    if (!_1106)
    {
        _1176 = _1098;
    }
    float _1184 = _1176;
    float _1186 = _1184;
    float _1188 = _1158;
    if (_1106)
    {
        float _1190 = _1158 + (-1.0);
        _1152 = _1190;
    }
    float _1192 = _1152;
    float _1194 = _1192;
    if (_1106)
    {
        float _1196 = _1124 * _1180;
        _1116 = _1196;
    }
    float _1198 = _1116;
    if (!_1106)
    {
        _1182 = _1094;
    }
    float _1200 = _1182;
    float _1202 = _1200;
    if (_1106)
    {
        float _1204 = _1192 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1126 = _1204;
    }
    float _1206 = _1126;
    if (_1106)
    {
        float _1208 = _1094 * _1198;
        _1202 = _1208;
    }
    float _1210 = _1202;
    if (!_1106)
    {
        _1194 = _1096;
    }
    float _1212 = _1194;
    float _1214 = _1212;
    if (_1106)
    {
        float _1216 = _1096 * _1198;
        _1214 = _1216;
    }
    float _1218 = _1214;
    if (_1106)
    {
        float _1220 = fma(_1164, _1158, _1206);
        _1166 = _1220;
    }
    float _1222 = _1166;
    if (_1106)
    {
        float _1224 = _1210 * _1210;
        _1186 = _1224;
    }
    float _1226 = _1186;
    if (!_1106)
    {
        _1188 = _1100;
    }
    float _1228 = _1188;
    float _1230 = _1228;
    if (_1106)
    {
        float _1232 = _1218 * _1218;
        _1230 = _1232;
    }
    float _1234 = _1230;
    float _1236 = fma(_1222, _1222, _1226);
    float _1238 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1240 = _1236 + _1234;
    float _1242 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1172);
    float _1244 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1246 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1248 = fma(_1090, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1246);
    float _1250 = precise::clamp(_1248, 0.0, 1.0);
    float _1252 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1254 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1242);
    float _1256 = rsqrt(_1240);
    float _1258 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1260 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1244);
    float _1262 = -_1250;
    float _1264 = _1262 + 1.0;
    float _1266 = _1254 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1268 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1258);
    float _1270 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1260);
    float _1272 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1252);
    float _1274 = abs(_1264);
    float _1276 = log2(_1274);
    float _1278 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1268);
    float _1280 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1282 = _1266 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1284 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1272);
    float _1286 = _1278 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1288 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1290 = -_1282;
    float _1292 = fma(_1290, _1238, 1.0);
    float _1294 = _1256 * _1210;
    float _1296 = _1256 * _1218;
    float _1298 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1288);
    float _1300 = _1256 * _1222;
    float _1302 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1304 = _1284 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1306 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1298);
    float _1308 = log2(_1292);
    float _1310 = -_1302;
    float _1312 = fma(_1300, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1310);
    float _1314 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1316 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1306);
    float _1318 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1320 = -_1296;
    float _1322 = fma(_1320, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1312);
    float _1324 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1326 = _1300 + 1.0;
    float _1328 = exp2(_1314);
    float _1330 = fma(_1322, -0.5, 0.5);
    float _1332 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1324);
    float _1334 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1318);
    float _1336 = fma(_1322, 0.5, 0.5);
    float _1338 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1332);
    float _1340 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1334);
    float _1342 = 1.0 / _1316;
    float _1344 = fma(_1336, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1346 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1338);
    float _1348 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1340);
    float _1350 = _1308 * 0.693147182464599609375;
    float _1352 = fma(_1336, _1344, -0.212114393711090087890625);
    float _1354 = sqrt(_1330);
    float _1356 = -_1300;
    float _1358 = fma(_1328, _1326, _1356);
    float _1360 = fma(_1336, _1352, 1.570728778839111328125);
    float _1362 = _1350 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1364 = fma(_1358, 0.5, 0.5);
    float _1366 = _1346 * _1342;
    float _1368 = _1348 * _1342;
    float _1370 = fma(_1366, 0.5, 0.5);
    float _1372 = fma(_1368, -0.5, 0.5);
    float _1374 = _1354 * 0.636619746685028076171875;
    float3 _3884 = float3(_1370, _1372, _1362);
    float _1376 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3884, float3(0.0), isnan(_3884)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3884, float3(0.0), isnan(_3884)), level(0.0)).x;
    float3 _3895 = float3(_1370, _1372, _1362);
    float4 _1379 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3895, float3(0.0), isnan(_3895)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3895, float3(0.0), isnan(_3895)), level(0.0)).xyzw;
    float _1381 = _1379.x;
    float _1383 = _1379.y;
    float _1385 = _1379.z;
    float _1387 = _1379.w;
    float _1389 = -_1360;
    float _1391 = fma(_1374, _1389, 1.0);
    float2 _3917 = float2(_1391, _1364);
    float3 _1395 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3917, float2(0.0), isnan(_3917)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3917, float2(0.0), isnan(_3917)), level(0.0)).xyz;
    float _1397 = _1395.x;
    float _1399 = _1395.y;
    float _1401 = _1395.z;
    float _1403 = in.m_57.y;
    float _1405 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1409 = _1407 != 0;
    float _1411 = in.m_51.y;
    int _1413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1415 = _1413 != 0;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1421 = _1419 != 0;
    float _1423 = in.m_51.w;
    float _1425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1429 = _1427 != 0;
    float _1431 = in.m_57.x;
    float _1433 = _172 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1435 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1437 = _1326;
    if (_1409)
    {
        float _1439 = in.m_51.z;
        _1437 = _1439;
    }
    float _1441 = _1437;
    float _1443 = -_1435;
    float _1445 = fma(_1433, 2.0, _1443);
    bool _1447 = false;
    if (_1415)
    {
        bool _1449 = _172 > 0.5;
        _1447 = _1449;
    }
    bool _1451 = _1447;
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    out.m_59.x = _162;
    out.m_59.y = _164;
    out.m_59.z = _166;
    float _1455 = exp2(_1405);
    float _1457 = -_1403;
    float _1459 = _1457 + 1.0;
    out.m_61.x = _276;
    float _1461 = _1425 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1463 = _1411 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1465 = _1411 > 0.5;
    float _1467 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1417);
    float _1469 = fma(_1463, -2.0, _1453);
    bool _1471 = _1423 > 0.5;
    out.m_63.x = _926;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1475 = _1471 ? as_type<int>(_1459) : as_type<int>(_1403);
    float _1477 = in.m_65.x;
    float _1479 = in.m_65.y;
    float _1481 = in.m_65.z;
    float _1483 = in.m_65.w;
    int _1485 = 0;
    bool _1487 = _1471;
    float _1489 = _1403;
    float _1491 = _1473;
    int _1493 = as_type<int>(_1467);
    if (_1415)
    {
        float _1495 = -_1431;
        float _1497 = _1495 + 1.0;
        _1485 = as_type<int>(_1497);
    }
    int _1499 = _1485;
    if (_1409)
    {
        bool _1501 = _1441 > 0.5;
        _1487 = _1501;
    }
    bool _1503 = _1487;
    float _1505 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1473);
    float _1507 = in.m_67.x;
    float _1509 = in.m_67.y;
    float _1511 = in.m_67.z;
    float _1513 = _1421 ? as_type<float>(_1475) : _1403;
    float _1515 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1469);
    if (_1429)
    {
        float _1517 = _1465 ? _1459 : _1403;
        _1489 = _1517;
    }
    float _1519 = _1489;
    float _1521 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1505);
    float _1523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_1415)
    {
        _1491 = _1431;
    }
    float _1525 = _1491;
    float _1527 = -_136;
    float _1529 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1445);
    float _1531 = _1525;
    if (_1415)
    {
        float _1533 = _1451 ? as_type<float>(_1499) : _1431;
        _1531 = _1533;
    }
    float _1535 = _1531;
    float _1537 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1467);
    float _1539 = fma(_1461, _1519, -0.5);
    if (_1409)
    {
        float _1541 = -_1431;
        float _1543 = _1541 + 1.0;
        _1493 = as_type<int>(_1543);
    }
    int _1545 = _1493;
    float _1547 = -_924;
    bool _1549 = _424 != _1547;
    bool _1551 = isnan(_424);
    bool _1553 = _1549 || _1551;
    bool _1555 = isnan(_1547);
    bool _1557 = _1553 || _1555;
    float _1559 = -_1455;
    float _1561 = _1559 + 1.0;
    float _1563 = -_1515;
    float _1565 = fma(_1537, _1539, _1563);
    if (!_1409)
    {
        _138 = _1431;
    }
    float _1567 = _138;
    float _1569 = _1513 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1571 = _926 == 0.0;
    bool _1573 = !_1557;
    bool _1575 = _1571 && _1573;
    out.m_69.x = _968;
    out.m_69.y = _998;
    out.m_69.z = _962;
    float _1577 = _1567;
    if (_1409)
    {
        float _1579 = _1503 ? as_type<float>(_1545) : _1431;
        _1577 = _1579;
    }
    float _1581 = _1577;
    float _1583 = _1479 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1585 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1587 = _1479 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1589 = _1479 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1591 = _828 * _1511;
    float _1593 = fma(_1585, _1535, -0.5);
    float _1595 = _846 * _1511;
    bool _1597 = _904 == 0.0;
    bool _1599 = _1597 && _1575;
    float _1601 = -_1591;
    float _1603 = fma(_846, _1509, _1601);
    float _1605 = fma(_1521, _1593, _1529);
    float _1607 = fma(_828, _1509, _1595);
    float _1609 = fma(_1477, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1583);
    float _1611 = _868 * _1603;
    float _1613 = _886 * _1603;
    float _1615 = fma(_1477, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1587);
    float _1617 = fma(_1477, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1589);
    float _1619 = -_1611;
    float _1621 = fma(_886, _1507, _1619);
    float _1623 = fma(_868, _1507, _1613);
    float _1625 = _1607 * _1479;
    float _1627 = fma(_1481, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1609);
    float _1629 = _1621 * _1481;
    float _1631 = fma(_1481, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1615);
    float _1633 = fma(_1481, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1617);
    float _1635 = -_1625;
    float _1637 = fma(_1623, _1481, _1635);
    float _1639 = -_1629;
    float _1641 = fma(_1607, _1477, _1639);
    float _1643 = _1623 * _1477;
    float _1645 = _1623;
    float _1647 = _1621;
    float _1649 = _1607;
    if (!_1599)
    {
        float _1651 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1623);
        _1645 = _1651;
    }
    float _1653 = _1645;
    float _1655 = _1637 * _1483;
    float _1657 = _1641 * _1483;
    float _1659 = -_1643;
    float _1661 = fma(_1621, _1479, _1659);
    if (!_1599)
    {
        float _1663 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1621);
        _1647 = _1663;
    }
    float _1665 = _1647;
    float _1667 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1669 = _1657 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1671 = _1657 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1673 = _1657 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1675 = _1653 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1677 = fma(_1655, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1669);
    float _1679 = fma(_1655, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1671);
    float _1681 = fma(_1655, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1673);
    float _1683 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1685 = _1653 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1687 = _1653 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1689 = _1661 * _1483;
    float _1691 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1683);
    float _1693 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1695 = fma(_1665, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1675);
    float _1697 = fma(_1665, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1685);
    float _1699 = fma(_1665, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1687);
    float _1701 = fma(_1689, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1679);
    float _1703 = fma(_1689, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1677);
    float _1705 = fma(_1689, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1681);
    float _1707 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1691);
    float _1709 = _1581 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_1599)
    {
        float _1711 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1607);
        _1649 = _1711;
    }
    float _1713 = _1649;
    float _1715 = _1569 * _1667;
    out.m_71.x = _1701;
    out.m_71.y = _1703;
    out.m_71.z = _1705;
    float _1717 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1707);
    float _1719 = _1316 * 0.5;
    float _1721 = fma(_1713, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1697);
    out.m_73.x = _1627;
    out.m_73.y = _1631;
    out.m_73.z = _1633;
    float _1723 = _1709 * _1693;
    float _1725 = fma(_1713, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1695);
    float _1727 = _1346 + _1316;
    float _1729 = _1565 + 0.5;
    float _1731 = _1605 + 0.5;
    float _1733 = fma(_1713, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1699);
    float _1735 = _1561 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.x = _1731;
    out.m_75.y = _1729;
    out.m_75.z = _1723;
    out.m_75.w = _1715;
    float _1737 = _1717 + _1316;
    float _1739 = fma(_1348, -0.5, _1719);
    float _1741 = _1727 * 0.5;
    float _1743 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1745 = _1737 * 0.5;
    out.m_77.x = _1725;
    out.m_77.y = _1721;
    out.m_77.z = _1733;
    out.m_79.x = _1066;
    out.m_79.y = _1064;
    out.m_79.z = _1068;
    out.gl_Position.x = _1346;
    out.gl_Position.y = _1348;
    out.gl_Position.z = _1717;
    out.gl_Position.w = _1316;
    out.m_81.x = _1741;
    out.m_81.y = _1739;
    out.m_81.z = _1745;
    out.m_81.w = _1316;
    out.m_45.x = _1743;
    float _1747 = _1735 * _1376;
    float _1749 = -_1735;
    float _1751 = _1749 + 1.0;
    float _1753 = _1387 * _1747;
    float _1755 = _1387 * _1751;
    float _1757 = _1401 * _1747;
    float _1759 = fma(_1397, _1753, _1381);
    float _1761 = fma(_1399, _1753, _1383);
    float _1763 = fma(_1387, _1757, _1385);
    out.m_83.x = _1759;
    out.m_83.y = _1761;
    out.m_83.z = _1763;
    out.m_83.w = _1755;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_42.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    float _110 = as_type<float>(_102);
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _108;
    if (!_106)
    {
        out.m_45.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1820 = as_type<float>(_118);
        out.gl_Position.z = _1820;
    }
    if (!_106)
    {
        return out;
    }
    float _122 = in.m_47.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = _136;
    if (_132)
    {
        float _140 = float(_102);
        _110 = _140;
    }
    float _142 = _110;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _120 = as_type<int>(_154);
    }
    int _156 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1890 = as_type<float>(_156);
        out.gl_Position.z = _1890;
    }
    if (_148)
    {
        return out;
    }
    float _158 = in.m_49.w;
    float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _162 = in.m_49.x;
    float _164 = in.m_49.y;
    float _166 = in.m_49.z;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _170 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _172 = in.m_51.x;
    float _174 = in.m_53.x;
    float _176 = in.m_53.y;
    float _178 = in.m_53.z;
    float _180 = -(*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[194].y + _180;
    float _184 = in.m_55.w;
    float _186 = 0.0;
    if (_168)
    {
        float _188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _186 = _188;
    }
    float _190 = _186;
    float _192 = in.m_47.x;
    float _194 = in.m_47.y;
    float _196 = in.m_47.z;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _208 = _206 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _210 = _158 * 78.233001708984375;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _214 = _212 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _218 = _216 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _220;
    float _224 = -_160;
    float _226 = fma(_170, _224, _164);
    float _228 = fma(_162, 12.98980045318603515625, _210);
    float _230 = fma(_182, _164, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    bool _232 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _236 = _232 || _234;
    bool _238 = isnan(1.0);
    bool _240 = _236 || _238;
    float _242 = floor(_226);
    float _244 = _228 * 0.15915493667125701904296875;
    float _246 = 0.0;
    if (_168)
    {
        float _248 = _172 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        _246 = _248;
    }
    float _250 = _246;
    float _252 = fma(_218, _162, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    float _254 = fma(_222, _166, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _256 = precise::max(_230, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    float _258 = _244 * 6.283185482025146484375;
    float _260 = sin(_258);
    float _262 = precise::min(_256, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _264 = precise::max(_252, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    float _266 = precise::max(_254, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _268 = -_262;
    float _270 = _268 + _176;
    float _272 = precise::min(_264, (*spvDescriptorSet0.vp_c9)._m0[194].x);
    float _274 = -_242;
    float _276 = _226 + _274;
    float _278 = 1.0 / _200;
    float _280 = in.m_42.x;
    float _282 = in.m_42.y;
    float _284 = in.m_42.z;
    float _286 = precise::min(_266, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _288 = _250;
    float _290 = _262;
    float _292 = _256;
    if (_168)
    {
        float _294 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[14].x, _276);
        _288 = _294;
    }
    float _296 = _288;
    float _298 = -_272;
    float _300 = _298 + _174;
    float _302 = _276 * _276;
    float _304 = _260 * 43758.546875;
    float _306 = _296;
    if (_168)
    {
        float _308 = _296 * _190;
        _306 = _308;
    }
    float _310 = _306;
    float _312 = 1.0 / _208;
    float _314 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _316 = -_286;
    float _318 = _316 + _178;
    float _320 = _314;
    if (!_240)
    {
        float _322 = _314 * _314;
        float _324 = _322 * 0.5;
        _290 = _324;
    }
    float _326 = _290;
    float _328 = 1.0 / _204;
    float _330 = _326;
    if (!_240)
    {
        float _332 = _326 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _330 = _332;
    }
    float _334 = _330;
    float _336 = 1.0 / _214;
    float _338 = floor(_304);
    float _340 = 0.0;
    float _342 = _334;
    if (_168)
    {
        float _344 = floor(_310);
        _340 = _344;
    }
    float _346 = _340;
    bool _348 = !_240;
    if (!_348)
    {
        float _350 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _352 = log2(_350);
        float _354 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _356 = _354 + 1.0;
        float _358 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _360 = _314 * _352;
        float _362 = 1.0 / _356;
        float _364 = _358 * 0.693147182464599609375;
        float _366 = exp2(_360);
        float _368 = 1.0 / _364;
        float _370 = _366 + (-1.0);
        float _372 = -_370;
        float _374 = fma(_372, _368, _314);
        float _376 = _374 * _362;
        float _378 = _376 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _342 = _378;
        _292 = _368;
    }
    float _380 = _342;
    float _382 = _292;
    bool _384 = !_240;
    float _386 = _382;
    if (!_384)
    {
        float _388 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _390 = log2(_388);
        float _392 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _394 = _392 + 1.0;
        float _396 = 1.0 / _394;
        float _398 = _314 * _390;
        float _400 = exp2(_398);
        float _402 = -_400;
        float _404 = _402 + 1.0;
        float _406 = _404 * _396;
        _320 = _406;
    }
    float _408 = _320;
    float _410 = _302 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    if (!_168)
    {
        _386 = _276;
    }
    float _412 = _386;
    float _414 = _412;
    if (_168)
    {
        float _416 = -_346;
        float _418 = _310 + _416;
        _414 = _418;
    }
    float _420 = _414;
    float _422 = _380 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _424 = fma(_182, _410, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    float _426 = _380 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _428 = _380 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _430;
    float _434 = -_338;
    float _436 = _304 + _434;
    float _438 = fma(_408, _196, _428);
    float _440 = fma(_408, _192, _426);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _446;
    float _450 = 1.0 / _432;
    float _452 = fma(_438, _184, _284);
    float _454 = fma(_408, _194, _422);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _458 = _420 + _456;
    float _460 = fma(_440, _184, _280);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _464 = _420 + _462;
    float _466 = fma(_454, _184, _282);
    float _468 = _458 * _336;
    float _470 = 1.0 / _448;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _474 = _420 + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _478 = _420 + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _482 = _420 + _480;
    float _484 = _464 * _278;
    float _486 = _474 * _312;
    float _488 = 1.0 / _444;
    float _490 = _478 * _328;
    float _492 = _482 * _450;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _496 = _420 + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _514 = _496 * _470;
    float _516 = fma(_500, _484, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _518 = fma(_504, _484, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _520;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _532;
    float _536 = fma(_522, _484, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _538;
    float _542 = fma(_508, _486, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _544 = fma(_526, _486, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _546 = fma(_512, _486, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    bool _556 = _436 >= 0.5;
    bool _558 = isnan(_436);
    bool _560 = _556 || _558;
    bool _562 = isnan(0.5);
    bool _564 = _560 || _562;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _570 = fma(_530, _490, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _572 = fma(_540, _490, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _574 = fma(_534, _490, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _576 = fma(_550, _468, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _578 = fma(_554, _468, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    bool _580 = !_564;
    float _582 = _580 ? (-1.0) : 1.0;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _586 = _420 + _584;
    float _588 = fma(_568, _468, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _594;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _598;
    bool _602 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _604 = isnan(_420);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = _586 * _488;
    float _616 = _582 * 0.4000000059604644775390625;
    float _618 = _302 * 5.0;
    float _620 = fma(_592, _492, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _622 = fma(_596, _492, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _624 = fma(_600, _492, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    bool _626 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _628 = isnan(_420);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = -_612;
    float _640 = _638 + 1.0;
    float _642 = _618 * _616;
    bool _644 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _646 = isnan(_420);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _660 = _636 * _640;
    float _662 = -_636;
    float _664 = _662 + 1.0;
    bool _666 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _668 = isnan(_420);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = fma(_436, 3.1415927410125732421875, _642);
    bool _680 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _682 = isnan(_420);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = _654 * _664;
    float _694 = -_654;
    float _696 = _694 + 1.0;
    float _698 = -_676;
    float _700 = _698 + 1.0;
    bool _702 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _704 = isnan(_420);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _710 = _706 || _708;
    float _712 = float(_710);
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _718 = _676 * _696;
    float _720 = _690 * _700;
    float _722 = -_690;
    float _724 = _722 + 1.0;
    float _726 = _678 * 0.15915493667125701904296875;
    bool _728 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _730 = isnan(_420);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _744 = _712 * _724;
    bool _746 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _748 = isnan(_420);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = fma(_658, _614, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _760 = fma(_716, _614, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _762 = -_712;
    float _764 = _762 + 1.0;
    float _766 = _516 * _744;
    float _768 = _726 * 6.283185482025146484375;
    float _770 = sin(_768);
    float _772 = _536 * _744;
    float _774 = _518 * _744;
    float _776 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[159].x, _766);
    float _778 = -_738;
    float _780 = _778 + 1.0;
    float _782 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[159].y, _772);
    float _784 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[159].z, _774);
    float _786 = fma(_542, _720, _776);
    float _788 = fma(_544, _720, _782);
    float _790 = _612 * _780;
    float _792 = fma(_570, _718, _786);
    float _794 = fma(_546, _720, _784);
    float _796 = fma(_572, _718, _788);
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _798;
    float _802 = fma(_576, _692, _792);
    float _804 = _770 * 1.256637096405029296875;
    float _806 = fma(_742, _614, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _808 = -_756;
    float _810 = _808 + 1.0;
    float _812 = fma(_620, _660, _802);
    float _814 = _804 * 0.15915493667125701904296875;
    float _816 = fma(_578, _692, _796);
    float _818 = fma(_574, _718, _794);
    float _820 = fma(_800, _514, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _822 = _738 * _810;
    float _824 = fma(_806, _790, _812);
    float _826 = _814 * 6.283185482025146484375;
    float _828 = sin(_826);
    float _830 = fma(_588, _692, _818);
    float _832 = _642 * 0.15915493667125701904296875;
    float _834 = fma(_820, _822, _824);
    float _836 = in.m_55.x;
    float _838 = in.m_55.y;
    float _840 = in.m_55.z;
    float _842 = fma(_624, _660, _830);
    float _844 = _814 * 6.283185482025146484375;
    float _846 = cos(_844);
    float _848 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[166].x, _834);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _850;
    float _854 = fma(_622, _660, _816);
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _856;
    float _860 = _848 * _318;
    float _862 = fma(_852, _514, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _864 = fma(_760, _790, _842);
    float _866 = _832 * 6.283185482025146484375;
    float _868 = sin(_866);
    float _870 = fma(_858, _514, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _872 = fma(_758, _790, _854);
    float _874 = _848 * _270;
    float _876 = _860 * _828;
    float _878 = fma(_862, _822, _864);
    float _880 = fma(_870, _822, _872);
    float _882 = _848 * _300;
    float _884 = _832 * 6.283185482025146484375;
    float _886 = cos(_884);
    float _888 = _860 * _846;
    float _890 = -_876;
    float _892 = fma(_874, _846, _890);
    float _894 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[166].z, _878);
    float _896 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[166].y, _880);
    float _898 = fma(_874, _828, _888);
    float _900 = _840 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _902 = _892 * _868;
    float _904 = fma(_286, _894, _898);
    float _906 = _838 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _908 = _900 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _910 = _836 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _912 = _906 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _914 = _892 * _886;
    float _916 = -_902;
    float _918 = fma(_882, _886, _916);
    float _920 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _904);
    float _922 = _910 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _924 = fma(_882, _868, _914);
    float _926 = fma(_272, _896, _918);
    float _928 = _920 * _908;
    float _930 = _466 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _932 = _924 + _424;
    float _934 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _926);
    float _936 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[6].x, _930);
    float _938 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _932);
    float _940 = _934 * _922;
    float _942 = fma(_452, (*spvDescriptorSet0.vp_c10)._m0[6].z, _936);
    float _944 = _938 * _912;
    float _946 = _466 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _948 = _466 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _950 = _944 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _952 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[4].x, _946);
    float _954 = _944 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _956 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[5].x, _948);
    float _958 = fma(_940, (*spvDescriptorSet0.vp_c10)._m0[10].x, _950);
    float _960 = fma(_452, (*spvDescriptorSet0.vp_c10)._m0[4].z, _952);
    float _962 = _942 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _964 = fma(_940, (*spvDescriptorSet0.vp_c10)._m0[8].x, _954);
    float _966 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[10].z, _958);
    float _968 = _960 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _970 = _944 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _972 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[8].z, _964);
    float _974 = _962 + _966;
    float _976 = fma(_940, (*spvDescriptorSet0.vp_c10)._m0[9].x, _970);
    float _978 = _968 + _972;
    float _980 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _982 = _974 + _980;
    float _984 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[9].z, _976);
    float _986 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _988 = _978 + _986;
    float _990 = _982 * _982;
    float _992 = fma(_988, _988, _990);
    float _994 = fma(_452, (*spvDescriptorSet0.vp_c10)._m0[5].z, _956);
    float _996 = sqrt(_992);
    float _998 = _994 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1000 = _998 + _984;
    bool _1002 = _996 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1004 = _970;
    float _1006 = _452;
    float _1008 = _956;
    float _1010 = _974;
    float _1012 = _1000;
    if (!_1002)
    {
        _1004 = _978;
    }
    float _1014 = _1004;
    float _1016 = _1014;
    if (!_1002)
    {
        _1006 = _974;
    }
    float _1018 = _1006;
    float _1020 = _1018;
    if (!_1002)
    {
        _1008 = _1000;
    }
    float _1022 = _1008;
    bool _1024 = !_1002;
    float _1026 = _1022;
    if (!_1024)
    {
        float _1028 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1030 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1032 = _996 + _1030;
        float _1034 = rsqrt(_992);
        float _1036 = _1032 * _1028;
        float _1038 = _1000 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1040 = _1036 * 0.15915493667125701904296875;
        float _1042 = _1040 * 6.283185482025146484375;
        float _1044 = cos(_1042);
        float _1046 = _1040 * 6.283185482025146484375;
        float _1048 = sin(_1046);
        float _1050 = _1044 + (-1.0);
        float _1052 = _1050 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1054 = fma(_1048, _1038, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1056 = fma(_1000, _1044, _1052);
        float _1058 = _1034 * _1054;
        float _1060 = fma(_988, _1058, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1062 = fma(_982, _1058, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1026 = _1056;
        _1016 = _1060;
        _1020 = _1062;
    }
    float _1064 = _1026;
    float _1066 = _1016;
    float _1068 = _1020;
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1072 = _1064 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1076 = _1066 + _1074;
    float _1078 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1080 = _1068 + _1078;
    float _1082 = _1072 * _1072;
    float _1084 = fma(_1076, _1076, _1082);
    float _1086 = fma(_1080, _1080, _1084);
    float _1088 = rsqrt(_1086);
    float _1090 = sqrt(_1086);
    float _1092 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1094 = _1076 * _1092;
    float _1096 = _1080 * _1092;
    float _1098 = _1094 * _1094;
    float _1100 = _1096 * _1096;
    float _1102 = _1098 + _1100;
    float _1104 = sqrt(_1102);
    bool _1106 = _1104 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1108 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1110 = _1104 + _1108;
    float _1112 = _1088;
    float _1114 = _1110;
    float _1116 = _1092;
    if (_1106)
    {
        float _1118 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1112 = _1118;
    }
    float _1120 = _1112;
    if (_1106)
    {
        float _1122 = rsqrt(_1102);
        _1010 = _1122;
    }
    float _1124 = _1010;
    float _1126 = _1124;
    if (_1106)
    {
        float _1128 = _1110 * _1120;
        _1114 = _1128;
    }
    float _1130 = _1114;
    if (_1106)
    {
        float _1132 = _1130 * 0.15915493667125701904296875;
        _1012 = _1132;
    }
    float _1134 = _1012;
    float _1136 = _1080;
    if (_1106)
    {
        float _1138 = _1134 * 6.283185482025146484375;
        float _1140 = sin(_1138);
        _1136 = _1140;
    }
    float _1142 = _1136;
    float _1144 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1146 = precise::max(0.0, _1144);
    float _1148 = _978;
    float _1150 = _1146;
    float _1152 = _1144;
    if (_1106)
    {
        float _1154 = _1134 * 6.283185482025146484375;
        float _1156 = cos(_1154);
        _1148 = _1156;
    }
    float _1158 = _1148;
    float _1160 = -_1092;
    float _1162 = -_1146;
    float _1164 = fma(_1072, _1160, _1162);
    float _1166 = _1164;
    if (_1106)
    {
        float _1168 = _1164 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1150 = _1168;
    }
    float _1170 = _1150;
    float _1172 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1174 = _1142;
    float _1176 = _1170;
    if (_1106)
    {
        float _1178 = fma(_1142, _1170, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1174 = _1178;
    }
    float _1180 = _1174;
    float _1182 = _1180;
    if (!_1106)
    {
        _1176 = _1098;
    }
    float _1184 = _1176;
    float _1186 = _1184;
    float _1188 = _1158;
    if (_1106)
    {
        float _1190 = _1158 + (-1.0);
        _1152 = _1190;
    }
    float _1192 = _1152;
    float _1194 = _1192;
    if (_1106)
    {
        float _1196 = _1124 * _1180;
        _1116 = _1196;
    }
    float _1198 = _1116;
    if (!_1106)
    {
        _1182 = _1094;
    }
    float _1200 = _1182;
    float _1202 = _1200;
    if (_1106)
    {
        float _1204 = _1192 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1126 = _1204;
    }
    float _1206 = _1126;
    if (_1106)
    {
        float _1208 = _1094 * _1198;
        _1202 = _1208;
    }
    float _1210 = _1202;
    if (!_1106)
    {
        _1194 = _1096;
    }
    float _1212 = _1194;
    float _1214 = _1212;
    if (_1106)
    {
        float _1216 = _1096 * _1198;
        _1214 = _1216;
    }
    float _1218 = _1214;
    if (_1106)
    {
        float _1220 = fma(_1164, _1158, _1206);
        _1166 = _1220;
    }
    float _1222 = _1166;
    if (_1106)
    {
        float _1224 = _1210 * _1210;
        _1186 = _1224;
    }
    float _1226 = _1186;
    if (!_1106)
    {
        _1188 = _1100;
    }
    float _1228 = _1188;
    float _1230 = _1228;
    if (_1106)
    {
        float _1232 = _1218 * _1218;
        _1230 = _1232;
    }
    float _1234 = _1230;
    float _1236 = fma(_1222, _1222, _1226);
    float _1238 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1240 = _1236 + _1234;
    float _1242 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1172);
    float _1244 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1246 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1248 = fma(_1090, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1246);
    float _1250 = precise::clamp(_1248, 0.0, 1.0);
    float _1252 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1254 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1242);
    float _1256 = rsqrt(_1240);
    float _1258 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1260 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1244);
    float _1262 = -_1250;
    float _1264 = _1262 + 1.0;
    float _1266 = _1254 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1268 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1258);
    float _1270 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1260);
    float _1272 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1252);
    float _1274 = abs(_1264);
    float _1276 = log2(_1274);
    float _1278 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1268);
    float _1280 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1282 = _1266 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1284 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1272);
    float _1286 = _1278 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1288 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1290 = -_1282;
    float _1292 = fma(_1290, _1238, 1.0);
    float _1294 = _1256 * _1210;
    float _1296 = _1256 * _1218;
    float _1298 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1288);
    float _1300 = _1256 * _1222;
    float _1302 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1304 = _1284 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1306 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1298);
    float _1308 = log2(_1292);
    float _1310 = -_1302;
    float _1312 = fma(_1300, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1310);
    float _1314 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1316 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1306);
    float _1318 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1320 = -_1296;
    float _1322 = fma(_1320, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1312);
    float _1324 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1326 = _1300 + 1.0;
    float _1328 = exp2(_1314);
    float _1330 = fma(_1322, -0.5, 0.5);
    float _1332 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1324);
    float _1334 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1318);
    float _1336 = fma(_1322, 0.5, 0.5);
    float _1338 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1332);
    float _1340 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1334);
    float _1342 = 1.0 / _1316;
    float _1344 = fma(_1336, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1346 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1338);
    float _1348 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1340);
    float _1350 = _1308 * 0.693147182464599609375;
    float _1352 = fma(_1336, _1344, -0.212114393711090087890625);
    float _1354 = sqrt(_1330);
    float _1356 = -_1300;
    float _1358 = fma(_1328, _1326, _1356);
    float _1360 = fma(_1336, _1352, 1.570728778839111328125);
    float _1362 = _1350 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1364 = fma(_1358, 0.5, 0.5);
    float _1366 = _1346 * _1342;
    float _1368 = _1348 * _1342;
    float _1370 = fma(_1366, 0.5, 0.5);
    float _1372 = fma(_1368, -0.5, 0.5);
    float _1374 = _1354 * 0.636619746685028076171875;
    float3 _3884 = float3(_1370, _1372, _1362);
    float _1376 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3884, float3(0.0), isnan(_3884)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3884, float3(0.0), isnan(_3884)), level(0.0)).x;
    float3 _3895 = float3(_1370, _1372, _1362);
    float4 _1379 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3895, float3(0.0), isnan(_3895)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3895, float3(0.0), isnan(_3895)), level(0.0)).xyzw;
    float _1381 = _1379.x;
    float _1383 = _1379.y;
    float _1385 = _1379.z;
    float _1387 = _1379.w;
    float _1389 = -_1360;
    float _1391 = fma(_1374, _1389, 1.0);
    float2 _3917 = float2(_1391, _1364);
    float3 _1395 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3917, float2(0.0), isnan(_3917)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3917, float2(0.0), isnan(_3917)), level(0.0)).xyz;
    float _1397 = _1395.x;
    float _1399 = _1395.y;
    float _1401 = _1395.z;
    float _1403 = in.m_57.y;
    float _1405 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1409 = _1407 != 0;
    float _1411 = in.m_51.y;
    int _1413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1415 = _1413 != 0;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1421 = _1419 != 0;
    float _1423 = in.m_51.w;
    float _1425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1429 = _1427 != 0;
    float _1431 = in.m_57.x;
    float _1433 = _172 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1435 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1437 = _1326;
    if (_1409)
    {
        float _1439 = in.m_51.z;
        _1437 = _1439;
    }
    float _1441 = _1437;
    float _1443 = -_1435;
    float _1445 = fma(_1433, 2.0, _1443);
    bool _1447 = false;
    if (_1415)
    {
        bool _1449 = _172 > 0.5;
        _1447 = _1449;
    }
    bool _1451 = _1447;
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    out.m_59.x = _162;
    out.m_59.y = _164;
    out.m_59.z = _166;
    float _1455 = exp2(_1405);
    float _1457 = -_1403;
    float _1459 = _1457 + 1.0;
    out.m_61.x = _276;
    float _1461 = _1425 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1463 = _1411 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1465 = _1411 > 0.5;
    float _1467 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1417);
    float _1469 = fma(_1463, -2.0, _1453);
    bool _1471 = _1423 > 0.5;
    out.m_63.x = _926;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1475 = _1471 ? as_type<int>(_1459) : as_type<int>(_1403);
    float _1477 = in.m_65.x;
    float _1479 = in.m_65.y;
    float _1481 = in.m_65.z;
    float _1483 = in.m_65.w;
    int _1485 = 0;
    bool _1487 = _1471;
    float _1489 = _1403;
    float _1491 = _1473;
    int _1493 = as_type<int>(_1467);
    if (_1415)
    {
        float _1495 = -_1431;
        float _1497 = _1495 + 1.0;
        _1485 = as_type<int>(_1497);
    }
    int _1499 = _1485;
    if (_1409)
    {
        bool _1501 = _1441 > 0.5;
        _1487 = _1501;
    }
    bool _1503 = _1487;
    float _1505 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1473);
    float _1507 = in.m_67.x;
    float _1509 = in.m_67.y;
    float _1511 = in.m_67.z;
    float _1513 = _1421 ? as_type<float>(_1475) : _1403;
    float _1515 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1469);
    if (_1429)
    {
        float _1517 = _1465 ? _1459 : _1403;
        _1489 = _1517;
    }
    float _1519 = _1489;
    float _1521 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1505);
    float _1523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_1415)
    {
        _1491 = _1431;
    }
    float _1525 = _1491;
    float _1527 = -_136;
    float _1529 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1445);
    float _1531 = _1525;
    if (_1415)
    {
        float _1533 = _1451 ? as_type<float>(_1499) : _1431;
        _1531 = _1533;
    }
    float _1535 = _1531;
    float _1537 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1467);
    float _1539 = fma(_1461, _1519, -0.5);
    if (_1409)
    {
        float _1541 = -_1431;
        float _1543 = _1541 + 1.0;
        _1493 = as_type<int>(_1543);
    }
    int _1545 = _1493;
    float _1547 = -_924;
    bool _1549 = _424 != _1547;
    bool _1551 = isnan(_424);
    bool _1553 = _1549 || _1551;
    bool _1555 = isnan(_1547);
    bool _1557 = _1553 || _1555;
    float _1559 = -_1455;
    float _1561 = _1559 + 1.0;
    float _1563 = -_1515;
    float _1565 = fma(_1537, _1539, _1563);
    if (!_1409)
    {
        _138 = _1431;
    }
    float _1567 = _138;
    float _1569 = _1513 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1571 = _926 == 0.0;
    bool _1573 = !_1557;
    bool _1575 = _1571 && _1573;
    out.m_69.x = _968;
    out.m_69.y = _998;
    out.m_69.z = _962;
    float _1577 = _1567;
    if (_1409)
    {
        float _1579 = _1503 ? as_type<float>(_1545) : _1431;
        _1577 = _1579;
    }
    float _1581 = _1577;
    float _1583 = _1479 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1585 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1587 = _1479 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1589 = _1479 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1591 = _828 * _1511;
    float _1593 = fma(_1585, _1535, -0.5);
    float _1595 = _846 * _1511;
    bool _1597 = _904 == 0.0;
    bool _1599 = _1597 && _1575;
    float _1601 = -_1591;
    float _1603 = fma(_846, _1509, _1601);
    float _1605 = fma(_1521, _1593, _1529);
    float _1607 = fma(_828, _1509, _1595);
    float _1609 = fma(_1477, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1583);
    float _1611 = _868 * _1603;
    float _1613 = _886 * _1603;
    float _1615 = fma(_1477, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1587);
    float _1617 = fma(_1477, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1589);
    float _1619 = -_1611;
    float _1621 = fma(_886, _1507, _1619);
    float _1623 = fma(_868, _1507, _1613);
    float _1625 = _1607 * _1479;
    float _1627 = fma(_1481, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1609);
    float _1629 = _1621 * _1481;
    float _1631 = fma(_1481, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1615);
    float _1633 = fma(_1481, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1617);
    float _1635 = -_1625;
    float _1637 = fma(_1623, _1481, _1635);
    float _1639 = -_1629;
    float _1641 = fma(_1607, _1477, _1639);
    float _1643 = _1623 * _1477;
    float _1645 = _1623;
    float _1647 = _1621;
    float _1649 = _1607;
    if (!_1599)
    {
        float _1651 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1623);
        _1645 = _1651;
    }
    float _1653 = _1645;
    float _1655 = _1637 * _1483;
    float _1657 = _1641 * _1483;
    float _1659 = -_1643;
    float _1661 = fma(_1621, _1479, _1659);
    if (!_1599)
    {
        float _1663 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1621);
        _1647 = _1663;
    }
    float _1665 = _1647;
    float _1667 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1669 = _1657 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1671 = _1657 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1673 = _1657 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1675 = _1653 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1677 = fma(_1655, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1669);
    float _1679 = fma(_1655, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1671);
    float _1681 = fma(_1655, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1673);
    float _1683 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1685 = _1653 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1687 = _1653 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1689 = _1661 * _1483;
    float _1691 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1683);
    float _1693 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1695 = fma(_1665, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1675);
    float _1697 = fma(_1665, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1685);
    float _1699 = fma(_1665, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1687);
    float _1701 = fma(_1689, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1679);
    float _1703 = fma(_1689, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1677);
    float _1705 = fma(_1689, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1681);
    float _1707 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1691);
    float _1709 = _1581 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_1599)
    {
        float _1711 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1607);
        _1649 = _1711;
    }
    float _1713 = _1649;
    float _1715 = _1569 * _1667;
    out.m_71.x = _1701;
    out.m_71.y = _1703;
    out.m_71.z = _1705;
    float _1717 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1707);
    float _1719 = _1316 * 0.5;
    float _1721 = fma(_1713, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1697);
    out.m_73.x = _1627;
    out.m_73.y = _1631;
    out.m_73.z = _1633;
    float _1723 = _1709 * _1693;
    float _1725 = fma(_1713, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1695);
    float _1727 = _1346 + _1316;
    float _1729 = _1565 + 0.5;
    float _1731 = _1605 + 0.5;
    float _1733 = fma(_1713, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1699);
    float _1735 = _1561 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.x = _1731;
    out.m_75.y = _1729;
    out.m_75.z = _1723;
    out.m_75.w = _1715;
    float _1737 = _1717 + _1316;
    float _1739 = fma(_1348, -0.5, _1719);
    float _1741 = _1727 * 0.5;
    float _1743 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1745 = _1737 * 0.5;
    out.m_77.x = _1725;
    out.m_77.y = _1721;
    out.m_77.z = _1733;
    out.m_79.x = _1066;
    out.m_79.y = _1064;
    out.m_79.z = _1068;
    out.gl_Position.x = _1346;
    out.gl_Position.y = _1348;
    out.gl_Position.z = _1717;
    out.gl_Position.w = _1316;
    out.m_81.x = _1741;
    out.m_81.y = _1739;
    out.m_81.z = _1745;
    out.m_81.w = _1316;
    out.m_45.x = _1743;
    float _1747 = _1735 * _1376;
    float _1749 = -_1735;
    float _1751 = _1749 + 1.0;
    float _1753 = _1387 * _1747;
    float _1755 = _1387 * _1751;
    float _1757 = _1401 * _1747;
    float _1759 = fma(_1397, _1753, _1381);
    float _1761 = fma(_1399, _1753, _1383);
    float _1763 = fma(_1387, _1757, _1385);
    out.m_83.x = _1759;
    out.m_83.y = _1761;
    out.m_83.z = _1763;
    out.m_83.w = _1755;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_42.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    float _110 = as_type<float>(_102);
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _108;
    if (!_106)
    {
        out.m_45.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1820 = as_type<float>(_118);
        out.gl_Position.z = _1820;
    }
    if (!_106)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _122 = in.m_47.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = _136;
    if (_132)
    {
        float _140 = float(_102);
        _110 = _140;
    }
    float _142 = _110;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _120 = as_type<int>(_154);
    }
    int _156 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1890 = as_type<float>(_156);
        out.gl_Position.z = _1890;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _158 = in.m_49.w;
    float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _162 = in.m_49.x;
    float _164 = in.m_49.y;
    float _166 = in.m_49.z;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _170 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _172 = in.m_51.x;
    float _174 = in.m_53.x;
    float _176 = in.m_53.y;
    float _178 = in.m_53.z;
    float _180 = -(*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[194].y + _180;
    float _184 = in.m_55.w;
    float _186 = 0.0;
    if (_168)
    {
        float _188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _186 = _188;
    }
    float _190 = _186;
    float _192 = in.m_47.x;
    float _194 = in.m_47.y;
    float _196 = in.m_47.z;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _208 = _206 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _210 = _158 * 78.233001708984375;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _214 = _212 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _218 = _216 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _220;
    float _224 = -_160;
    float _226 = fma(_170, _224, _164);
    float _228 = fma(_162, 12.98980045318603515625, _210);
    float _230 = fma(_182, _164, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    bool _232 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _236 = _232 || _234;
    bool _238 = isnan(1.0);
    bool _240 = _236 || _238;
    float _242 = floor(_226);
    float _244 = _228 * 0.15915493667125701904296875;
    float _246 = 0.0;
    if (_168)
    {
        float _248 = _172 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        _246 = _248;
    }
    float _250 = _246;
    float _252 = fma(_218, _162, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    float _254 = fma(_222, _166, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _256 = precise::max(_230, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    float _258 = _244 * 6.283185482025146484375;
    float _260 = sin(_258);
    float _262 = precise::min(_256, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _264 = precise::max(_252, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    float _266 = precise::max(_254, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _268 = -_262;
    float _270 = _268 + _176;
    float _272 = precise::min(_264, (*spvDescriptorSet0.vp_c9)._m0[194].x);
    float _274 = -_242;
    float _276 = _226 + _274;
    float _278 = 1.0 / _200;
    float _280 = in.m_42.x;
    float _282 = in.m_42.y;
    float _284 = in.m_42.z;
    float _286 = precise::min(_266, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _288 = _250;
    float _290 = _262;
    float _292 = _256;
    if (_168)
    {
        float _294 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[14].x, _276);
        _288 = _294;
    }
    float _296 = _288;
    float _298 = -_272;
    float _300 = _298 + _174;
    float _302 = _276 * _276;
    float _304 = _260 * 43758.546875;
    float _306 = _296;
    if (_168)
    {
        float _308 = _296 * _190;
        _306 = _308;
    }
    float _310 = _306;
    float _312 = 1.0 / _208;
    float _314 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _316 = -_286;
    float _318 = _316 + _178;
    float _320 = _314;
    if (!_240)
    {
        float _322 = _314 * _314;
        float _324 = _322 * 0.5;
        _290 = _324;
    }
    float _326 = _290;
    float _328 = 1.0 / _204;
    float _330 = _326;
    if (!_240)
    {
        float _332 = _326 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _330 = _332;
    }
    float _334 = _330;
    float _336 = 1.0 / _214;
    float _338 = floor(_304);
    float _340 = 0.0;
    float _342 = _334;
    if (_168)
    {
        float _344 = floor(_310);
        _340 = _344;
    }
    float _346 = _340;
    bool _348 = !_240;
    if (!_348)
    {
        float _350 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _352 = log2(_350);
        float _354 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _356 = _354 + 1.0;
        float _358 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _360 = _314 * _352;
        float _362 = 1.0 / _356;
        float _364 = _358 * 0.693147182464599609375;
        float _366 = exp2(_360);
        float _368 = 1.0 / _364;
        float _370 = _366 + (-1.0);
        float _372 = -_370;
        float _374 = fma(_372, _368, _314);
        float _376 = _374 * _362;
        float _378 = _376 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _342 = _378;
        _292 = _368;
    }
    float _380 = _342;
    float _382 = _292;
    bool _384 = !_240;
    float _386 = _382;
    if (!_384)
    {
        float _388 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _390 = log2(_388);
        float _392 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _394 = _392 + 1.0;
        float _396 = 1.0 / _394;
        float _398 = _314 * _390;
        float _400 = exp2(_398);
        float _402 = -_400;
        float _404 = _402 + 1.0;
        float _406 = _404 * _396;
        _320 = _406;
    }
    float _408 = _320;
    float _410 = _302 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    if (!_168)
    {
        _386 = _276;
    }
    float _412 = _386;
    float _414 = _412;
    if (_168)
    {
        float _416 = -_346;
        float _418 = _310 + _416;
        _414 = _418;
    }
    float _420 = _414;
    float _422 = _380 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _424 = fma(_182, _410, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    float _426 = _380 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _428 = _380 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _430;
    float _434 = -_338;
    float _436 = _304 + _434;
    float _438 = fma(_408, _196, _428);
    float _440 = fma(_408, _192, _426);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _446;
    float _450 = 1.0 / _432;
    float _452 = fma(_438, _184, _284);
    float _454 = fma(_408, _194, _422);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _458 = _420 + _456;
    float _460 = fma(_440, _184, _280);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _464 = _420 + _462;
    float _466 = fma(_454, _184, _282);
    float _468 = _458 * _336;
    float _470 = 1.0 / _448;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _474 = _420 + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _478 = _420 + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _482 = _420 + _480;
    float _484 = _464 * _278;
    float _486 = _474 * _312;
    float _488 = 1.0 / _444;
    float _490 = _478 * _328;
    float _492 = _482 * _450;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _496 = _420 + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _514 = _496 * _470;
    float _516 = fma(_500, _484, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _518 = fma(_504, _484, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _520;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _532;
    float _536 = fma(_522, _484, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _538;
    float _542 = fma(_508, _486, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _544 = fma(_526, _486, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _546 = fma(_512, _486, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    bool _556 = _436 >= 0.5;
    bool _558 = isnan(_436);
    bool _560 = _556 || _558;
    bool _562 = isnan(0.5);
    bool _564 = _560 || _562;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _570 = fma(_530, _490, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _572 = fma(_540, _490, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _574 = fma(_534, _490, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _576 = fma(_550, _468, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _578 = fma(_554, _468, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    bool _580 = !_564;
    float _582 = _580 ? (-1.0) : 1.0;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _586 = _420 + _584;
    float _588 = fma(_568, _468, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _594;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _598;
    bool _602 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _604 = isnan(_420);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = _586 * _488;
    float _616 = _582 * 0.4000000059604644775390625;
    float _618 = _302 * 5.0;
    float _620 = fma(_592, _492, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _622 = fma(_596, _492, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _624 = fma(_600, _492, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    bool _626 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _628 = isnan(_420);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = -_612;
    float _640 = _638 + 1.0;
    float _642 = _618 * _616;
    bool _644 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _646 = isnan(_420);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _660 = _636 * _640;
    float _662 = -_636;
    float _664 = _662 + 1.0;
    bool _666 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _668 = isnan(_420);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = fma(_436, 3.1415927410125732421875, _642);
    bool _680 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _682 = isnan(_420);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = _654 * _664;
    float _694 = -_654;
    float _696 = _694 + 1.0;
    float _698 = -_676;
    float _700 = _698 + 1.0;
    bool _702 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _704 = isnan(_420);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _710 = _706 || _708;
    float _712 = float(_710);
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _718 = _676 * _696;
    float _720 = _690 * _700;
    float _722 = -_690;
    float _724 = _722 + 1.0;
    float _726 = _678 * 0.15915493667125701904296875;
    bool _728 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _730 = isnan(_420);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _744 = _712 * _724;
    bool _746 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _748 = isnan(_420);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = fma(_658, _614, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _760 = fma(_716, _614, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _762 = -_712;
    float _764 = _762 + 1.0;
    float _766 = _516 * _744;
    float _768 = _726 * 6.283185482025146484375;
    float _770 = sin(_768);
    float _772 = _536 * _744;
    float _774 = _518 * _744;
    float _776 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[159].x, _766);
    float _778 = -_738;
    float _780 = _778 + 1.0;
    float _782 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[159].y, _772);
    float _784 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[159].z, _774);
    float _786 = fma(_542, _720, _776);
    float _788 = fma(_544, _720, _782);
    float _790 = _612 * _780;
    float _792 = fma(_570, _718, _786);
    float _794 = fma(_546, _720, _784);
    float _796 = fma(_572, _718, _788);
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _798;
    float _802 = fma(_576, _692, _792);
    float _804 = _770 * 1.256637096405029296875;
    float _806 = fma(_742, _614, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _808 = -_756;
    float _810 = _808 + 1.0;
    float _812 = fma(_620, _660, _802);
    float _814 = _804 * 0.15915493667125701904296875;
    float _816 = fma(_578, _692, _796);
    float _818 = fma(_574, _718, _794);
    float _820 = fma(_800, _514, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _822 = _738 * _810;
    float _824 = fma(_806, _790, _812);
    float _826 = _814 * 6.283185482025146484375;
    float _828 = sin(_826);
    float _830 = fma(_588, _692, _818);
    float _832 = _642 * 0.15915493667125701904296875;
    float _834 = fma(_820, _822, _824);
    float _836 = in.m_55.x;
    float _838 = in.m_55.y;
    float _840 = in.m_55.z;
    float _842 = fma(_624, _660, _830);
    float _844 = _814 * 6.283185482025146484375;
    float _846 = cos(_844);
    float _848 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[166].x, _834);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _850;
    float _854 = fma(_622, _660, _816);
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _856;
    float _860 = _848 * _318;
    float _862 = fma(_852, _514, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _864 = fma(_760, _790, _842);
    float _866 = _832 * 6.283185482025146484375;
    float _868 = sin(_866);
    float _870 = fma(_858, _514, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _872 = fma(_758, _790, _854);
    float _874 = _848 * _270;
    float _876 = _860 * _828;
    float _878 = fma(_862, _822, _864);
    float _880 = fma(_870, _822, _872);
    float _882 = _848 * _300;
    float _884 = _832 * 6.283185482025146484375;
    float _886 = cos(_884);
    float _888 = _860 * _846;
    float _890 = -_876;
    float _892 = fma(_874, _846, _890);
    float _894 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[166].z, _878);
    float _896 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[166].y, _880);
    float _898 = fma(_874, _828, _888);
    float _900 = _840 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _902 = _892 * _868;
    float _904 = fma(_286, _894, _898);
    float _906 = _838 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _908 = _900 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _910 = _836 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _912 = _906 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _914 = _892 * _886;
    float _916 = -_902;
    float _918 = fma(_882, _886, _916);
    float _920 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _904);
    float _922 = _910 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _924 = fma(_882, _868, _914);
    float _926 = fma(_272, _896, _918);
    float _928 = _920 * _908;
    float _930 = _466 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _932 = _924 + _424;
    float _934 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _926);
    float _936 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[6].x, _930);
    float _938 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _932);
    float _940 = _934 * _922;
    float _942 = fma(_452, (*spvDescriptorSet0.vp_c10)._m0[6].z, _936);
    float _944 = _938 * _912;
    float _946 = _466 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _948 = _466 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _950 = _944 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _952 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[4].x, _946);
    float _954 = _944 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _956 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[5].x, _948);
    float _958 = fma(_940, (*spvDescriptorSet0.vp_c10)._m0[10].x, _950);
    float _960 = fma(_452, (*spvDescriptorSet0.vp_c10)._m0[4].z, _952);
    float _962 = _942 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _964 = fma(_940, (*spvDescriptorSet0.vp_c10)._m0[8].x, _954);
    float _966 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[10].z, _958);
    float _968 = _960 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _970 = _944 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _972 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[8].z, _964);
    float _974 = _962 + _966;
    float _976 = fma(_940, (*spvDescriptorSet0.vp_c10)._m0[9].x, _970);
    float _978 = _968 + _972;
    float _980 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _982 = _974 + _980;
    float _984 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[9].z, _976);
    float _986 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _988 = _978 + _986;
    float _990 = _982 * _982;
    float _992 = fma(_988, _988, _990);
    float _994 = fma(_452, (*spvDescriptorSet0.vp_c10)._m0[5].z, _956);
    float _996 = sqrt(_992);
    float _998 = _994 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1000 = _998 + _984;
    bool _1002 = _996 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1004 = _970;
    float _1006 = _452;
    float _1008 = _956;
    float _1010 = _974;
    float _1012 = _1000;
    if (!_1002)
    {
        _1004 = _978;
    }
    float _1014 = _1004;
    float _1016 = _1014;
    if (!_1002)
    {
        _1006 = _974;
    }
    float _1018 = _1006;
    float _1020 = _1018;
    if (!_1002)
    {
        _1008 = _1000;
    }
    float _1022 = _1008;
    bool _1024 = !_1002;
    float _1026 = _1022;
    if (!_1024)
    {
        float _1028 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1030 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1032 = _996 + _1030;
        float _1034 = rsqrt(_992);
        float _1036 = _1032 * _1028;
        float _1038 = _1000 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1040 = _1036 * 0.15915493667125701904296875;
        float _1042 = _1040 * 6.283185482025146484375;
        float _1044 = cos(_1042);
        float _1046 = _1040 * 6.283185482025146484375;
        float _1048 = sin(_1046);
        float _1050 = _1044 + (-1.0);
        float _1052 = _1050 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1054 = fma(_1048, _1038, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1056 = fma(_1000, _1044, _1052);
        float _1058 = _1034 * _1054;
        float _1060 = fma(_988, _1058, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1062 = fma(_982, _1058, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1026 = _1056;
        _1016 = _1060;
        _1020 = _1062;
    }
    float _1064 = _1026;
    float _1066 = _1016;
    float _1068 = _1020;
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1072 = _1064 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1076 = _1066 + _1074;
    float _1078 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1080 = _1068 + _1078;
    float _1082 = _1072 * _1072;
    float _1084 = fma(_1076, _1076, _1082);
    float _1086 = fma(_1080, _1080, _1084);
    float _1088 = rsqrt(_1086);
    float _1090 = sqrt(_1086);
    float _1092 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1094 = _1076 * _1092;
    float _1096 = _1080 * _1092;
    float _1098 = _1094 * _1094;
    float _1100 = _1096 * _1096;
    float _1102 = _1098 + _1100;
    float _1104 = sqrt(_1102);
    bool _1106 = _1104 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1108 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1110 = _1104 + _1108;
    float _1112 = _1088;
    float _1114 = _1110;
    float _1116 = _1092;
    if (_1106)
    {
        float _1118 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1112 = _1118;
    }
    float _1120 = _1112;
    if (_1106)
    {
        float _1122 = rsqrt(_1102);
        _1010 = _1122;
    }
    float _1124 = _1010;
    float _1126 = _1124;
    if (_1106)
    {
        float _1128 = _1110 * _1120;
        _1114 = _1128;
    }
    float _1130 = _1114;
    if (_1106)
    {
        float _1132 = _1130 * 0.15915493667125701904296875;
        _1012 = _1132;
    }
    float _1134 = _1012;
    float _1136 = _1080;
    if (_1106)
    {
        float _1138 = _1134 * 6.283185482025146484375;
        float _1140 = sin(_1138);
        _1136 = _1140;
    }
    float _1142 = _1136;
    float _1144 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1146 = precise::max(0.0, _1144);
    float _1148 = _978;
    float _1150 = _1146;
    float _1152 = _1144;
    if (_1106)
    {
        float _1154 = _1134 * 6.283185482025146484375;
        float _1156 = cos(_1154);
        _1148 = _1156;
    }
    float _1158 = _1148;
    float _1160 = -_1092;
    float _1162 = -_1146;
    float _1164 = fma(_1072, _1160, _1162);
    float _1166 = _1164;
    if (_1106)
    {
        float _1168 = _1164 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1150 = _1168;
    }
    float _1170 = _1150;
    float _1172 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1174 = _1142;
    float _1176 = _1170;
    if (_1106)
    {
        float _1178 = fma(_1142, _1170, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1174 = _1178;
    }
    float _1180 = _1174;
    float _1182 = _1180;
    if (!_1106)
    {
        _1176 = _1098;
    }
    float _1184 = _1176;
    float _1186 = _1184;
    float _1188 = _1158;
    if (_1106)
    {
        float _1190 = _1158 + (-1.0);
        _1152 = _1190;
    }
    float _1192 = _1152;
    float _1194 = _1192;
    if (_1106)
    {
        float _1196 = _1124 * _1180;
        _1116 = _1196;
    }
    float _1198 = _1116;
    if (!_1106)
    {
        _1182 = _1094;
    }
    float _1200 = _1182;
    float _1202 = _1200;
    if (_1106)
    {
        float _1204 = _1192 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1126 = _1204;
    }
    float _1206 = _1126;
    if (_1106)
    {
        float _1208 = _1094 * _1198;
        _1202 = _1208;
    }
    float _1210 = _1202;
    if (!_1106)
    {
        _1194 = _1096;
    }
    float _1212 = _1194;
    float _1214 = _1212;
    if (_1106)
    {
        float _1216 = _1096 * _1198;
        _1214 = _1216;
    }
    float _1218 = _1214;
    if (_1106)
    {
        float _1220 = fma(_1164, _1158, _1206);
        _1166 = _1220;
    }
    float _1222 = _1166;
    if (_1106)
    {
        float _1224 = _1210 * _1210;
        _1186 = _1224;
    }
    float _1226 = _1186;
    if (!_1106)
    {
        _1188 = _1100;
    }
    float _1228 = _1188;
    float _1230 = _1228;
    if (_1106)
    {
        float _1232 = _1218 * _1218;
        _1230 = _1232;
    }
    float _1234 = _1230;
    float _1236 = fma(_1222, _1222, _1226);
    float _1238 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1240 = _1236 + _1234;
    float _1242 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1172);
    float _1244 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1246 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1248 = fma(_1090, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1246);
    float _1250 = precise::clamp(_1248, 0.0, 1.0);
    float _1252 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1254 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1242);
    float _1256 = rsqrt(_1240);
    float _1258 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1260 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1244);
    float _1262 = -_1250;
    float _1264 = _1262 + 1.0;
    float _1266 = _1254 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1268 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1258);
    float _1270 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1260);
    float _1272 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1252);
    float _1274 = abs(_1264);
    float _1276 = log2(_1274);
    float _1278 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1268);
    float _1280 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1282 = _1266 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1284 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1272);
    float _1286 = _1278 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1288 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1290 = -_1282;
    float _1292 = fma(_1290, _1238, 1.0);
    float _1294 = _1256 * _1210;
    float _1296 = _1256 * _1218;
    float _1298 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1288);
    float _1300 = _1256 * _1222;
    float _1302 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1304 = _1284 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1306 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1298);
    float _1308 = log2(_1292);
    float _1310 = -_1302;
    float _1312 = fma(_1300, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1310);
    float _1314 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1316 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1306);
    float _1318 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1320 = -_1296;
    float _1322 = fma(_1320, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1312);
    float _1324 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1326 = _1300 + 1.0;
    float _1328 = exp2(_1314);
    float _1330 = fma(_1322, -0.5, 0.5);
    float _1332 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1324);
    float _1334 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1318);
    float _1336 = fma(_1322, 0.5, 0.5);
    float _1338 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1332);
    float _1340 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1334);
    float _1342 = 1.0 / _1316;
    float _1344 = fma(_1336, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1346 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1338);
    float _1348 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1340);
    float _1350 = _1308 * 0.693147182464599609375;
    float _1352 = fma(_1336, _1344, -0.212114393711090087890625);
    float _1354 = sqrt(_1330);
    float _1356 = -_1300;
    float _1358 = fma(_1328, _1326, _1356);
    float _1360 = fma(_1336, _1352, 1.570728778839111328125);
    float _1362 = _1350 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1364 = fma(_1358, 0.5, 0.5);
    float _1366 = _1346 * _1342;
    float _1368 = _1348 * _1342;
    float _1370 = fma(_1366, 0.5, 0.5);
    float _1372 = fma(_1368, -0.5, 0.5);
    float _1374 = _1354 * 0.636619746685028076171875;
    float3 _3884 = float3(_1370, _1372, _1362);
    float _1376 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3884, float3(0.0), isnan(_3884)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3884, float3(0.0), isnan(_3884)), level(0.0)).x;
    float3 _3895 = float3(_1370, _1372, _1362);
    float4 _1379 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3895, float3(0.0), isnan(_3895)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3895, float3(0.0), isnan(_3895)), level(0.0)).xyzw;
    float _1381 = _1379.x;
    float _1383 = _1379.y;
    float _1385 = _1379.z;
    float _1387 = _1379.w;
    float _1389 = -_1360;
    float _1391 = fma(_1374, _1389, 1.0);
    float2 _3917 = float2(_1391, _1364);
    float3 _1395 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3917, float2(0.0), isnan(_3917)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3917, float2(0.0), isnan(_3917)), level(0.0)).xyz;
    float _1397 = _1395.x;
    float _1399 = _1395.y;
    float _1401 = _1395.z;
    float _1403 = in.m_57.y;
    float _1405 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1409 = _1407 != 0;
    float _1411 = in.m_51.y;
    int _1413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1415 = _1413 != 0;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1421 = _1419 != 0;
    float _1423 = in.m_51.w;
    float _1425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1429 = _1427 != 0;
    float _1431 = in.m_57.x;
    float _1433 = _172 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1435 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1437 = _1326;
    if (_1409)
    {
        float _1439 = in.m_51.z;
        _1437 = _1439;
    }
    float _1441 = _1437;
    float _1443 = -_1435;
    float _1445 = fma(_1433, 2.0, _1443);
    bool _1447 = false;
    if (_1415)
    {
        bool _1449 = _172 > 0.5;
        _1447 = _1449;
    }
    bool _1451 = _1447;
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    out.m_59.x = _162;
    out.m_59.y = _164;
    out.m_59.z = _166;
    float _1455 = exp2(_1405);
    float _1457 = -_1403;
    float _1459 = _1457 + 1.0;
    out.m_61.x = _276;
    float _1461 = _1425 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1463 = _1411 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1465 = _1411 > 0.5;
    float _1467 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1417);
    float _1469 = fma(_1463, -2.0, _1453);
    bool _1471 = _1423 > 0.5;
    out.m_63.x = _926;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1475 = _1471 ? as_type<int>(_1459) : as_type<int>(_1403);
    float _1477 = in.m_65.x;
    float _1479 = in.m_65.y;
    float _1481 = in.m_65.z;
    float _1483 = in.m_65.w;
    int _1485 = 0;
    bool _1487 = _1471;
    float _1489 = _1403;
    float _1491 = _1473;
    int _1493 = as_type<int>(_1467);
    if (_1415)
    {
        float _1495 = -_1431;
        float _1497 = _1495 + 1.0;
        _1485 = as_type<int>(_1497);
    }
    int _1499 = _1485;
    if (_1409)
    {
        bool _1501 = _1441 > 0.5;
        _1487 = _1501;
    }
    bool _1503 = _1487;
    float _1505 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1473);
    float _1507 = in.m_67.x;
    float _1509 = in.m_67.y;
    float _1511 = in.m_67.z;
    float _1513 = _1421 ? as_type<float>(_1475) : _1403;
    float _1515 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1469);
    if (_1429)
    {
        float _1517 = _1465 ? _1459 : _1403;
        _1489 = _1517;
    }
    float _1519 = _1489;
    float _1521 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1505);
    float _1523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_1415)
    {
        _1491 = _1431;
    }
    float _1525 = _1491;
    float _1527 = -_136;
    float _1529 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1445);
    float _1531 = _1525;
    if (_1415)
    {
        float _1533 = _1451 ? as_type<float>(_1499) : _1431;
        _1531 = _1533;
    }
    float _1535 = _1531;
    float _1537 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1467);
    float _1539 = fma(_1461, _1519, -0.5);
    if (_1409)
    {
        float _1541 = -_1431;
        float _1543 = _1541 + 1.0;
        _1493 = as_type<int>(_1543);
    }
    int _1545 = _1493;
    float _1547 = -_924;
    bool _1549 = _424 != _1547;
    bool _1551 = isnan(_424);
    bool _1553 = _1549 || _1551;
    bool _1555 = isnan(_1547);
    bool _1557 = _1553 || _1555;
    float _1559 = -_1455;
    float _1561 = _1559 + 1.0;
    float _1563 = -_1515;
    float _1565 = fma(_1537, _1539, _1563);
    if (!_1409)
    {
        _138 = _1431;
    }
    float _1567 = _138;
    float _1569 = _1513 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1571 = _926 == 0.0;
    bool _1573 = !_1557;
    bool _1575 = _1571 && _1573;
    out.m_69.x = _968;
    out.m_69.y = _998;
    out.m_69.z = _962;
    float _1577 = _1567;
    if (_1409)
    {
        float _1579 = _1503 ? as_type<float>(_1545) : _1431;
        _1577 = _1579;
    }
    float _1581 = _1577;
    float _1583 = _1479 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1585 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1587 = _1479 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1589 = _1479 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1591 = _828 * _1511;
    float _1593 = fma(_1585, _1535, -0.5);
    float _1595 = _846 * _1511;
    bool _1597 = _904 == 0.0;
    bool _1599 = _1597 && _1575;
    float _1601 = -_1591;
    float _1603 = fma(_846, _1509, _1601);
    float _1605 = fma(_1521, _1593, _1529);
    float _1607 = fma(_828, _1509, _1595);
    float _1609 = fma(_1477, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1583);
    float _1611 = _868 * _1603;
    float _1613 = _886 * _1603;
    float _1615 = fma(_1477, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1587);
    float _1617 = fma(_1477, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1589);
    float _1619 = -_1611;
    float _1621 = fma(_886, _1507, _1619);
    float _1623 = fma(_868, _1507, _1613);
    float _1625 = _1607 * _1479;
    float _1627 = fma(_1481, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1609);
    float _1629 = _1621 * _1481;
    float _1631 = fma(_1481, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1615);
    float _1633 = fma(_1481, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1617);
    float _1635 = -_1625;
    float _1637 = fma(_1623, _1481, _1635);
    float _1639 = -_1629;
    float _1641 = fma(_1607, _1477, _1639);
    float _1643 = _1623 * _1477;
    float _1645 = _1623;
    float _1647 = _1621;
    float _1649 = _1607;
    if (!_1599)
    {
        float _1651 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1623);
        _1645 = _1651;
    }
    float _1653 = _1645;
    float _1655 = _1637 * _1483;
    float _1657 = _1641 * _1483;
    float _1659 = -_1643;
    float _1661 = fma(_1621, _1479, _1659);
    if (!_1599)
    {
        float _1663 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1621);
        _1647 = _1663;
    }
    float _1665 = _1647;
    float _1667 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1669 = _1657 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1671 = _1657 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1673 = _1657 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1675 = _1653 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1677 = fma(_1655, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1669);
    float _1679 = fma(_1655, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1671);
    float _1681 = fma(_1655, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1673);
    float _1683 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1685 = _1653 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1687 = _1653 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1689 = _1661 * _1483;
    float _1691 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1683);
    float _1693 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1695 = fma(_1665, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1675);
    float _1697 = fma(_1665, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1685);
    float _1699 = fma(_1665, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1687);
    float _1701 = fma(_1689, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1679);
    float _1703 = fma(_1689, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1677);
    float _1705 = fma(_1689, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1681);
    float _1707 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1691);
    float _1709 = _1581 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_1599)
    {
        float _1711 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1607);
        _1649 = _1711;
    }
    float _1713 = _1649;
    float _1715 = _1569 * _1667;
    out.m_71.x = _1701;
    out.m_71.y = _1703;
    out.m_71.z = _1705;
    float _1717 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1707);
    float _1719 = _1316 * 0.5;
    float _1721 = fma(_1713, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1697);
    out.m_73.x = _1627;
    out.m_73.y = _1631;
    out.m_73.z = _1633;
    float _1723 = _1709 * _1693;
    float _1725 = fma(_1713, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1695);
    float _1727 = _1346 + _1316;
    float _1729 = _1565 + 0.5;
    float _1731 = _1605 + 0.5;
    float _1733 = fma(_1713, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1699);
    float _1735 = _1561 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.x = _1731;
    out.m_75.y = _1729;
    out.m_75.z = _1723;
    out.m_75.w = _1715;
    float _1737 = _1717 + _1316;
    float _1739 = fma(_1348, -0.5, _1719);
    float _1741 = _1727 * 0.5;
    float _1743 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1745 = _1737 * 0.5;
    out.m_77.x = _1725;
    out.m_77.y = _1721;
    out.m_77.z = _1733;
    out.m_79.x = _1066;
    out.m_79.y = _1064;
    out.m_79.z = _1068;
    out.gl_Position.x = _1346;
    out.gl_Position.y = _1348;
    out.gl_Position.z = _1717;
    out.gl_Position.w = _1316;
    out.m_81.x = _1741;
    out.m_81.y = _1739;
    out.m_81.z = _1745;
    out.m_81.w = _1316;
    out.m_45.x = _1743;
    float _1747 = _1735 * _1376;
    float _1749 = -_1735;
    float _1751 = _1749 + 1.0;
    float _1753 = _1387 * _1747;
    float _1755 = _1387 * _1751;
    float _1757 = _1401 * _1747;
    float _1759 = fma(_1397, _1753, _1381);
    float _1761 = fma(_1399, _1753, _1383);
    float _1763 = fma(_1387, _1757, _1385);
    out.m_83.x = _1759;
    out.m_83.y = _1761;
    out.m_83.z = _1763;
    out.m_83.w = _1755;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

