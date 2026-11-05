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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
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
    float4 m_55 [[user(locn1)]];
    float4 m_89 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_65 [[user(locn9)]];
    float4 m_75 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
    float4 m_85 [[user(locn12)]];
    float4 m_83 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_61 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_63 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2003 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = in.m_46.w;
    float _107 = trunc(_103);
    int _110 = int(_107);
    float _112 = -_105;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _114;
    bool _118 = _110 >= 1;
    float _120 = 0.0;
    float _122 = _105;
    float _124 = _114;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _120;
    if (!_118)
    {
        out.m_51.x = 0.0;
    }
    int _128 = 0;
    if (!_118)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2299 = as_type<float>(_132);
        out.gl_Position.z = _2299;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _136 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_105);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = in.m_53.x;
    float _148 = float(_110);
    float _150 = in.m_53.y;
    bool _152 = _114 >= _148;
    bool _154 = !_144;
    bool _156 = _152 || _154;
    float _158 = 1.0 / _148;
    float _160 = in.m_53.z;
    float _162 = in.m_53.w;
    if (_156)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _122;
    if (_156)
    {
        out.m_51.x = 0.0;
    }
    if (_156)
    {
        float _166 = _164 * 5.0;
        _134 = as_type<int>(_166);
    }
    int _168 = _134;
    float _170 = _114 * _158;
    out.m_55.x = _146;
    int _172 = as_type<int>(_146);
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2371 = as_type<float>(_168);
        out.gl_Position.z = _2371;
    }
    out.m_55.y = _150;
    out.m_55.z = _160;
    out.m_55.w = _162;
    out.m_49.x = _170;
    float _174 = _162;
    if (_156)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _176 = in.m_57.x;
    float _178 = in.m_57.y;
    float _180 = in.m_57.z;
    float _182 = _160 * 2.0;
    float _184 = _146 * 2.0;
    float _186 = _150 * 2.0;
    float _188 = floor(_182);
    float _190 = _146 + _160;
    int _192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _194 = _192 != 0;
    float _196 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _198 = _150 + _160;
    float _200 = _190 + (-1.0);
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _204 = floor(_184);
    float _206 = _198 + (-1.0);
    float _208 = -_202;
    float _210 = fma(_196, 2.0, _208);
    float _212 = _150 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _214 = _146 + _150;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _218 = _184 + (-1.0);
    float _220 = floor(_186);
    bool _222 = _188 > 0.0;
    float _224 = _214 + (-1.0);
    float _226 = _180 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _228 = _176 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _230 = _178 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _232 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _234 = _200;
    float _236 = _182;
    if (_194)
    {
        _234 = _146;
    }
    float _238 = _234;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _242 = _238;
    if (!_194)
    {
        _242 = _160;
    }
    float _244 = _242;
    float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _248 = log2(_246);
    bool _250 = _204 > 0.0;
    float _252 = fma(_212, -2.0, _240);
    bool _254 = _188 >= 0.0;
    bool _256 = isnan(_188);
    bool _258 = _254 || _256;
    bool _260 = isnan(0.0);
    bool _262 = _258 || _260;
    float _264 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _266 = _204 >= 0.0;
    bool _268 = isnan(_204);
    bool _270 = _266 || _268;
    bool _272 = isnan(0.0);
    bool _274 = _270 || _272;
    float _276 = _244 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _278 = _186 + (-1.0);
    bool _280 = _220 > 0.0;
    float _282 = -_216;
    float _284 = fma(_276, 2.0, _282);
    bool _286 = _220 >= 0.0;
    bool _288 = isnan(_220);
    bool _290 = _286 || _288;
    bool _292 = isnan(0.0);
    bool _294 = _290 || _292;
    float _296 = _278 * _278;
    int _298 = _262 ? 0 : 1;
    float _300 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _302 = _274 ? 0 : 1;
    float _304 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _306 = ~_298;
    int _308 = _306 + 1;
    int _310 = _308 + 1;
    int _312 = ~_302;
    int _314 = _312 + 1;
    int _316 = _314 + 1;
    int _318 = _310;
    int _320 = _316;
    float _322 = _304;
    if (!_222)
    {
        int _324 = ~_298;
        int _326 = _324 + 1;
        _318 = _326;
    }
    int _328 = _318;
    float _330 = fma(_218, _218, _296);
    float _332 = _330;
    if (!_250)
    {
        int _334 = ~_302;
        int _336 = _334 + 1;
        _320 = _336;
    }
    int _338 = _320;
    float _340 = _182 + (-1.0);
    float _342 = fma(_340, _340, _330);
    if (!_194)
    {
        _236 = _150;
    }
    float _344 = _236;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _348 = _344;
    if (_194)
    {
        _348 = _146;
    }
    float _350 = _348;
    float _352 = rsqrt(_342);
    bool _354 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _358 = _354 || _356;
    bool _360 = isnan(1.0);
    bool _362 = _358 || _360;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _366 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[83].z, _346);
    if (!_194)
    {
        _332 = _160;
    }
    float _368 = _332;
    float _370 = _350 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _372 = _368;
    float _374 = _370;
    if (_194)
    {
        _372 = _150;
    }
    float _376 = _372;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _380 = _294 ? 0 : 1;
    float _382 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[83].w, _364);
    float _384 = -_378;
    float _386 = fma(_370, 2.0, _384);
    float _388 = _376;
    if (!_194)
    {
        _374 = _160;
    }
    float _390 = _374;
    float _392 = 0.0;
    float _394 = _390;
    if (!_362)
    {
        float _396 = _304 * _304;
        float _398 = _396 * 0.5;
        _392 = _398;
    }
    float _400 = _392;
    float _402 = _278 * _352;
    float _404 = _218 * _352;
    float _406 = _340 * _352;
    float _408 = _400;
    if (_194)
    {
        _388 = _150;
    }
    float _410 = _388;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _414 = _410;
    if (!_362)
    {
        float _416 = _400 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _408 = _416;
    }
    float _418 = _408;
    float _420 = _418;
    if (_194)
    {
        _394 = _150;
    }
    float _422 = _394;
    if (!_194)
    {
        _414 = _146;
    }
    float _424 = _414;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _428 = ~_380;
    int _430 = _428 + 1;
    int _432 = _430 + 1;
    float _434 = _422 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _436 = _432;
    if (!_280)
    {
        int _438 = ~_380;
        int _440 = _438 + 1;
        _436 = _440;
    }
    int _442 = _436;
    float _444 = _424 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _446 = !_362;
    if (!_446)
    {
        float _448 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _450 = log2(_448);
        float _452 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _454 = _452 + 1.0;
        float _456 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _458 = _304 * _450;
        float _460 = 1.0 / _454;
        float _462 = _456 * 0.693147182464599609375;
        float _464 = exp2(_458);
        float _466 = 1.0 / _462;
        float _468 = _464 + (-1.0);
        float _470 = -_468;
        float _472 = fma(_470, _466, _304);
        float _474 = _472 * _460;
        float _476 = _474 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _420 = _476;
    }
    float _478 = _420;
    bool _480 = !_362;
    if (!_480)
    {
        float _482 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _484 = log2(_482);
        float _486 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _488 = _486 + 1.0;
        float _490 = 1.0 / _488;
        float _492 = _304 * _484;
        float _494 = exp2(_492);
        float _496 = -_494;
        float _498 = _496 + 1.0;
        float _500 = _498 * _490;
        _322 = _500;
    }
    float _502 = _322;
    float _504 = fma(_444, -2.0, _412);
    float _506 = fma(_434, -2.0, _426);
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _510 = _508 != 0;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _514 = _512 != 0;
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _518 = _516 != 0;
    float _520 = _248 * _114;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _524 = in.m_59.x;
    float _526 = in.m_59.y;
    float _528 = in.m_59.z;
    float _530 = exp2(_520);
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _534 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[88].z, _522);
    bool _536 = !_510;
    int _538 = _536 ? 0 : 1;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _542 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _532);
    float _544 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[76].y, _252);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _548 = 1.0 + _546;
    int _550 = abs(_538);
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _554 = float(_328);
    float _556 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[78].w, _540);
    bool _558 = !_514;
    int _560 = _558 ? 0 : 1;
    float _562 = 1.0 / _548;
    float _564 = float(_550);
    float _566 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[88].w, _552);
    bool _568 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _570 = isnan(1.0);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _576 = _572 || _574;
    float _578 = -_114;
    float _580 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[76].x, _210);
    int _582 = abs(_560);
    float _584 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].w, _556);
    float _586 = -_114;
    float _588 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[81].x, _386);
    float _590 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[86].y, _504);
    float _592 = _564 * _554;
    float _594 = -_530;
    float _596 = _594 + 1.0;
    float _598 = in.m_61.x;
    float _600 = in.m_61.y;
    float _602 = in.m_61.z;
    float _604 = float(_338);
    float _606 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[87].z, _534);
    bool _608 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _610 = isnan(0.0);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _616 = _612 || _614;
    float _618 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].z, _542);
    float _620 = _402 * _402;
    bool _622 = !_518;
    int _624 = _622 ? 0 : 1;
    float _626 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[87].w, _566);
    float _628 = _616 ? _596 : 0.0;
    float _630 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].z, _366);
    float _632 = float(_582);
    float _634 = -_114;
    float _636 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[86].x, _284);
    int _638 = abs(_624);
    float _640 = _592 * (-2.0);
    float _642 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].w, _382);
    float _644 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[81].y, _506);
    if (_576)
    {
        float _646 = _628 * _562;
        _124 = _646;
    }
    float _648 = _124;
    float _650 = _632 * _604;
    float _652 = fma(_404, _404, _620);
    float _654 = _146 + (-0.5);
    float _656 = float(_442);
    float _658 = fma(_640, _524, _524);
    float _660 = float(_638);
    float _662 = _650 * (-2.0);
    float _664 = fma(_300, _640, _300);
    float _666 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[196].x, _658);
    float _668 = _228 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _670 = _660 * _656;
    float _672 = fma(_264, _662, _264);
    float _674 = fma(_662, _526, _526);
    float _676 = _150 + (-0.5);
    float _678 = fma(_664, _648, _666);
    float _680 = _670 * (-2.0);
    float _682 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _598);
    float _684 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[196].y, _674);
    float _686 = _678 * 0.15915493667125701904296875;
    float _688 = fma(_406, _406, _652);
    float _690 = in.m_46.x;
    float _692 = in.m_46.y;
    float _694 = in.m_46.z;
    float _696 = fma(_672, _648, _684);
    float _698 = _682 * _668;
    float _700 = fma(_680, _528, _528);
    float _702 = _160 + (-0.5);
    float _704 = rsqrt(_688);
    float _706 = _226 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _708 = fma(_232, _680, _232);
    float _710 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[196].z, _700);
    float _712 = in.m_57.w;
    float _714 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _600);
    float _716 = _230 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _718 = _686 * 6.283185482025146484375;
    float _720 = sin(_718);
    float _722 = _696 * 0.15915493667125701904296875;
    float _724 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _602);
    float _726 = in.m_44.x;
    float _728 = in.m_44.y;
    float _730 = in.m_44.z;
    float _732 = _714 * _716;
    float _734 = _478 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _736 = _724 * _706;
    float _738 = fma(_708, _648, _710);
    float _740 = _686 * 6.283185482025146484375;
    float _742 = cos(_740);
    float _744 = _170 * 2.5;
    float _746 = precise::clamp(_744, 0.0, 1.0);
    float _748 = _404 * _704;
    float _750 = fma(_502, _690, _734);
    float _752 = _478 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _754 = _402 * _704;
    float _756 = _406 * _704;
    float _758 = _722 * 6.283185482025146484375;
    float _760 = sin(_758);
    float _762 = fma(_502, _692, _752);
    float _764 = fma(_170, 1.66666662693023681640625, -0.666666686534881591796875);
    float _766 = precise::clamp(_764, 0.0, 1.0);
    float _768 = _738 * 0.15915493667125701904296875;
    float _770 = _722 * 6.283185482025146484375;
    float _772 = cos(_770);
    float _774 = -_746;
    float _776 = _774 + 1.0;
    float _778 = _766 * _766;
    float _780 = _478 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _782 = fma(_762, _712, _728);
    float _784 = -_776;
    float _786 = fma(_784, _776, 1.0);
    float _788 = -_778;
    float _790 = _788 + 1.0;
    float _792 = fma(_502, _694, _780);
    float _794 = _768 * 6.283185482025146484375;
    float _796 = cos(_794);
    float _798 = _162 * 6.0;
    float _800 = _790 * _786;
    float _802 = fma(_750, _712, _726);
    float _804 = _742 * _760;
    float _806 = _720 * _760;
    float _808 = _790 * _798;
    float _810 = fma(_792, _712, _730);
    float _812 = _768 * 6.283185482025146484375;
    float _814 = sin(_812);
    float _816 = _742 * _772;
    float _818 = _720 * _772;
    float _820 = _808 * 0.15915493667125701904296875;
    float _822 = _742 * _796;
    float _824 = _720 * _796;
    float _826 = _772 * _796;
    float _828 = _760 * _796;
    float _830 = _822 * _736;
    float _832 = _820 * 6.283185482025146484375;
    float _834 = cos(_832);
    float _836 = -_736;
    float _838 = _814 * _836;
    float _840 = fma(_814, _816, _806);
    float _842 = -_804;
    float _844 = fma(_814, _818, _842);
    float _846 = _824 * _736;
    float _848 = fma(_826, _698, _838);
    float _850 = _782 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _852 = -_818;
    float _854 = fma(_814, _804, _852);
    float _856 = fma(_840, _698, _830);
    float _858 = fma(_814, _806, _816);
    float _860 = fma(_844, _698, _846);
    float _862 = _782 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _864 = _782 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _866 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[4].x, _850);
    float _868 = -_732;
    float _870 = fma(_854, _868, _856);
    float _872 = -_732;
    float _874 = fma(_828, _872, _848);
    float _876 = -_732;
    float _878 = fma(_858, _876, _860);
    float _880 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[5].x, _862);
    float _882 = _820 * 6.283185482025146484375;
    float _884 = sin(_882);
    float _886 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[6].x, _864);
    float _888 = _870 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _890 = _870 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _892 = _870 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _894 = fma(_810, (*spvDescriptorSet0.vp_c10)._m0[6].z, _886);
    float _896 = fma(_874, (*spvDescriptorSet0.vp_c10)._m0[8].x, _888);
    float _898 = fma(_874, (*spvDescriptorSet0.vp_c10)._m0[9].x, _890);
    float _900 = fma(_874, (*spvDescriptorSet0.vp_c10)._m0[10].x, _892);
    float _902 = fma(_810, (*spvDescriptorSet0.vp_c10)._m0[5].z, _880);
    float _904 = fma(_810, (*spvDescriptorSet0.vp_c10)._m0[4].z, _866);
    float _906 = fma(_878, (*spvDescriptorSet0.vp_c10)._m0[8].z, _896);
    float _908 = fma(_878, (*spvDescriptorSet0.vp_c10)._m0[9].z, _898);
    float _910 = fma(_878, (*spvDescriptorSet0.vp_c10)._m0[10].z, _900);
    float _912 = _894 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _914 = _902 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _916 = -_834;
    float _918 = _916 + 1.0;
    float _920 = _904 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _922 = _748 * _884;
    float _924 = fma(_908, _800, _914);
    float _926 = _754 * _918;
    float _928 = fma(_906, _800, _920);
    float _930 = fma(_910, _800, _912);
    float _932 = _754 * _884;
    float _934 = _756 * _884;
    float _936 = _748 * _918;
    float _938 = fma(_756, _926, _922);
    float _940 = -_914;
    float _942 = _940 + _924;
    float _944 = _756 * _756;
    float _946 = -_932;
    float _948 = fma(_756, _936, _946);
    float _950 = -_920;
    float _952 = _950 + _928;
    float _954 = _938 * _942;
    float _956 = fma(_918, _944, _834);
    float _958 = -_934;
    float _960 = fma(_754, _936, _958);
    float _962 = -_912;
    float _964 = _962 + _930;
    float _966 = fma(_948, _952, _954);
    float _968 = fma(_748, _936, _834);
    float _970 = _960 * _942;
    float _972 = fma(_756, _936, _932);
    float _974 = fma(_956, _964, _966);
    float _976 = fma(_754, _926, _834);
    float _978 = fma(_968, _952, _970);
    float _980 = fma(_754, _936, _934);
    float _982 = _912 + _974;
    float _984 = _976 * _942;
    float _986 = fma(_972, _964, _978);
    float _988 = -_922;
    float _990 = fma(_756, _926, _988);
    float _992 = fma(_170, 8.0, _982);
    float _994 = fma(_980, _952, _984);
    float _996 = _920 + _986;
    float _998 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1000 = _992 + _998;
    float _1002 = fma(_990, _964, _994);
    float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1006 = _996 + _1004;
    float _1008 = _1000 * _1000;
    float _1010 = _914 + _1002;
    float _1012 = fma(_1006, _1006, _1008);
    float _1014 = fma(_778, -40.0, _1010);
    float _1016 = sqrt(_1012);
    bool _1018 = _1016 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1020 = _778;
    float _1022 = _914;
    float _1024 = _1010;
    float _1026 = _1014;
    float _1028 = _1006;
    float _1030 = _820;
    float _1032 = _1000;
    if (!_1018)
    {
        _1020 = _996;
    }
    float _1034 = _1020;
    float _1036 = _1034;
    if (!_1018)
    {
        _1022 = _992;
    }
    float _1038 = _1022;
    float _1040 = _1038;
    if (!_1018)
    {
        _1024 = _1014;
    }
    float _1042 = _1024;
    bool _1044 = !_1018;
    float _1046 = _1042;
    if (!_1044)
    {
        float _1048 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1052 = _1016 + _1050;
        float _1054 = rsqrt(_1012);
        float _1056 = _1052 * _1048;
        float _1058 = _1014 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1060 = _1056 * 0.15915493667125701904296875;
        float _1062 = _1060 * 6.283185482025146484375;
        float _1064 = cos(_1062);
        float _1066 = _1060 * 6.283185482025146484375;
        float _1068 = sin(_1066);
        float _1070 = _1064 + (-1.0);
        float _1072 = _1070 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1074 = fma(_1068, _1058, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1076 = fma(_1014, _1064, _1072);
        float _1078 = _1054 * _1074;
        float _1080 = fma(_1006, _1078, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1082 = fma(_1000, _1078, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1046 = _1076;
        _1036 = _1080;
        _1040 = _1082;
    }
    float _1084 = _1046;
    float _1086 = _1036;
    float _1088 = _1040;
    float _1090 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1092 = _1084 + _1090;
    float _1094 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1096 = _1086 + _1094;
    float _1098 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1100 = _1088 + _1098;
    float _1102 = _1092 * _1092;
    float _1104 = fma(_1096, _1096, _1102);
    float _1106 = fma(_1100, _1100, _1104);
    float _1108 = rsqrt(_1106);
    float _1110 = sqrt(_1106);
    float _1112 = _1108 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1114 = _1096 * _1112;
    float _1116 = _1100 * _1112;
    float _1118 = _1114 * _1114;
    float _1120 = _1116 * _1116;
    float _1122 = _1118 + _1120;
    float _1124 = sqrt(_1122);
    bool _1126 = _1124 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1128 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1130 = _1124 + _1128;
    float _1132 = _1108;
    float _1134 = _1130;
    float _1136 = _1092;
    if (_1126)
    {
        float _1138 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1132 = _1138;
    }
    float _1140 = _1132;
    if (_1126)
    {
        float _1142 = rsqrt(_1122);
        _1026 = _1142;
    }
    float _1144 = _1026;
    float _1146 = _1144;
    if (_1126)
    {
        float _1148 = _1130 * _1140;
        _1134 = _1148;
    }
    float _1150 = _1134;
    if (_1126)
    {
        float _1152 = _1150 * 0.15915493667125701904296875;
        _1028 = _1152;
    }
    float _1154 = _1028;
    float _1156 = _1100;
    if (_1126)
    {
        float _1158 = _1154 * 6.283185482025146484375;
        float _1160 = sin(_1158);
        _1156 = _1160;
    }
    float _1162 = _1156;
    float _1164 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1166 = precise::max(0.0, _1164);
    float _1168 = _1140;
    float _1170 = _1166;
    if (_1126)
    {
        float _1172 = _1154 * 6.283185482025146484375;
        float _1174 = cos(_1172);
        _1168 = _1174;
    }
    float _1176 = _1168;
    float _1178 = -_1112;
    float _1180 = -_1166;
    float _1182 = fma(_1092, _1178, _1180);
    if (_1126)
    {
        float _1184 = _1182 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1136 = _1184;
    }
    float _1186 = _1136;
    float _1188 = _1186;
    float _1190 = _1162;
    if (_1126)
    {
        float _1192 = fma(_1162, _1186, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1188 = _1192;
    }
    float _1194 = _1188;
    float _1196 = _1194;
    if (!_1126)
    {
        _1190 = _1182;
    }
    float _1198 = _1190;
    float _1200 = _1198;
    float _1202 = _1176;
    if (_1126)
    {
        float _1204 = _1176 + (-1.0);
        _1170 = _1204;
    }
    float _1206 = _1170;
    float _1208 = _1206;
    if (_1126)
    {
        float _1210 = _1144 * _1194;
        _1030 = _1210;
    }
    float _1212 = _1030;
    if (!_1126)
    {
        _1146 = _1114;
    }
    float _1214 = _1146;
    float _1216 = _1214;
    if (_1126)
    {
        float _1218 = _1206 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1032 = _1218;
    }
    float _1220 = _1032;
    if (_1126)
    {
        float _1222 = _1114 * _1212;
        _1216 = _1222;
    }
    float _1224 = _1216;
    if (!_1126)
    {
        _1208 = _1116;
    }
    float _1226 = _1208;
    float _1228 = _1226;
    if (_1126)
    {
        float _1230 = _1116 * _1212;
        _1228 = _1230;
    }
    float _1232 = _1228;
    if (!_1126)
    {
        _1196 = _1118;
    }
    float _1234 = _1196;
    float _1236 = _1234;
    if (_1126)
    {
        float _1238 = fma(_1182, _1176, _1220);
        _1200 = _1238;
    }
    float _1240 = _1200;
    if (_1126)
    {
        float _1242 = _1224 * _1224;
        _1236 = _1242;
    }
    float _1244 = _1236;
    if (!_1126)
    {
        _1202 = _1120;
    }
    float _1246 = _1202;
    float _1248 = _1246;
    if (_1126)
    {
        float _1250 = _1232 * _1232;
        _1248 = _1250;
    }
    float _1252 = _1248;
    float _1254 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1256 = fma(_1240, _1240, _1244);
    float _1258 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1260 = fma(_1110, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1258);
    float _1262 = precise::clamp(_1260, 0.0, 1.0);
    float _1264 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1266 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1254);
    float _1268 = _1256 + _1252;
    float _1270 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1272 = -_1262;
    float _1274 = _1272 + 1.0;
    float _1276 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1266);
    float _1278 = rsqrt(_1268);
    float _1280 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1282 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1270);
    float _1284 = _1276 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1286 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1288 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1280);
    float _1290 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1282);
    float _1292 = _1284 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1294 = abs(_1274);
    float _1296 = log2(_1294);
    float _1298 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1288);
    float _1300 = _1290 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1302 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1264);
    float _1304 = -_1292;
    float _1306 = fma(_1304, _1286, 1.0);
    float _1308 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1310 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1312 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1302);
    float _1314 = _1278 * _1224;
    float _1316 = _1278 * _1240;
    float _1318 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1310);
    float _1320 = _1278 * _1232;
    float _1322 = _1314 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1324 = _1312 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1326 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1318);
    float _1328 = log2(_1306);
    float _1330 = -_1322;
    float _1332 = fma(_1316, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1330);
    float _1334 = _1296 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1336 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1326);
    float _1338 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1340 = -_1320;
    float _1342 = fma(_1340, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1332);
    float _1344 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1346 = exp2(_1334);
    float _1348 = fma(_1342, -0.5, 0.5);
    float _1350 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1344);
    float _1352 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1338);
    float _1354 = fma(_1342, 0.5, 0.5);
    float _1356 = _1316 + 1.0;
    float _1358 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1350);
    float _1360 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1352);
    float _1362 = 1.0 / _1336;
    float _1364 = fma(_1354, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1366 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1358);
    float _1368 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1360);
    float _1370 = _1328 * 0.693147182464599609375;
    float _1372 = fma(_1354, _1364, -0.212114393711090087890625);
    float _1374 = sqrt(_1348);
    float _1376 = -_1316;
    float _1378 = fma(_1346, _1356, _1376);
    float _1380 = fma(_1354, _1372, 1.570728778839111328125);
    float _1382 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1384 = _1366 * _1362;
    float _1386 = _1368 * _1362;
    float _1388 = fma(_1384, 0.5, 0.5);
    float _1390 = fma(_1386, -0.5, 0.5);
    float _1392 = _1374 * 0.636619746685028076171875;
    float3 _4332 = float3(_1388, _1390, _1382);
    float _1394 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4332, float3(0.0), isnan(_4332)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4332, float3(0.0), isnan(_4332)), level(0.0)).x;
    float _1396 = -_1380;
    float _1398 = fma(_1392, _1396, 1.0);
    float _1400 = fma(_1378, 0.5, 0.5);
    float3 _4350 = float3(_1388, _1390, _1382);
    float4 _1403 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4350, float3(0.0), isnan(_4350)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4350, float3(0.0), isnan(_4350)), level(0.0)).xyzw;
    float _1405 = _1403.x;
    float _1407 = _1403.y;
    float _1409 = _1403.z;
    float _1411 = _1403.w;
    float2 _4367 = float2(_1398, _1400);
    float3 _1415 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4367, float2(0.0), isnan(_4367)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4367, float2(0.0), isnan(_4367)), level(0.0)).xyz;
    float _1417 = _1415.x;
    float _1419 = _1415.y;
    float _1421 = _1415.z;
    float _1423 = in.m_63.y;
    float _1425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1427 = _162 > 0.5;
    float _1429 = in.m_63.x;
    int _1431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1433 = _1431 != 0;
    float _1435 = _1296 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1437 = _150 > 0.5;
    float _1439 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1443 = _1441 != 0;
    float _1445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1449 = _1447 != 0;
    float _1451 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1439);
    bool _1453 = _160 > 0.5;
    out.m_65.x = _1086;
    out.m_65.y = _1084;
    out.m_65.z = _1088;
    int _1455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1457 = _1455 != 0;
    float _1459 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1451);
    float _1461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1463 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1459);
    float _1465 = -_1423;
    float _1467 = _1465 + 1.0;
    float _1469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1471 = _1445 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1473 = _1423;
    bool _1475 = _1443;
    float _1477 = _1471;
    float _1479 = _1336;
    float _1481 = _1463;
    float _1483 = _1368;
    if (!_1433)
    {
        _174 = _1429;
    }
    float _1485 = _174;
    float _1487 = _1427 ? _1467 : _1423;
    int _1489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1491 = _1489 != 0;
    int _1493 = _1437 ? as_type<int>(_1467) : as_type<int>(_1423);
    float _1495 = exp2(_1435);
    float _1497 = _1491 ? _1487 : _1423;
    float _1499 = _1449 ? as_type<float>(_1493) : _1423;
    float _1501 = _1425 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1503 = _1487;
    float _1505 = _1485;
    int _1507 = as_type<int>(_1501);
    if (!_1433)
    {
        _1503 = _1485;
    }
    float _1509 = _1503;
    float _1511 = _1509;
    if (_1433)
    {
        _1505 = _1429;
    }
    float _1513 = _1505;
    float _1515 = fma(_1501, _1499, -0.5);
    float _1517 = _1513;
    if (_1443)
    {
        float _1519 = _1453 ? _1467 : _1423;
        _1473 = _1519;
    }
    float _1521 = _1473;
    float _1523 = _1461 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1525 = _1523;
    if (_1433)
    {
        bool _1527 = _146 > 0.5;
        _1475 = _1527;
    }
    bool _1529 = _1475;
    if (_1433)
    {
        float _1531 = -_1513;
        float _1533 = _1531 + 1.0;
        _1507 = as_type<int>(_1533);
    }
    int _1535 = _1507;
    int _1537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1539 = _1537 != 0;
    float _1541 = -_544;
    float _1543 = fma(_584, _1515, _1541);
    float _1545 = in.m_67.x;
    float _1547 = in.m_67.y;
    float _1549 = in.m_67.z;
    bool _1551 = _600 != 0.0;
    bool _1553 = isnan(_600);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan(0.0);
    bool _1559 = _1555 || _1557;
    float _1561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1433)
    {
        float _1563 = _1529 ? as_type<float>(_1535) : _1513;
        _1511 = _1563;
    }
    float _1565 = _1511;
    float _1567 = fma(_1497, _1471, -0.5);
    float _1569 = in.m_69.x;
    float _1571 = in.m_69.y;
    float _1573 = in.m_69.z;
    float _1575 = in.m_69.w;
    bool _1577 = _598 == 0.0;
    bool _1579 = !_1559;
    bool _1581 = _1577 && _1579;
    if (_1457)
    {
        float _1583 = -_1513;
        float _1585 = _1583 + 1.0;
        _172 = as_type<int>(_1585);
    }
    int _1587 = _172;
    float _1589 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1591 = fma(_1523, _1521, -0.5);
    float _1593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1595 = _602 == 0.0;
    bool _1597 = _1595 && _1581;
    int _1599 = 0;
    float _1601 = as_type<float>(_1587);
    if (_1539)
    {
        float _1603 = -_1513;
        float _1605 = _1603 + 1.0;
        _1599 = as_type<int>(_1605);
    }
    int _1607 = _1599;
    if (!_1539)
    {
        _1525 = _1513;
    }
    float _1609 = _1525;
    float _1611 = fma(_1589, _1565, -0.5);
    float _1613 = _1609;
    if (!_1457)
    {
        _1477 = _1513;
    }
    float _1615 = _1477;
    float _1617 = -_1495;
    float _1619 = _1617 + 1.0;
    float _1621 = _1615;
    if (_1539)
    {
        float _1623 = _1437 ? as_type<float>(_1607) : _1513;
        _1613 = _1623;
    }
    float _1625 = _1613;
    float _1627 = _1561 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1457)
    {
        float _1629 = _1453 ? as_type<float>(_1587) : _1513;
        _1621 = _1629;
    }
    float _1631 = _1621;
    float _1633 = fma(_618, _1611, _580);
    float _1635 = _1619 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1597)
    {
        _1601 = _1545;
    }
    float _1637 = _1601;
    float _1639 = _1637;
    if (!_1597)
    {
        float _1641 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1545);
        _1639 = _1641;
    }
    float _1643 = _1639;
    float _1645 = _1593 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1647 = _1593;
    if (_1597)
    {
        _1517 = _1547;
    }
    float _1649 = _1517;
    float _1651 = fma(_1627, _1631, -0.5);
    float _1653 = _1569 * _1547;
    float _1655 = _1573 * _1545;
    float _1657 = fma(_1645, _1625, -0.5);
    float _1659 = _1649;
    if (_1597)
    {
        _1647 = _1549;
    }
    float _1661 = _1647;
    float _1663 = _1661;
    if (!_1597)
    {
        float _1665 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1547);
        _1659 = _1665;
    }
    float _1667 = _1659;
    if (!_1597)
    {
        float _1669 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1549);
        _1663 = _1669;
    }
    float _1671 = _1663;
    float _1673 = _1571 * _1549;
    float _1675 = -_1653;
    float _1677 = fma(_1571, _1545, _1675);
    float _1679 = -_1655;
    float _1681 = fma(_1569, _1549, _1679);
    float _1683 = fma(_630, _1651, _588);
    float _1685 = fma(_606, _1657, _636);
    float _1687 = _1633 + 0.5;
    float _1689 = -_1673;
    float _1691 = fma(_1573, _1547, _1689);
    float _1693 = _1677 * _1575;
    float _1695 = _1681 * _1575;
    float _1697 = _1683 + 0.5;
    float _1699 = _1685 + 0.5;
    float _1701 = -_1671;
    float _1703 = _814 * _1701;
    float _1705 = -_1573;
    float _1707 = _814 * _1705;
    float _1709 = -_644;
    float _1711 = fma(_642, _1567, _1709);
    float _1713 = _1691 * _1575;
    float _1715 = -_1693;
    float _1717 = _814 * _1715;
    float _1719 = fma(_826, _1643, _1703);
    float _1721 = _1543 + 0.5;
    float _1723 = _1711 + 0.5;
    float _1725 = fma(_826, _1569, _1707);
    float _1727 = fma(_826, _1713, _1717);
    float _1729 = _822 * _1573;
    float _1731 = _824 * _1573;
    float _1733 = _822 * _1671;
    out.m_71.x = _1687;
    out.m_71.y = _1721;
    out.m_71.z = _1697;
    out.m_71.w = _1723;
    float _1735 = _822 * _1693;
    float _1737 = _824 * _1671;
    float _1739 = fma(_844, _1569, _1731);
    float _1741 = -_590;
    float _1743 = fma(_626, _1591, _1741);
    float _1745 = -_1571;
    float _1747 = fma(_828, _1745, _1725);
    float _1749 = _824 * _1693;
    float _1751 = -_1571;
    float _1753 = fma(_858, _1751, _1739);
    float _1755 = _1743 + 0.5;
    float _1757 = -_1667;
    float _1759 = fma(_828, _1757, _1719);
    float _1761 = fma(_844, _1713, _1749);
    float _1763 = -_1695;
    float _1765 = fma(_828, _1763, _1727);
    bool _1767 = _1110 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1769 = isnan(_1110);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1775 = _1771 || _1773;
    out.m_73.x = _1699;
    out.m_73.y = _1755;
    float _1777 = fma(_840, _1643, _1733);
    float _1779 = fma(_840, _1569, _1729);
    float _1781 = fma(_840, _1713, _1735);
    float _1783 = fma(_844, _1643, _1737);
    float _1785 = -_1667;
    float _1787 = fma(_854, _1785, _1777);
    float _1789 = -_1571;
    float _1791 = fma(_854, _1789, _1779);
    float _1793 = -_1695;
    float _1795 = fma(_854, _1793, _1781);
    float _1797 = -_1667;
    float _1799 = fma(_858, _1797, _1783);
    float _1801 = _1787 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1803 = _1791 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1805 = _1787 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1807 = _1787 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1809 = _1791 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1811 = _1791 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1813 = fma(_1747, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1803);
    float _1815 = _1795 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1817 = fma(_1759, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1801);
    float _1819 = fma(_1747, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1809);
    float _1821 = fma(_1759, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1805);
    float _1823 = fma(_1759, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1807);
    float _1825 = fma(_1747, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1811);
    float _1827 = -_1695;
    float _1829 = fma(_858, _1827, _1761);
    float _1831 = _1795 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1833 = fma(_1765, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1815);
    float _1835 = fma(_1753, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1819);
    float _1837 = _1795 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1839 = fma(_1765, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1831);
    float _1841 = fma(_1829, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1833);
    float _1843 = fma(_1799, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1821);
    float _1845 = fma(_1799, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1817);
    float _1847 = fma(_1829, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1839);
    float _1849 = fma(_1753, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1813);
    float _1851 = _1843 * _960;
    float _1853 = _1843 * _976;
    float _1855 = _1843 * _938;
    float _1857 = _1463 + _1336;
    float _1859 = fma(_1753, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1825);
    float _1861 = fma(_1799, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1823);
    float _1863 = fma(_1845, _968, _1851);
    float _1865 = _1857 * 0.5;
    float _1867 = fma(_1845, _948, _1855);
    float _1869 = fma(_1845, _980, _1853);
    out.m_75.x = _1849;
    out.m_75.y = _1835;
    out.m_75.z = _1859;
    float _1871 = fma(_1765, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1837);
    out.m_77.z = _1865;
    out.m_77.w = _1336;
    float _1873 = fma(_1829, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1871);
    out.gl_Position.x = _1366;
    out.gl_Position.y = _1368;
    out.gl_Position.z = _1463;
    out.gl_Position.w = _1336;
    float _1875 = fma(_1861, _972, _1863);
    float _1877 = fma(_1861, _956, _1867);
    float _1879 = fma(_1861, _990, _1869);
    out.m_79.x = _1841;
    out.m_79.y = _1873;
    out.m_79.z = _1847;
    out.m_81.x = _1875;
    out.m_81.y = _1879;
    out.m_81.z = _1877;
    float _1881 = _1841;
    float _1883 = _1366;
    if (!_1775)
    {
        _1479 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1885 = _1479;
    float _1887 = _1885;
    float _1889 = _1885;
    if (!_1775)
    {
        _1481 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1891 = _1481;
    float _1893 = _1891;
    float _1895 = _1891;
    if (!_1775)
    {
        _1881 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1897 = _1881;
    float _1899 = _1897;
    float _1901 = _1897;
    if (!_1775)
    {
        _1483 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1903 = _1483;
    float _1905 = _1903;
    float _1907 = _1903;
    if (!_1775)
    {
        _1883 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1909 = _1883;
    float _1911 = _1635 * _1394;
    float _1913 = -_1635;
    float _1915 = _1913 + 1.0;
    float _1917 = _1411 * _1911;
    float _1919 = _1411 * _1915;
    float _1921 = _1421 * _1911;
    float _1923 = fma(_1417, _1917, _1405);
    float _1925 = fma(_1419, _1917, _1407);
    float _1927 = _1917;
    float _1929 = _1909;
    float _1931 = _1909;
    if (!_1775)
    {
        _1927 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1933 = _1927;
    float _1935 = fma(_1411, _1921, _1409);
    out.m_83.x = _1923;
    out.m_83.y = _1925;
    out.m_83.z = _1935;
    out.m_83.w = _1919;
    bool _1937 = !_1775;
    float _1939 = _1933;
    float _1941 = _1933;
    if (!_1937)
    {
        bool _1943 = _1110 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1945 = isnan(_1110);
        bool _1947 = _1943 || _1945;
        bool _1949 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1951 = _1947 || _1949;
        if (!_1951)
        {
            float _1953 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1955 = _1110 + _1953;
            float _1957 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1959 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1957;
            float _1961 = 1.0 / _1959;
            float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1965 = _1963 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1969 = _1967 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1973 = _1971 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1975 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1977 = _1975 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1981 = _1979 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1983 = _1955 * _1961;
            float _1985 = precise::clamp(_1983, 0.0, 1.0);
            float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1989 = _1987 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1991 = fma(_1985, _1965, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1993 = fma(_1985, _1989, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1995 = fma(_1985, _1969, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1997 = fma(_1985, _1973, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1999 = fma(_1985, _1977, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2001 = fma(_1985, _1981, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1901 = _1993;
            _1907 = _1999;
            _1941 = _1991;
            _1895 = _1997;
            _1889 = _1995;
            _1931 = _2001;
            _2003 = true;
        }
        else
        {
            bool _2005 = _1110 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2007 = isnan(_1110);
            bool _2009 = _2005 || _2007;
            bool _2011 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2013 = _2009 || _2011;
            if (!_2013)
            {
                _1939 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2015 = _1939;
            _1941 = _2015;
            if (!_2013)
            {
                _1899 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2017 = _1899;
            _1901 = _2017;
            if (!_2013)
            {
                _1887 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2019 = _1887;
            _1889 = _2019;
            if (!_2013)
            {
                _1893 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2021 = _1893;
            _1895 = _2021;
            if (!_2013)
            {
                _1905 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2023 = _1905;
            _1907 = _2023;
            if (!_2013)
            {
                _1929 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2025 = _1929;
            bool _2027 = !_2013;
            _1931 = _2025;
            if (!_2027)
            {
                bool _2029 = _1110 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2031 = isnan(_1110);
                bool _2033 = _2029 || _2031;
                bool _2035 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2037 = _2033 || _2035;
                if (!_2037)
                {
                    float _2039 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2041 = _1110 + _2039;
                    float _2043 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2045 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2043;
                    float _2047 = 1.0 / _2045;
                    float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2051 = _2049 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2055 = _2053 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2061 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2063 = _2061 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2065 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2067 = _2065 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2069 = _2041 * _2047;
                    float _2071 = precise::clamp(_2069, 0.0, 1.0);
                    float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2077 = fma(_2071, _2051, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2079 = fma(_2071, _2075, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2081 = fma(_2071, _2055, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2083 = fma(_2071, _2059, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2085 = fma(_2071, _2063, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2087 = fma(_2071, _2067, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1901 = _2079;
                    _1907 = _2085;
                    _1941 = _2077;
                    _1895 = _2083;
                    _1889 = _2081;
                    _1931 = _2087;
                    _2003 = true;
                }
                else
                {
                    _1901 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1907 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1941 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1895 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1889 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1931 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2003 = false;
    float _2089 = _1901;
    float _2091 = _1907;
    float _2093 = _1941;
    float _2095 = _1895;
    float _2097 = _1889;
    float _2099 = _1931;
    float _2101 = fma(_1879, -0.5, 0.5);
    float _2103 = precise::clamp(_2101, 0.0, 1.0);
    float _2105 = -_2089;
    float _2107 = _2105 + _2091;
    float _2109 = -_2093;
    float _2111 = _2109 + _2095;
    float _2113 = -_2097;
    float _2115 = _2113 + _2099;
    bool _2117 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2119 = fma(_2103, _2107, _2089);
    float _2121 = fma(_2103, _2111, _2093);
    float _2123 = fma(_2103, _2115, _2097);
    float _2125 = _2119 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2127 = fma(_2121, 0.298911988735198974609375, _2125);
    float _2129 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2131 = fma(_2123, 0.114477999508380889892578125, _2127);
    out.m_85.w = _2129;
    float _2133 = -_2131;
    float _2135 = _2121 + _2133;
    float _2137 = -_2131;
    float _2139 = _2119 + _2137;
    float _2141 = -_2131;
    float _2143 = _2123 + _2141;
    out.m_87.x = 0.0;
    float _2145 = fma(_2135, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2131);
    float _2147 = fma(_2139, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2131);
    float _2149 = fma(_2143, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2131);
    out.m_89.x = _2145;
    out.m_89.y = _2147;
    out.m_89.z = _2149;
    if (!_2117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2151 = -_1084;
    float _2153 = _2151 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2155 = -_1086;
    float _2157 = _2155 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2159 = -_1088;
    float _2161 = _2159 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2163 = _2153 * _2153;
    float _2165 = fma(_2157, _2157, _2163);
    float _2167 = fma(_2161, _2161, _2165);
    float _2169 = sqrt(_2167);
    float _2171 = rsqrt(_2167);
    float _2173 = -_2169;
    float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2177 = _2175 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2179 = precise::clamp(_2177, 0.0, 1.0);
    float _2181 = _2157 * _2171;
    float _2183 = _2153 * _2171;
    float _2185 = abs(_2179);
    float _2187 = log2(_2185);
    float _2189 = _2161 * _2171;
    float _2191 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2193 = _1879 * _2183;
    float _2195 = -_2183;
    float _2197 = -_2191;
    float _2199 = fma(_2195, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2197);
    float _2201 = fma(_1875, _2181, _2193);
    float _2203 = -_2189;
    float _2205 = fma(_2203, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2199);
    float _2207 = fma(_1877, _2189, _2201);
    float _2209 = precise::clamp(_2207, 0.0, 1.0);
    float _2211 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2213 = _2205 + _2211;
    float _2215 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2217 = _2213 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2219 = precise::clamp(_2217, 0.0, 1.0);
    float _2221 = exp2(_2215);
    float _2223 = _2221 * _2219;
    float _2225 = _2209 * _2223;
    float _2227 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2229 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2231 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2227;
    out.m_87.y = _2229;
    out.m_87.z = _2231;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2003 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = in.m_46.w;
    float _107 = trunc(_103);
    int _110 = int(_107);
    float _112 = -_105;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _114;
    bool _118 = _110 >= 1;
    float _120 = 0.0;
    float _122 = _105;
    float _124 = _114;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _120;
    if (!_118)
    {
        out.m_51.x = 0.0;
    }
    int _128 = 0;
    if (!_118)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2299 = as_type<float>(_132);
        out.gl_Position.z = _2299;
    }
    if (!_118)
    {
        return out;
    }
    bool _136 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_105);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = in.m_53.x;
    float _148 = float(_110);
    float _150 = in.m_53.y;
    bool _152 = _114 >= _148;
    bool _154 = !_144;
    bool _156 = _152 || _154;
    float _158 = 1.0 / _148;
    float _160 = in.m_53.z;
    float _162 = in.m_53.w;
    if (_156)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _122;
    if (_156)
    {
        out.m_51.x = 0.0;
    }
    if (_156)
    {
        float _166 = _164 * 5.0;
        _134 = as_type<int>(_166);
    }
    int _168 = _134;
    float _170 = _114 * _158;
    out.m_55.x = _146;
    int _172 = as_type<int>(_146);
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2371 = as_type<float>(_168);
        out.gl_Position.z = _2371;
    }
    out.m_55.y = _150;
    out.m_55.z = _160;
    out.m_55.w = _162;
    out.m_49.x = _170;
    float _174 = _162;
    if (_156)
    {
        return out;
    }
    float _176 = in.m_57.x;
    float _178 = in.m_57.y;
    float _180 = in.m_57.z;
    float _182 = _160 * 2.0;
    float _184 = _146 * 2.0;
    float _186 = _150 * 2.0;
    float _188 = floor(_182);
    float _190 = _146 + _160;
    int _192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _194 = _192 != 0;
    float _196 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _198 = _150 + _160;
    float _200 = _190 + (-1.0);
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _204 = floor(_184);
    float _206 = _198 + (-1.0);
    float _208 = -_202;
    float _210 = fma(_196, 2.0, _208);
    float _212 = _150 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _214 = _146 + _150;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _218 = _184 + (-1.0);
    float _220 = floor(_186);
    bool _222 = _188 > 0.0;
    float _224 = _214 + (-1.0);
    float _226 = _180 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _228 = _176 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _230 = _178 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _232 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _234 = _200;
    float _236 = _182;
    if (_194)
    {
        _234 = _146;
    }
    float _238 = _234;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _242 = _238;
    if (!_194)
    {
        _242 = _160;
    }
    float _244 = _242;
    float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _248 = log2(_246);
    bool _250 = _204 > 0.0;
    float _252 = fma(_212, -2.0, _240);
    bool _254 = _188 >= 0.0;
    bool _256 = isnan(_188);
    bool _258 = _254 || _256;
    bool _260 = isnan(0.0);
    bool _262 = _258 || _260;
    float _264 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _266 = _204 >= 0.0;
    bool _268 = isnan(_204);
    bool _270 = _266 || _268;
    bool _272 = isnan(0.0);
    bool _274 = _270 || _272;
    float _276 = _244 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _278 = _186 + (-1.0);
    bool _280 = _220 > 0.0;
    float _282 = -_216;
    float _284 = fma(_276, 2.0, _282);
    bool _286 = _220 >= 0.0;
    bool _288 = isnan(_220);
    bool _290 = _286 || _288;
    bool _292 = isnan(0.0);
    bool _294 = _290 || _292;
    float _296 = _278 * _278;
    int _298 = _262 ? 0 : 1;
    float _300 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _302 = _274 ? 0 : 1;
    float _304 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _306 = ~_298;
    int _308 = _306 + 1;
    int _310 = _308 + 1;
    int _312 = ~_302;
    int _314 = _312 + 1;
    int _316 = _314 + 1;
    int _318 = _310;
    int _320 = _316;
    float _322 = _304;
    if (!_222)
    {
        int _324 = ~_298;
        int _326 = _324 + 1;
        _318 = _326;
    }
    int _328 = _318;
    float _330 = fma(_218, _218, _296);
    float _332 = _330;
    if (!_250)
    {
        int _334 = ~_302;
        int _336 = _334 + 1;
        _320 = _336;
    }
    int _338 = _320;
    float _340 = _182 + (-1.0);
    float _342 = fma(_340, _340, _330);
    if (!_194)
    {
        _236 = _150;
    }
    float _344 = _236;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _348 = _344;
    if (_194)
    {
        _348 = _146;
    }
    float _350 = _348;
    float _352 = rsqrt(_342);
    bool _354 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _358 = _354 || _356;
    bool _360 = isnan(1.0);
    bool _362 = _358 || _360;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _366 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[83].z, _346);
    if (!_194)
    {
        _332 = _160;
    }
    float _368 = _332;
    float _370 = _350 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _372 = _368;
    float _374 = _370;
    if (_194)
    {
        _372 = _150;
    }
    float _376 = _372;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _380 = _294 ? 0 : 1;
    float _382 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[83].w, _364);
    float _384 = -_378;
    float _386 = fma(_370, 2.0, _384);
    float _388 = _376;
    if (!_194)
    {
        _374 = _160;
    }
    float _390 = _374;
    float _392 = 0.0;
    float _394 = _390;
    if (!_362)
    {
        float _396 = _304 * _304;
        float _398 = _396 * 0.5;
        _392 = _398;
    }
    float _400 = _392;
    float _402 = _278 * _352;
    float _404 = _218 * _352;
    float _406 = _340 * _352;
    float _408 = _400;
    if (_194)
    {
        _388 = _150;
    }
    float _410 = _388;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _414 = _410;
    if (!_362)
    {
        float _416 = _400 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _408 = _416;
    }
    float _418 = _408;
    float _420 = _418;
    if (_194)
    {
        _394 = _150;
    }
    float _422 = _394;
    if (!_194)
    {
        _414 = _146;
    }
    float _424 = _414;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _428 = ~_380;
    int _430 = _428 + 1;
    int _432 = _430 + 1;
    float _434 = _422 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _436 = _432;
    if (!_280)
    {
        int _438 = ~_380;
        int _440 = _438 + 1;
        _436 = _440;
    }
    int _442 = _436;
    float _444 = _424 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _446 = !_362;
    if (!_446)
    {
        float _448 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _450 = log2(_448);
        float _452 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _454 = _452 + 1.0;
        float _456 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _458 = _304 * _450;
        float _460 = 1.0 / _454;
        float _462 = _456 * 0.693147182464599609375;
        float _464 = exp2(_458);
        float _466 = 1.0 / _462;
        float _468 = _464 + (-1.0);
        float _470 = -_468;
        float _472 = fma(_470, _466, _304);
        float _474 = _472 * _460;
        float _476 = _474 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _420 = _476;
    }
    float _478 = _420;
    bool _480 = !_362;
    if (!_480)
    {
        float _482 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _484 = log2(_482);
        float _486 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _488 = _486 + 1.0;
        float _490 = 1.0 / _488;
        float _492 = _304 * _484;
        float _494 = exp2(_492);
        float _496 = -_494;
        float _498 = _496 + 1.0;
        float _500 = _498 * _490;
        _322 = _500;
    }
    float _502 = _322;
    float _504 = fma(_444, -2.0, _412);
    float _506 = fma(_434, -2.0, _426);
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _510 = _508 != 0;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _514 = _512 != 0;
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _518 = _516 != 0;
    float _520 = _248 * _114;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _524 = in.m_59.x;
    float _526 = in.m_59.y;
    float _528 = in.m_59.z;
    float _530 = exp2(_520);
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _534 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[88].z, _522);
    bool _536 = !_510;
    int _538 = _536 ? 0 : 1;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _542 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _532);
    float _544 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[76].y, _252);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _548 = 1.0 + _546;
    int _550 = abs(_538);
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _554 = float(_328);
    float _556 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[78].w, _540);
    bool _558 = !_514;
    int _560 = _558 ? 0 : 1;
    float _562 = 1.0 / _548;
    float _564 = float(_550);
    float _566 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[88].w, _552);
    bool _568 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _570 = isnan(1.0);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _576 = _572 || _574;
    float _578 = -_114;
    float _580 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[76].x, _210);
    int _582 = abs(_560);
    float _584 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].w, _556);
    float _586 = -_114;
    float _588 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[81].x, _386);
    float _590 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[86].y, _504);
    float _592 = _564 * _554;
    float _594 = -_530;
    float _596 = _594 + 1.0;
    float _598 = in.m_61.x;
    float _600 = in.m_61.y;
    float _602 = in.m_61.z;
    float _604 = float(_338);
    float _606 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[87].z, _534);
    bool _608 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _610 = isnan(0.0);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _616 = _612 || _614;
    float _618 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].z, _542);
    float _620 = _402 * _402;
    bool _622 = !_518;
    int _624 = _622 ? 0 : 1;
    float _626 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[87].w, _566);
    float _628 = _616 ? _596 : 0.0;
    float _630 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].z, _366);
    float _632 = float(_582);
    float _634 = -_114;
    float _636 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[86].x, _284);
    int _638 = abs(_624);
    float _640 = _592 * (-2.0);
    float _642 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].w, _382);
    float _644 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[81].y, _506);
    if (_576)
    {
        float _646 = _628 * _562;
        _124 = _646;
    }
    float _648 = _124;
    float _650 = _632 * _604;
    float _652 = fma(_404, _404, _620);
    float _654 = _146 + (-0.5);
    float _656 = float(_442);
    float _658 = fma(_640, _524, _524);
    float _660 = float(_638);
    float _662 = _650 * (-2.0);
    float _664 = fma(_300, _640, _300);
    float _666 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[196].x, _658);
    float _668 = _228 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _670 = _660 * _656;
    float _672 = fma(_264, _662, _264);
    float _674 = fma(_662, _526, _526);
    float _676 = _150 + (-0.5);
    float _678 = fma(_664, _648, _666);
    float _680 = _670 * (-2.0);
    float _682 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _598);
    float _684 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[196].y, _674);
    float _686 = _678 * 0.15915493667125701904296875;
    float _688 = fma(_406, _406, _652);
    float _690 = in.m_46.x;
    float _692 = in.m_46.y;
    float _694 = in.m_46.z;
    float _696 = fma(_672, _648, _684);
    float _698 = _682 * _668;
    float _700 = fma(_680, _528, _528);
    float _702 = _160 + (-0.5);
    float _704 = rsqrt(_688);
    float _706 = _226 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _708 = fma(_232, _680, _232);
    float _710 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[196].z, _700);
    float _712 = in.m_57.w;
    float _714 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _600);
    float _716 = _230 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _718 = _686 * 6.283185482025146484375;
    float _720 = sin(_718);
    float _722 = _696 * 0.15915493667125701904296875;
    float _724 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _602);
    float _726 = in.m_44.x;
    float _728 = in.m_44.y;
    float _730 = in.m_44.z;
    float _732 = _714 * _716;
    float _734 = _478 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _736 = _724 * _706;
    float _738 = fma(_708, _648, _710);
    float _740 = _686 * 6.283185482025146484375;
    float _742 = cos(_740);
    float _744 = _170 * 2.5;
    float _746 = precise::clamp(_744, 0.0, 1.0);
    float _748 = _404 * _704;
    float _750 = fma(_502, _690, _734);
    float _752 = _478 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _754 = _402 * _704;
    float _756 = _406 * _704;
    float _758 = _722 * 6.283185482025146484375;
    float _760 = sin(_758);
    float _762 = fma(_502, _692, _752);
    float _764 = fma(_170, 1.66666662693023681640625, -0.666666686534881591796875);
    float _766 = precise::clamp(_764, 0.0, 1.0);
    float _768 = _738 * 0.15915493667125701904296875;
    float _770 = _722 * 6.283185482025146484375;
    float _772 = cos(_770);
    float _774 = -_746;
    float _776 = _774 + 1.0;
    float _778 = _766 * _766;
    float _780 = _478 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _782 = fma(_762, _712, _728);
    float _784 = -_776;
    float _786 = fma(_784, _776, 1.0);
    float _788 = -_778;
    float _790 = _788 + 1.0;
    float _792 = fma(_502, _694, _780);
    float _794 = _768 * 6.283185482025146484375;
    float _796 = cos(_794);
    float _798 = _162 * 6.0;
    float _800 = _790 * _786;
    float _802 = fma(_750, _712, _726);
    float _804 = _742 * _760;
    float _806 = _720 * _760;
    float _808 = _790 * _798;
    float _810 = fma(_792, _712, _730);
    float _812 = _768 * 6.283185482025146484375;
    float _814 = sin(_812);
    float _816 = _742 * _772;
    float _818 = _720 * _772;
    float _820 = _808 * 0.15915493667125701904296875;
    float _822 = _742 * _796;
    float _824 = _720 * _796;
    float _826 = _772 * _796;
    float _828 = _760 * _796;
    float _830 = _822 * _736;
    float _832 = _820 * 6.283185482025146484375;
    float _834 = cos(_832);
    float _836 = -_736;
    float _838 = _814 * _836;
    float _840 = fma(_814, _816, _806);
    float _842 = -_804;
    float _844 = fma(_814, _818, _842);
    float _846 = _824 * _736;
    float _848 = fma(_826, _698, _838);
    float _850 = _782 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _852 = -_818;
    float _854 = fma(_814, _804, _852);
    float _856 = fma(_840, _698, _830);
    float _858 = fma(_814, _806, _816);
    float _860 = fma(_844, _698, _846);
    float _862 = _782 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _864 = _782 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _866 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[4].x, _850);
    float _868 = -_732;
    float _870 = fma(_854, _868, _856);
    float _872 = -_732;
    float _874 = fma(_828, _872, _848);
    float _876 = -_732;
    float _878 = fma(_858, _876, _860);
    float _880 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[5].x, _862);
    float _882 = _820 * 6.283185482025146484375;
    float _884 = sin(_882);
    float _886 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[6].x, _864);
    float _888 = _870 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _890 = _870 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _892 = _870 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _894 = fma(_810, (*spvDescriptorSet0.vp_c10)._m0[6].z, _886);
    float _896 = fma(_874, (*spvDescriptorSet0.vp_c10)._m0[8].x, _888);
    float _898 = fma(_874, (*spvDescriptorSet0.vp_c10)._m0[9].x, _890);
    float _900 = fma(_874, (*spvDescriptorSet0.vp_c10)._m0[10].x, _892);
    float _902 = fma(_810, (*spvDescriptorSet0.vp_c10)._m0[5].z, _880);
    float _904 = fma(_810, (*spvDescriptorSet0.vp_c10)._m0[4].z, _866);
    float _906 = fma(_878, (*spvDescriptorSet0.vp_c10)._m0[8].z, _896);
    float _908 = fma(_878, (*spvDescriptorSet0.vp_c10)._m0[9].z, _898);
    float _910 = fma(_878, (*spvDescriptorSet0.vp_c10)._m0[10].z, _900);
    float _912 = _894 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _914 = _902 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _916 = -_834;
    float _918 = _916 + 1.0;
    float _920 = _904 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _922 = _748 * _884;
    float _924 = fma(_908, _800, _914);
    float _926 = _754 * _918;
    float _928 = fma(_906, _800, _920);
    float _930 = fma(_910, _800, _912);
    float _932 = _754 * _884;
    float _934 = _756 * _884;
    float _936 = _748 * _918;
    float _938 = fma(_756, _926, _922);
    float _940 = -_914;
    float _942 = _940 + _924;
    float _944 = _756 * _756;
    float _946 = -_932;
    float _948 = fma(_756, _936, _946);
    float _950 = -_920;
    float _952 = _950 + _928;
    float _954 = _938 * _942;
    float _956 = fma(_918, _944, _834);
    float _958 = -_934;
    float _960 = fma(_754, _936, _958);
    float _962 = -_912;
    float _964 = _962 + _930;
    float _966 = fma(_948, _952, _954);
    float _968 = fma(_748, _936, _834);
    float _970 = _960 * _942;
    float _972 = fma(_756, _936, _932);
    float _974 = fma(_956, _964, _966);
    float _976 = fma(_754, _926, _834);
    float _978 = fma(_968, _952, _970);
    float _980 = fma(_754, _936, _934);
    float _982 = _912 + _974;
    float _984 = _976 * _942;
    float _986 = fma(_972, _964, _978);
    float _988 = -_922;
    float _990 = fma(_756, _926, _988);
    float _992 = fma(_170, 8.0, _982);
    float _994 = fma(_980, _952, _984);
    float _996 = _920 + _986;
    float _998 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1000 = _992 + _998;
    float _1002 = fma(_990, _964, _994);
    float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1006 = _996 + _1004;
    float _1008 = _1000 * _1000;
    float _1010 = _914 + _1002;
    float _1012 = fma(_1006, _1006, _1008);
    float _1014 = fma(_778, -40.0, _1010);
    float _1016 = sqrt(_1012);
    bool _1018 = _1016 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1020 = _778;
    float _1022 = _914;
    float _1024 = _1010;
    float _1026 = _1014;
    float _1028 = _1006;
    float _1030 = _820;
    float _1032 = _1000;
    if (!_1018)
    {
        _1020 = _996;
    }
    float _1034 = _1020;
    float _1036 = _1034;
    if (!_1018)
    {
        _1022 = _992;
    }
    float _1038 = _1022;
    float _1040 = _1038;
    if (!_1018)
    {
        _1024 = _1014;
    }
    float _1042 = _1024;
    bool _1044 = !_1018;
    float _1046 = _1042;
    if (!_1044)
    {
        float _1048 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1052 = _1016 + _1050;
        float _1054 = rsqrt(_1012);
        float _1056 = _1052 * _1048;
        float _1058 = _1014 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1060 = _1056 * 0.15915493667125701904296875;
        float _1062 = _1060 * 6.283185482025146484375;
        float _1064 = cos(_1062);
        float _1066 = _1060 * 6.283185482025146484375;
        float _1068 = sin(_1066);
        float _1070 = _1064 + (-1.0);
        float _1072 = _1070 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1074 = fma(_1068, _1058, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1076 = fma(_1014, _1064, _1072);
        float _1078 = _1054 * _1074;
        float _1080 = fma(_1006, _1078, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1082 = fma(_1000, _1078, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1046 = _1076;
        _1036 = _1080;
        _1040 = _1082;
    }
    float _1084 = _1046;
    float _1086 = _1036;
    float _1088 = _1040;
    float _1090 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1092 = _1084 + _1090;
    float _1094 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1096 = _1086 + _1094;
    float _1098 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1100 = _1088 + _1098;
    float _1102 = _1092 * _1092;
    float _1104 = fma(_1096, _1096, _1102);
    float _1106 = fma(_1100, _1100, _1104);
    float _1108 = rsqrt(_1106);
    float _1110 = sqrt(_1106);
    float _1112 = _1108 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1114 = _1096 * _1112;
    float _1116 = _1100 * _1112;
    float _1118 = _1114 * _1114;
    float _1120 = _1116 * _1116;
    float _1122 = _1118 + _1120;
    float _1124 = sqrt(_1122);
    bool _1126 = _1124 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1128 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1130 = _1124 + _1128;
    float _1132 = _1108;
    float _1134 = _1130;
    float _1136 = _1092;
    if (_1126)
    {
        float _1138 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1132 = _1138;
    }
    float _1140 = _1132;
    if (_1126)
    {
        float _1142 = rsqrt(_1122);
        _1026 = _1142;
    }
    float _1144 = _1026;
    float _1146 = _1144;
    if (_1126)
    {
        float _1148 = _1130 * _1140;
        _1134 = _1148;
    }
    float _1150 = _1134;
    if (_1126)
    {
        float _1152 = _1150 * 0.15915493667125701904296875;
        _1028 = _1152;
    }
    float _1154 = _1028;
    float _1156 = _1100;
    if (_1126)
    {
        float _1158 = _1154 * 6.283185482025146484375;
        float _1160 = sin(_1158);
        _1156 = _1160;
    }
    float _1162 = _1156;
    float _1164 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1166 = precise::max(0.0, _1164);
    float _1168 = _1140;
    float _1170 = _1166;
    if (_1126)
    {
        float _1172 = _1154 * 6.283185482025146484375;
        float _1174 = cos(_1172);
        _1168 = _1174;
    }
    float _1176 = _1168;
    float _1178 = -_1112;
    float _1180 = -_1166;
    float _1182 = fma(_1092, _1178, _1180);
    if (_1126)
    {
        float _1184 = _1182 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1136 = _1184;
    }
    float _1186 = _1136;
    float _1188 = _1186;
    float _1190 = _1162;
    if (_1126)
    {
        float _1192 = fma(_1162, _1186, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1188 = _1192;
    }
    float _1194 = _1188;
    float _1196 = _1194;
    if (!_1126)
    {
        _1190 = _1182;
    }
    float _1198 = _1190;
    float _1200 = _1198;
    float _1202 = _1176;
    if (_1126)
    {
        float _1204 = _1176 + (-1.0);
        _1170 = _1204;
    }
    float _1206 = _1170;
    float _1208 = _1206;
    if (_1126)
    {
        float _1210 = _1144 * _1194;
        _1030 = _1210;
    }
    float _1212 = _1030;
    if (!_1126)
    {
        _1146 = _1114;
    }
    float _1214 = _1146;
    float _1216 = _1214;
    if (_1126)
    {
        float _1218 = _1206 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1032 = _1218;
    }
    float _1220 = _1032;
    if (_1126)
    {
        float _1222 = _1114 * _1212;
        _1216 = _1222;
    }
    float _1224 = _1216;
    if (!_1126)
    {
        _1208 = _1116;
    }
    float _1226 = _1208;
    float _1228 = _1226;
    if (_1126)
    {
        float _1230 = _1116 * _1212;
        _1228 = _1230;
    }
    float _1232 = _1228;
    if (!_1126)
    {
        _1196 = _1118;
    }
    float _1234 = _1196;
    float _1236 = _1234;
    if (_1126)
    {
        float _1238 = fma(_1182, _1176, _1220);
        _1200 = _1238;
    }
    float _1240 = _1200;
    if (_1126)
    {
        float _1242 = _1224 * _1224;
        _1236 = _1242;
    }
    float _1244 = _1236;
    if (!_1126)
    {
        _1202 = _1120;
    }
    float _1246 = _1202;
    float _1248 = _1246;
    if (_1126)
    {
        float _1250 = _1232 * _1232;
        _1248 = _1250;
    }
    float _1252 = _1248;
    float _1254 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1256 = fma(_1240, _1240, _1244);
    float _1258 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1260 = fma(_1110, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1258);
    float _1262 = precise::clamp(_1260, 0.0, 1.0);
    float _1264 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1266 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1254);
    float _1268 = _1256 + _1252;
    float _1270 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1272 = -_1262;
    float _1274 = _1272 + 1.0;
    float _1276 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1266);
    float _1278 = rsqrt(_1268);
    float _1280 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1282 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1270);
    float _1284 = _1276 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1286 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1288 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1280);
    float _1290 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1282);
    float _1292 = _1284 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1294 = abs(_1274);
    float _1296 = log2(_1294);
    float _1298 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1288);
    float _1300 = _1290 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1302 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1264);
    float _1304 = -_1292;
    float _1306 = fma(_1304, _1286, 1.0);
    float _1308 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1310 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1312 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1302);
    float _1314 = _1278 * _1224;
    float _1316 = _1278 * _1240;
    float _1318 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1310);
    float _1320 = _1278 * _1232;
    float _1322 = _1314 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1324 = _1312 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1326 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1318);
    float _1328 = log2(_1306);
    float _1330 = -_1322;
    float _1332 = fma(_1316, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1330);
    float _1334 = _1296 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1336 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1326);
    float _1338 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1340 = -_1320;
    float _1342 = fma(_1340, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1332);
    float _1344 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1346 = exp2(_1334);
    float _1348 = fma(_1342, -0.5, 0.5);
    float _1350 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1344);
    float _1352 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1338);
    float _1354 = fma(_1342, 0.5, 0.5);
    float _1356 = _1316 + 1.0;
    float _1358 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1350);
    float _1360 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1352);
    float _1362 = 1.0 / _1336;
    float _1364 = fma(_1354, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1366 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1358);
    float _1368 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1360);
    float _1370 = _1328 * 0.693147182464599609375;
    float _1372 = fma(_1354, _1364, -0.212114393711090087890625);
    float _1374 = sqrt(_1348);
    float _1376 = -_1316;
    float _1378 = fma(_1346, _1356, _1376);
    float _1380 = fma(_1354, _1372, 1.570728778839111328125);
    float _1382 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1384 = _1366 * _1362;
    float _1386 = _1368 * _1362;
    float _1388 = fma(_1384, 0.5, 0.5);
    float _1390 = fma(_1386, -0.5, 0.5);
    float _1392 = _1374 * 0.636619746685028076171875;
    float3 _4332 = float3(_1388, _1390, _1382);
    float _1394 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4332, float3(0.0), isnan(_4332)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4332, float3(0.0), isnan(_4332)), level(0.0)).x;
    float _1396 = -_1380;
    float _1398 = fma(_1392, _1396, 1.0);
    float _1400 = fma(_1378, 0.5, 0.5);
    float3 _4350 = float3(_1388, _1390, _1382);
    float4 _1403 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4350, float3(0.0), isnan(_4350)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4350, float3(0.0), isnan(_4350)), level(0.0)).xyzw;
    float _1405 = _1403.x;
    float _1407 = _1403.y;
    float _1409 = _1403.z;
    float _1411 = _1403.w;
    float2 _4367 = float2(_1398, _1400);
    float3 _1415 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4367, float2(0.0), isnan(_4367)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4367, float2(0.0), isnan(_4367)), level(0.0)).xyz;
    float _1417 = _1415.x;
    float _1419 = _1415.y;
    float _1421 = _1415.z;
    float _1423 = in.m_63.y;
    float _1425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1427 = _162 > 0.5;
    float _1429 = in.m_63.x;
    int _1431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1433 = _1431 != 0;
    float _1435 = _1296 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1437 = _150 > 0.5;
    float _1439 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1443 = _1441 != 0;
    float _1445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1449 = _1447 != 0;
    float _1451 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1439);
    bool _1453 = _160 > 0.5;
    out.m_65.x = _1086;
    out.m_65.y = _1084;
    out.m_65.z = _1088;
    int _1455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1457 = _1455 != 0;
    float _1459 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1451);
    float _1461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1463 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1459);
    float _1465 = -_1423;
    float _1467 = _1465 + 1.0;
    float _1469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1471 = _1445 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1473 = _1423;
    bool _1475 = _1443;
    float _1477 = _1471;
    float _1479 = _1336;
    float _1481 = _1463;
    float _1483 = _1368;
    if (!_1433)
    {
        _174 = _1429;
    }
    float _1485 = _174;
    float _1487 = _1427 ? _1467 : _1423;
    int _1489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1491 = _1489 != 0;
    int _1493 = _1437 ? as_type<int>(_1467) : as_type<int>(_1423);
    float _1495 = exp2(_1435);
    float _1497 = _1491 ? _1487 : _1423;
    float _1499 = _1449 ? as_type<float>(_1493) : _1423;
    float _1501 = _1425 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1503 = _1487;
    float _1505 = _1485;
    int _1507 = as_type<int>(_1501);
    if (!_1433)
    {
        _1503 = _1485;
    }
    float _1509 = _1503;
    float _1511 = _1509;
    if (_1433)
    {
        _1505 = _1429;
    }
    float _1513 = _1505;
    float _1515 = fma(_1501, _1499, -0.5);
    float _1517 = _1513;
    if (_1443)
    {
        float _1519 = _1453 ? _1467 : _1423;
        _1473 = _1519;
    }
    float _1521 = _1473;
    float _1523 = _1461 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1525 = _1523;
    if (_1433)
    {
        bool _1527 = _146 > 0.5;
        _1475 = _1527;
    }
    bool _1529 = _1475;
    if (_1433)
    {
        float _1531 = -_1513;
        float _1533 = _1531 + 1.0;
        _1507 = as_type<int>(_1533);
    }
    int _1535 = _1507;
    int _1537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1539 = _1537 != 0;
    float _1541 = -_544;
    float _1543 = fma(_584, _1515, _1541);
    float _1545 = in.m_67.x;
    float _1547 = in.m_67.y;
    float _1549 = in.m_67.z;
    bool _1551 = _600 != 0.0;
    bool _1553 = isnan(_600);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan(0.0);
    bool _1559 = _1555 || _1557;
    float _1561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1433)
    {
        float _1563 = _1529 ? as_type<float>(_1535) : _1513;
        _1511 = _1563;
    }
    float _1565 = _1511;
    float _1567 = fma(_1497, _1471, -0.5);
    float _1569 = in.m_69.x;
    float _1571 = in.m_69.y;
    float _1573 = in.m_69.z;
    float _1575 = in.m_69.w;
    bool _1577 = _598 == 0.0;
    bool _1579 = !_1559;
    bool _1581 = _1577 && _1579;
    if (_1457)
    {
        float _1583 = -_1513;
        float _1585 = _1583 + 1.0;
        _172 = as_type<int>(_1585);
    }
    int _1587 = _172;
    float _1589 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1591 = fma(_1523, _1521, -0.5);
    float _1593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1595 = _602 == 0.0;
    bool _1597 = _1595 && _1581;
    int _1599 = 0;
    float _1601 = as_type<float>(_1587);
    if (_1539)
    {
        float _1603 = -_1513;
        float _1605 = _1603 + 1.0;
        _1599 = as_type<int>(_1605);
    }
    int _1607 = _1599;
    if (!_1539)
    {
        _1525 = _1513;
    }
    float _1609 = _1525;
    float _1611 = fma(_1589, _1565, -0.5);
    float _1613 = _1609;
    if (!_1457)
    {
        _1477 = _1513;
    }
    float _1615 = _1477;
    float _1617 = -_1495;
    float _1619 = _1617 + 1.0;
    float _1621 = _1615;
    if (_1539)
    {
        float _1623 = _1437 ? as_type<float>(_1607) : _1513;
        _1613 = _1623;
    }
    float _1625 = _1613;
    float _1627 = _1561 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1457)
    {
        float _1629 = _1453 ? as_type<float>(_1587) : _1513;
        _1621 = _1629;
    }
    float _1631 = _1621;
    float _1633 = fma(_618, _1611, _580);
    float _1635 = _1619 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1597)
    {
        _1601 = _1545;
    }
    float _1637 = _1601;
    float _1639 = _1637;
    if (!_1597)
    {
        float _1641 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1545);
        _1639 = _1641;
    }
    float _1643 = _1639;
    float _1645 = _1593 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1647 = _1593;
    if (_1597)
    {
        _1517 = _1547;
    }
    float _1649 = _1517;
    float _1651 = fma(_1627, _1631, -0.5);
    float _1653 = _1569 * _1547;
    float _1655 = _1573 * _1545;
    float _1657 = fma(_1645, _1625, -0.5);
    float _1659 = _1649;
    if (_1597)
    {
        _1647 = _1549;
    }
    float _1661 = _1647;
    float _1663 = _1661;
    if (!_1597)
    {
        float _1665 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1547);
        _1659 = _1665;
    }
    float _1667 = _1659;
    if (!_1597)
    {
        float _1669 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1549);
        _1663 = _1669;
    }
    float _1671 = _1663;
    float _1673 = _1571 * _1549;
    float _1675 = -_1653;
    float _1677 = fma(_1571, _1545, _1675);
    float _1679 = -_1655;
    float _1681 = fma(_1569, _1549, _1679);
    float _1683 = fma(_630, _1651, _588);
    float _1685 = fma(_606, _1657, _636);
    float _1687 = _1633 + 0.5;
    float _1689 = -_1673;
    float _1691 = fma(_1573, _1547, _1689);
    float _1693 = _1677 * _1575;
    float _1695 = _1681 * _1575;
    float _1697 = _1683 + 0.5;
    float _1699 = _1685 + 0.5;
    float _1701 = -_1671;
    float _1703 = _814 * _1701;
    float _1705 = -_1573;
    float _1707 = _814 * _1705;
    float _1709 = -_644;
    float _1711 = fma(_642, _1567, _1709);
    float _1713 = _1691 * _1575;
    float _1715 = -_1693;
    float _1717 = _814 * _1715;
    float _1719 = fma(_826, _1643, _1703);
    float _1721 = _1543 + 0.5;
    float _1723 = _1711 + 0.5;
    float _1725 = fma(_826, _1569, _1707);
    float _1727 = fma(_826, _1713, _1717);
    float _1729 = _822 * _1573;
    float _1731 = _824 * _1573;
    float _1733 = _822 * _1671;
    out.m_71.x = _1687;
    out.m_71.y = _1721;
    out.m_71.z = _1697;
    out.m_71.w = _1723;
    float _1735 = _822 * _1693;
    float _1737 = _824 * _1671;
    float _1739 = fma(_844, _1569, _1731);
    float _1741 = -_590;
    float _1743 = fma(_626, _1591, _1741);
    float _1745 = -_1571;
    float _1747 = fma(_828, _1745, _1725);
    float _1749 = _824 * _1693;
    float _1751 = -_1571;
    float _1753 = fma(_858, _1751, _1739);
    float _1755 = _1743 + 0.5;
    float _1757 = -_1667;
    float _1759 = fma(_828, _1757, _1719);
    float _1761 = fma(_844, _1713, _1749);
    float _1763 = -_1695;
    float _1765 = fma(_828, _1763, _1727);
    bool _1767 = _1110 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1769 = isnan(_1110);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1775 = _1771 || _1773;
    out.m_73.x = _1699;
    out.m_73.y = _1755;
    float _1777 = fma(_840, _1643, _1733);
    float _1779 = fma(_840, _1569, _1729);
    float _1781 = fma(_840, _1713, _1735);
    float _1783 = fma(_844, _1643, _1737);
    float _1785 = -_1667;
    float _1787 = fma(_854, _1785, _1777);
    float _1789 = -_1571;
    float _1791 = fma(_854, _1789, _1779);
    float _1793 = -_1695;
    float _1795 = fma(_854, _1793, _1781);
    float _1797 = -_1667;
    float _1799 = fma(_858, _1797, _1783);
    float _1801 = _1787 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1803 = _1791 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1805 = _1787 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1807 = _1787 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1809 = _1791 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1811 = _1791 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1813 = fma(_1747, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1803);
    float _1815 = _1795 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1817 = fma(_1759, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1801);
    float _1819 = fma(_1747, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1809);
    float _1821 = fma(_1759, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1805);
    float _1823 = fma(_1759, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1807);
    float _1825 = fma(_1747, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1811);
    float _1827 = -_1695;
    float _1829 = fma(_858, _1827, _1761);
    float _1831 = _1795 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1833 = fma(_1765, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1815);
    float _1835 = fma(_1753, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1819);
    float _1837 = _1795 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1839 = fma(_1765, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1831);
    float _1841 = fma(_1829, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1833);
    float _1843 = fma(_1799, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1821);
    float _1845 = fma(_1799, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1817);
    float _1847 = fma(_1829, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1839);
    float _1849 = fma(_1753, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1813);
    float _1851 = _1843 * _960;
    float _1853 = _1843 * _976;
    float _1855 = _1843 * _938;
    float _1857 = _1463 + _1336;
    float _1859 = fma(_1753, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1825);
    float _1861 = fma(_1799, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1823);
    float _1863 = fma(_1845, _968, _1851);
    float _1865 = _1857 * 0.5;
    float _1867 = fma(_1845, _948, _1855);
    float _1869 = fma(_1845, _980, _1853);
    out.m_75.x = _1849;
    out.m_75.y = _1835;
    out.m_75.z = _1859;
    float _1871 = fma(_1765, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1837);
    out.m_77.z = _1865;
    out.m_77.w = _1336;
    float _1873 = fma(_1829, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1871);
    out.gl_Position.x = _1366;
    out.gl_Position.y = _1368;
    out.gl_Position.z = _1463;
    out.gl_Position.w = _1336;
    float _1875 = fma(_1861, _972, _1863);
    float _1877 = fma(_1861, _956, _1867);
    float _1879 = fma(_1861, _990, _1869);
    out.m_79.x = _1841;
    out.m_79.y = _1873;
    out.m_79.z = _1847;
    out.m_81.x = _1875;
    out.m_81.y = _1879;
    out.m_81.z = _1877;
    float _1881 = _1841;
    float _1883 = _1366;
    if (!_1775)
    {
        _1479 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1885 = _1479;
    float _1887 = _1885;
    float _1889 = _1885;
    if (!_1775)
    {
        _1481 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1891 = _1481;
    float _1893 = _1891;
    float _1895 = _1891;
    if (!_1775)
    {
        _1881 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1897 = _1881;
    float _1899 = _1897;
    float _1901 = _1897;
    if (!_1775)
    {
        _1483 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1903 = _1483;
    float _1905 = _1903;
    float _1907 = _1903;
    if (!_1775)
    {
        _1883 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1909 = _1883;
    float _1911 = _1635 * _1394;
    float _1913 = -_1635;
    float _1915 = _1913 + 1.0;
    float _1917 = _1411 * _1911;
    float _1919 = _1411 * _1915;
    float _1921 = _1421 * _1911;
    float _1923 = fma(_1417, _1917, _1405);
    float _1925 = fma(_1419, _1917, _1407);
    float _1927 = _1917;
    float _1929 = _1909;
    float _1931 = _1909;
    if (!_1775)
    {
        _1927 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1933 = _1927;
    float _1935 = fma(_1411, _1921, _1409);
    out.m_83.x = _1923;
    out.m_83.y = _1925;
    out.m_83.z = _1935;
    out.m_83.w = _1919;
    bool _1937 = !_1775;
    float _1939 = _1933;
    float _1941 = _1933;
    if (!_1937)
    {
        bool _1943 = _1110 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1945 = isnan(_1110);
        bool _1947 = _1943 || _1945;
        bool _1949 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1951 = _1947 || _1949;
        if (!_1951)
        {
            float _1953 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1955 = _1110 + _1953;
            float _1957 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1959 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1957;
            float _1961 = 1.0 / _1959;
            float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1965 = _1963 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1969 = _1967 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1973 = _1971 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1975 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1977 = _1975 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1981 = _1979 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1983 = _1955 * _1961;
            float _1985 = precise::clamp(_1983, 0.0, 1.0);
            float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1989 = _1987 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1991 = fma(_1985, _1965, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1993 = fma(_1985, _1989, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1995 = fma(_1985, _1969, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1997 = fma(_1985, _1973, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1999 = fma(_1985, _1977, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2001 = fma(_1985, _1981, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1901 = _1993;
            _1907 = _1999;
            _1941 = _1991;
            _1895 = _1997;
            _1889 = _1995;
            _1931 = _2001;
            _2003 = true;
        }
        else
        {
            bool _2005 = _1110 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2007 = isnan(_1110);
            bool _2009 = _2005 || _2007;
            bool _2011 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2013 = _2009 || _2011;
            if (!_2013)
            {
                _1939 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2015 = _1939;
            _1941 = _2015;
            if (!_2013)
            {
                _1899 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2017 = _1899;
            _1901 = _2017;
            if (!_2013)
            {
                _1887 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2019 = _1887;
            _1889 = _2019;
            if (!_2013)
            {
                _1893 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2021 = _1893;
            _1895 = _2021;
            if (!_2013)
            {
                _1905 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2023 = _1905;
            _1907 = _2023;
            if (!_2013)
            {
                _1929 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2025 = _1929;
            bool _2027 = !_2013;
            _1931 = _2025;
            if (!_2027)
            {
                bool _2029 = _1110 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2031 = isnan(_1110);
                bool _2033 = _2029 || _2031;
                bool _2035 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2037 = _2033 || _2035;
                if (!_2037)
                {
                    float _2039 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2041 = _1110 + _2039;
                    float _2043 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2045 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2043;
                    float _2047 = 1.0 / _2045;
                    float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2051 = _2049 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2055 = _2053 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2061 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2063 = _2061 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2065 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2067 = _2065 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2069 = _2041 * _2047;
                    float _2071 = precise::clamp(_2069, 0.0, 1.0);
                    float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2077 = fma(_2071, _2051, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2079 = fma(_2071, _2075, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2081 = fma(_2071, _2055, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2083 = fma(_2071, _2059, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2085 = fma(_2071, _2063, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2087 = fma(_2071, _2067, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1901 = _2079;
                    _1907 = _2085;
                    _1941 = _2077;
                    _1895 = _2083;
                    _1889 = _2081;
                    _1931 = _2087;
                    _2003 = true;
                }
                else
                {
                    _1901 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1907 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1941 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1895 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1889 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1931 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2003 = false;
    float _2089 = _1901;
    float _2091 = _1907;
    float _2093 = _1941;
    float _2095 = _1895;
    float _2097 = _1889;
    float _2099 = _1931;
    float _2101 = fma(_1879, -0.5, 0.5);
    float _2103 = precise::clamp(_2101, 0.0, 1.0);
    float _2105 = -_2089;
    float _2107 = _2105 + _2091;
    float _2109 = -_2093;
    float _2111 = _2109 + _2095;
    float _2113 = -_2097;
    float _2115 = _2113 + _2099;
    bool _2117 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2119 = fma(_2103, _2107, _2089);
    float _2121 = fma(_2103, _2111, _2093);
    float _2123 = fma(_2103, _2115, _2097);
    float _2125 = _2119 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2127 = fma(_2121, 0.298911988735198974609375, _2125);
    float _2129 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2131 = fma(_2123, 0.114477999508380889892578125, _2127);
    out.m_85.w = _2129;
    float _2133 = -_2131;
    float _2135 = _2121 + _2133;
    float _2137 = -_2131;
    float _2139 = _2119 + _2137;
    float _2141 = -_2131;
    float _2143 = _2123 + _2141;
    out.m_87.x = 0.0;
    float _2145 = fma(_2135, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2131);
    float _2147 = fma(_2139, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2131);
    float _2149 = fma(_2143, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2131);
    out.m_89.x = _2145;
    out.m_89.y = _2147;
    out.m_89.z = _2149;
    if (!_2117)
    {
        return out;
    }
    float _2151 = -_1084;
    float _2153 = _2151 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2155 = -_1086;
    float _2157 = _2155 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2159 = -_1088;
    float _2161 = _2159 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2163 = _2153 * _2153;
    float _2165 = fma(_2157, _2157, _2163);
    float _2167 = fma(_2161, _2161, _2165);
    float _2169 = sqrt(_2167);
    float _2171 = rsqrt(_2167);
    float _2173 = -_2169;
    float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2177 = _2175 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2179 = precise::clamp(_2177, 0.0, 1.0);
    float _2181 = _2157 * _2171;
    float _2183 = _2153 * _2171;
    float _2185 = abs(_2179);
    float _2187 = log2(_2185);
    float _2189 = _2161 * _2171;
    float _2191 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2193 = _1879 * _2183;
    float _2195 = -_2183;
    float _2197 = -_2191;
    float _2199 = fma(_2195, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2197);
    float _2201 = fma(_1875, _2181, _2193);
    float _2203 = -_2189;
    float _2205 = fma(_2203, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2199);
    float _2207 = fma(_1877, _2189, _2201);
    float _2209 = precise::clamp(_2207, 0.0, 1.0);
    float _2211 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2213 = _2205 + _2211;
    float _2215 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2217 = _2213 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2219 = precise::clamp(_2217, 0.0, 1.0);
    float _2221 = exp2(_2215);
    float _2223 = _2221 * _2219;
    float _2225 = _2209 * _2223;
    float _2227 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2229 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2231 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2227;
    out.m_87.y = _2229;
    out.m_87.z = _2231;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2003 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = in.m_46.w;
    float _107 = trunc(_103);
    int _110 = int(_107);
    float _112 = -_105;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _114;
    bool _118 = _110 >= 1;
    float _120 = 0.0;
    float _122 = _105;
    float _124 = _114;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _120;
    if (!_118)
    {
        out.m_51.x = 0.0;
    }
    int _128 = 0;
    if (!_118)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2299 = as_type<float>(_132);
        out.gl_Position.z = _2299;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _136 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_105);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = in.m_53.x;
    float _148 = float(_110);
    float _150 = in.m_53.y;
    bool _152 = _114 >= _148;
    bool _154 = !_144;
    bool _156 = _152 || _154;
    float _158 = 1.0 / _148;
    float _160 = in.m_53.z;
    float _162 = in.m_53.w;
    if (_156)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _122;
    if (_156)
    {
        out.m_51.x = 0.0;
    }
    if (_156)
    {
        float _166 = _164 * 5.0;
        _134 = as_type<int>(_166);
    }
    int _168 = _134;
    float _170 = _114 * _158;
    out.m_55.x = _146;
    int _172 = as_type<int>(_146);
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2371 = as_type<float>(_168);
        out.gl_Position.z = _2371;
    }
    out.m_55.y = _150;
    out.m_55.z = _160;
    out.m_55.w = _162;
    out.m_49.x = _170;
    float _174 = _162;
    if (_156)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _176 = in.m_57.x;
    float _178 = in.m_57.y;
    float _180 = in.m_57.z;
    float _182 = _160 * 2.0;
    float _184 = _146 * 2.0;
    float _186 = _150 * 2.0;
    float _188 = floor(_182);
    float _190 = _146 + _160;
    int _192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _194 = _192 != 0;
    float _196 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _198 = _150 + _160;
    float _200 = _190 + (-1.0);
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _204 = floor(_184);
    float _206 = _198 + (-1.0);
    float _208 = -_202;
    float _210 = fma(_196, 2.0, _208);
    float _212 = _150 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _214 = _146 + _150;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _218 = _184 + (-1.0);
    float _220 = floor(_186);
    bool _222 = _188 > 0.0;
    float _224 = _214 + (-1.0);
    float _226 = _180 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _228 = _176 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _230 = _178 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _232 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _234 = _200;
    float _236 = _182;
    if (_194)
    {
        _234 = _146;
    }
    float _238 = _234;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _242 = _238;
    if (!_194)
    {
        _242 = _160;
    }
    float _244 = _242;
    float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _248 = log2(_246);
    bool _250 = _204 > 0.0;
    float _252 = fma(_212, -2.0, _240);
    bool _254 = _188 >= 0.0;
    bool _256 = isnan(_188);
    bool _258 = _254 || _256;
    bool _260 = isnan(0.0);
    bool _262 = _258 || _260;
    float _264 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _266 = _204 >= 0.0;
    bool _268 = isnan(_204);
    bool _270 = _266 || _268;
    bool _272 = isnan(0.0);
    bool _274 = _270 || _272;
    float _276 = _244 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _278 = _186 + (-1.0);
    bool _280 = _220 > 0.0;
    float _282 = -_216;
    float _284 = fma(_276, 2.0, _282);
    bool _286 = _220 >= 0.0;
    bool _288 = isnan(_220);
    bool _290 = _286 || _288;
    bool _292 = isnan(0.0);
    bool _294 = _290 || _292;
    float _296 = _278 * _278;
    int _298 = _262 ? 0 : 1;
    float _300 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _302 = _274 ? 0 : 1;
    float _304 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _306 = ~_298;
    int _308 = _306 + 1;
    int _310 = _308 + 1;
    int _312 = ~_302;
    int _314 = _312 + 1;
    int _316 = _314 + 1;
    int _318 = _310;
    int _320 = _316;
    float _322 = _304;
    if (!_222)
    {
        int _324 = ~_298;
        int _326 = _324 + 1;
        _318 = _326;
    }
    int _328 = _318;
    float _330 = fma(_218, _218, _296);
    float _332 = _330;
    if (!_250)
    {
        int _334 = ~_302;
        int _336 = _334 + 1;
        _320 = _336;
    }
    int _338 = _320;
    float _340 = _182 + (-1.0);
    float _342 = fma(_340, _340, _330);
    if (!_194)
    {
        _236 = _150;
    }
    float _344 = _236;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _348 = _344;
    if (_194)
    {
        _348 = _146;
    }
    float _350 = _348;
    float _352 = rsqrt(_342);
    bool _354 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _358 = _354 || _356;
    bool _360 = isnan(1.0);
    bool _362 = _358 || _360;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _366 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[83].z, _346);
    if (!_194)
    {
        _332 = _160;
    }
    float _368 = _332;
    float _370 = _350 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _372 = _368;
    float _374 = _370;
    if (_194)
    {
        _372 = _150;
    }
    float _376 = _372;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _380 = _294 ? 0 : 1;
    float _382 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[83].w, _364);
    float _384 = -_378;
    float _386 = fma(_370, 2.0, _384);
    float _388 = _376;
    if (!_194)
    {
        _374 = _160;
    }
    float _390 = _374;
    float _392 = 0.0;
    float _394 = _390;
    if (!_362)
    {
        float _396 = _304 * _304;
        float _398 = _396 * 0.5;
        _392 = _398;
    }
    float _400 = _392;
    float _402 = _278 * _352;
    float _404 = _218 * _352;
    float _406 = _340 * _352;
    float _408 = _400;
    if (_194)
    {
        _388 = _150;
    }
    float _410 = _388;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _414 = _410;
    if (!_362)
    {
        float _416 = _400 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _408 = _416;
    }
    float _418 = _408;
    float _420 = _418;
    if (_194)
    {
        _394 = _150;
    }
    float _422 = _394;
    if (!_194)
    {
        _414 = _146;
    }
    float _424 = _414;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _428 = ~_380;
    int _430 = _428 + 1;
    int _432 = _430 + 1;
    float _434 = _422 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _436 = _432;
    if (!_280)
    {
        int _438 = ~_380;
        int _440 = _438 + 1;
        _436 = _440;
    }
    int _442 = _436;
    float _444 = _424 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _446 = !_362;
    if (!_446)
    {
        float _448 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _450 = log2(_448);
        float _452 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _454 = _452 + 1.0;
        float _456 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _458 = _304 * _450;
        float _460 = 1.0 / _454;
        float _462 = _456 * 0.693147182464599609375;
        float _464 = exp2(_458);
        float _466 = 1.0 / _462;
        float _468 = _464 + (-1.0);
        float _470 = -_468;
        float _472 = fma(_470, _466, _304);
        float _474 = _472 * _460;
        float _476 = _474 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _420 = _476;
    }
    float _478 = _420;
    bool _480 = !_362;
    if (!_480)
    {
        float _482 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _484 = log2(_482);
        float _486 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _488 = _486 + 1.0;
        float _490 = 1.0 / _488;
        float _492 = _304 * _484;
        float _494 = exp2(_492);
        float _496 = -_494;
        float _498 = _496 + 1.0;
        float _500 = _498 * _490;
        _322 = _500;
    }
    float _502 = _322;
    float _504 = fma(_444, -2.0, _412);
    float _506 = fma(_434, -2.0, _426);
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _510 = _508 != 0;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _514 = _512 != 0;
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _518 = _516 != 0;
    float _520 = _248 * _114;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _524 = in.m_59.x;
    float _526 = in.m_59.y;
    float _528 = in.m_59.z;
    float _530 = exp2(_520);
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _534 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[88].z, _522);
    bool _536 = !_510;
    int _538 = _536 ? 0 : 1;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _542 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _532);
    float _544 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[76].y, _252);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _548 = 1.0 + _546;
    int _550 = abs(_538);
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _554 = float(_328);
    float _556 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[78].w, _540);
    bool _558 = !_514;
    int _560 = _558 ? 0 : 1;
    float _562 = 1.0 / _548;
    float _564 = float(_550);
    float _566 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[88].w, _552);
    bool _568 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _570 = isnan(1.0);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _576 = _572 || _574;
    float _578 = -_114;
    float _580 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[76].x, _210);
    int _582 = abs(_560);
    float _584 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].w, _556);
    float _586 = -_114;
    float _588 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[81].x, _386);
    float _590 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[86].y, _504);
    float _592 = _564 * _554;
    float _594 = -_530;
    float _596 = _594 + 1.0;
    float _598 = in.m_61.x;
    float _600 = in.m_61.y;
    float _602 = in.m_61.z;
    float _604 = float(_338);
    float _606 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[87].z, _534);
    bool _608 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _610 = isnan(0.0);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _616 = _612 || _614;
    float _618 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].z, _542);
    float _620 = _402 * _402;
    bool _622 = !_518;
    int _624 = _622 ? 0 : 1;
    float _626 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[87].w, _566);
    float _628 = _616 ? _596 : 0.0;
    float _630 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].z, _366);
    float _632 = float(_582);
    float _634 = -_114;
    float _636 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[86].x, _284);
    int _638 = abs(_624);
    float _640 = _592 * (-2.0);
    float _642 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].w, _382);
    float _644 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[81].y, _506);
    if (_576)
    {
        float _646 = _628 * _562;
        _124 = _646;
    }
    float _648 = _124;
    float _650 = _632 * _604;
    float _652 = fma(_404, _404, _620);
    float _654 = _146 + (-0.5);
    float _656 = float(_442);
    float _658 = fma(_640, _524, _524);
    float _660 = float(_638);
    float _662 = _650 * (-2.0);
    float _664 = fma(_300, _640, _300);
    float _666 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[196].x, _658);
    float _668 = _228 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _670 = _660 * _656;
    float _672 = fma(_264, _662, _264);
    float _674 = fma(_662, _526, _526);
    float _676 = _150 + (-0.5);
    float _678 = fma(_664, _648, _666);
    float _680 = _670 * (-2.0);
    float _682 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _598);
    float _684 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[196].y, _674);
    float _686 = _678 * 0.15915493667125701904296875;
    float _688 = fma(_406, _406, _652);
    float _690 = in.m_46.x;
    float _692 = in.m_46.y;
    float _694 = in.m_46.z;
    float _696 = fma(_672, _648, _684);
    float _698 = _682 * _668;
    float _700 = fma(_680, _528, _528);
    float _702 = _160 + (-0.5);
    float _704 = rsqrt(_688);
    float _706 = _226 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _708 = fma(_232, _680, _232);
    float _710 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[196].z, _700);
    float _712 = in.m_57.w;
    float _714 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _600);
    float _716 = _230 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _718 = _686 * 6.283185482025146484375;
    float _720 = sin(_718);
    float _722 = _696 * 0.15915493667125701904296875;
    float _724 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _602);
    float _726 = in.m_44.x;
    float _728 = in.m_44.y;
    float _730 = in.m_44.z;
    float _732 = _714 * _716;
    float _734 = _478 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _736 = _724 * _706;
    float _738 = fma(_708, _648, _710);
    float _740 = _686 * 6.283185482025146484375;
    float _742 = cos(_740);
    float _744 = _170 * 2.5;
    float _746 = precise::clamp(_744, 0.0, 1.0);
    float _748 = _404 * _704;
    float _750 = fma(_502, _690, _734);
    float _752 = _478 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _754 = _402 * _704;
    float _756 = _406 * _704;
    float _758 = _722 * 6.283185482025146484375;
    float _760 = sin(_758);
    float _762 = fma(_502, _692, _752);
    float _764 = fma(_170, 1.66666662693023681640625, -0.666666686534881591796875);
    float _766 = precise::clamp(_764, 0.0, 1.0);
    float _768 = _738 * 0.15915493667125701904296875;
    float _770 = _722 * 6.283185482025146484375;
    float _772 = cos(_770);
    float _774 = -_746;
    float _776 = _774 + 1.0;
    float _778 = _766 * _766;
    float _780 = _478 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _782 = fma(_762, _712, _728);
    float _784 = -_776;
    float _786 = fma(_784, _776, 1.0);
    float _788 = -_778;
    float _790 = _788 + 1.0;
    float _792 = fma(_502, _694, _780);
    float _794 = _768 * 6.283185482025146484375;
    float _796 = cos(_794);
    float _798 = _162 * 6.0;
    float _800 = _790 * _786;
    float _802 = fma(_750, _712, _726);
    float _804 = _742 * _760;
    float _806 = _720 * _760;
    float _808 = _790 * _798;
    float _810 = fma(_792, _712, _730);
    float _812 = _768 * 6.283185482025146484375;
    float _814 = sin(_812);
    float _816 = _742 * _772;
    float _818 = _720 * _772;
    float _820 = _808 * 0.15915493667125701904296875;
    float _822 = _742 * _796;
    float _824 = _720 * _796;
    float _826 = _772 * _796;
    float _828 = _760 * _796;
    float _830 = _822 * _736;
    float _832 = _820 * 6.283185482025146484375;
    float _834 = cos(_832);
    float _836 = -_736;
    float _838 = _814 * _836;
    float _840 = fma(_814, _816, _806);
    float _842 = -_804;
    float _844 = fma(_814, _818, _842);
    float _846 = _824 * _736;
    float _848 = fma(_826, _698, _838);
    float _850 = _782 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _852 = -_818;
    float _854 = fma(_814, _804, _852);
    float _856 = fma(_840, _698, _830);
    float _858 = fma(_814, _806, _816);
    float _860 = fma(_844, _698, _846);
    float _862 = _782 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _864 = _782 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _866 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[4].x, _850);
    float _868 = -_732;
    float _870 = fma(_854, _868, _856);
    float _872 = -_732;
    float _874 = fma(_828, _872, _848);
    float _876 = -_732;
    float _878 = fma(_858, _876, _860);
    float _880 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[5].x, _862);
    float _882 = _820 * 6.283185482025146484375;
    float _884 = sin(_882);
    float _886 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[6].x, _864);
    float _888 = _870 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _890 = _870 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _892 = _870 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _894 = fma(_810, (*spvDescriptorSet0.vp_c10)._m0[6].z, _886);
    float _896 = fma(_874, (*spvDescriptorSet0.vp_c10)._m0[8].x, _888);
    float _898 = fma(_874, (*spvDescriptorSet0.vp_c10)._m0[9].x, _890);
    float _900 = fma(_874, (*spvDescriptorSet0.vp_c10)._m0[10].x, _892);
    float _902 = fma(_810, (*spvDescriptorSet0.vp_c10)._m0[5].z, _880);
    float _904 = fma(_810, (*spvDescriptorSet0.vp_c10)._m0[4].z, _866);
    float _906 = fma(_878, (*spvDescriptorSet0.vp_c10)._m0[8].z, _896);
    float _908 = fma(_878, (*spvDescriptorSet0.vp_c10)._m0[9].z, _898);
    float _910 = fma(_878, (*spvDescriptorSet0.vp_c10)._m0[10].z, _900);
    float _912 = _894 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _914 = _902 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _916 = -_834;
    float _918 = _916 + 1.0;
    float _920 = _904 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _922 = _748 * _884;
    float _924 = fma(_908, _800, _914);
    float _926 = _754 * _918;
    float _928 = fma(_906, _800, _920);
    float _930 = fma(_910, _800, _912);
    float _932 = _754 * _884;
    float _934 = _756 * _884;
    float _936 = _748 * _918;
    float _938 = fma(_756, _926, _922);
    float _940 = -_914;
    float _942 = _940 + _924;
    float _944 = _756 * _756;
    float _946 = -_932;
    float _948 = fma(_756, _936, _946);
    float _950 = -_920;
    float _952 = _950 + _928;
    float _954 = _938 * _942;
    float _956 = fma(_918, _944, _834);
    float _958 = -_934;
    float _960 = fma(_754, _936, _958);
    float _962 = -_912;
    float _964 = _962 + _930;
    float _966 = fma(_948, _952, _954);
    float _968 = fma(_748, _936, _834);
    float _970 = _960 * _942;
    float _972 = fma(_756, _936, _932);
    float _974 = fma(_956, _964, _966);
    float _976 = fma(_754, _926, _834);
    float _978 = fma(_968, _952, _970);
    float _980 = fma(_754, _936, _934);
    float _982 = _912 + _974;
    float _984 = _976 * _942;
    float _986 = fma(_972, _964, _978);
    float _988 = -_922;
    float _990 = fma(_756, _926, _988);
    float _992 = fma(_170, 8.0, _982);
    float _994 = fma(_980, _952, _984);
    float _996 = _920 + _986;
    float _998 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1000 = _992 + _998;
    float _1002 = fma(_990, _964, _994);
    float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1006 = _996 + _1004;
    float _1008 = _1000 * _1000;
    float _1010 = _914 + _1002;
    float _1012 = fma(_1006, _1006, _1008);
    float _1014 = fma(_778, -40.0, _1010);
    float _1016 = sqrt(_1012);
    bool _1018 = _1016 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1020 = _778;
    float _1022 = _914;
    float _1024 = _1010;
    float _1026 = _1014;
    float _1028 = _1006;
    float _1030 = _820;
    float _1032 = _1000;
    if (!_1018)
    {
        _1020 = _996;
    }
    float _1034 = _1020;
    float _1036 = _1034;
    if (!_1018)
    {
        _1022 = _992;
    }
    float _1038 = _1022;
    float _1040 = _1038;
    if (!_1018)
    {
        _1024 = _1014;
    }
    float _1042 = _1024;
    bool _1044 = !_1018;
    float _1046 = _1042;
    if (!_1044)
    {
        float _1048 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1052 = _1016 + _1050;
        float _1054 = rsqrt(_1012);
        float _1056 = _1052 * _1048;
        float _1058 = _1014 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1060 = _1056 * 0.15915493667125701904296875;
        float _1062 = _1060 * 6.283185482025146484375;
        float _1064 = cos(_1062);
        float _1066 = _1060 * 6.283185482025146484375;
        float _1068 = sin(_1066);
        float _1070 = _1064 + (-1.0);
        float _1072 = _1070 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1074 = fma(_1068, _1058, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1076 = fma(_1014, _1064, _1072);
        float _1078 = _1054 * _1074;
        float _1080 = fma(_1006, _1078, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1082 = fma(_1000, _1078, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1046 = _1076;
        _1036 = _1080;
        _1040 = _1082;
    }
    float _1084 = _1046;
    float _1086 = _1036;
    float _1088 = _1040;
    float _1090 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1092 = _1084 + _1090;
    float _1094 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1096 = _1086 + _1094;
    float _1098 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1100 = _1088 + _1098;
    float _1102 = _1092 * _1092;
    float _1104 = fma(_1096, _1096, _1102);
    float _1106 = fma(_1100, _1100, _1104);
    float _1108 = rsqrt(_1106);
    float _1110 = sqrt(_1106);
    float _1112 = _1108 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1114 = _1096 * _1112;
    float _1116 = _1100 * _1112;
    float _1118 = _1114 * _1114;
    float _1120 = _1116 * _1116;
    float _1122 = _1118 + _1120;
    float _1124 = sqrt(_1122);
    bool _1126 = _1124 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1128 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1130 = _1124 + _1128;
    float _1132 = _1108;
    float _1134 = _1130;
    float _1136 = _1092;
    if (_1126)
    {
        float _1138 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1132 = _1138;
    }
    float _1140 = _1132;
    if (_1126)
    {
        float _1142 = rsqrt(_1122);
        _1026 = _1142;
    }
    float _1144 = _1026;
    float _1146 = _1144;
    if (_1126)
    {
        float _1148 = _1130 * _1140;
        _1134 = _1148;
    }
    float _1150 = _1134;
    if (_1126)
    {
        float _1152 = _1150 * 0.15915493667125701904296875;
        _1028 = _1152;
    }
    float _1154 = _1028;
    float _1156 = _1100;
    if (_1126)
    {
        float _1158 = _1154 * 6.283185482025146484375;
        float _1160 = sin(_1158);
        _1156 = _1160;
    }
    float _1162 = _1156;
    float _1164 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1166 = precise::max(0.0, _1164);
    float _1168 = _1140;
    float _1170 = _1166;
    if (_1126)
    {
        float _1172 = _1154 * 6.283185482025146484375;
        float _1174 = cos(_1172);
        _1168 = _1174;
    }
    float _1176 = _1168;
    float _1178 = -_1112;
    float _1180 = -_1166;
    float _1182 = fma(_1092, _1178, _1180);
    if (_1126)
    {
        float _1184 = _1182 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1136 = _1184;
    }
    float _1186 = _1136;
    float _1188 = _1186;
    float _1190 = _1162;
    if (_1126)
    {
        float _1192 = fma(_1162, _1186, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1188 = _1192;
    }
    float _1194 = _1188;
    float _1196 = _1194;
    if (!_1126)
    {
        _1190 = _1182;
    }
    float _1198 = _1190;
    float _1200 = _1198;
    float _1202 = _1176;
    if (_1126)
    {
        float _1204 = _1176 + (-1.0);
        _1170 = _1204;
    }
    float _1206 = _1170;
    float _1208 = _1206;
    if (_1126)
    {
        float _1210 = _1144 * _1194;
        _1030 = _1210;
    }
    float _1212 = _1030;
    if (!_1126)
    {
        _1146 = _1114;
    }
    float _1214 = _1146;
    float _1216 = _1214;
    if (_1126)
    {
        float _1218 = _1206 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1032 = _1218;
    }
    float _1220 = _1032;
    if (_1126)
    {
        float _1222 = _1114 * _1212;
        _1216 = _1222;
    }
    float _1224 = _1216;
    if (!_1126)
    {
        _1208 = _1116;
    }
    float _1226 = _1208;
    float _1228 = _1226;
    if (_1126)
    {
        float _1230 = _1116 * _1212;
        _1228 = _1230;
    }
    float _1232 = _1228;
    if (!_1126)
    {
        _1196 = _1118;
    }
    float _1234 = _1196;
    float _1236 = _1234;
    if (_1126)
    {
        float _1238 = fma(_1182, _1176, _1220);
        _1200 = _1238;
    }
    float _1240 = _1200;
    if (_1126)
    {
        float _1242 = _1224 * _1224;
        _1236 = _1242;
    }
    float _1244 = _1236;
    if (!_1126)
    {
        _1202 = _1120;
    }
    float _1246 = _1202;
    float _1248 = _1246;
    if (_1126)
    {
        float _1250 = _1232 * _1232;
        _1248 = _1250;
    }
    float _1252 = _1248;
    float _1254 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1256 = fma(_1240, _1240, _1244);
    float _1258 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1260 = fma(_1110, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1258);
    float _1262 = precise::clamp(_1260, 0.0, 1.0);
    float _1264 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1266 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1254);
    float _1268 = _1256 + _1252;
    float _1270 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1272 = -_1262;
    float _1274 = _1272 + 1.0;
    float _1276 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1266);
    float _1278 = rsqrt(_1268);
    float _1280 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1282 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1270);
    float _1284 = _1276 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1286 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1288 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1280);
    float _1290 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1282);
    float _1292 = _1284 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1294 = abs(_1274);
    float _1296 = log2(_1294);
    float _1298 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1288);
    float _1300 = _1290 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1302 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1264);
    float _1304 = -_1292;
    float _1306 = fma(_1304, _1286, 1.0);
    float _1308 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1310 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1312 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1302);
    float _1314 = _1278 * _1224;
    float _1316 = _1278 * _1240;
    float _1318 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1310);
    float _1320 = _1278 * _1232;
    float _1322 = _1314 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1324 = _1312 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1326 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1318);
    float _1328 = log2(_1306);
    float _1330 = -_1322;
    float _1332 = fma(_1316, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1330);
    float _1334 = _1296 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1336 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1326);
    float _1338 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1340 = -_1320;
    float _1342 = fma(_1340, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1332);
    float _1344 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1346 = exp2(_1334);
    float _1348 = fma(_1342, -0.5, 0.5);
    float _1350 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1344);
    float _1352 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1338);
    float _1354 = fma(_1342, 0.5, 0.5);
    float _1356 = _1316 + 1.0;
    float _1358 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1350);
    float _1360 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1352);
    float _1362 = 1.0 / _1336;
    float _1364 = fma(_1354, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1366 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1358);
    float _1368 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1360);
    float _1370 = _1328 * 0.693147182464599609375;
    float _1372 = fma(_1354, _1364, -0.212114393711090087890625);
    float _1374 = sqrt(_1348);
    float _1376 = -_1316;
    float _1378 = fma(_1346, _1356, _1376);
    float _1380 = fma(_1354, _1372, 1.570728778839111328125);
    float _1382 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1384 = _1366 * _1362;
    float _1386 = _1368 * _1362;
    float _1388 = fma(_1384, 0.5, 0.5);
    float _1390 = fma(_1386, -0.5, 0.5);
    float _1392 = _1374 * 0.636619746685028076171875;
    float3 _4332 = float3(_1388, _1390, _1382);
    float _1394 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4332, float3(0.0), isnan(_4332)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4332, float3(0.0), isnan(_4332)), level(0.0)).x;
    float _1396 = -_1380;
    float _1398 = fma(_1392, _1396, 1.0);
    float _1400 = fma(_1378, 0.5, 0.5);
    float3 _4350 = float3(_1388, _1390, _1382);
    float4 _1403 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4350, float3(0.0), isnan(_4350)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4350, float3(0.0), isnan(_4350)), level(0.0)).xyzw;
    float _1405 = _1403.x;
    float _1407 = _1403.y;
    float _1409 = _1403.z;
    float _1411 = _1403.w;
    float2 _4367 = float2(_1398, _1400);
    float3 _1415 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4367, float2(0.0), isnan(_4367)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4367, float2(0.0), isnan(_4367)), level(0.0)).xyz;
    float _1417 = _1415.x;
    float _1419 = _1415.y;
    float _1421 = _1415.z;
    float _1423 = in.m_63.y;
    float _1425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1427 = _162 > 0.5;
    float _1429 = in.m_63.x;
    int _1431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1433 = _1431 != 0;
    float _1435 = _1296 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1437 = _150 > 0.5;
    float _1439 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1443 = _1441 != 0;
    float _1445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1449 = _1447 != 0;
    float _1451 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1439);
    bool _1453 = _160 > 0.5;
    out.m_65.x = _1086;
    out.m_65.y = _1084;
    out.m_65.z = _1088;
    int _1455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1457 = _1455 != 0;
    float _1459 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1451);
    float _1461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1463 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1459);
    float _1465 = -_1423;
    float _1467 = _1465 + 1.0;
    float _1469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1471 = _1445 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1473 = _1423;
    bool _1475 = _1443;
    float _1477 = _1471;
    float _1479 = _1336;
    float _1481 = _1463;
    float _1483 = _1368;
    if (!_1433)
    {
        _174 = _1429;
    }
    float _1485 = _174;
    float _1487 = _1427 ? _1467 : _1423;
    int _1489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1491 = _1489 != 0;
    int _1493 = _1437 ? as_type<int>(_1467) : as_type<int>(_1423);
    float _1495 = exp2(_1435);
    float _1497 = _1491 ? _1487 : _1423;
    float _1499 = _1449 ? as_type<float>(_1493) : _1423;
    float _1501 = _1425 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1503 = _1487;
    float _1505 = _1485;
    int _1507 = as_type<int>(_1501);
    if (!_1433)
    {
        _1503 = _1485;
    }
    float _1509 = _1503;
    float _1511 = _1509;
    if (_1433)
    {
        _1505 = _1429;
    }
    float _1513 = _1505;
    float _1515 = fma(_1501, _1499, -0.5);
    float _1517 = _1513;
    if (_1443)
    {
        float _1519 = _1453 ? _1467 : _1423;
        _1473 = _1519;
    }
    float _1521 = _1473;
    float _1523 = _1461 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1525 = _1523;
    if (_1433)
    {
        bool _1527 = _146 > 0.5;
        _1475 = _1527;
    }
    bool _1529 = _1475;
    if (_1433)
    {
        float _1531 = -_1513;
        float _1533 = _1531 + 1.0;
        _1507 = as_type<int>(_1533);
    }
    int _1535 = _1507;
    int _1537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1539 = _1537 != 0;
    float _1541 = -_544;
    float _1543 = fma(_584, _1515, _1541);
    float _1545 = in.m_67.x;
    float _1547 = in.m_67.y;
    float _1549 = in.m_67.z;
    bool _1551 = _600 != 0.0;
    bool _1553 = isnan(_600);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan(0.0);
    bool _1559 = _1555 || _1557;
    float _1561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1433)
    {
        float _1563 = _1529 ? as_type<float>(_1535) : _1513;
        _1511 = _1563;
    }
    float _1565 = _1511;
    float _1567 = fma(_1497, _1471, -0.5);
    float _1569 = in.m_69.x;
    float _1571 = in.m_69.y;
    float _1573 = in.m_69.z;
    float _1575 = in.m_69.w;
    bool _1577 = _598 == 0.0;
    bool _1579 = !_1559;
    bool _1581 = _1577 && _1579;
    if (_1457)
    {
        float _1583 = -_1513;
        float _1585 = _1583 + 1.0;
        _172 = as_type<int>(_1585);
    }
    int _1587 = _172;
    float _1589 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1591 = fma(_1523, _1521, -0.5);
    float _1593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1595 = _602 == 0.0;
    bool _1597 = _1595 && _1581;
    int _1599 = 0;
    float _1601 = as_type<float>(_1587);
    if (_1539)
    {
        float _1603 = -_1513;
        float _1605 = _1603 + 1.0;
        _1599 = as_type<int>(_1605);
    }
    int _1607 = _1599;
    if (!_1539)
    {
        _1525 = _1513;
    }
    float _1609 = _1525;
    float _1611 = fma(_1589, _1565, -0.5);
    float _1613 = _1609;
    if (!_1457)
    {
        _1477 = _1513;
    }
    float _1615 = _1477;
    float _1617 = -_1495;
    float _1619 = _1617 + 1.0;
    float _1621 = _1615;
    if (_1539)
    {
        float _1623 = _1437 ? as_type<float>(_1607) : _1513;
        _1613 = _1623;
    }
    float _1625 = _1613;
    float _1627 = _1561 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1457)
    {
        float _1629 = _1453 ? as_type<float>(_1587) : _1513;
        _1621 = _1629;
    }
    float _1631 = _1621;
    float _1633 = fma(_618, _1611, _580);
    float _1635 = _1619 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1597)
    {
        _1601 = _1545;
    }
    float _1637 = _1601;
    float _1639 = _1637;
    if (!_1597)
    {
        float _1641 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1545);
        _1639 = _1641;
    }
    float _1643 = _1639;
    float _1645 = _1593 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1647 = _1593;
    if (_1597)
    {
        _1517 = _1547;
    }
    float _1649 = _1517;
    float _1651 = fma(_1627, _1631, -0.5);
    float _1653 = _1569 * _1547;
    float _1655 = _1573 * _1545;
    float _1657 = fma(_1645, _1625, -0.5);
    float _1659 = _1649;
    if (_1597)
    {
        _1647 = _1549;
    }
    float _1661 = _1647;
    float _1663 = _1661;
    if (!_1597)
    {
        float _1665 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1547);
        _1659 = _1665;
    }
    float _1667 = _1659;
    if (!_1597)
    {
        float _1669 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1549);
        _1663 = _1669;
    }
    float _1671 = _1663;
    float _1673 = _1571 * _1549;
    float _1675 = -_1653;
    float _1677 = fma(_1571, _1545, _1675);
    float _1679 = -_1655;
    float _1681 = fma(_1569, _1549, _1679);
    float _1683 = fma(_630, _1651, _588);
    float _1685 = fma(_606, _1657, _636);
    float _1687 = _1633 + 0.5;
    float _1689 = -_1673;
    float _1691 = fma(_1573, _1547, _1689);
    float _1693 = _1677 * _1575;
    float _1695 = _1681 * _1575;
    float _1697 = _1683 + 0.5;
    float _1699 = _1685 + 0.5;
    float _1701 = -_1671;
    float _1703 = _814 * _1701;
    float _1705 = -_1573;
    float _1707 = _814 * _1705;
    float _1709 = -_644;
    float _1711 = fma(_642, _1567, _1709);
    float _1713 = _1691 * _1575;
    float _1715 = -_1693;
    float _1717 = _814 * _1715;
    float _1719 = fma(_826, _1643, _1703);
    float _1721 = _1543 + 0.5;
    float _1723 = _1711 + 0.5;
    float _1725 = fma(_826, _1569, _1707);
    float _1727 = fma(_826, _1713, _1717);
    float _1729 = _822 * _1573;
    float _1731 = _824 * _1573;
    float _1733 = _822 * _1671;
    out.m_71.x = _1687;
    out.m_71.y = _1721;
    out.m_71.z = _1697;
    out.m_71.w = _1723;
    float _1735 = _822 * _1693;
    float _1737 = _824 * _1671;
    float _1739 = fma(_844, _1569, _1731);
    float _1741 = -_590;
    float _1743 = fma(_626, _1591, _1741);
    float _1745 = -_1571;
    float _1747 = fma(_828, _1745, _1725);
    float _1749 = _824 * _1693;
    float _1751 = -_1571;
    float _1753 = fma(_858, _1751, _1739);
    float _1755 = _1743 + 0.5;
    float _1757 = -_1667;
    float _1759 = fma(_828, _1757, _1719);
    float _1761 = fma(_844, _1713, _1749);
    float _1763 = -_1695;
    float _1765 = fma(_828, _1763, _1727);
    bool _1767 = _1110 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1769 = isnan(_1110);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1775 = _1771 || _1773;
    out.m_73.x = _1699;
    out.m_73.y = _1755;
    float _1777 = fma(_840, _1643, _1733);
    float _1779 = fma(_840, _1569, _1729);
    float _1781 = fma(_840, _1713, _1735);
    float _1783 = fma(_844, _1643, _1737);
    float _1785 = -_1667;
    float _1787 = fma(_854, _1785, _1777);
    float _1789 = -_1571;
    float _1791 = fma(_854, _1789, _1779);
    float _1793 = -_1695;
    float _1795 = fma(_854, _1793, _1781);
    float _1797 = -_1667;
    float _1799 = fma(_858, _1797, _1783);
    float _1801 = _1787 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1803 = _1791 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1805 = _1787 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1807 = _1787 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1809 = _1791 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1811 = _1791 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1813 = fma(_1747, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1803);
    float _1815 = _1795 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1817 = fma(_1759, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1801);
    float _1819 = fma(_1747, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1809);
    float _1821 = fma(_1759, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1805);
    float _1823 = fma(_1759, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1807);
    float _1825 = fma(_1747, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1811);
    float _1827 = -_1695;
    float _1829 = fma(_858, _1827, _1761);
    float _1831 = _1795 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1833 = fma(_1765, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1815);
    float _1835 = fma(_1753, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1819);
    float _1837 = _1795 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1839 = fma(_1765, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1831);
    float _1841 = fma(_1829, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1833);
    float _1843 = fma(_1799, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1821);
    float _1845 = fma(_1799, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1817);
    float _1847 = fma(_1829, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1839);
    float _1849 = fma(_1753, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1813);
    float _1851 = _1843 * _960;
    float _1853 = _1843 * _976;
    float _1855 = _1843 * _938;
    float _1857 = _1463 + _1336;
    float _1859 = fma(_1753, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1825);
    float _1861 = fma(_1799, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1823);
    float _1863 = fma(_1845, _968, _1851);
    float _1865 = _1857 * 0.5;
    float _1867 = fma(_1845, _948, _1855);
    float _1869 = fma(_1845, _980, _1853);
    out.m_75.x = _1849;
    out.m_75.y = _1835;
    out.m_75.z = _1859;
    float _1871 = fma(_1765, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1837);
    out.m_77.z = _1865;
    out.m_77.w = _1336;
    float _1873 = fma(_1829, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1871);
    out.gl_Position.x = _1366;
    out.gl_Position.y = _1368;
    out.gl_Position.z = _1463;
    out.gl_Position.w = _1336;
    float _1875 = fma(_1861, _972, _1863);
    float _1877 = fma(_1861, _956, _1867);
    float _1879 = fma(_1861, _990, _1869);
    out.m_79.x = _1841;
    out.m_79.y = _1873;
    out.m_79.z = _1847;
    out.m_81.x = _1875;
    out.m_81.y = _1879;
    out.m_81.z = _1877;
    float _1881 = _1841;
    float _1883 = _1366;
    if (!_1775)
    {
        _1479 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1885 = _1479;
    float _1887 = _1885;
    float _1889 = _1885;
    if (!_1775)
    {
        _1481 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1891 = _1481;
    float _1893 = _1891;
    float _1895 = _1891;
    if (!_1775)
    {
        _1881 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1897 = _1881;
    float _1899 = _1897;
    float _1901 = _1897;
    if (!_1775)
    {
        _1483 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1903 = _1483;
    float _1905 = _1903;
    float _1907 = _1903;
    if (!_1775)
    {
        _1883 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1909 = _1883;
    float _1911 = _1635 * _1394;
    float _1913 = -_1635;
    float _1915 = _1913 + 1.0;
    float _1917 = _1411 * _1911;
    float _1919 = _1411 * _1915;
    float _1921 = _1421 * _1911;
    float _1923 = fma(_1417, _1917, _1405);
    float _1925 = fma(_1419, _1917, _1407);
    float _1927 = _1917;
    float _1929 = _1909;
    float _1931 = _1909;
    if (!_1775)
    {
        _1927 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1933 = _1927;
    float _1935 = fma(_1411, _1921, _1409);
    out.m_83.x = _1923;
    out.m_83.y = _1925;
    out.m_83.z = _1935;
    out.m_83.w = _1919;
    bool _1937 = !_1775;
    float _1939 = _1933;
    float _1941 = _1933;
    if (!_1937)
    {
        bool _1943 = _1110 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1945 = isnan(_1110);
        bool _1947 = _1943 || _1945;
        bool _1949 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1951 = _1947 || _1949;
        if (!_1951)
        {
            float _1953 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1955 = _1110 + _1953;
            float _1957 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1959 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1957;
            float _1961 = 1.0 / _1959;
            float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1965 = _1963 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1969 = _1967 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1973 = _1971 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1975 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1977 = _1975 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1981 = _1979 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1983 = _1955 * _1961;
            float _1985 = precise::clamp(_1983, 0.0, 1.0);
            float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1989 = _1987 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1991 = fma(_1985, _1965, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1993 = fma(_1985, _1989, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1995 = fma(_1985, _1969, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1997 = fma(_1985, _1973, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1999 = fma(_1985, _1977, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2001 = fma(_1985, _1981, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1901 = _1993;
            _1907 = _1999;
            _1941 = _1991;
            _1895 = _1997;
            _1889 = _1995;
            _1931 = _2001;
            _2003 = true;
        }
        else
        {
            bool _2005 = _1110 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2007 = isnan(_1110);
            bool _2009 = _2005 || _2007;
            bool _2011 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2013 = _2009 || _2011;
            if (!_2013)
            {
                _1939 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2015 = _1939;
            _1941 = _2015;
            if (!_2013)
            {
                _1899 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2017 = _1899;
            _1901 = _2017;
            if (!_2013)
            {
                _1887 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2019 = _1887;
            _1889 = _2019;
            if (!_2013)
            {
                _1893 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2021 = _1893;
            _1895 = _2021;
            if (!_2013)
            {
                _1905 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2023 = _1905;
            _1907 = _2023;
            if (!_2013)
            {
                _1929 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2025 = _1929;
            bool _2027 = !_2013;
            _1931 = _2025;
            if (!_2027)
            {
                bool _2029 = _1110 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2031 = isnan(_1110);
                bool _2033 = _2029 || _2031;
                bool _2035 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2037 = _2033 || _2035;
                if (!_2037)
                {
                    float _2039 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2041 = _1110 + _2039;
                    float _2043 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2045 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2043;
                    float _2047 = 1.0 / _2045;
                    float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2051 = _2049 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2055 = _2053 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2061 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2063 = _2061 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2065 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2067 = _2065 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2069 = _2041 * _2047;
                    float _2071 = precise::clamp(_2069, 0.0, 1.0);
                    float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2077 = fma(_2071, _2051, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2079 = fma(_2071, _2075, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2081 = fma(_2071, _2055, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2083 = fma(_2071, _2059, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2085 = fma(_2071, _2063, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2087 = fma(_2071, _2067, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1901 = _2079;
                    _1907 = _2085;
                    _1941 = _2077;
                    _1895 = _2083;
                    _1889 = _2081;
                    _1931 = _2087;
                    _2003 = true;
                }
                else
                {
                    _1901 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1907 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1941 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1895 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1889 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1931 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2003 = false;
    float _2089 = _1901;
    float _2091 = _1907;
    float _2093 = _1941;
    float _2095 = _1895;
    float _2097 = _1889;
    float _2099 = _1931;
    float _2101 = fma(_1879, -0.5, 0.5);
    float _2103 = precise::clamp(_2101, 0.0, 1.0);
    float _2105 = -_2089;
    float _2107 = _2105 + _2091;
    float _2109 = -_2093;
    float _2111 = _2109 + _2095;
    float _2113 = -_2097;
    float _2115 = _2113 + _2099;
    bool _2117 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2119 = fma(_2103, _2107, _2089);
    float _2121 = fma(_2103, _2111, _2093);
    float _2123 = fma(_2103, _2115, _2097);
    float _2125 = _2119 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2127 = fma(_2121, 0.298911988735198974609375, _2125);
    float _2129 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2131 = fma(_2123, 0.114477999508380889892578125, _2127);
    out.m_85.w = _2129;
    float _2133 = -_2131;
    float _2135 = _2121 + _2133;
    float _2137 = -_2131;
    float _2139 = _2119 + _2137;
    float _2141 = -_2131;
    float _2143 = _2123 + _2141;
    out.m_87.x = 0.0;
    float _2145 = fma(_2135, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2131);
    float _2147 = fma(_2139, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2131);
    float _2149 = fma(_2143, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2131);
    out.m_89.x = _2145;
    out.m_89.y = _2147;
    out.m_89.z = _2149;
    if (!_2117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2151 = -_1084;
    float _2153 = _2151 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2155 = -_1086;
    float _2157 = _2155 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2159 = -_1088;
    float _2161 = _2159 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2163 = _2153 * _2153;
    float _2165 = fma(_2157, _2157, _2163);
    float _2167 = fma(_2161, _2161, _2165);
    float _2169 = sqrt(_2167);
    float _2171 = rsqrt(_2167);
    float _2173 = -_2169;
    float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2177 = _2175 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2179 = precise::clamp(_2177, 0.0, 1.0);
    float _2181 = _2157 * _2171;
    float _2183 = _2153 * _2171;
    float _2185 = abs(_2179);
    float _2187 = log2(_2185);
    float _2189 = _2161 * _2171;
    float _2191 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2193 = _1879 * _2183;
    float _2195 = -_2183;
    float _2197 = -_2191;
    float _2199 = fma(_2195, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2197);
    float _2201 = fma(_1875, _2181, _2193);
    float _2203 = -_2189;
    float _2205 = fma(_2203, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2199);
    float _2207 = fma(_1877, _2189, _2201);
    float _2209 = precise::clamp(_2207, 0.0, 1.0);
    float _2211 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2213 = _2205 + _2211;
    float _2215 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2217 = _2213 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2219 = precise::clamp(_2217, 0.0, 1.0);
    float _2221 = exp2(_2215);
    float _2223 = _2221 * _2219;
    float _2225 = _2209 * _2223;
    float _2227 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2229 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2231 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2227;
    out.m_87.y = _2229;
    out.m_87.z = _2231;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

