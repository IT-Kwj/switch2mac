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
    texture2d<float> vp_t_tcb_A [[id(6)]];
    sampler vp_t_tcb_ASmplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_ASmplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_71 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_95 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_79 [[user(locn4)]];
    float4 m_83 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
    float4 m_81 [[user(locn12)]];
    float4 m_93 [[user(locn13)]];
    float4 m_91 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_61 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_75 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_67 [[attribute(8)]];
    float4 m_55 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1833 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    float _122 = as_type<float>(_114);
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _120;
    if (!_118)
    {
        out.m_49.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _124 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2067 = as_type<float>(_130);
        out.gl_Position.z = _2067;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_51.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = _148;
    if (_144)
    {
        float _152 = float(_114);
        _122 = _152;
    }
    float _154 = _122;
    bool _156 = _148 >= _154;
    bool _158 = !_144;
    bool _160 = _156 || _158;
    float _162 = _154;
    if (_160)
    {
        _162 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _162;
    if (_160)
    {
        out.m_49.x = 0.0;
    }
    if (_160)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2137 = as_type<float>(_168);
        out.gl_Position.z = _2137;
    }
    if (_160)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _170 = in.m_53.w;
    float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _174 = in.m_55.y;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _178 = _176 != 0;
    int _180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _182 = _180 != 0;
    float _184 = in.m_55.x;
    int _186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _188 = _186 != 0;
    float _190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _192 = in.m_53.z;
    float _194 = in.m_53.y;
    float _196 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _198 = _172 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _200 = in.m_53.x;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _206 = _204 != 0;
    bool _208 = _170 > 0.5;
    float _210 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _212 = _190 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _214 = -_174;
    float _216 = _214 + 1.0;
    int _218 = 0;
    float _220 = _198;
    float _222 = _174;
    float _224 = _184;
    if (_178)
    {
        float _226 = -_184;
        float _228 = _226 + 1.0;
        _218 = as_type<int>(_228);
    }
    int _230 = _218;
    int _232 = _208 ? as_type<int>(_216) : as_type<int>(_174);
    float _234 = 0.0;
    float _236 = as_type<float>(_230);
    if (!_178)
    {
        _234 = _184;
    }
    float _238 = _234;
    bool _240 = _192 > 0.5;
    float _242 = _188 ? as_type<float>(_232) : _174;
    float _244 = _238;
    float _246 = _242;
    if (_178)
    {
        float _248 = _240 ? as_type<float>(_230) : _184;
        _244 = _248;
    }
    float _250 = _244;
    if (!_182)
    {
        _236 = _194;
    }
    float _252 = _236;
    float _254 = fma(_242, _198, -0.5);
    float _256 = _252;
    if (_182)
    {
        _256 = _200;
    }
    float _258 = _256;
    float _260 = fma(_212, _250, -0.5);
    if (!_182)
    {
        _246 = _192;
    }
    float _262 = _246;
    float _264 = _262;
    if (_182)
    {
        _264 = _194;
    }
    float _266 = _264;
    float _268 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[83].z, _196);
    if (!_182)
    {
        _220 = _192;
    }
    float _270 = _220;
    float _272 = _258 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _274 = _270;
    if (_182)
    {
        _274 = _194;
    }
    float _276 = _274;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _280 = _266 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _282 = -_202;
    float _284 = fma(_272, 2.0, _282);
    float _286 = 0.0;
    if (!_206)
    {
        _286 = _184;
    }
    float _288 = _286;
    float _290 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[83].w, _210);
    float _292 = fma(_280, -2.0, _278);
    float _294 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _268);
    float _296 = -_148;
    float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[81].x, _284);
    float _300 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _290);
    float _302 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _292);
    float _304 = fma(_294, _260, _298);
    float _306 = -_302;
    float _308 = fma(_300, _254, _306);
    float _310 = _304 + 0.5;
    float _312 = _308 + 0.5;
    float2 _2389 = float2(_310, _312);
    float _314 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2389, float2(0.0), isnan(_2389)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2389, float2(0.0), isnan(_2389)), level(0.0)).y;
    float _316 = _192 * 2.0;
    float _318 = _200 * 2.0;
    float _320 = _194 * 2.0;
    float _322 = _194 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _324 = floor(_318);
    float _326 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _328 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _332 = _328 || _330;
    bool _334 = isnan(1.0);
    bool _336 = _332 || _334;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _340 = floor(_316);
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _344 = fma(_322, -2.0, _342);
    float _346 = _194 + _200;
    float _348 = floor(_320);
    bool _350 = _324 >= 0.0;
    bool _352 = isnan(_324);
    bool _354 = _350 || _352;
    bool _356 = isnan(0.0);
    bool _358 = _354 || _356;
    float _360 = _346 + (-1.0);
    float _362 = 0.0;
    float _364 = _326;
    float _366 = _288;
    if (!_336)
    {
        float _368 = _326 * _326;
        float _370 = _368 * 0.5;
        _362 = _370;
    }
    float _372 = _362;
    int _374 = _358 ? 0 : 1;
    float _376 = _372;
    if (!_336)
    {
        float _378 = _372 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _376 = _378;
    }
    float _380 = _376;
    bool _382 = _340 > 0.0;
    bool _384 = _340 >= 0.0;
    bool _386 = isnan(_340);
    bool _388 = _384 || _386;
    bool _390 = isnan(0.0);
    bool _392 = _388 || _390;
    float _394 = _200 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _396 = ~_374;
    int _398 = _396 + 1;
    int _400 = _398 + 1;
    int _402 = _392 ? 0 : 1;
    float _404 = -_338;
    float _406 = fma(_394, 2.0, _404);
    bool _408 = _324 > 0.0;
    int _410 = ~_402;
    int _412 = _410 + 1;
    int _414 = _412 + 1;
    bool _416 = _348 >= 0.0;
    bool _418 = isnan(_348);
    bool _420 = _416 || _418;
    bool _422 = isnan(0.0);
    bool _424 = _420 || _422;
    int _426 = _414;
    int _428 = _400;
    float _430 = _380;
    if (!_382)
    {
        int _432 = ~_402;
        int _434 = _432 + 1;
        _426 = _434;
    }
    int _436 = _426;
    float _438 = _194 + _192;
    bool _440 = _348 > 0.0;
    float _442 = _438 + (-1.0);
    float _444 = _442;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    if (!_408)
    {
        int _448 = ~_374;
        int _450 = _448 + 1;
        _428 = _450;
    }
    int _452 = _428;
    float _454 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _456 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _458 = !_336;
    if (!_458)
    {
        float _460 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _462 = log2(_460);
        float _464 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _466 = _464 + 1.0;
        float _468 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _470 = _326 * _462;
        float _472 = 1.0 / _466;
        float _474 = _468 * 0.693147182464599609375;
        float _476 = exp2(_470);
        float _478 = 1.0 / _474;
        float _480 = _476 + (-1.0);
        float _482 = -_480;
        float _484 = fma(_482, _478, _326);
        float _486 = _484 * _472;
        float _488 = _486 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _444 = _474;
        _446 = _476;
        _430 = _488;
    }
    float _490 = _444;
    float _492 = _446;
    float _494 = _430;
    bool _496 = !_336;
    float _498 = _490;
    float _500 = _492;
    if (!_496)
    {
        float _502 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _504 = log2(_502);
        float _506 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _508 = _506 + 1.0;
        float _510 = 1.0 / _508;
        float _512 = _326 * _504;
        float _514 = exp2(_512);
        float _516 = -_514;
        float _518 = _516 + 1.0;
        float _520 = _518 * _510;
        _498 = _514;
        _364 = _520;
    }
    float _522 = _498;
    float _524 = _364;
    int _526 = _424 ? 0 : 1;
    float _528 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _530 = log2(_528);
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _534 = _532 != 0;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _542 = _540 != 0;
    float _544 = -_148;
    float _546 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[76].x, _406);
    float _548 = _522;
    if (_182)
    {
        _548 = _194;
    }
    float _550 = _548;
    float _552 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _344);
    float _554 = in.m_57.y;
    bool _556 = !_538;
    int _558 = _556 ? 0 : 1;
    float _560 = _550;
    if (!_182)
    {
        _560 = _200;
    }
    float _562 = _560;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_182)
    {
        _500 = _200;
    }
    float _566 = _500;
    float _568 = in.m_59.x;
    bool _570 = !_534;
    int _572 = _570 ? 0 : 1;
    float _574 = in.m_59.z;
    float _576 = _566;
    if (!_182)
    {
        _576 = _192;
    }
    float _578 = _576;
    int _580 = abs(_558);
    float _582 = _562 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _584 = abs(_572);
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _588 = _578 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _590 = fma(_582, -2.0, _564);
    float _592 = float(_436);
    float _594 = _530 * _148;
    float _596 = float(_452);
    float _598 = -_586;
    float _600 = fma(_588, 2.0, _598);
    float _602 = float(_584);
    float _604 = in.m_61.x;
    float _606 = in.m_61.y;
    float _608 = in.m_61.z;
    float _610 = float(_580);
    float _612 = exp2(_594);
    float _614 = _602 * _592;
    float _616 = _610 * _596;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _622 = 1.0 + _620;
    int _624 = ~_526;
    int _626 = _624 + 1;
    int _628 = _626 + 1;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _634 = 1.0 / _622;
    float _636 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[78].z, _630);
    int _638 = _628;
    if (!_440)
    {
        int _640 = ~_526;
        int _642 = _640 + 1;
        _638 = _642;
    }
    int _644 = _638;
    float _646 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[78].w, _632);
    bool _648 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _650 = isnan(1.0);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _656 = _652 || _654;
    float _658 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[88].z, _618);
    float _660 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _636);
    bool _662 = !_542;
    int _664 = _662 ? 0 : 1;
    float _666 = -_612;
    float _668 = _666 + 1.0;
    bool _670 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _672 = isnan(0.0);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _678 = _674 || _676;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _682 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _658);
    float _684 = _614 * (-2.0);
    int _686 = abs(_664);
    float _688 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[88].w, _680);
    float _690 = _678 ? _668 : 0.0;
    float _692 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _590);
    float _694 = _200 + (-0.5);
    float _696 = fma(_684, _604, _604);
    float _698 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _646);
    float _700 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _688);
    float _702 = -_148;
    float _704 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[86].x, _600);
    float _706 = float(_644);
    float _708 = _692;
    if (_656)
    {
        float _710 = _690 * _634;
        _150 = _710;
    }
    float _712 = _150;
    float _714 = float(_686);
    float _716 = _616 * (-2.0);
    float _718 = fma(_456, _684, _456);
    float _720 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[196].x, _696);
    float _722 = _714 * _706;
    float _724 = fma(_454, _716, _454);
    float _726 = fma(_718, _712, _720);
    float _728 = in.m_51.x;
    float _730 = in.m_51.y;
    float _732 = in.m_51.z;
    float _734 = fma(_716, _606, _606);
    float _736 = _722 * (-2.0);
    float _738 = _726 * 0.15915493667125701904296875;
    float _740 = _200 + _192;
    float _742 = in.m_63.w;
    float _744 = _194 + (-0.5);
    float _746 = fma(_736, _608, _608);
    float _748 = _740 + (-1.0);
    float _750 = in.m_46.x;
    float _752 = in.m_46.y;
    float _754 = in.m_46.z;
    float _756 = _192 + (-0.5);
    float _758 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[196].y, _734);
    float _760 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _762 = _738 * 6.283185482025146484375;
    float _764 = sin(_762);
    float _766 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[196].z, _746);
    float _768 = fma(_724, _712, _758);
    float _770 = fma(_760, _736, _760);
    float _772 = _494 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _774 = _768 * 0.15915493667125701904296875;
    float _776 = fma(_770, _712, _766);
    float _778 = _494 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _780 = _494 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _782 = _738 * 6.283185482025146484375;
    float _784 = cos(_782);
    float _786 = fma(_524, _730, _772);
    float _788 = fma(_524, _728, _778);
    float _790 = fma(_524, _732, _780);
    float _792 = _776 * 0.15915493667125701904296875;
    float _794 = in.m_59.y;
    float _796 = _774 * 6.283185482025146484375;
    float _798 = sin(_796);
    float _800 = fma(_788, _742, _750);
    float _802 = fma(_786, _742, _752);
    float _804 = fma(_790, _742, _754);
    float _806 = in.m_63.x;
    float _808 = in.m_63.y;
    float _810 = in.m_63.z;
    float _812 = _802 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _814 = _774 * 6.283185482025146484375;
    float _816 = cos(_814);
    float _818 = _802 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _820 = _802 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _822 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[4].x, _812);
    float _824 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[5].x, _818);
    float _826 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[6].x, _820);
    float _828 = fma(_804, (*spvDescriptorSet0.vp_c10)._m0[4].z, _822);
    float _830 = _792 * 6.283185482025146484375;
    float _832 = sin(_830);
    float _834 = fma(_804, (*spvDescriptorSet0.vp_c10)._m0[5].z, _824);
    float _836 = fma(_804, (*spvDescriptorSet0.vp_c10)._m0[6].z, _826);
    float _838 = _784 * _798;
    float _840 = _836 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _842 = _792 * 6.283185482025146484375;
    float _844 = cos(_842);
    float _846 = _784 * _816;
    float _848 = _764 * _816;
    float _850 = _808 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _852 = _806 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _854 = _810 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _856 = _764 * _798;
    float _858 = -_838;
    float _860 = fma(_832, _848, _858);
    float _862 = -_848;
    float _864 = fma(_832, _838, _862);
    float _866 = _854 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _868 = fma(_832, _846, _856);
    float _870 = fma(_832, _856, _846);
    float _872 = _554 * 0.00999999977648258209228515625;
    float _874 = _784 * _844;
    float _876 = _816 * _844;
    float _878 = _764 * _844;
    float _880 = _798 * _844;
    float _882 = fma(_314, _872, _794);
    float _884 = _850 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _886 = _852 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _888 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _882);
    float _890 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _568);
    float _892 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _574);
    float _894 = _888 * _884;
    float _896 = _890 * _886;
    float _898 = _892 * _866;
    float _900 = _874 * _894;
    float _902 = -_894;
    float _904 = _832 * _902;
    float _906 = _878 * _894;
    float _908 = fma(_868, _896, _900);
    float _910 = fma(_876, _896, _904);
    float _912 = fma(_860, _896, _906);
    float _914 = _828 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _916 = fma(_864, _898, _908);
    float _918 = fma(_880, _898, _910);
    float _920 = fma(_870, _898, _912);
    float _922 = _834 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _924 = _916 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _926 = _916 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _928 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[10].x, _924);
    float _930 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[8].x, _926);
    float _932 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[10].z, _928);
    float _934 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[8].z, _930);
    float _936 = _932 + _840;
    float _938 = _934 + _914;
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _942 = _936 + _940;
    float _944 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _946 = _938 + _944;
    float _948 = _942 * _942;
    float _950 = fma(_946, _946, _948);
    float _952 = _916 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _954 = sqrt(_950);
    float _956 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[9].x, _952);
    float _958 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[9].z, _956);
    float _960 = _958 + _922;
    bool _962 = _954 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _964 = _918;
    float _966 = _936;
    float _968 = _938;
    float _970 = _950;
    if (!_962)
    {
        _964 = _936;
    }
    float _972 = _964;
    float _974 = _972;
    if (!_962)
    {
        _966 = _960;
    }
    float _976 = _966;
    bool _978 = !_962;
    float _980 = _976;
    if (!_978)
    {
        float _982 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _984 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _986 = _954 + _984;
        float _988 = rsqrt(_950);
        float _990 = _986 * _982;
        float _992 = _960 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _994 = _990 * 0.15915493667125701904296875;
        float _996 = _994 * 6.283185482025146484375;
        float _998 = cos(_996);
        float _1000 = _994 * 6.283185482025146484375;
        float _1002 = sin(_1000);
        float _1004 = _998 + (-1.0);
        float _1006 = fma(_1002, _992, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1008 = _1004 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1010 = _988 * _1006;
        float _1012 = fma(_960, _998, _1008);
        float _1014 = fma(_946, _1010, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1016 = fma(_942, _1010, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _980 = _1012;
        _968 = _1014;
        _974 = _1016;
    }
    float _1018 = _980;
    float _1020 = _968;
    float _1022 = _974;
    float _1024 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1026 = _1018 + _1024;
    float _1028 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1030 = _1020 + _1028;
    float _1032 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1034 = _1022 + _1032;
    float _1036 = _1026 * _1026;
    float _1038 = fma(_1030, _1030, _1036);
    float _1040 = fma(_1034, _1034, _1038);
    float _1042 = rsqrt(_1040);
    float _1044 = sqrt(_1040);
    float _1046 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1048 = _1030 * _1046;
    float _1050 = _1034 * _1046;
    float _1052 = _1048 * _1048;
    float _1054 = _1050 * _1050;
    float _1056 = _1052 + _1054;
    float _1058 = sqrt(_1056);
    bool _1060 = _1058 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1064 = _1058 + _1062;
    float _1066 = _916;
    float _1068 = _1056;
    float _1070 = _1064;
    float _1072 = _1026;
    float _1074 = _1048;
    float _1076 = _1050;
    float _1078 = _1052;
    float _1080 = _1054;
    bool _1082 = _1060;
    if (_1060)
    {
        float _1084 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1066 = _1084;
    }
    float _1086 = _1066;
    if (_1060)
    {
        float _1088 = rsqrt(_1056);
        _1068 = _1088;
    }
    float _1090 = _1068;
    if (_1060)
    {
        float _1092 = _1064 * _1086;
        _1070 = _1092;
    }
    float _1094 = _1070;
    if (_1060)
    {
        float _1096 = _1094 * 0.15915493667125701904296875;
        _970 = _1096;
    }
    float _1098 = _970;
    float _1100 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1102 = _960;
    if (_1060)
    {
        float _1104 = _1098 * 6.283185482025146484375;
        float _1106 = sin(_1104);
        _1102 = _1106;
    }
    float _1108 = _1102;
    float _1110 = precise::max(0.0, _1100);
    float _1112 = -_1046;
    float _1114 = -_1110;
    float _1116 = fma(_1026, _1112, _1114);
    float _1118 = _1086;
    float _1120 = _1110;
    if (_1060)
    {
        float _1122 = _1098 * 6.283185482025146484375;
        float _1124 = cos(_1122);
        _1118 = _1124;
    }
    float _1126 = _1118;
    if (_1060)
    {
        float _1128 = _1116 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1072 = _1128;
    }
    float _1130 = _1072;
    float _1132 = _1108;
    float _1134 = _1130;
    if (_1060)
    {
        float _1136 = fma(_1108, _1130, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1132 = _1136;
    }
    float _1138 = _1132;
    if (!_1060)
    {
        _1134 = _1116;
    }
    float _1140 = _1134;
    float _1142 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1144 = 0.0;
    float _1146 = _1140;
    if (_1060)
    {
        float _1148 = _1090 * _1138;
        _1144 = _1148;
    }
    float _1150 = _1144;
    if (_1060)
    {
        float _1152 = _1126 + (-1.0);
        _1120 = _1152;
    }
    float _1154 = _1120;
    float _1156 = _1154;
    if (_1060)
    {
        float _1158 = _1048 * _1150;
        _1074 = _1158;
    }
    float _1160 = _1074;
    if (_1060)
    {
        float _1162 = _1050 * _1150;
        _1076 = _1162;
    }
    float _1164 = _1076;
    float _1166 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1168 = fma(_1044, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1166);
    float _1170 = precise::clamp(_1168, 0.0, 1.0);
    if (_1060)
    {
        float _1172 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1156 = _1172;
    }
    float _1174 = _1156;
    if (_1060)
    {
        float _1176 = _1160 * _1160;
        _1078 = _1176;
    }
    float _1178 = _1078;
    if (_1060)
    {
        float _1180 = _1164 * _1164;
        _1080 = _1180;
    }
    float _1182 = _1080;
    float _1184 = -_1170;
    float _1186 = _1184 + 1.0;
    if (_1060)
    {
        float _1188 = fma(_1116, _1126, _1174);
        _1146 = _1188;
    }
    float _1190 = _1146;
    float _1192 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1194 = fma(_1190, _1190, _1178);
    float _1196 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1198 = abs(_1186);
    float _1200 = log2(_1198);
    float _1202 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1192);
    float _1204 = _1194 + _1182;
    float _1206 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1196);
    float _1208 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1210 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1202);
    float _1212 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1206);
    float _1214 = rsqrt(_1204);
    float _1216 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1218 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1208);
    float _1220 = _1212 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1222 = _1210 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1224 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1216);
    float _1226 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1218);
    float _1228 = _1220 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1230 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1224);
    float _1232 = _1226 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1234 = -_1228;
    float _1236 = fma(_1234, _1142, 1.0);
    float _1238 = _1200 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1240 = _1230 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1242 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1244 = _1214 * _1160;
    float _1246 = _1214 * _1190;
    float _1248 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1242);
    float _1250 = _1214 * _1164;
    float _1252 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1254 = log2(_1236);
    float _1256 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1248);
    float _1258 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1260 = -_1252;
    float _1262 = fma(_1246, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1260);
    float _1264 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1256);
    float _1266 = -_1250;
    float _1268 = fma(_1266, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1262);
    float _1270 = exp2(_1238);
    float _1272 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1274 = fma(_1268, -0.5, 0.5);
    float _1276 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1272);
    float _1278 = fma(_1268, 0.5, 0.5);
    float _1280 = 1.0 / _1264;
    float _1282 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1258);
    float _1284 = _1246 + 1.0;
    float _1286 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1276);
    float _1288 = fma(_1278, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1290 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1282);
    float _1292 = _1254 * 0.693147182464599609375;
    float _1294 = sqrt(_1274);
    float _1296 = -_1246;
    float _1298 = fma(_1270, _1284, _1296);
    float _1300 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1286);
    float _1302 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1290);
    float _1304 = fma(_1278, _1288, -0.212114393711090087890625);
    float _1306 = _1292 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1308 = fma(_1298, 0.5, 0.5);
    float _1310 = _1300 * _1280;
    float _1312 = _1302 * _1280;
    float _1314 = fma(_1278, _1304, 1.570728778839111328125);
    float _1316 = fma(_1310, 0.5, 0.5);
    float _1318 = fma(_1312, -0.5, 0.5);
    float _1320 = _1294 * 0.636619746685028076171875;
    float3 _3974 = float3(_1316, _1318, _1306);
    float _1322 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3974, float3(0.0), isnan(_3974)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3974, float3(0.0), isnan(_3974)), level(0.0)).x;
    float _1324 = -_1314;
    float _1326 = fma(_1320, _1324, 1.0);
    float3 _3990 = float3(_1316, _1318, _1306);
    float4 _1329 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3990, float3(0.0), isnan(_3990)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3990, float3(0.0), isnan(_3990)), level(0.0)).xyzw;
    float _1331 = _1329.x;
    float _1333 = _1329.y;
    float _1335 = _1329.z;
    float _1337 = _1329.w;
    float2 _4006 = float2(_1326, _1308);
    float3 _1341 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4006, float2(0.0), isnan(_4006)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4006, float2(0.0), isnan(_4006)), level(0.0)).xyz;
    float _1343 = _1341.x;
    float _1345 = _1341.y;
    float _1347 = _1341.z;
    bool _1349 = _194 > 0.5;
    float _1351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1353 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1355 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _1353;
    int _1357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1359 = _1357 != 0;
    float _1361 = _1200 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1363 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1365 = _1363 != 0;
    float _1367 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1369 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _1367;
    int _1371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1373 = _1371 != 0;
    float _1375 = _1355 * _1355;
    float _1377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_206)
    {
        bool _1379 = _200 > 0.5;
        _1082 = _1379;
    }
    bool _1381 = _1082;
    float _1383 = fma(_1369, _1369, _1375);
    int _1385 = _1349 ? as_type<int>(_216) : as_type<int>(_174);
    float _1387 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1389 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _1387;
    float _1391 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1393 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1395 = _1373 ? as_type<float>(_1385) : _174;
    float _1397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1399 = fma(_1389, _1389, _1383);
    int _1401 = as_type<int>(_1351);
    if (_1359)
    {
        float _1403 = _240 ? _216 : _174;
        _222 = _1403;
    }
    float _1405 = _222;
    if (_206)
    {
        float _1407 = -_184;
        float _1409 = _1407 + 1.0;
        _1401 = as_type<int>(_1409);
    }
    int _1411 = _1401;
    int _1413 = 0;
    if (_1365)
    {
        float _1415 = -_184;
        float _1417 = _1415 + 1.0;
        _1413 = as_type<int>(_1417);
    }
    int _1419 = _1413;
    float _1421 = fma(_1393, _1395, -0.5);
    float _1423 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1391);
    float _1425 = in.m_57.w;
    float _1427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_206)
    {
        float _1429 = _1381 ? as_type<float>(_1411) : _184;
        _366 = _1429;
    }
    float _1431 = _366;
    float _1433 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1365)
    {
        float _1435 = _1349 ? as_type<float>(_1419) : _184;
        _224 = _1435;
    }
    float _1437 = _224;
    float _1439 = -_552;
    float _1441 = fma(_698, _1421, _1439);
    bool _1443 = _882 != 0.0;
    bool _1445 = isnan(_882);
    bool _1447 = _1443 || _1445;
    bool _1449 = isnan(0.0);
    bool _1451 = _1447 || _1449;
    float _1453 = fma(_1433, _1431, -0.5);
    float _1455 = in.m_57.z;
    float _1457 = sqrt(_1399);
    float _1459 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1461 = fma(_660, _1453, _546);
    float _1463 = _1441 + 0.5;
    float _1465 = fma(_1459, _1405, -0.5);
    bool _1467 = _568 == 0.0;
    bool _1469 = !_1451;
    bool _1471 = _1467 && _1469;
    float _1473 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1423);
    float _1475 = rsqrt(_1399);
    float _1477 = _1427 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1479 = -_692;
    float _1481 = fma(_700, _1465, _1479);
    bool _1483 = _574 == 0.0;
    bool _1485 = _1483 && _1471;
    float _1487 = fma(_1477, _1437, -0.5);
    float _1489 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1473);
    out.m_65.y = _554;
    float _1491 = precise::max(0.0, _1457);
    float _1493 = fma(_682, _1487, _704);
    float _1495 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1497 = in.m_67.x;
    float _1499 = in.m_67.y;
    float _1501 = in.m_67.z;
    float _1503 = in.m_67.w;
    float _1505 = precise::min(_1491, 1000.0);
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1509 = _1493 + 0.5;
    out.m_69.w = _1495;
    float _1511 = _1475 * 100.0;
    float _1513 = _1505 * 0.001000000047497451305389404296875;
    float _1515 = _1461 + 0.5;
    out.m_71.w = _1507;
    float _1517 = exp2(_1361);
    float _1519 = _1513 * _1511;
    out.m_73.x = _1515;
    out.m_73.y = _1463;
    out.m_73.z = _310;
    out.m_73.w = _312;
    float _1521 = _1481 + 0.5;
    float _1523 = -_1519;
    float _1525 = fma(_1369, _1523, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1527 = -_1519;
    float _1529 = fma(_1389, _1527, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1531 = in.m_75.x;
    float _1533 = in.m_75.y;
    float _1535 = in.m_75.z;
    out.m_77.x = _1509;
    out.m_77.y = _1521;
    float _1537 = _874 * _1499;
    float _1539 = -_1499;
    float _1541 = _832 * _1539;
    float _1543 = _878 * _1499;
    float _1545 = -_1517;
    float _1547 = _1545 + 1.0;
    float _1549 = fma(_868, _1497, _1537);
    float _1551 = fma(_876, _1497, _1541);
    float _1553 = fma(_860, _1497, _1543);
    float _1555 = _1547 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1557 = fma(_864, _1501, _1549);
    float _1559 = fma(_880, _1501, _1551);
    float _1561 = fma(_870, _1501, _1553);
    out.m_65.z = _1455;
    float _1563 = _1557 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1565 = _1557 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1567 = _1557 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_65.w = _1425;
    float _1569 = _1509;
    float _1571 = _1521;
    float _1573 = _1559;
    float _1575 = _1531;
    if (_1485)
    {
        _708 = _1531;
    }
    float _1577 = _708;
    float _1579 = fma(_1559, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1563);
    float _1581 = fma(_1559, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1565);
    float _1583 = fma(_1559, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1567);
    float _1585 = _1577;
    float _1587 = _1579;
    if (_1485)
    {
        _1569 = _1533;
    }
    float _1589 = _1569;
    float _1591 = fma(_1561, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1579);
    float _1593 = _1589;
    if (_1485)
    {
        _1571 = _1535;
    }
    float _1595 = _1571;
    float _1597 = fma(_1561, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1581);
    float _1599 = _1595;
    if (_1485)
    {
        _1573 = _1577;
    }
    float _1601 = _1573;
    float _1603 = fma(_1561, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1583);
    float _1605 = _1601;
    if (!_1485)
    {
        _1585 = _1531;
    }
    float _1607 = _1585;
    out.m_79.x = _1525;
    if (_1485)
    {
        _1587 = _1589;
    }
    float _1609 = _1587;
    float _1611 = _1609;
    if (_1485)
    {
        _1575 = _1595;
    }
    float _1613 = _1575;
    float _1615 = _1501 * _1607;
    float _1617 = _1613;
    if (!_1485)
    {
        _1593 = _1533;
    }
    float _1619 = _1593;
    out.m_81.x = _1591;
    out.m_81.y = _1597;
    out.m_81.z = _1603;
    if (!_1485)
    {
        _1599 = _1535;
    }
    float _1621 = _1599;
    if (!_1485)
    {
        float _1623 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1607);
        _1605 = _1623;
    }
    float _1625 = _1605;
    float _1627 = _1497 * _1619;
    if (!_1485)
    {
        float _1629 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1619);
        _1611 = _1629;
    }
    float _1631 = _1611;
    float _1633 = _1499 * _1621;
    float _1635 = -_1615;
    float _1637 = fma(_1497, _1621, _1635);
    float _1639 = -_1627;
    float _1641 = fma(_1499, _1607, _1639);
    if (!_1485)
    {
        float _1643 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1621);
        _1617 = _1643;
    }
    float _1645 = _1617;
    float _1647 = -_1633;
    float _1649 = fma(_1501, _1619, _1647);
    float _1651 = _1637 * _1503;
    float _1653 = _874 * _1631;
    float _1655 = _1641 * _1503;
    float _1657 = _1649 * _1503;
    float _1659 = _874 * _1651;
    float _1661 = -_1631;
    float _1663 = _832 * _1661;
    float _1665 = _878 * _1631;
    float _1667 = fma(_868, _1625, _1653);
    float _1669 = -_1651;
    float _1671 = _832 * _1669;
    float _1673 = fma(_868, _1657, _1659);
    float _1675 = _878 * _1651;
    float _1677 = fma(_876, _1625, _1663);
    float _1679 = fma(_860, _1625, _1665);
    float _1681 = fma(_876, _1657, _1671);
    float _1683 = fma(_864, _1655, _1673);
    float _1685 = fma(_860, _1657, _1675);
    float _1687 = fma(_864, _1645, _1667);
    float _1689 = fma(_880, _1655, _1681);
    float _1691 = _1683 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1693 = _1683 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1695 = fma(_870, _1655, _1685);
    float _1697 = fma(_880, _1645, _1677);
    float _1699 = fma(_1689, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1691);
    float _1701 = fma(_870, _1645, _1679);
    float _1703 = fma(_1689, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1693);
    float _1705 = _1687 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1707 = _1687 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1709 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1699);
    float _1711 = _1687 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1713 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1703);
    float _1715 = _1683 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1717 = fma(_1697, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1705);
    float _1719 = _1489 + _1264;
    float _1721 = fma(_1697, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1707);
    float _1723 = fma(_1697, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1711);
    float _1725 = fma(_1689, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1715);
    float _1727 = _1719 * 0.5;
    float _1729 = fma(_1701, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1723);
    float _1731 = -_1555;
    float _1733 = _1731 + 1.0;
    float _1735 = fma(_1701, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1717);
    float _1737 = fma(_1701, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1721);
    out.m_83.z = _1727;
    out.m_83.w = _1264;
    bool _1739 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1741 = isnan(_1044);
    bool _1743 = _1739 || _1741;
    bool _1745 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1747 = _1743 || _1745;
    float _1749 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1725);
    out.m_79.z = _1529;
    out.gl_Position.x = _1300;
    out.gl_Position.y = _1302;
    out.gl_Position.z = _1489;
    out.gl_Position.w = _1264;
    out.m_85.x = _1735;
    out.m_85.y = _1737;
    out.m_85.z = _1729;
    out.m_87.x = _1020;
    out.m_87.y = _1018;
    out.m_87.z = _1022;
    out.m_89.x = _1709;
    out.m_89.y = _1713;
    out.m_89.z = _1749;
    float _1751 = _1749;
    float _1753 = _1713;
    float _1755 = _1709;
    if (!_1747)
    {
        _1751 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1757 = _1751;
    float _1759 = _1757;
    float _1761 = _1757;
    if (!_1747)
    {
        _1753 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1763 = _1753;
    float _1765 = _1763;
    float _1767 = _1763;
    if (!_1747)
    {
        _1755 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1769 = _1755;
    float _1771 = _1555 * _1322;
    float _1773 = _1337 * _1771;
    float _1775 = _1337 * _1733;
    float _1777 = _1347 * _1771;
    float _1779 = fma(_1343, _1773, _1331);
    float _1781 = fma(_1345, _1773, _1333);
    float _1783 = fma(_1337, _1777, _1335);
    out.m_91.x = _1779;
    out.m_91.y = _1781;
    out.m_91.z = _1783;
    out.m_91.w = _1775;
    bool _1785 = !_1747;
    float _1787 = _1769;
    float _1789 = _1769;
    if (!_1785)
    {
        bool _1791 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1793 = isnan(_1044);
        bool _1795 = _1791 || _1793;
        bool _1797 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1799 = _1795 || _1797;
        if (!_1799)
        {
            float _1801 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1803 = _1044 + _1801;
            float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1807 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1805;
            float _1809 = 1.0 / _1807;
            float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1813 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1815 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1817 = _1815 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1819 = _1803 * _1809;
            float _1821 = precise::clamp(_1819, 0.0, 1.0);
            float _1823 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1825 = _1823 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1827 = fma(_1821, _1817, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1829 = fma(_1821, _1825, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1831 = fma(_1821, _1813, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1767 = _1831;
            _1761 = _1829;
            _1789 = _1827;
            _1833 = true;
        }
        else
        {
            bool _1835 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1837 = isnan(_1044);
            bool _1839 = _1835 || _1837;
            bool _1841 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1843 = _1839 || _1841;
            if (!_1843)
            {
                _1759 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1845 = _1759;
            _1761 = _1845;
            if (!_1843)
            {
                _1765 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1847 = _1765;
            _1767 = _1847;
            if (!_1843)
            {
                _1787 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1849 = _1787;
            bool _1851 = !_1843;
            _1789 = _1849;
            if (!_1851)
            {
                bool _1853 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1855 = isnan(_1044);
                bool _1857 = _1853 || _1855;
                bool _1859 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1861 = _1857 || _1859;
                if (!_1861)
                {
                    float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1865 = _1044 + _1863;
                    float _1867 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1869 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1867;
                    float _1871 = 1.0 / _1869;
                    float _1873 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1875 = _1873 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1877 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1879 = _1877 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1881 = _1865 * _1871;
                    float _1883 = precise::clamp(_1881, 0.0, 1.0);
                    float _1885 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1887 = _1885 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1889 = fma(_1883, _1879, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1891 = fma(_1883, _1887, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1893 = fma(_1883, _1875, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1767 = _1893;
                    _1761 = _1891;
                    _1789 = _1889;
                    _1833 = true;
                }
                else
                {
                    _1767 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1761 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1789 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1833 = false;
    float _1895 = _1767;
    float _1897 = _1761;
    float _1899 = _1789;
    float _1901 = _1895 * 0.586610972881317138671875;
    bool _1903 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_93.x = 0.0;
    float _1905 = fma(_1897, 0.298911988735198974609375, _1901);
    float _1907 = fma(_1899, 0.114477999508380889892578125, _1905);
    float _1909 = -_1907;
    float _1911 = _1909 + _1897;
    float _1913 = -_1907;
    float _1915 = _1913 + _1895;
    float _1917 = -_1907;
    float _1919 = _1917 + _1899;
    float _1921 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1923 = fma(_1911, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1907);
    float _1925 = fma(_1915, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1907);
    float _1927 = fma(_1919, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1907);
    out.m_49.x = _1921;
    out.m_95.x = _1923;
    out.m_95.y = _1925;
    out.m_95.z = _1927;
    if (!_1903)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1929 = -_1018;
    float _1931 = _1929 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1933 = -_1020;
    float _1935 = _1933 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1937 = -_1022;
    float _1939 = _1937 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1941 = _1931 * _1931;
    float _1943 = fma(_1935, _1935, _1941);
    float _1945 = fma(_1939, _1939, _1943);
    float _1947 = sqrt(_1945);
    float _1949 = rsqrt(_1945);
    float _1951 = -_1947;
    float _1953 = _1951 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1955 = _1953 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1957 = precise::clamp(_1955, 0.0, 1.0);
    float _1959 = _1935 * _1949;
    float _1961 = _1931 * _1949;
    float _1963 = abs(_1957);
    float _1965 = log2(_1963);
    float _1967 = _1939 * _1949;
    float _1969 = _1959 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1971 = _1737 * _1961;
    float _1973 = -_1961;
    float _1975 = -_1969;
    float _1977 = fma(_1973, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1975);
    float _1979 = fma(_1735, _1959, _1971);
    float _1981 = -_1967;
    float _1983 = fma(_1981, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1977);
    float _1985 = fma(_1729, _1967, _1979);
    float _1987 = precise::clamp(_1985, 0.0, 1.0);
    float _1989 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1991 = _1983 + _1989;
    float _1993 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1995 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1997 = precise::clamp(_1995, 0.0, 1.0);
    float _1999 = exp2(_1993);
    float _2001 = _1999 * _1997;
    float _2003 = _1987 * _2001;
    float _2005 = _2003 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2007 = _2003 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2009 = _2003 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2005;
    out.m_93.y = _2007;
    out.m_93.z = _2009;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1833 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    float _122 = as_type<float>(_114);
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _120;
    if (!_118)
    {
        out.m_49.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _124 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2067 = as_type<float>(_130);
        out.gl_Position.z = _2067;
    }
    if (!_118)
    {
        return out;
    }
    float _134 = in.m_51.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = _148;
    if (_144)
    {
        float _152 = float(_114);
        _122 = _152;
    }
    float _154 = _122;
    bool _156 = _148 >= _154;
    bool _158 = !_144;
    bool _160 = _156 || _158;
    float _162 = _154;
    if (_160)
    {
        _162 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _162;
    if (_160)
    {
        out.m_49.x = 0.0;
    }
    if (_160)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2137 = as_type<float>(_168);
        out.gl_Position.z = _2137;
    }
    if (_160)
    {
        return out;
    }
    float _170 = in.m_53.w;
    float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _174 = in.m_55.y;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _178 = _176 != 0;
    int _180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _182 = _180 != 0;
    float _184 = in.m_55.x;
    int _186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _188 = _186 != 0;
    float _190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _192 = in.m_53.z;
    float _194 = in.m_53.y;
    float _196 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _198 = _172 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _200 = in.m_53.x;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _206 = _204 != 0;
    bool _208 = _170 > 0.5;
    float _210 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _212 = _190 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _214 = -_174;
    float _216 = _214 + 1.0;
    int _218 = 0;
    float _220 = _198;
    float _222 = _174;
    float _224 = _184;
    if (_178)
    {
        float _226 = -_184;
        float _228 = _226 + 1.0;
        _218 = as_type<int>(_228);
    }
    int _230 = _218;
    int _232 = _208 ? as_type<int>(_216) : as_type<int>(_174);
    float _234 = 0.0;
    float _236 = as_type<float>(_230);
    if (!_178)
    {
        _234 = _184;
    }
    float _238 = _234;
    bool _240 = _192 > 0.5;
    float _242 = _188 ? as_type<float>(_232) : _174;
    float _244 = _238;
    float _246 = _242;
    if (_178)
    {
        float _248 = _240 ? as_type<float>(_230) : _184;
        _244 = _248;
    }
    float _250 = _244;
    if (!_182)
    {
        _236 = _194;
    }
    float _252 = _236;
    float _254 = fma(_242, _198, -0.5);
    float _256 = _252;
    if (_182)
    {
        _256 = _200;
    }
    float _258 = _256;
    float _260 = fma(_212, _250, -0.5);
    if (!_182)
    {
        _246 = _192;
    }
    float _262 = _246;
    float _264 = _262;
    if (_182)
    {
        _264 = _194;
    }
    float _266 = _264;
    float _268 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[83].z, _196);
    if (!_182)
    {
        _220 = _192;
    }
    float _270 = _220;
    float _272 = _258 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _274 = _270;
    if (_182)
    {
        _274 = _194;
    }
    float _276 = _274;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _280 = _266 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _282 = -_202;
    float _284 = fma(_272, 2.0, _282);
    float _286 = 0.0;
    if (!_206)
    {
        _286 = _184;
    }
    float _288 = _286;
    float _290 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[83].w, _210);
    float _292 = fma(_280, -2.0, _278);
    float _294 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _268);
    float _296 = -_148;
    float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[81].x, _284);
    float _300 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _290);
    float _302 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _292);
    float _304 = fma(_294, _260, _298);
    float _306 = -_302;
    float _308 = fma(_300, _254, _306);
    float _310 = _304 + 0.5;
    float _312 = _308 + 0.5;
    float2 _2389 = float2(_310, _312);
    float _314 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2389, float2(0.0), isnan(_2389)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2389, float2(0.0), isnan(_2389)), level(0.0)).y;
    float _316 = _192 * 2.0;
    float _318 = _200 * 2.0;
    float _320 = _194 * 2.0;
    float _322 = _194 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _324 = floor(_318);
    float _326 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _328 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _332 = _328 || _330;
    bool _334 = isnan(1.0);
    bool _336 = _332 || _334;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _340 = floor(_316);
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _344 = fma(_322, -2.0, _342);
    float _346 = _194 + _200;
    float _348 = floor(_320);
    bool _350 = _324 >= 0.0;
    bool _352 = isnan(_324);
    bool _354 = _350 || _352;
    bool _356 = isnan(0.0);
    bool _358 = _354 || _356;
    float _360 = _346 + (-1.0);
    float _362 = 0.0;
    float _364 = _326;
    float _366 = _288;
    if (!_336)
    {
        float _368 = _326 * _326;
        float _370 = _368 * 0.5;
        _362 = _370;
    }
    float _372 = _362;
    int _374 = _358 ? 0 : 1;
    float _376 = _372;
    if (!_336)
    {
        float _378 = _372 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _376 = _378;
    }
    float _380 = _376;
    bool _382 = _340 > 0.0;
    bool _384 = _340 >= 0.0;
    bool _386 = isnan(_340);
    bool _388 = _384 || _386;
    bool _390 = isnan(0.0);
    bool _392 = _388 || _390;
    float _394 = _200 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _396 = ~_374;
    int _398 = _396 + 1;
    int _400 = _398 + 1;
    int _402 = _392 ? 0 : 1;
    float _404 = -_338;
    float _406 = fma(_394, 2.0, _404);
    bool _408 = _324 > 0.0;
    int _410 = ~_402;
    int _412 = _410 + 1;
    int _414 = _412 + 1;
    bool _416 = _348 >= 0.0;
    bool _418 = isnan(_348);
    bool _420 = _416 || _418;
    bool _422 = isnan(0.0);
    bool _424 = _420 || _422;
    int _426 = _414;
    int _428 = _400;
    float _430 = _380;
    if (!_382)
    {
        int _432 = ~_402;
        int _434 = _432 + 1;
        _426 = _434;
    }
    int _436 = _426;
    float _438 = _194 + _192;
    bool _440 = _348 > 0.0;
    float _442 = _438 + (-1.0);
    float _444 = _442;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    if (!_408)
    {
        int _448 = ~_374;
        int _450 = _448 + 1;
        _428 = _450;
    }
    int _452 = _428;
    float _454 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _456 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _458 = !_336;
    if (!_458)
    {
        float _460 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _462 = log2(_460);
        float _464 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _466 = _464 + 1.0;
        float _468 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _470 = _326 * _462;
        float _472 = 1.0 / _466;
        float _474 = _468 * 0.693147182464599609375;
        float _476 = exp2(_470);
        float _478 = 1.0 / _474;
        float _480 = _476 + (-1.0);
        float _482 = -_480;
        float _484 = fma(_482, _478, _326);
        float _486 = _484 * _472;
        float _488 = _486 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _444 = _474;
        _446 = _476;
        _430 = _488;
    }
    float _490 = _444;
    float _492 = _446;
    float _494 = _430;
    bool _496 = !_336;
    float _498 = _490;
    float _500 = _492;
    if (!_496)
    {
        float _502 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _504 = log2(_502);
        float _506 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _508 = _506 + 1.0;
        float _510 = 1.0 / _508;
        float _512 = _326 * _504;
        float _514 = exp2(_512);
        float _516 = -_514;
        float _518 = _516 + 1.0;
        float _520 = _518 * _510;
        _498 = _514;
        _364 = _520;
    }
    float _522 = _498;
    float _524 = _364;
    int _526 = _424 ? 0 : 1;
    float _528 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _530 = log2(_528);
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _534 = _532 != 0;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _542 = _540 != 0;
    float _544 = -_148;
    float _546 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[76].x, _406);
    float _548 = _522;
    if (_182)
    {
        _548 = _194;
    }
    float _550 = _548;
    float _552 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _344);
    float _554 = in.m_57.y;
    bool _556 = !_538;
    int _558 = _556 ? 0 : 1;
    float _560 = _550;
    if (!_182)
    {
        _560 = _200;
    }
    float _562 = _560;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_182)
    {
        _500 = _200;
    }
    float _566 = _500;
    float _568 = in.m_59.x;
    bool _570 = !_534;
    int _572 = _570 ? 0 : 1;
    float _574 = in.m_59.z;
    float _576 = _566;
    if (!_182)
    {
        _576 = _192;
    }
    float _578 = _576;
    int _580 = abs(_558);
    float _582 = _562 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _584 = abs(_572);
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _588 = _578 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _590 = fma(_582, -2.0, _564);
    float _592 = float(_436);
    float _594 = _530 * _148;
    float _596 = float(_452);
    float _598 = -_586;
    float _600 = fma(_588, 2.0, _598);
    float _602 = float(_584);
    float _604 = in.m_61.x;
    float _606 = in.m_61.y;
    float _608 = in.m_61.z;
    float _610 = float(_580);
    float _612 = exp2(_594);
    float _614 = _602 * _592;
    float _616 = _610 * _596;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _622 = 1.0 + _620;
    int _624 = ~_526;
    int _626 = _624 + 1;
    int _628 = _626 + 1;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _634 = 1.0 / _622;
    float _636 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[78].z, _630);
    int _638 = _628;
    if (!_440)
    {
        int _640 = ~_526;
        int _642 = _640 + 1;
        _638 = _642;
    }
    int _644 = _638;
    float _646 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[78].w, _632);
    bool _648 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _650 = isnan(1.0);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _656 = _652 || _654;
    float _658 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[88].z, _618);
    float _660 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _636);
    bool _662 = !_542;
    int _664 = _662 ? 0 : 1;
    float _666 = -_612;
    float _668 = _666 + 1.0;
    bool _670 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _672 = isnan(0.0);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _678 = _674 || _676;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _682 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _658);
    float _684 = _614 * (-2.0);
    int _686 = abs(_664);
    float _688 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[88].w, _680);
    float _690 = _678 ? _668 : 0.0;
    float _692 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _590);
    float _694 = _200 + (-0.5);
    float _696 = fma(_684, _604, _604);
    float _698 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _646);
    float _700 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _688);
    float _702 = -_148;
    float _704 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[86].x, _600);
    float _706 = float(_644);
    float _708 = _692;
    if (_656)
    {
        float _710 = _690 * _634;
        _150 = _710;
    }
    float _712 = _150;
    float _714 = float(_686);
    float _716 = _616 * (-2.0);
    float _718 = fma(_456, _684, _456);
    float _720 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[196].x, _696);
    float _722 = _714 * _706;
    float _724 = fma(_454, _716, _454);
    float _726 = fma(_718, _712, _720);
    float _728 = in.m_51.x;
    float _730 = in.m_51.y;
    float _732 = in.m_51.z;
    float _734 = fma(_716, _606, _606);
    float _736 = _722 * (-2.0);
    float _738 = _726 * 0.15915493667125701904296875;
    float _740 = _200 + _192;
    float _742 = in.m_63.w;
    float _744 = _194 + (-0.5);
    float _746 = fma(_736, _608, _608);
    float _748 = _740 + (-1.0);
    float _750 = in.m_46.x;
    float _752 = in.m_46.y;
    float _754 = in.m_46.z;
    float _756 = _192 + (-0.5);
    float _758 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[196].y, _734);
    float _760 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _762 = _738 * 6.283185482025146484375;
    float _764 = sin(_762);
    float _766 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[196].z, _746);
    float _768 = fma(_724, _712, _758);
    float _770 = fma(_760, _736, _760);
    float _772 = _494 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _774 = _768 * 0.15915493667125701904296875;
    float _776 = fma(_770, _712, _766);
    float _778 = _494 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _780 = _494 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _782 = _738 * 6.283185482025146484375;
    float _784 = cos(_782);
    float _786 = fma(_524, _730, _772);
    float _788 = fma(_524, _728, _778);
    float _790 = fma(_524, _732, _780);
    float _792 = _776 * 0.15915493667125701904296875;
    float _794 = in.m_59.y;
    float _796 = _774 * 6.283185482025146484375;
    float _798 = sin(_796);
    float _800 = fma(_788, _742, _750);
    float _802 = fma(_786, _742, _752);
    float _804 = fma(_790, _742, _754);
    float _806 = in.m_63.x;
    float _808 = in.m_63.y;
    float _810 = in.m_63.z;
    float _812 = _802 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _814 = _774 * 6.283185482025146484375;
    float _816 = cos(_814);
    float _818 = _802 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _820 = _802 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _822 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[4].x, _812);
    float _824 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[5].x, _818);
    float _826 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[6].x, _820);
    float _828 = fma(_804, (*spvDescriptorSet0.vp_c10)._m0[4].z, _822);
    float _830 = _792 * 6.283185482025146484375;
    float _832 = sin(_830);
    float _834 = fma(_804, (*spvDescriptorSet0.vp_c10)._m0[5].z, _824);
    float _836 = fma(_804, (*spvDescriptorSet0.vp_c10)._m0[6].z, _826);
    float _838 = _784 * _798;
    float _840 = _836 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _842 = _792 * 6.283185482025146484375;
    float _844 = cos(_842);
    float _846 = _784 * _816;
    float _848 = _764 * _816;
    float _850 = _808 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _852 = _806 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _854 = _810 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _856 = _764 * _798;
    float _858 = -_838;
    float _860 = fma(_832, _848, _858);
    float _862 = -_848;
    float _864 = fma(_832, _838, _862);
    float _866 = _854 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _868 = fma(_832, _846, _856);
    float _870 = fma(_832, _856, _846);
    float _872 = _554 * 0.00999999977648258209228515625;
    float _874 = _784 * _844;
    float _876 = _816 * _844;
    float _878 = _764 * _844;
    float _880 = _798 * _844;
    float _882 = fma(_314, _872, _794);
    float _884 = _850 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _886 = _852 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _888 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _882);
    float _890 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _568);
    float _892 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _574);
    float _894 = _888 * _884;
    float _896 = _890 * _886;
    float _898 = _892 * _866;
    float _900 = _874 * _894;
    float _902 = -_894;
    float _904 = _832 * _902;
    float _906 = _878 * _894;
    float _908 = fma(_868, _896, _900);
    float _910 = fma(_876, _896, _904);
    float _912 = fma(_860, _896, _906);
    float _914 = _828 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _916 = fma(_864, _898, _908);
    float _918 = fma(_880, _898, _910);
    float _920 = fma(_870, _898, _912);
    float _922 = _834 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _924 = _916 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _926 = _916 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _928 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[10].x, _924);
    float _930 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[8].x, _926);
    float _932 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[10].z, _928);
    float _934 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[8].z, _930);
    float _936 = _932 + _840;
    float _938 = _934 + _914;
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _942 = _936 + _940;
    float _944 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _946 = _938 + _944;
    float _948 = _942 * _942;
    float _950 = fma(_946, _946, _948);
    float _952 = _916 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _954 = sqrt(_950);
    float _956 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[9].x, _952);
    float _958 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[9].z, _956);
    float _960 = _958 + _922;
    bool _962 = _954 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _964 = _918;
    float _966 = _936;
    float _968 = _938;
    float _970 = _950;
    if (!_962)
    {
        _964 = _936;
    }
    float _972 = _964;
    float _974 = _972;
    if (!_962)
    {
        _966 = _960;
    }
    float _976 = _966;
    bool _978 = !_962;
    float _980 = _976;
    if (!_978)
    {
        float _982 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _984 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _986 = _954 + _984;
        float _988 = rsqrt(_950);
        float _990 = _986 * _982;
        float _992 = _960 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _994 = _990 * 0.15915493667125701904296875;
        float _996 = _994 * 6.283185482025146484375;
        float _998 = cos(_996);
        float _1000 = _994 * 6.283185482025146484375;
        float _1002 = sin(_1000);
        float _1004 = _998 + (-1.0);
        float _1006 = fma(_1002, _992, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1008 = _1004 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1010 = _988 * _1006;
        float _1012 = fma(_960, _998, _1008);
        float _1014 = fma(_946, _1010, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1016 = fma(_942, _1010, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _980 = _1012;
        _968 = _1014;
        _974 = _1016;
    }
    float _1018 = _980;
    float _1020 = _968;
    float _1022 = _974;
    float _1024 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1026 = _1018 + _1024;
    float _1028 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1030 = _1020 + _1028;
    float _1032 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1034 = _1022 + _1032;
    float _1036 = _1026 * _1026;
    float _1038 = fma(_1030, _1030, _1036);
    float _1040 = fma(_1034, _1034, _1038);
    float _1042 = rsqrt(_1040);
    float _1044 = sqrt(_1040);
    float _1046 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1048 = _1030 * _1046;
    float _1050 = _1034 * _1046;
    float _1052 = _1048 * _1048;
    float _1054 = _1050 * _1050;
    float _1056 = _1052 + _1054;
    float _1058 = sqrt(_1056);
    bool _1060 = _1058 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1064 = _1058 + _1062;
    float _1066 = _916;
    float _1068 = _1056;
    float _1070 = _1064;
    float _1072 = _1026;
    float _1074 = _1048;
    float _1076 = _1050;
    float _1078 = _1052;
    float _1080 = _1054;
    bool _1082 = _1060;
    if (_1060)
    {
        float _1084 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1066 = _1084;
    }
    float _1086 = _1066;
    if (_1060)
    {
        float _1088 = rsqrt(_1056);
        _1068 = _1088;
    }
    float _1090 = _1068;
    if (_1060)
    {
        float _1092 = _1064 * _1086;
        _1070 = _1092;
    }
    float _1094 = _1070;
    if (_1060)
    {
        float _1096 = _1094 * 0.15915493667125701904296875;
        _970 = _1096;
    }
    float _1098 = _970;
    float _1100 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1102 = _960;
    if (_1060)
    {
        float _1104 = _1098 * 6.283185482025146484375;
        float _1106 = sin(_1104);
        _1102 = _1106;
    }
    float _1108 = _1102;
    float _1110 = precise::max(0.0, _1100);
    float _1112 = -_1046;
    float _1114 = -_1110;
    float _1116 = fma(_1026, _1112, _1114);
    float _1118 = _1086;
    float _1120 = _1110;
    if (_1060)
    {
        float _1122 = _1098 * 6.283185482025146484375;
        float _1124 = cos(_1122);
        _1118 = _1124;
    }
    float _1126 = _1118;
    if (_1060)
    {
        float _1128 = _1116 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1072 = _1128;
    }
    float _1130 = _1072;
    float _1132 = _1108;
    float _1134 = _1130;
    if (_1060)
    {
        float _1136 = fma(_1108, _1130, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1132 = _1136;
    }
    float _1138 = _1132;
    if (!_1060)
    {
        _1134 = _1116;
    }
    float _1140 = _1134;
    float _1142 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1144 = 0.0;
    float _1146 = _1140;
    if (_1060)
    {
        float _1148 = _1090 * _1138;
        _1144 = _1148;
    }
    float _1150 = _1144;
    if (_1060)
    {
        float _1152 = _1126 + (-1.0);
        _1120 = _1152;
    }
    float _1154 = _1120;
    float _1156 = _1154;
    if (_1060)
    {
        float _1158 = _1048 * _1150;
        _1074 = _1158;
    }
    float _1160 = _1074;
    if (_1060)
    {
        float _1162 = _1050 * _1150;
        _1076 = _1162;
    }
    float _1164 = _1076;
    float _1166 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1168 = fma(_1044, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1166);
    float _1170 = precise::clamp(_1168, 0.0, 1.0);
    if (_1060)
    {
        float _1172 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1156 = _1172;
    }
    float _1174 = _1156;
    if (_1060)
    {
        float _1176 = _1160 * _1160;
        _1078 = _1176;
    }
    float _1178 = _1078;
    if (_1060)
    {
        float _1180 = _1164 * _1164;
        _1080 = _1180;
    }
    float _1182 = _1080;
    float _1184 = -_1170;
    float _1186 = _1184 + 1.0;
    if (_1060)
    {
        float _1188 = fma(_1116, _1126, _1174);
        _1146 = _1188;
    }
    float _1190 = _1146;
    float _1192 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1194 = fma(_1190, _1190, _1178);
    float _1196 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1198 = abs(_1186);
    float _1200 = log2(_1198);
    float _1202 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1192);
    float _1204 = _1194 + _1182;
    float _1206 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1196);
    float _1208 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1210 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1202);
    float _1212 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1206);
    float _1214 = rsqrt(_1204);
    float _1216 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1218 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1208);
    float _1220 = _1212 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1222 = _1210 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1224 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1216);
    float _1226 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1218);
    float _1228 = _1220 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1230 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1224);
    float _1232 = _1226 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1234 = -_1228;
    float _1236 = fma(_1234, _1142, 1.0);
    float _1238 = _1200 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1240 = _1230 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1242 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1244 = _1214 * _1160;
    float _1246 = _1214 * _1190;
    float _1248 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1242);
    float _1250 = _1214 * _1164;
    float _1252 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1254 = log2(_1236);
    float _1256 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1248);
    float _1258 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1260 = -_1252;
    float _1262 = fma(_1246, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1260);
    float _1264 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1256);
    float _1266 = -_1250;
    float _1268 = fma(_1266, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1262);
    float _1270 = exp2(_1238);
    float _1272 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1274 = fma(_1268, -0.5, 0.5);
    float _1276 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1272);
    float _1278 = fma(_1268, 0.5, 0.5);
    float _1280 = 1.0 / _1264;
    float _1282 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1258);
    float _1284 = _1246 + 1.0;
    float _1286 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1276);
    float _1288 = fma(_1278, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1290 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1282);
    float _1292 = _1254 * 0.693147182464599609375;
    float _1294 = sqrt(_1274);
    float _1296 = -_1246;
    float _1298 = fma(_1270, _1284, _1296);
    float _1300 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1286);
    float _1302 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1290);
    float _1304 = fma(_1278, _1288, -0.212114393711090087890625);
    float _1306 = _1292 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1308 = fma(_1298, 0.5, 0.5);
    float _1310 = _1300 * _1280;
    float _1312 = _1302 * _1280;
    float _1314 = fma(_1278, _1304, 1.570728778839111328125);
    float _1316 = fma(_1310, 0.5, 0.5);
    float _1318 = fma(_1312, -0.5, 0.5);
    float _1320 = _1294 * 0.636619746685028076171875;
    float3 _3974 = float3(_1316, _1318, _1306);
    float _1322 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3974, float3(0.0), isnan(_3974)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3974, float3(0.0), isnan(_3974)), level(0.0)).x;
    float _1324 = -_1314;
    float _1326 = fma(_1320, _1324, 1.0);
    float3 _3990 = float3(_1316, _1318, _1306);
    float4 _1329 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3990, float3(0.0), isnan(_3990)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3990, float3(0.0), isnan(_3990)), level(0.0)).xyzw;
    float _1331 = _1329.x;
    float _1333 = _1329.y;
    float _1335 = _1329.z;
    float _1337 = _1329.w;
    float2 _4006 = float2(_1326, _1308);
    float3 _1341 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4006, float2(0.0), isnan(_4006)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4006, float2(0.0), isnan(_4006)), level(0.0)).xyz;
    float _1343 = _1341.x;
    float _1345 = _1341.y;
    float _1347 = _1341.z;
    bool _1349 = _194 > 0.5;
    float _1351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1353 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1355 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _1353;
    int _1357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1359 = _1357 != 0;
    float _1361 = _1200 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1363 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1365 = _1363 != 0;
    float _1367 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1369 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _1367;
    int _1371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1373 = _1371 != 0;
    float _1375 = _1355 * _1355;
    float _1377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_206)
    {
        bool _1379 = _200 > 0.5;
        _1082 = _1379;
    }
    bool _1381 = _1082;
    float _1383 = fma(_1369, _1369, _1375);
    int _1385 = _1349 ? as_type<int>(_216) : as_type<int>(_174);
    float _1387 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1389 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _1387;
    float _1391 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1393 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1395 = _1373 ? as_type<float>(_1385) : _174;
    float _1397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1399 = fma(_1389, _1389, _1383);
    int _1401 = as_type<int>(_1351);
    if (_1359)
    {
        float _1403 = _240 ? _216 : _174;
        _222 = _1403;
    }
    float _1405 = _222;
    if (_206)
    {
        float _1407 = -_184;
        float _1409 = _1407 + 1.0;
        _1401 = as_type<int>(_1409);
    }
    int _1411 = _1401;
    int _1413 = 0;
    if (_1365)
    {
        float _1415 = -_184;
        float _1417 = _1415 + 1.0;
        _1413 = as_type<int>(_1417);
    }
    int _1419 = _1413;
    float _1421 = fma(_1393, _1395, -0.5);
    float _1423 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1391);
    float _1425 = in.m_57.w;
    float _1427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_206)
    {
        float _1429 = _1381 ? as_type<float>(_1411) : _184;
        _366 = _1429;
    }
    float _1431 = _366;
    float _1433 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1365)
    {
        float _1435 = _1349 ? as_type<float>(_1419) : _184;
        _224 = _1435;
    }
    float _1437 = _224;
    float _1439 = -_552;
    float _1441 = fma(_698, _1421, _1439);
    bool _1443 = _882 != 0.0;
    bool _1445 = isnan(_882);
    bool _1447 = _1443 || _1445;
    bool _1449 = isnan(0.0);
    bool _1451 = _1447 || _1449;
    float _1453 = fma(_1433, _1431, -0.5);
    float _1455 = in.m_57.z;
    float _1457 = sqrt(_1399);
    float _1459 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1461 = fma(_660, _1453, _546);
    float _1463 = _1441 + 0.5;
    float _1465 = fma(_1459, _1405, -0.5);
    bool _1467 = _568 == 0.0;
    bool _1469 = !_1451;
    bool _1471 = _1467 && _1469;
    float _1473 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1423);
    float _1475 = rsqrt(_1399);
    float _1477 = _1427 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1479 = -_692;
    float _1481 = fma(_700, _1465, _1479);
    bool _1483 = _574 == 0.0;
    bool _1485 = _1483 && _1471;
    float _1487 = fma(_1477, _1437, -0.5);
    float _1489 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1473);
    out.m_65.y = _554;
    float _1491 = precise::max(0.0, _1457);
    float _1493 = fma(_682, _1487, _704);
    float _1495 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1497 = in.m_67.x;
    float _1499 = in.m_67.y;
    float _1501 = in.m_67.z;
    float _1503 = in.m_67.w;
    float _1505 = precise::min(_1491, 1000.0);
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1509 = _1493 + 0.5;
    out.m_69.w = _1495;
    float _1511 = _1475 * 100.0;
    float _1513 = _1505 * 0.001000000047497451305389404296875;
    float _1515 = _1461 + 0.5;
    out.m_71.w = _1507;
    float _1517 = exp2(_1361);
    float _1519 = _1513 * _1511;
    out.m_73.x = _1515;
    out.m_73.y = _1463;
    out.m_73.z = _310;
    out.m_73.w = _312;
    float _1521 = _1481 + 0.5;
    float _1523 = -_1519;
    float _1525 = fma(_1369, _1523, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1527 = -_1519;
    float _1529 = fma(_1389, _1527, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1531 = in.m_75.x;
    float _1533 = in.m_75.y;
    float _1535 = in.m_75.z;
    out.m_77.x = _1509;
    out.m_77.y = _1521;
    float _1537 = _874 * _1499;
    float _1539 = -_1499;
    float _1541 = _832 * _1539;
    float _1543 = _878 * _1499;
    float _1545 = -_1517;
    float _1547 = _1545 + 1.0;
    float _1549 = fma(_868, _1497, _1537);
    float _1551 = fma(_876, _1497, _1541);
    float _1553 = fma(_860, _1497, _1543);
    float _1555 = _1547 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1557 = fma(_864, _1501, _1549);
    float _1559 = fma(_880, _1501, _1551);
    float _1561 = fma(_870, _1501, _1553);
    out.m_65.z = _1455;
    float _1563 = _1557 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1565 = _1557 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1567 = _1557 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_65.w = _1425;
    float _1569 = _1509;
    float _1571 = _1521;
    float _1573 = _1559;
    float _1575 = _1531;
    if (_1485)
    {
        _708 = _1531;
    }
    float _1577 = _708;
    float _1579 = fma(_1559, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1563);
    float _1581 = fma(_1559, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1565);
    float _1583 = fma(_1559, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1567);
    float _1585 = _1577;
    float _1587 = _1579;
    if (_1485)
    {
        _1569 = _1533;
    }
    float _1589 = _1569;
    float _1591 = fma(_1561, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1579);
    float _1593 = _1589;
    if (_1485)
    {
        _1571 = _1535;
    }
    float _1595 = _1571;
    float _1597 = fma(_1561, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1581);
    float _1599 = _1595;
    if (_1485)
    {
        _1573 = _1577;
    }
    float _1601 = _1573;
    float _1603 = fma(_1561, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1583);
    float _1605 = _1601;
    if (!_1485)
    {
        _1585 = _1531;
    }
    float _1607 = _1585;
    out.m_79.x = _1525;
    if (_1485)
    {
        _1587 = _1589;
    }
    float _1609 = _1587;
    float _1611 = _1609;
    if (_1485)
    {
        _1575 = _1595;
    }
    float _1613 = _1575;
    float _1615 = _1501 * _1607;
    float _1617 = _1613;
    if (!_1485)
    {
        _1593 = _1533;
    }
    float _1619 = _1593;
    out.m_81.x = _1591;
    out.m_81.y = _1597;
    out.m_81.z = _1603;
    if (!_1485)
    {
        _1599 = _1535;
    }
    float _1621 = _1599;
    if (!_1485)
    {
        float _1623 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1607);
        _1605 = _1623;
    }
    float _1625 = _1605;
    float _1627 = _1497 * _1619;
    if (!_1485)
    {
        float _1629 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1619);
        _1611 = _1629;
    }
    float _1631 = _1611;
    float _1633 = _1499 * _1621;
    float _1635 = -_1615;
    float _1637 = fma(_1497, _1621, _1635);
    float _1639 = -_1627;
    float _1641 = fma(_1499, _1607, _1639);
    if (!_1485)
    {
        float _1643 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1621);
        _1617 = _1643;
    }
    float _1645 = _1617;
    float _1647 = -_1633;
    float _1649 = fma(_1501, _1619, _1647);
    float _1651 = _1637 * _1503;
    float _1653 = _874 * _1631;
    float _1655 = _1641 * _1503;
    float _1657 = _1649 * _1503;
    float _1659 = _874 * _1651;
    float _1661 = -_1631;
    float _1663 = _832 * _1661;
    float _1665 = _878 * _1631;
    float _1667 = fma(_868, _1625, _1653);
    float _1669 = -_1651;
    float _1671 = _832 * _1669;
    float _1673 = fma(_868, _1657, _1659);
    float _1675 = _878 * _1651;
    float _1677 = fma(_876, _1625, _1663);
    float _1679 = fma(_860, _1625, _1665);
    float _1681 = fma(_876, _1657, _1671);
    float _1683 = fma(_864, _1655, _1673);
    float _1685 = fma(_860, _1657, _1675);
    float _1687 = fma(_864, _1645, _1667);
    float _1689 = fma(_880, _1655, _1681);
    float _1691 = _1683 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1693 = _1683 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1695 = fma(_870, _1655, _1685);
    float _1697 = fma(_880, _1645, _1677);
    float _1699 = fma(_1689, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1691);
    float _1701 = fma(_870, _1645, _1679);
    float _1703 = fma(_1689, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1693);
    float _1705 = _1687 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1707 = _1687 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1709 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1699);
    float _1711 = _1687 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1713 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1703);
    float _1715 = _1683 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1717 = fma(_1697, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1705);
    float _1719 = _1489 + _1264;
    float _1721 = fma(_1697, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1707);
    float _1723 = fma(_1697, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1711);
    float _1725 = fma(_1689, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1715);
    float _1727 = _1719 * 0.5;
    float _1729 = fma(_1701, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1723);
    float _1731 = -_1555;
    float _1733 = _1731 + 1.0;
    float _1735 = fma(_1701, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1717);
    float _1737 = fma(_1701, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1721);
    out.m_83.z = _1727;
    out.m_83.w = _1264;
    bool _1739 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1741 = isnan(_1044);
    bool _1743 = _1739 || _1741;
    bool _1745 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1747 = _1743 || _1745;
    float _1749 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1725);
    out.m_79.z = _1529;
    out.gl_Position.x = _1300;
    out.gl_Position.y = _1302;
    out.gl_Position.z = _1489;
    out.gl_Position.w = _1264;
    out.m_85.x = _1735;
    out.m_85.y = _1737;
    out.m_85.z = _1729;
    out.m_87.x = _1020;
    out.m_87.y = _1018;
    out.m_87.z = _1022;
    out.m_89.x = _1709;
    out.m_89.y = _1713;
    out.m_89.z = _1749;
    float _1751 = _1749;
    float _1753 = _1713;
    float _1755 = _1709;
    if (!_1747)
    {
        _1751 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1757 = _1751;
    float _1759 = _1757;
    float _1761 = _1757;
    if (!_1747)
    {
        _1753 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1763 = _1753;
    float _1765 = _1763;
    float _1767 = _1763;
    if (!_1747)
    {
        _1755 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1769 = _1755;
    float _1771 = _1555 * _1322;
    float _1773 = _1337 * _1771;
    float _1775 = _1337 * _1733;
    float _1777 = _1347 * _1771;
    float _1779 = fma(_1343, _1773, _1331);
    float _1781 = fma(_1345, _1773, _1333);
    float _1783 = fma(_1337, _1777, _1335);
    out.m_91.x = _1779;
    out.m_91.y = _1781;
    out.m_91.z = _1783;
    out.m_91.w = _1775;
    bool _1785 = !_1747;
    float _1787 = _1769;
    float _1789 = _1769;
    if (!_1785)
    {
        bool _1791 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1793 = isnan(_1044);
        bool _1795 = _1791 || _1793;
        bool _1797 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1799 = _1795 || _1797;
        if (!_1799)
        {
            float _1801 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1803 = _1044 + _1801;
            float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1807 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1805;
            float _1809 = 1.0 / _1807;
            float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1813 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1815 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1817 = _1815 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1819 = _1803 * _1809;
            float _1821 = precise::clamp(_1819, 0.0, 1.0);
            float _1823 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1825 = _1823 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1827 = fma(_1821, _1817, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1829 = fma(_1821, _1825, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1831 = fma(_1821, _1813, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1767 = _1831;
            _1761 = _1829;
            _1789 = _1827;
            _1833 = true;
        }
        else
        {
            bool _1835 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1837 = isnan(_1044);
            bool _1839 = _1835 || _1837;
            bool _1841 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1843 = _1839 || _1841;
            if (!_1843)
            {
                _1759 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1845 = _1759;
            _1761 = _1845;
            if (!_1843)
            {
                _1765 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1847 = _1765;
            _1767 = _1847;
            if (!_1843)
            {
                _1787 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1849 = _1787;
            bool _1851 = !_1843;
            _1789 = _1849;
            if (!_1851)
            {
                bool _1853 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1855 = isnan(_1044);
                bool _1857 = _1853 || _1855;
                bool _1859 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1861 = _1857 || _1859;
                if (!_1861)
                {
                    float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1865 = _1044 + _1863;
                    float _1867 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1869 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1867;
                    float _1871 = 1.0 / _1869;
                    float _1873 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1875 = _1873 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1877 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1879 = _1877 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1881 = _1865 * _1871;
                    float _1883 = precise::clamp(_1881, 0.0, 1.0);
                    float _1885 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1887 = _1885 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1889 = fma(_1883, _1879, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1891 = fma(_1883, _1887, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1893 = fma(_1883, _1875, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1767 = _1893;
                    _1761 = _1891;
                    _1789 = _1889;
                    _1833 = true;
                }
                else
                {
                    _1767 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1761 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1789 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1833 = false;
    float _1895 = _1767;
    float _1897 = _1761;
    float _1899 = _1789;
    float _1901 = _1895 * 0.586610972881317138671875;
    bool _1903 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_93.x = 0.0;
    float _1905 = fma(_1897, 0.298911988735198974609375, _1901);
    float _1907 = fma(_1899, 0.114477999508380889892578125, _1905);
    float _1909 = -_1907;
    float _1911 = _1909 + _1897;
    float _1913 = -_1907;
    float _1915 = _1913 + _1895;
    float _1917 = -_1907;
    float _1919 = _1917 + _1899;
    float _1921 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1923 = fma(_1911, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1907);
    float _1925 = fma(_1915, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1907);
    float _1927 = fma(_1919, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1907);
    out.m_49.x = _1921;
    out.m_95.x = _1923;
    out.m_95.y = _1925;
    out.m_95.z = _1927;
    if (!_1903)
    {
        return out;
    }
    float _1929 = -_1018;
    float _1931 = _1929 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1933 = -_1020;
    float _1935 = _1933 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1937 = -_1022;
    float _1939 = _1937 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1941 = _1931 * _1931;
    float _1943 = fma(_1935, _1935, _1941);
    float _1945 = fma(_1939, _1939, _1943);
    float _1947 = sqrt(_1945);
    float _1949 = rsqrt(_1945);
    float _1951 = -_1947;
    float _1953 = _1951 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1955 = _1953 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1957 = precise::clamp(_1955, 0.0, 1.0);
    float _1959 = _1935 * _1949;
    float _1961 = _1931 * _1949;
    float _1963 = abs(_1957);
    float _1965 = log2(_1963);
    float _1967 = _1939 * _1949;
    float _1969 = _1959 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1971 = _1737 * _1961;
    float _1973 = -_1961;
    float _1975 = -_1969;
    float _1977 = fma(_1973, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1975);
    float _1979 = fma(_1735, _1959, _1971);
    float _1981 = -_1967;
    float _1983 = fma(_1981, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1977);
    float _1985 = fma(_1729, _1967, _1979);
    float _1987 = precise::clamp(_1985, 0.0, 1.0);
    float _1989 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1991 = _1983 + _1989;
    float _1993 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1995 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1997 = precise::clamp(_1995, 0.0, 1.0);
    float _1999 = exp2(_1993);
    float _2001 = _1999 * _1997;
    float _2003 = _1987 * _2001;
    float _2005 = _2003 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2007 = _2003 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2009 = _2003 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2005;
    out.m_93.y = _2007;
    out.m_93.z = _2009;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1833 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    float _122 = as_type<float>(_114);
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _120;
    if (!_118)
    {
        out.m_49.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _124 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2067 = as_type<float>(_130);
        out.gl_Position.z = _2067;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_51.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = _148;
    if (_144)
    {
        float _152 = float(_114);
        _122 = _152;
    }
    float _154 = _122;
    bool _156 = _148 >= _154;
    bool _158 = !_144;
    bool _160 = _156 || _158;
    float _162 = _154;
    if (_160)
    {
        _162 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _162;
    if (_160)
    {
        out.m_49.x = 0.0;
    }
    if (_160)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2137 = as_type<float>(_168);
        out.gl_Position.z = _2137;
    }
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _170 = in.m_53.w;
    float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _174 = in.m_55.y;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _178 = _176 != 0;
    int _180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _182 = _180 != 0;
    float _184 = in.m_55.x;
    int _186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _188 = _186 != 0;
    float _190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _192 = in.m_53.z;
    float _194 = in.m_53.y;
    float _196 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _198 = _172 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _200 = in.m_53.x;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _206 = _204 != 0;
    bool _208 = _170 > 0.5;
    float _210 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _212 = _190 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _214 = -_174;
    float _216 = _214 + 1.0;
    int _218 = 0;
    float _220 = _198;
    float _222 = _174;
    float _224 = _184;
    if (_178)
    {
        float _226 = -_184;
        float _228 = _226 + 1.0;
        _218 = as_type<int>(_228);
    }
    int _230 = _218;
    int _232 = _208 ? as_type<int>(_216) : as_type<int>(_174);
    float _234 = 0.0;
    float _236 = as_type<float>(_230);
    if (!_178)
    {
        _234 = _184;
    }
    float _238 = _234;
    bool _240 = _192 > 0.5;
    float _242 = _188 ? as_type<float>(_232) : _174;
    float _244 = _238;
    float _246 = _242;
    if (_178)
    {
        float _248 = _240 ? as_type<float>(_230) : _184;
        _244 = _248;
    }
    float _250 = _244;
    if (!_182)
    {
        _236 = _194;
    }
    float _252 = _236;
    float _254 = fma(_242, _198, -0.5);
    float _256 = _252;
    if (_182)
    {
        _256 = _200;
    }
    float _258 = _256;
    float _260 = fma(_212, _250, -0.5);
    if (!_182)
    {
        _246 = _192;
    }
    float _262 = _246;
    float _264 = _262;
    if (_182)
    {
        _264 = _194;
    }
    float _266 = _264;
    float _268 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[83].z, _196);
    if (!_182)
    {
        _220 = _192;
    }
    float _270 = _220;
    float _272 = _258 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _274 = _270;
    if (_182)
    {
        _274 = _194;
    }
    float _276 = _274;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _280 = _266 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _282 = -_202;
    float _284 = fma(_272, 2.0, _282);
    float _286 = 0.0;
    if (!_206)
    {
        _286 = _184;
    }
    float _288 = _286;
    float _290 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[83].w, _210);
    float _292 = fma(_280, -2.0, _278);
    float _294 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _268);
    float _296 = -_148;
    float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[81].x, _284);
    float _300 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _290);
    float _302 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _292);
    float _304 = fma(_294, _260, _298);
    float _306 = -_302;
    float _308 = fma(_300, _254, _306);
    float _310 = _304 + 0.5;
    float _312 = _308 + 0.5;
    float2 _2389 = float2(_310, _312);
    float _314 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2389, float2(0.0), isnan(_2389)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2389, float2(0.0), isnan(_2389)), level(0.0)).y;
    float _316 = _192 * 2.0;
    float _318 = _200 * 2.0;
    float _320 = _194 * 2.0;
    float _322 = _194 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _324 = floor(_318);
    float _326 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _328 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _332 = _328 || _330;
    bool _334 = isnan(1.0);
    bool _336 = _332 || _334;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _340 = floor(_316);
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _344 = fma(_322, -2.0, _342);
    float _346 = _194 + _200;
    float _348 = floor(_320);
    bool _350 = _324 >= 0.0;
    bool _352 = isnan(_324);
    bool _354 = _350 || _352;
    bool _356 = isnan(0.0);
    bool _358 = _354 || _356;
    float _360 = _346 + (-1.0);
    float _362 = 0.0;
    float _364 = _326;
    float _366 = _288;
    if (!_336)
    {
        float _368 = _326 * _326;
        float _370 = _368 * 0.5;
        _362 = _370;
    }
    float _372 = _362;
    int _374 = _358 ? 0 : 1;
    float _376 = _372;
    if (!_336)
    {
        float _378 = _372 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _376 = _378;
    }
    float _380 = _376;
    bool _382 = _340 > 0.0;
    bool _384 = _340 >= 0.0;
    bool _386 = isnan(_340);
    bool _388 = _384 || _386;
    bool _390 = isnan(0.0);
    bool _392 = _388 || _390;
    float _394 = _200 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _396 = ~_374;
    int _398 = _396 + 1;
    int _400 = _398 + 1;
    int _402 = _392 ? 0 : 1;
    float _404 = -_338;
    float _406 = fma(_394, 2.0, _404);
    bool _408 = _324 > 0.0;
    int _410 = ~_402;
    int _412 = _410 + 1;
    int _414 = _412 + 1;
    bool _416 = _348 >= 0.0;
    bool _418 = isnan(_348);
    bool _420 = _416 || _418;
    bool _422 = isnan(0.0);
    bool _424 = _420 || _422;
    int _426 = _414;
    int _428 = _400;
    float _430 = _380;
    if (!_382)
    {
        int _432 = ~_402;
        int _434 = _432 + 1;
        _426 = _434;
    }
    int _436 = _426;
    float _438 = _194 + _192;
    bool _440 = _348 > 0.0;
    float _442 = _438 + (-1.0);
    float _444 = _442;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    if (!_408)
    {
        int _448 = ~_374;
        int _450 = _448 + 1;
        _428 = _450;
    }
    int _452 = _428;
    float _454 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _456 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _458 = !_336;
    if (!_458)
    {
        float _460 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _462 = log2(_460);
        float _464 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _466 = _464 + 1.0;
        float _468 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _470 = _326 * _462;
        float _472 = 1.0 / _466;
        float _474 = _468 * 0.693147182464599609375;
        float _476 = exp2(_470);
        float _478 = 1.0 / _474;
        float _480 = _476 + (-1.0);
        float _482 = -_480;
        float _484 = fma(_482, _478, _326);
        float _486 = _484 * _472;
        float _488 = _486 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _444 = _474;
        _446 = _476;
        _430 = _488;
    }
    float _490 = _444;
    float _492 = _446;
    float _494 = _430;
    bool _496 = !_336;
    float _498 = _490;
    float _500 = _492;
    if (!_496)
    {
        float _502 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _504 = log2(_502);
        float _506 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _508 = _506 + 1.0;
        float _510 = 1.0 / _508;
        float _512 = _326 * _504;
        float _514 = exp2(_512);
        float _516 = -_514;
        float _518 = _516 + 1.0;
        float _520 = _518 * _510;
        _498 = _514;
        _364 = _520;
    }
    float _522 = _498;
    float _524 = _364;
    int _526 = _424 ? 0 : 1;
    float _528 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _530 = log2(_528);
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _534 = _532 != 0;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _542 = _540 != 0;
    float _544 = -_148;
    float _546 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[76].x, _406);
    float _548 = _522;
    if (_182)
    {
        _548 = _194;
    }
    float _550 = _548;
    float _552 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _344);
    float _554 = in.m_57.y;
    bool _556 = !_538;
    int _558 = _556 ? 0 : 1;
    float _560 = _550;
    if (!_182)
    {
        _560 = _200;
    }
    float _562 = _560;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_182)
    {
        _500 = _200;
    }
    float _566 = _500;
    float _568 = in.m_59.x;
    bool _570 = !_534;
    int _572 = _570 ? 0 : 1;
    float _574 = in.m_59.z;
    float _576 = _566;
    if (!_182)
    {
        _576 = _192;
    }
    float _578 = _576;
    int _580 = abs(_558);
    float _582 = _562 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _584 = abs(_572);
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _588 = _578 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _590 = fma(_582, -2.0, _564);
    float _592 = float(_436);
    float _594 = _530 * _148;
    float _596 = float(_452);
    float _598 = -_586;
    float _600 = fma(_588, 2.0, _598);
    float _602 = float(_584);
    float _604 = in.m_61.x;
    float _606 = in.m_61.y;
    float _608 = in.m_61.z;
    float _610 = float(_580);
    float _612 = exp2(_594);
    float _614 = _602 * _592;
    float _616 = _610 * _596;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _622 = 1.0 + _620;
    int _624 = ~_526;
    int _626 = _624 + 1;
    int _628 = _626 + 1;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _634 = 1.0 / _622;
    float _636 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[78].z, _630);
    int _638 = _628;
    if (!_440)
    {
        int _640 = ~_526;
        int _642 = _640 + 1;
        _638 = _642;
    }
    int _644 = _638;
    float _646 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[78].w, _632);
    bool _648 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _650 = isnan(1.0);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _656 = _652 || _654;
    float _658 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[88].z, _618);
    float _660 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _636);
    bool _662 = !_542;
    int _664 = _662 ? 0 : 1;
    float _666 = -_612;
    float _668 = _666 + 1.0;
    bool _670 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _672 = isnan(0.0);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _678 = _674 || _676;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _682 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _658);
    float _684 = _614 * (-2.0);
    int _686 = abs(_664);
    float _688 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[88].w, _680);
    float _690 = _678 ? _668 : 0.0;
    float _692 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _590);
    float _694 = _200 + (-0.5);
    float _696 = fma(_684, _604, _604);
    float _698 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _646);
    float _700 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _688);
    float _702 = -_148;
    float _704 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[86].x, _600);
    float _706 = float(_644);
    float _708 = _692;
    if (_656)
    {
        float _710 = _690 * _634;
        _150 = _710;
    }
    float _712 = _150;
    float _714 = float(_686);
    float _716 = _616 * (-2.0);
    float _718 = fma(_456, _684, _456);
    float _720 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[196].x, _696);
    float _722 = _714 * _706;
    float _724 = fma(_454, _716, _454);
    float _726 = fma(_718, _712, _720);
    float _728 = in.m_51.x;
    float _730 = in.m_51.y;
    float _732 = in.m_51.z;
    float _734 = fma(_716, _606, _606);
    float _736 = _722 * (-2.0);
    float _738 = _726 * 0.15915493667125701904296875;
    float _740 = _200 + _192;
    float _742 = in.m_63.w;
    float _744 = _194 + (-0.5);
    float _746 = fma(_736, _608, _608);
    float _748 = _740 + (-1.0);
    float _750 = in.m_46.x;
    float _752 = in.m_46.y;
    float _754 = in.m_46.z;
    float _756 = _192 + (-0.5);
    float _758 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[196].y, _734);
    float _760 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _762 = _738 * 6.283185482025146484375;
    float _764 = sin(_762);
    float _766 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[196].z, _746);
    float _768 = fma(_724, _712, _758);
    float _770 = fma(_760, _736, _760);
    float _772 = _494 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _774 = _768 * 0.15915493667125701904296875;
    float _776 = fma(_770, _712, _766);
    float _778 = _494 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _780 = _494 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _782 = _738 * 6.283185482025146484375;
    float _784 = cos(_782);
    float _786 = fma(_524, _730, _772);
    float _788 = fma(_524, _728, _778);
    float _790 = fma(_524, _732, _780);
    float _792 = _776 * 0.15915493667125701904296875;
    float _794 = in.m_59.y;
    float _796 = _774 * 6.283185482025146484375;
    float _798 = sin(_796);
    float _800 = fma(_788, _742, _750);
    float _802 = fma(_786, _742, _752);
    float _804 = fma(_790, _742, _754);
    float _806 = in.m_63.x;
    float _808 = in.m_63.y;
    float _810 = in.m_63.z;
    float _812 = _802 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _814 = _774 * 6.283185482025146484375;
    float _816 = cos(_814);
    float _818 = _802 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _820 = _802 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _822 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[4].x, _812);
    float _824 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[5].x, _818);
    float _826 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[6].x, _820);
    float _828 = fma(_804, (*spvDescriptorSet0.vp_c10)._m0[4].z, _822);
    float _830 = _792 * 6.283185482025146484375;
    float _832 = sin(_830);
    float _834 = fma(_804, (*spvDescriptorSet0.vp_c10)._m0[5].z, _824);
    float _836 = fma(_804, (*spvDescriptorSet0.vp_c10)._m0[6].z, _826);
    float _838 = _784 * _798;
    float _840 = _836 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _842 = _792 * 6.283185482025146484375;
    float _844 = cos(_842);
    float _846 = _784 * _816;
    float _848 = _764 * _816;
    float _850 = _808 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _852 = _806 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _854 = _810 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _856 = _764 * _798;
    float _858 = -_838;
    float _860 = fma(_832, _848, _858);
    float _862 = -_848;
    float _864 = fma(_832, _838, _862);
    float _866 = _854 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _868 = fma(_832, _846, _856);
    float _870 = fma(_832, _856, _846);
    float _872 = _554 * 0.00999999977648258209228515625;
    float _874 = _784 * _844;
    float _876 = _816 * _844;
    float _878 = _764 * _844;
    float _880 = _798 * _844;
    float _882 = fma(_314, _872, _794);
    float _884 = _850 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _886 = _852 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _888 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _882);
    float _890 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _568);
    float _892 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _574);
    float _894 = _888 * _884;
    float _896 = _890 * _886;
    float _898 = _892 * _866;
    float _900 = _874 * _894;
    float _902 = -_894;
    float _904 = _832 * _902;
    float _906 = _878 * _894;
    float _908 = fma(_868, _896, _900);
    float _910 = fma(_876, _896, _904);
    float _912 = fma(_860, _896, _906);
    float _914 = _828 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _916 = fma(_864, _898, _908);
    float _918 = fma(_880, _898, _910);
    float _920 = fma(_870, _898, _912);
    float _922 = _834 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _924 = _916 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _926 = _916 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _928 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[10].x, _924);
    float _930 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[8].x, _926);
    float _932 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[10].z, _928);
    float _934 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[8].z, _930);
    float _936 = _932 + _840;
    float _938 = _934 + _914;
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _942 = _936 + _940;
    float _944 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _946 = _938 + _944;
    float _948 = _942 * _942;
    float _950 = fma(_946, _946, _948);
    float _952 = _916 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _954 = sqrt(_950);
    float _956 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[9].x, _952);
    float _958 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[9].z, _956);
    float _960 = _958 + _922;
    bool _962 = _954 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _964 = _918;
    float _966 = _936;
    float _968 = _938;
    float _970 = _950;
    if (!_962)
    {
        _964 = _936;
    }
    float _972 = _964;
    float _974 = _972;
    if (!_962)
    {
        _966 = _960;
    }
    float _976 = _966;
    bool _978 = !_962;
    float _980 = _976;
    if (!_978)
    {
        float _982 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _984 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _986 = _954 + _984;
        float _988 = rsqrt(_950);
        float _990 = _986 * _982;
        float _992 = _960 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _994 = _990 * 0.15915493667125701904296875;
        float _996 = _994 * 6.283185482025146484375;
        float _998 = cos(_996);
        float _1000 = _994 * 6.283185482025146484375;
        float _1002 = sin(_1000);
        float _1004 = _998 + (-1.0);
        float _1006 = fma(_1002, _992, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1008 = _1004 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1010 = _988 * _1006;
        float _1012 = fma(_960, _998, _1008);
        float _1014 = fma(_946, _1010, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1016 = fma(_942, _1010, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _980 = _1012;
        _968 = _1014;
        _974 = _1016;
    }
    float _1018 = _980;
    float _1020 = _968;
    float _1022 = _974;
    float _1024 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1026 = _1018 + _1024;
    float _1028 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1030 = _1020 + _1028;
    float _1032 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1034 = _1022 + _1032;
    float _1036 = _1026 * _1026;
    float _1038 = fma(_1030, _1030, _1036);
    float _1040 = fma(_1034, _1034, _1038);
    float _1042 = rsqrt(_1040);
    float _1044 = sqrt(_1040);
    float _1046 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1048 = _1030 * _1046;
    float _1050 = _1034 * _1046;
    float _1052 = _1048 * _1048;
    float _1054 = _1050 * _1050;
    float _1056 = _1052 + _1054;
    float _1058 = sqrt(_1056);
    bool _1060 = _1058 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1064 = _1058 + _1062;
    float _1066 = _916;
    float _1068 = _1056;
    float _1070 = _1064;
    float _1072 = _1026;
    float _1074 = _1048;
    float _1076 = _1050;
    float _1078 = _1052;
    float _1080 = _1054;
    bool _1082 = _1060;
    if (_1060)
    {
        float _1084 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1066 = _1084;
    }
    float _1086 = _1066;
    if (_1060)
    {
        float _1088 = rsqrt(_1056);
        _1068 = _1088;
    }
    float _1090 = _1068;
    if (_1060)
    {
        float _1092 = _1064 * _1086;
        _1070 = _1092;
    }
    float _1094 = _1070;
    if (_1060)
    {
        float _1096 = _1094 * 0.15915493667125701904296875;
        _970 = _1096;
    }
    float _1098 = _970;
    float _1100 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1102 = _960;
    if (_1060)
    {
        float _1104 = _1098 * 6.283185482025146484375;
        float _1106 = sin(_1104);
        _1102 = _1106;
    }
    float _1108 = _1102;
    float _1110 = precise::max(0.0, _1100);
    float _1112 = -_1046;
    float _1114 = -_1110;
    float _1116 = fma(_1026, _1112, _1114);
    float _1118 = _1086;
    float _1120 = _1110;
    if (_1060)
    {
        float _1122 = _1098 * 6.283185482025146484375;
        float _1124 = cos(_1122);
        _1118 = _1124;
    }
    float _1126 = _1118;
    if (_1060)
    {
        float _1128 = _1116 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1072 = _1128;
    }
    float _1130 = _1072;
    float _1132 = _1108;
    float _1134 = _1130;
    if (_1060)
    {
        float _1136 = fma(_1108, _1130, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1132 = _1136;
    }
    float _1138 = _1132;
    if (!_1060)
    {
        _1134 = _1116;
    }
    float _1140 = _1134;
    float _1142 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1144 = 0.0;
    float _1146 = _1140;
    if (_1060)
    {
        float _1148 = _1090 * _1138;
        _1144 = _1148;
    }
    float _1150 = _1144;
    if (_1060)
    {
        float _1152 = _1126 + (-1.0);
        _1120 = _1152;
    }
    float _1154 = _1120;
    float _1156 = _1154;
    if (_1060)
    {
        float _1158 = _1048 * _1150;
        _1074 = _1158;
    }
    float _1160 = _1074;
    if (_1060)
    {
        float _1162 = _1050 * _1150;
        _1076 = _1162;
    }
    float _1164 = _1076;
    float _1166 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1168 = fma(_1044, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1166);
    float _1170 = precise::clamp(_1168, 0.0, 1.0);
    if (_1060)
    {
        float _1172 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1156 = _1172;
    }
    float _1174 = _1156;
    if (_1060)
    {
        float _1176 = _1160 * _1160;
        _1078 = _1176;
    }
    float _1178 = _1078;
    if (_1060)
    {
        float _1180 = _1164 * _1164;
        _1080 = _1180;
    }
    float _1182 = _1080;
    float _1184 = -_1170;
    float _1186 = _1184 + 1.0;
    if (_1060)
    {
        float _1188 = fma(_1116, _1126, _1174);
        _1146 = _1188;
    }
    float _1190 = _1146;
    float _1192 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1194 = fma(_1190, _1190, _1178);
    float _1196 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1198 = abs(_1186);
    float _1200 = log2(_1198);
    float _1202 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1192);
    float _1204 = _1194 + _1182;
    float _1206 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1196);
    float _1208 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1210 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1202);
    float _1212 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1206);
    float _1214 = rsqrt(_1204);
    float _1216 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1218 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1208);
    float _1220 = _1212 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1222 = _1210 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1224 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1216);
    float _1226 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1218);
    float _1228 = _1220 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1230 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1224);
    float _1232 = _1226 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1234 = -_1228;
    float _1236 = fma(_1234, _1142, 1.0);
    float _1238 = _1200 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1240 = _1230 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1242 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1244 = _1214 * _1160;
    float _1246 = _1214 * _1190;
    float _1248 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1242);
    float _1250 = _1214 * _1164;
    float _1252 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1254 = log2(_1236);
    float _1256 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1248);
    float _1258 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1260 = -_1252;
    float _1262 = fma(_1246, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1260);
    float _1264 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1256);
    float _1266 = -_1250;
    float _1268 = fma(_1266, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1262);
    float _1270 = exp2(_1238);
    float _1272 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1274 = fma(_1268, -0.5, 0.5);
    float _1276 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1272);
    float _1278 = fma(_1268, 0.5, 0.5);
    float _1280 = 1.0 / _1264;
    float _1282 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1258);
    float _1284 = _1246 + 1.0;
    float _1286 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1276);
    float _1288 = fma(_1278, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1290 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1282);
    float _1292 = _1254 * 0.693147182464599609375;
    float _1294 = sqrt(_1274);
    float _1296 = -_1246;
    float _1298 = fma(_1270, _1284, _1296);
    float _1300 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1286);
    float _1302 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1290);
    float _1304 = fma(_1278, _1288, -0.212114393711090087890625);
    float _1306 = _1292 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1308 = fma(_1298, 0.5, 0.5);
    float _1310 = _1300 * _1280;
    float _1312 = _1302 * _1280;
    float _1314 = fma(_1278, _1304, 1.570728778839111328125);
    float _1316 = fma(_1310, 0.5, 0.5);
    float _1318 = fma(_1312, -0.5, 0.5);
    float _1320 = _1294 * 0.636619746685028076171875;
    float3 _3974 = float3(_1316, _1318, _1306);
    float _1322 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3974, float3(0.0), isnan(_3974)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3974, float3(0.0), isnan(_3974)), level(0.0)).x;
    float _1324 = -_1314;
    float _1326 = fma(_1320, _1324, 1.0);
    float3 _3990 = float3(_1316, _1318, _1306);
    float4 _1329 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3990, float3(0.0), isnan(_3990)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3990, float3(0.0), isnan(_3990)), level(0.0)).xyzw;
    float _1331 = _1329.x;
    float _1333 = _1329.y;
    float _1335 = _1329.z;
    float _1337 = _1329.w;
    float2 _4006 = float2(_1326, _1308);
    float3 _1341 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4006, float2(0.0), isnan(_4006)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4006, float2(0.0), isnan(_4006)), level(0.0)).xyz;
    float _1343 = _1341.x;
    float _1345 = _1341.y;
    float _1347 = _1341.z;
    bool _1349 = _194 > 0.5;
    float _1351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1353 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1355 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _1353;
    int _1357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1359 = _1357 != 0;
    float _1361 = _1200 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1363 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1365 = _1363 != 0;
    float _1367 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1369 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _1367;
    int _1371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1373 = _1371 != 0;
    float _1375 = _1355 * _1355;
    float _1377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_206)
    {
        bool _1379 = _200 > 0.5;
        _1082 = _1379;
    }
    bool _1381 = _1082;
    float _1383 = fma(_1369, _1369, _1375);
    int _1385 = _1349 ? as_type<int>(_216) : as_type<int>(_174);
    float _1387 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1389 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _1387;
    float _1391 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1393 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1395 = _1373 ? as_type<float>(_1385) : _174;
    float _1397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1399 = fma(_1389, _1389, _1383);
    int _1401 = as_type<int>(_1351);
    if (_1359)
    {
        float _1403 = _240 ? _216 : _174;
        _222 = _1403;
    }
    float _1405 = _222;
    if (_206)
    {
        float _1407 = -_184;
        float _1409 = _1407 + 1.0;
        _1401 = as_type<int>(_1409);
    }
    int _1411 = _1401;
    int _1413 = 0;
    if (_1365)
    {
        float _1415 = -_184;
        float _1417 = _1415 + 1.0;
        _1413 = as_type<int>(_1417);
    }
    int _1419 = _1413;
    float _1421 = fma(_1393, _1395, -0.5);
    float _1423 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1391);
    float _1425 = in.m_57.w;
    float _1427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_206)
    {
        float _1429 = _1381 ? as_type<float>(_1411) : _184;
        _366 = _1429;
    }
    float _1431 = _366;
    float _1433 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1365)
    {
        float _1435 = _1349 ? as_type<float>(_1419) : _184;
        _224 = _1435;
    }
    float _1437 = _224;
    float _1439 = -_552;
    float _1441 = fma(_698, _1421, _1439);
    bool _1443 = _882 != 0.0;
    bool _1445 = isnan(_882);
    bool _1447 = _1443 || _1445;
    bool _1449 = isnan(0.0);
    bool _1451 = _1447 || _1449;
    float _1453 = fma(_1433, _1431, -0.5);
    float _1455 = in.m_57.z;
    float _1457 = sqrt(_1399);
    float _1459 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1461 = fma(_660, _1453, _546);
    float _1463 = _1441 + 0.5;
    float _1465 = fma(_1459, _1405, -0.5);
    bool _1467 = _568 == 0.0;
    bool _1469 = !_1451;
    bool _1471 = _1467 && _1469;
    float _1473 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1423);
    float _1475 = rsqrt(_1399);
    float _1477 = _1427 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1479 = -_692;
    float _1481 = fma(_700, _1465, _1479);
    bool _1483 = _574 == 0.0;
    bool _1485 = _1483 && _1471;
    float _1487 = fma(_1477, _1437, -0.5);
    float _1489 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1473);
    out.m_65.y = _554;
    float _1491 = precise::max(0.0, _1457);
    float _1493 = fma(_682, _1487, _704);
    float _1495 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1497 = in.m_67.x;
    float _1499 = in.m_67.y;
    float _1501 = in.m_67.z;
    float _1503 = in.m_67.w;
    float _1505 = precise::min(_1491, 1000.0);
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1509 = _1493 + 0.5;
    out.m_69.w = _1495;
    float _1511 = _1475 * 100.0;
    float _1513 = _1505 * 0.001000000047497451305389404296875;
    float _1515 = _1461 + 0.5;
    out.m_71.w = _1507;
    float _1517 = exp2(_1361);
    float _1519 = _1513 * _1511;
    out.m_73.x = _1515;
    out.m_73.y = _1463;
    out.m_73.z = _310;
    out.m_73.w = _312;
    float _1521 = _1481 + 0.5;
    float _1523 = -_1519;
    float _1525 = fma(_1369, _1523, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1527 = -_1519;
    float _1529 = fma(_1389, _1527, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1531 = in.m_75.x;
    float _1533 = in.m_75.y;
    float _1535 = in.m_75.z;
    out.m_77.x = _1509;
    out.m_77.y = _1521;
    float _1537 = _874 * _1499;
    float _1539 = -_1499;
    float _1541 = _832 * _1539;
    float _1543 = _878 * _1499;
    float _1545 = -_1517;
    float _1547 = _1545 + 1.0;
    float _1549 = fma(_868, _1497, _1537);
    float _1551 = fma(_876, _1497, _1541);
    float _1553 = fma(_860, _1497, _1543);
    float _1555 = _1547 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1557 = fma(_864, _1501, _1549);
    float _1559 = fma(_880, _1501, _1551);
    float _1561 = fma(_870, _1501, _1553);
    out.m_65.z = _1455;
    float _1563 = _1557 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1565 = _1557 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1567 = _1557 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_65.w = _1425;
    float _1569 = _1509;
    float _1571 = _1521;
    float _1573 = _1559;
    float _1575 = _1531;
    if (_1485)
    {
        _708 = _1531;
    }
    float _1577 = _708;
    float _1579 = fma(_1559, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1563);
    float _1581 = fma(_1559, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1565);
    float _1583 = fma(_1559, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1567);
    float _1585 = _1577;
    float _1587 = _1579;
    if (_1485)
    {
        _1569 = _1533;
    }
    float _1589 = _1569;
    float _1591 = fma(_1561, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1579);
    float _1593 = _1589;
    if (_1485)
    {
        _1571 = _1535;
    }
    float _1595 = _1571;
    float _1597 = fma(_1561, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1581);
    float _1599 = _1595;
    if (_1485)
    {
        _1573 = _1577;
    }
    float _1601 = _1573;
    float _1603 = fma(_1561, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1583);
    float _1605 = _1601;
    if (!_1485)
    {
        _1585 = _1531;
    }
    float _1607 = _1585;
    out.m_79.x = _1525;
    if (_1485)
    {
        _1587 = _1589;
    }
    float _1609 = _1587;
    float _1611 = _1609;
    if (_1485)
    {
        _1575 = _1595;
    }
    float _1613 = _1575;
    float _1615 = _1501 * _1607;
    float _1617 = _1613;
    if (!_1485)
    {
        _1593 = _1533;
    }
    float _1619 = _1593;
    out.m_81.x = _1591;
    out.m_81.y = _1597;
    out.m_81.z = _1603;
    if (!_1485)
    {
        _1599 = _1535;
    }
    float _1621 = _1599;
    if (!_1485)
    {
        float _1623 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1607);
        _1605 = _1623;
    }
    float _1625 = _1605;
    float _1627 = _1497 * _1619;
    if (!_1485)
    {
        float _1629 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1619);
        _1611 = _1629;
    }
    float _1631 = _1611;
    float _1633 = _1499 * _1621;
    float _1635 = -_1615;
    float _1637 = fma(_1497, _1621, _1635);
    float _1639 = -_1627;
    float _1641 = fma(_1499, _1607, _1639);
    if (!_1485)
    {
        float _1643 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1621);
        _1617 = _1643;
    }
    float _1645 = _1617;
    float _1647 = -_1633;
    float _1649 = fma(_1501, _1619, _1647);
    float _1651 = _1637 * _1503;
    float _1653 = _874 * _1631;
    float _1655 = _1641 * _1503;
    float _1657 = _1649 * _1503;
    float _1659 = _874 * _1651;
    float _1661 = -_1631;
    float _1663 = _832 * _1661;
    float _1665 = _878 * _1631;
    float _1667 = fma(_868, _1625, _1653);
    float _1669 = -_1651;
    float _1671 = _832 * _1669;
    float _1673 = fma(_868, _1657, _1659);
    float _1675 = _878 * _1651;
    float _1677 = fma(_876, _1625, _1663);
    float _1679 = fma(_860, _1625, _1665);
    float _1681 = fma(_876, _1657, _1671);
    float _1683 = fma(_864, _1655, _1673);
    float _1685 = fma(_860, _1657, _1675);
    float _1687 = fma(_864, _1645, _1667);
    float _1689 = fma(_880, _1655, _1681);
    float _1691 = _1683 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1693 = _1683 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1695 = fma(_870, _1655, _1685);
    float _1697 = fma(_880, _1645, _1677);
    float _1699 = fma(_1689, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1691);
    float _1701 = fma(_870, _1645, _1679);
    float _1703 = fma(_1689, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1693);
    float _1705 = _1687 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1707 = _1687 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1709 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1699);
    float _1711 = _1687 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1713 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1703);
    float _1715 = _1683 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1717 = fma(_1697, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1705);
    float _1719 = _1489 + _1264;
    float _1721 = fma(_1697, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1707);
    float _1723 = fma(_1697, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1711);
    float _1725 = fma(_1689, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1715);
    float _1727 = _1719 * 0.5;
    float _1729 = fma(_1701, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1723);
    float _1731 = -_1555;
    float _1733 = _1731 + 1.0;
    float _1735 = fma(_1701, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1717);
    float _1737 = fma(_1701, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1721);
    out.m_83.z = _1727;
    out.m_83.w = _1264;
    bool _1739 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1741 = isnan(_1044);
    bool _1743 = _1739 || _1741;
    bool _1745 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1747 = _1743 || _1745;
    float _1749 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1725);
    out.m_79.z = _1529;
    out.gl_Position.x = _1300;
    out.gl_Position.y = _1302;
    out.gl_Position.z = _1489;
    out.gl_Position.w = _1264;
    out.m_85.x = _1735;
    out.m_85.y = _1737;
    out.m_85.z = _1729;
    out.m_87.x = _1020;
    out.m_87.y = _1018;
    out.m_87.z = _1022;
    out.m_89.x = _1709;
    out.m_89.y = _1713;
    out.m_89.z = _1749;
    float _1751 = _1749;
    float _1753 = _1713;
    float _1755 = _1709;
    if (!_1747)
    {
        _1751 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1757 = _1751;
    float _1759 = _1757;
    float _1761 = _1757;
    if (!_1747)
    {
        _1753 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1763 = _1753;
    float _1765 = _1763;
    float _1767 = _1763;
    if (!_1747)
    {
        _1755 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1769 = _1755;
    float _1771 = _1555 * _1322;
    float _1773 = _1337 * _1771;
    float _1775 = _1337 * _1733;
    float _1777 = _1347 * _1771;
    float _1779 = fma(_1343, _1773, _1331);
    float _1781 = fma(_1345, _1773, _1333);
    float _1783 = fma(_1337, _1777, _1335);
    out.m_91.x = _1779;
    out.m_91.y = _1781;
    out.m_91.z = _1783;
    out.m_91.w = _1775;
    bool _1785 = !_1747;
    float _1787 = _1769;
    float _1789 = _1769;
    if (!_1785)
    {
        bool _1791 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1793 = isnan(_1044);
        bool _1795 = _1791 || _1793;
        bool _1797 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1799 = _1795 || _1797;
        if (!_1799)
        {
            float _1801 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1803 = _1044 + _1801;
            float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1807 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1805;
            float _1809 = 1.0 / _1807;
            float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1813 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1815 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1817 = _1815 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1819 = _1803 * _1809;
            float _1821 = precise::clamp(_1819, 0.0, 1.0);
            float _1823 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1825 = _1823 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1827 = fma(_1821, _1817, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1829 = fma(_1821, _1825, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1831 = fma(_1821, _1813, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1767 = _1831;
            _1761 = _1829;
            _1789 = _1827;
            _1833 = true;
        }
        else
        {
            bool _1835 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1837 = isnan(_1044);
            bool _1839 = _1835 || _1837;
            bool _1841 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1843 = _1839 || _1841;
            if (!_1843)
            {
                _1759 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1845 = _1759;
            _1761 = _1845;
            if (!_1843)
            {
                _1765 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1847 = _1765;
            _1767 = _1847;
            if (!_1843)
            {
                _1787 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1849 = _1787;
            bool _1851 = !_1843;
            _1789 = _1849;
            if (!_1851)
            {
                bool _1853 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1855 = isnan(_1044);
                bool _1857 = _1853 || _1855;
                bool _1859 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1861 = _1857 || _1859;
                if (!_1861)
                {
                    float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1865 = _1044 + _1863;
                    float _1867 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1869 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1867;
                    float _1871 = 1.0 / _1869;
                    float _1873 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1875 = _1873 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1877 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1879 = _1877 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1881 = _1865 * _1871;
                    float _1883 = precise::clamp(_1881, 0.0, 1.0);
                    float _1885 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1887 = _1885 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1889 = fma(_1883, _1879, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1891 = fma(_1883, _1887, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1893 = fma(_1883, _1875, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1767 = _1893;
                    _1761 = _1891;
                    _1789 = _1889;
                    _1833 = true;
                }
                else
                {
                    _1767 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1761 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1789 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1833 = false;
    float _1895 = _1767;
    float _1897 = _1761;
    float _1899 = _1789;
    float _1901 = _1895 * 0.586610972881317138671875;
    bool _1903 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_93.x = 0.0;
    float _1905 = fma(_1897, 0.298911988735198974609375, _1901);
    float _1907 = fma(_1899, 0.114477999508380889892578125, _1905);
    float _1909 = -_1907;
    float _1911 = _1909 + _1897;
    float _1913 = -_1907;
    float _1915 = _1913 + _1895;
    float _1917 = -_1907;
    float _1919 = _1917 + _1899;
    float _1921 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1923 = fma(_1911, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1907);
    float _1925 = fma(_1915, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1907);
    float _1927 = fma(_1919, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1907);
    out.m_49.x = _1921;
    out.m_95.x = _1923;
    out.m_95.y = _1925;
    out.m_95.z = _1927;
    if (!_1903)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1929 = -_1018;
    float _1931 = _1929 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1933 = -_1020;
    float _1935 = _1933 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1937 = -_1022;
    float _1939 = _1937 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1941 = _1931 * _1931;
    float _1943 = fma(_1935, _1935, _1941);
    float _1945 = fma(_1939, _1939, _1943);
    float _1947 = sqrt(_1945);
    float _1949 = rsqrt(_1945);
    float _1951 = -_1947;
    float _1953 = _1951 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1955 = _1953 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1957 = precise::clamp(_1955, 0.0, 1.0);
    float _1959 = _1935 * _1949;
    float _1961 = _1931 * _1949;
    float _1963 = abs(_1957);
    float _1965 = log2(_1963);
    float _1967 = _1939 * _1949;
    float _1969 = _1959 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1971 = _1737 * _1961;
    float _1973 = -_1961;
    float _1975 = -_1969;
    float _1977 = fma(_1973, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1975);
    float _1979 = fma(_1735, _1959, _1971);
    float _1981 = -_1967;
    float _1983 = fma(_1981, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1977);
    float _1985 = fma(_1729, _1967, _1979);
    float _1987 = precise::clamp(_1985, 0.0, 1.0);
    float _1989 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1991 = _1983 + _1989;
    float _1993 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1995 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1997 = precise::clamp(_1995, 0.0, 1.0);
    float _1999 = exp2(_1993);
    float _2001 = _1999 * _1997;
    float _2003 = _1987 * _2001;
    float _2005 = _2003 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2007 = _2003 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2009 = _2003 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2005;
    out.m_93.y = _2007;
    out.m_93.z = _2009;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

