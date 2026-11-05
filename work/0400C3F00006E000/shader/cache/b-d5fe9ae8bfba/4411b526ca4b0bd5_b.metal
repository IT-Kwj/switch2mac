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
    float4 m_79 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_93 [[user(locn3)]];
    float4 m_69 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_85 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_65 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 m_91 [[user(locn12)]];
    float4 m_89 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
    float4 m_67 [[attribute(8)]];
    float4 m_55 [[attribute(9)]];
    float4 m_61 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1895 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    float _120 = as_type<float>(_112);
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _118;
    if (!_116)
    {
        out.m_49.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _122 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2143 = as_type<float>(_128);
        out.gl_Position.z = _2143;
    }
    if (!_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_51.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = 0.0;
    float _150 = _146;
    if (_142)
    {
        float _152 = float(_112);
        _120 = _152;
    }
    float _154 = _120;
    bool _156 = _146 >= _154;
    bool _158 = !_142;
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
        _130 = as_type<int>(_166);
    }
    int _168 = _130;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2213 = as_type<float>(_168);
        out.gl_Position.z = _2213;
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
    int _180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _182 = _180 != 0;
    float _184 = in.m_55.x;
    float _186 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _190 = in.m_53.z;
    float _192 = in.m_53.y;
    float _194 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _196 = _172 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _200 = _198 != 0;
    float _202 = in.m_53.x;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _206 = _170 > 0.5;
    float _208 = _188 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _210 = -_174;
    float _212 = _210 + 1.0;
    int _214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _216 = _214 != 0;
    int _218 = 0;
    float _220 = _196;
    float _222 = _174;
    float _224 = _184;
    if (_178)
    {
        float _226 = -_184;
        float _228 = _226 + 1.0;
        _218 = as_type<int>(_228);
    }
    int _230 = _218;
    int _232 = _206 ? as_type<int>(_212) : as_type<int>(_174);
    float _234 = as_type<float>(_230);
    if (!_178)
    {
        _148 = _184;
    }
    float _236 = _148;
    bool _238 = _190 > 0.5;
    float _240 = _182 ? as_type<float>(_232) : _174;
    float _242 = _236;
    float _244 = _240;
    if (_178)
    {
        float _246 = _238 ? as_type<float>(_230) : _184;
        _242 = _246;
    }
    float _248 = _242;
    if (!_216)
    {
        _234 = _192;
    }
    float _250 = _234;
    float _252 = fma(_240, _196, -0.5);
    float _254 = _250;
    if (_216)
    {
        _254 = _202;
    }
    float _256 = _254;
    float _258 = fma(_208, _248, -0.5);
    if (!_216)
    {
        _244 = _190;
    }
    float _260 = _244;
    float _262 = _260;
    if (_216)
    {
        _262 = _192;
    }
    float _264 = _262;
    float _266 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[83].z, _186);
    if (!_216)
    {
        _220 = _190;
    }
    float _268 = _220;
    float _270 = _256 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _272 = _268;
    if (_216)
    {
        _272 = _192;
    }
    float _274 = _272;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _278 = _264 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _280 = -_194;
    float _282 = fma(_270, 2.0, _280);
    float _284 = 0.0;
    if (!_200)
    {
        _284 = _184;
    }
    float _286 = _284;
    float _288 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[83].w, _204);
    float _290 = fma(_278, -2.0, _276);
    float _292 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].z, _266);
    float _294 = -_146;
    float _296 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[81].x, _282);
    float _298 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].w, _288);
    float _300 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[81].y, _290);
    float _302 = fma(_292, _258, _296);
    float _304 = -_300;
    float _306 = fma(_298, _252, _304);
    float _308 = _302 + 0.5;
    float _310 = _306 + 0.5;
    float2 _2465 = float2(_308, _310);
    float _312 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2465, float2(0.0), isnan(_2465)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2465, float2(0.0), isnan(_2465)), level(0.0)).y;
    float _314 = _190 * 2.0;
    float _316 = _202 * 2.0;
    float _318 = _192 * 2.0;
    float _320 = _202 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _322 = floor(_316);
    float _324 = _192 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _326 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _330 = _326 || _328;
    bool _332 = isnan(1.0);
    bool _334 = _330 || _332;
    float _336 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _340 = floor(_314);
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _344 = -_338;
    float _346 = fma(_320, 2.0, _344);
    float _348 = _192 + _202;
    float _350 = fma(_324, -2.0, _342);
    float _352 = floor(_318);
    bool _354 = _322 >= 0.0;
    bool _356 = isnan(_322);
    bool _358 = _354 || _356;
    bool _360 = isnan(0.0);
    bool _362 = _358 || _360;
    float _364 = _348 + (-1.0);
    float _366 = 0.0;
    float _368 = _336;
    float _370 = _286;
    float _372 = _310;
    if (!_334)
    {
        float _374 = _336 * _336;
        float _376 = _374 * 0.5;
        _366 = _376;
    }
    float _378 = _366;
    int _380 = _362 ? 0 : 1;
    float _382 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _384 = _378;
    if (!_334)
    {
        float _386 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _384 = _386;
    }
    float _388 = _384;
    bool _390 = _340 > 0.0;
    bool _392 = _340 >= 0.0;
    bool _394 = isnan(_340);
    bool _396 = _392 || _394;
    bool _398 = isnan(0.0);
    bool _400 = _396 || _398;
    int _402 = ~_380;
    int _404 = _402 + 1;
    int _406 = _404 + 1;
    int _408 = _400 ? 0 : 1;
    bool _410 = _322 > 0.0;
    int _412 = ~_408;
    int _414 = _412 + 1;
    int _416 = _414 + 1;
    bool _418 = _352 >= 0.0;
    bool _420 = isnan(_352);
    bool _422 = _418 || _420;
    bool _424 = isnan(0.0);
    bool _426 = _422 || _424;
    int _428 = _416;
    int _430 = _406;
    float _432 = _388;
    if (!_390)
    {
        int _434 = ~_408;
        int _436 = _434 + 1;
        _428 = _436;
    }
    int _438 = _428;
    float _440 = _192 + _190;
    bool _442 = _352 > 0.0;
    float _444 = _440 + (-1.0);
    float _446 = _444;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    if (!_410)
    {
        int _450 = ~_380;
        int _452 = _450 + 1;
        _430 = _452;
    }
    int _454 = _430;
    float _456 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _458 = !_334;
    if (!_458)
    {
        float _460 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _462 = log2(_460);
        float _464 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _466 = _464 + 1.0;
        float _468 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _470 = _336 * _462;
        float _472 = 1.0 / _466;
        float _474 = _468 * 0.693147182464599609375;
        float _476 = exp2(_470);
        float _478 = 1.0 / _474;
        float _480 = _476 + (-1.0);
        float _482 = -_480;
        float _484 = fma(_482, _478, _336);
        float _486 = _484 * _472;
        float _488 = _486 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _446 = _478;
        _448 = _476;
        _432 = _488;
    }
    float _490 = _446;
    float _492 = _448;
    float _494 = _432;
    bool _496 = !_334;
    float _498 = _490;
    float _500 = _492;
    if (!_496)
    {
        float _502 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _504 = log2(_502);
        float _506 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _508 = _506 + 1.0;
        float _510 = 1.0 / _508;
        float _512 = _336 * _504;
        float _514 = exp2(_512);
        float _516 = -_514;
        float _518 = _516 + 1.0;
        float _520 = _518 * _510;
        _498 = _514;
        _368 = _520;
    }
    float _522 = _498;
    float _524 = _368;
    int _526 = _426 ? 0 : 1;
    float _528 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _530 = log2(_528);
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _534 = _532 != 0;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _542 = _540 != 0;
    float _544 = -_146;
    float _546 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[76].x, _346);
    float _548 = _522;
    bool _550 = _542;
    if (_216)
    {
        _500 = _202;
    }
    float _552 = _500;
    float _554 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _350);
    float _556 = _552;
    if (!_216)
    {
        _556 = _190;
    }
    float _558 = _556;
    if (_216)
    {
        _548 = _192;
    }
    float _560 = _548;
    bool _562 = !_534;
    int _564 = _562 ? 0 : 1;
    float _566 = _558 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _568 = !_538;
    int _570 = _568 ? 0 : 1;
    float _572 = _560;
    if (!_216)
    {
        _572 = _202;
    }
    float _574 = _572;
    int _576 = abs(_564);
    int _578 = abs(_570);
    float _580 = _574 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _582 = float(_438);
    float _584 = float(_454);
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _588 = float(_576);
    float _590 = -_586;
    float _592 = fma(_566, 2.0, _590);
    float _594 = float(_578);
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _598 = ~_526;
    int _600 = _598 + 1;
    int _602 = _600 + 1;
    float _604 = _588 * _582;
    int _606 = _602;
    if (!_442)
    {
        int _608 = ~_526;
        int _610 = _608 + 1;
        _606 = _610;
    }
    int _612 = _606;
    float _614 = _530 * _146;
    float _616 = _594 * _584;
    float _618 = fma(_580, -2.0, _596);
    float _620 = in.m_57.x;
    float _622 = in.m_57.y;
    float _624 = in.m_57.z;
    float _626 = _202 + (-0.5);
    float _628 = exp2(_614);
    float _630 = -_146;
    float _632 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[86].x, _592);
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _636 = 1.0 + _634;
    float _638 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _618);
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _642 = 1.0 / _636;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _646 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _648 = isnan(1.0);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _654 = _650 || _652;
    float _656 = fma(_192, (*spvDescriptorSet0.vp_c9)._m0[88].w, _640);
    bool _658 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _660 = isnan(0.0);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _666 = _662 || _664;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _672 = -_628;
    float _674 = _672 + 1.0;
    bool _676 = !_542;
    int _678 = _676 ? 0 : 1;
    float _680 = _604 * (-2.0);
    float _682 = fma(_192, (*spvDescriptorSet0.vp_c9)._m0[78].w, _644);
    float _684 = float(_612);
    float _686 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[78].z, _668);
    float _688 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[88].z, _670);
    int _690 = abs(_678);
    float _692 = fma(_680, _620, _620);
    float _694 = _666 ? _674 : 0.0;
    float _696 = fma(_382, _680, _382);
    float _698 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _686);
    float _700 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _682);
    float _702 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _688);
    float _704 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _656);
    float _706 = float(_690);
    float _708 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[196].x, _692);
    if (_654)
    {
        float _710 = _694 * _642;
        _150 = _710;
    }
    float _712 = _150;
    float _714 = _616 * (-2.0);
    float _716 = _706 * _684;
    float _718 = fma(_696, _712, _708);
    float _720 = fma(_456, _714, _456);
    float _722 = fma(_714, _622, _622);
    float _724 = in.m_51.x;
    float _726 = in.m_51.y;
    float _728 = in.m_51.z;
    float _730 = _718 * 0.15915493667125701904296875;
    float _732 = _202 + _190;
    float _734 = _192 + (-0.5);
    float _736 = in.m_59.w;
    float _738 = _716 * (-2.0);
    float _740 = _732 + (-1.0);
    float _742 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[196].y, _722);
    float _744 = in.m_46.x;
    float _746 = in.m_46.y;
    float _748 = in.m_46.z;
    float _750 = fma(_738, _624, _624);
    float _752 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _754 = _190 + (-0.5);
    float _756 = _494 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _758 = fma(_720, _712, _742);
    float _760 = fma(_752, _738, _752);
    float _762 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[196].z, _750);
    float _764 = in.m_61.y;
    float _766 = _758 * 0.15915493667125701904296875;
    float _768 = _730 * 6.283185482025146484375;
    float _770 = sin(_768);
    float _772 = fma(_760, _712, _762);
    float _774 = _494 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _776 = _494 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _778 = in.m_63.y;
    float _780 = fma(_524, _726, _756);
    float _782 = fma(_524, _724, _774);
    float _784 = fma(_524, _728, _776);
    float _786 = _730 * 6.283185482025146484375;
    float _788 = cos(_786);
    float _790 = _772 * 0.15915493667125701904296875;
    float _792 = fma(_780, _736, _746);
    float _794 = fma(_784, _736, _748);
    float _796 = _766 * 6.283185482025146484375;
    float _798 = sin(_796);
    float _800 = fma(_782, _736, _744);
    float _802 = _792 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _804 = _792 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _806 = _792 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _808 = _764 * 0.00999999977648258209228515625;
    float _810 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[4].x, _802);
    float _812 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[5].x, _804);
    float _814 = _766 * 6.283185482025146484375;
    float _816 = cos(_814);
    float _818 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[6].x, _806);
    float _820 = in.m_63.x;
    float _822 = fma(_312, _808, _778);
    float _824 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[4].z, _810);
    float _826 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[6].z, _818);
    float _828 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[5].z, _812);
    float _830 = in.m_63.z;
    float _832 = _790 * 6.283185482025146484375;
    float _834 = sin(_832);
    float _836 = _770 * _798;
    float _838 = _788 * _798;
    float _840 = in.m_59.x;
    float _842 = in.m_59.y;
    float _844 = in.m_59.z;
    float _846 = _826 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _848 = _824 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _850 = _828 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _852 = _790 * 6.283185482025146484375;
    float _854 = cos(_852);
    float _856 = _788 * _816;
    float _858 = _770 * _816;
    float _860 = fma(_834, _856, _836);
    float _862 = fma(_834, _836, _856);
    float _864 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _822);
    float _866 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _820);
    float _868 = -_838;
    float _870 = fma(_834, _858, _868);
    float _872 = -_858;
    float _874 = fma(_834, _838, _872);
    float _876 = _788 * _854;
    float _878 = _770 * _854;
    float _880 = _816 * _854;
    float _882 = _842 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _884 = _840 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _886 = _844 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _888 = _798 * _854;
    float _890 = _882 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _892 = _884 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _894 = _886 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _896 = _864 * _890;
    float _898 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _830);
    float _900 = _866 * _892;
    float _902 = _876 * _896;
    float _904 = _898 * _894;
    float _906 = -_896;
    float _908 = _834 * _906;
    float _910 = _878 * _896;
    float _912 = fma(_860, _900, _902);
    float _914 = fma(_880, _900, _908);
    float _916 = fma(_870, _900, _910);
    float _918 = fma(_874, _904, _912);
    float _920 = fma(_888, _904, _914);
    float _922 = fma(_862, _904, _916);
    float _924 = _918 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _926 = _918 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _928 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[10].x, _924);
    float _930 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[8].x, _926);
    float _932 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[10].z, _928);
    float _934 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[8].z, _930);
    float _936 = _846 + _932;
    float _938 = _848 + _934;
    float _940 = _918 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _942 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _944 = _936 + _942;
    float _946 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _948 = _938 + _946;
    float _950 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[9].x, _940);
    float _952 = _944 * _944;
    float _954 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[9].z, _950);
    float _956 = fma(_948, _948, _952);
    float _958 = _850 + _954;
    float _960 = sqrt(_956);
    bool _962 = _960 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _964 = _918;
    float _966 = _922;
    float _968 = _788;
    if (!_962)
    {
        _964 = _938;
    }
    float _970 = _964;
    float _972 = _970;
    if (!_962)
    {
        _966 = _936;
    }
    float _974 = _966;
    float _976 = _974;
    if (!_962)
    {
        _968 = _958;
    }
    float _978 = _968;
    bool _980 = !_962;
    float _982 = _978;
    if (!_980)
    {
        float _984 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _986 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _988 = _960 + _986;
        float _990 = rsqrt(_956);
        float _992 = _988 * _984;
        float _994 = _958 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _996 = _992 * 0.15915493667125701904296875;
        float _998 = _996 * 6.283185482025146484375;
        float _1000 = cos(_998);
        float _1002 = _996 * 6.283185482025146484375;
        float _1004 = sin(_1002);
        float _1006 = _1000 + (-1.0);
        float _1008 = fma(_1004, _994, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1010 = _1006 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1012 = _990 * _1008;
        float _1014 = fma(_958, _1000, _1010);
        float _1016 = fma(_948, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1018 = fma(_944, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _982 = _1014;
        _972 = _1016;
        _976 = _1018;
    }
    float _1020 = _982;
    float _1022 = _972;
    float _1024 = _976;
    float _1026 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1028 = _1020 + _1026;
    float _1030 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1032 = _1022 + _1030;
    float _1034 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1036 = _1024 + _1034;
    float _1038 = _1028 * _1028;
    float _1040 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1042 = _1020 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1044 = fma(_1032, _1032, _1038);
    float _1046 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1048 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1042);
    float _1050 = fma(_1036, _1036, _1044);
    float _1052 = precise::max(0.0, _1046);
    float _1054 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1048);
    float _1056 = rsqrt(_1050);
    float _1058 = sqrt(_1050);
    float _1060 = _1056 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1062 = _1032 * _1060;
    float _1064 = _1036 * _1060;
    float _1066 = -_1060;
    float _1068 = -_1052;
    float _1070 = fma(_1028, _1066, _1068);
    float _1072 = _1062 * _1062;
    float _1074 = _1064 * _1064;
    float _1076 = _1072 + _1074;
    float _1078 = sqrt(_1076);
    bool _1080 = _1078 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1082 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1084 = _1078 + _1082;
    float _1086 = _958;
    float _1088 = _1052;
    float _1090 = _1076;
    float _1092 = _1084;
    float _1094 = _1060;
    float _1096 = _1062;
    float _1098 = _1064;
    float _1100 = _1072;
    float _1102 = _1074;
    float _1104 = _1070;
    if (_1080)
    {
        float _1106 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1086 = _1106;
    }
    float _1108 = _1086;
    if (_1080)
    {
        float _1110 = _1070 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1088 = _1110;
    }
    float _1112 = _1088;
    float _1114 = _1112;
    if (_1080)
    {
        float _1116 = rsqrt(_1076);
        _1090 = _1116;
    }
    float _1118 = _1090;
    if (_1080)
    {
        float _1120 = _1084 * _1108;
        _1092 = _1120;
    }
    float _1122 = _1092;
    float _1124 = 0.0;
    if (_1080)
    {
        float _1126 = _1122 * 0.15915493667125701904296875;
        _1124 = _1126;
    }
    float _1128 = _1124;
    float _1130 = _1108;
    if (_1080)
    {
        float _1132 = _1128 * 6.283185482025146484375;
        float _1134 = sin(_1132);
        _1130 = _1134;
    }
    float _1136 = _1130;
    float _1138 = _1122;
    if (_1080)
    {
        float _1140 = _1128 * 6.283185482025146484375;
        float _1142 = cos(_1140);
        _1138 = _1142;
    }
    float _1144 = _1138;
    float _1146 = _1136;
    if (_1080)
    {
        float _1148 = fma(_1136, _1112, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1146 = _1148;
    }
    float _1150 = _1146;
    float _1152 = _1150;
    if (_1080)
    {
        float _1154 = _1118 * _1150;
        _1094 = _1154;
    }
    float _1156 = _1094;
    if (_1080)
    {
        float _1158 = _1144 + (-1.0);
        _1114 = _1158;
    }
    float _1160 = _1114;
    if (_1080)
    {
        float _1162 = _1062 * _1156;
        _1096 = _1162;
    }
    float _1164 = _1096;
    if (_1080)
    {
        float _1166 = _1064 * _1156;
        _1098 = _1166;
    }
    float _1168 = _1098;
    if (_1080)
    {
        float _1170 = _1160 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1152 = _1170;
    }
    float _1172 = _1152;
    if (_1080)
    {
        float _1174 = _1164 * _1164;
        _1100 = _1174;
    }
    float _1176 = _1100;
    if (_1080)
    {
        float _1178 = _1168 * _1168;
        _1102 = _1178;
    }
    float _1180 = _1102;
    if (_1080)
    {
        float _1182 = fma(_1070, _1144, _1172);
        _1104 = _1182;
    }
    float _1184 = _1104;
    float _1186 = fma(_1184, _1184, _1176);
    float _1188 = _1020 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1190 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1192 = fma(_1058, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1190);
    float _1194 = precise::clamp(_1192, 0.0, 1.0);
    float _1196 = _1186 + _1180;
    float _1198 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1188);
    float _1200 = -_1194;
    float _1202 = _1200 + 1.0;
    float _1204 = _1020 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1206 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1198);
    float _1208 = rsqrt(_1196);
    float _1210 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1204);
    float _1212 = _1020 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1214 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1216 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1210);
    float _1218 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1212);
    float _1220 = _1214 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1222 = abs(_1202);
    float _1224 = log2(_1222);
    float _1226 = _1216 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1228 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1218);
    float _1230 = -_1220;
    float _1232 = fma(_1230, _1040, 1.0);
    float _1234 = _1054 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1236 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1238 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1240 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1242 = _1208 * _1164;
    float _1244 = _1208 * _1184;
    float _1246 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1236);
    float _1248 = _1208 * _1168;
    float _1250 = _1242 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1252 = log2(_1232);
    float _1254 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1246);
    float _1256 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1240);
    float _1258 = _1224 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1260 = -_1250;
    float _1262 = fma(_1244, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1260);
    float _1264 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1254);
    float _1266 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1256);
    float _1268 = -_1248;
    float _1270 = fma(_1268, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1262);
    float _1272 = exp2(_1258);
    float _1274 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1276 = fma(_1270, -0.5, 0.5);
    float _1278 = fma(_1270, 0.5, 0.5);
    float _1280 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1274);
    float _1282 = _1244 + 1.0;
    float _1284 = _1252 * 0.693147182464599609375;
    float _1286 = 1.0 / _1264;
    float _1288 = fma(_1278, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1290 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1280);
    float _1292 = _1284 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1294 = fma(_1278, _1288, -0.212114393711090087890625);
    float _1296 = sqrt(_1276);
    float _1298 = -_1244;
    float _1300 = fma(_1272, _1282, _1298);
    float _1302 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1290);
    float _1304 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1266);
    float _1306 = fma(_1278, _1294, 1.570728778839111328125);
    float _1308 = fma(_1300, 0.5, 0.5);
    float _1310 = _1302 * _1286;
    float _1312 = _1304 * _1286;
    float _1314 = fma(_1312, -0.5, 0.5);
    float _1316 = _1296 * 0.636619746685028076171875;
    float _1318 = fma(_1310, 0.5, 0.5);
    float _1320 = -_1306;
    float _1322 = fma(_1316, _1320, 1.0);
    float3 _4055 = float3(_1318, _1314, _1292);
    float _1324 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4055, float3(0.0), isnan(_4055)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4055, float3(0.0), isnan(_4055)), level(0.0)).x;
    float3 _4066 = float3(_1318, _1314, _1292);
    float4 _1327 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4066, float3(0.0), isnan(_4066)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4066, float3(0.0), isnan(_4066)), level(0.0)).xyzw;
    float _1329 = _1327.x;
    float _1331 = _1327.y;
    float _1333 = _1327.z;
    float _1335 = _1327.w;
    float2 _4082 = float2(_1322, _1308);
    float3 _1339 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4082, float2(0.0), isnan(_4082)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4082, float2(0.0), isnan(_4082)), level(0.0)).xyz;
    float _1341 = _1339.x;
    float _1343 = _1339.y;
    float _1345 = _1339.z;
    float _1347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1351 = _1349 != 0;
    out.m_65.x = _1022;
    out.m_65.y = _1020;
    out.m_65.z = _1024;
    int _1353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1355 = _1353 != 0;
    int _1357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1359 = _1357 != 0;
    bool _1361 = _192 > 0.5;
    float _1363 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1365 = as_type<int>(_1318);
    if (_200)
    {
        bool _1367 = _202 > 0.5;
        _550 = _1367;
    }
    bool _1369 = _550;
    float _1371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_200)
    {
        float _1373 = -_184;
        float _1375 = _1373 + 1.0;
        _1365 = as_type<int>(_1375);
    }
    int _1377 = _1365;
    int _1379 = _1361 ? as_type<int>(_212) : as_type<int>(_174);
    float _1381 = _1347 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1383 = as_type<int>(_1347);
    if (_1351)
    {
        float _1385 = -_184;
        float _1387 = _1385 + 1.0;
        _1383 = as_type<int>(_1387);
    }
    int _1389 = _1383;
    float _1391 = _1359 ? as_type<float>(_1379) : _174;
    float _1393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    if (_200)
    {
        float _1395 = _1369 ? as_type<float>(_1377) : _184;
        _370 = _1395;
    }
    float _1397 = _370;
    float _1399 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1355)
    {
        float _1401 = _238 ? _212 : _174;
        _222 = _1401;
    }
    float _1403 = _222;
    float _1405 = fma(_1381, _1391, -0.5);
    if (_1351)
    {
        float _1407 = _1361 ? as_type<float>(_1389) : _184;
        _224 = _1407;
    }
    float _1409 = _224;
    float _1411 = fma(_1399, _1397, -0.5);
    float _1413 = in.m_61.x;
    float _1415 = _1371 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1417 = fma(_698, _1411, _546);
    float _1419 = -_554;
    float _1421 = fma(_700, _1405, _1419);
    float _1423 = fma(_1415, _1409, -0.5);
    float _1425 = in.m_61.z;
    bool _1427 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1429 = isnan(0.5);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1435 = _1431 || _1433;
    float _1437 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1439 = fma(_702, _1423, _632);
    bool _1441 = _822 != 0.0;
    bool _1443 = isnan(_822);
    bool _1445 = _1441 || _1443;
    bool _1447 = isnan(0.0);
    bool _1449 = _1445 || _1447;
    float _1451 = in.m_61.w;
    float _1453 = fma(_1437, _1403, -0.5);
    float _1455 = _850 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1457 = _820 == 0.0;
    bool _1459 = !_1449;
    bool _1461 = _1457 && _1459;
    float _1463 = -_638;
    float _1465 = fma(_704, _1453, _1463);
    float _1467 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1455);
    float _1469 = _1421 + 0.5;
    float _1471 = in.m_67.x;
    float _1473 = in.m_67.y;
    float _1475 = in.m_67.z;
    float _1477 = in.m_67.w;
    float _1479 = _1417 + 0.5;
    float _1481 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1467);
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1485 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1487 = _850 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1489 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_69.x = _1413;
    out.m_69.y = _764;
    float _1491 = _1439 + 0.5;
    float _1493 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1487);
    float _1495 = _1421;
    float _1497 = _1439;
    float _1499 = _1491;
    if (!_1435)
    {
        _1495 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1501 = _1495;
    float _1503 = 1.0 / _1489;
    out.m_71.w = _1483;
    float _1505 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1493);
    bool _1507 = _830 == 0.0;
    bool _1509 = _1507 && _1461;
    out.m_69.z = _1425;
    float _1511 = _1505 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1513 = _1465 + 0.5;
    float _1515 = _1511 + _1489;
    float _1517 = in.m_73.x;
    float _1519 = in.m_73.y;
    float _1521 = in.m_73.z;
    float _1523 = _876 * _1473;
    float _1525 = -_1473;
    float _1527 = _834 * _1525;
    out.m_75.x = _1479;
    out.m_75.y = _1469;
    out.m_75.z = _308;
    out.m_75.w = _310;
    float _1529 = _1515 * _1503;
    float _1531 = _1529 * 0.5;
    float _1533 = fma(_860, _1471, _1523);
    float _1535 = fma(_880, _1471, _1527);
    out.m_77.x = _1491;
    out.m_77.y = _1513;
    float _1537 = fma(_874, _1475, _1533);
    float _1539 = fma(_888, _1475, _1535);
    out.m_79.w = _1485;
    out.m_69.w = _1451;
    float _1541 = _878 * _1473;
    float _1543 = _1537 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1545 = _1539;
    if (!_1435)
    {
        float _1547 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1549 = fma(_1531, _1501, _1547);
        _372 = _1549;
    }
    float _1551 = _372;
    float _1553 = _1537 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1555 = fma(_870, _1471, _1541);
    float _1557 = _1537 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1559 = fma(_1539, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1543);
    float _1561 = fma(_1539, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1553);
    float _1563 = fma(_862, _1475, _1555);
    float _1565 = fma(_1539, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1557);
    float _1567 = _1551;
    float _1569 = _1565;
    float _1571 = _1561;
    float _1573 = _1517;
    if (_1509)
    {
        _1545 = _1517;
    }
    float _1575 = _1545;
    float _1577 = _1575;
    if (!_1435)
    {
        float _1579 = 1.0 / _1551;
        _1567 = _1579;
    }
    float _1581 = _1567;
    float _1583 = fma(_1563, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1559);
    float _1585 = fma(_1563, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1561);
    float _1587 = fma(_1563, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1565);
    if (_1509)
    {
        _1569 = _1519;
    }
    float _1589 = _1569;
    float _1591 = _1589;
    if (_1509)
    {
        _1497 = _1521;
    }
    float _1593 = _1497;
    float _1595 = _1593;
    if (_1509)
    {
        _1499 = _1575;
    }
    float _1597 = _1499;
    out.m_81.x = _1583;
    out.m_81.y = _1585;
    out.m_81.z = _1587;
    float _1599 = _1597;
    if (!_1509)
    {
        _1577 = _1517;
    }
    float _1601 = _1577;
    if (_1509)
    {
        _1571 = _1589;
    }
    float _1603 = _1571;
    float _1605 = _1603;
    if (_1509)
    {
        _1573 = _1593;
    }
    float _1607 = _1573;
    float _1609 = _1607;
    if (!_1509)
    {
        float _1611 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1601);
        _1599 = _1611;
    }
    float _1613 = _1599;
    if (!_1509)
    {
        _1591 = _1519;
    }
    float _1615 = _1591;
    float _1617 = _1475 * _1601;
    if (!_1509)
    {
        _1595 = _1521;
    }
    float _1619 = _1595;
    float _1621 = _1471 * _1615;
    if (!_1509)
    {
        float _1623 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1615);
        _1605 = _1623;
    }
    float _1625 = _1605;
    float _1627 = _1473 * _1619;
    float _1629 = -_1617;
    float _1631 = fma(_1471, _1619, _1629);
    float _1633 = -_1621;
    float _1635 = fma(_1473, _1601, _1633);
    if (!_1509)
    {
        float _1637 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1619);
        _1609 = _1637;
    }
    float _1639 = _1609;
    float _1641 = -_1627;
    float _1643 = fma(_1475, _1615, _1641);
    float _1645 = _1631 * _1477;
    float _1647 = _1635 * _1477;
    float _1649 = _876 * _1625;
    float _1651 = _1643 * _1477;
    float _1653 = _876 * _1645;
    float _1655 = -_1645;
    float _1657 = _834 * _1655;
    float _1659 = fma(_860, _1613, _1649);
    float _1661 = _878 * _1645;
    float _1663 = fma(_860, _1651, _1653);
    float _1665 = _1224 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1667 = -_1625;
    float _1669 = _834 * _1667;
    float _1671 = _878 * _1625;
    float _1673 = fma(_880, _1651, _1657);
    float _1675 = fma(_870, _1651, _1661);
    float _1677 = exp2(_1665);
    float _1679 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1681 = fma(_880, _1613, _1669);
    float _1683 = fma(_874, _1647, _1663);
    float _1685 = fma(_888, _1647, _1673);
    float _1687 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1679);
    float _1689 = fma(_888, _1639, _1681);
    float _1691 = _1683 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1693 = _1683 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1695 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1687);
    float _1697 = _1683 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1699 = fma(_862, _1647, _1675);
    float _1701 = fma(_1685, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1691);
    float _1703 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1695);
    float _1705 = fma(_870, _1613, _1671);
    float _1707 = fma(_1685, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1693);
    float _1709 = -_1677;
    float _1711 = _1709 + 1.0;
    float _1713 = fma(_1685, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1697);
    float _1715 = _1703 + _1264;
    float _1717 = fma(_874, _1639, _1659);
    float _1719 = fma(_1699, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1701);
    float _1721 = fma(_862, _1639, _1705);
    float _1723 = fma(_1699, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1707);
    float _1725 = _1711 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1727 = fma(_1699, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1713);
    float _1729 = _1715 * 0.5;
    float _1731 = _1715;
    float _1733 = _1719;
    float _1735 = _1727;
    if (!_1435)
    {
        _1731 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1737 = _1731;
    float _1739 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1741 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1743 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_83.x = _1719;
    out.m_83.y = _1723;
    out.m_83.z = _1727;
    float _1745 = fma(_1689, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1739);
    float _1747 = fma(_1689, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1741);
    float _1749 = fma(_1689, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1743);
    float _1751 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1745);
    float _1753 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1747);
    float _1755 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1749);
    out.gl_Position.x = _1302;
    out.gl_Position.y = _1304;
    out.gl_Position.z = _1703;
    out.gl_Position.w = _1264;
    bool _1757 = _1058 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1759 = isnan(_1058);
    bool _1761 = _1757 || _1759;
    bool _1763 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1765 = _1761 || _1763;
    float _1767 = _1749;
    if (!_1435)
    {
        float _1769 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1771 = -_1737;
        float _1773 = fma(_1581, _1769, _1771);
        _1767 = _1773;
    }
    float _1775 = _1767;
    float _1777 = _1775;
    if (!_1435)
    {
        float _1779 = -_1737;
        float _1781 = _1779 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1733 = _1781;
    }
    float _1783 = _1733;
    out.m_85.z = _1729;
    out.m_85.w = _1264;
    out.m_87.x = _1751;
    out.m_87.y = _1753;
    out.m_87.z = _1755;
    float _1785 = _1783;
    if (!_1435)
    {
        float _1787 = 1.0 / _1783;
        _1785 = _1787;
    }
    float _1789 = _1785;
    if (!_1765)
    {
        _1735 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1791 = _1735;
    float _1793 = _1789;
    float _1795 = _1791;
    float _1797 = _1791;
    if (!_1435)
    {
        float _1799 = _1775 * _1789;
        float _1801 = precise::clamp(_1799, 0.0, 1.0);
        _1793 = _1801;
    }
    float _1803 = _1793;
    float _1805 = _1803;
    if (_1435)
    {
        _1777 = 1.0;
    }
    float _1807 = _1777;
    float _1809 = _1807;
    if (!_1435)
    {
        float _1811 = -_1803;
        float _1813 = _1811 + 1.0;
        _1809 = _1813;
    }
    float _1815 = _1809;
    if (!_1765)
    {
        _1805 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1817 = _1805;
    float _1819 = _1725 * _1324;
    float _1821 = -_1725;
    float _1823 = _1821 + 1.0;
    float _1825 = _1815 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1827 = _1335 * _1819;
    float _1829 = _1345 * _1819;
    float _1831 = _1335 * _1823;
    float _1833 = fma(_1341, _1827, _1329);
    float _1835 = fma(_1343, _1827, _1331);
    float _1837 = fma(_1335, _1829, _1333);
    float _1839 = _1827;
    float _1841 = _1817;
    float _1843 = _1817;
    if (!_1765)
    {
        _1839 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1845 = _1839;
    out.m_89.x = _1833;
    out.m_89.y = _1835;
    out.m_89.z = _1837;
    out.m_89.w = _1831;
    bool _1847 = !_1765;
    float _1849 = _1845;
    float _1851 = _1845;
    if (!_1847)
    {
        bool _1853 = _1058 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1855 = isnan(_1058);
        bool _1857 = _1853 || _1855;
        bool _1859 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1861 = _1857 || _1859;
        if (!_1861)
        {
            float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1865 = _1058 + _1863;
            float _1867 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1869 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1867;
            float _1871 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1873 = _1871 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1875 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1877 = _1875 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1879 = 1.0 / _1869;
            float _1881 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1883 = _1881 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1885 = _1865 * _1879;
            float _1887 = precise::clamp(_1885, 0.0, 1.0);
            float _1889 = fma(_1887, _1873, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1891 = fma(_1887, _1877, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1893 = fma(_1887, _1883, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _1851 = _1891;
            _1797 = _1889;
            _1843 = _1893;
            _1895 = true;
        }
        else
        {
            bool _1897 = _1058 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1899 = isnan(_1058);
            bool _1901 = _1897 || _1899;
            bool _1903 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1905 = _1901 || _1903;
            if (!_1905)
            {
                _1795 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1907 = _1795;
            _1797 = _1907;
            if (!_1905)
            {
                _1849 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1909 = _1849;
            _1851 = _1909;
            if (!_1905)
            {
                _1841 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1911 = _1841;
            bool _1913 = !_1905;
            _1843 = _1911;
            if (!_1913)
            {
                bool _1915 = _1058 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1917 = isnan(_1058);
                bool _1919 = _1915 || _1917;
                bool _1921 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1923 = _1919 || _1921;
                if (!_1923)
                {
                    float _1925 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1927 = _1058 + _1925;
                    float _1929 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1931 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1929;
                    float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1935 = _1933 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1937 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1939 = _1937 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1941 = 1.0 / _1931;
                    float _1943 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1945 = _1943 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1947 = _1927 * _1941;
                    float _1949 = precise::clamp(_1947, 0.0, 1.0);
                    float _1951 = fma(_1949, _1935, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1953 = fma(_1949, _1939, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1955 = fma(_1949, _1945, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _1851 = _1953;
                    _1797 = _1951;
                    _1843 = _1955;
                    _1895 = true;
                }
                else
                {
                    _1851 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1797 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1843 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1895 = false;
    float _1957 = _1851;
    float _1959 = _1797;
    float _1961 = _1843;
    float _1963 = _1825 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_91.x = 0.0;
    float _1965 = _1957 * 0.586610972881317138671875;
    bool _1967 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_49.x = _1963;
    float _1969 = fma(_1959, 0.298911988735198974609375, _1965);
    bool _1971 = _1815 > 0.0;
    bool _1973 = isnan(_1815);
    bool _1975 = _1971 || _1973;
    bool _1977 = isnan(0.0);
    bool _1979 = _1975 || _1977;
    float _1981 = fma(_1961, 0.114477999508380889892578125, _1969);
    float _1983 = -_1981;
    float _1985 = _1983 + _1959;
    float _1987 = -_1981;
    float _1989 = _1987 + _1957;
    float _1991 = -_1981;
    float _1993 = _1991 + _1961;
    float _1995 = fma(_1985, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1981);
    float _1997 = fma(_1989, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1981);
    float _1999 = fma(_1993, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1981);
    bool _2001 = !_1967;
    if (!_2001)
    {
        float _2003 = -_1020;
        float _2005 = _2003 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2007 = -_1022;
        float _2009 = _2007 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2011 = -_1024;
        float _2013 = _2011 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2015 = _2005 * _2005;
        float _2017 = fma(_2009, _2009, _2015);
        float _2019 = fma(_2013, _2013, _2017);
        float _2021 = sqrt(_2019);
        float _2023 = rsqrt(_2019);
        float _2025 = -_2021;
        float _2027 = _2025 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2029 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2031 = precise::clamp(_2029, 0.0, 1.0);
        float _2033 = _2009 * _2023;
        float _2035 = _2005 * _2023;
        float _2037 = abs(_2031);
        float _2039 = log2(_2037);
        float _2041 = _2013 * _2023;
        float _2043 = _2033 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2045 = _1753 * _2035;
        float _2047 = -_2035;
        float _2049 = -_2043;
        float _2051 = fma(_2047, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2049);
        float _2053 = fma(_1751, _2033, _2045);
        float _2055 = -_2041;
        float _2057 = fma(_2055, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2051);
        float _2059 = fma(_1755, _2041, _2053);
        float _2061 = precise::clamp(_2059, 0.0, 1.0);
        float _2063 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2065 = _2057 + _2063;
        float _2067 = _2039 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2069 = _2065 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2071 = precise::clamp(_2069, 0.0, 1.0);
        float _2073 = exp2(_2067);
        float _2075 = _2073 * _2071;
        float _2077 = _2061 * _2075;
        float _2079 = _2077 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2081 = _2077 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2083 = _2077 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _2079;
        out.m_91.y = _2081;
        out.m_91.z = _2083;
    }
    out.m_93.x = _1995;
    out.m_93.y = _1997;
    out.m_93.z = _1999;
    if (_1979)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2085 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2085;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1895 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    float _120 = as_type<float>(_112);
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _118;
    if (!_116)
    {
        out.m_49.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _122 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2143 = as_type<float>(_128);
        out.gl_Position.z = _2143;
    }
    if (!_116)
    {
        return out;
    }
    float _132 = in.m_51.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = 0.0;
    float _150 = _146;
    if (_142)
    {
        float _152 = float(_112);
        _120 = _152;
    }
    float _154 = _120;
    bool _156 = _146 >= _154;
    bool _158 = !_142;
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
        _130 = as_type<int>(_166);
    }
    int _168 = _130;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2213 = as_type<float>(_168);
        out.gl_Position.z = _2213;
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
    int _180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _182 = _180 != 0;
    float _184 = in.m_55.x;
    float _186 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _190 = in.m_53.z;
    float _192 = in.m_53.y;
    float _194 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _196 = _172 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _200 = _198 != 0;
    float _202 = in.m_53.x;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _206 = _170 > 0.5;
    float _208 = _188 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _210 = -_174;
    float _212 = _210 + 1.0;
    int _214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _216 = _214 != 0;
    int _218 = 0;
    float _220 = _196;
    float _222 = _174;
    float _224 = _184;
    if (_178)
    {
        float _226 = -_184;
        float _228 = _226 + 1.0;
        _218 = as_type<int>(_228);
    }
    int _230 = _218;
    int _232 = _206 ? as_type<int>(_212) : as_type<int>(_174);
    float _234 = as_type<float>(_230);
    if (!_178)
    {
        _148 = _184;
    }
    float _236 = _148;
    bool _238 = _190 > 0.5;
    float _240 = _182 ? as_type<float>(_232) : _174;
    float _242 = _236;
    float _244 = _240;
    if (_178)
    {
        float _246 = _238 ? as_type<float>(_230) : _184;
        _242 = _246;
    }
    float _248 = _242;
    if (!_216)
    {
        _234 = _192;
    }
    float _250 = _234;
    float _252 = fma(_240, _196, -0.5);
    float _254 = _250;
    if (_216)
    {
        _254 = _202;
    }
    float _256 = _254;
    float _258 = fma(_208, _248, -0.5);
    if (!_216)
    {
        _244 = _190;
    }
    float _260 = _244;
    float _262 = _260;
    if (_216)
    {
        _262 = _192;
    }
    float _264 = _262;
    float _266 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[83].z, _186);
    if (!_216)
    {
        _220 = _190;
    }
    float _268 = _220;
    float _270 = _256 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _272 = _268;
    if (_216)
    {
        _272 = _192;
    }
    float _274 = _272;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _278 = _264 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _280 = -_194;
    float _282 = fma(_270, 2.0, _280);
    float _284 = 0.0;
    if (!_200)
    {
        _284 = _184;
    }
    float _286 = _284;
    float _288 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[83].w, _204);
    float _290 = fma(_278, -2.0, _276);
    float _292 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].z, _266);
    float _294 = -_146;
    float _296 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[81].x, _282);
    float _298 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].w, _288);
    float _300 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[81].y, _290);
    float _302 = fma(_292, _258, _296);
    float _304 = -_300;
    float _306 = fma(_298, _252, _304);
    float _308 = _302 + 0.5;
    float _310 = _306 + 0.5;
    float2 _2465 = float2(_308, _310);
    float _312 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2465, float2(0.0), isnan(_2465)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2465, float2(0.0), isnan(_2465)), level(0.0)).y;
    float _314 = _190 * 2.0;
    float _316 = _202 * 2.0;
    float _318 = _192 * 2.0;
    float _320 = _202 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _322 = floor(_316);
    float _324 = _192 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _326 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _330 = _326 || _328;
    bool _332 = isnan(1.0);
    bool _334 = _330 || _332;
    float _336 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _340 = floor(_314);
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _344 = -_338;
    float _346 = fma(_320, 2.0, _344);
    float _348 = _192 + _202;
    float _350 = fma(_324, -2.0, _342);
    float _352 = floor(_318);
    bool _354 = _322 >= 0.0;
    bool _356 = isnan(_322);
    bool _358 = _354 || _356;
    bool _360 = isnan(0.0);
    bool _362 = _358 || _360;
    float _364 = _348 + (-1.0);
    float _366 = 0.0;
    float _368 = _336;
    float _370 = _286;
    float _372 = _310;
    if (!_334)
    {
        float _374 = _336 * _336;
        float _376 = _374 * 0.5;
        _366 = _376;
    }
    float _378 = _366;
    int _380 = _362 ? 0 : 1;
    float _382 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _384 = _378;
    if (!_334)
    {
        float _386 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _384 = _386;
    }
    float _388 = _384;
    bool _390 = _340 > 0.0;
    bool _392 = _340 >= 0.0;
    bool _394 = isnan(_340);
    bool _396 = _392 || _394;
    bool _398 = isnan(0.0);
    bool _400 = _396 || _398;
    int _402 = ~_380;
    int _404 = _402 + 1;
    int _406 = _404 + 1;
    int _408 = _400 ? 0 : 1;
    bool _410 = _322 > 0.0;
    int _412 = ~_408;
    int _414 = _412 + 1;
    int _416 = _414 + 1;
    bool _418 = _352 >= 0.0;
    bool _420 = isnan(_352);
    bool _422 = _418 || _420;
    bool _424 = isnan(0.0);
    bool _426 = _422 || _424;
    int _428 = _416;
    int _430 = _406;
    float _432 = _388;
    if (!_390)
    {
        int _434 = ~_408;
        int _436 = _434 + 1;
        _428 = _436;
    }
    int _438 = _428;
    float _440 = _192 + _190;
    bool _442 = _352 > 0.0;
    float _444 = _440 + (-1.0);
    float _446 = _444;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    if (!_410)
    {
        int _450 = ~_380;
        int _452 = _450 + 1;
        _430 = _452;
    }
    int _454 = _430;
    float _456 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _458 = !_334;
    if (!_458)
    {
        float _460 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _462 = log2(_460);
        float _464 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _466 = _464 + 1.0;
        float _468 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _470 = _336 * _462;
        float _472 = 1.0 / _466;
        float _474 = _468 * 0.693147182464599609375;
        float _476 = exp2(_470);
        float _478 = 1.0 / _474;
        float _480 = _476 + (-1.0);
        float _482 = -_480;
        float _484 = fma(_482, _478, _336);
        float _486 = _484 * _472;
        float _488 = _486 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _446 = _478;
        _448 = _476;
        _432 = _488;
    }
    float _490 = _446;
    float _492 = _448;
    float _494 = _432;
    bool _496 = !_334;
    float _498 = _490;
    float _500 = _492;
    if (!_496)
    {
        float _502 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _504 = log2(_502);
        float _506 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _508 = _506 + 1.0;
        float _510 = 1.0 / _508;
        float _512 = _336 * _504;
        float _514 = exp2(_512);
        float _516 = -_514;
        float _518 = _516 + 1.0;
        float _520 = _518 * _510;
        _498 = _514;
        _368 = _520;
    }
    float _522 = _498;
    float _524 = _368;
    int _526 = _426 ? 0 : 1;
    float _528 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _530 = log2(_528);
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _534 = _532 != 0;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _542 = _540 != 0;
    float _544 = -_146;
    float _546 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[76].x, _346);
    float _548 = _522;
    bool _550 = _542;
    if (_216)
    {
        _500 = _202;
    }
    float _552 = _500;
    float _554 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _350);
    float _556 = _552;
    if (!_216)
    {
        _556 = _190;
    }
    float _558 = _556;
    if (_216)
    {
        _548 = _192;
    }
    float _560 = _548;
    bool _562 = !_534;
    int _564 = _562 ? 0 : 1;
    float _566 = _558 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _568 = !_538;
    int _570 = _568 ? 0 : 1;
    float _572 = _560;
    if (!_216)
    {
        _572 = _202;
    }
    float _574 = _572;
    int _576 = abs(_564);
    int _578 = abs(_570);
    float _580 = _574 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _582 = float(_438);
    float _584 = float(_454);
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _588 = float(_576);
    float _590 = -_586;
    float _592 = fma(_566, 2.0, _590);
    float _594 = float(_578);
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _598 = ~_526;
    int _600 = _598 + 1;
    int _602 = _600 + 1;
    float _604 = _588 * _582;
    int _606 = _602;
    if (!_442)
    {
        int _608 = ~_526;
        int _610 = _608 + 1;
        _606 = _610;
    }
    int _612 = _606;
    float _614 = _530 * _146;
    float _616 = _594 * _584;
    float _618 = fma(_580, -2.0, _596);
    float _620 = in.m_57.x;
    float _622 = in.m_57.y;
    float _624 = in.m_57.z;
    float _626 = _202 + (-0.5);
    float _628 = exp2(_614);
    float _630 = -_146;
    float _632 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[86].x, _592);
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _636 = 1.0 + _634;
    float _638 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _618);
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _642 = 1.0 / _636;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _646 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _648 = isnan(1.0);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _654 = _650 || _652;
    float _656 = fma(_192, (*spvDescriptorSet0.vp_c9)._m0[88].w, _640);
    bool _658 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _660 = isnan(0.0);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _666 = _662 || _664;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _672 = -_628;
    float _674 = _672 + 1.0;
    bool _676 = !_542;
    int _678 = _676 ? 0 : 1;
    float _680 = _604 * (-2.0);
    float _682 = fma(_192, (*spvDescriptorSet0.vp_c9)._m0[78].w, _644);
    float _684 = float(_612);
    float _686 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[78].z, _668);
    float _688 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[88].z, _670);
    int _690 = abs(_678);
    float _692 = fma(_680, _620, _620);
    float _694 = _666 ? _674 : 0.0;
    float _696 = fma(_382, _680, _382);
    float _698 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _686);
    float _700 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _682);
    float _702 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _688);
    float _704 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _656);
    float _706 = float(_690);
    float _708 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[196].x, _692);
    if (_654)
    {
        float _710 = _694 * _642;
        _150 = _710;
    }
    float _712 = _150;
    float _714 = _616 * (-2.0);
    float _716 = _706 * _684;
    float _718 = fma(_696, _712, _708);
    float _720 = fma(_456, _714, _456);
    float _722 = fma(_714, _622, _622);
    float _724 = in.m_51.x;
    float _726 = in.m_51.y;
    float _728 = in.m_51.z;
    float _730 = _718 * 0.15915493667125701904296875;
    float _732 = _202 + _190;
    float _734 = _192 + (-0.5);
    float _736 = in.m_59.w;
    float _738 = _716 * (-2.0);
    float _740 = _732 + (-1.0);
    float _742 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[196].y, _722);
    float _744 = in.m_46.x;
    float _746 = in.m_46.y;
    float _748 = in.m_46.z;
    float _750 = fma(_738, _624, _624);
    float _752 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _754 = _190 + (-0.5);
    float _756 = _494 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _758 = fma(_720, _712, _742);
    float _760 = fma(_752, _738, _752);
    float _762 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[196].z, _750);
    float _764 = in.m_61.y;
    float _766 = _758 * 0.15915493667125701904296875;
    float _768 = _730 * 6.283185482025146484375;
    float _770 = sin(_768);
    float _772 = fma(_760, _712, _762);
    float _774 = _494 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _776 = _494 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _778 = in.m_63.y;
    float _780 = fma(_524, _726, _756);
    float _782 = fma(_524, _724, _774);
    float _784 = fma(_524, _728, _776);
    float _786 = _730 * 6.283185482025146484375;
    float _788 = cos(_786);
    float _790 = _772 * 0.15915493667125701904296875;
    float _792 = fma(_780, _736, _746);
    float _794 = fma(_784, _736, _748);
    float _796 = _766 * 6.283185482025146484375;
    float _798 = sin(_796);
    float _800 = fma(_782, _736, _744);
    float _802 = _792 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _804 = _792 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _806 = _792 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _808 = _764 * 0.00999999977648258209228515625;
    float _810 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[4].x, _802);
    float _812 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[5].x, _804);
    float _814 = _766 * 6.283185482025146484375;
    float _816 = cos(_814);
    float _818 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[6].x, _806);
    float _820 = in.m_63.x;
    float _822 = fma(_312, _808, _778);
    float _824 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[4].z, _810);
    float _826 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[6].z, _818);
    float _828 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[5].z, _812);
    float _830 = in.m_63.z;
    float _832 = _790 * 6.283185482025146484375;
    float _834 = sin(_832);
    float _836 = _770 * _798;
    float _838 = _788 * _798;
    float _840 = in.m_59.x;
    float _842 = in.m_59.y;
    float _844 = in.m_59.z;
    float _846 = _826 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _848 = _824 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _850 = _828 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _852 = _790 * 6.283185482025146484375;
    float _854 = cos(_852);
    float _856 = _788 * _816;
    float _858 = _770 * _816;
    float _860 = fma(_834, _856, _836);
    float _862 = fma(_834, _836, _856);
    float _864 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _822);
    float _866 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _820);
    float _868 = -_838;
    float _870 = fma(_834, _858, _868);
    float _872 = -_858;
    float _874 = fma(_834, _838, _872);
    float _876 = _788 * _854;
    float _878 = _770 * _854;
    float _880 = _816 * _854;
    float _882 = _842 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _884 = _840 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _886 = _844 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _888 = _798 * _854;
    float _890 = _882 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _892 = _884 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _894 = _886 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _896 = _864 * _890;
    float _898 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _830);
    float _900 = _866 * _892;
    float _902 = _876 * _896;
    float _904 = _898 * _894;
    float _906 = -_896;
    float _908 = _834 * _906;
    float _910 = _878 * _896;
    float _912 = fma(_860, _900, _902);
    float _914 = fma(_880, _900, _908);
    float _916 = fma(_870, _900, _910);
    float _918 = fma(_874, _904, _912);
    float _920 = fma(_888, _904, _914);
    float _922 = fma(_862, _904, _916);
    float _924 = _918 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _926 = _918 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _928 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[10].x, _924);
    float _930 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[8].x, _926);
    float _932 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[10].z, _928);
    float _934 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[8].z, _930);
    float _936 = _846 + _932;
    float _938 = _848 + _934;
    float _940 = _918 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _942 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _944 = _936 + _942;
    float _946 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _948 = _938 + _946;
    float _950 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[9].x, _940);
    float _952 = _944 * _944;
    float _954 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[9].z, _950);
    float _956 = fma(_948, _948, _952);
    float _958 = _850 + _954;
    float _960 = sqrt(_956);
    bool _962 = _960 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _964 = _918;
    float _966 = _922;
    float _968 = _788;
    if (!_962)
    {
        _964 = _938;
    }
    float _970 = _964;
    float _972 = _970;
    if (!_962)
    {
        _966 = _936;
    }
    float _974 = _966;
    float _976 = _974;
    if (!_962)
    {
        _968 = _958;
    }
    float _978 = _968;
    bool _980 = !_962;
    float _982 = _978;
    if (!_980)
    {
        float _984 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _986 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _988 = _960 + _986;
        float _990 = rsqrt(_956);
        float _992 = _988 * _984;
        float _994 = _958 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _996 = _992 * 0.15915493667125701904296875;
        float _998 = _996 * 6.283185482025146484375;
        float _1000 = cos(_998);
        float _1002 = _996 * 6.283185482025146484375;
        float _1004 = sin(_1002);
        float _1006 = _1000 + (-1.0);
        float _1008 = fma(_1004, _994, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1010 = _1006 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1012 = _990 * _1008;
        float _1014 = fma(_958, _1000, _1010);
        float _1016 = fma(_948, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1018 = fma(_944, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _982 = _1014;
        _972 = _1016;
        _976 = _1018;
    }
    float _1020 = _982;
    float _1022 = _972;
    float _1024 = _976;
    float _1026 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1028 = _1020 + _1026;
    float _1030 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1032 = _1022 + _1030;
    float _1034 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1036 = _1024 + _1034;
    float _1038 = _1028 * _1028;
    float _1040 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1042 = _1020 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1044 = fma(_1032, _1032, _1038);
    float _1046 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1048 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1042);
    float _1050 = fma(_1036, _1036, _1044);
    float _1052 = precise::max(0.0, _1046);
    float _1054 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1048);
    float _1056 = rsqrt(_1050);
    float _1058 = sqrt(_1050);
    float _1060 = _1056 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1062 = _1032 * _1060;
    float _1064 = _1036 * _1060;
    float _1066 = -_1060;
    float _1068 = -_1052;
    float _1070 = fma(_1028, _1066, _1068);
    float _1072 = _1062 * _1062;
    float _1074 = _1064 * _1064;
    float _1076 = _1072 + _1074;
    float _1078 = sqrt(_1076);
    bool _1080 = _1078 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1082 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1084 = _1078 + _1082;
    float _1086 = _958;
    float _1088 = _1052;
    float _1090 = _1076;
    float _1092 = _1084;
    float _1094 = _1060;
    float _1096 = _1062;
    float _1098 = _1064;
    float _1100 = _1072;
    float _1102 = _1074;
    float _1104 = _1070;
    if (_1080)
    {
        float _1106 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1086 = _1106;
    }
    float _1108 = _1086;
    if (_1080)
    {
        float _1110 = _1070 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1088 = _1110;
    }
    float _1112 = _1088;
    float _1114 = _1112;
    if (_1080)
    {
        float _1116 = rsqrt(_1076);
        _1090 = _1116;
    }
    float _1118 = _1090;
    if (_1080)
    {
        float _1120 = _1084 * _1108;
        _1092 = _1120;
    }
    float _1122 = _1092;
    float _1124 = 0.0;
    if (_1080)
    {
        float _1126 = _1122 * 0.15915493667125701904296875;
        _1124 = _1126;
    }
    float _1128 = _1124;
    float _1130 = _1108;
    if (_1080)
    {
        float _1132 = _1128 * 6.283185482025146484375;
        float _1134 = sin(_1132);
        _1130 = _1134;
    }
    float _1136 = _1130;
    float _1138 = _1122;
    if (_1080)
    {
        float _1140 = _1128 * 6.283185482025146484375;
        float _1142 = cos(_1140);
        _1138 = _1142;
    }
    float _1144 = _1138;
    float _1146 = _1136;
    if (_1080)
    {
        float _1148 = fma(_1136, _1112, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1146 = _1148;
    }
    float _1150 = _1146;
    float _1152 = _1150;
    if (_1080)
    {
        float _1154 = _1118 * _1150;
        _1094 = _1154;
    }
    float _1156 = _1094;
    if (_1080)
    {
        float _1158 = _1144 + (-1.0);
        _1114 = _1158;
    }
    float _1160 = _1114;
    if (_1080)
    {
        float _1162 = _1062 * _1156;
        _1096 = _1162;
    }
    float _1164 = _1096;
    if (_1080)
    {
        float _1166 = _1064 * _1156;
        _1098 = _1166;
    }
    float _1168 = _1098;
    if (_1080)
    {
        float _1170 = _1160 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1152 = _1170;
    }
    float _1172 = _1152;
    if (_1080)
    {
        float _1174 = _1164 * _1164;
        _1100 = _1174;
    }
    float _1176 = _1100;
    if (_1080)
    {
        float _1178 = _1168 * _1168;
        _1102 = _1178;
    }
    float _1180 = _1102;
    if (_1080)
    {
        float _1182 = fma(_1070, _1144, _1172);
        _1104 = _1182;
    }
    float _1184 = _1104;
    float _1186 = fma(_1184, _1184, _1176);
    float _1188 = _1020 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1190 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1192 = fma(_1058, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1190);
    float _1194 = precise::clamp(_1192, 0.0, 1.0);
    float _1196 = _1186 + _1180;
    float _1198 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1188);
    float _1200 = -_1194;
    float _1202 = _1200 + 1.0;
    float _1204 = _1020 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1206 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1198);
    float _1208 = rsqrt(_1196);
    float _1210 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1204);
    float _1212 = _1020 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1214 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1216 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1210);
    float _1218 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1212);
    float _1220 = _1214 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1222 = abs(_1202);
    float _1224 = log2(_1222);
    float _1226 = _1216 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1228 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1218);
    float _1230 = -_1220;
    float _1232 = fma(_1230, _1040, 1.0);
    float _1234 = _1054 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1236 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1238 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1240 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1242 = _1208 * _1164;
    float _1244 = _1208 * _1184;
    float _1246 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1236);
    float _1248 = _1208 * _1168;
    float _1250 = _1242 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1252 = log2(_1232);
    float _1254 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1246);
    float _1256 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1240);
    float _1258 = _1224 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1260 = -_1250;
    float _1262 = fma(_1244, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1260);
    float _1264 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1254);
    float _1266 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1256);
    float _1268 = -_1248;
    float _1270 = fma(_1268, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1262);
    float _1272 = exp2(_1258);
    float _1274 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1276 = fma(_1270, -0.5, 0.5);
    float _1278 = fma(_1270, 0.5, 0.5);
    float _1280 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1274);
    float _1282 = _1244 + 1.0;
    float _1284 = _1252 * 0.693147182464599609375;
    float _1286 = 1.0 / _1264;
    float _1288 = fma(_1278, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1290 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1280);
    float _1292 = _1284 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1294 = fma(_1278, _1288, -0.212114393711090087890625);
    float _1296 = sqrt(_1276);
    float _1298 = -_1244;
    float _1300 = fma(_1272, _1282, _1298);
    float _1302 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1290);
    float _1304 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1266);
    float _1306 = fma(_1278, _1294, 1.570728778839111328125);
    float _1308 = fma(_1300, 0.5, 0.5);
    float _1310 = _1302 * _1286;
    float _1312 = _1304 * _1286;
    float _1314 = fma(_1312, -0.5, 0.5);
    float _1316 = _1296 * 0.636619746685028076171875;
    float _1318 = fma(_1310, 0.5, 0.5);
    float _1320 = -_1306;
    float _1322 = fma(_1316, _1320, 1.0);
    float3 _4055 = float3(_1318, _1314, _1292);
    float _1324 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4055, float3(0.0), isnan(_4055)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4055, float3(0.0), isnan(_4055)), level(0.0)).x;
    float3 _4066 = float3(_1318, _1314, _1292);
    float4 _1327 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4066, float3(0.0), isnan(_4066)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4066, float3(0.0), isnan(_4066)), level(0.0)).xyzw;
    float _1329 = _1327.x;
    float _1331 = _1327.y;
    float _1333 = _1327.z;
    float _1335 = _1327.w;
    float2 _4082 = float2(_1322, _1308);
    float3 _1339 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4082, float2(0.0), isnan(_4082)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4082, float2(0.0), isnan(_4082)), level(0.0)).xyz;
    float _1341 = _1339.x;
    float _1343 = _1339.y;
    float _1345 = _1339.z;
    float _1347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1351 = _1349 != 0;
    out.m_65.x = _1022;
    out.m_65.y = _1020;
    out.m_65.z = _1024;
    int _1353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1355 = _1353 != 0;
    int _1357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1359 = _1357 != 0;
    bool _1361 = _192 > 0.5;
    float _1363 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1365 = as_type<int>(_1318);
    if (_200)
    {
        bool _1367 = _202 > 0.5;
        _550 = _1367;
    }
    bool _1369 = _550;
    float _1371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_200)
    {
        float _1373 = -_184;
        float _1375 = _1373 + 1.0;
        _1365 = as_type<int>(_1375);
    }
    int _1377 = _1365;
    int _1379 = _1361 ? as_type<int>(_212) : as_type<int>(_174);
    float _1381 = _1347 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1383 = as_type<int>(_1347);
    if (_1351)
    {
        float _1385 = -_184;
        float _1387 = _1385 + 1.0;
        _1383 = as_type<int>(_1387);
    }
    int _1389 = _1383;
    float _1391 = _1359 ? as_type<float>(_1379) : _174;
    float _1393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    if (_200)
    {
        float _1395 = _1369 ? as_type<float>(_1377) : _184;
        _370 = _1395;
    }
    float _1397 = _370;
    float _1399 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1355)
    {
        float _1401 = _238 ? _212 : _174;
        _222 = _1401;
    }
    float _1403 = _222;
    float _1405 = fma(_1381, _1391, -0.5);
    if (_1351)
    {
        float _1407 = _1361 ? as_type<float>(_1389) : _184;
        _224 = _1407;
    }
    float _1409 = _224;
    float _1411 = fma(_1399, _1397, -0.5);
    float _1413 = in.m_61.x;
    float _1415 = _1371 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1417 = fma(_698, _1411, _546);
    float _1419 = -_554;
    float _1421 = fma(_700, _1405, _1419);
    float _1423 = fma(_1415, _1409, -0.5);
    float _1425 = in.m_61.z;
    bool _1427 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1429 = isnan(0.5);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1435 = _1431 || _1433;
    float _1437 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1439 = fma(_702, _1423, _632);
    bool _1441 = _822 != 0.0;
    bool _1443 = isnan(_822);
    bool _1445 = _1441 || _1443;
    bool _1447 = isnan(0.0);
    bool _1449 = _1445 || _1447;
    float _1451 = in.m_61.w;
    float _1453 = fma(_1437, _1403, -0.5);
    float _1455 = _850 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1457 = _820 == 0.0;
    bool _1459 = !_1449;
    bool _1461 = _1457 && _1459;
    float _1463 = -_638;
    float _1465 = fma(_704, _1453, _1463);
    float _1467 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1455);
    float _1469 = _1421 + 0.5;
    float _1471 = in.m_67.x;
    float _1473 = in.m_67.y;
    float _1475 = in.m_67.z;
    float _1477 = in.m_67.w;
    float _1479 = _1417 + 0.5;
    float _1481 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1467);
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1485 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1487 = _850 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1489 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_69.x = _1413;
    out.m_69.y = _764;
    float _1491 = _1439 + 0.5;
    float _1493 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1487);
    float _1495 = _1421;
    float _1497 = _1439;
    float _1499 = _1491;
    if (!_1435)
    {
        _1495 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1501 = _1495;
    float _1503 = 1.0 / _1489;
    out.m_71.w = _1483;
    float _1505 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1493);
    bool _1507 = _830 == 0.0;
    bool _1509 = _1507 && _1461;
    out.m_69.z = _1425;
    float _1511 = _1505 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1513 = _1465 + 0.5;
    float _1515 = _1511 + _1489;
    float _1517 = in.m_73.x;
    float _1519 = in.m_73.y;
    float _1521 = in.m_73.z;
    float _1523 = _876 * _1473;
    float _1525 = -_1473;
    float _1527 = _834 * _1525;
    out.m_75.x = _1479;
    out.m_75.y = _1469;
    out.m_75.z = _308;
    out.m_75.w = _310;
    float _1529 = _1515 * _1503;
    float _1531 = _1529 * 0.5;
    float _1533 = fma(_860, _1471, _1523);
    float _1535 = fma(_880, _1471, _1527);
    out.m_77.x = _1491;
    out.m_77.y = _1513;
    float _1537 = fma(_874, _1475, _1533);
    float _1539 = fma(_888, _1475, _1535);
    out.m_79.w = _1485;
    out.m_69.w = _1451;
    float _1541 = _878 * _1473;
    float _1543 = _1537 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1545 = _1539;
    if (!_1435)
    {
        float _1547 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1549 = fma(_1531, _1501, _1547);
        _372 = _1549;
    }
    float _1551 = _372;
    float _1553 = _1537 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1555 = fma(_870, _1471, _1541);
    float _1557 = _1537 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1559 = fma(_1539, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1543);
    float _1561 = fma(_1539, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1553);
    float _1563 = fma(_862, _1475, _1555);
    float _1565 = fma(_1539, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1557);
    float _1567 = _1551;
    float _1569 = _1565;
    float _1571 = _1561;
    float _1573 = _1517;
    if (_1509)
    {
        _1545 = _1517;
    }
    float _1575 = _1545;
    float _1577 = _1575;
    if (!_1435)
    {
        float _1579 = 1.0 / _1551;
        _1567 = _1579;
    }
    float _1581 = _1567;
    float _1583 = fma(_1563, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1559);
    float _1585 = fma(_1563, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1561);
    float _1587 = fma(_1563, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1565);
    if (_1509)
    {
        _1569 = _1519;
    }
    float _1589 = _1569;
    float _1591 = _1589;
    if (_1509)
    {
        _1497 = _1521;
    }
    float _1593 = _1497;
    float _1595 = _1593;
    if (_1509)
    {
        _1499 = _1575;
    }
    float _1597 = _1499;
    out.m_81.x = _1583;
    out.m_81.y = _1585;
    out.m_81.z = _1587;
    float _1599 = _1597;
    if (!_1509)
    {
        _1577 = _1517;
    }
    float _1601 = _1577;
    if (_1509)
    {
        _1571 = _1589;
    }
    float _1603 = _1571;
    float _1605 = _1603;
    if (_1509)
    {
        _1573 = _1593;
    }
    float _1607 = _1573;
    float _1609 = _1607;
    if (!_1509)
    {
        float _1611 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1601);
        _1599 = _1611;
    }
    float _1613 = _1599;
    if (!_1509)
    {
        _1591 = _1519;
    }
    float _1615 = _1591;
    float _1617 = _1475 * _1601;
    if (!_1509)
    {
        _1595 = _1521;
    }
    float _1619 = _1595;
    float _1621 = _1471 * _1615;
    if (!_1509)
    {
        float _1623 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1615);
        _1605 = _1623;
    }
    float _1625 = _1605;
    float _1627 = _1473 * _1619;
    float _1629 = -_1617;
    float _1631 = fma(_1471, _1619, _1629);
    float _1633 = -_1621;
    float _1635 = fma(_1473, _1601, _1633);
    if (!_1509)
    {
        float _1637 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1619);
        _1609 = _1637;
    }
    float _1639 = _1609;
    float _1641 = -_1627;
    float _1643 = fma(_1475, _1615, _1641);
    float _1645 = _1631 * _1477;
    float _1647 = _1635 * _1477;
    float _1649 = _876 * _1625;
    float _1651 = _1643 * _1477;
    float _1653 = _876 * _1645;
    float _1655 = -_1645;
    float _1657 = _834 * _1655;
    float _1659 = fma(_860, _1613, _1649);
    float _1661 = _878 * _1645;
    float _1663 = fma(_860, _1651, _1653);
    float _1665 = _1224 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1667 = -_1625;
    float _1669 = _834 * _1667;
    float _1671 = _878 * _1625;
    float _1673 = fma(_880, _1651, _1657);
    float _1675 = fma(_870, _1651, _1661);
    float _1677 = exp2(_1665);
    float _1679 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1681 = fma(_880, _1613, _1669);
    float _1683 = fma(_874, _1647, _1663);
    float _1685 = fma(_888, _1647, _1673);
    float _1687 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1679);
    float _1689 = fma(_888, _1639, _1681);
    float _1691 = _1683 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1693 = _1683 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1695 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1687);
    float _1697 = _1683 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1699 = fma(_862, _1647, _1675);
    float _1701 = fma(_1685, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1691);
    float _1703 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1695);
    float _1705 = fma(_870, _1613, _1671);
    float _1707 = fma(_1685, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1693);
    float _1709 = -_1677;
    float _1711 = _1709 + 1.0;
    float _1713 = fma(_1685, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1697);
    float _1715 = _1703 + _1264;
    float _1717 = fma(_874, _1639, _1659);
    float _1719 = fma(_1699, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1701);
    float _1721 = fma(_862, _1639, _1705);
    float _1723 = fma(_1699, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1707);
    float _1725 = _1711 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1727 = fma(_1699, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1713);
    float _1729 = _1715 * 0.5;
    float _1731 = _1715;
    float _1733 = _1719;
    float _1735 = _1727;
    if (!_1435)
    {
        _1731 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1737 = _1731;
    float _1739 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1741 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1743 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_83.x = _1719;
    out.m_83.y = _1723;
    out.m_83.z = _1727;
    float _1745 = fma(_1689, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1739);
    float _1747 = fma(_1689, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1741);
    float _1749 = fma(_1689, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1743);
    float _1751 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1745);
    float _1753 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1747);
    float _1755 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1749);
    out.gl_Position.x = _1302;
    out.gl_Position.y = _1304;
    out.gl_Position.z = _1703;
    out.gl_Position.w = _1264;
    bool _1757 = _1058 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1759 = isnan(_1058);
    bool _1761 = _1757 || _1759;
    bool _1763 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1765 = _1761 || _1763;
    float _1767 = _1749;
    if (!_1435)
    {
        float _1769 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1771 = -_1737;
        float _1773 = fma(_1581, _1769, _1771);
        _1767 = _1773;
    }
    float _1775 = _1767;
    float _1777 = _1775;
    if (!_1435)
    {
        float _1779 = -_1737;
        float _1781 = _1779 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1733 = _1781;
    }
    float _1783 = _1733;
    out.m_85.z = _1729;
    out.m_85.w = _1264;
    out.m_87.x = _1751;
    out.m_87.y = _1753;
    out.m_87.z = _1755;
    float _1785 = _1783;
    if (!_1435)
    {
        float _1787 = 1.0 / _1783;
        _1785 = _1787;
    }
    float _1789 = _1785;
    if (!_1765)
    {
        _1735 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1791 = _1735;
    float _1793 = _1789;
    float _1795 = _1791;
    float _1797 = _1791;
    if (!_1435)
    {
        float _1799 = _1775 * _1789;
        float _1801 = precise::clamp(_1799, 0.0, 1.0);
        _1793 = _1801;
    }
    float _1803 = _1793;
    float _1805 = _1803;
    if (_1435)
    {
        _1777 = 1.0;
    }
    float _1807 = _1777;
    float _1809 = _1807;
    if (!_1435)
    {
        float _1811 = -_1803;
        float _1813 = _1811 + 1.0;
        _1809 = _1813;
    }
    float _1815 = _1809;
    if (!_1765)
    {
        _1805 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1817 = _1805;
    float _1819 = _1725 * _1324;
    float _1821 = -_1725;
    float _1823 = _1821 + 1.0;
    float _1825 = _1815 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1827 = _1335 * _1819;
    float _1829 = _1345 * _1819;
    float _1831 = _1335 * _1823;
    float _1833 = fma(_1341, _1827, _1329);
    float _1835 = fma(_1343, _1827, _1331);
    float _1837 = fma(_1335, _1829, _1333);
    float _1839 = _1827;
    float _1841 = _1817;
    float _1843 = _1817;
    if (!_1765)
    {
        _1839 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1845 = _1839;
    out.m_89.x = _1833;
    out.m_89.y = _1835;
    out.m_89.z = _1837;
    out.m_89.w = _1831;
    bool _1847 = !_1765;
    float _1849 = _1845;
    float _1851 = _1845;
    if (!_1847)
    {
        bool _1853 = _1058 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1855 = isnan(_1058);
        bool _1857 = _1853 || _1855;
        bool _1859 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1861 = _1857 || _1859;
        if (!_1861)
        {
            float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1865 = _1058 + _1863;
            float _1867 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1869 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1867;
            float _1871 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1873 = _1871 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1875 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1877 = _1875 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1879 = 1.0 / _1869;
            float _1881 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1883 = _1881 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1885 = _1865 * _1879;
            float _1887 = precise::clamp(_1885, 0.0, 1.0);
            float _1889 = fma(_1887, _1873, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1891 = fma(_1887, _1877, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1893 = fma(_1887, _1883, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _1851 = _1891;
            _1797 = _1889;
            _1843 = _1893;
            _1895 = true;
        }
        else
        {
            bool _1897 = _1058 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1899 = isnan(_1058);
            bool _1901 = _1897 || _1899;
            bool _1903 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1905 = _1901 || _1903;
            if (!_1905)
            {
                _1795 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1907 = _1795;
            _1797 = _1907;
            if (!_1905)
            {
                _1849 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1909 = _1849;
            _1851 = _1909;
            if (!_1905)
            {
                _1841 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1911 = _1841;
            bool _1913 = !_1905;
            _1843 = _1911;
            if (!_1913)
            {
                bool _1915 = _1058 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1917 = isnan(_1058);
                bool _1919 = _1915 || _1917;
                bool _1921 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1923 = _1919 || _1921;
                if (!_1923)
                {
                    float _1925 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1927 = _1058 + _1925;
                    float _1929 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1931 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1929;
                    float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1935 = _1933 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1937 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1939 = _1937 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1941 = 1.0 / _1931;
                    float _1943 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1945 = _1943 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1947 = _1927 * _1941;
                    float _1949 = precise::clamp(_1947, 0.0, 1.0);
                    float _1951 = fma(_1949, _1935, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1953 = fma(_1949, _1939, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1955 = fma(_1949, _1945, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _1851 = _1953;
                    _1797 = _1951;
                    _1843 = _1955;
                    _1895 = true;
                }
                else
                {
                    _1851 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1797 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1843 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1895 = false;
    float _1957 = _1851;
    float _1959 = _1797;
    float _1961 = _1843;
    float _1963 = _1825 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_91.x = 0.0;
    float _1965 = _1957 * 0.586610972881317138671875;
    bool _1967 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_49.x = _1963;
    float _1969 = fma(_1959, 0.298911988735198974609375, _1965);
    bool _1971 = _1815 > 0.0;
    bool _1973 = isnan(_1815);
    bool _1975 = _1971 || _1973;
    bool _1977 = isnan(0.0);
    bool _1979 = _1975 || _1977;
    float _1981 = fma(_1961, 0.114477999508380889892578125, _1969);
    float _1983 = -_1981;
    float _1985 = _1983 + _1959;
    float _1987 = -_1981;
    float _1989 = _1987 + _1957;
    float _1991 = -_1981;
    float _1993 = _1991 + _1961;
    float _1995 = fma(_1985, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1981);
    float _1997 = fma(_1989, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1981);
    float _1999 = fma(_1993, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1981);
    bool _2001 = !_1967;
    if (!_2001)
    {
        float _2003 = -_1020;
        float _2005 = _2003 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2007 = -_1022;
        float _2009 = _2007 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2011 = -_1024;
        float _2013 = _2011 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2015 = _2005 * _2005;
        float _2017 = fma(_2009, _2009, _2015);
        float _2019 = fma(_2013, _2013, _2017);
        float _2021 = sqrt(_2019);
        float _2023 = rsqrt(_2019);
        float _2025 = -_2021;
        float _2027 = _2025 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2029 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2031 = precise::clamp(_2029, 0.0, 1.0);
        float _2033 = _2009 * _2023;
        float _2035 = _2005 * _2023;
        float _2037 = abs(_2031);
        float _2039 = log2(_2037);
        float _2041 = _2013 * _2023;
        float _2043 = _2033 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2045 = _1753 * _2035;
        float _2047 = -_2035;
        float _2049 = -_2043;
        float _2051 = fma(_2047, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2049);
        float _2053 = fma(_1751, _2033, _2045);
        float _2055 = -_2041;
        float _2057 = fma(_2055, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2051);
        float _2059 = fma(_1755, _2041, _2053);
        float _2061 = precise::clamp(_2059, 0.0, 1.0);
        float _2063 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2065 = _2057 + _2063;
        float _2067 = _2039 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2069 = _2065 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2071 = precise::clamp(_2069, 0.0, 1.0);
        float _2073 = exp2(_2067);
        float _2075 = _2073 * _2071;
        float _2077 = _2061 * _2075;
        float _2079 = _2077 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2081 = _2077 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2083 = _2077 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _2079;
        out.m_91.y = _2081;
        out.m_91.z = _2083;
    }
    out.m_93.x = _1995;
    out.m_93.y = _1997;
    out.m_93.z = _1999;
    if (_1979)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2085 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2085;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1895 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    float _120 = as_type<float>(_112);
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _118;
    if (!_116)
    {
        out.m_49.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _122 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2143 = as_type<float>(_128);
        out.gl_Position.z = _2143;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_51.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = 0.0;
    float _150 = _146;
    if (_142)
    {
        float _152 = float(_112);
        _120 = _152;
    }
    float _154 = _120;
    bool _156 = _146 >= _154;
    bool _158 = !_142;
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
        _130 = as_type<int>(_166);
    }
    int _168 = _130;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2213 = as_type<float>(_168);
        out.gl_Position.z = _2213;
    }
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _170 = in.m_53.w;
    float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _174 = in.m_55.y;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _178 = _176 != 0;
    int _180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _182 = _180 != 0;
    float _184 = in.m_55.x;
    float _186 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _190 = in.m_53.z;
    float _192 = in.m_53.y;
    float _194 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _196 = _172 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _200 = _198 != 0;
    float _202 = in.m_53.x;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _206 = _170 > 0.5;
    float _208 = _188 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _210 = -_174;
    float _212 = _210 + 1.0;
    int _214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _216 = _214 != 0;
    int _218 = 0;
    float _220 = _196;
    float _222 = _174;
    float _224 = _184;
    if (_178)
    {
        float _226 = -_184;
        float _228 = _226 + 1.0;
        _218 = as_type<int>(_228);
    }
    int _230 = _218;
    int _232 = _206 ? as_type<int>(_212) : as_type<int>(_174);
    float _234 = as_type<float>(_230);
    if (!_178)
    {
        _148 = _184;
    }
    float _236 = _148;
    bool _238 = _190 > 0.5;
    float _240 = _182 ? as_type<float>(_232) : _174;
    float _242 = _236;
    float _244 = _240;
    if (_178)
    {
        float _246 = _238 ? as_type<float>(_230) : _184;
        _242 = _246;
    }
    float _248 = _242;
    if (!_216)
    {
        _234 = _192;
    }
    float _250 = _234;
    float _252 = fma(_240, _196, -0.5);
    float _254 = _250;
    if (_216)
    {
        _254 = _202;
    }
    float _256 = _254;
    float _258 = fma(_208, _248, -0.5);
    if (!_216)
    {
        _244 = _190;
    }
    float _260 = _244;
    float _262 = _260;
    if (_216)
    {
        _262 = _192;
    }
    float _264 = _262;
    float _266 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[83].z, _186);
    if (!_216)
    {
        _220 = _190;
    }
    float _268 = _220;
    float _270 = _256 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _272 = _268;
    if (_216)
    {
        _272 = _192;
    }
    float _274 = _272;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _278 = _264 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _280 = -_194;
    float _282 = fma(_270, 2.0, _280);
    float _284 = 0.0;
    if (!_200)
    {
        _284 = _184;
    }
    float _286 = _284;
    float _288 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[83].w, _204);
    float _290 = fma(_278, -2.0, _276);
    float _292 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].z, _266);
    float _294 = -_146;
    float _296 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[81].x, _282);
    float _298 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].w, _288);
    float _300 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[81].y, _290);
    float _302 = fma(_292, _258, _296);
    float _304 = -_300;
    float _306 = fma(_298, _252, _304);
    float _308 = _302 + 0.5;
    float _310 = _306 + 0.5;
    float2 _2465 = float2(_308, _310);
    float _312 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2465, float2(0.0), isnan(_2465)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2465, float2(0.0), isnan(_2465)), level(0.0)).y;
    float _314 = _190 * 2.0;
    float _316 = _202 * 2.0;
    float _318 = _192 * 2.0;
    float _320 = _202 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _322 = floor(_316);
    float _324 = _192 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _326 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _330 = _326 || _328;
    bool _332 = isnan(1.0);
    bool _334 = _330 || _332;
    float _336 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _340 = floor(_314);
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _344 = -_338;
    float _346 = fma(_320, 2.0, _344);
    float _348 = _192 + _202;
    float _350 = fma(_324, -2.0, _342);
    float _352 = floor(_318);
    bool _354 = _322 >= 0.0;
    bool _356 = isnan(_322);
    bool _358 = _354 || _356;
    bool _360 = isnan(0.0);
    bool _362 = _358 || _360;
    float _364 = _348 + (-1.0);
    float _366 = 0.0;
    float _368 = _336;
    float _370 = _286;
    float _372 = _310;
    if (!_334)
    {
        float _374 = _336 * _336;
        float _376 = _374 * 0.5;
        _366 = _376;
    }
    float _378 = _366;
    int _380 = _362 ? 0 : 1;
    float _382 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _384 = _378;
    if (!_334)
    {
        float _386 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _384 = _386;
    }
    float _388 = _384;
    bool _390 = _340 > 0.0;
    bool _392 = _340 >= 0.0;
    bool _394 = isnan(_340);
    bool _396 = _392 || _394;
    bool _398 = isnan(0.0);
    bool _400 = _396 || _398;
    int _402 = ~_380;
    int _404 = _402 + 1;
    int _406 = _404 + 1;
    int _408 = _400 ? 0 : 1;
    bool _410 = _322 > 0.0;
    int _412 = ~_408;
    int _414 = _412 + 1;
    int _416 = _414 + 1;
    bool _418 = _352 >= 0.0;
    bool _420 = isnan(_352);
    bool _422 = _418 || _420;
    bool _424 = isnan(0.0);
    bool _426 = _422 || _424;
    int _428 = _416;
    int _430 = _406;
    float _432 = _388;
    if (!_390)
    {
        int _434 = ~_408;
        int _436 = _434 + 1;
        _428 = _436;
    }
    int _438 = _428;
    float _440 = _192 + _190;
    bool _442 = _352 > 0.0;
    float _444 = _440 + (-1.0);
    float _446 = _444;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    if (!_410)
    {
        int _450 = ~_380;
        int _452 = _450 + 1;
        _430 = _452;
    }
    int _454 = _430;
    float _456 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _458 = !_334;
    if (!_458)
    {
        float _460 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _462 = log2(_460);
        float _464 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _466 = _464 + 1.0;
        float _468 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _470 = _336 * _462;
        float _472 = 1.0 / _466;
        float _474 = _468 * 0.693147182464599609375;
        float _476 = exp2(_470);
        float _478 = 1.0 / _474;
        float _480 = _476 + (-1.0);
        float _482 = -_480;
        float _484 = fma(_482, _478, _336);
        float _486 = _484 * _472;
        float _488 = _486 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _446 = _478;
        _448 = _476;
        _432 = _488;
    }
    float _490 = _446;
    float _492 = _448;
    float _494 = _432;
    bool _496 = !_334;
    float _498 = _490;
    float _500 = _492;
    if (!_496)
    {
        float _502 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _504 = log2(_502);
        float _506 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _508 = _506 + 1.0;
        float _510 = 1.0 / _508;
        float _512 = _336 * _504;
        float _514 = exp2(_512);
        float _516 = -_514;
        float _518 = _516 + 1.0;
        float _520 = _518 * _510;
        _498 = _514;
        _368 = _520;
    }
    float _522 = _498;
    float _524 = _368;
    int _526 = _426 ? 0 : 1;
    float _528 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _530 = log2(_528);
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _534 = _532 != 0;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _542 = _540 != 0;
    float _544 = -_146;
    float _546 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[76].x, _346);
    float _548 = _522;
    bool _550 = _542;
    if (_216)
    {
        _500 = _202;
    }
    float _552 = _500;
    float _554 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _350);
    float _556 = _552;
    if (!_216)
    {
        _556 = _190;
    }
    float _558 = _556;
    if (_216)
    {
        _548 = _192;
    }
    float _560 = _548;
    bool _562 = !_534;
    int _564 = _562 ? 0 : 1;
    float _566 = _558 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _568 = !_538;
    int _570 = _568 ? 0 : 1;
    float _572 = _560;
    if (!_216)
    {
        _572 = _202;
    }
    float _574 = _572;
    int _576 = abs(_564);
    int _578 = abs(_570);
    float _580 = _574 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _582 = float(_438);
    float _584 = float(_454);
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _588 = float(_576);
    float _590 = -_586;
    float _592 = fma(_566, 2.0, _590);
    float _594 = float(_578);
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _598 = ~_526;
    int _600 = _598 + 1;
    int _602 = _600 + 1;
    float _604 = _588 * _582;
    int _606 = _602;
    if (!_442)
    {
        int _608 = ~_526;
        int _610 = _608 + 1;
        _606 = _610;
    }
    int _612 = _606;
    float _614 = _530 * _146;
    float _616 = _594 * _584;
    float _618 = fma(_580, -2.0, _596);
    float _620 = in.m_57.x;
    float _622 = in.m_57.y;
    float _624 = in.m_57.z;
    float _626 = _202 + (-0.5);
    float _628 = exp2(_614);
    float _630 = -_146;
    float _632 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[86].x, _592);
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _636 = 1.0 + _634;
    float _638 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _618);
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _642 = 1.0 / _636;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _646 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _648 = isnan(1.0);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _654 = _650 || _652;
    float _656 = fma(_192, (*spvDescriptorSet0.vp_c9)._m0[88].w, _640);
    bool _658 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _660 = isnan(0.0);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _666 = _662 || _664;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _672 = -_628;
    float _674 = _672 + 1.0;
    bool _676 = !_542;
    int _678 = _676 ? 0 : 1;
    float _680 = _604 * (-2.0);
    float _682 = fma(_192, (*spvDescriptorSet0.vp_c9)._m0[78].w, _644);
    float _684 = float(_612);
    float _686 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[78].z, _668);
    float _688 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[88].z, _670);
    int _690 = abs(_678);
    float _692 = fma(_680, _620, _620);
    float _694 = _666 ? _674 : 0.0;
    float _696 = fma(_382, _680, _382);
    float _698 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _686);
    float _700 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _682);
    float _702 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _688);
    float _704 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _656);
    float _706 = float(_690);
    float _708 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[196].x, _692);
    if (_654)
    {
        float _710 = _694 * _642;
        _150 = _710;
    }
    float _712 = _150;
    float _714 = _616 * (-2.0);
    float _716 = _706 * _684;
    float _718 = fma(_696, _712, _708);
    float _720 = fma(_456, _714, _456);
    float _722 = fma(_714, _622, _622);
    float _724 = in.m_51.x;
    float _726 = in.m_51.y;
    float _728 = in.m_51.z;
    float _730 = _718 * 0.15915493667125701904296875;
    float _732 = _202 + _190;
    float _734 = _192 + (-0.5);
    float _736 = in.m_59.w;
    float _738 = _716 * (-2.0);
    float _740 = _732 + (-1.0);
    float _742 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[196].y, _722);
    float _744 = in.m_46.x;
    float _746 = in.m_46.y;
    float _748 = in.m_46.z;
    float _750 = fma(_738, _624, _624);
    float _752 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _754 = _190 + (-0.5);
    float _756 = _494 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _758 = fma(_720, _712, _742);
    float _760 = fma(_752, _738, _752);
    float _762 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[196].z, _750);
    float _764 = in.m_61.y;
    float _766 = _758 * 0.15915493667125701904296875;
    float _768 = _730 * 6.283185482025146484375;
    float _770 = sin(_768);
    float _772 = fma(_760, _712, _762);
    float _774 = _494 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _776 = _494 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _778 = in.m_63.y;
    float _780 = fma(_524, _726, _756);
    float _782 = fma(_524, _724, _774);
    float _784 = fma(_524, _728, _776);
    float _786 = _730 * 6.283185482025146484375;
    float _788 = cos(_786);
    float _790 = _772 * 0.15915493667125701904296875;
    float _792 = fma(_780, _736, _746);
    float _794 = fma(_784, _736, _748);
    float _796 = _766 * 6.283185482025146484375;
    float _798 = sin(_796);
    float _800 = fma(_782, _736, _744);
    float _802 = _792 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _804 = _792 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _806 = _792 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _808 = _764 * 0.00999999977648258209228515625;
    float _810 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[4].x, _802);
    float _812 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[5].x, _804);
    float _814 = _766 * 6.283185482025146484375;
    float _816 = cos(_814);
    float _818 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[6].x, _806);
    float _820 = in.m_63.x;
    float _822 = fma(_312, _808, _778);
    float _824 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[4].z, _810);
    float _826 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[6].z, _818);
    float _828 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[5].z, _812);
    float _830 = in.m_63.z;
    float _832 = _790 * 6.283185482025146484375;
    float _834 = sin(_832);
    float _836 = _770 * _798;
    float _838 = _788 * _798;
    float _840 = in.m_59.x;
    float _842 = in.m_59.y;
    float _844 = in.m_59.z;
    float _846 = _826 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _848 = _824 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _850 = _828 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _852 = _790 * 6.283185482025146484375;
    float _854 = cos(_852);
    float _856 = _788 * _816;
    float _858 = _770 * _816;
    float _860 = fma(_834, _856, _836);
    float _862 = fma(_834, _836, _856);
    float _864 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _822);
    float _866 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _820);
    float _868 = -_838;
    float _870 = fma(_834, _858, _868);
    float _872 = -_858;
    float _874 = fma(_834, _838, _872);
    float _876 = _788 * _854;
    float _878 = _770 * _854;
    float _880 = _816 * _854;
    float _882 = _842 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _884 = _840 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _886 = _844 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _888 = _798 * _854;
    float _890 = _882 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _892 = _884 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _894 = _886 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _896 = _864 * _890;
    float _898 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _830);
    float _900 = _866 * _892;
    float _902 = _876 * _896;
    float _904 = _898 * _894;
    float _906 = -_896;
    float _908 = _834 * _906;
    float _910 = _878 * _896;
    float _912 = fma(_860, _900, _902);
    float _914 = fma(_880, _900, _908);
    float _916 = fma(_870, _900, _910);
    float _918 = fma(_874, _904, _912);
    float _920 = fma(_888, _904, _914);
    float _922 = fma(_862, _904, _916);
    float _924 = _918 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _926 = _918 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _928 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[10].x, _924);
    float _930 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[8].x, _926);
    float _932 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[10].z, _928);
    float _934 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[8].z, _930);
    float _936 = _846 + _932;
    float _938 = _848 + _934;
    float _940 = _918 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _942 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _944 = _936 + _942;
    float _946 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _948 = _938 + _946;
    float _950 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[9].x, _940);
    float _952 = _944 * _944;
    float _954 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[9].z, _950);
    float _956 = fma(_948, _948, _952);
    float _958 = _850 + _954;
    float _960 = sqrt(_956);
    bool _962 = _960 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _964 = _918;
    float _966 = _922;
    float _968 = _788;
    if (!_962)
    {
        _964 = _938;
    }
    float _970 = _964;
    float _972 = _970;
    if (!_962)
    {
        _966 = _936;
    }
    float _974 = _966;
    float _976 = _974;
    if (!_962)
    {
        _968 = _958;
    }
    float _978 = _968;
    bool _980 = !_962;
    float _982 = _978;
    if (!_980)
    {
        float _984 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _986 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _988 = _960 + _986;
        float _990 = rsqrt(_956);
        float _992 = _988 * _984;
        float _994 = _958 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _996 = _992 * 0.15915493667125701904296875;
        float _998 = _996 * 6.283185482025146484375;
        float _1000 = cos(_998);
        float _1002 = _996 * 6.283185482025146484375;
        float _1004 = sin(_1002);
        float _1006 = _1000 + (-1.0);
        float _1008 = fma(_1004, _994, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1010 = _1006 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1012 = _990 * _1008;
        float _1014 = fma(_958, _1000, _1010);
        float _1016 = fma(_948, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1018 = fma(_944, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _982 = _1014;
        _972 = _1016;
        _976 = _1018;
    }
    float _1020 = _982;
    float _1022 = _972;
    float _1024 = _976;
    float _1026 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1028 = _1020 + _1026;
    float _1030 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1032 = _1022 + _1030;
    float _1034 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1036 = _1024 + _1034;
    float _1038 = _1028 * _1028;
    float _1040 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1042 = _1020 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1044 = fma(_1032, _1032, _1038);
    float _1046 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1048 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1042);
    float _1050 = fma(_1036, _1036, _1044);
    float _1052 = precise::max(0.0, _1046);
    float _1054 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1048);
    float _1056 = rsqrt(_1050);
    float _1058 = sqrt(_1050);
    float _1060 = _1056 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1062 = _1032 * _1060;
    float _1064 = _1036 * _1060;
    float _1066 = -_1060;
    float _1068 = -_1052;
    float _1070 = fma(_1028, _1066, _1068);
    float _1072 = _1062 * _1062;
    float _1074 = _1064 * _1064;
    float _1076 = _1072 + _1074;
    float _1078 = sqrt(_1076);
    bool _1080 = _1078 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1082 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1084 = _1078 + _1082;
    float _1086 = _958;
    float _1088 = _1052;
    float _1090 = _1076;
    float _1092 = _1084;
    float _1094 = _1060;
    float _1096 = _1062;
    float _1098 = _1064;
    float _1100 = _1072;
    float _1102 = _1074;
    float _1104 = _1070;
    if (_1080)
    {
        float _1106 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1086 = _1106;
    }
    float _1108 = _1086;
    if (_1080)
    {
        float _1110 = _1070 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1088 = _1110;
    }
    float _1112 = _1088;
    float _1114 = _1112;
    if (_1080)
    {
        float _1116 = rsqrt(_1076);
        _1090 = _1116;
    }
    float _1118 = _1090;
    if (_1080)
    {
        float _1120 = _1084 * _1108;
        _1092 = _1120;
    }
    float _1122 = _1092;
    float _1124 = 0.0;
    if (_1080)
    {
        float _1126 = _1122 * 0.15915493667125701904296875;
        _1124 = _1126;
    }
    float _1128 = _1124;
    float _1130 = _1108;
    if (_1080)
    {
        float _1132 = _1128 * 6.283185482025146484375;
        float _1134 = sin(_1132);
        _1130 = _1134;
    }
    float _1136 = _1130;
    float _1138 = _1122;
    if (_1080)
    {
        float _1140 = _1128 * 6.283185482025146484375;
        float _1142 = cos(_1140);
        _1138 = _1142;
    }
    float _1144 = _1138;
    float _1146 = _1136;
    if (_1080)
    {
        float _1148 = fma(_1136, _1112, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1146 = _1148;
    }
    float _1150 = _1146;
    float _1152 = _1150;
    if (_1080)
    {
        float _1154 = _1118 * _1150;
        _1094 = _1154;
    }
    float _1156 = _1094;
    if (_1080)
    {
        float _1158 = _1144 + (-1.0);
        _1114 = _1158;
    }
    float _1160 = _1114;
    if (_1080)
    {
        float _1162 = _1062 * _1156;
        _1096 = _1162;
    }
    float _1164 = _1096;
    if (_1080)
    {
        float _1166 = _1064 * _1156;
        _1098 = _1166;
    }
    float _1168 = _1098;
    if (_1080)
    {
        float _1170 = _1160 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1152 = _1170;
    }
    float _1172 = _1152;
    if (_1080)
    {
        float _1174 = _1164 * _1164;
        _1100 = _1174;
    }
    float _1176 = _1100;
    if (_1080)
    {
        float _1178 = _1168 * _1168;
        _1102 = _1178;
    }
    float _1180 = _1102;
    if (_1080)
    {
        float _1182 = fma(_1070, _1144, _1172);
        _1104 = _1182;
    }
    float _1184 = _1104;
    float _1186 = fma(_1184, _1184, _1176);
    float _1188 = _1020 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1190 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1192 = fma(_1058, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1190);
    float _1194 = precise::clamp(_1192, 0.0, 1.0);
    float _1196 = _1186 + _1180;
    float _1198 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1188);
    float _1200 = -_1194;
    float _1202 = _1200 + 1.0;
    float _1204 = _1020 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1206 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1198);
    float _1208 = rsqrt(_1196);
    float _1210 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1204);
    float _1212 = _1020 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1214 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1216 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1210);
    float _1218 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1212);
    float _1220 = _1214 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1222 = abs(_1202);
    float _1224 = log2(_1222);
    float _1226 = _1216 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1228 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1218);
    float _1230 = -_1220;
    float _1232 = fma(_1230, _1040, 1.0);
    float _1234 = _1054 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1236 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1238 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1240 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1242 = _1208 * _1164;
    float _1244 = _1208 * _1184;
    float _1246 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1236);
    float _1248 = _1208 * _1168;
    float _1250 = _1242 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1252 = log2(_1232);
    float _1254 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1246);
    float _1256 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1240);
    float _1258 = _1224 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1260 = -_1250;
    float _1262 = fma(_1244, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1260);
    float _1264 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1254);
    float _1266 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1256);
    float _1268 = -_1248;
    float _1270 = fma(_1268, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1262);
    float _1272 = exp2(_1258);
    float _1274 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1276 = fma(_1270, -0.5, 0.5);
    float _1278 = fma(_1270, 0.5, 0.5);
    float _1280 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1274);
    float _1282 = _1244 + 1.0;
    float _1284 = _1252 * 0.693147182464599609375;
    float _1286 = 1.0 / _1264;
    float _1288 = fma(_1278, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1290 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1280);
    float _1292 = _1284 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1294 = fma(_1278, _1288, -0.212114393711090087890625);
    float _1296 = sqrt(_1276);
    float _1298 = -_1244;
    float _1300 = fma(_1272, _1282, _1298);
    float _1302 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1290);
    float _1304 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1266);
    float _1306 = fma(_1278, _1294, 1.570728778839111328125);
    float _1308 = fma(_1300, 0.5, 0.5);
    float _1310 = _1302 * _1286;
    float _1312 = _1304 * _1286;
    float _1314 = fma(_1312, -0.5, 0.5);
    float _1316 = _1296 * 0.636619746685028076171875;
    float _1318 = fma(_1310, 0.5, 0.5);
    float _1320 = -_1306;
    float _1322 = fma(_1316, _1320, 1.0);
    float3 _4055 = float3(_1318, _1314, _1292);
    float _1324 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4055, float3(0.0), isnan(_4055)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4055, float3(0.0), isnan(_4055)), level(0.0)).x;
    float3 _4066 = float3(_1318, _1314, _1292);
    float4 _1327 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4066, float3(0.0), isnan(_4066)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4066, float3(0.0), isnan(_4066)), level(0.0)).xyzw;
    float _1329 = _1327.x;
    float _1331 = _1327.y;
    float _1333 = _1327.z;
    float _1335 = _1327.w;
    float2 _4082 = float2(_1322, _1308);
    float3 _1339 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4082, float2(0.0), isnan(_4082)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4082, float2(0.0), isnan(_4082)), level(0.0)).xyz;
    float _1341 = _1339.x;
    float _1343 = _1339.y;
    float _1345 = _1339.z;
    float _1347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1351 = _1349 != 0;
    out.m_65.x = _1022;
    out.m_65.y = _1020;
    out.m_65.z = _1024;
    int _1353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1355 = _1353 != 0;
    int _1357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1359 = _1357 != 0;
    bool _1361 = _192 > 0.5;
    float _1363 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1365 = as_type<int>(_1318);
    if (_200)
    {
        bool _1367 = _202 > 0.5;
        _550 = _1367;
    }
    bool _1369 = _550;
    float _1371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_200)
    {
        float _1373 = -_184;
        float _1375 = _1373 + 1.0;
        _1365 = as_type<int>(_1375);
    }
    int _1377 = _1365;
    int _1379 = _1361 ? as_type<int>(_212) : as_type<int>(_174);
    float _1381 = _1347 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1383 = as_type<int>(_1347);
    if (_1351)
    {
        float _1385 = -_184;
        float _1387 = _1385 + 1.0;
        _1383 = as_type<int>(_1387);
    }
    int _1389 = _1383;
    float _1391 = _1359 ? as_type<float>(_1379) : _174;
    float _1393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    if (_200)
    {
        float _1395 = _1369 ? as_type<float>(_1377) : _184;
        _370 = _1395;
    }
    float _1397 = _370;
    float _1399 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1355)
    {
        float _1401 = _238 ? _212 : _174;
        _222 = _1401;
    }
    float _1403 = _222;
    float _1405 = fma(_1381, _1391, -0.5);
    if (_1351)
    {
        float _1407 = _1361 ? as_type<float>(_1389) : _184;
        _224 = _1407;
    }
    float _1409 = _224;
    float _1411 = fma(_1399, _1397, -0.5);
    float _1413 = in.m_61.x;
    float _1415 = _1371 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1417 = fma(_698, _1411, _546);
    float _1419 = -_554;
    float _1421 = fma(_700, _1405, _1419);
    float _1423 = fma(_1415, _1409, -0.5);
    float _1425 = in.m_61.z;
    bool _1427 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1429 = isnan(0.5);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1435 = _1431 || _1433;
    float _1437 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1439 = fma(_702, _1423, _632);
    bool _1441 = _822 != 0.0;
    bool _1443 = isnan(_822);
    bool _1445 = _1441 || _1443;
    bool _1447 = isnan(0.0);
    bool _1449 = _1445 || _1447;
    float _1451 = in.m_61.w;
    float _1453 = fma(_1437, _1403, -0.5);
    float _1455 = _850 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1457 = _820 == 0.0;
    bool _1459 = !_1449;
    bool _1461 = _1457 && _1459;
    float _1463 = -_638;
    float _1465 = fma(_704, _1453, _1463);
    float _1467 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1455);
    float _1469 = _1421 + 0.5;
    float _1471 = in.m_67.x;
    float _1473 = in.m_67.y;
    float _1475 = in.m_67.z;
    float _1477 = in.m_67.w;
    float _1479 = _1417 + 0.5;
    float _1481 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1467);
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1485 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1487 = _850 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1489 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_69.x = _1413;
    out.m_69.y = _764;
    float _1491 = _1439 + 0.5;
    float _1493 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1487);
    float _1495 = _1421;
    float _1497 = _1439;
    float _1499 = _1491;
    if (!_1435)
    {
        _1495 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1501 = _1495;
    float _1503 = 1.0 / _1489;
    out.m_71.w = _1483;
    float _1505 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1493);
    bool _1507 = _830 == 0.0;
    bool _1509 = _1507 && _1461;
    out.m_69.z = _1425;
    float _1511 = _1505 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1513 = _1465 + 0.5;
    float _1515 = _1511 + _1489;
    float _1517 = in.m_73.x;
    float _1519 = in.m_73.y;
    float _1521 = in.m_73.z;
    float _1523 = _876 * _1473;
    float _1525 = -_1473;
    float _1527 = _834 * _1525;
    out.m_75.x = _1479;
    out.m_75.y = _1469;
    out.m_75.z = _308;
    out.m_75.w = _310;
    float _1529 = _1515 * _1503;
    float _1531 = _1529 * 0.5;
    float _1533 = fma(_860, _1471, _1523);
    float _1535 = fma(_880, _1471, _1527);
    out.m_77.x = _1491;
    out.m_77.y = _1513;
    float _1537 = fma(_874, _1475, _1533);
    float _1539 = fma(_888, _1475, _1535);
    out.m_79.w = _1485;
    out.m_69.w = _1451;
    float _1541 = _878 * _1473;
    float _1543 = _1537 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1545 = _1539;
    if (!_1435)
    {
        float _1547 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1549 = fma(_1531, _1501, _1547);
        _372 = _1549;
    }
    float _1551 = _372;
    float _1553 = _1537 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1555 = fma(_870, _1471, _1541);
    float _1557 = _1537 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1559 = fma(_1539, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1543);
    float _1561 = fma(_1539, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1553);
    float _1563 = fma(_862, _1475, _1555);
    float _1565 = fma(_1539, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1557);
    float _1567 = _1551;
    float _1569 = _1565;
    float _1571 = _1561;
    float _1573 = _1517;
    if (_1509)
    {
        _1545 = _1517;
    }
    float _1575 = _1545;
    float _1577 = _1575;
    if (!_1435)
    {
        float _1579 = 1.0 / _1551;
        _1567 = _1579;
    }
    float _1581 = _1567;
    float _1583 = fma(_1563, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1559);
    float _1585 = fma(_1563, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1561);
    float _1587 = fma(_1563, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1565);
    if (_1509)
    {
        _1569 = _1519;
    }
    float _1589 = _1569;
    float _1591 = _1589;
    if (_1509)
    {
        _1497 = _1521;
    }
    float _1593 = _1497;
    float _1595 = _1593;
    if (_1509)
    {
        _1499 = _1575;
    }
    float _1597 = _1499;
    out.m_81.x = _1583;
    out.m_81.y = _1585;
    out.m_81.z = _1587;
    float _1599 = _1597;
    if (!_1509)
    {
        _1577 = _1517;
    }
    float _1601 = _1577;
    if (_1509)
    {
        _1571 = _1589;
    }
    float _1603 = _1571;
    float _1605 = _1603;
    if (_1509)
    {
        _1573 = _1593;
    }
    float _1607 = _1573;
    float _1609 = _1607;
    if (!_1509)
    {
        float _1611 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1601);
        _1599 = _1611;
    }
    float _1613 = _1599;
    if (!_1509)
    {
        _1591 = _1519;
    }
    float _1615 = _1591;
    float _1617 = _1475 * _1601;
    if (!_1509)
    {
        _1595 = _1521;
    }
    float _1619 = _1595;
    float _1621 = _1471 * _1615;
    if (!_1509)
    {
        float _1623 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1615);
        _1605 = _1623;
    }
    float _1625 = _1605;
    float _1627 = _1473 * _1619;
    float _1629 = -_1617;
    float _1631 = fma(_1471, _1619, _1629);
    float _1633 = -_1621;
    float _1635 = fma(_1473, _1601, _1633);
    if (!_1509)
    {
        float _1637 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1619);
        _1609 = _1637;
    }
    float _1639 = _1609;
    float _1641 = -_1627;
    float _1643 = fma(_1475, _1615, _1641);
    float _1645 = _1631 * _1477;
    float _1647 = _1635 * _1477;
    float _1649 = _876 * _1625;
    float _1651 = _1643 * _1477;
    float _1653 = _876 * _1645;
    float _1655 = -_1645;
    float _1657 = _834 * _1655;
    float _1659 = fma(_860, _1613, _1649);
    float _1661 = _878 * _1645;
    float _1663 = fma(_860, _1651, _1653);
    float _1665 = _1224 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1667 = -_1625;
    float _1669 = _834 * _1667;
    float _1671 = _878 * _1625;
    float _1673 = fma(_880, _1651, _1657);
    float _1675 = fma(_870, _1651, _1661);
    float _1677 = exp2(_1665);
    float _1679 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1681 = fma(_880, _1613, _1669);
    float _1683 = fma(_874, _1647, _1663);
    float _1685 = fma(_888, _1647, _1673);
    float _1687 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1679);
    float _1689 = fma(_888, _1639, _1681);
    float _1691 = _1683 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1693 = _1683 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1695 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1687);
    float _1697 = _1683 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1699 = fma(_862, _1647, _1675);
    float _1701 = fma(_1685, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1691);
    float _1703 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1695);
    float _1705 = fma(_870, _1613, _1671);
    float _1707 = fma(_1685, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1693);
    float _1709 = -_1677;
    float _1711 = _1709 + 1.0;
    float _1713 = fma(_1685, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1697);
    float _1715 = _1703 + _1264;
    float _1717 = fma(_874, _1639, _1659);
    float _1719 = fma(_1699, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1701);
    float _1721 = fma(_862, _1639, _1705);
    float _1723 = fma(_1699, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1707);
    float _1725 = _1711 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1727 = fma(_1699, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1713);
    float _1729 = _1715 * 0.5;
    float _1731 = _1715;
    float _1733 = _1719;
    float _1735 = _1727;
    if (!_1435)
    {
        _1731 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1737 = _1731;
    float _1739 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1741 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1743 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_83.x = _1719;
    out.m_83.y = _1723;
    out.m_83.z = _1727;
    float _1745 = fma(_1689, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1739);
    float _1747 = fma(_1689, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1741);
    float _1749 = fma(_1689, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1743);
    float _1751 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1745);
    float _1753 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1747);
    float _1755 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1749);
    out.gl_Position.x = _1302;
    out.gl_Position.y = _1304;
    out.gl_Position.z = _1703;
    out.gl_Position.w = _1264;
    bool _1757 = _1058 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1759 = isnan(_1058);
    bool _1761 = _1757 || _1759;
    bool _1763 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1765 = _1761 || _1763;
    float _1767 = _1749;
    if (!_1435)
    {
        float _1769 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1771 = -_1737;
        float _1773 = fma(_1581, _1769, _1771);
        _1767 = _1773;
    }
    float _1775 = _1767;
    float _1777 = _1775;
    if (!_1435)
    {
        float _1779 = -_1737;
        float _1781 = _1779 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1733 = _1781;
    }
    float _1783 = _1733;
    out.m_85.z = _1729;
    out.m_85.w = _1264;
    out.m_87.x = _1751;
    out.m_87.y = _1753;
    out.m_87.z = _1755;
    float _1785 = _1783;
    if (!_1435)
    {
        float _1787 = 1.0 / _1783;
        _1785 = _1787;
    }
    float _1789 = _1785;
    if (!_1765)
    {
        _1735 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1791 = _1735;
    float _1793 = _1789;
    float _1795 = _1791;
    float _1797 = _1791;
    if (!_1435)
    {
        float _1799 = _1775 * _1789;
        float _1801 = precise::clamp(_1799, 0.0, 1.0);
        _1793 = _1801;
    }
    float _1803 = _1793;
    float _1805 = _1803;
    if (_1435)
    {
        _1777 = 1.0;
    }
    float _1807 = _1777;
    float _1809 = _1807;
    if (!_1435)
    {
        float _1811 = -_1803;
        float _1813 = _1811 + 1.0;
        _1809 = _1813;
    }
    float _1815 = _1809;
    if (!_1765)
    {
        _1805 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1817 = _1805;
    float _1819 = _1725 * _1324;
    float _1821 = -_1725;
    float _1823 = _1821 + 1.0;
    float _1825 = _1815 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1827 = _1335 * _1819;
    float _1829 = _1345 * _1819;
    float _1831 = _1335 * _1823;
    float _1833 = fma(_1341, _1827, _1329);
    float _1835 = fma(_1343, _1827, _1331);
    float _1837 = fma(_1335, _1829, _1333);
    float _1839 = _1827;
    float _1841 = _1817;
    float _1843 = _1817;
    if (!_1765)
    {
        _1839 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1845 = _1839;
    out.m_89.x = _1833;
    out.m_89.y = _1835;
    out.m_89.z = _1837;
    out.m_89.w = _1831;
    bool _1847 = !_1765;
    float _1849 = _1845;
    float _1851 = _1845;
    if (!_1847)
    {
        bool _1853 = _1058 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1855 = isnan(_1058);
        bool _1857 = _1853 || _1855;
        bool _1859 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1861 = _1857 || _1859;
        if (!_1861)
        {
            float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1865 = _1058 + _1863;
            float _1867 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1869 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1867;
            float _1871 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1873 = _1871 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1875 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1877 = _1875 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1879 = 1.0 / _1869;
            float _1881 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1883 = _1881 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1885 = _1865 * _1879;
            float _1887 = precise::clamp(_1885, 0.0, 1.0);
            float _1889 = fma(_1887, _1873, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1891 = fma(_1887, _1877, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1893 = fma(_1887, _1883, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _1851 = _1891;
            _1797 = _1889;
            _1843 = _1893;
            _1895 = true;
        }
        else
        {
            bool _1897 = _1058 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1899 = isnan(_1058);
            bool _1901 = _1897 || _1899;
            bool _1903 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1905 = _1901 || _1903;
            if (!_1905)
            {
                _1795 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1907 = _1795;
            _1797 = _1907;
            if (!_1905)
            {
                _1849 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1909 = _1849;
            _1851 = _1909;
            if (!_1905)
            {
                _1841 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1911 = _1841;
            bool _1913 = !_1905;
            _1843 = _1911;
            if (!_1913)
            {
                bool _1915 = _1058 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1917 = isnan(_1058);
                bool _1919 = _1915 || _1917;
                bool _1921 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1923 = _1919 || _1921;
                if (!_1923)
                {
                    float _1925 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1927 = _1058 + _1925;
                    float _1929 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1931 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1929;
                    float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1935 = _1933 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1937 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1939 = _1937 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1941 = 1.0 / _1931;
                    float _1943 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1945 = _1943 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1947 = _1927 * _1941;
                    float _1949 = precise::clamp(_1947, 0.0, 1.0);
                    float _1951 = fma(_1949, _1935, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1953 = fma(_1949, _1939, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1955 = fma(_1949, _1945, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _1851 = _1953;
                    _1797 = _1951;
                    _1843 = _1955;
                    _1895 = true;
                }
                else
                {
                    _1851 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1797 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1843 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1895 = false;
    float _1957 = _1851;
    float _1959 = _1797;
    float _1961 = _1843;
    float _1963 = _1825 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_91.x = 0.0;
    float _1965 = _1957 * 0.586610972881317138671875;
    bool _1967 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_49.x = _1963;
    float _1969 = fma(_1959, 0.298911988735198974609375, _1965);
    bool _1971 = _1815 > 0.0;
    bool _1973 = isnan(_1815);
    bool _1975 = _1971 || _1973;
    bool _1977 = isnan(0.0);
    bool _1979 = _1975 || _1977;
    float _1981 = fma(_1961, 0.114477999508380889892578125, _1969);
    float _1983 = -_1981;
    float _1985 = _1983 + _1959;
    float _1987 = -_1981;
    float _1989 = _1987 + _1957;
    float _1991 = -_1981;
    float _1993 = _1991 + _1961;
    float _1995 = fma(_1985, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1981);
    float _1997 = fma(_1989, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1981);
    float _1999 = fma(_1993, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1981);
    bool _2001 = !_1967;
    if (!_2001)
    {
        float _2003 = -_1020;
        float _2005 = _2003 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2007 = -_1022;
        float _2009 = _2007 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2011 = -_1024;
        float _2013 = _2011 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2015 = _2005 * _2005;
        float _2017 = fma(_2009, _2009, _2015);
        float _2019 = fma(_2013, _2013, _2017);
        float _2021 = sqrt(_2019);
        float _2023 = rsqrt(_2019);
        float _2025 = -_2021;
        float _2027 = _2025 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2029 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2031 = precise::clamp(_2029, 0.0, 1.0);
        float _2033 = _2009 * _2023;
        float _2035 = _2005 * _2023;
        float _2037 = abs(_2031);
        float _2039 = log2(_2037);
        float _2041 = _2013 * _2023;
        float _2043 = _2033 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2045 = _1753 * _2035;
        float _2047 = -_2035;
        float _2049 = -_2043;
        float _2051 = fma(_2047, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2049);
        float _2053 = fma(_1751, _2033, _2045);
        float _2055 = -_2041;
        float _2057 = fma(_2055, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2051);
        float _2059 = fma(_1755, _2041, _2053);
        float _2061 = precise::clamp(_2059, 0.0, 1.0);
        float _2063 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2065 = _2057 + _2063;
        float _2067 = _2039 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2069 = _2065 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2071 = precise::clamp(_2069, 0.0, 1.0);
        float _2073 = exp2(_2067);
        float _2075 = _2073 * _2071;
        float _2077 = _2061 * _2075;
        float _2079 = _2077 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2081 = _2077 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2083 = _2077 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _2079;
        out.m_91.y = _2081;
        out.m_91.z = _2083;
    }
    out.m_93.x = _1995;
    out.m_93.y = _1997;
    out.m_93.z = _1999;
    if (_1979)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2085 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2085;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

