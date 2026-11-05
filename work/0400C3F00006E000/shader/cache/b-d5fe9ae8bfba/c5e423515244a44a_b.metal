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
    float4 m_65 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_97 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_83 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_81 [[user(locn10)]];
    float4 m_95 [[user(locn11)]];
    float4 m_91 [[user(locn12)]];
    float4 m_93 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_89 [[attribute(0)]];
    float4 m_71 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_69 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_75 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
    float4 m_59 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2009 = false;
    bool _1362 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_48.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_116);
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _122;
    float _128 = _126;
    if (!_120)
    {
        out.m_51.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2294 = as_type<float>(_134);
        out.gl_Position.z = _2294;
    }
    if (!_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_53.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = _152;
    if (_148)
    {
        float _156 = float(_116);
        _128 = _156;
    }
    float _158 = _128;
    bool _160 = _152 >= _158;
    bool _162 = !_148;
    bool _164 = _160 || _162;
    if (_164)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _124;
    if (_164)
    {
        out.m_51.x = 0.0;
    }
    if (_164)
    {
        float _168 = _166 * 5.0;
        _136 = as_type<int>(_168);
    }
    int _170 = _136;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2363 = as_type<float>(_170);
        out.gl_Position.z = _2363;
    }
    if (_164)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _172 = in.m_55.w;
    float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _176 = in.m_57.y;
    int _178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _180 = _178 != 0;
    int _182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _184 = _182 != 0;
    float _186 = in.m_55.y;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _190 = _188 != 0;
    float _192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _196 = _194 != 0;
    float _198 = in.m_55.z;
    int _200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _202 = _200 != 0;
    float _204 = in.m_57.x;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _208 = in.m_55.x;
    float _210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _212 = in.m_59.z;
    bool _214 = _172 > 0.5;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _218 = in.m_61.x;
    float _220 = in.m_61.y;
    float _222 = in.m_61.z;
    float _224 = -_176;
    float _226 = _224 + 1.0;
    bool _228 = _186 > 0.5;
    float _230 = in.m_59.w;
    int _232 = _214 ? as_type<int>(_226) : as_type<int>(_176);
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _236 = _228 ? as_type<int>(_226) : as_type<int>(_176);
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _240 = _198 > 0.5;
    float _242 = _196 ? as_type<float>(_236) : _176;
    int _244 = 0;
    float _246 = _176;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _250 = _204;
    if (_184)
    {
        float _252 = -_204;
        float _254 = _252 + 1.0;
        _244 = as_type<int>(_254);
    }
    int _256 = _244;
    int _258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _260 = _258 != 0;
    int _262 = 0;
    bool _264 = _260;
    if (_190)
    {
        float _266 = -_204;
        float _268 = _266 + 1.0;
        _262 = as_type<int>(_268);
    }
    int _270 = _262;
    float _272 = 0.0;
    if (!_184)
    {
        _272 = _204;
    }
    float _274 = _272;
    float _276 = _208 * 2.0;
    float _278 = _260 ? as_type<float>(_232) : _176;
    float _280 = _208 + _198;
    float _282 = _274;
    if (_180)
    {
        float _284 = _240 ? _226 : _176;
        _246 = _284;
    }
    float _286 = _246;
    out.m_63.z = _212;
    if (_190)
    {
        bool _288 = _208 > 0.5;
        _264 = _288;
    }
    bool _290 = _264;
    float _292 = floor(_276);
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _296 = _294 != 0;
    float _298 = in.m_48.x;
    float _300 = in.m_48.y;
    float _302 = in.m_48.z;
    if (!_190)
    {
        _248 = _204;
    }
    float _304 = _248;
    float _306 = _220 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _308 = _304;
    if (_184)
    {
        float _310 = _240 ? as_type<float>(_256) : _204;
        _282 = _310;
    }
    float _312 = _282;
    float _314 = _218 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    if (_190)
    {
        float _316 = _290 ? as_type<float>(_270) : _204;
        _308 = _316;
    }
    float _318 = _308;
    float _320 = _208 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _324 = _322 != 0;
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _328 = _326 != 0;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _332 = _330 != 0;
    float _334 = _222 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _336 = _186 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _338 = -_206;
    float _340 = fma(_320, 2.0, _338);
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _344 = fma(_336, -2.0, _216);
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _350 = _342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _352 = _346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _354 = _198 * 2.0;
    float _356 = _348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_63.w = _230;
    float _360 = _300 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _362 = _300 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _364 = _300 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    out.m_65.x = _350;
    out.m_65.y = _352;
    out.m_65.z = _356;
    float _366 = floor(_354);
    float _368 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].x, _360);
    float _370 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].x, _362);
    float _372 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].x, _364);
    float _374 = _280 + (-1.0);
    int _376 = 0;
    float _378 = _302;
    float _380 = _368;
    if (_202)
    {
        float _382 = -_204;
        float _384 = _382 + 1.0;
        _376 = as_type<int>(_384);
    }
    int _386 = _376;
    float _388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _392 = _358 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _396 = in.m_59.x;
    float _398 = in.m_59.y;
    float _400 = _186 + _198;
    float _402 = _390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _404 = _394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _406 = _186 + _208;
    float _408 = _400 + (-1.0);
    float _410 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _412 = _366 >= 0.0;
    bool _414 = isnan(_366);
    bool _416 = _412 || _414;
    bool _418 = isnan(0.0);
    bool _420 = _416 || _418;
    float _422 = _406 + (-1.0);
    float _424 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _426 = _186 * 2.0;
    out.m_67.x = _402;
    out.m_67.y = _392;
    out.m_67.z = _404;
    if (_202)
    {
        float _428 = _228 ? as_type<float>(_386) : _204;
        _250 = _428;
    }
    float _430 = _250;
    float _432 = floor(_426);
    bool _434 = _366 > 0.0;
    float _436 = in.m_69.x;
    float _438 = in.m_69.y;
    float _440 = in.m_69.z;
    float _442 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _444 = _420 ? 0 : 1;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _448 = _292 > 0.0;
    float _450 = _306 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _452 = _292 >= 0.0;
    bool _454 = isnan(_292);
    bool _456 = _452 || _454;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    float _462 = _174 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _464 = _398 * 6.283185482025146484375;
    float _466 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _468 = _460 ? 0 : 1;
    float _470 = fma(_396, 8.0, _464);
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _474 = _432 >= 0.0;
    bool _476 = isnan(_432);
    bool _478 = _474 || _476;
    bool _480 = isnan(0.0);
    bool _482 = _478 || _480;
    float _484 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.3300000131130218505859375, _470);
    float _486 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[78].w, _472);
    int _488 = _482 ? 0 : 1;
    bool _490 = _432 > 0.0;
    float _492 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _486);
    float _494 = fma(_462, _242, -0.5);
    float _496 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _344);
    float _498 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[6].z, _372);
    float _500 = _484 * 0.15915493667125701904296875;
    float _502 = _466 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _504 = -_496;
    float _506 = fma(_492, _494, _504);
    float _508 = _438 * 0.20000000298023223876953125;
    float _510 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[4].z, _368);
    float _512 = fma(_278, _502, -0.5);
    float _514 = _508 * _508;
    float _516 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[5].z, _370);
    float _518 = _494;
    if (_296)
    {
        _378 = _208;
    }
    float _520 = _378;
    float _522 = _500 * 6.283185482025146484375;
    float _524 = sin(_522);
    float _526 = fma(_436, _436, _514);
    float _528 = _520;
    if (!_296)
    {
        _380 = _186;
    }
    float _530 = _380;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _534 = _530;
    if (!_296)
    {
        _528 = _198;
    }
    float _536 = _528;
    float _538 = fma(_440, _440, _526);
    if (_296)
    {
        _534 = _208;
    }
    float _540 = _534;
    float _542 = _192 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (!_296)
    {
        _518 = _198;
    }
    float _544 = _518;
    float _546 = _536 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _548 = _544;
    if (_296)
    {
        _548 = _186;
    }
    float _550 = _548;
    float _552 = rsqrt(_538);
    float _554 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[83].z, _532);
    float _556 = _540 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _558 = ~_444;
    int _560 = _558 + 1;
    int _562 = _560 + 1;
    float _564 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[83].w, _234);
    int _566 = _562;
    if (!_434)
    {
        int _568 = ~_444;
        int _570 = _568 + 1;
        _566 = _570;
    }
    int _572 = _566;
    float _574 = _388 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _576 = _210 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _578 = fma(_542, _286, -0.5);
    int _580 = ~_488;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    float _586 = fma(_576, _312, -0.5);
    int _588 = _584;
    float _590 = _574;
    if (!_490)
    {
        int _592 = ~_488;
        int _594 = _592 + 1;
        _588 = _594;
    }
    int _596 = _588;
    float _598 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _600 = log2(_598);
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _604 = float(_572);
    float _606 = _552 * _524;
    float _608 = fma(_574, _318, -0.5);
    bool _610 = !_324;
    float _612 = _610 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _614 = -_602;
    float _616 = fma(_546, 2.0, _614);
    bool _618 = !_328;
    int _620 = _618 ? 0 : 1;
    float _622 = -_238;
    float _624 = fma(_556, 2.0, _622);
    int _626 = abs(as_type<int>(_612));
    float _628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _630 = _612;
    if (_296)
    {
        _630 = _186;
    }
    float _632 = _630;
    float _634 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].z, _554);
    float _636 = float(_626);
    float _638 = _510 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _640 = _632;
    if (!_296)
    {
        _640 = _208;
    }
    float _642 = _640;
    float _644 = _498 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _646 = ~_468;
    int _648 = _646 + 1;
    int _650 = _648 + 1;
    float _652 = _636 * _604;
    int _654 = _650;
    if (!_448)
    {
        int _656 = ~_468;
        int _658 = _656 + 1;
        _654 = _658;
    }
    int _660 = _654;
    float _662 = _600 * _152;
    if (!_296)
    {
        _590 = _198;
    }
    float _664 = _590;
    float _666 = _652 * (-2.0);
    int _668 = abs(_620);
    float _670 = _642 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _672 = _664;
    if (_296)
    {
        _672 = _186;
    }
    float _674 = _672;
    float _676 = exp2(_662);
    float _678 = float(_668);
    float _680 = _628 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _682 = float(_660);
    float _684 = _674 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _686 = fma(_680, _430, -0.5);
    float _688 = _678 * _682;
    float _690 = fma(_684, -2.0, _446);
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _694 = in.m_71.x;
    float _696 = in.m_71.y;
    float _698 = in.m_71.z;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _702 = 1.0 + _700;
    float _704 = fma(_670, -2.0, _692);
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _708 = 1.0 / _702;
    bool _710 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _712 = isnan(1.0);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _718 = _714 || _716;
    float _720 = -_676;
    float _722 = _720 + 1.0;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _726 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _728 = isnan(0.0);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _734 = _730 || _732;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _738 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[78].z, _706);
    float _740 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[88].w, _724);
    bool _742 = !_332;
    int _744 = _742 ? 0 : 1;
    float _746 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[88].z, _736);
    float _748 = _734 ? _722 : 0.0;
    float _750 = _688 * (-2.0);
    int _752 = abs(_744);
    float _754 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _738);
    float _756 = -_152;
    float _758 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[76].x, _340);
    float _760 = -_152;
    float _762 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[86].x, _616);
    float _764 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].z, _746);
    float _766 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].w, _740);
    float _768 = -_152;
    float _770 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[81].x, _624);
    float _772 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].w, _564);
    float _774 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[81].y, _690);
    float _776 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[86].y, _704);
    float _778 = _774;
    if (_718)
    {
        float _780 = _748 * _708;
        _154 = _780;
    }
    float _782 = _154;
    float _784 = fma(_750, _696, _696);
    float _786 = _186 + (-0.5);
    float _788 = fma(_424, _750, _424);
    float _790 = float(_596);
    float _792 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[196].y, _784);
    float _794 = float(_752);
    float _796 = fma(_442, _666, _442);
    float _798 = fma(_788, _782, _792);
    float _800 = fma(_666, _694, _694);
    float _802 = _794 * _790;
    float _804 = _208 + (-0.5);
    float _806 = _798 * 0.15915493667125701904296875;
    float _808 = fma(_396, 0.5, 0.5);
    float _810 = _802 * (-2.0);
    float _812 = _606 * 0.01200000010430812835693359375;
    float _814 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[196].x, _800);
    float _816 = _198 + (-0.5);
    float _818 = fma(_810, _698, _698);
    float _820 = _808 * _812;
    float _822 = fma(_410, _810, _410);
    float _824 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[196].z, _818);
    float _826 = fma(_796, _782, _814);
    float _828 = fma(_508, _820, _438);
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _832 = fma(_436, _820, _436);
    float _834 = fma(_822, _782, _824);
    float _836 = fma(_440, _820, _440);
    float _838 = _830 * _828;
    float _840 = _830 * _832;
    float _842 = in.m_73.x;
    float _844 = in.m_73.y;
    float _846 = in.m_73.z;
    float _848 = fma(_634, _586, _770);
    float _850 = _830 * _836;
    bool _852 = _838 != 0.0;
    bool _854 = isnan(_838);
    bool _856 = _852 || _854;
    bool _858 = isnan(0.0);
    bool _860 = _856 || _858;
    float _862 = fma(_754, _608, _758);
    float _864 = _826 * 0.15915493667125701904296875;
    float _866 = _834 * 0.15915493667125701904296875;
    float _868 = fma(_764, _686, _762);
    float _870 = _806 * 6.283185482025146484375;
    float _872 = sin(_870);
    bool _874 = _840 == 0.0;
    bool _876 = !_860;
    bool _878 = _874 && _876;
    float _880 = _334 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _882 = -_776;
    float _884 = fma(_766, _578, _882);
    float _886 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _840);
    bool _888 = _850 == 0.0;
    bool _890 = _888 && _878;
    float _892 = _314 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _894 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _838);
    float _896 = _806 * 6.283185482025146484375;
    float _898 = cos(_896);
    float _900 = -_774;
    float _902 = fma(_772, _512, _900);
    float _904 = _886 * _892;
    float _906 = _894 * _450;
    float _908 = _864 * 6.283185482025146484375;
    float _910 = cos(_908);
    float _912 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _850);
    float _914 = _820;
    float _916 = _892;
    float _918 = _866;
    float _920 = _872;
    float _922 = _842;
    float _924 = _868;
    if (_890)
    {
        _778 = _842;
    }
    float _926 = _778;
    float _928 = _926;
    if (_890)
    {
        _914 = _844;
    }
    float _930 = _914;
    float _932 = _912 * _880;
    float _934 = in.m_75.x;
    float _936 = in.m_75.y;
    float _938 = in.m_75.z;
    float _940 = in.m_75.w;
    float _942 = _866 * 6.283185482025146484375;
    float _944 = cos(_942);
    float _946 = _930;
    if (_890)
    {
        _916 = _930;
    }
    float _948 = _916;
    float _950 = _948;
    if (!_890)
    {
        _946 = _844;
    }
    float _952 = _946;
    float _954 = _864 * 6.283185482025146484375;
    float _956 = sin(_954);
    float _958 = _910 * _898;
    if (!_890)
    {
        float _960 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[17].y, _952);
        _950 = _960;
    }
    float _962 = _950;
    float _964 = _866 * 6.283185482025146484375;
    float _966 = sin(_964);
    float _968 = _910 * _872;
    float _970 = _910 * _944;
    float _972 = _872 * _944;
    float _974 = _956 * _872;
    if (_890)
    {
        _918 = _846;
    }
    float _976 = _918;
    float _978 = _956 * _944;
    float _980 = _976;
    if (_890)
    {
        _920 = _926;
    }
    float _982 = _920;
    float _984 = _956 * _898;
    float _986 = _982;
    if (!_890)
    {
        _928 = _842;
    }
    float _988 = _928;
    float _990 = _898 * _944;
    if (_890)
    {
        _922 = _976;
    }
    float _992 = _922;
    float _994 = fma(_966, _958, _974);
    float _996 = _992;
    if (!_890)
    {
        _980 = _846;
    }
    float _998 = _980;
    float _1000 = _970 * _906;
    if (!_890)
    {
        float _1002 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[17].y, _988);
        _986 = _1002;
    }
    float _1004 = _986;
    float _1006 = -_906;
    float _1008 = _966 * _1006;
    float _1010 = -_936;
    float _1012 = _966 * _1010;
    if (!_890)
    {
        float _1014 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[17].y, _998);
        _996 = _1014;
    }
    float _1016 = _996;
    float _1018 = _978 * _906;
    float _1020 = _970 * _936;
    float _1022 = -_968;
    float _1024 = fma(_966, _984, _1022);
    float _1026 = _938 * _988;
    float _1028 = -_984;
    float _1030 = fma(_966, _968, _1028);
    float _1032 = fma(_994, _904, _1000);
    float _1034 = fma(_966, _974, _958);
    float _1036 = fma(_990, _934, _1012);
    float _1038 = fma(_994, _934, _1020);
    float _1040 = _978 * _936;
    float _1042 = _934 * _952;
    float _1044 = -_1026;
    float _1046 = fma(_934, _998, _1044);
    float _1048 = fma(_990, _904, _1008);
    float _1050 = fma(_1030, _932, _1032);
    float _1052 = fma(_1024, _934, _1040);
    float _1054 = _936 * _998;
    float _1056 = -_1042;
    float _1058 = fma(_936, _988, _1056);
    float _1060 = fma(_1024, _904, _1018);
    float _1062 = fma(_972, _932, _1048);
    float _1064 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1066 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1068 = fma(_1034, _932, _1060);
    float _1070 = -_962;
    float _1072 = _966 * _1070;
    float _1074 = fma(_1062, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1064);
    float _1076 = fma(_1062, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1066);
    float _1078 = -_1054;
    float _1080 = fma(_938, _952, _1078);
    float _1082 = fma(_1030, _938, _1038);
    float _1084 = fma(_1068, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1074);
    float _1086 = fma(_1068, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1076);
    float _1088 = fma(_990, _1004, _1072);
    float _1090 = fma(_972, _938, _1036);
    float _1092 = _638 + _1084;
    float _1094 = _644 + _1086;
    float _1096 = fma(_1034, _938, _1052);
    float _1098 = _970 * _962;
    float _1100 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1102 = _1092 + _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1106 = _1094 + _1104;
    float _1108 = _978 * _962;
    float _1110 = _1046 * _940;
    float _1112 = _1102 * _1102;
    float _1114 = _1106 * _1106;
    float _1116 = fma(_994, _1004, _1098);
    float _1118 = fma(_1024, _1004, _1108);
    float _1120 = _1080 * _940;
    float _1122 = _1112 + _1114;
    float _1124 = _1058 * _940;
    float _1126 = -_1110;
    float _1128 = _966 * _1126;
    float _1130 = _970 * _1110;
    float _1132 = sqrt(_1122);
    float _1134 = _978 * _1110;
    float _1136 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1138 = fma(_990, _1120, _1128);
    float _1140 = fma(_994, _1120, _1130);
    float _1142 = fma(_1024, _1120, _1134);
    float _1144 = fma(_1062, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1136);
    float _1146 = fma(_972, _1016, _1088);
    float _1148 = fma(_1030, _1016, _1116);
    float _1150 = fma(_1034, _1016, _1118);
    float _1152 = fma(_972, _1124, _1138);
    float _1154 = fma(_1030, _1124, _1140);
    float _1156 = fma(_1034, _1124, _1142);
    float _1158 = fma(_1068, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1144);
    float _1160 = _516 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1162 = _1082 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _1164 = _1132 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1166 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1168 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1170 = _1160 + _1158;
    float _1172 = _1082 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1174 = _1082 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1176 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1178 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1162);
    float _1180 = fma(_1146, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1166);
    float _1182 = fma(_1146, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1168);
    float _1184 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1172);
    float _1186 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1174);
    float _1188 = fma(_1146, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1176);
    float _1190 = _1168;
    float _1192 = _1112;
    float _1194 = _1114;
    float _1196 = _1092;
    float _1198 = _1094;
    if (!_1164)
    {
        _1190 = _1170;
    }
    float _1200 = _1190;
    bool _1202 = !_1164;
    float _1204 = _1200;
    if (!_1202)
    {
        float _1206 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1208 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1210 = _1132 + _1208;
        float _1212 = _1170 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1214 = rsqrt(_1122);
        float _1216 = _1210 * _1206;
        float _1218 = _1216 * 0.15915493667125701904296875;
        float _1220 = _1218 * 6.283185482025146484375;
        float _1222 = sin(_1220);
        float _1224 = _1218 * 6.283185482025146484375;
        float _1226 = cos(_1224);
        float _1228 = fma(_1222, _1212, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1230 = _1214 * _1228;
        float _1232 = _1226 + (-1.0);
        float _1234 = fma(_1102, _1230, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1236 = fma(_1106, _1230, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1238 = _1232 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1240 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1242 = _1234 + _1240;
        float _1244 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1246 = _1236 + _1244;
        float _1248 = fma(_1170, _1226, _1238);
        float _1250 = _1242 * _1242;
        float _1252 = _1246 * _1246;
        _1204 = _1248;
        _1192 = _1250;
        _1194 = _1252;
        _1196 = _1234;
        _1198 = _1236;
    }
    float _1254 = _1204;
    float _1256 = _1192;
    float _1258 = _1194;
    float _1260 = _1196;
    float _1262 = _1198;
    float _1264 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1266 = _1254 + _1264;
    float _1268 = _1154 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1270 = _1154 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1272 = _1154 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1274 = fma(_1266, _1266, _1256);
    float _1276 = fma(_1152, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1268);
    float _1278 = fma(_1152, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1270);
    float _1280 = fma(_1152, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1272);
    float _1282 = _1274 + _1258;
    float _1284 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1276);
    float _1286 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1278);
    float _1288 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1178);
    float _1290 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1184);
    float _1292 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1186);
    float _1294 = sqrt(_1282);
    float _1296 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1280);
    float _1298 = _848 + 0.5;
    float _1300 = _506 + 0.5;
    float _1302 = _868 + 0.5;
    float _1304 = _862 + 0.5;
    float _1306 = _902 + 0.5;
    float _1308 = _884 + 0.5;
    float _1310 = fma(_1150, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1180);
    float _1312 = fma(_1150, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1182);
    float _1314 = fma(_1150, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1188);
    out.m_77.x = _1304;
    out.m_77.y = _1300;
    out.m_77.z = _1298;
    out.m_77.w = _1306;
    out.m_79.x = _1302;
    out.m_79.y = _1308;
    bool _1316 = _1294 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1318 = isnan(_1294);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1324 = _1320 || _1322;
    out.m_81.x = _1288;
    out.m_81.y = _1290;
    out.m_81.z = _1292;
    out.m_83.x = _1296;
    out.m_83.y = _1284;
    out.m_83.z = _1286;
    out.m_85.x = _1310;
    out.m_85.y = _1312;
    out.m_85.z = _1314;
    float _1326 = _1298;
    if (!_1324)
    {
        _924 = 1.0;
    }
    float _1328 = _924;
    bool _1330 = !_1324;
    float _1332 = _1328;
    if (!_1330)
    {
        bool _1334 = _1294 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1336 = isnan(_1294);
        bool _1338 = _1334 || _1336;
        bool _1340 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1342 = _1338 || _1340;
        if (!_1342)
        {
            float _1344 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1346 = _1294 + _1344;
            float _1348 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1350 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1348;
            float _1352 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1354 = _1352 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1356 = 1.0 / _1350;
            float _1358 = _1346 * _1356;
            float _1360 = fma(_1358, _1354, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1332 = _1360;
            _1362 = true;
        }
        else
        {
            bool _1364 = _1294 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1366 = isnan(_1294);
            bool _1368 = _1364 || _1366;
            bool _1370 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1372 = _1368 || _1370;
            if (!_1372)
            {
                float _1374 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1376 = _1294 + _1374;
                float _1378 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1380 = _1378 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1384 = _1382 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1386 = 1.0 / _1380;
                float _1388 = _1376 * _1386;
                float _1390 = fma(_1388, _1384, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1332 = _1390;
                _1362 = true;
            }
            else
            {
                _1332 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1362 = false;
    float _1392 = _1332;
    float _1394 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1396 = _1254 + _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1400 = _1260 + _1398;
    float _1402 = fma(_1396, _1392, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1404 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1406 = _1262 + _1404;
    float _1408 = fma(_1400, _1392, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1410 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1412 = _1402 + _1410;
    float _1414 = fma(_1406, _1392, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1418 = _1408 + _1416;
    float _1420 = _1412 * _1412;
    float _1422 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1424 = _1414 + _1422;
    float _1426 = fma(_1418, _1418, _1420);
    float _1428 = fma(_1424, _1424, _1426);
    float _1430 = rsqrt(_1428);
    float _1432 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1434 = _1418 * _1432;
    float _1436 = _1424 * _1432;
    float _1438 = _1434 * _1434;
    float _1440 = _1436 * _1436;
    float _1442 = _1438 + _1440;
    float _1444 = sqrt(_1442);
    bool _1446 = _1444 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1450 = _1444 + _1448;
    float _1452 = _1306;
    float _1454 = _1442;
    float _1456 = _1450;
    float _1458 = _1412;
    float _1460 = _1432;
    float _1462 = _1434;
    if (_1446)
    {
        float _1464 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1452 = _1464;
    }
    float _1466 = _1452;
    if (_1446)
    {
        float _1468 = rsqrt(_1442);
        _1454 = _1468;
    }
    float _1470 = _1454;
    if (_1446)
    {
        float _1472 = _1450 * _1466;
        _1456 = _1472;
    }
    float _1474 = _1456;
    if (_1446)
    {
        float _1476 = _1474 * 0.15915493667125701904296875;
        _1326 = _1476;
    }
    float _1478 = _1326;
    float _1480 = _1430;
    float _1482 = _1478;
    if (_1446)
    {
        float _1484 = _1478 * 6.283185482025146484375;
        float _1486 = sin(_1484);
        _1480 = _1486;
    }
    float _1488 = _1480;
    float _1490 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1492 = precise::max(0.0, _1490);
    float _1494 = _1424;
    float _1496 = _1492;
    if (_1446)
    {
        float _1498 = _1478 * 6.283185482025146484375;
        float _1500 = cos(_1498);
        _1494 = _1500;
    }
    float _1502 = _1494;
    float _1504 = -_1432;
    float _1506 = -_1492;
    float _1508 = fma(_1412, _1504, _1506);
    float _1510 = _1508;
    if (_1446)
    {
        float _1512 = _1508 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1458 = _1512;
    }
    float _1514 = _1458;
    float _1516 = _1514;
    if (!_1446)
    {
        _1482 = _1436;
    }
    float _1518 = _1482;
    float _1520 = _1488;
    float _1522 = _1518;
    if (_1446)
    {
        float _1524 = fma(_1488, _1514, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1520 = _1524;
    }
    float _1526 = _1520;
    float _1528 = _1502;
    if (_1446)
    {
        float _1530 = _1502 + (-1.0);
        _1496 = _1530;
    }
    float _1532 = _1496;
    if (_1446)
    {
        float _1534 = _1470 * _1526;
        _1460 = _1534;
    }
    float _1536 = _1460;
    if (_1446)
    {
        float _1538 = _1532 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1516 = _1538;
    }
    float _1540 = _1516;
    float _1542 = _1540;
    if (_1446)
    {
        float _1544 = _1434 * _1536;
        _1462 = _1544;
    }
    float _1546 = _1462;
    if (_1446)
    {
        float _1548 = _1436 * _1536;
        _1522 = _1548;
    }
    float _1550 = _1522;
    float _1552 = sqrt(_1428);
    if (_1446)
    {
        float _1554 = fma(_1508, _1502, _1540);
        _1510 = _1554;
    }
    float _1556 = _1510;
    if (!_1446)
    {
        _1528 = _1438;
    }
    float _1558 = _1528;
    float _1560 = _1558;
    if (_1446)
    {
        float _1562 = _1546 * _1546;
        _1560 = _1562;
    }
    float _1564 = _1560;
    if (!_1446)
    {
        _1542 = _1440;
    }
    float _1566 = _1542;
    float _1568 = _1566;
    if (_1446)
    {
        float _1570 = _1550 * _1550;
        _1568 = _1570;
    }
    float _1572 = _1568;
    float _1574 = fma(_1556, _1556, _1564);
    float _1576 = _1402 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1578 = fma(_638, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1580 = _1574 + _1572;
    float _1582 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1584 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1576);
    float _1586 = floor(_1578);
    float _1588 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1590 = fma(_1552, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1588);
    float _1592 = precise::clamp(_1590, 0.0, 1.0);
    float _1594 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1584);
    float _1596 = -_1592;
    float _1598 = _1596 + 1.0;
    float _1600 = _1594 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1602 = rsqrt(_1580);
    float _1604 = fma(_644, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1606 = _1402 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1608 = _1600 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1610 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1606);
    float _1612 = -_1608;
    float _1614 = fma(_1612, _1582, 1.0);
    float _1616 = _1402 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1618 = _1402 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1620 = abs(_1598);
    float _1622 = log2(_1620);
    float _1624 = -_1586;
    float _1626 = _1578 + _1624;
    float _1628 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1616);
    float _1630 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1618);
    float _1632 = _1602 * _1546;
    float _1634 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1630);
    float _1636 = _1602 * _1556;
    float _1638 = _1602 * _1550;
    float _1640 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1642 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1628);
    float _1644 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1646 = floor(_1604);
    float _1648 = -_1640;
    float _1650 = fma(_1636, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1648);
    float _1652 = _1642 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1654 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1656 = _1622 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1658 = -_1638;
    float _1660 = fma(_1658, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1650);
    float _1662 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1610);
    float _1664 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1654);
    float _1666 = exp2(_1656);
    float _1668 = fma(_1660, -0.5, 0.5);
    float _1670 = _1662 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1672 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1664);
    float _1674 = fma(_1660, 0.5, 0.5);
    float _1676 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1678 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1680 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1672);
    float _1682 = log2(_1614);
    float _1684 = fma(_1674, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1686 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1676);
    float _1688 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1678);
    float _1690 = -_1646;
    float _1692 = _1604 + _1690;
    float _1694 = fma(_1674, _1684, -0.212114393711090087890625);
    float _1696 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1686);
    float _1698 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1688);
    float _1700 = 1.0 / _1680;
    float _1702 = _1636 + 1.0;
    float _1704 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1696);
    float _1706 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1698);
    float _1708 = sqrt(_1668);
    float _1710 = -_1636;
    float _1712 = fma(_1666, _1702, _1710);
    float _1714 = _1682 * 0.693147182464599609375;
    float2 _4965 = float2(_1626, _1692);
    float _1716 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4965, float2(0.0), isnan(_4965)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4965, float2(0.0), isnan(_4965)), level(0.0)).x;
    float _1718 = fma(_1674, _1694, 1.570728778839111328125);
    float _1720 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1722 = fma(_1712, 0.5, 0.5);
    float _1724 = _1704 * _1700;
    float _1726 = _1706 * _1700;
    float _1728 = fma(_1724, 0.5, 0.5);
    float _1730 = fma(_1726, -0.5, 0.5);
    float _1732 = _1708 * 0.636619746685028076171875;
    float3 _4999 = float3(_1728, _1730, _1720);
    float _1734 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4999, float3(0.0), isnan(_4999)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4999, float3(0.0), isnan(_4999)), level(0.0)).x;
    float _1736 = -_1718;
    float _1738 = fma(_1732, _1736, 1.0);
    float3 _5015 = float3(_1728, _1730, _1720);
    float4 _1741 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5015, float3(0.0), isnan(_5015)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5015, float3(0.0), isnan(_5015)), level(0.0)).xyzw;
    float _1743 = _1741.x;
    float _1745 = _1741.y;
    float _1747 = _1741.z;
    float _1749 = _1741.w;
    float2 _5031 = float2(_1738, _1722);
    float3 _1753 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5031, float2(0.0), isnan(_5031)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5031, float2(0.0), isnan(_5031)), level(0.0)).xyz;
    float _1755 = _1753.x;
    float _1757 = _1753.y;
    float _1759 = _1753.z;
    float _1761 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1763 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_87.x = _1408;
    out.m_87.y = _1402;
    out.m_87.z = _1414;
    bool _1765 = _1552 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1767 = isnan(_1552);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1773 = _1769 || _1771;
    float _1775 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1761);
    float _1777 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1763);
    float _1779 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1775);
    float _1781 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1777);
    float _1783 = _1779 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1785 = _1781 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1787 = 1.0 / _1783;
    float _1789 = _1785 + _1783;
    float _1791 = _1622 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1793 = exp2(_1791);
    float _1795 = _1789 * _1787;
    float _1797 = _1795 * 0.5;
    float _1799 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1801 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1799);
    float _1803 = 1.0 / _1801;
    float _1805 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1807 = _1803 * _1805;
    float _1809 = abs(_1807);
    float _1811 = log2(_1809);
    bool _1813 = _1807 <= 8000.0;
    bool _1815 = isnan(_1807);
    bool _1817 = _1813 || _1815;
    bool _1819 = isnan(8000.0);
    bool _1821 = _1817 || _1819;
    float _1823 = float(_1821);
    float _1825 = _1811 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1827 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1829 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1827);
    float _1831 = exp2(_1825);
    float _1833 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1829);
    float _1835 = in.m_89.x;
    float _1837 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1833);
    out.gl_Position.x = _1704;
    out.gl_Position.y = _1706;
    out.gl_Position.z = _1837;
    out.gl_Position.w = _1680;
    float _1839 = fma(_1831, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1841 = precise::clamp(_1839, 0.0, 1.0);
    float _1843 = fma(_1841, -2.0, 3.0);
    float _1845 = _1841 * _1841;
    float _1847 = _1845 * _1843;
    float _1849 = _1680;
    float _1851 = _1706;
    float _1853 = _1837;
    float _1855 = _1704;
    if (!_1773)
    {
        _1849 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1857 = _1849;
    float _1859 = _1857;
    float _1861 = _1857;
    if (!_1773)
    {
        _1851 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1863 = _1851;
    float _1865 = -_1847;
    float _1867 = _1865 + 1.0;
    float _1869 = _1863;
    float _1871 = _1863;
    if (!_1773)
    {
        _1853 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1873 = _1853;
    float _1875 = _1873;
    float _1877 = _1873;
    if (!_1773)
    {
        _1855 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1879 = _1855;
    float _1881 = fma(_1867, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1847);
    float _1883 = -_1793;
    float _1885 = _1883 + 1.0;
    float _1887 = _1823 * _1881;
    float _1889 = _1885 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1891 = _1887 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1893 = -_1716;
    float _1895 = _1893 + 1.0;
    float _1897 = _1895 * _1891;
    float _1899 = precise::clamp(_1897, 0.0, 1.0);
    float _1901 = -_1899;
    float _1903 = fma(_1901, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1905 = _1903 * _1835;
    float _1907 = _1889 * _1734;
    float _1909 = -_1889;
    float _1911 = _1909 + 1.0;
    float _1913 = _1749 * _1907;
    float _1915 = _1759 * _1907;
    float _1917 = fma(_1755, _1913, _1743);
    float _1919 = fma(_1757, _1913, _1745);
    float _1921 = _1749 * _1911;
    float _1923 = _1905 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1925 = fma(_1749, _1915, _1747);
    float _1927 = _1911;
    float _1929 = _1905;
    float _1931 = _1879;
    float _1933 = _1879;
    if (!_1773)
    {
        _1927 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1935 = _1927;
    float _1937 = _1935;
    float _1939 = _1935;
    if (!_1773)
    {
        _1929 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1941 = _1929;
    out.m_91.x = _1923;
    out.m_93.x = _1917;
    out.m_93.y = _1919;
    out.m_93.z = _1925;
    out.m_93.w = _1921;
    bool _1943 = !_1773;
    float _1945 = _1941;
    float _1947 = _1941;
    if (!_1943)
    {
        bool _1949 = _1552 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1951 = isnan(_1552);
        bool _1953 = _1949 || _1951;
        bool _1955 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1957 = _1953 || _1955;
        if (!_1957)
        {
            float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1961 = _1552 + _1959;
            float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1965 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1963;
            float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1969 = _1967 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1971 = 1.0 / _1965;
            float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1975 = _1973 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1977 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1979 = _1977 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1983 = _1981 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1985 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1987 = _1985 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1989 = _1961 * _1971;
            float _1991 = precise::clamp(_1989, 0.0, 1.0);
            float _1993 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1995 = _1993 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1997 = fma(_1991, _1969, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1999 = fma(_1991, _1995, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2001 = fma(_1991, _1975, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2003 = fma(_1991, _1979, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2005 = fma(_1991, _1983, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2007 = fma(_1991, _1987, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1871 = _2001;
            _1939 = _2005;
            _1861 = _1997;
            _1933 = _2003;
            _1877 = _1999;
            _1947 = _2007;
            _2009 = true;
        }
        else
        {
            bool _2011 = _1552 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2013 = isnan(_1552);
            bool _2015 = _2011 || _2013;
            bool _2017 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2019 = _2015 || _2017;
            if (!_2019)
            {
                _1859 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2021 = _1859;
            _1861 = _2021;
            if (!_2019)
            {
                _1869 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2023 = _1869;
            _1871 = _2023;
            if (!_2019)
            {
                _1875 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2025 = _1875;
            _1877 = _2025;
            if (!_2019)
            {
                _1931 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2027 = _1931;
            _1933 = _2027;
            if (!_2019)
            {
                _1937 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2029 = _1937;
            _1939 = _2029;
            if (!_2019)
            {
                _1945 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2031 = _1945;
            bool _2033 = !_2019;
            _1947 = _2031;
            if (!_2033)
            {
                bool _2035 = _1552 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2037 = isnan(_1552);
                bool _2039 = _2035 || _2037;
                bool _2041 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2043 = _2039 || _2041;
                if (!_2043)
                {
                    float _2045 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2047 = _1552 + _2045;
                    float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2051 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2049;
                    float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2055 = _2053 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2057 = 1.0 / _2051;
                    float _2059 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2061 = _2059 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2063 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2065 = _2063 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2069 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2073 = _2071 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2075 = _2047 * _2057;
                    float _2077 = precise::clamp(_2075, 0.0, 1.0);
                    float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2081 = _2079 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2083 = fma(_2077, _2055, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2085 = fma(_2077, _2081, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2087 = fma(_2077, _2061, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2089 = fma(_2077, _2065, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2091 = fma(_2077, _2069, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2093 = fma(_2077, _2073, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1871 = _2087;
                    _1939 = _2091;
                    _1861 = _2083;
                    _1933 = _2089;
                    _1877 = _2085;
                    _1947 = _2093;
                    _2009 = true;
                }
                else
                {
                    _1871 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1939 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1861 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1933 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1877 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1947 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2009 = false;
    float _2095 = _1871;
    float _2097 = _1939;
    float _2099 = _1861;
    float _2101 = _1933;
    float _2103 = _1877;
    float _2105 = _1947;
    float _2107 = fma(_1312, -0.5, 0.5);
    float _2109 = precise::clamp(_2107, 0.0, 1.0);
    float _2111 = -_2095;
    float _2113 = _2111 + _2097;
    float _2115 = -_2099;
    float _2117 = _2115 + _2101;
    float _2119 = -_2103;
    float _2121 = _2119 + _2105;
    bool _2123 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2125 = fma(_2109, _2113, _2095);
    float _2127 = fma(_2109, _2117, _2099);
    float _2129 = fma(_2109, _2121, _2103);
    float _2131 = _2125 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2133 = fma(_2127, 0.298911988735198974609375, _2131);
    out.m_91.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2135 = fma(_2129, 0.114477999508380889892578125, _2133);
    out.m_95.x = 0.0;
    float _2137 = -_2135;
    float _2139 = _2127 + _2137;
    float _2141 = -_2135;
    float _2143 = _2125 + _2141;
    float _2145 = -_2135;
    float _2147 = _2129 + _2145;
    float _2149 = fma(_2139, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2135);
    float _2151 = fma(_2143, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2135);
    float _2153 = fma(_2147, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2135);
    out.m_97.x = _2149;
    out.m_97.y = _2151;
    out.m_97.z = _2153;
    if (!_2123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2155 = -_1402;
    float _2157 = _2155 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2159 = -_1408;
    float _2161 = _2159 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2163 = -_1414;
    float _2165 = _2163 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2167 = _2157 * _2157;
    float _2169 = fma(_2161, _2161, _2167);
    float _2171 = fma(_2165, _2165, _2169);
    float _2173 = sqrt(_2171);
    float _2175 = rsqrt(_2171);
    float _2177 = -_2173;
    float _2179 = _2177 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2181 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2183 = precise::clamp(_2181, 0.0, 1.0);
    float _2185 = _2161 * _2175;
    float _2187 = _2157 * _2175;
    float _2189 = abs(_2183);
    float _2191 = log2(_2189);
    float _2193 = _2165 * _2175;
    float _2195 = _2185 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2197 = _1312 * _2187;
    float _2199 = -_2187;
    float _2201 = -_2195;
    float _2203 = fma(_2199, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2201);
    float _2205 = fma(_1310, _2185, _2197);
    float _2207 = -_2193;
    float _2209 = fma(_2207, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2203);
    float _2211 = fma(_1314, _2193, _2205);
    float _2213 = precise::clamp(_2211, 0.0, 1.0);
    float _2215 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2217 = _2209 + _2215;
    float _2219 = _2191 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2221 = _2217 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2223 = precise::clamp(_2221, 0.0, 1.0);
    float _2225 = exp2(_2219);
    float _2227 = _2225 * _2223;
    float _2229 = _2213 * _2227;
    float _2231 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2233 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2235 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _2231;
    out.m_95.y = _2233;
    out.m_95.z = _2235;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2009 = false;
    bool _1362 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_48.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_116);
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _122;
    float _128 = _126;
    if (!_120)
    {
        out.m_51.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2294 = as_type<float>(_134);
        out.gl_Position.z = _2294;
    }
    if (!_120)
    {
        return out;
    }
    float _138 = in.m_53.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = _152;
    if (_148)
    {
        float _156 = float(_116);
        _128 = _156;
    }
    float _158 = _128;
    bool _160 = _152 >= _158;
    bool _162 = !_148;
    bool _164 = _160 || _162;
    if (_164)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _124;
    if (_164)
    {
        out.m_51.x = 0.0;
    }
    if (_164)
    {
        float _168 = _166 * 5.0;
        _136 = as_type<int>(_168);
    }
    int _170 = _136;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2363 = as_type<float>(_170);
        out.gl_Position.z = _2363;
    }
    if (_164)
    {
        return out;
    }
    float _172 = in.m_55.w;
    float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _176 = in.m_57.y;
    int _178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _180 = _178 != 0;
    int _182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _184 = _182 != 0;
    float _186 = in.m_55.y;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _190 = _188 != 0;
    float _192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _196 = _194 != 0;
    float _198 = in.m_55.z;
    int _200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _202 = _200 != 0;
    float _204 = in.m_57.x;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _208 = in.m_55.x;
    float _210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _212 = in.m_59.z;
    bool _214 = _172 > 0.5;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _218 = in.m_61.x;
    float _220 = in.m_61.y;
    float _222 = in.m_61.z;
    float _224 = -_176;
    float _226 = _224 + 1.0;
    bool _228 = _186 > 0.5;
    float _230 = in.m_59.w;
    int _232 = _214 ? as_type<int>(_226) : as_type<int>(_176);
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _236 = _228 ? as_type<int>(_226) : as_type<int>(_176);
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _240 = _198 > 0.5;
    float _242 = _196 ? as_type<float>(_236) : _176;
    int _244 = 0;
    float _246 = _176;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _250 = _204;
    if (_184)
    {
        float _252 = -_204;
        float _254 = _252 + 1.0;
        _244 = as_type<int>(_254);
    }
    int _256 = _244;
    int _258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _260 = _258 != 0;
    int _262 = 0;
    bool _264 = _260;
    if (_190)
    {
        float _266 = -_204;
        float _268 = _266 + 1.0;
        _262 = as_type<int>(_268);
    }
    int _270 = _262;
    float _272 = 0.0;
    if (!_184)
    {
        _272 = _204;
    }
    float _274 = _272;
    float _276 = _208 * 2.0;
    float _278 = _260 ? as_type<float>(_232) : _176;
    float _280 = _208 + _198;
    float _282 = _274;
    if (_180)
    {
        float _284 = _240 ? _226 : _176;
        _246 = _284;
    }
    float _286 = _246;
    out.m_63.z = _212;
    if (_190)
    {
        bool _288 = _208 > 0.5;
        _264 = _288;
    }
    bool _290 = _264;
    float _292 = floor(_276);
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _296 = _294 != 0;
    float _298 = in.m_48.x;
    float _300 = in.m_48.y;
    float _302 = in.m_48.z;
    if (!_190)
    {
        _248 = _204;
    }
    float _304 = _248;
    float _306 = _220 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _308 = _304;
    if (_184)
    {
        float _310 = _240 ? as_type<float>(_256) : _204;
        _282 = _310;
    }
    float _312 = _282;
    float _314 = _218 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    if (_190)
    {
        float _316 = _290 ? as_type<float>(_270) : _204;
        _308 = _316;
    }
    float _318 = _308;
    float _320 = _208 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _324 = _322 != 0;
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _328 = _326 != 0;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _332 = _330 != 0;
    float _334 = _222 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _336 = _186 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _338 = -_206;
    float _340 = fma(_320, 2.0, _338);
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _344 = fma(_336, -2.0, _216);
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _350 = _342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _352 = _346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _354 = _198 * 2.0;
    float _356 = _348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_63.w = _230;
    float _360 = _300 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _362 = _300 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _364 = _300 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    out.m_65.x = _350;
    out.m_65.y = _352;
    out.m_65.z = _356;
    float _366 = floor(_354);
    float _368 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].x, _360);
    float _370 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].x, _362);
    float _372 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].x, _364);
    float _374 = _280 + (-1.0);
    int _376 = 0;
    float _378 = _302;
    float _380 = _368;
    if (_202)
    {
        float _382 = -_204;
        float _384 = _382 + 1.0;
        _376 = as_type<int>(_384);
    }
    int _386 = _376;
    float _388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _392 = _358 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _396 = in.m_59.x;
    float _398 = in.m_59.y;
    float _400 = _186 + _198;
    float _402 = _390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _404 = _394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _406 = _186 + _208;
    float _408 = _400 + (-1.0);
    float _410 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _412 = _366 >= 0.0;
    bool _414 = isnan(_366);
    bool _416 = _412 || _414;
    bool _418 = isnan(0.0);
    bool _420 = _416 || _418;
    float _422 = _406 + (-1.0);
    float _424 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _426 = _186 * 2.0;
    out.m_67.x = _402;
    out.m_67.y = _392;
    out.m_67.z = _404;
    if (_202)
    {
        float _428 = _228 ? as_type<float>(_386) : _204;
        _250 = _428;
    }
    float _430 = _250;
    float _432 = floor(_426);
    bool _434 = _366 > 0.0;
    float _436 = in.m_69.x;
    float _438 = in.m_69.y;
    float _440 = in.m_69.z;
    float _442 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _444 = _420 ? 0 : 1;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _448 = _292 > 0.0;
    float _450 = _306 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _452 = _292 >= 0.0;
    bool _454 = isnan(_292);
    bool _456 = _452 || _454;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    float _462 = _174 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _464 = _398 * 6.283185482025146484375;
    float _466 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _468 = _460 ? 0 : 1;
    float _470 = fma(_396, 8.0, _464);
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _474 = _432 >= 0.0;
    bool _476 = isnan(_432);
    bool _478 = _474 || _476;
    bool _480 = isnan(0.0);
    bool _482 = _478 || _480;
    float _484 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.3300000131130218505859375, _470);
    float _486 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[78].w, _472);
    int _488 = _482 ? 0 : 1;
    bool _490 = _432 > 0.0;
    float _492 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _486);
    float _494 = fma(_462, _242, -0.5);
    float _496 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _344);
    float _498 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[6].z, _372);
    float _500 = _484 * 0.15915493667125701904296875;
    float _502 = _466 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _504 = -_496;
    float _506 = fma(_492, _494, _504);
    float _508 = _438 * 0.20000000298023223876953125;
    float _510 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[4].z, _368);
    float _512 = fma(_278, _502, -0.5);
    float _514 = _508 * _508;
    float _516 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[5].z, _370);
    float _518 = _494;
    if (_296)
    {
        _378 = _208;
    }
    float _520 = _378;
    float _522 = _500 * 6.283185482025146484375;
    float _524 = sin(_522);
    float _526 = fma(_436, _436, _514);
    float _528 = _520;
    if (!_296)
    {
        _380 = _186;
    }
    float _530 = _380;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _534 = _530;
    if (!_296)
    {
        _528 = _198;
    }
    float _536 = _528;
    float _538 = fma(_440, _440, _526);
    if (_296)
    {
        _534 = _208;
    }
    float _540 = _534;
    float _542 = _192 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (!_296)
    {
        _518 = _198;
    }
    float _544 = _518;
    float _546 = _536 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _548 = _544;
    if (_296)
    {
        _548 = _186;
    }
    float _550 = _548;
    float _552 = rsqrt(_538);
    float _554 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[83].z, _532);
    float _556 = _540 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _558 = ~_444;
    int _560 = _558 + 1;
    int _562 = _560 + 1;
    float _564 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[83].w, _234);
    int _566 = _562;
    if (!_434)
    {
        int _568 = ~_444;
        int _570 = _568 + 1;
        _566 = _570;
    }
    int _572 = _566;
    float _574 = _388 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _576 = _210 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _578 = fma(_542, _286, -0.5);
    int _580 = ~_488;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    float _586 = fma(_576, _312, -0.5);
    int _588 = _584;
    float _590 = _574;
    if (!_490)
    {
        int _592 = ~_488;
        int _594 = _592 + 1;
        _588 = _594;
    }
    int _596 = _588;
    float _598 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _600 = log2(_598);
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _604 = float(_572);
    float _606 = _552 * _524;
    float _608 = fma(_574, _318, -0.5);
    bool _610 = !_324;
    float _612 = _610 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _614 = -_602;
    float _616 = fma(_546, 2.0, _614);
    bool _618 = !_328;
    int _620 = _618 ? 0 : 1;
    float _622 = -_238;
    float _624 = fma(_556, 2.0, _622);
    int _626 = abs(as_type<int>(_612));
    float _628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _630 = _612;
    if (_296)
    {
        _630 = _186;
    }
    float _632 = _630;
    float _634 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].z, _554);
    float _636 = float(_626);
    float _638 = _510 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _640 = _632;
    if (!_296)
    {
        _640 = _208;
    }
    float _642 = _640;
    float _644 = _498 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _646 = ~_468;
    int _648 = _646 + 1;
    int _650 = _648 + 1;
    float _652 = _636 * _604;
    int _654 = _650;
    if (!_448)
    {
        int _656 = ~_468;
        int _658 = _656 + 1;
        _654 = _658;
    }
    int _660 = _654;
    float _662 = _600 * _152;
    if (!_296)
    {
        _590 = _198;
    }
    float _664 = _590;
    float _666 = _652 * (-2.0);
    int _668 = abs(_620);
    float _670 = _642 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _672 = _664;
    if (_296)
    {
        _672 = _186;
    }
    float _674 = _672;
    float _676 = exp2(_662);
    float _678 = float(_668);
    float _680 = _628 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _682 = float(_660);
    float _684 = _674 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _686 = fma(_680, _430, -0.5);
    float _688 = _678 * _682;
    float _690 = fma(_684, -2.0, _446);
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _694 = in.m_71.x;
    float _696 = in.m_71.y;
    float _698 = in.m_71.z;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _702 = 1.0 + _700;
    float _704 = fma(_670, -2.0, _692);
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _708 = 1.0 / _702;
    bool _710 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _712 = isnan(1.0);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _718 = _714 || _716;
    float _720 = -_676;
    float _722 = _720 + 1.0;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _726 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _728 = isnan(0.0);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _734 = _730 || _732;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _738 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[78].z, _706);
    float _740 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[88].w, _724);
    bool _742 = !_332;
    int _744 = _742 ? 0 : 1;
    float _746 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[88].z, _736);
    float _748 = _734 ? _722 : 0.0;
    float _750 = _688 * (-2.0);
    int _752 = abs(_744);
    float _754 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _738);
    float _756 = -_152;
    float _758 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[76].x, _340);
    float _760 = -_152;
    float _762 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[86].x, _616);
    float _764 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].z, _746);
    float _766 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].w, _740);
    float _768 = -_152;
    float _770 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[81].x, _624);
    float _772 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].w, _564);
    float _774 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[81].y, _690);
    float _776 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[86].y, _704);
    float _778 = _774;
    if (_718)
    {
        float _780 = _748 * _708;
        _154 = _780;
    }
    float _782 = _154;
    float _784 = fma(_750, _696, _696);
    float _786 = _186 + (-0.5);
    float _788 = fma(_424, _750, _424);
    float _790 = float(_596);
    float _792 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[196].y, _784);
    float _794 = float(_752);
    float _796 = fma(_442, _666, _442);
    float _798 = fma(_788, _782, _792);
    float _800 = fma(_666, _694, _694);
    float _802 = _794 * _790;
    float _804 = _208 + (-0.5);
    float _806 = _798 * 0.15915493667125701904296875;
    float _808 = fma(_396, 0.5, 0.5);
    float _810 = _802 * (-2.0);
    float _812 = _606 * 0.01200000010430812835693359375;
    float _814 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[196].x, _800);
    float _816 = _198 + (-0.5);
    float _818 = fma(_810, _698, _698);
    float _820 = _808 * _812;
    float _822 = fma(_410, _810, _410);
    float _824 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[196].z, _818);
    float _826 = fma(_796, _782, _814);
    float _828 = fma(_508, _820, _438);
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _832 = fma(_436, _820, _436);
    float _834 = fma(_822, _782, _824);
    float _836 = fma(_440, _820, _440);
    float _838 = _830 * _828;
    float _840 = _830 * _832;
    float _842 = in.m_73.x;
    float _844 = in.m_73.y;
    float _846 = in.m_73.z;
    float _848 = fma(_634, _586, _770);
    float _850 = _830 * _836;
    bool _852 = _838 != 0.0;
    bool _854 = isnan(_838);
    bool _856 = _852 || _854;
    bool _858 = isnan(0.0);
    bool _860 = _856 || _858;
    float _862 = fma(_754, _608, _758);
    float _864 = _826 * 0.15915493667125701904296875;
    float _866 = _834 * 0.15915493667125701904296875;
    float _868 = fma(_764, _686, _762);
    float _870 = _806 * 6.283185482025146484375;
    float _872 = sin(_870);
    bool _874 = _840 == 0.0;
    bool _876 = !_860;
    bool _878 = _874 && _876;
    float _880 = _334 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _882 = -_776;
    float _884 = fma(_766, _578, _882);
    float _886 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _840);
    bool _888 = _850 == 0.0;
    bool _890 = _888 && _878;
    float _892 = _314 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _894 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _838);
    float _896 = _806 * 6.283185482025146484375;
    float _898 = cos(_896);
    float _900 = -_774;
    float _902 = fma(_772, _512, _900);
    float _904 = _886 * _892;
    float _906 = _894 * _450;
    float _908 = _864 * 6.283185482025146484375;
    float _910 = cos(_908);
    float _912 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _850);
    float _914 = _820;
    float _916 = _892;
    float _918 = _866;
    float _920 = _872;
    float _922 = _842;
    float _924 = _868;
    if (_890)
    {
        _778 = _842;
    }
    float _926 = _778;
    float _928 = _926;
    if (_890)
    {
        _914 = _844;
    }
    float _930 = _914;
    float _932 = _912 * _880;
    float _934 = in.m_75.x;
    float _936 = in.m_75.y;
    float _938 = in.m_75.z;
    float _940 = in.m_75.w;
    float _942 = _866 * 6.283185482025146484375;
    float _944 = cos(_942);
    float _946 = _930;
    if (_890)
    {
        _916 = _930;
    }
    float _948 = _916;
    float _950 = _948;
    if (!_890)
    {
        _946 = _844;
    }
    float _952 = _946;
    float _954 = _864 * 6.283185482025146484375;
    float _956 = sin(_954);
    float _958 = _910 * _898;
    if (!_890)
    {
        float _960 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[17].y, _952);
        _950 = _960;
    }
    float _962 = _950;
    float _964 = _866 * 6.283185482025146484375;
    float _966 = sin(_964);
    float _968 = _910 * _872;
    float _970 = _910 * _944;
    float _972 = _872 * _944;
    float _974 = _956 * _872;
    if (_890)
    {
        _918 = _846;
    }
    float _976 = _918;
    float _978 = _956 * _944;
    float _980 = _976;
    if (_890)
    {
        _920 = _926;
    }
    float _982 = _920;
    float _984 = _956 * _898;
    float _986 = _982;
    if (!_890)
    {
        _928 = _842;
    }
    float _988 = _928;
    float _990 = _898 * _944;
    if (_890)
    {
        _922 = _976;
    }
    float _992 = _922;
    float _994 = fma(_966, _958, _974);
    float _996 = _992;
    if (!_890)
    {
        _980 = _846;
    }
    float _998 = _980;
    float _1000 = _970 * _906;
    if (!_890)
    {
        float _1002 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[17].y, _988);
        _986 = _1002;
    }
    float _1004 = _986;
    float _1006 = -_906;
    float _1008 = _966 * _1006;
    float _1010 = -_936;
    float _1012 = _966 * _1010;
    if (!_890)
    {
        float _1014 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[17].y, _998);
        _996 = _1014;
    }
    float _1016 = _996;
    float _1018 = _978 * _906;
    float _1020 = _970 * _936;
    float _1022 = -_968;
    float _1024 = fma(_966, _984, _1022);
    float _1026 = _938 * _988;
    float _1028 = -_984;
    float _1030 = fma(_966, _968, _1028);
    float _1032 = fma(_994, _904, _1000);
    float _1034 = fma(_966, _974, _958);
    float _1036 = fma(_990, _934, _1012);
    float _1038 = fma(_994, _934, _1020);
    float _1040 = _978 * _936;
    float _1042 = _934 * _952;
    float _1044 = -_1026;
    float _1046 = fma(_934, _998, _1044);
    float _1048 = fma(_990, _904, _1008);
    float _1050 = fma(_1030, _932, _1032);
    float _1052 = fma(_1024, _934, _1040);
    float _1054 = _936 * _998;
    float _1056 = -_1042;
    float _1058 = fma(_936, _988, _1056);
    float _1060 = fma(_1024, _904, _1018);
    float _1062 = fma(_972, _932, _1048);
    float _1064 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1066 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1068 = fma(_1034, _932, _1060);
    float _1070 = -_962;
    float _1072 = _966 * _1070;
    float _1074 = fma(_1062, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1064);
    float _1076 = fma(_1062, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1066);
    float _1078 = -_1054;
    float _1080 = fma(_938, _952, _1078);
    float _1082 = fma(_1030, _938, _1038);
    float _1084 = fma(_1068, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1074);
    float _1086 = fma(_1068, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1076);
    float _1088 = fma(_990, _1004, _1072);
    float _1090 = fma(_972, _938, _1036);
    float _1092 = _638 + _1084;
    float _1094 = _644 + _1086;
    float _1096 = fma(_1034, _938, _1052);
    float _1098 = _970 * _962;
    float _1100 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1102 = _1092 + _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1106 = _1094 + _1104;
    float _1108 = _978 * _962;
    float _1110 = _1046 * _940;
    float _1112 = _1102 * _1102;
    float _1114 = _1106 * _1106;
    float _1116 = fma(_994, _1004, _1098);
    float _1118 = fma(_1024, _1004, _1108);
    float _1120 = _1080 * _940;
    float _1122 = _1112 + _1114;
    float _1124 = _1058 * _940;
    float _1126 = -_1110;
    float _1128 = _966 * _1126;
    float _1130 = _970 * _1110;
    float _1132 = sqrt(_1122);
    float _1134 = _978 * _1110;
    float _1136 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1138 = fma(_990, _1120, _1128);
    float _1140 = fma(_994, _1120, _1130);
    float _1142 = fma(_1024, _1120, _1134);
    float _1144 = fma(_1062, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1136);
    float _1146 = fma(_972, _1016, _1088);
    float _1148 = fma(_1030, _1016, _1116);
    float _1150 = fma(_1034, _1016, _1118);
    float _1152 = fma(_972, _1124, _1138);
    float _1154 = fma(_1030, _1124, _1140);
    float _1156 = fma(_1034, _1124, _1142);
    float _1158 = fma(_1068, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1144);
    float _1160 = _516 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1162 = _1082 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _1164 = _1132 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1166 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1168 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1170 = _1160 + _1158;
    float _1172 = _1082 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1174 = _1082 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1176 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1178 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1162);
    float _1180 = fma(_1146, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1166);
    float _1182 = fma(_1146, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1168);
    float _1184 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1172);
    float _1186 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1174);
    float _1188 = fma(_1146, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1176);
    float _1190 = _1168;
    float _1192 = _1112;
    float _1194 = _1114;
    float _1196 = _1092;
    float _1198 = _1094;
    if (!_1164)
    {
        _1190 = _1170;
    }
    float _1200 = _1190;
    bool _1202 = !_1164;
    float _1204 = _1200;
    if (!_1202)
    {
        float _1206 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1208 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1210 = _1132 + _1208;
        float _1212 = _1170 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1214 = rsqrt(_1122);
        float _1216 = _1210 * _1206;
        float _1218 = _1216 * 0.15915493667125701904296875;
        float _1220 = _1218 * 6.283185482025146484375;
        float _1222 = sin(_1220);
        float _1224 = _1218 * 6.283185482025146484375;
        float _1226 = cos(_1224);
        float _1228 = fma(_1222, _1212, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1230 = _1214 * _1228;
        float _1232 = _1226 + (-1.0);
        float _1234 = fma(_1102, _1230, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1236 = fma(_1106, _1230, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1238 = _1232 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1240 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1242 = _1234 + _1240;
        float _1244 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1246 = _1236 + _1244;
        float _1248 = fma(_1170, _1226, _1238);
        float _1250 = _1242 * _1242;
        float _1252 = _1246 * _1246;
        _1204 = _1248;
        _1192 = _1250;
        _1194 = _1252;
        _1196 = _1234;
        _1198 = _1236;
    }
    float _1254 = _1204;
    float _1256 = _1192;
    float _1258 = _1194;
    float _1260 = _1196;
    float _1262 = _1198;
    float _1264 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1266 = _1254 + _1264;
    float _1268 = _1154 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1270 = _1154 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1272 = _1154 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1274 = fma(_1266, _1266, _1256);
    float _1276 = fma(_1152, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1268);
    float _1278 = fma(_1152, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1270);
    float _1280 = fma(_1152, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1272);
    float _1282 = _1274 + _1258;
    float _1284 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1276);
    float _1286 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1278);
    float _1288 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1178);
    float _1290 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1184);
    float _1292 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1186);
    float _1294 = sqrt(_1282);
    float _1296 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1280);
    float _1298 = _848 + 0.5;
    float _1300 = _506 + 0.5;
    float _1302 = _868 + 0.5;
    float _1304 = _862 + 0.5;
    float _1306 = _902 + 0.5;
    float _1308 = _884 + 0.5;
    float _1310 = fma(_1150, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1180);
    float _1312 = fma(_1150, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1182);
    float _1314 = fma(_1150, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1188);
    out.m_77.x = _1304;
    out.m_77.y = _1300;
    out.m_77.z = _1298;
    out.m_77.w = _1306;
    out.m_79.x = _1302;
    out.m_79.y = _1308;
    bool _1316 = _1294 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1318 = isnan(_1294);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1324 = _1320 || _1322;
    out.m_81.x = _1288;
    out.m_81.y = _1290;
    out.m_81.z = _1292;
    out.m_83.x = _1296;
    out.m_83.y = _1284;
    out.m_83.z = _1286;
    out.m_85.x = _1310;
    out.m_85.y = _1312;
    out.m_85.z = _1314;
    float _1326 = _1298;
    if (!_1324)
    {
        _924 = 1.0;
    }
    float _1328 = _924;
    bool _1330 = !_1324;
    float _1332 = _1328;
    if (!_1330)
    {
        bool _1334 = _1294 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1336 = isnan(_1294);
        bool _1338 = _1334 || _1336;
        bool _1340 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1342 = _1338 || _1340;
        if (!_1342)
        {
            float _1344 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1346 = _1294 + _1344;
            float _1348 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1350 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1348;
            float _1352 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1354 = _1352 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1356 = 1.0 / _1350;
            float _1358 = _1346 * _1356;
            float _1360 = fma(_1358, _1354, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1332 = _1360;
            _1362 = true;
        }
        else
        {
            bool _1364 = _1294 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1366 = isnan(_1294);
            bool _1368 = _1364 || _1366;
            bool _1370 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1372 = _1368 || _1370;
            if (!_1372)
            {
                float _1374 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1376 = _1294 + _1374;
                float _1378 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1380 = _1378 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1384 = _1382 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1386 = 1.0 / _1380;
                float _1388 = _1376 * _1386;
                float _1390 = fma(_1388, _1384, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1332 = _1390;
                _1362 = true;
            }
            else
            {
                _1332 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1362 = false;
    float _1392 = _1332;
    float _1394 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1396 = _1254 + _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1400 = _1260 + _1398;
    float _1402 = fma(_1396, _1392, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1404 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1406 = _1262 + _1404;
    float _1408 = fma(_1400, _1392, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1410 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1412 = _1402 + _1410;
    float _1414 = fma(_1406, _1392, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1418 = _1408 + _1416;
    float _1420 = _1412 * _1412;
    float _1422 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1424 = _1414 + _1422;
    float _1426 = fma(_1418, _1418, _1420);
    float _1428 = fma(_1424, _1424, _1426);
    float _1430 = rsqrt(_1428);
    float _1432 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1434 = _1418 * _1432;
    float _1436 = _1424 * _1432;
    float _1438 = _1434 * _1434;
    float _1440 = _1436 * _1436;
    float _1442 = _1438 + _1440;
    float _1444 = sqrt(_1442);
    bool _1446 = _1444 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1450 = _1444 + _1448;
    float _1452 = _1306;
    float _1454 = _1442;
    float _1456 = _1450;
    float _1458 = _1412;
    float _1460 = _1432;
    float _1462 = _1434;
    if (_1446)
    {
        float _1464 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1452 = _1464;
    }
    float _1466 = _1452;
    if (_1446)
    {
        float _1468 = rsqrt(_1442);
        _1454 = _1468;
    }
    float _1470 = _1454;
    if (_1446)
    {
        float _1472 = _1450 * _1466;
        _1456 = _1472;
    }
    float _1474 = _1456;
    if (_1446)
    {
        float _1476 = _1474 * 0.15915493667125701904296875;
        _1326 = _1476;
    }
    float _1478 = _1326;
    float _1480 = _1430;
    float _1482 = _1478;
    if (_1446)
    {
        float _1484 = _1478 * 6.283185482025146484375;
        float _1486 = sin(_1484);
        _1480 = _1486;
    }
    float _1488 = _1480;
    float _1490 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1492 = precise::max(0.0, _1490);
    float _1494 = _1424;
    float _1496 = _1492;
    if (_1446)
    {
        float _1498 = _1478 * 6.283185482025146484375;
        float _1500 = cos(_1498);
        _1494 = _1500;
    }
    float _1502 = _1494;
    float _1504 = -_1432;
    float _1506 = -_1492;
    float _1508 = fma(_1412, _1504, _1506);
    float _1510 = _1508;
    if (_1446)
    {
        float _1512 = _1508 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1458 = _1512;
    }
    float _1514 = _1458;
    float _1516 = _1514;
    if (!_1446)
    {
        _1482 = _1436;
    }
    float _1518 = _1482;
    float _1520 = _1488;
    float _1522 = _1518;
    if (_1446)
    {
        float _1524 = fma(_1488, _1514, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1520 = _1524;
    }
    float _1526 = _1520;
    float _1528 = _1502;
    if (_1446)
    {
        float _1530 = _1502 + (-1.0);
        _1496 = _1530;
    }
    float _1532 = _1496;
    if (_1446)
    {
        float _1534 = _1470 * _1526;
        _1460 = _1534;
    }
    float _1536 = _1460;
    if (_1446)
    {
        float _1538 = _1532 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1516 = _1538;
    }
    float _1540 = _1516;
    float _1542 = _1540;
    if (_1446)
    {
        float _1544 = _1434 * _1536;
        _1462 = _1544;
    }
    float _1546 = _1462;
    if (_1446)
    {
        float _1548 = _1436 * _1536;
        _1522 = _1548;
    }
    float _1550 = _1522;
    float _1552 = sqrt(_1428);
    if (_1446)
    {
        float _1554 = fma(_1508, _1502, _1540);
        _1510 = _1554;
    }
    float _1556 = _1510;
    if (!_1446)
    {
        _1528 = _1438;
    }
    float _1558 = _1528;
    float _1560 = _1558;
    if (_1446)
    {
        float _1562 = _1546 * _1546;
        _1560 = _1562;
    }
    float _1564 = _1560;
    if (!_1446)
    {
        _1542 = _1440;
    }
    float _1566 = _1542;
    float _1568 = _1566;
    if (_1446)
    {
        float _1570 = _1550 * _1550;
        _1568 = _1570;
    }
    float _1572 = _1568;
    float _1574 = fma(_1556, _1556, _1564);
    float _1576 = _1402 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1578 = fma(_638, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1580 = _1574 + _1572;
    float _1582 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1584 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1576);
    float _1586 = floor(_1578);
    float _1588 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1590 = fma(_1552, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1588);
    float _1592 = precise::clamp(_1590, 0.0, 1.0);
    float _1594 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1584);
    float _1596 = -_1592;
    float _1598 = _1596 + 1.0;
    float _1600 = _1594 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1602 = rsqrt(_1580);
    float _1604 = fma(_644, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1606 = _1402 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1608 = _1600 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1610 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1606);
    float _1612 = -_1608;
    float _1614 = fma(_1612, _1582, 1.0);
    float _1616 = _1402 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1618 = _1402 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1620 = abs(_1598);
    float _1622 = log2(_1620);
    float _1624 = -_1586;
    float _1626 = _1578 + _1624;
    float _1628 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1616);
    float _1630 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1618);
    float _1632 = _1602 * _1546;
    float _1634 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1630);
    float _1636 = _1602 * _1556;
    float _1638 = _1602 * _1550;
    float _1640 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1642 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1628);
    float _1644 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1646 = floor(_1604);
    float _1648 = -_1640;
    float _1650 = fma(_1636, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1648);
    float _1652 = _1642 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1654 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1656 = _1622 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1658 = -_1638;
    float _1660 = fma(_1658, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1650);
    float _1662 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1610);
    float _1664 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1654);
    float _1666 = exp2(_1656);
    float _1668 = fma(_1660, -0.5, 0.5);
    float _1670 = _1662 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1672 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1664);
    float _1674 = fma(_1660, 0.5, 0.5);
    float _1676 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1678 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1680 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1672);
    float _1682 = log2(_1614);
    float _1684 = fma(_1674, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1686 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1676);
    float _1688 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1678);
    float _1690 = -_1646;
    float _1692 = _1604 + _1690;
    float _1694 = fma(_1674, _1684, -0.212114393711090087890625);
    float _1696 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1686);
    float _1698 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1688);
    float _1700 = 1.0 / _1680;
    float _1702 = _1636 + 1.0;
    float _1704 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1696);
    float _1706 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1698);
    float _1708 = sqrt(_1668);
    float _1710 = -_1636;
    float _1712 = fma(_1666, _1702, _1710);
    float _1714 = _1682 * 0.693147182464599609375;
    float2 _4965 = float2(_1626, _1692);
    float _1716 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4965, float2(0.0), isnan(_4965)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4965, float2(0.0), isnan(_4965)), level(0.0)).x;
    float _1718 = fma(_1674, _1694, 1.570728778839111328125);
    float _1720 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1722 = fma(_1712, 0.5, 0.5);
    float _1724 = _1704 * _1700;
    float _1726 = _1706 * _1700;
    float _1728 = fma(_1724, 0.5, 0.5);
    float _1730 = fma(_1726, -0.5, 0.5);
    float _1732 = _1708 * 0.636619746685028076171875;
    float3 _4999 = float3(_1728, _1730, _1720);
    float _1734 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4999, float3(0.0), isnan(_4999)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4999, float3(0.0), isnan(_4999)), level(0.0)).x;
    float _1736 = -_1718;
    float _1738 = fma(_1732, _1736, 1.0);
    float3 _5015 = float3(_1728, _1730, _1720);
    float4 _1741 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5015, float3(0.0), isnan(_5015)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5015, float3(0.0), isnan(_5015)), level(0.0)).xyzw;
    float _1743 = _1741.x;
    float _1745 = _1741.y;
    float _1747 = _1741.z;
    float _1749 = _1741.w;
    float2 _5031 = float2(_1738, _1722);
    float3 _1753 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5031, float2(0.0), isnan(_5031)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5031, float2(0.0), isnan(_5031)), level(0.0)).xyz;
    float _1755 = _1753.x;
    float _1757 = _1753.y;
    float _1759 = _1753.z;
    float _1761 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1763 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_87.x = _1408;
    out.m_87.y = _1402;
    out.m_87.z = _1414;
    bool _1765 = _1552 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1767 = isnan(_1552);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1773 = _1769 || _1771;
    float _1775 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1761);
    float _1777 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1763);
    float _1779 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1775);
    float _1781 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1777);
    float _1783 = _1779 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1785 = _1781 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1787 = 1.0 / _1783;
    float _1789 = _1785 + _1783;
    float _1791 = _1622 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1793 = exp2(_1791);
    float _1795 = _1789 * _1787;
    float _1797 = _1795 * 0.5;
    float _1799 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1801 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1799);
    float _1803 = 1.0 / _1801;
    float _1805 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1807 = _1803 * _1805;
    float _1809 = abs(_1807);
    float _1811 = log2(_1809);
    bool _1813 = _1807 <= 8000.0;
    bool _1815 = isnan(_1807);
    bool _1817 = _1813 || _1815;
    bool _1819 = isnan(8000.0);
    bool _1821 = _1817 || _1819;
    float _1823 = float(_1821);
    float _1825 = _1811 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1827 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1829 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1827);
    float _1831 = exp2(_1825);
    float _1833 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1829);
    float _1835 = in.m_89.x;
    float _1837 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1833);
    out.gl_Position.x = _1704;
    out.gl_Position.y = _1706;
    out.gl_Position.z = _1837;
    out.gl_Position.w = _1680;
    float _1839 = fma(_1831, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1841 = precise::clamp(_1839, 0.0, 1.0);
    float _1843 = fma(_1841, -2.0, 3.0);
    float _1845 = _1841 * _1841;
    float _1847 = _1845 * _1843;
    float _1849 = _1680;
    float _1851 = _1706;
    float _1853 = _1837;
    float _1855 = _1704;
    if (!_1773)
    {
        _1849 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1857 = _1849;
    float _1859 = _1857;
    float _1861 = _1857;
    if (!_1773)
    {
        _1851 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1863 = _1851;
    float _1865 = -_1847;
    float _1867 = _1865 + 1.0;
    float _1869 = _1863;
    float _1871 = _1863;
    if (!_1773)
    {
        _1853 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1873 = _1853;
    float _1875 = _1873;
    float _1877 = _1873;
    if (!_1773)
    {
        _1855 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1879 = _1855;
    float _1881 = fma(_1867, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1847);
    float _1883 = -_1793;
    float _1885 = _1883 + 1.0;
    float _1887 = _1823 * _1881;
    float _1889 = _1885 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1891 = _1887 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1893 = -_1716;
    float _1895 = _1893 + 1.0;
    float _1897 = _1895 * _1891;
    float _1899 = precise::clamp(_1897, 0.0, 1.0);
    float _1901 = -_1899;
    float _1903 = fma(_1901, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1905 = _1903 * _1835;
    float _1907 = _1889 * _1734;
    float _1909 = -_1889;
    float _1911 = _1909 + 1.0;
    float _1913 = _1749 * _1907;
    float _1915 = _1759 * _1907;
    float _1917 = fma(_1755, _1913, _1743);
    float _1919 = fma(_1757, _1913, _1745);
    float _1921 = _1749 * _1911;
    float _1923 = _1905 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1925 = fma(_1749, _1915, _1747);
    float _1927 = _1911;
    float _1929 = _1905;
    float _1931 = _1879;
    float _1933 = _1879;
    if (!_1773)
    {
        _1927 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1935 = _1927;
    float _1937 = _1935;
    float _1939 = _1935;
    if (!_1773)
    {
        _1929 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1941 = _1929;
    out.m_91.x = _1923;
    out.m_93.x = _1917;
    out.m_93.y = _1919;
    out.m_93.z = _1925;
    out.m_93.w = _1921;
    bool _1943 = !_1773;
    float _1945 = _1941;
    float _1947 = _1941;
    if (!_1943)
    {
        bool _1949 = _1552 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1951 = isnan(_1552);
        bool _1953 = _1949 || _1951;
        bool _1955 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1957 = _1953 || _1955;
        if (!_1957)
        {
            float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1961 = _1552 + _1959;
            float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1965 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1963;
            float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1969 = _1967 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1971 = 1.0 / _1965;
            float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1975 = _1973 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1977 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1979 = _1977 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1983 = _1981 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1985 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1987 = _1985 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1989 = _1961 * _1971;
            float _1991 = precise::clamp(_1989, 0.0, 1.0);
            float _1993 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1995 = _1993 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1997 = fma(_1991, _1969, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1999 = fma(_1991, _1995, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2001 = fma(_1991, _1975, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2003 = fma(_1991, _1979, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2005 = fma(_1991, _1983, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2007 = fma(_1991, _1987, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1871 = _2001;
            _1939 = _2005;
            _1861 = _1997;
            _1933 = _2003;
            _1877 = _1999;
            _1947 = _2007;
            _2009 = true;
        }
        else
        {
            bool _2011 = _1552 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2013 = isnan(_1552);
            bool _2015 = _2011 || _2013;
            bool _2017 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2019 = _2015 || _2017;
            if (!_2019)
            {
                _1859 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2021 = _1859;
            _1861 = _2021;
            if (!_2019)
            {
                _1869 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2023 = _1869;
            _1871 = _2023;
            if (!_2019)
            {
                _1875 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2025 = _1875;
            _1877 = _2025;
            if (!_2019)
            {
                _1931 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2027 = _1931;
            _1933 = _2027;
            if (!_2019)
            {
                _1937 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2029 = _1937;
            _1939 = _2029;
            if (!_2019)
            {
                _1945 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2031 = _1945;
            bool _2033 = !_2019;
            _1947 = _2031;
            if (!_2033)
            {
                bool _2035 = _1552 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2037 = isnan(_1552);
                bool _2039 = _2035 || _2037;
                bool _2041 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2043 = _2039 || _2041;
                if (!_2043)
                {
                    float _2045 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2047 = _1552 + _2045;
                    float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2051 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2049;
                    float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2055 = _2053 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2057 = 1.0 / _2051;
                    float _2059 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2061 = _2059 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2063 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2065 = _2063 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2069 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2073 = _2071 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2075 = _2047 * _2057;
                    float _2077 = precise::clamp(_2075, 0.0, 1.0);
                    float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2081 = _2079 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2083 = fma(_2077, _2055, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2085 = fma(_2077, _2081, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2087 = fma(_2077, _2061, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2089 = fma(_2077, _2065, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2091 = fma(_2077, _2069, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2093 = fma(_2077, _2073, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1871 = _2087;
                    _1939 = _2091;
                    _1861 = _2083;
                    _1933 = _2089;
                    _1877 = _2085;
                    _1947 = _2093;
                    _2009 = true;
                }
                else
                {
                    _1871 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1939 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1861 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1933 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1877 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1947 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2009 = false;
    float _2095 = _1871;
    float _2097 = _1939;
    float _2099 = _1861;
    float _2101 = _1933;
    float _2103 = _1877;
    float _2105 = _1947;
    float _2107 = fma(_1312, -0.5, 0.5);
    float _2109 = precise::clamp(_2107, 0.0, 1.0);
    float _2111 = -_2095;
    float _2113 = _2111 + _2097;
    float _2115 = -_2099;
    float _2117 = _2115 + _2101;
    float _2119 = -_2103;
    float _2121 = _2119 + _2105;
    bool _2123 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2125 = fma(_2109, _2113, _2095);
    float _2127 = fma(_2109, _2117, _2099);
    float _2129 = fma(_2109, _2121, _2103);
    float _2131 = _2125 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2133 = fma(_2127, 0.298911988735198974609375, _2131);
    out.m_91.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2135 = fma(_2129, 0.114477999508380889892578125, _2133);
    out.m_95.x = 0.0;
    float _2137 = -_2135;
    float _2139 = _2127 + _2137;
    float _2141 = -_2135;
    float _2143 = _2125 + _2141;
    float _2145 = -_2135;
    float _2147 = _2129 + _2145;
    float _2149 = fma(_2139, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2135);
    float _2151 = fma(_2143, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2135);
    float _2153 = fma(_2147, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2135);
    out.m_97.x = _2149;
    out.m_97.y = _2151;
    out.m_97.z = _2153;
    if (!_2123)
    {
        return out;
    }
    float _2155 = -_1402;
    float _2157 = _2155 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2159 = -_1408;
    float _2161 = _2159 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2163 = -_1414;
    float _2165 = _2163 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2167 = _2157 * _2157;
    float _2169 = fma(_2161, _2161, _2167);
    float _2171 = fma(_2165, _2165, _2169);
    float _2173 = sqrt(_2171);
    float _2175 = rsqrt(_2171);
    float _2177 = -_2173;
    float _2179 = _2177 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2181 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2183 = precise::clamp(_2181, 0.0, 1.0);
    float _2185 = _2161 * _2175;
    float _2187 = _2157 * _2175;
    float _2189 = abs(_2183);
    float _2191 = log2(_2189);
    float _2193 = _2165 * _2175;
    float _2195 = _2185 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2197 = _1312 * _2187;
    float _2199 = -_2187;
    float _2201 = -_2195;
    float _2203 = fma(_2199, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2201);
    float _2205 = fma(_1310, _2185, _2197);
    float _2207 = -_2193;
    float _2209 = fma(_2207, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2203);
    float _2211 = fma(_1314, _2193, _2205);
    float _2213 = precise::clamp(_2211, 0.0, 1.0);
    float _2215 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2217 = _2209 + _2215;
    float _2219 = _2191 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2221 = _2217 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2223 = precise::clamp(_2221, 0.0, 1.0);
    float _2225 = exp2(_2219);
    float _2227 = _2225 * _2223;
    float _2229 = _2213 * _2227;
    float _2231 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2233 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2235 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _2231;
    out.m_95.y = _2233;
    out.m_95.z = _2235;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2009 = false;
    bool _1362 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_48.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_116);
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _122;
    float _128 = _126;
    if (!_120)
    {
        out.m_51.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2294 = as_type<float>(_134);
        out.gl_Position.z = _2294;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_53.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = _152;
    if (_148)
    {
        float _156 = float(_116);
        _128 = _156;
    }
    float _158 = _128;
    bool _160 = _152 >= _158;
    bool _162 = !_148;
    bool _164 = _160 || _162;
    if (_164)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _124;
    if (_164)
    {
        out.m_51.x = 0.0;
    }
    if (_164)
    {
        float _168 = _166 * 5.0;
        _136 = as_type<int>(_168);
    }
    int _170 = _136;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2363 = as_type<float>(_170);
        out.gl_Position.z = _2363;
    }
    if (_164)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _172 = in.m_55.w;
    float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _176 = in.m_57.y;
    int _178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _180 = _178 != 0;
    int _182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _184 = _182 != 0;
    float _186 = in.m_55.y;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _190 = _188 != 0;
    float _192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _196 = _194 != 0;
    float _198 = in.m_55.z;
    int _200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _202 = _200 != 0;
    float _204 = in.m_57.x;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _208 = in.m_55.x;
    float _210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _212 = in.m_59.z;
    bool _214 = _172 > 0.5;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _218 = in.m_61.x;
    float _220 = in.m_61.y;
    float _222 = in.m_61.z;
    float _224 = -_176;
    float _226 = _224 + 1.0;
    bool _228 = _186 > 0.5;
    float _230 = in.m_59.w;
    int _232 = _214 ? as_type<int>(_226) : as_type<int>(_176);
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _236 = _228 ? as_type<int>(_226) : as_type<int>(_176);
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _240 = _198 > 0.5;
    float _242 = _196 ? as_type<float>(_236) : _176;
    int _244 = 0;
    float _246 = _176;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _250 = _204;
    if (_184)
    {
        float _252 = -_204;
        float _254 = _252 + 1.0;
        _244 = as_type<int>(_254);
    }
    int _256 = _244;
    int _258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _260 = _258 != 0;
    int _262 = 0;
    bool _264 = _260;
    if (_190)
    {
        float _266 = -_204;
        float _268 = _266 + 1.0;
        _262 = as_type<int>(_268);
    }
    int _270 = _262;
    float _272 = 0.0;
    if (!_184)
    {
        _272 = _204;
    }
    float _274 = _272;
    float _276 = _208 * 2.0;
    float _278 = _260 ? as_type<float>(_232) : _176;
    float _280 = _208 + _198;
    float _282 = _274;
    if (_180)
    {
        float _284 = _240 ? _226 : _176;
        _246 = _284;
    }
    float _286 = _246;
    out.m_63.z = _212;
    if (_190)
    {
        bool _288 = _208 > 0.5;
        _264 = _288;
    }
    bool _290 = _264;
    float _292 = floor(_276);
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _296 = _294 != 0;
    float _298 = in.m_48.x;
    float _300 = in.m_48.y;
    float _302 = in.m_48.z;
    if (!_190)
    {
        _248 = _204;
    }
    float _304 = _248;
    float _306 = _220 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _308 = _304;
    if (_184)
    {
        float _310 = _240 ? as_type<float>(_256) : _204;
        _282 = _310;
    }
    float _312 = _282;
    float _314 = _218 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    if (_190)
    {
        float _316 = _290 ? as_type<float>(_270) : _204;
        _308 = _316;
    }
    float _318 = _308;
    float _320 = _208 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _324 = _322 != 0;
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _328 = _326 != 0;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _332 = _330 != 0;
    float _334 = _222 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _336 = _186 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _338 = -_206;
    float _340 = fma(_320, 2.0, _338);
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _344 = fma(_336, -2.0, _216);
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _350 = _342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _352 = _346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _354 = _198 * 2.0;
    float _356 = _348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_63.w = _230;
    float _360 = _300 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _362 = _300 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _364 = _300 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    out.m_65.x = _350;
    out.m_65.y = _352;
    out.m_65.z = _356;
    float _366 = floor(_354);
    float _368 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].x, _360);
    float _370 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].x, _362);
    float _372 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].x, _364);
    float _374 = _280 + (-1.0);
    int _376 = 0;
    float _378 = _302;
    float _380 = _368;
    if (_202)
    {
        float _382 = -_204;
        float _384 = _382 + 1.0;
        _376 = as_type<int>(_384);
    }
    int _386 = _376;
    float _388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _392 = _358 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _396 = in.m_59.x;
    float _398 = in.m_59.y;
    float _400 = _186 + _198;
    float _402 = _390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _404 = _394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _406 = _186 + _208;
    float _408 = _400 + (-1.0);
    float _410 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _412 = _366 >= 0.0;
    bool _414 = isnan(_366);
    bool _416 = _412 || _414;
    bool _418 = isnan(0.0);
    bool _420 = _416 || _418;
    float _422 = _406 + (-1.0);
    float _424 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _426 = _186 * 2.0;
    out.m_67.x = _402;
    out.m_67.y = _392;
    out.m_67.z = _404;
    if (_202)
    {
        float _428 = _228 ? as_type<float>(_386) : _204;
        _250 = _428;
    }
    float _430 = _250;
    float _432 = floor(_426);
    bool _434 = _366 > 0.0;
    float _436 = in.m_69.x;
    float _438 = in.m_69.y;
    float _440 = in.m_69.z;
    float _442 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _444 = _420 ? 0 : 1;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _448 = _292 > 0.0;
    float _450 = _306 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _452 = _292 >= 0.0;
    bool _454 = isnan(_292);
    bool _456 = _452 || _454;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    float _462 = _174 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _464 = _398 * 6.283185482025146484375;
    float _466 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _468 = _460 ? 0 : 1;
    float _470 = fma(_396, 8.0, _464);
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _474 = _432 >= 0.0;
    bool _476 = isnan(_432);
    bool _478 = _474 || _476;
    bool _480 = isnan(0.0);
    bool _482 = _478 || _480;
    float _484 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.3300000131130218505859375, _470);
    float _486 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[78].w, _472);
    int _488 = _482 ? 0 : 1;
    bool _490 = _432 > 0.0;
    float _492 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _486);
    float _494 = fma(_462, _242, -0.5);
    float _496 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _344);
    float _498 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[6].z, _372);
    float _500 = _484 * 0.15915493667125701904296875;
    float _502 = _466 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _504 = -_496;
    float _506 = fma(_492, _494, _504);
    float _508 = _438 * 0.20000000298023223876953125;
    float _510 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[4].z, _368);
    float _512 = fma(_278, _502, -0.5);
    float _514 = _508 * _508;
    float _516 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[5].z, _370);
    float _518 = _494;
    if (_296)
    {
        _378 = _208;
    }
    float _520 = _378;
    float _522 = _500 * 6.283185482025146484375;
    float _524 = sin(_522);
    float _526 = fma(_436, _436, _514);
    float _528 = _520;
    if (!_296)
    {
        _380 = _186;
    }
    float _530 = _380;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _534 = _530;
    if (!_296)
    {
        _528 = _198;
    }
    float _536 = _528;
    float _538 = fma(_440, _440, _526);
    if (_296)
    {
        _534 = _208;
    }
    float _540 = _534;
    float _542 = _192 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (!_296)
    {
        _518 = _198;
    }
    float _544 = _518;
    float _546 = _536 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _548 = _544;
    if (_296)
    {
        _548 = _186;
    }
    float _550 = _548;
    float _552 = rsqrt(_538);
    float _554 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[83].z, _532);
    float _556 = _540 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _558 = ~_444;
    int _560 = _558 + 1;
    int _562 = _560 + 1;
    float _564 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[83].w, _234);
    int _566 = _562;
    if (!_434)
    {
        int _568 = ~_444;
        int _570 = _568 + 1;
        _566 = _570;
    }
    int _572 = _566;
    float _574 = _388 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _576 = _210 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _578 = fma(_542, _286, -0.5);
    int _580 = ~_488;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    float _586 = fma(_576, _312, -0.5);
    int _588 = _584;
    float _590 = _574;
    if (!_490)
    {
        int _592 = ~_488;
        int _594 = _592 + 1;
        _588 = _594;
    }
    int _596 = _588;
    float _598 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _600 = log2(_598);
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _604 = float(_572);
    float _606 = _552 * _524;
    float _608 = fma(_574, _318, -0.5);
    bool _610 = !_324;
    float _612 = _610 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _614 = -_602;
    float _616 = fma(_546, 2.0, _614);
    bool _618 = !_328;
    int _620 = _618 ? 0 : 1;
    float _622 = -_238;
    float _624 = fma(_556, 2.0, _622);
    int _626 = abs(as_type<int>(_612));
    float _628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _630 = _612;
    if (_296)
    {
        _630 = _186;
    }
    float _632 = _630;
    float _634 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].z, _554);
    float _636 = float(_626);
    float _638 = _510 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _640 = _632;
    if (!_296)
    {
        _640 = _208;
    }
    float _642 = _640;
    float _644 = _498 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _646 = ~_468;
    int _648 = _646 + 1;
    int _650 = _648 + 1;
    float _652 = _636 * _604;
    int _654 = _650;
    if (!_448)
    {
        int _656 = ~_468;
        int _658 = _656 + 1;
        _654 = _658;
    }
    int _660 = _654;
    float _662 = _600 * _152;
    if (!_296)
    {
        _590 = _198;
    }
    float _664 = _590;
    float _666 = _652 * (-2.0);
    int _668 = abs(_620);
    float _670 = _642 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _672 = _664;
    if (_296)
    {
        _672 = _186;
    }
    float _674 = _672;
    float _676 = exp2(_662);
    float _678 = float(_668);
    float _680 = _628 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _682 = float(_660);
    float _684 = _674 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _686 = fma(_680, _430, -0.5);
    float _688 = _678 * _682;
    float _690 = fma(_684, -2.0, _446);
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _694 = in.m_71.x;
    float _696 = in.m_71.y;
    float _698 = in.m_71.z;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _702 = 1.0 + _700;
    float _704 = fma(_670, -2.0, _692);
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _708 = 1.0 / _702;
    bool _710 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _712 = isnan(1.0);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _718 = _714 || _716;
    float _720 = -_676;
    float _722 = _720 + 1.0;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _726 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _728 = isnan(0.0);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _734 = _730 || _732;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _738 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[78].z, _706);
    float _740 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[88].w, _724);
    bool _742 = !_332;
    int _744 = _742 ? 0 : 1;
    float _746 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[88].z, _736);
    float _748 = _734 ? _722 : 0.0;
    float _750 = _688 * (-2.0);
    int _752 = abs(_744);
    float _754 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _738);
    float _756 = -_152;
    float _758 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[76].x, _340);
    float _760 = -_152;
    float _762 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[86].x, _616);
    float _764 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].z, _746);
    float _766 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].w, _740);
    float _768 = -_152;
    float _770 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[81].x, _624);
    float _772 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].w, _564);
    float _774 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[81].y, _690);
    float _776 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[86].y, _704);
    float _778 = _774;
    if (_718)
    {
        float _780 = _748 * _708;
        _154 = _780;
    }
    float _782 = _154;
    float _784 = fma(_750, _696, _696);
    float _786 = _186 + (-0.5);
    float _788 = fma(_424, _750, _424);
    float _790 = float(_596);
    float _792 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[196].y, _784);
    float _794 = float(_752);
    float _796 = fma(_442, _666, _442);
    float _798 = fma(_788, _782, _792);
    float _800 = fma(_666, _694, _694);
    float _802 = _794 * _790;
    float _804 = _208 + (-0.5);
    float _806 = _798 * 0.15915493667125701904296875;
    float _808 = fma(_396, 0.5, 0.5);
    float _810 = _802 * (-2.0);
    float _812 = _606 * 0.01200000010430812835693359375;
    float _814 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[196].x, _800);
    float _816 = _198 + (-0.5);
    float _818 = fma(_810, _698, _698);
    float _820 = _808 * _812;
    float _822 = fma(_410, _810, _410);
    float _824 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[196].z, _818);
    float _826 = fma(_796, _782, _814);
    float _828 = fma(_508, _820, _438);
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _832 = fma(_436, _820, _436);
    float _834 = fma(_822, _782, _824);
    float _836 = fma(_440, _820, _440);
    float _838 = _830 * _828;
    float _840 = _830 * _832;
    float _842 = in.m_73.x;
    float _844 = in.m_73.y;
    float _846 = in.m_73.z;
    float _848 = fma(_634, _586, _770);
    float _850 = _830 * _836;
    bool _852 = _838 != 0.0;
    bool _854 = isnan(_838);
    bool _856 = _852 || _854;
    bool _858 = isnan(0.0);
    bool _860 = _856 || _858;
    float _862 = fma(_754, _608, _758);
    float _864 = _826 * 0.15915493667125701904296875;
    float _866 = _834 * 0.15915493667125701904296875;
    float _868 = fma(_764, _686, _762);
    float _870 = _806 * 6.283185482025146484375;
    float _872 = sin(_870);
    bool _874 = _840 == 0.0;
    bool _876 = !_860;
    bool _878 = _874 && _876;
    float _880 = _334 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _882 = -_776;
    float _884 = fma(_766, _578, _882);
    float _886 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _840);
    bool _888 = _850 == 0.0;
    bool _890 = _888 && _878;
    float _892 = _314 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _894 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _838);
    float _896 = _806 * 6.283185482025146484375;
    float _898 = cos(_896);
    float _900 = -_774;
    float _902 = fma(_772, _512, _900);
    float _904 = _886 * _892;
    float _906 = _894 * _450;
    float _908 = _864 * 6.283185482025146484375;
    float _910 = cos(_908);
    float _912 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _850);
    float _914 = _820;
    float _916 = _892;
    float _918 = _866;
    float _920 = _872;
    float _922 = _842;
    float _924 = _868;
    if (_890)
    {
        _778 = _842;
    }
    float _926 = _778;
    float _928 = _926;
    if (_890)
    {
        _914 = _844;
    }
    float _930 = _914;
    float _932 = _912 * _880;
    float _934 = in.m_75.x;
    float _936 = in.m_75.y;
    float _938 = in.m_75.z;
    float _940 = in.m_75.w;
    float _942 = _866 * 6.283185482025146484375;
    float _944 = cos(_942);
    float _946 = _930;
    if (_890)
    {
        _916 = _930;
    }
    float _948 = _916;
    float _950 = _948;
    if (!_890)
    {
        _946 = _844;
    }
    float _952 = _946;
    float _954 = _864 * 6.283185482025146484375;
    float _956 = sin(_954);
    float _958 = _910 * _898;
    if (!_890)
    {
        float _960 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[17].y, _952);
        _950 = _960;
    }
    float _962 = _950;
    float _964 = _866 * 6.283185482025146484375;
    float _966 = sin(_964);
    float _968 = _910 * _872;
    float _970 = _910 * _944;
    float _972 = _872 * _944;
    float _974 = _956 * _872;
    if (_890)
    {
        _918 = _846;
    }
    float _976 = _918;
    float _978 = _956 * _944;
    float _980 = _976;
    if (_890)
    {
        _920 = _926;
    }
    float _982 = _920;
    float _984 = _956 * _898;
    float _986 = _982;
    if (!_890)
    {
        _928 = _842;
    }
    float _988 = _928;
    float _990 = _898 * _944;
    if (_890)
    {
        _922 = _976;
    }
    float _992 = _922;
    float _994 = fma(_966, _958, _974);
    float _996 = _992;
    if (!_890)
    {
        _980 = _846;
    }
    float _998 = _980;
    float _1000 = _970 * _906;
    if (!_890)
    {
        float _1002 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[17].y, _988);
        _986 = _1002;
    }
    float _1004 = _986;
    float _1006 = -_906;
    float _1008 = _966 * _1006;
    float _1010 = -_936;
    float _1012 = _966 * _1010;
    if (!_890)
    {
        float _1014 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[17].y, _998);
        _996 = _1014;
    }
    float _1016 = _996;
    float _1018 = _978 * _906;
    float _1020 = _970 * _936;
    float _1022 = -_968;
    float _1024 = fma(_966, _984, _1022);
    float _1026 = _938 * _988;
    float _1028 = -_984;
    float _1030 = fma(_966, _968, _1028);
    float _1032 = fma(_994, _904, _1000);
    float _1034 = fma(_966, _974, _958);
    float _1036 = fma(_990, _934, _1012);
    float _1038 = fma(_994, _934, _1020);
    float _1040 = _978 * _936;
    float _1042 = _934 * _952;
    float _1044 = -_1026;
    float _1046 = fma(_934, _998, _1044);
    float _1048 = fma(_990, _904, _1008);
    float _1050 = fma(_1030, _932, _1032);
    float _1052 = fma(_1024, _934, _1040);
    float _1054 = _936 * _998;
    float _1056 = -_1042;
    float _1058 = fma(_936, _988, _1056);
    float _1060 = fma(_1024, _904, _1018);
    float _1062 = fma(_972, _932, _1048);
    float _1064 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1066 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1068 = fma(_1034, _932, _1060);
    float _1070 = -_962;
    float _1072 = _966 * _1070;
    float _1074 = fma(_1062, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1064);
    float _1076 = fma(_1062, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1066);
    float _1078 = -_1054;
    float _1080 = fma(_938, _952, _1078);
    float _1082 = fma(_1030, _938, _1038);
    float _1084 = fma(_1068, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1074);
    float _1086 = fma(_1068, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1076);
    float _1088 = fma(_990, _1004, _1072);
    float _1090 = fma(_972, _938, _1036);
    float _1092 = _638 + _1084;
    float _1094 = _644 + _1086;
    float _1096 = fma(_1034, _938, _1052);
    float _1098 = _970 * _962;
    float _1100 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1102 = _1092 + _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1106 = _1094 + _1104;
    float _1108 = _978 * _962;
    float _1110 = _1046 * _940;
    float _1112 = _1102 * _1102;
    float _1114 = _1106 * _1106;
    float _1116 = fma(_994, _1004, _1098);
    float _1118 = fma(_1024, _1004, _1108);
    float _1120 = _1080 * _940;
    float _1122 = _1112 + _1114;
    float _1124 = _1058 * _940;
    float _1126 = -_1110;
    float _1128 = _966 * _1126;
    float _1130 = _970 * _1110;
    float _1132 = sqrt(_1122);
    float _1134 = _978 * _1110;
    float _1136 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1138 = fma(_990, _1120, _1128);
    float _1140 = fma(_994, _1120, _1130);
    float _1142 = fma(_1024, _1120, _1134);
    float _1144 = fma(_1062, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1136);
    float _1146 = fma(_972, _1016, _1088);
    float _1148 = fma(_1030, _1016, _1116);
    float _1150 = fma(_1034, _1016, _1118);
    float _1152 = fma(_972, _1124, _1138);
    float _1154 = fma(_1030, _1124, _1140);
    float _1156 = fma(_1034, _1124, _1142);
    float _1158 = fma(_1068, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1144);
    float _1160 = _516 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1162 = _1082 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _1164 = _1132 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1166 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1168 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1170 = _1160 + _1158;
    float _1172 = _1082 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1174 = _1082 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1176 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1178 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1162);
    float _1180 = fma(_1146, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1166);
    float _1182 = fma(_1146, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1168);
    float _1184 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1172);
    float _1186 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1174);
    float _1188 = fma(_1146, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1176);
    float _1190 = _1168;
    float _1192 = _1112;
    float _1194 = _1114;
    float _1196 = _1092;
    float _1198 = _1094;
    if (!_1164)
    {
        _1190 = _1170;
    }
    float _1200 = _1190;
    bool _1202 = !_1164;
    float _1204 = _1200;
    if (!_1202)
    {
        float _1206 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1208 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1210 = _1132 + _1208;
        float _1212 = _1170 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1214 = rsqrt(_1122);
        float _1216 = _1210 * _1206;
        float _1218 = _1216 * 0.15915493667125701904296875;
        float _1220 = _1218 * 6.283185482025146484375;
        float _1222 = sin(_1220);
        float _1224 = _1218 * 6.283185482025146484375;
        float _1226 = cos(_1224);
        float _1228 = fma(_1222, _1212, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1230 = _1214 * _1228;
        float _1232 = _1226 + (-1.0);
        float _1234 = fma(_1102, _1230, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1236 = fma(_1106, _1230, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1238 = _1232 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1240 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1242 = _1234 + _1240;
        float _1244 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1246 = _1236 + _1244;
        float _1248 = fma(_1170, _1226, _1238);
        float _1250 = _1242 * _1242;
        float _1252 = _1246 * _1246;
        _1204 = _1248;
        _1192 = _1250;
        _1194 = _1252;
        _1196 = _1234;
        _1198 = _1236;
    }
    float _1254 = _1204;
    float _1256 = _1192;
    float _1258 = _1194;
    float _1260 = _1196;
    float _1262 = _1198;
    float _1264 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1266 = _1254 + _1264;
    float _1268 = _1154 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1270 = _1154 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1272 = _1154 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1274 = fma(_1266, _1266, _1256);
    float _1276 = fma(_1152, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1268);
    float _1278 = fma(_1152, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1270);
    float _1280 = fma(_1152, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1272);
    float _1282 = _1274 + _1258;
    float _1284 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1276);
    float _1286 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1278);
    float _1288 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1178);
    float _1290 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1184);
    float _1292 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1186);
    float _1294 = sqrt(_1282);
    float _1296 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1280);
    float _1298 = _848 + 0.5;
    float _1300 = _506 + 0.5;
    float _1302 = _868 + 0.5;
    float _1304 = _862 + 0.5;
    float _1306 = _902 + 0.5;
    float _1308 = _884 + 0.5;
    float _1310 = fma(_1150, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1180);
    float _1312 = fma(_1150, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1182);
    float _1314 = fma(_1150, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1188);
    out.m_77.x = _1304;
    out.m_77.y = _1300;
    out.m_77.z = _1298;
    out.m_77.w = _1306;
    out.m_79.x = _1302;
    out.m_79.y = _1308;
    bool _1316 = _1294 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1318 = isnan(_1294);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1324 = _1320 || _1322;
    out.m_81.x = _1288;
    out.m_81.y = _1290;
    out.m_81.z = _1292;
    out.m_83.x = _1296;
    out.m_83.y = _1284;
    out.m_83.z = _1286;
    out.m_85.x = _1310;
    out.m_85.y = _1312;
    out.m_85.z = _1314;
    float _1326 = _1298;
    if (!_1324)
    {
        _924 = 1.0;
    }
    float _1328 = _924;
    bool _1330 = !_1324;
    float _1332 = _1328;
    if (!_1330)
    {
        bool _1334 = _1294 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1336 = isnan(_1294);
        bool _1338 = _1334 || _1336;
        bool _1340 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1342 = _1338 || _1340;
        if (!_1342)
        {
            float _1344 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1346 = _1294 + _1344;
            float _1348 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1350 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1348;
            float _1352 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1354 = _1352 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1356 = 1.0 / _1350;
            float _1358 = _1346 * _1356;
            float _1360 = fma(_1358, _1354, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1332 = _1360;
            _1362 = true;
        }
        else
        {
            bool _1364 = _1294 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1366 = isnan(_1294);
            bool _1368 = _1364 || _1366;
            bool _1370 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1372 = _1368 || _1370;
            if (!_1372)
            {
                float _1374 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1376 = _1294 + _1374;
                float _1378 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1380 = _1378 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1384 = _1382 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1386 = 1.0 / _1380;
                float _1388 = _1376 * _1386;
                float _1390 = fma(_1388, _1384, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1332 = _1390;
                _1362 = true;
            }
            else
            {
                _1332 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1362 = false;
    float _1392 = _1332;
    float _1394 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1396 = _1254 + _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1400 = _1260 + _1398;
    float _1402 = fma(_1396, _1392, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1404 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1406 = _1262 + _1404;
    float _1408 = fma(_1400, _1392, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1410 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1412 = _1402 + _1410;
    float _1414 = fma(_1406, _1392, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1418 = _1408 + _1416;
    float _1420 = _1412 * _1412;
    float _1422 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1424 = _1414 + _1422;
    float _1426 = fma(_1418, _1418, _1420);
    float _1428 = fma(_1424, _1424, _1426);
    float _1430 = rsqrt(_1428);
    float _1432 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1434 = _1418 * _1432;
    float _1436 = _1424 * _1432;
    float _1438 = _1434 * _1434;
    float _1440 = _1436 * _1436;
    float _1442 = _1438 + _1440;
    float _1444 = sqrt(_1442);
    bool _1446 = _1444 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1450 = _1444 + _1448;
    float _1452 = _1306;
    float _1454 = _1442;
    float _1456 = _1450;
    float _1458 = _1412;
    float _1460 = _1432;
    float _1462 = _1434;
    if (_1446)
    {
        float _1464 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1452 = _1464;
    }
    float _1466 = _1452;
    if (_1446)
    {
        float _1468 = rsqrt(_1442);
        _1454 = _1468;
    }
    float _1470 = _1454;
    if (_1446)
    {
        float _1472 = _1450 * _1466;
        _1456 = _1472;
    }
    float _1474 = _1456;
    if (_1446)
    {
        float _1476 = _1474 * 0.15915493667125701904296875;
        _1326 = _1476;
    }
    float _1478 = _1326;
    float _1480 = _1430;
    float _1482 = _1478;
    if (_1446)
    {
        float _1484 = _1478 * 6.283185482025146484375;
        float _1486 = sin(_1484);
        _1480 = _1486;
    }
    float _1488 = _1480;
    float _1490 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1492 = precise::max(0.0, _1490);
    float _1494 = _1424;
    float _1496 = _1492;
    if (_1446)
    {
        float _1498 = _1478 * 6.283185482025146484375;
        float _1500 = cos(_1498);
        _1494 = _1500;
    }
    float _1502 = _1494;
    float _1504 = -_1432;
    float _1506 = -_1492;
    float _1508 = fma(_1412, _1504, _1506);
    float _1510 = _1508;
    if (_1446)
    {
        float _1512 = _1508 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1458 = _1512;
    }
    float _1514 = _1458;
    float _1516 = _1514;
    if (!_1446)
    {
        _1482 = _1436;
    }
    float _1518 = _1482;
    float _1520 = _1488;
    float _1522 = _1518;
    if (_1446)
    {
        float _1524 = fma(_1488, _1514, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1520 = _1524;
    }
    float _1526 = _1520;
    float _1528 = _1502;
    if (_1446)
    {
        float _1530 = _1502 + (-1.0);
        _1496 = _1530;
    }
    float _1532 = _1496;
    if (_1446)
    {
        float _1534 = _1470 * _1526;
        _1460 = _1534;
    }
    float _1536 = _1460;
    if (_1446)
    {
        float _1538 = _1532 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1516 = _1538;
    }
    float _1540 = _1516;
    float _1542 = _1540;
    if (_1446)
    {
        float _1544 = _1434 * _1536;
        _1462 = _1544;
    }
    float _1546 = _1462;
    if (_1446)
    {
        float _1548 = _1436 * _1536;
        _1522 = _1548;
    }
    float _1550 = _1522;
    float _1552 = sqrt(_1428);
    if (_1446)
    {
        float _1554 = fma(_1508, _1502, _1540);
        _1510 = _1554;
    }
    float _1556 = _1510;
    if (!_1446)
    {
        _1528 = _1438;
    }
    float _1558 = _1528;
    float _1560 = _1558;
    if (_1446)
    {
        float _1562 = _1546 * _1546;
        _1560 = _1562;
    }
    float _1564 = _1560;
    if (!_1446)
    {
        _1542 = _1440;
    }
    float _1566 = _1542;
    float _1568 = _1566;
    if (_1446)
    {
        float _1570 = _1550 * _1550;
        _1568 = _1570;
    }
    float _1572 = _1568;
    float _1574 = fma(_1556, _1556, _1564);
    float _1576 = _1402 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1578 = fma(_638, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1580 = _1574 + _1572;
    float _1582 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1584 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1576);
    float _1586 = floor(_1578);
    float _1588 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1590 = fma(_1552, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1588);
    float _1592 = precise::clamp(_1590, 0.0, 1.0);
    float _1594 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1584);
    float _1596 = -_1592;
    float _1598 = _1596 + 1.0;
    float _1600 = _1594 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1602 = rsqrt(_1580);
    float _1604 = fma(_644, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1606 = _1402 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1608 = _1600 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1610 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1606);
    float _1612 = -_1608;
    float _1614 = fma(_1612, _1582, 1.0);
    float _1616 = _1402 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1618 = _1402 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1620 = abs(_1598);
    float _1622 = log2(_1620);
    float _1624 = -_1586;
    float _1626 = _1578 + _1624;
    float _1628 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1616);
    float _1630 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1618);
    float _1632 = _1602 * _1546;
    float _1634 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1630);
    float _1636 = _1602 * _1556;
    float _1638 = _1602 * _1550;
    float _1640 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1642 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1628);
    float _1644 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1646 = floor(_1604);
    float _1648 = -_1640;
    float _1650 = fma(_1636, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1648);
    float _1652 = _1642 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1654 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1656 = _1622 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1658 = -_1638;
    float _1660 = fma(_1658, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1650);
    float _1662 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1610);
    float _1664 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1654);
    float _1666 = exp2(_1656);
    float _1668 = fma(_1660, -0.5, 0.5);
    float _1670 = _1662 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1672 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1664);
    float _1674 = fma(_1660, 0.5, 0.5);
    float _1676 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1678 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1680 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1672);
    float _1682 = log2(_1614);
    float _1684 = fma(_1674, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1686 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1676);
    float _1688 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1678);
    float _1690 = -_1646;
    float _1692 = _1604 + _1690;
    float _1694 = fma(_1674, _1684, -0.212114393711090087890625);
    float _1696 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1686);
    float _1698 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1688);
    float _1700 = 1.0 / _1680;
    float _1702 = _1636 + 1.0;
    float _1704 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1696);
    float _1706 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1698);
    float _1708 = sqrt(_1668);
    float _1710 = -_1636;
    float _1712 = fma(_1666, _1702, _1710);
    float _1714 = _1682 * 0.693147182464599609375;
    float2 _4965 = float2(_1626, _1692);
    float _1716 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4965, float2(0.0), isnan(_4965)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4965, float2(0.0), isnan(_4965)), level(0.0)).x;
    float _1718 = fma(_1674, _1694, 1.570728778839111328125);
    float _1720 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1722 = fma(_1712, 0.5, 0.5);
    float _1724 = _1704 * _1700;
    float _1726 = _1706 * _1700;
    float _1728 = fma(_1724, 0.5, 0.5);
    float _1730 = fma(_1726, -0.5, 0.5);
    float _1732 = _1708 * 0.636619746685028076171875;
    float3 _4999 = float3(_1728, _1730, _1720);
    float _1734 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4999, float3(0.0), isnan(_4999)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4999, float3(0.0), isnan(_4999)), level(0.0)).x;
    float _1736 = -_1718;
    float _1738 = fma(_1732, _1736, 1.0);
    float3 _5015 = float3(_1728, _1730, _1720);
    float4 _1741 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5015, float3(0.0), isnan(_5015)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5015, float3(0.0), isnan(_5015)), level(0.0)).xyzw;
    float _1743 = _1741.x;
    float _1745 = _1741.y;
    float _1747 = _1741.z;
    float _1749 = _1741.w;
    float2 _5031 = float2(_1738, _1722);
    float3 _1753 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5031, float2(0.0), isnan(_5031)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5031, float2(0.0), isnan(_5031)), level(0.0)).xyz;
    float _1755 = _1753.x;
    float _1757 = _1753.y;
    float _1759 = _1753.z;
    float _1761 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1763 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_87.x = _1408;
    out.m_87.y = _1402;
    out.m_87.z = _1414;
    bool _1765 = _1552 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1767 = isnan(_1552);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1773 = _1769 || _1771;
    float _1775 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1761);
    float _1777 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1763);
    float _1779 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1775);
    float _1781 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1777);
    float _1783 = _1779 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1785 = _1781 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1787 = 1.0 / _1783;
    float _1789 = _1785 + _1783;
    float _1791 = _1622 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1793 = exp2(_1791);
    float _1795 = _1789 * _1787;
    float _1797 = _1795 * 0.5;
    float _1799 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1801 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1799);
    float _1803 = 1.0 / _1801;
    float _1805 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1807 = _1803 * _1805;
    float _1809 = abs(_1807);
    float _1811 = log2(_1809);
    bool _1813 = _1807 <= 8000.0;
    bool _1815 = isnan(_1807);
    bool _1817 = _1813 || _1815;
    bool _1819 = isnan(8000.0);
    bool _1821 = _1817 || _1819;
    float _1823 = float(_1821);
    float _1825 = _1811 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1827 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1829 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1827);
    float _1831 = exp2(_1825);
    float _1833 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1829);
    float _1835 = in.m_89.x;
    float _1837 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1833);
    out.gl_Position.x = _1704;
    out.gl_Position.y = _1706;
    out.gl_Position.z = _1837;
    out.gl_Position.w = _1680;
    float _1839 = fma(_1831, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1841 = precise::clamp(_1839, 0.0, 1.0);
    float _1843 = fma(_1841, -2.0, 3.0);
    float _1845 = _1841 * _1841;
    float _1847 = _1845 * _1843;
    float _1849 = _1680;
    float _1851 = _1706;
    float _1853 = _1837;
    float _1855 = _1704;
    if (!_1773)
    {
        _1849 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1857 = _1849;
    float _1859 = _1857;
    float _1861 = _1857;
    if (!_1773)
    {
        _1851 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1863 = _1851;
    float _1865 = -_1847;
    float _1867 = _1865 + 1.0;
    float _1869 = _1863;
    float _1871 = _1863;
    if (!_1773)
    {
        _1853 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1873 = _1853;
    float _1875 = _1873;
    float _1877 = _1873;
    if (!_1773)
    {
        _1855 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1879 = _1855;
    float _1881 = fma(_1867, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1847);
    float _1883 = -_1793;
    float _1885 = _1883 + 1.0;
    float _1887 = _1823 * _1881;
    float _1889 = _1885 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1891 = _1887 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1893 = -_1716;
    float _1895 = _1893 + 1.0;
    float _1897 = _1895 * _1891;
    float _1899 = precise::clamp(_1897, 0.0, 1.0);
    float _1901 = -_1899;
    float _1903 = fma(_1901, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1905 = _1903 * _1835;
    float _1907 = _1889 * _1734;
    float _1909 = -_1889;
    float _1911 = _1909 + 1.0;
    float _1913 = _1749 * _1907;
    float _1915 = _1759 * _1907;
    float _1917 = fma(_1755, _1913, _1743);
    float _1919 = fma(_1757, _1913, _1745);
    float _1921 = _1749 * _1911;
    float _1923 = _1905 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1925 = fma(_1749, _1915, _1747);
    float _1927 = _1911;
    float _1929 = _1905;
    float _1931 = _1879;
    float _1933 = _1879;
    if (!_1773)
    {
        _1927 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1935 = _1927;
    float _1937 = _1935;
    float _1939 = _1935;
    if (!_1773)
    {
        _1929 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1941 = _1929;
    out.m_91.x = _1923;
    out.m_93.x = _1917;
    out.m_93.y = _1919;
    out.m_93.z = _1925;
    out.m_93.w = _1921;
    bool _1943 = !_1773;
    float _1945 = _1941;
    float _1947 = _1941;
    if (!_1943)
    {
        bool _1949 = _1552 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1951 = isnan(_1552);
        bool _1953 = _1949 || _1951;
        bool _1955 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1957 = _1953 || _1955;
        if (!_1957)
        {
            float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1961 = _1552 + _1959;
            float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1965 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1963;
            float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1969 = _1967 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1971 = 1.0 / _1965;
            float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1975 = _1973 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1977 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1979 = _1977 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1983 = _1981 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1985 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1987 = _1985 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1989 = _1961 * _1971;
            float _1991 = precise::clamp(_1989, 0.0, 1.0);
            float _1993 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1995 = _1993 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1997 = fma(_1991, _1969, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1999 = fma(_1991, _1995, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2001 = fma(_1991, _1975, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2003 = fma(_1991, _1979, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2005 = fma(_1991, _1983, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2007 = fma(_1991, _1987, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1871 = _2001;
            _1939 = _2005;
            _1861 = _1997;
            _1933 = _2003;
            _1877 = _1999;
            _1947 = _2007;
            _2009 = true;
        }
        else
        {
            bool _2011 = _1552 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2013 = isnan(_1552);
            bool _2015 = _2011 || _2013;
            bool _2017 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2019 = _2015 || _2017;
            if (!_2019)
            {
                _1859 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2021 = _1859;
            _1861 = _2021;
            if (!_2019)
            {
                _1869 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2023 = _1869;
            _1871 = _2023;
            if (!_2019)
            {
                _1875 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2025 = _1875;
            _1877 = _2025;
            if (!_2019)
            {
                _1931 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2027 = _1931;
            _1933 = _2027;
            if (!_2019)
            {
                _1937 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2029 = _1937;
            _1939 = _2029;
            if (!_2019)
            {
                _1945 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2031 = _1945;
            bool _2033 = !_2019;
            _1947 = _2031;
            if (!_2033)
            {
                bool _2035 = _1552 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2037 = isnan(_1552);
                bool _2039 = _2035 || _2037;
                bool _2041 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2043 = _2039 || _2041;
                if (!_2043)
                {
                    float _2045 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2047 = _1552 + _2045;
                    float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2051 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2049;
                    float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2055 = _2053 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2057 = 1.0 / _2051;
                    float _2059 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2061 = _2059 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2063 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2065 = _2063 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2069 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2073 = _2071 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2075 = _2047 * _2057;
                    float _2077 = precise::clamp(_2075, 0.0, 1.0);
                    float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2081 = _2079 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2083 = fma(_2077, _2055, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2085 = fma(_2077, _2081, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2087 = fma(_2077, _2061, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2089 = fma(_2077, _2065, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2091 = fma(_2077, _2069, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2093 = fma(_2077, _2073, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1871 = _2087;
                    _1939 = _2091;
                    _1861 = _2083;
                    _1933 = _2089;
                    _1877 = _2085;
                    _1947 = _2093;
                    _2009 = true;
                }
                else
                {
                    _1871 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1939 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1861 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1933 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1877 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1947 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2009 = false;
    float _2095 = _1871;
    float _2097 = _1939;
    float _2099 = _1861;
    float _2101 = _1933;
    float _2103 = _1877;
    float _2105 = _1947;
    float _2107 = fma(_1312, -0.5, 0.5);
    float _2109 = precise::clamp(_2107, 0.0, 1.0);
    float _2111 = -_2095;
    float _2113 = _2111 + _2097;
    float _2115 = -_2099;
    float _2117 = _2115 + _2101;
    float _2119 = -_2103;
    float _2121 = _2119 + _2105;
    bool _2123 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2125 = fma(_2109, _2113, _2095);
    float _2127 = fma(_2109, _2117, _2099);
    float _2129 = fma(_2109, _2121, _2103);
    float _2131 = _2125 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2133 = fma(_2127, 0.298911988735198974609375, _2131);
    out.m_91.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2135 = fma(_2129, 0.114477999508380889892578125, _2133);
    out.m_95.x = 0.0;
    float _2137 = -_2135;
    float _2139 = _2127 + _2137;
    float _2141 = -_2135;
    float _2143 = _2125 + _2141;
    float _2145 = -_2135;
    float _2147 = _2129 + _2145;
    float _2149 = fma(_2139, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2135);
    float _2151 = fma(_2143, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2135);
    float _2153 = fma(_2147, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2135);
    out.m_97.x = _2149;
    out.m_97.y = _2151;
    out.m_97.z = _2153;
    if (!_2123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2155 = -_1402;
    float _2157 = _2155 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2159 = -_1408;
    float _2161 = _2159 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2163 = -_1414;
    float _2165 = _2163 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2167 = _2157 * _2157;
    float _2169 = fma(_2161, _2161, _2167);
    float _2171 = fma(_2165, _2165, _2169);
    float _2173 = sqrt(_2171);
    float _2175 = rsqrt(_2171);
    float _2177 = -_2173;
    float _2179 = _2177 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2181 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2183 = precise::clamp(_2181, 0.0, 1.0);
    float _2185 = _2161 * _2175;
    float _2187 = _2157 * _2175;
    float _2189 = abs(_2183);
    float _2191 = log2(_2189);
    float _2193 = _2165 * _2175;
    float _2195 = _2185 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2197 = _1312 * _2187;
    float _2199 = -_2187;
    float _2201 = -_2195;
    float _2203 = fma(_2199, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2201);
    float _2205 = fma(_1310, _2185, _2197);
    float _2207 = -_2193;
    float _2209 = fma(_2207, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2203);
    float _2211 = fma(_1314, _2193, _2205);
    float _2213 = precise::clamp(_2211, 0.0, 1.0);
    float _2215 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2217 = _2209 + _2215;
    float _2219 = _2191 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2221 = _2217 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2223 = precise::clamp(_2221, 0.0, 1.0);
    float _2225 = exp2(_2219);
    float _2227 = _2225 * _2223;
    float _2229 = _2213 * _2227;
    float _2231 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2233 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2235 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _2231;
    out.m_95.y = _2233;
    out.m_95.z = _2235;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

