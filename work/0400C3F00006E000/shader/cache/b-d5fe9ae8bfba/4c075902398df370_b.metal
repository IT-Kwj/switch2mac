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
    texture2d<float> vp_t_tcb_1C [[id(8)]];
    sampler vp_t_tcb_1CSmplr [[id(9)]];
    sampler vp_t_tcb_32Smplr_w [[id(10)]];
    sampler vp_t_tcb_1CSmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_67 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
    float4 m_77 [[user(locn11)]];
    float4 m_87 [[user(locn12)]];
    float4 m_85 [[user(locn13)]];
    float4 m_83 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1898 = false;
    bool _306 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_42.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_108);
    float _118 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _114;
    if (!_112)
    {
        out.m_45.x = 0.0;
    }
    int _122 = 0;
    if (!_112)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2181 = as_type<float>(_126);
        out.gl_Position.z = _2181;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_47.w;
    float _130 = float(_108);
    float _132 = 1.0 / _130;
    float _134 = -_128;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_128);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = _136 * _132;
    bool _150 = _136 >= _130;
    bool _152 = !_146;
    bool _154 = _150 || _152;
    out.m_49.x = _148;
    float _156 = _136;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _116;
    if (_154)
    {
        out.m_45.x = 0.0;
    }
    int _160 = 0;
    if (_154)
    {
        float _162 = _158 * 5.0;
        _160 = as_type<int>(_162);
    }
    int _164 = _160;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2252 = as_type<float>(_164);
        out.gl_Position.z = _2252;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _166 = in.m_51.w;
    float _168 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _170 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _172 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _174 = _170 || _172;
    bool _176 = isnan(1.0);
    bool _178 = _174 || _176;
    float _180 = in.m_47.x;
    float _182 = in.m_47.y;
    float _184 = in.m_47.z;
    float _186 = in.m_42.x;
    float _188 = in.m_42.y;
    float _190 = in.m_42.z;
    float _192 = _168;
    if (!_178)
    {
        float _194 = _168 * _168;
        float _196 = _194 * 0.5;
        _118 = _196;
    }
    float _198 = _118;
    float _200 = _198;
    if (!_178)
    {
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _202;
    }
    float _204 = _200;
    bool _206 = !_178;
    float _208 = _204;
    if (!_206)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = _168 * _212;
        float _222 = 1.0 / _216;
        float _224 = _218 * 0.693147182464599609375;
        float _226 = exp2(_220);
        float _228 = 1.0 / _224;
        float _230 = _226 + (-1.0);
        float _232 = -_230;
        float _234 = fma(_232, _228, _168);
        float _236 = _234 * _222;
        float _238 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _238;
    }
    float _240 = _208;
    bool _242 = !_178;
    if (!_242)
    {
        float _244 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _246 = log2(_244);
        float _248 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _250 = _248 + 1.0;
        float _252 = 1.0 / _250;
        float _254 = _168 * _246;
        float _256 = exp2(_254);
        float _258 = -_256;
        float _260 = _258 + 1.0;
        float _262 = _260 * _252;
        _192 = _262;
    }
    float _264 = _192;
    bool _266 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _268 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _270 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _272 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _274 = fma(_264, _180, _268);
    float _276 = fma(_264, _182, _270);
    float _278 = fma(_264, _184, _272);
    float _280 = fma(_274, _166, _186);
    float _282 = fma(_276, _166, _188);
    float _284 = fma(_278, _166, _190);
    bool _286 = !_266;
    float _304;
    if (!_286)
    {
        float _288 = in.m_53.x;
        float _290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _292 = _288 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _296 = _294 * _290;
        float _298 = floor(_296);
        float _300 = -_298;
        float _302 = _296 + _300;
        _304 = _302;
        _306 = true;
    }
    else
    {
        _304 = _148;
    }
    _306 = false;
    float _308 = _304;
    float _310 = in.m_53.z;
    float _312 = in.m_53.w;
    float _314 = _282 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _316 = _282 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _318 = in.m_53.x;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _328 = in.m_53.y;
    float _330 = 1.0 / _322;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _332;
    float _336 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[4].x, _314);
    int _338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _340 = _338 != 0;
    int _342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _344 = _342 != 0;
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _348 = _346 != 0;
    float _350 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].z, _336);
    float _352 = 1.0 / _326;
    float _354 = _282 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _356 = _350 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _358 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[5].x, _354);
    float _360 = _310 * 2.0;
    float _362 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[6].x, _316);
    float _364 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _366 = log2(_364);
    float _368 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].z, _358);
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _372 = _308 + _370;
    float _374 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].z, _362);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _378 = _308 + _376;
    float _380 = _368 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _382 = _372 * _330;
    float _384 = _328 * 2.0;
    float _386 = floor(_360);
    float _388 = _378 * _352;
    float _390 = _328 + _310;
    float _392 = _318 + _328;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _394;
    float _398 = _390 + (-1.0);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _404 = 1.0 / _334;
    float _406 = _366 * _136;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _410 = _308 + _408;
    float _412 = _392 + (-1.0);
    float _414 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _416 = _380 + _414;
    float _418 = fma(_402, _388, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = _374 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _422 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _424 = _386 > 0.0;
    float _426 = _318 * 2.0;
    bool _428 = _386 >= 0.0;
    bool _430 = isnan(_386);
    bool _432 = _428 || _430;
    bool _434 = isnan(0.0);
    bool _436 = _432 || _434;
    float _438 = exp2(_406);
    float _440 = fma(_396, _382, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _442 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _444 = _420 + _442;
    int _446 = _436 ? 0 : 1;
    float _448 = _410 * _404;
    bool _450 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _452 = isnan(_308);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = floor(_426);
    int _464 = ~_446;
    int _466 = _464 + 1;
    int _468 = _466 + 1;
    int _470 = _468;
    float _472 = _380;
    int _474 = as_type<int>(_318);
    if (!_424)
    {
        int _476 = ~_446;
        int _478 = _476 + 1;
        _470 = _478;
    }
    int _480 = _470;
    float _482 = floor(_384);
    float _484 = _318 + _310;
    float _486 = -_438;
    float _488 = _486 + 1.0;
    float _490 = _484 + (-1.0);
    bool _492 = _462 >= 0.0;
    bool _494 = isnan(_462);
    bool _496 = _492 || _494;
    bool _498 = isnan(0.0);
    bool _500 = _496 || _498;
    float _502 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _506 = 1.0 + _504;
    bool _508 = _462 > 0.0;
    float _510 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _512 = _500 ? 0 : 1;
    bool _514 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _516 = isnan(0.0);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _522 = _518 || _520;
    float _524 = 1.0 / _506;
    bool _526 = _482 > 0.0;
    float _528 = _522 ? _488 : 0.0;
    bool _530 = _482 >= 0.0;
    bool _532 = isnan(_482);
    bool _534 = _530 || _532;
    bool _536 = isnan(0.0);
    bool _538 = _534 || _536;
    bool _540 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _542 = isnan(1.0);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _548 = _544 || _546;
    int _550 = ~_512;
    int _552 = _550 + 1;
    int _554 = _552 + 1;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _556;
    int _560 = _554;
    bool _562 = _526;
    if (!_508)
    {
        int _564 = ~_512;
        int _566 = _564 + 1;
        _560 = _566;
    }
    int _568 = _560;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _578 = !_340;
    int _580 = _578 ? 0 : 1;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _582;
    float _586 = fma(_572, _388, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _588 = fma(_576, _388, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _590 = abs(_580);
    float _592 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _594 = _356 + _592;
    float _596 = _416 * _416;
    if (_548)
    {
        float _598 = _528 * _524;
        _156 = _598;
    }
    float _600 = _156;
    float _602 = fma(_558, _382, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _604 = in.m_55.x;
    float _606 = in.m_55.y;
    float _608 = in.m_55.z;
    float _610 = fma(_584, _382, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _612 = !_344;
    int _614 = _612 ? 0 : 1;
    float _616 = fma(_594, _594, _596);
    int _618 = _538 ? 0 : 1;
    int _620 = abs(_614);
    float _622 = fma(_444, _444, _616);
    float _624 = float(_568);
    float _626 = float(_620);
    float _628 = rsqrt(_622);
    int _630 = ~_618;
    int _632 = _630 + 1;
    int _634 = _632 + 1;
    float _636 = float(_590);
    float _638 = float(_480);
    int _640 = _634;
    if (!_526)
    {
        int _642 = ~_618;
        int _644 = _642 + 1;
        _640 = _644;
    }
    int _646 = _640;
    float _648 = _626 * _624;
    bool _650 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _652 = isnan(_308);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = -_460;
    float _664 = _662 + 1.0;
    bool _666 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _668 = isnan(_308);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = _648 * (-2.0);
    float _680 = _636 * _638;
    float _682 = _660 * _664;
    float _684 = -_660;
    float _686 = _684 + 1.0;
    bool _688 = !_348;
    int _690 = _688 ? 0 : 1;
    float _692 = fma(_502, _678, _502);
    float _694 = fma(_678, _606, _606);
    float _696 = _594 * _628;
    int _698 = abs(_690);
    float _700 = _416 * _628;
    float _702 = _676 * _686;
    bool _704 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _706 = isnan(_308);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = -_676;
    float _718 = _716 + 1.0;
    float _720 = -_700;
    float _722 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[18].w, _416);
    float _724 = -_696;
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _594);
    float _728 = _444 * _628;
    float _730 = _722 * _722;
    float _732 = float(_646);
    float _734 = -_728;
    float _736 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[18].w, _444);
    float _738 = _328 + (-0.5);
    float _740 = fma(_726, _726, _730);
    float _742 = float(_698);
    float _744 = _714 * _718;
    float _746 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[196].y, _694);
    float _748 = fma(_736, _736, _740);
    float _750 = _680 * (-2.0);
    float _752 = _742 * _732;
    float _754 = fma(_692, _600, _746);
    float _756 = _602 * _744;
    float _758 = fma(_422, _750, _422);
    float _760 = _752 * (-2.0);
    float _762 = fma(_750, _604, _604);
    float _764 = _318 + (-0.5);
    float _766 = _440 * _744;
    float _768 = fma(_760, _608, _608);
    float _770 = _310 + (-0.5);
    float _772 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[196].x, _762);
    float _774 = -_714;
    float _776 = _774 + 1.0;
    float _778 = _610 * _744;
    float _780 = fma(_510, _760, _510);
    float _782 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[196].z, _768);
    float _784 = fma(_758, _600, _772);
    float _786 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[143].x, _756);
    float _788 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[143].y, _766);
    float _790 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[143].z, _778);
    float _792 = sqrt(_748);
    float _794 = fma(_780, _600, _782);
    float _796 = fma(_418, _702, _788);
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _798;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _802;
    float _806 = fma(_588, _702, _790);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _808;
    float _812 = _784 * 0.15915493667125701904296875;
    float _814 = fma(_800, _448, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _816 = in.m_51.x;
    float _818 = in.m_51.y;
    float _820 = in.m_51.z;
    float _822 = fma(_804, _448, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _824 = fma(_810, _448, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _826 = fma(_586, _702, _786);
    float _828 = _754 * 0.15915493667125701904296875;
    float _830 = in.m_57.x;
    float _832 = in.m_57.y;
    float _834 = in.m_57.z;
    float _836 = _794 * 0.15915493667125701904296875;
    float _838 = fma(_822, _682, _796);
    float _840 = fma(_824, _682, _806);
    float _842 = fma(_814, _682, _826);
    float _844 = _812 * 6.283185482025146484375;
    float _846 = cos(_844);
    float _848 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[146].y, _838);
    float _850 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[146].z, _840);
    float _852 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[146].x, _842);
    float _854 = _628 * _792;
    float _856 = _828 * 6.283185482025146484375;
    float _858 = sin(_856);
    float _860 = _848 * _818;
    float _862 = _852 * _816;
    float _864 = _828 * 6.283185482025146484375;
    float _866 = cos(_864);
    float _868 = _860 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _870 = _850 * _820;
    float _872 = _862 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _874 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _832);
    float _876 = _854 * _868;
    float _878 = _836 * 6.283185482025146484375;
    float _880 = cos(_878);
    float _882 = _870 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _884 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _830);
    float _886 = _854 * _872;
    float _888 = _874 * _876;
    float _890 = _846 * _858;
    float _892 = _854 * _882;
    float _894 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _834);
    float _896 = _812 * 6.283185482025146484375;
    float _898 = sin(_896);
    float _900 = _846 * _866;
    float _902 = _884 * _886;
    float _904 = _894 * _892;
    float _906 = _836 * 6.283185482025146484375;
    float _908 = sin(_906);
    float _910 = _846 * _880;
    float _912 = _910 * _888;
    float _914 = _898 * _858;
    float _916 = _898 * _866;
    float _918 = _866 * _880;
    float _920 = _898 * _880;
    float _922 = _858 * _880;
    float _924 = fma(_908, _900, _914);
    float _926 = -_916;
    float _928 = fma(_908, _890, _926);
    float _930 = -_888;
    float _932 = _908 * _930;
    float _934 = -_890;
    float _936 = fma(_908, _916, _934);
    float _938 = fma(_924, _902, _912);
    float _940 = _920 * _888;
    float _942 = fma(_918, _902, _932);
    float _944 = fma(_908, _914, _900);
    float _946 = fma(_928, _904, _938);
    float _948 = fma(_936, _902, _940);
    float _950 = fma(_922, _904, _942);
    float _952 = _946 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _954 = fma(_944, _904, _948);
    float _956 = _946 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _958 = fma(_950, (*spvDescriptorSet0.vp_c10)._m0[10].x, _952);
    float _960 = fma(_950, (*spvDescriptorSet0.vp_c10)._m0[8].x, _956);
    float _962 = fma(_954, (*spvDescriptorSet0.vp_c10)._m0[10].z, _958);
    float _964 = fma(_954, (*spvDescriptorSet0.vp_c10)._m0[8].z, _960);
    float _966 = _946 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _968 = _420 + _962;
    float _970 = _356 + _964;
    float _972 = fma(_950, (*spvDescriptorSet0.vp_c10)._m0[9].x, _966);
    float _974 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _976 = _968 + _974;
    float _978 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _980 = _970 + _978;
    float _982 = fma(_954, (*spvDescriptorSet0.vp_c10)._m0[9].z, _972);
    float _984 = _976 * _976;
    float _986 = _380 + _982;
    float _988 = fma(_980, _980, _984);
    float _990 = sqrt(_988);
    bool _992 = _990 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _994 = _984;
    float _996 = _970;
    if (!_992)
    {
        _472 = _968;
    }
    float _998 = _472;
    float _1000 = _998;
    if (!_992)
    {
        _994 = _986;
    }
    float _1002 = _994;
    bool _1004 = !_992;
    float _1006 = _1002;
    if (!_1004)
    {
        float _1008 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1010 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1012 = _990 + _1010;
        float _1014 = _986 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1016 = rsqrt(_988);
        float _1018 = _1012 * _1008;
        float _1020 = _1018 * 0.15915493667125701904296875;
        float _1022 = _1020 * 6.283185482025146484375;
        float _1024 = sin(_1022);
        float _1026 = _1020 * 6.283185482025146484375;
        float _1028 = cos(_1026);
        float _1030 = fma(_1024, _1014, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1032 = _1016 * _1030;
        float _1034 = _1028 + (-1.0);
        float _1036 = fma(_980, _1032, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1038 = fma(_976, _1032, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1040 = _1034 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1042 = fma(_986, _1028, _1040);
        _1006 = _1042;
        _996 = _1036;
        _1000 = _1038;
    }
    float _1044 = _1006;
    float _1046 = _996;
    float _1048 = _1000;
    float _1050 = -_700;
    float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1044);
    float _1054 = -_696;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1046);
    float _1058 = -_728;
    float _1060 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1048);
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1064 = _1052 + _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1068 = _1056 + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1072 = _1060 + _1070;
    float _1074 = _1064 * _1064;
    float _1076 = fma(_1068, _1068, _1074);
    float _1078 = fma(_1072, _1072, _1076);
    float _1080 = rsqrt(_1078);
    float _1082 = sqrt(_1078);
    float _1084 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1086 = _1068 * _1084;
    float _1088 = _1072 * _1084;
    float _1090 = _1086 * _1086;
    float _1092 = _1088 * _1088;
    float _1094 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1096 = _1090 + _1092;
    float _1098 = precise::max(0.0, _1094);
    float _1100 = sqrt(_1096);
    float _1102 = -_1084;
    float _1104 = -_1098;
    float _1106 = fma(_1064, _1102, _1104);
    bool _1108 = _1100 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1110 = _1064;
    float _1112 = _1072;
    float _1114 = _1098;
    float _1116 = _1090;
    float _1118 = _1092;
    if (!_1108)
    {
        _1110 = _1086;
    }
    float _1120 = _1110;
    float _1122 = _1120;
    if (!_1108)
    {
        _1112 = _1106;
    }
    float _1124 = _1112;
    float _1126 = _1124;
    if (!_1108)
    {
        _1114 = _1088;
    }
    float _1128 = _1114;
    bool _1130 = !_1108;
    float _1132 = _1128;
    if (!_1130)
    {
        float _1134 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1136 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1138 = _1100 + _1136;
        float _1140 = _1106 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1142 = rsqrt(_1096);
        float _1144 = _1138 * _1134;
        float _1146 = _1144 * 0.15915493667125701904296875;
        float _1148 = _1146 * 6.283185482025146484375;
        float _1150 = sin(_1148);
        float _1152 = _1146 * 6.283185482025146484375;
        float _1154 = cos(_1152);
        float _1156 = fma(_1150, _1140, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1158 = _1142 * _1156;
        float _1160 = _1154 + (-1.0);
        float _1162 = _1086 * _1158;
        float _1164 = _1160 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1166 = _1088 * _1158;
        float _1168 = fma(_1106, _1154, _1164);
        float _1170 = _1162 * _1162;
        float _1172 = _1166 * _1166;
        _1126 = _1168;
        _1116 = _1170;
        _1118 = _1172;
        _1122 = _1162;
        _1132 = _1166;
    }
    float _1174 = _1126;
    float _1176 = _1116;
    float _1178 = _1118;
    float _1180 = _1122;
    float _1182 = _1132;
    float _1184 = fma(_1174, _1174, _1176);
    float _1186 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1188 = _1184 + _1178;
    float _1190 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1186);
    float _1192 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1194 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1196 = fma(_1082, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1194);
    float _1198 = precise::clamp(_1196, 0.0, 1.0);
    float _1200 = rsqrt(_1188);
    float _1202 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1190);
    float _1204 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1206 = -_1198;
    float _1208 = _1206 + 1.0;
    float _1210 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1192);
    float _1212 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1214 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1204);
    float _1216 = abs(_1208);
    float _1218 = log2(_1216);
    float _1220 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1210);
    float _1222 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1214);
    float _1224 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1212);
    float _1226 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1228 = _1220 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1230 = _1222 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1232 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1224);
    float _1234 = _1200 * _1180;
    float _1236 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1238 = _1200 * _1174;
    float _1240 = _1200 * _1182;
    float _1242 = _1234 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1244 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1236);
    float _1246 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1248 = _1226 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1250 = -_1242;
    float _1252 = fma(_1238, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1250);
    float _1254 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1256 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1258 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1244);
    float _1260 = -_1240;
    float _1262 = fma(_1260, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1252);
    float _1264 = -_1248;
    float _1266 = fma(_1246, _1264, 1.0);
    float _1268 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1270 = exp2(_1256);
    float _1272 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1258);
    float _1274 = fma(_1262, -0.5, 0.5);
    float _1276 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1278 = fma(_1262, 0.5, 0.5);
    float _1280 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1268);
    float _1282 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1276);
    float _1284 = 1.0 / _1272;
    float _1286 = _1238 + 1.0;
    float _1288 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1280);
    float _1290 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1282);
    float _1292 = fma(_1278, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1294 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1288);
    float _1296 = log2(_1266);
    float _1298 = -_1238;
    float _1300 = fma(_1270, _1286, _1298);
    float _1302 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1290);
    float _1304 = fma(_1278, _1292, -0.212114393711090087890625);
    float _1306 = fma(_1300, 0.5, 0.5);
    float _1308 = fma(_1278, _1304, 1.570728778839111328125);
    float _1310 = sqrt(_1274);
    float _1312 = _1294 * _1284;
    float _1314 = _1302 * _1284;
    float _1316 = fma(_1312, 0.5, 0.5);
    float _1318 = fma(_1314, -0.5, 0.5);
    float _1320 = _1296 * 0.693147182464599609375;
    float _1322 = _1320 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1324 = _1310 * 0.636619746685028076171875;
    float3 _4068 = float3(_1316, _1318, _1322);
    float _1326 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4068, float3(0.0), isnan(_4068)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4068, float3(0.0), isnan(_4068)), level(0.0)).x;
    float _1328 = -_1308;
    float _1330 = fma(_1324, _1328, 1.0);
    float2 _4084 = float2(_1330, _1306);
    float3 _1334 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4084, float2(0.0), isnan(_4084)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4084, float2(0.0), isnan(_4084)), level(0.0)).xyz;
    float _1336 = _1334.x;
    float _1338 = _1334.y;
    float _1340 = _1334.z;
    float _1342 = in.m_59.x;
    bool _1344 = _310 > 0.5;
    float _1346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1350 = _1348 != 0;
    float _1352 = in.m_59.y;
    int _1354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1356 = _1354 != 0;
    float _1358 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1360 = _328 > 0.5;
    out.m_61.x = _1056;
    out.m_61.y = _1052;
    out.m_61.z = _1060;
    bool _1362 = _312 > 0.5;
    float _1364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_63.w = _1272;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1370 = _1368 != 0;
    float _1372 = _1318;
    float _1374 = _1308;
    float _1376 = _1272;
    float _1378 = _1302;
    float _1380 = _1294;
    if (_1350)
    {
        float _1382 = in.m_53.z;
        _1372 = _1382;
    }
    float _1384 = _1372;
    if (_1356)
    {
        bool _1386 = _318 > 0.5;
        _562 = _1386;
    }
    bool _1388 = _562;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1394 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1396 = _1342;
    if (_1356)
    {
        float _1398 = -_1342;
        float _1400 = _1398 + 1.0;
        _474 = as_type<int>(_1400);
    }
    int _1402 = _474;
    if (!_1356)
    {
        _1374 = _1342;
    }
    float _1404 = _1374;
    float _1406 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1408 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1410 = -_1352;
    float _1412 = _1410 + 1.0;
    float _1414 = _1404;
    float _1416 = _1352;
    int _1418 = as_type<int>(_1406);
    float _1420 = _1412;
    if (_1356)
    {
        float _1422 = _1388 ? as_type<float>(_1402) : _1342;
        _1414 = _1422;
    }
    float _1424 = _1414;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1430 = _1428 != 0;
    float _1432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1434 = _1344 ? as_type<int>(_1412) : as_type<int>(_1352);
    float _1436 = _1426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1440 = _1438 != 0;
    int _1442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1444 = _1442 != 0;
    float _1446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1448 = _1430 ? as_type<float>(_1434) : _1352;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1452 = _1360 ? as_type<int>(_1412) : as_type<int>(_1352);
    bool _1454 = _1430;
    int _1456 = as_type<int>(_1450);
    float _1458 = _1436;
    if (_1350)
    {
        bool _1460 = _1384 > 0.5;
        _1454 = _1460;
    }
    bool _1462 = _1454;
    float _1464 = in.m_65.x;
    float _1466 = in.m_65.y;
    float _1468 = in.m_65.z;
    float _1470 = _1444 ? as_type<float>(_1452) : _1352;
    float _1472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _1474 = _832 != 0.0;
    bool _1476 = isnan(_832);
    bool _1478 = _1474 || _1476;
    bool _1480 = isnan(0.0);
    bool _1482 = _1478 || _1480;
    out.m_67.x = _1394;
    out.m_67.y = _1406;
    out.m_67.z = _1408;
    out.m_67.w = _1450;
    float _1484 = 0.0;
    if (!_1350)
    {
        _1484 = _1342;
    }
    float _1486 = _1484;
    bool _1488 = _830 == 0.0;
    bool _1490 = !_1482;
    bool _1492 = _1488 && _1490;
    float _1494 = exp2(_1358);
    bool _1496 = _834 == 0.0;
    bool _1498 = _1496 && _1492;
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1502 = _1486;
    if (_1370)
    {
        float _1504 = _1362 ? _1412 : _1352;
        _1416 = _1504;
    }
    float _1506 = _1416;
    if (_1350)
    {
        float _1508 = -_1342;
        float _1510 = _1508 + 1.0;
        _1418 = as_type<int>(_1510);
    }
    int _1512 = _1418;
    if (_1440)
    {
        float _1514 = -_1342;
        float _1516 = _1514 + 1.0;
        _1456 = as_type<int>(_1516);
    }
    int _1518 = _1456;
    float _1520 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1524 = _1500 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1526 = _1524;
    if (_1350)
    {
        float _1528 = _1462 ? as_type<float>(_1512) : _1342;
        _1502 = _1528;
    }
    float _1530 = _1502;
    float _1532 = _1520 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1440)
    {
        float _1534 = _1360 ? as_type<float>(_1518) : _1342;
        _1396 = _1534;
    }
    float _1536 = _1396;
    float _1538 = -_1494;
    float _1540 = _1538 + 1.0;
    float _1542 = in.m_69.x;
    float _1544 = in.m_69.y;
    float _1546 = in.m_69.z;
    float _1548 = in.m_69.w;
    float _1550 = 0.0;
    if (_1498)
    {
        _1550 = _1464;
    }
    float _1552 = _1550;
    float _1554 = 0.0;
    float _1556 = _1552;
    if (_1498)
    {
        _1554 = _1466;
    }
    float _1558 = _1554;
    out.m_71.x = _1436;
    out.m_71.y = _1524;
    out.m_71.z = _1532;
    out.m_71.w = _1522;
    float _1560 = _1558;
    if (_1498)
    {
        _1420 = _1552;
    }
    float _1562 = _1420;
    float _1564 = _1562;
    if (!_1498)
    {
        _1556 = _1464;
    }
    float _1566 = _1556;
    float _1568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    if (!_1498)
    {
        float _1570 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1566);
        _1564 = _1570;
    }
    float _1572 = _1564;
    float _1574 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1498)
    {
        _1526 = _1558;
    }
    float _1576 = _1526;
    float _1578 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1580 = _1576;
    if (!_1498)
    {
        _1560 = _1466;
    }
    float _1582 = _1560;
    float _1584 = _1574 * _1364;
    if (_1498)
    {
        _1458 = _1468;
    }
    float _1586 = _1458;
    float _1588 = _1586;
    if (!_1498)
    {
        float _1590 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1468);
        _1588 = _1590;
    }
    float _1592 = _1588;
    float _1594 = _1530 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_1498)
    {
        float _1596 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1582);
        _1580 = _1596;
    }
    float _1598 = _1580;
    float _1600 = _1470 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1602 = _1578 * _1432;
    float _1604 = _1594 * _1346;
    float _1606 = _1546 * _1566;
    float _1608 = _1600 * _1446;
    float _1610 = _1536 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1612 = _1544 * _1468;
    float _1614 = _1542 * _1582;
    float _1616 = -_1606;
    float _1618 = fma(_1542, _1468, _1616);
    out.m_73.x = _1602;
    out.m_73.y = _1608;
    out.m_73.z = _1604;
    out.m_73.w = _1584;
    float _1620 = _1610 * _1568;
    float _1622 = -_1612;
    float _1624 = fma(_1546, _1582, _1622);
    float _1626 = _1448 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1628 = -_1614;
    float _1630 = fma(_1544, _1566, _1628);
    float _1632 = _1618 * _1548;
    float _1634 = -_1544;
    float _1636 = _908 * _1634;
    float _1638 = -_1598;
    float _1640 = _908 * _1638;
    float _1642 = _1626 * _1472;
    float _1644 = _1624 * _1548;
    float _1646 = fma(_918, _1542, _1636);
    float _1648 = fma(_918, _1572, _1640);
    float _1650 = -_1632;
    float _1652 = _908 * _1650;
    float _1654 = _1630 * _1548;
    float _1656 = _910 * _1598;
    float _1658 = _910 * _1544;
    float _1660 = _920 * _1544;
    float _1662 = _910 * _1632;
    float _1664 = fma(_924, _1572, _1656);
    float _1666 = fma(_924, _1542, _1658);
    float _1668 = fma(_936, _1542, _1660);
    float _1670 = fma(_924, _1644, _1662);
    float _1672 = fma(_928, _1592, _1664);
    float _1674 = fma(_928, _1546, _1666);
    float _1676 = fma(_922, _1546, _1646);
    out.m_75.x = _1620;
    out.m_75.y = _1642;
    float _1678 = fma(_944, _1546, _1668);
    float _1680 = _920 * _1598;
    float _1682 = fma(_922, _1592, _1648);
    float _1684 = _1672 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1686 = _920 * _1632;
    float _1688 = _1674 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1690 = fma(_918, _1644, _1652);
    float _1692 = fma(_928, _1654, _1670);
    float _1694 = _1672 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1696 = _1672 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1698 = _1674 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1700 = fma(_1682, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1684);
    float _1702 = _1674 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1704 = fma(_1682, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1696);
    float _1706 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1708 = fma(_1676, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1688);
    float _1710 = fma(_922, _1654, _1690);
    float _1712 = _1692 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1714 = fma(_1676, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1698);
    float _1716 = fma(_1676, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1702);
    float _1718 = fma(_936, _1572, _1680);
    float _1720 = fma(_936, _1644, _1686);
    float _1722 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1706);
    float _1724 = fma(_1710, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1712);
    float _1726 = _1692 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1728 = fma(_1678, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1714);
    float _1730 = fma(_1678, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1708);
    float _1732 = fma(_1678, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1716);
    float _1734 = fma(_944, _1592, _1718);
    float _1736 = fma(_944, _1654, _1720);
    float _1738 = _1692 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1740 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1742 = fma(_1710, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1726);
    float _1744 = _1294 + _1272;
    out.m_77.x = _1728;
    out.m_77.y = _1730;
    out.m_77.z = _1732;
    float _1746 = fma(_1682, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1694);
    float _1748 = fma(_1710, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1738);
    float _1750 = _1272 * 0.5;
    float _1752 = fma(_1736, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1742);
    float _1754 = _1744 * 0.5;
    float _1756 = fma(_1734, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1700);
    float _1758 = fma(_1734, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1704);
    float _1760 = fma(_1736, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1724);
    float _1762 = fma(_1736, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1748);
    float _1764 = fma(_1302, -0.5, _1750);
    float _1766 = fma(_1734, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1746);
    bool _1768 = _1082 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1770 = isnan(_1082);
    bool _1772 = _1768 || _1770;
    bool _1774 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1776 = _1772 || _1774;
    float _1778 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1722);
    out.m_79.x = _1752;
    out.m_79.y = _1760;
    out.m_79.z = _1762;
    float _1780 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1778);
    out.m_63.y = _1764;
    out.m_81.x = _1756;
    out.m_81.y = _1758;
    out.m_81.z = _1766;
    float _1782 = _1728;
    float _1784 = _1754;
    float _1786 = _1780;
    if (!_1776)
    {
        _1782 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1788 = _1782;
    out.gl_Position.x = _1294;
    out.gl_Position.y = _1302;
    out.gl_Position.z = _1780;
    out.gl_Position.w = _1272;
    out.m_63.x = _1754;
    float _1790 = _1788;
    float _1792 = _1788;
    if (!_1776)
    {
        _1784 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1794 = _1784;
    float _1796 = _1794;
    float _1798 = _1794;
    if (!_1776)
    {
        _1376 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1800 = _1376;
    float _1802 = _1800;
    float _1804 = _1800;
    if (!_1776)
    {
        _1786 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1806 = _1786;
    float _1808 = _1806;
    float _1810 = _1806;
    if (!_1776)
    {
        _1378 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1812 = _1378;
    float _1814 = _1812;
    float _1816 = _1812;
    if (!_1776)
    {
        _1380 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1818 = _1380;
    float _1820 = _1740 * _1326;
    float _1822 = -_1740;
    float _1824 = _1822 + 1.0;
    float _1826 = _1336 * _1820;
    float _1828 = _1338 * _1820;
    float _1830 = _1340 * _1820;
    out.m_83.x = _1826;
    out.m_83.y = _1828;
    out.m_83.z = _1830;
    out.m_83.w = _1824;
    bool _1832 = !_1776;
    float _1834 = _1818;
    float _1836 = _1818;
    if (!_1832)
    {
        bool _1838 = _1082 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1840 = isnan(_1082);
        bool _1842 = _1838 || _1840;
        bool _1844 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1846 = _1842 || _1844;
        if (!_1846)
        {
            float _1848 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1850 = _1082 + _1848;
            float _1852 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1854 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1852;
            float _1856 = 1.0 / _1854;
            float _1858 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1860 = _1858 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1862 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1864 = _1862 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1866 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1868 = _1866 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1872 = _1870 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1874 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1876 = _1874 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1878 = _1850 * _1856;
            float _1880 = precise::clamp(_1878, 0.0, 1.0);
            float _1882 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1884 = _1882 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1886 = fma(_1880, _1860, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1888 = fma(_1880, _1884, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1890 = fma(_1880, _1864, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1892 = fma(_1880, _1868, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1894 = fma(_1880, _1872, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1896 = fma(_1880, _1876, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1792 = _1888;
            _1816 = _1894;
            _1798 = _1886;
            _1810 = _1892;
            _1804 = _1890;
            _1836 = _1896;
            _1898 = true;
        }
        else
        {
            bool _1900 = _1082 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1902 = isnan(_1082);
            bool _1904 = _1900 || _1902;
            bool _1906 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1908 = _1904 || _1906;
            if (!_1908)
            {
                _1796 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1910 = _1796;
            _1798 = _1910;
            if (!_1908)
            {
                _1790 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1912 = _1790;
            _1792 = _1912;
            if (!_1908)
            {
                _1802 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1914 = _1802;
            _1804 = _1914;
            if (!_1908)
            {
                _1808 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1916 = _1808;
            _1810 = _1916;
            if (!_1908)
            {
                _1814 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1918 = _1814;
            _1816 = _1918;
            if (!_1908)
            {
                _1834 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1920 = _1834;
            bool _1922 = !_1908;
            _1836 = _1920;
            if (!_1922)
            {
                bool _1924 = _1082 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1926 = isnan(_1082);
                bool _1928 = _1924 || _1926;
                bool _1930 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1932 = _1928 || _1930;
                if (!_1932)
                {
                    float _1934 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1936 = _1082 + _1934;
                    float _1938 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1940 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1938;
                    float _1942 = 1.0 / _1940;
                    float _1944 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1946 = _1944 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1948 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1950 = _1948 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1952 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1954 = _1952 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1956 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1958 = _1956 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1960 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1962 = _1960 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1964 = _1936 * _1942;
                    float _1966 = precise::clamp(_1964, 0.0, 1.0);
                    float _1968 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1970 = _1968 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1972 = fma(_1966, _1946, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1974 = fma(_1966, _1970, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1976 = fma(_1966, _1950, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1978 = fma(_1966, _1954, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1980 = fma(_1966, _1958, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1982 = fma(_1966, _1962, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1792 = _1974;
                    _1816 = _1980;
                    _1798 = _1972;
                    _1810 = _1978;
                    _1804 = _1976;
                    _1836 = _1982;
                    _1898 = true;
                }
                else
                {
                    _1792 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1816 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1798 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1810 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1804 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1836 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1898 = false;
    float _1984 = _1792;
    float _1986 = _1816;
    float _1988 = _1798;
    float _1990 = _1810;
    float _1992 = _1804;
    float _1994 = _1836;
    float _1996 = fma(_1758, -0.5, 0.5);
    float _1998 = precise::clamp(_1996, 0.0, 1.0);
    float _2000 = -_1984;
    float _2002 = _2000 + _1986;
    float _2004 = -_1988;
    float _2006 = _2004 + _1990;
    float _2008 = -_1992;
    float _2010 = _2008 + _1994;
    bool _2012 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2014 = fma(_1998, _2002, _1984);
    float _2016 = fma(_1998, _2006, _1988);
    float _2018 = fma(_1998, _2010, _1992);
    float _2020 = _2014 * 0.586610972881317138671875;
    out.m_45.x = 1.0;
    float _2022 = fma(_2016, 0.298911988735198974609375, _2020);
    out.m_85.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2024 = fma(_2018, 0.114477999508380889892578125, _2022);
    out.m_87.x = 0.0;
    float _2026 = -_2024;
    float _2028 = _2016 + _2026;
    float _2030 = -_2024;
    float _2032 = _2014 + _2030;
    float _2034 = -_2024;
    float _2036 = _2018 + _2034;
    float _2038 = fma(_2028, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2024);
    float _2040 = fma(_2032, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2024);
    float _2042 = fma(_2036, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2024);
    out.m_89.x = _2038;
    out.m_89.y = _2040;
    out.m_89.z = _2042;
    if (!_2012)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2044 = -_1052;
    float _2046 = _2044 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2048 = -_1056;
    float _2050 = _2048 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2052 = -_1060;
    float _2054 = _2052 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2056 = _2046 * _2046;
    float _2058 = fma(_2050, _2050, _2056);
    float _2060 = fma(_2054, _2054, _2058);
    float _2062 = sqrt(_2060);
    float _2064 = rsqrt(_2060);
    float _2066 = -_2062;
    float _2068 = _2066 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2070 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2072 = precise::clamp(_2070, 0.0, 1.0);
    float _2074 = _2050 * _2064;
    float _2076 = _2046 * _2064;
    float _2078 = abs(_2072);
    float _2080 = log2(_2078);
    float _2082 = _2054 * _2064;
    float _2084 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2086 = _1758 * _2076;
    float _2088 = -_2076;
    float _2090 = -_2084;
    float _2092 = fma(_2088, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2090);
    float _2094 = fma(_1756, _2074, _2086);
    float _2096 = -_2082;
    float _2098 = fma(_2096, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2092);
    float _2100 = fma(_1766, _2082, _2094);
    float _2102 = precise::clamp(_2100, 0.0, 1.0);
    float _2104 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2106 = _2098 + _2104;
    float _2108 = _2080 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2110 = _2106 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2112 = precise::clamp(_2110, 0.0, 1.0);
    float _2114 = exp2(_2108);
    float _2116 = _2114 * _2112;
    float _2118 = _2102 * _2116;
    float _2120 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2122 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2124 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2120;
    out.m_87.y = _2122;
    out.m_87.z = _2124;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1898 = false;
    bool _306 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_42.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_108);
    float _118 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _114;
    if (!_112)
    {
        out.m_45.x = 0.0;
    }
    int _122 = 0;
    if (!_112)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2181 = as_type<float>(_126);
        out.gl_Position.z = _2181;
    }
    if (!_112)
    {
        return out;
    }
    float _128 = in.m_47.w;
    float _130 = float(_108);
    float _132 = 1.0 / _130;
    float _134 = -_128;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_128);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = _136 * _132;
    bool _150 = _136 >= _130;
    bool _152 = !_146;
    bool _154 = _150 || _152;
    out.m_49.x = _148;
    float _156 = _136;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _116;
    if (_154)
    {
        out.m_45.x = 0.0;
    }
    int _160 = 0;
    if (_154)
    {
        float _162 = _158 * 5.0;
        _160 = as_type<int>(_162);
    }
    int _164 = _160;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2252 = as_type<float>(_164);
        out.gl_Position.z = _2252;
    }
    if (_154)
    {
        return out;
    }
    float _166 = in.m_51.w;
    float _168 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _170 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _172 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _174 = _170 || _172;
    bool _176 = isnan(1.0);
    bool _178 = _174 || _176;
    float _180 = in.m_47.x;
    float _182 = in.m_47.y;
    float _184 = in.m_47.z;
    float _186 = in.m_42.x;
    float _188 = in.m_42.y;
    float _190 = in.m_42.z;
    float _192 = _168;
    if (!_178)
    {
        float _194 = _168 * _168;
        float _196 = _194 * 0.5;
        _118 = _196;
    }
    float _198 = _118;
    float _200 = _198;
    if (!_178)
    {
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _202;
    }
    float _204 = _200;
    bool _206 = !_178;
    float _208 = _204;
    if (!_206)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = _168 * _212;
        float _222 = 1.0 / _216;
        float _224 = _218 * 0.693147182464599609375;
        float _226 = exp2(_220);
        float _228 = 1.0 / _224;
        float _230 = _226 + (-1.0);
        float _232 = -_230;
        float _234 = fma(_232, _228, _168);
        float _236 = _234 * _222;
        float _238 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _238;
    }
    float _240 = _208;
    bool _242 = !_178;
    if (!_242)
    {
        float _244 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _246 = log2(_244);
        float _248 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _250 = _248 + 1.0;
        float _252 = 1.0 / _250;
        float _254 = _168 * _246;
        float _256 = exp2(_254);
        float _258 = -_256;
        float _260 = _258 + 1.0;
        float _262 = _260 * _252;
        _192 = _262;
    }
    float _264 = _192;
    bool _266 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _268 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _270 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _272 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _274 = fma(_264, _180, _268);
    float _276 = fma(_264, _182, _270);
    float _278 = fma(_264, _184, _272);
    float _280 = fma(_274, _166, _186);
    float _282 = fma(_276, _166, _188);
    float _284 = fma(_278, _166, _190);
    bool _286 = !_266;
    float _304;
    if (!_286)
    {
        float _288 = in.m_53.x;
        float _290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _292 = _288 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _296 = _294 * _290;
        float _298 = floor(_296);
        float _300 = -_298;
        float _302 = _296 + _300;
        _304 = _302;
        _306 = true;
    }
    else
    {
        _304 = _148;
    }
    _306 = false;
    float _308 = _304;
    float _310 = in.m_53.z;
    float _312 = in.m_53.w;
    float _314 = _282 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _316 = _282 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _318 = in.m_53.x;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _328 = in.m_53.y;
    float _330 = 1.0 / _322;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _332;
    float _336 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[4].x, _314);
    int _338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _340 = _338 != 0;
    int _342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _344 = _342 != 0;
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _348 = _346 != 0;
    float _350 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].z, _336);
    float _352 = 1.0 / _326;
    float _354 = _282 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _356 = _350 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _358 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[5].x, _354);
    float _360 = _310 * 2.0;
    float _362 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[6].x, _316);
    float _364 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _366 = log2(_364);
    float _368 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].z, _358);
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _372 = _308 + _370;
    float _374 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].z, _362);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _378 = _308 + _376;
    float _380 = _368 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _382 = _372 * _330;
    float _384 = _328 * 2.0;
    float _386 = floor(_360);
    float _388 = _378 * _352;
    float _390 = _328 + _310;
    float _392 = _318 + _328;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _394;
    float _398 = _390 + (-1.0);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _404 = 1.0 / _334;
    float _406 = _366 * _136;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _410 = _308 + _408;
    float _412 = _392 + (-1.0);
    float _414 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _416 = _380 + _414;
    float _418 = fma(_402, _388, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = _374 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _422 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _424 = _386 > 0.0;
    float _426 = _318 * 2.0;
    bool _428 = _386 >= 0.0;
    bool _430 = isnan(_386);
    bool _432 = _428 || _430;
    bool _434 = isnan(0.0);
    bool _436 = _432 || _434;
    float _438 = exp2(_406);
    float _440 = fma(_396, _382, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _442 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _444 = _420 + _442;
    int _446 = _436 ? 0 : 1;
    float _448 = _410 * _404;
    bool _450 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _452 = isnan(_308);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = floor(_426);
    int _464 = ~_446;
    int _466 = _464 + 1;
    int _468 = _466 + 1;
    int _470 = _468;
    float _472 = _380;
    int _474 = as_type<int>(_318);
    if (!_424)
    {
        int _476 = ~_446;
        int _478 = _476 + 1;
        _470 = _478;
    }
    int _480 = _470;
    float _482 = floor(_384);
    float _484 = _318 + _310;
    float _486 = -_438;
    float _488 = _486 + 1.0;
    float _490 = _484 + (-1.0);
    bool _492 = _462 >= 0.0;
    bool _494 = isnan(_462);
    bool _496 = _492 || _494;
    bool _498 = isnan(0.0);
    bool _500 = _496 || _498;
    float _502 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _506 = 1.0 + _504;
    bool _508 = _462 > 0.0;
    float _510 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _512 = _500 ? 0 : 1;
    bool _514 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _516 = isnan(0.0);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _522 = _518 || _520;
    float _524 = 1.0 / _506;
    bool _526 = _482 > 0.0;
    float _528 = _522 ? _488 : 0.0;
    bool _530 = _482 >= 0.0;
    bool _532 = isnan(_482);
    bool _534 = _530 || _532;
    bool _536 = isnan(0.0);
    bool _538 = _534 || _536;
    bool _540 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _542 = isnan(1.0);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _548 = _544 || _546;
    int _550 = ~_512;
    int _552 = _550 + 1;
    int _554 = _552 + 1;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _556;
    int _560 = _554;
    bool _562 = _526;
    if (!_508)
    {
        int _564 = ~_512;
        int _566 = _564 + 1;
        _560 = _566;
    }
    int _568 = _560;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _578 = !_340;
    int _580 = _578 ? 0 : 1;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _582;
    float _586 = fma(_572, _388, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _588 = fma(_576, _388, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _590 = abs(_580);
    float _592 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _594 = _356 + _592;
    float _596 = _416 * _416;
    if (_548)
    {
        float _598 = _528 * _524;
        _156 = _598;
    }
    float _600 = _156;
    float _602 = fma(_558, _382, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _604 = in.m_55.x;
    float _606 = in.m_55.y;
    float _608 = in.m_55.z;
    float _610 = fma(_584, _382, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _612 = !_344;
    int _614 = _612 ? 0 : 1;
    float _616 = fma(_594, _594, _596);
    int _618 = _538 ? 0 : 1;
    int _620 = abs(_614);
    float _622 = fma(_444, _444, _616);
    float _624 = float(_568);
    float _626 = float(_620);
    float _628 = rsqrt(_622);
    int _630 = ~_618;
    int _632 = _630 + 1;
    int _634 = _632 + 1;
    float _636 = float(_590);
    float _638 = float(_480);
    int _640 = _634;
    if (!_526)
    {
        int _642 = ~_618;
        int _644 = _642 + 1;
        _640 = _644;
    }
    int _646 = _640;
    float _648 = _626 * _624;
    bool _650 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _652 = isnan(_308);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = -_460;
    float _664 = _662 + 1.0;
    bool _666 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _668 = isnan(_308);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = _648 * (-2.0);
    float _680 = _636 * _638;
    float _682 = _660 * _664;
    float _684 = -_660;
    float _686 = _684 + 1.0;
    bool _688 = !_348;
    int _690 = _688 ? 0 : 1;
    float _692 = fma(_502, _678, _502);
    float _694 = fma(_678, _606, _606);
    float _696 = _594 * _628;
    int _698 = abs(_690);
    float _700 = _416 * _628;
    float _702 = _676 * _686;
    bool _704 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _706 = isnan(_308);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = -_676;
    float _718 = _716 + 1.0;
    float _720 = -_700;
    float _722 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[18].w, _416);
    float _724 = -_696;
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _594);
    float _728 = _444 * _628;
    float _730 = _722 * _722;
    float _732 = float(_646);
    float _734 = -_728;
    float _736 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[18].w, _444);
    float _738 = _328 + (-0.5);
    float _740 = fma(_726, _726, _730);
    float _742 = float(_698);
    float _744 = _714 * _718;
    float _746 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[196].y, _694);
    float _748 = fma(_736, _736, _740);
    float _750 = _680 * (-2.0);
    float _752 = _742 * _732;
    float _754 = fma(_692, _600, _746);
    float _756 = _602 * _744;
    float _758 = fma(_422, _750, _422);
    float _760 = _752 * (-2.0);
    float _762 = fma(_750, _604, _604);
    float _764 = _318 + (-0.5);
    float _766 = _440 * _744;
    float _768 = fma(_760, _608, _608);
    float _770 = _310 + (-0.5);
    float _772 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[196].x, _762);
    float _774 = -_714;
    float _776 = _774 + 1.0;
    float _778 = _610 * _744;
    float _780 = fma(_510, _760, _510);
    float _782 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[196].z, _768);
    float _784 = fma(_758, _600, _772);
    float _786 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[143].x, _756);
    float _788 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[143].y, _766);
    float _790 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[143].z, _778);
    float _792 = sqrt(_748);
    float _794 = fma(_780, _600, _782);
    float _796 = fma(_418, _702, _788);
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _798;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _802;
    float _806 = fma(_588, _702, _790);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _808;
    float _812 = _784 * 0.15915493667125701904296875;
    float _814 = fma(_800, _448, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _816 = in.m_51.x;
    float _818 = in.m_51.y;
    float _820 = in.m_51.z;
    float _822 = fma(_804, _448, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _824 = fma(_810, _448, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _826 = fma(_586, _702, _786);
    float _828 = _754 * 0.15915493667125701904296875;
    float _830 = in.m_57.x;
    float _832 = in.m_57.y;
    float _834 = in.m_57.z;
    float _836 = _794 * 0.15915493667125701904296875;
    float _838 = fma(_822, _682, _796);
    float _840 = fma(_824, _682, _806);
    float _842 = fma(_814, _682, _826);
    float _844 = _812 * 6.283185482025146484375;
    float _846 = cos(_844);
    float _848 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[146].y, _838);
    float _850 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[146].z, _840);
    float _852 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[146].x, _842);
    float _854 = _628 * _792;
    float _856 = _828 * 6.283185482025146484375;
    float _858 = sin(_856);
    float _860 = _848 * _818;
    float _862 = _852 * _816;
    float _864 = _828 * 6.283185482025146484375;
    float _866 = cos(_864);
    float _868 = _860 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _870 = _850 * _820;
    float _872 = _862 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _874 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _832);
    float _876 = _854 * _868;
    float _878 = _836 * 6.283185482025146484375;
    float _880 = cos(_878);
    float _882 = _870 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _884 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _830);
    float _886 = _854 * _872;
    float _888 = _874 * _876;
    float _890 = _846 * _858;
    float _892 = _854 * _882;
    float _894 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _834);
    float _896 = _812 * 6.283185482025146484375;
    float _898 = sin(_896);
    float _900 = _846 * _866;
    float _902 = _884 * _886;
    float _904 = _894 * _892;
    float _906 = _836 * 6.283185482025146484375;
    float _908 = sin(_906);
    float _910 = _846 * _880;
    float _912 = _910 * _888;
    float _914 = _898 * _858;
    float _916 = _898 * _866;
    float _918 = _866 * _880;
    float _920 = _898 * _880;
    float _922 = _858 * _880;
    float _924 = fma(_908, _900, _914);
    float _926 = -_916;
    float _928 = fma(_908, _890, _926);
    float _930 = -_888;
    float _932 = _908 * _930;
    float _934 = -_890;
    float _936 = fma(_908, _916, _934);
    float _938 = fma(_924, _902, _912);
    float _940 = _920 * _888;
    float _942 = fma(_918, _902, _932);
    float _944 = fma(_908, _914, _900);
    float _946 = fma(_928, _904, _938);
    float _948 = fma(_936, _902, _940);
    float _950 = fma(_922, _904, _942);
    float _952 = _946 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _954 = fma(_944, _904, _948);
    float _956 = _946 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _958 = fma(_950, (*spvDescriptorSet0.vp_c10)._m0[10].x, _952);
    float _960 = fma(_950, (*spvDescriptorSet0.vp_c10)._m0[8].x, _956);
    float _962 = fma(_954, (*spvDescriptorSet0.vp_c10)._m0[10].z, _958);
    float _964 = fma(_954, (*spvDescriptorSet0.vp_c10)._m0[8].z, _960);
    float _966 = _946 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _968 = _420 + _962;
    float _970 = _356 + _964;
    float _972 = fma(_950, (*spvDescriptorSet0.vp_c10)._m0[9].x, _966);
    float _974 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _976 = _968 + _974;
    float _978 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _980 = _970 + _978;
    float _982 = fma(_954, (*spvDescriptorSet0.vp_c10)._m0[9].z, _972);
    float _984 = _976 * _976;
    float _986 = _380 + _982;
    float _988 = fma(_980, _980, _984);
    float _990 = sqrt(_988);
    bool _992 = _990 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _994 = _984;
    float _996 = _970;
    if (!_992)
    {
        _472 = _968;
    }
    float _998 = _472;
    float _1000 = _998;
    if (!_992)
    {
        _994 = _986;
    }
    float _1002 = _994;
    bool _1004 = !_992;
    float _1006 = _1002;
    if (!_1004)
    {
        float _1008 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1010 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1012 = _990 + _1010;
        float _1014 = _986 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1016 = rsqrt(_988);
        float _1018 = _1012 * _1008;
        float _1020 = _1018 * 0.15915493667125701904296875;
        float _1022 = _1020 * 6.283185482025146484375;
        float _1024 = sin(_1022);
        float _1026 = _1020 * 6.283185482025146484375;
        float _1028 = cos(_1026);
        float _1030 = fma(_1024, _1014, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1032 = _1016 * _1030;
        float _1034 = _1028 + (-1.0);
        float _1036 = fma(_980, _1032, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1038 = fma(_976, _1032, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1040 = _1034 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1042 = fma(_986, _1028, _1040);
        _1006 = _1042;
        _996 = _1036;
        _1000 = _1038;
    }
    float _1044 = _1006;
    float _1046 = _996;
    float _1048 = _1000;
    float _1050 = -_700;
    float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1044);
    float _1054 = -_696;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1046);
    float _1058 = -_728;
    float _1060 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1048);
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1064 = _1052 + _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1068 = _1056 + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1072 = _1060 + _1070;
    float _1074 = _1064 * _1064;
    float _1076 = fma(_1068, _1068, _1074);
    float _1078 = fma(_1072, _1072, _1076);
    float _1080 = rsqrt(_1078);
    float _1082 = sqrt(_1078);
    float _1084 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1086 = _1068 * _1084;
    float _1088 = _1072 * _1084;
    float _1090 = _1086 * _1086;
    float _1092 = _1088 * _1088;
    float _1094 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1096 = _1090 + _1092;
    float _1098 = precise::max(0.0, _1094);
    float _1100 = sqrt(_1096);
    float _1102 = -_1084;
    float _1104 = -_1098;
    float _1106 = fma(_1064, _1102, _1104);
    bool _1108 = _1100 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1110 = _1064;
    float _1112 = _1072;
    float _1114 = _1098;
    float _1116 = _1090;
    float _1118 = _1092;
    if (!_1108)
    {
        _1110 = _1086;
    }
    float _1120 = _1110;
    float _1122 = _1120;
    if (!_1108)
    {
        _1112 = _1106;
    }
    float _1124 = _1112;
    float _1126 = _1124;
    if (!_1108)
    {
        _1114 = _1088;
    }
    float _1128 = _1114;
    bool _1130 = !_1108;
    float _1132 = _1128;
    if (!_1130)
    {
        float _1134 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1136 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1138 = _1100 + _1136;
        float _1140 = _1106 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1142 = rsqrt(_1096);
        float _1144 = _1138 * _1134;
        float _1146 = _1144 * 0.15915493667125701904296875;
        float _1148 = _1146 * 6.283185482025146484375;
        float _1150 = sin(_1148);
        float _1152 = _1146 * 6.283185482025146484375;
        float _1154 = cos(_1152);
        float _1156 = fma(_1150, _1140, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1158 = _1142 * _1156;
        float _1160 = _1154 + (-1.0);
        float _1162 = _1086 * _1158;
        float _1164 = _1160 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1166 = _1088 * _1158;
        float _1168 = fma(_1106, _1154, _1164);
        float _1170 = _1162 * _1162;
        float _1172 = _1166 * _1166;
        _1126 = _1168;
        _1116 = _1170;
        _1118 = _1172;
        _1122 = _1162;
        _1132 = _1166;
    }
    float _1174 = _1126;
    float _1176 = _1116;
    float _1178 = _1118;
    float _1180 = _1122;
    float _1182 = _1132;
    float _1184 = fma(_1174, _1174, _1176);
    float _1186 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1188 = _1184 + _1178;
    float _1190 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1186);
    float _1192 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1194 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1196 = fma(_1082, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1194);
    float _1198 = precise::clamp(_1196, 0.0, 1.0);
    float _1200 = rsqrt(_1188);
    float _1202 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1190);
    float _1204 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1206 = -_1198;
    float _1208 = _1206 + 1.0;
    float _1210 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1192);
    float _1212 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1214 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1204);
    float _1216 = abs(_1208);
    float _1218 = log2(_1216);
    float _1220 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1210);
    float _1222 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1214);
    float _1224 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1212);
    float _1226 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1228 = _1220 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1230 = _1222 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1232 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1224);
    float _1234 = _1200 * _1180;
    float _1236 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1238 = _1200 * _1174;
    float _1240 = _1200 * _1182;
    float _1242 = _1234 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1244 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1236);
    float _1246 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1248 = _1226 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1250 = -_1242;
    float _1252 = fma(_1238, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1250);
    float _1254 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1256 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1258 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1244);
    float _1260 = -_1240;
    float _1262 = fma(_1260, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1252);
    float _1264 = -_1248;
    float _1266 = fma(_1246, _1264, 1.0);
    float _1268 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1270 = exp2(_1256);
    float _1272 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1258);
    float _1274 = fma(_1262, -0.5, 0.5);
    float _1276 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1278 = fma(_1262, 0.5, 0.5);
    float _1280 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1268);
    float _1282 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1276);
    float _1284 = 1.0 / _1272;
    float _1286 = _1238 + 1.0;
    float _1288 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1280);
    float _1290 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1282);
    float _1292 = fma(_1278, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1294 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1288);
    float _1296 = log2(_1266);
    float _1298 = -_1238;
    float _1300 = fma(_1270, _1286, _1298);
    float _1302 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1290);
    float _1304 = fma(_1278, _1292, -0.212114393711090087890625);
    float _1306 = fma(_1300, 0.5, 0.5);
    float _1308 = fma(_1278, _1304, 1.570728778839111328125);
    float _1310 = sqrt(_1274);
    float _1312 = _1294 * _1284;
    float _1314 = _1302 * _1284;
    float _1316 = fma(_1312, 0.5, 0.5);
    float _1318 = fma(_1314, -0.5, 0.5);
    float _1320 = _1296 * 0.693147182464599609375;
    float _1322 = _1320 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1324 = _1310 * 0.636619746685028076171875;
    float3 _4068 = float3(_1316, _1318, _1322);
    float _1326 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4068, float3(0.0), isnan(_4068)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4068, float3(0.0), isnan(_4068)), level(0.0)).x;
    float _1328 = -_1308;
    float _1330 = fma(_1324, _1328, 1.0);
    float2 _4084 = float2(_1330, _1306);
    float3 _1334 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4084, float2(0.0), isnan(_4084)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4084, float2(0.0), isnan(_4084)), level(0.0)).xyz;
    float _1336 = _1334.x;
    float _1338 = _1334.y;
    float _1340 = _1334.z;
    float _1342 = in.m_59.x;
    bool _1344 = _310 > 0.5;
    float _1346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1350 = _1348 != 0;
    float _1352 = in.m_59.y;
    int _1354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1356 = _1354 != 0;
    float _1358 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1360 = _328 > 0.5;
    out.m_61.x = _1056;
    out.m_61.y = _1052;
    out.m_61.z = _1060;
    bool _1362 = _312 > 0.5;
    float _1364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_63.w = _1272;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1370 = _1368 != 0;
    float _1372 = _1318;
    float _1374 = _1308;
    float _1376 = _1272;
    float _1378 = _1302;
    float _1380 = _1294;
    if (_1350)
    {
        float _1382 = in.m_53.z;
        _1372 = _1382;
    }
    float _1384 = _1372;
    if (_1356)
    {
        bool _1386 = _318 > 0.5;
        _562 = _1386;
    }
    bool _1388 = _562;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1394 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1396 = _1342;
    if (_1356)
    {
        float _1398 = -_1342;
        float _1400 = _1398 + 1.0;
        _474 = as_type<int>(_1400);
    }
    int _1402 = _474;
    if (!_1356)
    {
        _1374 = _1342;
    }
    float _1404 = _1374;
    float _1406 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1408 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1410 = -_1352;
    float _1412 = _1410 + 1.0;
    float _1414 = _1404;
    float _1416 = _1352;
    int _1418 = as_type<int>(_1406);
    float _1420 = _1412;
    if (_1356)
    {
        float _1422 = _1388 ? as_type<float>(_1402) : _1342;
        _1414 = _1422;
    }
    float _1424 = _1414;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1430 = _1428 != 0;
    float _1432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1434 = _1344 ? as_type<int>(_1412) : as_type<int>(_1352);
    float _1436 = _1426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1440 = _1438 != 0;
    int _1442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1444 = _1442 != 0;
    float _1446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1448 = _1430 ? as_type<float>(_1434) : _1352;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1452 = _1360 ? as_type<int>(_1412) : as_type<int>(_1352);
    bool _1454 = _1430;
    int _1456 = as_type<int>(_1450);
    float _1458 = _1436;
    if (_1350)
    {
        bool _1460 = _1384 > 0.5;
        _1454 = _1460;
    }
    bool _1462 = _1454;
    float _1464 = in.m_65.x;
    float _1466 = in.m_65.y;
    float _1468 = in.m_65.z;
    float _1470 = _1444 ? as_type<float>(_1452) : _1352;
    float _1472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _1474 = _832 != 0.0;
    bool _1476 = isnan(_832);
    bool _1478 = _1474 || _1476;
    bool _1480 = isnan(0.0);
    bool _1482 = _1478 || _1480;
    out.m_67.x = _1394;
    out.m_67.y = _1406;
    out.m_67.z = _1408;
    out.m_67.w = _1450;
    float _1484 = 0.0;
    if (!_1350)
    {
        _1484 = _1342;
    }
    float _1486 = _1484;
    bool _1488 = _830 == 0.0;
    bool _1490 = !_1482;
    bool _1492 = _1488 && _1490;
    float _1494 = exp2(_1358);
    bool _1496 = _834 == 0.0;
    bool _1498 = _1496 && _1492;
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1502 = _1486;
    if (_1370)
    {
        float _1504 = _1362 ? _1412 : _1352;
        _1416 = _1504;
    }
    float _1506 = _1416;
    if (_1350)
    {
        float _1508 = -_1342;
        float _1510 = _1508 + 1.0;
        _1418 = as_type<int>(_1510);
    }
    int _1512 = _1418;
    if (_1440)
    {
        float _1514 = -_1342;
        float _1516 = _1514 + 1.0;
        _1456 = as_type<int>(_1516);
    }
    int _1518 = _1456;
    float _1520 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1524 = _1500 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1526 = _1524;
    if (_1350)
    {
        float _1528 = _1462 ? as_type<float>(_1512) : _1342;
        _1502 = _1528;
    }
    float _1530 = _1502;
    float _1532 = _1520 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1440)
    {
        float _1534 = _1360 ? as_type<float>(_1518) : _1342;
        _1396 = _1534;
    }
    float _1536 = _1396;
    float _1538 = -_1494;
    float _1540 = _1538 + 1.0;
    float _1542 = in.m_69.x;
    float _1544 = in.m_69.y;
    float _1546 = in.m_69.z;
    float _1548 = in.m_69.w;
    float _1550 = 0.0;
    if (_1498)
    {
        _1550 = _1464;
    }
    float _1552 = _1550;
    float _1554 = 0.0;
    float _1556 = _1552;
    if (_1498)
    {
        _1554 = _1466;
    }
    float _1558 = _1554;
    out.m_71.x = _1436;
    out.m_71.y = _1524;
    out.m_71.z = _1532;
    out.m_71.w = _1522;
    float _1560 = _1558;
    if (_1498)
    {
        _1420 = _1552;
    }
    float _1562 = _1420;
    float _1564 = _1562;
    if (!_1498)
    {
        _1556 = _1464;
    }
    float _1566 = _1556;
    float _1568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    if (!_1498)
    {
        float _1570 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1566);
        _1564 = _1570;
    }
    float _1572 = _1564;
    float _1574 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1498)
    {
        _1526 = _1558;
    }
    float _1576 = _1526;
    float _1578 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1580 = _1576;
    if (!_1498)
    {
        _1560 = _1466;
    }
    float _1582 = _1560;
    float _1584 = _1574 * _1364;
    if (_1498)
    {
        _1458 = _1468;
    }
    float _1586 = _1458;
    float _1588 = _1586;
    if (!_1498)
    {
        float _1590 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1468);
        _1588 = _1590;
    }
    float _1592 = _1588;
    float _1594 = _1530 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_1498)
    {
        float _1596 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1582);
        _1580 = _1596;
    }
    float _1598 = _1580;
    float _1600 = _1470 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1602 = _1578 * _1432;
    float _1604 = _1594 * _1346;
    float _1606 = _1546 * _1566;
    float _1608 = _1600 * _1446;
    float _1610 = _1536 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1612 = _1544 * _1468;
    float _1614 = _1542 * _1582;
    float _1616 = -_1606;
    float _1618 = fma(_1542, _1468, _1616);
    out.m_73.x = _1602;
    out.m_73.y = _1608;
    out.m_73.z = _1604;
    out.m_73.w = _1584;
    float _1620 = _1610 * _1568;
    float _1622 = -_1612;
    float _1624 = fma(_1546, _1582, _1622);
    float _1626 = _1448 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1628 = -_1614;
    float _1630 = fma(_1544, _1566, _1628);
    float _1632 = _1618 * _1548;
    float _1634 = -_1544;
    float _1636 = _908 * _1634;
    float _1638 = -_1598;
    float _1640 = _908 * _1638;
    float _1642 = _1626 * _1472;
    float _1644 = _1624 * _1548;
    float _1646 = fma(_918, _1542, _1636);
    float _1648 = fma(_918, _1572, _1640);
    float _1650 = -_1632;
    float _1652 = _908 * _1650;
    float _1654 = _1630 * _1548;
    float _1656 = _910 * _1598;
    float _1658 = _910 * _1544;
    float _1660 = _920 * _1544;
    float _1662 = _910 * _1632;
    float _1664 = fma(_924, _1572, _1656);
    float _1666 = fma(_924, _1542, _1658);
    float _1668 = fma(_936, _1542, _1660);
    float _1670 = fma(_924, _1644, _1662);
    float _1672 = fma(_928, _1592, _1664);
    float _1674 = fma(_928, _1546, _1666);
    float _1676 = fma(_922, _1546, _1646);
    out.m_75.x = _1620;
    out.m_75.y = _1642;
    float _1678 = fma(_944, _1546, _1668);
    float _1680 = _920 * _1598;
    float _1682 = fma(_922, _1592, _1648);
    float _1684 = _1672 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1686 = _920 * _1632;
    float _1688 = _1674 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1690 = fma(_918, _1644, _1652);
    float _1692 = fma(_928, _1654, _1670);
    float _1694 = _1672 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1696 = _1672 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1698 = _1674 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1700 = fma(_1682, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1684);
    float _1702 = _1674 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1704 = fma(_1682, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1696);
    float _1706 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1708 = fma(_1676, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1688);
    float _1710 = fma(_922, _1654, _1690);
    float _1712 = _1692 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1714 = fma(_1676, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1698);
    float _1716 = fma(_1676, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1702);
    float _1718 = fma(_936, _1572, _1680);
    float _1720 = fma(_936, _1644, _1686);
    float _1722 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1706);
    float _1724 = fma(_1710, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1712);
    float _1726 = _1692 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1728 = fma(_1678, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1714);
    float _1730 = fma(_1678, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1708);
    float _1732 = fma(_1678, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1716);
    float _1734 = fma(_944, _1592, _1718);
    float _1736 = fma(_944, _1654, _1720);
    float _1738 = _1692 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1740 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1742 = fma(_1710, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1726);
    float _1744 = _1294 + _1272;
    out.m_77.x = _1728;
    out.m_77.y = _1730;
    out.m_77.z = _1732;
    float _1746 = fma(_1682, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1694);
    float _1748 = fma(_1710, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1738);
    float _1750 = _1272 * 0.5;
    float _1752 = fma(_1736, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1742);
    float _1754 = _1744 * 0.5;
    float _1756 = fma(_1734, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1700);
    float _1758 = fma(_1734, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1704);
    float _1760 = fma(_1736, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1724);
    float _1762 = fma(_1736, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1748);
    float _1764 = fma(_1302, -0.5, _1750);
    float _1766 = fma(_1734, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1746);
    bool _1768 = _1082 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1770 = isnan(_1082);
    bool _1772 = _1768 || _1770;
    bool _1774 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1776 = _1772 || _1774;
    float _1778 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1722);
    out.m_79.x = _1752;
    out.m_79.y = _1760;
    out.m_79.z = _1762;
    float _1780 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1778);
    out.m_63.y = _1764;
    out.m_81.x = _1756;
    out.m_81.y = _1758;
    out.m_81.z = _1766;
    float _1782 = _1728;
    float _1784 = _1754;
    float _1786 = _1780;
    if (!_1776)
    {
        _1782 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1788 = _1782;
    out.gl_Position.x = _1294;
    out.gl_Position.y = _1302;
    out.gl_Position.z = _1780;
    out.gl_Position.w = _1272;
    out.m_63.x = _1754;
    float _1790 = _1788;
    float _1792 = _1788;
    if (!_1776)
    {
        _1784 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1794 = _1784;
    float _1796 = _1794;
    float _1798 = _1794;
    if (!_1776)
    {
        _1376 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1800 = _1376;
    float _1802 = _1800;
    float _1804 = _1800;
    if (!_1776)
    {
        _1786 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1806 = _1786;
    float _1808 = _1806;
    float _1810 = _1806;
    if (!_1776)
    {
        _1378 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1812 = _1378;
    float _1814 = _1812;
    float _1816 = _1812;
    if (!_1776)
    {
        _1380 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1818 = _1380;
    float _1820 = _1740 * _1326;
    float _1822 = -_1740;
    float _1824 = _1822 + 1.0;
    float _1826 = _1336 * _1820;
    float _1828 = _1338 * _1820;
    float _1830 = _1340 * _1820;
    out.m_83.x = _1826;
    out.m_83.y = _1828;
    out.m_83.z = _1830;
    out.m_83.w = _1824;
    bool _1832 = !_1776;
    float _1834 = _1818;
    float _1836 = _1818;
    if (!_1832)
    {
        bool _1838 = _1082 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1840 = isnan(_1082);
        bool _1842 = _1838 || _1840;
        bool _1844 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1846 = _1842 || _1844;
        if (!_1846)
        {
            float _1848 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1850 = _1082 + _1848;
            float _1852 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1854 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1852;
            float _1856 = 1.0 / _1854;
            float _1858 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1860 = _1858 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1862 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1864 = _1862 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1866 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1868 = _1866 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1872 = _1870 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1874 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1876 = _1874 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1878 = _1850 * _1856;
            float _1880 = precise::clamp(_1878, 0.0, 1.0);
            float _1882 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1884 = _1882 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1886 = fma(_1880, _1860, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1888 = fma(_1880, _1884, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1890 = fma(_1880, _1864, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1892 = fma(_1880, _1868, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1894 = fma(_1880, _1872, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1896 = fma(_1880, _1876, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1792 = _1888;
            _1816 = _1894;
            _1798 = _1886;
            _1810 = _1892;
            _1804 = _1890;
            _1836 = _1896;
            _1898 = true;
        }
        else
        {
            bool _1900 = _1082 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1902 = isnan(_1082);
            bool _1904 = _1900 || _1902;
            bool _1906 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1908 = _1904 || _1906;
            if (!_1908)
            {
                _1796 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1910 = _1796;
            _1798 = _1910;
            if (!_1908)
            {
                _1790 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1912 = _1790;
            _1792 = _1912;
            if (!_1908)
            {
                _1802 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1914 = _1802;
            _1804 = _1914;
            if (!_1908)
            {
                _1808 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1916 = _1808;
            _1810 = _1916;
            if (!_1908)
            {
                _1814 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1918 = _1814;
            _1816 = _1918;
            if (!_1908)
            {
                _1834 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1920 = _1834;
            bool _1922 = !_1908;
            _1836 = _1920;
            if (!_1922)
            {
                bool _1924 = _1082 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1926 = isnan(_1082);
                bool _1928 = _1924 || _1926;
                bool _1930 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1932 = _1928 || _1930;
                if (!_1932)
                {
                    float _1934 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1936 = _1082 + _1934;
                    float _1938 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1940 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1938;
                    float _1942 = 1.0 / _1940;
                    float _1944 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1946 = _1944 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1948 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1950 = _1948 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1952 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1954 = _1952 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1956 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1958 = _1956 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1960 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1962 = _1960 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1964 = _1936 * _1942;
                    float _1966 = precise::clamp(_1964, 0.0, 1.0);
                    float _1968 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1970 = _1968 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1972 = fma(_1966, _1946, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1974 = fma(_1966, _1970, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1976 = fma(_1966, _1950, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1978 = fma(_1966, _1954, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1980 = fma(_1966, _1958, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1982 = fma(_1966, _1962, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1792 = _1974;
                    _1816 = _1980;
                    _1798 = _1972;
                    _1810 = _1978;
                    _1804 = _1976;
                    _1836 = _1982;
                    _1898 = true;
                }
                else
                {
                    _1792 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1816 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1798 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1810 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1804 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1836 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1898 = false;
    float _1984 = _1792;
    float _1986 = _1816;
    float _1988 = _1798;
    float _1990 = _1810;
    float _1992 = _1804;
    float _1994 = _1836;
    float _1996 = fma(_1758, -0.5, 0.5);
    float _1998 = precise::clamp(_1996, 0.0, 1.0);
    float _2000 = -_1984;
    float _2002 = _2000 + _1986;
    float _2004 = -_1988;
    float _2006 = _2004 + _1990;
    float _2008 = -_1992;
    float _2010 = _2008 + _1994;
    bool _2012 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2014 = fma(_1998, _2002, _1984);
    float _2016 = fma(_1998, _2006, _1988);
    float _2018 = fma(_1998, _2010, _1992);
    float _2020 = _2014 * 0.586610972881317138671875;
    out.m_45.x = 1.0;
    float _2022 = fma(_2016, 0.298911988735198974609375, _2020);
    out.m_85.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2024 = fma(_2018, 0.114477999508380889892578125, _2022);
    out.m_87.x = 0.0;
    float _2026 = -_2024;
    float _2028 = _2016 + _2026;
    float _2030 = -_2024;
    float _2032 = _2014 + _2030;
    float _2034 = -_2024;
    float _2036 = _2018 + _2034;
    float _2038 = fma(_2028, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2024);
    float _2040 = fma(_2032, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2024);
    float _2042 = fma(_2036, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2024);
    out.m_89.x = _2038;
    out.m_89.y = _2040;
    out.m_89.z = _2042;
    if (!_2012)
    {
        return out;
    }
    float _2044 = -_1052;
    float _2046 = _2044 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2048 = -_1056;
    float _2050 = _2048 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2052 = -_1060;
    float _2054 = _2052 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2056 = _2046 * _2046;
    float _2058 = fma(_2050, _2050, _2056);
    float _2060 = fma(_2054, _2054, _2058);
    float _2062 = sqrt(_2060);
    float _2064 = rsqrt(_2060);
    float _2066 = -_2062;
    float _2068 = _2066 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2070 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2072 = precise::clamp(_2070, 0.0, 1.0);
    float _2074 = _2050 * _2064;
    float _2076 = _2046 * _2064;
    float _2078 = abs(_2072);
    float _2080 = log2(_2078);
    float _2082 = _2054 * _2064;
    float _2084 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2086 = _1758 * _2076;
    float _2088 = -_2076;
    float _2090 = -_2084;
    float _2092 = fma(_2088, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2090);
    float _2094 = fma(_1756, _2074, _2086);
    float _2096 = -_2082;
    float _2098 = fma(_2096, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2092);
    float _2100 = fma(_1766, _2082, _2094);
    float _2102 = precise::clamp(_2100, 0.0, 1.0);
    float _2104 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2106 = _2098 + _2104;
    float _2108 = _2080 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2110 = _2106 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2112 = precise::clamp(_2110, 0.0, 1.0);
    float _2114 = exp2(_2108);
    float _2116 = _2114 * _2112;
    float _2118 = _2102 * _2116;
    float _2120 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2122 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2124 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2120;
    out.m_87.y = _2122;
    out.m_87.z = _2124;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1898 = false;
    bool _306 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_42.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_108);
    float _118 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _114;
    if (!_112)
    {
        out.m_45.x = 0.0;
    }
    int _122 = 0;
    if (!_112)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2181 = as_type<float>(_126);
        out.gl_Position.z = _2181;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_47.w;
    float _130 = float(_108);
    float _132 = 1.0 / _130;
    float _134 = -_128;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_128);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = _136 * _132;
    bool _150 = _136 >= _130;
    bool _152 = !_146;
    bool _154 = _150 || _152;
    out.m_49.x = _148;
    float _156 = _136;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _116;
    if (_154)
    {
        out.m_45.x = 0.0;
    }
    int _160 = 0;
    if (_154)
    {
        float _162 = _158 * 5.0;
        _160 = as_type<int>(_162);
    }
    int _164 = _160;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2252 = as_type<float>(_164);
        out.gl_Position.z = _2252;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _166 = in.m_51.w;
    float _168 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _170 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _172 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _174 = _170 || _172;
    bool _176 = isnan(1.0);
    bool _178 = _174 || _176;
    float _180 = in.m_47.x;
    float _182 = in.m_47.y;
    float _184 = in.m_47.z;
    float _186 = in.m_42.x;
    float _188 = in.m_42.y;
    float _190 = in.m_42.z;
    float _192 = _168;
    if (!_178)
    {
        float _194 = _168 * _168;
        float _196 = _194 * 0.5;
        _118 = _196;
    }
    float _198 = _118;
    float _200 = _198;
    if (!_178)
    {
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _202;
    }
    float _204 = _200;
    bool _206 = !_178;
    float _208 = _204;
    if (!_206)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = _168 * _212;
        float _222 = 1.0 / _216;
        float _224 = _218 * 0.693147182464599609375;
        float _226 = exp2(_220);
        float _228 = 1.0 / _224;
        float _230 = _226 + (-1.0);
        float _232 = -_230;
        float _234 = fma(_232, _228, _168);
        float _236 = _234 * _222;
        float _238 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _238;
    }
    float _240 = _208;
    bool _242 = !_178;
    if (!_242)
    {
        float _244 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _246 = log2(_244);
        float _248 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _250 = _248 + 1.0;
        float _252 = 1.0 / _250;
        float _254 = _168 * _246;
        float _256 = exp2(_254);
        float _258 = -_256;
        float _260 = _258 + 1.0;
        float _262 = _260 * _252;
        _192 = _262;
    }
    float _264 = _192;
    bool _266 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _268 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _270 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _272 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _274 = fma(_264, _180, _268);
    float _276 = fma(_264, _182, _270);
    float _278 = fma(_264, _184, _272);
    float _280 = fma(_274, _166, _186);
    float _282 = fma(_276, _166, _188);
    float _284 = fma(_278, _166, _190);
    bool _286 = !_266;
    float _304;
    if (!_286)
    {
        float _288 = in.m_53.x;
        float _290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _292 = _288 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _296 = _294 * _290;
        float _298 = floor(_296);
        float _300 = -_298;
        float _302 = _296 + _300;
        _304 = _302;
        _306 = true;
    }
    else
    {
        _304 = _148;
    }
    _306 = false;
    float _308 = _304;
    float _310 = in.m_53.z;
    float _312 = in.m_53.w;
    float _314 = _282 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _316 = _282 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _318 = in.m_53.x;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _328 = in.m_53.y;
    float _330 = 1.0 / _322;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _332;
    float _336 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[4].x, _314);
    int _338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _340 = _338 != 0;
    int _342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _344 = _342 != 0;
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _348 = _346 != 0;
    float _350 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].z, _336);
    float _352 = 1.0 / _326;
    float _354 = _282 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _356 = _350 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _358 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[5].x, _354);
    float _360 = _310 * 2.0;
    float _362 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[6].x, _316);
    float _364 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _366 = log2(_364);
    float _368 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].z, _358);
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _372 = _308 + _370;
    float _374 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].z, _362);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _378 = _308 + _376;
    float _380 = _368 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _382 = _372 * _330;
    float _384 = _328 * 2.0;
    float _386 = floor(_360);
    float _388 = _378 * _352;
    float _390 = _328 + _310;
    float _392 = _318 + _328;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _394;
    float _398 = _390 + (-1.0);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _404 = 1.0 / _334;
    float _406 = _366 * _136;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _410 = _308 + _408;
    float _412 = _392 + (-1.0);
    float _414 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _416 = _380 + _414;
    float _418 = fma(_402, _388, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = _374 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _422 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _424 = _386 > 0.0;
    float _426 = _318 * 2.0;
    bool _428 = _386 >= 0.0;
    bool _430 = isnan(_386);
    bool _432 = _428 || _430;
    bool _434 = isnan(0.0);
    bool _436 = _432 || _434;
    float _438 = exp2(_406);
    float _440 = fma(_396, _382, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _442 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _444 = _420 + _442;
    int _446 = _436 ? 0 : 1;
    float _448 = _410 * _404;
    bool _450 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _452 = isnan(_308);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = floor(_426);
    int _464 = ~_446;
    int _466 = _464 + 1;
    int _468 = _466 + 1;
    int _470 = _468;
    float _472 = _380;
    int _474 = as_type<int>(_318);
    if (!_424)
    {
        int _476 = ~_446;
        int _478 = _476 + 1;
        _470 = _478;
    }
    int _480 = _470;
    float _482 = floor(_384);
    float _484 = _318 + _310;
    float _486 = -_438;
    float _488 = _486 + 1.0;
    float _490 = _484 + (-1.0);
    bool _492 = _462 >= 0.0;
    bool _494 = isnan(_462);
    bool _496 = _492 || _494;
    bool _498 = isnan(0.0);
    bool _500 = _496 || _498;
    float _502 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _506 = 1.0 + _504;
    bool _508 = _462 > 0.0;
    float _510 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _512 = _500 ? 0 : 1;
    bool _514 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _516 = isnan(0.0);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _522 = _518 || _520;
    float _524 = 1.0 / _506;
    bool _526 = _482 > 0.0;
    float _528 = _522 ? _488 : 0.0;
    bool _530 = _482 >= 0.0;
    bool _532 = isnan(_482);
    bool _534 = _530 || _532;
    bool _536 = isnan(0.0);
    bool _538 = _534 || _536;
    bool _540 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _542 = isnan(1.0);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _548 = _544 || _546;
    int _550 = ~_512;
    int _552 = _550 + 1;
    int _554 = _552 + 1;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _556;
    int _560 = _554;
    bool _562 = _526;
    if (!_508)
    {
        int _564 = ~_512;
        int _566 = _564 + 1;
        _560 = _566;
    }
    int _568 = _560;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _578 = !_340;
    int _580 = _578 ? 0 : 1;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _582;
    float _586 = fma(_572, _388, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _588 = fma(_576, _388, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _590 = abs(_580);
    float _592 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _594 = _356 + _592;
    float _596 = _416 * _416;
    if (_548)
    {
        float _598 = _528 * _524;
        _156 = _598;
    }
    float _600 = _156;
    float _602 = fma(_558, _382, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _604 = in.m_55.x;
    float _606 = in.m_55.y;
    float _608 = in.m_55.z;
    float _610 = fma(_584, _382, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _612 = !_344;
    int _614 = _612 ? 0 : 1;
    float _616 = fma(_594, _594, _596);
    int _618 = _538 ? 0 : 1;
    int _620 = abs(_614);
    float _622 = fma(_444, _444, _616);
    float _624 = float(_568);
    float _626 = float(_620);
    float _628 = rsqrt(_622);
    int _630 = ~_618;
    int _632 = _630 + 1;
    int _634 = _632 + 1;
    float _636 = float(_590);
    float _638 = float(_480);
    int _640 = _634;
    if (!_526)
    {
        int _642 = ~_618;
        int _644 = _642 + 1;
        _640 = _644;
    }
    int _646 = _640;
    float _648 = _626 * _624;
    bool _650 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _652 = isnan(_308);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = -_460;
    float _664 = _662 + 1.0;
    bool _666 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _668 = isnan(_308);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = _648 * (-2.0);
    float _680 = _636 * _638;
    float _682 = _660 * _664;
    float _684 = -_660;
    float _686 = _684 + 1.0;
    bool _688 = !_348;
    int _690 = _688 ? 0 : 1;
    float _692 = fma(_502, _678, _502);
    float _694 = fma(_678, _606, _606);
    float _696 = _594 * _628;
    int _698 = abs(_690);
    float _700 = _416 * _628;
    float _702 = _676 * _686;
    bool _704 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _706 = isnan(_308);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = -_676;
    float _718 = _716 + 1.0;
    float _720 = -_700;
    float _722 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[18].w, _416);
    float _724 = -_696;
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _594);
    float _728 = _444 * _628;
    float _730 = _722 * _722;
    float _732 = float(_646);
    float _734 = -_728;
    float _736 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[18].w, _444);
    float _738 = _328 + (-0.5);
    float _740 = fma(_726, _726, _730);
    float _742 = float(_698);
    float _744 = _714 * _718;
    float _746 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[196].y, _694);
    float _748 = fma(_736, _736, _740);
    float _750 = _680 * (-2.0);
    float _752 = _742 * _732;
    float _754 = fma(_692, _600, _746);
    float _756 = _602 * _744;
    float _758 = fma(_422, _750, _422);
    float _760 = _752 * (-2.0);
    float _762 = fma(_750, _604, _604);
    float _764 = _318 + (-0.5);
    float _766 = _440 * _744;
    float _768 = fma(_760, _608, _608);
    float _770 = _310 + (-0.5);
    float _772 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[196].x, _762);
    float _774 = -_714;
    float _776 = _774 + 1.0;
    float _778 = _610 * _744;
    float _780 = fma(_510, _760, _510);
    float _782 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[196].z, _768);
    float _784 = fma(_758, _600, _772);
    float _786 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[143].x, _756);
    float _788 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[143].y, _766);
    float _790 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[143].z, _778);
    float _792 = sqrt(_748);
    float _794 = fma(_780, _600, _782);
    float _796 = fma(_418, _702, _788);
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _798;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _802;
    float _806 = fma(_588, _702, _790);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _808;
    float _812 = _784 * 0.15915493667125701904296875;
    float _814 = fma(_800, _448, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _816 = in.m_51.x;
    float _818 = in.m_51.y;
    float _820 = in.m_51.z;
    float _822 = fma(_804, _448, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _824 = fma(_810, _448, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _826 = fma(_586, _702, _786);
    float _828 = _754 * 0.15915493667125701904296875;
    float _830 = in.m_57.x;
    float _832 = in.m_57.y;
    float _834 = in.m_57.z;
    float _836 = _794 * 0.15915493667125701904296875;
    float _838 = fma(_822, _682, _796);
    float _840 = fma(_824, _682, _806);
    float _842 = fma(_814, _682, _826);
    float _844 = _812 * 6.283185482025146484375;
    float _846 = cos(_844);
    float _848 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[146].y, _838);
    float _850 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[146].z, _840);
    float _852 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[146].x, _842);
    float _854 = _628 * _792;
    float _856 = _828 * 6.283185482025146484375;
    float _858 = sin(_856);
    float _860 = _848 * _818;
    float _862 = _852 * _816;
    float _864 = _828 * 6.283185482025146484375;
    float _866 = cos(_864);
    float _868 = _860 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _870 = _850 * _820;
    float _872 = _862 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _874 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _832);
    float _876 = _854 * _868;
    float _878 = _836 * 6.283185482025146484375;
    float _880 = cos(_878);
    float _882 = _870 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _884 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _830);
    float _886 = _854 * _872;
    float _888 = _874 * _876;
    float _890 = _846 * _858;
    float _892 = _854 * _882;
    float _894 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _834);
    float _896 = _812 * 6.283185482025146484375;
    float _898 = sin(_896);
    float _900 = _846 * _866;
    float _902 = _884 * _886;
    float _904 = _894 * _892;
    float _906 = _836 * 6.283185482025146484375;
    float _908 = sin(_906);
    float _910 = _846 * _880;
    float _912 = _910 * _888;
    float _914 = _898 * _858;
    float _916 = _898 * _866;
    float _918 = _866 * _880;
    float _920 = _898 * _880;
    float _922 = _858 * _880;
    float _924 = fma(_908, _900, _914);
    float _926 = -_916;
    float _928 = fma(_908, _890, _926);
    float _930 = -_888;
    float _932 = _908 * _930;
    float _934 = -_890;
    float _936 = fma(_908, _916, _934);
    float _938 = fma(_924, _902, _912);
    float _940 = _920 * _888;
    float _942 = fma(_918, _902, _932);
    float _944 = fma(_908, _914, _900);
    float _946 = fma(_928, _904, _938);
    float _948 = fma(_936, _902, _940);
    float _950 = fma(_922, _904, _942);
    float _952 = _946 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _954 = fma(_944, _904, _948);
    float _956 = _946 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _958 = fma(_950, (*spvDescriptorSet0.vp_c10)._m0[10].x, _952);
    float _960 = fma(_950, (*spvDescriptorSet0.vp_c10)._m0[8].x, _956);
    float _962 = fma(_954, (*spvDescriptorSet0.vp_c10)._m0[10].z, _958);
    float _964 = fma(_954, (*spvDescriptorSet0.vp_c10)._m0[8].z, _960);
    float _966 = _946 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _968 = _420 + _962;
    float _970 = _356 + _964;
    float _972 = fma(_950, (*spvDescriptorSet0.vp_c10)._m0[9].x, _966);
    float _974 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _976 = _968 + _974;
    float _978 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _980 = _970 + _978;
    float _982 = fma(_954, (*spvDescriptorSet0.vp_c10)._m0[9].z, _972);
    float _984 = _976 * _976;
    float _986 = _380 + _982;
    float _988 = fma(_980, _980, _984);
    float _990 = sqrt(_988);
    bool _992 = _990 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _994 = _984;
    float _996 = _970;
    if (!_992)
    {
        _472 = _968;
    }
    float _998 = _472;
    float _1000 = _998;
    if (!_992)
    {
        _994 = _986;
    }
    float _1002 = _994;
    bool _1004 = !_992;
    float _1006 = _1002;
    if (!_1004)
    {
        float _1008 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1010 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1012 = _990 + _1010;
        float _1014 = _986 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1016 = rsqrt(_988);
        float _1018 = _1012 * _1008;
        float _1020 = _1018 * 0.15915493667125701904296875;
        float _1022 = _1020 * 6.283185482025146484375;
        float _1024 = sin(_1022);
        float _1026 = _1020 * 6.283185482025146484375;
        float _1028 = cos(_1026);
        float _1030 = fma(_1024, _1014, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1032 = _1016 * _1030;
        float _1034 = _1028 + (-1.0);
        float _1036 = fma(_980, _1032, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1038 = fma(_976, _1032, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1040 = _1034 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1042 = fma(_986, _1028, _1040);
        _1006 = _1042;
        _996 = _1036;
        _1000 = _1038;
    }
    float _1044 = _1006;
    float _1046 = _996;
    float _1048 = _1000;
    float _1050 = -_700;
    float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1044);
    float _1054 = -_696;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1046);
    float _1058 = -_728;
    float _1060 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1048);
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1064 = _1052 + _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1068 = _1056 + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1072 = _1060 + _1070;
    float _1074 = _1064 * _1064;
    float _1076 = fma(_1068, _1068, _1074);
    float _1078 = fma(_1072, _1072, _1076);
    float _1080 = rsqrt(_1078);
    float _1082 = sqrt(_1078);
    float _1084 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1086 = _1068 * _1084;
    float _1088 = _1072 * _1084;
    float _1090 = _1086 * _1086;
    float _1092 = _1088 * _1088;
    float _1094 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1096 = _1090 + _1092;
    float _1098 = precise::max(0.0, _1094);
    float _1100 = sqrt(_1096);
    float _1102 = -_1084;
    float _1104 = -_1098;
    float _1106 = fma(_1064, _1102, _1104);
    bool _1108 = _1100 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1110 = _1064;
    float _1112 = _1072;
    float _1114 = _1098;
    float _1116 = _1090;
    float _1118 = _1092;
    if (!_1108)
    {
        _1110 = _1086;
    }
    float _1120 = _1110;
    float _1122 = _1120;
    if (!_1108)
    {
        _1112 = _1106;
    }
    float _1124 = _1112;
    float _1126 = _1124;
    if (!_1108)
    {
        _1114 = _1088;
    }
    float _1128 = _1114;
    bool _1130 = !_1108;
    float _1132 = _1128;
    if (!_1130)
    {
        float _1134 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1136 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1138 = _1100 + _1136;
        float _1140 = _1106 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1142 = rsqrt(_1096);
        float _1144 = _1138 * _1134;
        float _1146 = _1144 * 0.15915493667125701904296875;
        float _1148 = _1146 * 6.283185482025146484375;
        float _1150 = sin(_1148);
        float _1152 = _1146 * 6.283185482025146484375;
        float _1154 = cos(_1152);
        float _1156 = fma(_1150, _1140, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1158 = _1142 * _1156;
        float _1160 = _1154 + (-1.0);
        float _1162 = _1086 * _1158;
        float _1164 = _1160 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1166 = _1088 * _1158;
        float _1168 = fma(_1106, _1154, _1164);
        float _1170 = _1162 * _1162;
        float _1172 = _1166 * _1166;
        _1126 = _1168;
        _1116 = _1170;
        _1118 = _1172;
        _1122 = _1162;
        _1132 = _1166;
    }
    float _1174 = _1126;
    float _1176 = _1116;
    float _1178 = _1118;
    float _1180 = _1122;
    float _1182 = _1132;
    float _1184 = fma(_1174, _1174, _1176);
    float _1186 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1188 = _1184 + _1178;
    float _1190 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1186);
    float _1192 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1194 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1196 = fma(_1082, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1194);
    float _1198 = precise::clamp(_1196, 0.0, 1.0);
    float _1200 = rsqrt(_1188);
    float _1202 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1190);
    float _1204 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1206 = -_1198;
    float _1208 = _1206 + 1.0;
    float _1210 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1192);
    float _1212 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1214 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1204);
    float _1216 = abs(_1208);
    float _1218 = log2(_1216);
    float _1220 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1210);
    float _1222 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1214);
    float _1224 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1212);
    float _1226 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1228 = _1220 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1230 = _1222 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1232 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1224);
    float _1234 = _1200 * _1180;
    float _1236 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1238 = _1200 * _1174;
    float _1240 = _1200 * _1182;
    float _1242 = _1234 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1244 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1236);
    float _1246 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1248 = _1226 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1250 = -_1242;
    float _1252 = fma(_1238, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1250);
    float _1254 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1256 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1258 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1244);
    float _1260 = -_1240;
    float _1262 = fma(_1260, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1252);
    float _1264 = -_1248;
    float _1266 = fma(_1246, _1264, 1.0);
    float _1268 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1270 = exp2(_1256);
    float _1272 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1258);
    float _1274 = fma(_1262, -0.5, 0.5);
    float _1276 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1278 = fma(_1262, 0.5, 0.5);
    float _1280 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1268);
    float _1282 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1276);
    float _1284 = 1.0 / _1272;
    float _1286 = _1238 + 1.0;
    float _1288 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1280);
    float _1290 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1282);
    float _1292 = fma(_1278, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1294 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1288);
    float _1296 = log2(_1266);
    float _1298 = -_1238;
    float _1300 = fma(_1270, _1286, _1298);
    float _1302 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1290);
    float _1304 = fma(_1278, _1292, -0.212114393711090087890625);
    float _1306 = fma(_1300, 0.5, 0.5);
    float _1308 = fma(_1278, _1304, 1.570728778839111328125);
    float _1310 = sqrt(_1274);
    float _1312 = _1294 * _1284;
    float _1314 = _1302 * _1284;
    float _1316 = fma(_1312, 0.5, 0.5);
    float _1318 = fma(_1314, -0.5, 0.5);
    float _1320 = _1296 * 0.693147182464599609375;
    float _1322 = _1320 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1324 = _1310 * 0.636619746685028076171875;
    float3 _4068 = float3(_1316, _1318, _1322);
    float _1326 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4068, float3(0.0), isnan(_4068)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4068, float3(0.0), isnan(_4068)), level(0.0)).x;
    float _1328 = -_1308;
    float _1330 = fma(_1324, _1328, 1.0);
    float2 _4084 = float2(_1330, _1306);
    float3 _1334 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4084, float2(0.0), isnan(_4084)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4084, float2(0.0), isnan(_4084)), level(0.0)).xyz;
    float _1336 = _1334.x;
    float _1338 = _1334.y;
    float _1340 = _1334.z;
    float _1342 = in.m_59.x;
    bool _1344 = _310 > 0.5;
    float _1346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1350 = _1348 != 0;
    float _1352 = in.m_59.y;
    int _1354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1356 = _1354 != 0;
    float _1358 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1360 = _328 > 0.5;
    out.m_61.x = _1056;
    out.m_61.y = _1052;
    out.m_61.z = _1060;
    bool _1362 = _312 > 0.5;
    float _1364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_63.w = _1272;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1370 = _1368 != 0;
    float _1372 = _1318;
    float _1374 = _1308;
    float _1376 = _1272;
    float _1378 = _1302;
    float _1380 = _1294;
    if (_1350)
    {
        float _1382 = in.m_53.z;
        _1372 = _1382;
    }
    float _1384 = _1372;
    if (_1356)
    {
        bool _1386 = _318 > 0.5;
        _562 = _1386;
    }
    bool _1388 = _562;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1394 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1396 = _1342;
    if (_1356)
    {
        float _1398 = -_1342;
        float _1400 = _1398 + 1.0;
        _474 = as_type<int>(_1400);
    }
    int _1402 = _474;
    if (!_1356)
    {
        _1374 = _1342;
    }
    float _1404 = _1374;
    float _1406 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1408 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1410 = -_1352;
    float _1412 = _1410 + 1.0;
    float _1414 = _1404;
    float _1416 = _1352;
    int _1418 = as_type<int>(_1406);
    float _1420 = _1412;
    if (_1356)
    {
        float _1422 = _1388 ? as_type<float>(_1402) : _1342;
        _1414 = _1422;
    }
    float _1424 = _1414;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1430 = _1428 != 0;
    float _1432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1434 = _1344 ? as_type<int>(_1412) : as_type<int>(_1352);
    float _1436 = _1426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1440 = _1438 != 0;
    int _1442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1444 = _1442 != 0;
    float _1446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1448 = _1430 ? as_type<float>(_1434) : _1352;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1452 = _1360 ? as_type<int>(_1412) : as_type<int>(_1352);
    bool _1454 = _1430;
    int _1456 = as_type<int>(_1450);
    float _1458 = _1436;
    if (_1350)
    {
        bool _1460 = _1384 > 0.5;
        _1454 = _1460;
    }
    bool _1462 = _1454;
    float _1464 = in.m_65.x;
    float _1466 = in.m_65.y;
    float _1468 = in.m_65.z;
    float _1470 = _1444 ? as_type<float>(_1452) : _1352;
    float _1472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _1474 = _832 != 0.0;
    bool _1476 = isnan(_832);
    bool _1478 = _1474 || _1476;
    bool _1480 = isnan(0.0);
    bool _1482 = _1478 || _1480;
    out.m_67.x = _1394;
    out.m_67.y = _1406;
    out.m_67.z = _1408;
    out.m_67.w = _1450;
    float _1484 = 0.0;
    if (!_1350)
    {
        _1484 = _1342;
    }
    float _1486 = _1484;
    bool _1488 = _830 == 0.0;
    bool _1490 = !_1482;
    bool _1492 = _1488 && _1490;
    float _1494 = exp2(_1358);
    bool _1496 = _834 == 0.0;
    bool _1498 = _1496 && _1492;
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1502 = _1486;
    if (_1370)
    {
        float _1504 = _1362 ? _1412 : _1352;
        _1416 = _1504;
    }
    float _1506 = _1416;
    if (_1350)
    {
        float _1508 = -_1342;
        float _1510 = _1508 + 1.0;
        _1418 = as_type<int>(_1510);
    }
    int _1512 = _1418;
    if (_1440)
    {
        float _1514 = -_1342;
        float _1516 = _1514 + 1.0;
        _1456 = as_type<int>(_1516);
    }
    int _1518 = _1456;
    float _1520 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1524 = _1500 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1526 = _1524;
    if (_1350)
    {
        float _1528 = _1462 ? as_type<float>(_1512) : _1342;
        _1502 = _1528;
    }
    float _1530 = _1502;
    float _1532 = _1520 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1440)
    {
        float _1534 = _1360 ? as_type<float>(_1518) : _1342;
        _1396 = _1534;
    }
    float _1536 = _1396;
    float _1538 = -_1494;
    float _1540 = _1538 + 1.0;
    float _1542 = in.m_69.x;
    float _1544 = in.m_69.y;
    float _1546 = in.m_69.z;
    float _1548 = in.m_69.w;
    float _1550 = 0.0;
    if (_1498)
    {
        _1550 = _1464;
    }
    float _1552 = _1550;
    float _1554 = 0.0;
    float _1556 = _1552;
    if (_1498)
    {
        _1554 = _1466;
    }
    float _1558 = _1554;
    out.m_71.x = _1436;
    out.m_71.y = _1524;
    out.m_71.z = _1532;
    out.m_71.w = _1522;
    float _1560 = _1558;
    if (_1498)
    {
        _1420 = _1552;
    }
    float _1562 = _1420;
    float _1564 = _1562;
    if (!_1498)
    {
        _1556 = _1464;
    }
    float _1566 = _1556;
    float _1568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    if (!_1498)
    {
        float _1570 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1566);
        _1564 = _1570;
    }
    float _1572 = _1564;
    float _1574 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1498)
    {
        _1526 = _1558;
    }
    float _1576 = _1526;
    float _1578 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1580 = _1576;
    if (!_1498)
    {
        _1560 = _1466;
    }
    float _1582 = _1560;
    float _1584 = _1574 * _1364;
    if (_1498)
    {
        _1458 = _1468;
    }
    float _1586 = _1458;
    float _1588 = _1586;
    if (!_1498)
    {
        float _1590 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1468);
        _1588 = _1590;
    }
    float _1592 = _1588;
    float _1594 = _1530 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_1498)
    {
        float _1596 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1582);
        _1580 = _1596;
    }
    float _1598 = _1580;
    float _1600 = _1470 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1602 = _1578 * _1432;
    float _1604 = _1594 * _1346;
    float _1606 = _1546 * _1566;
    float _1608 = _1600 * _1446;
    float _1610 = _1536 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1612 = _1544 * _1468;
    float _1614 = _1542 * _1582;
    float _1616 = -_1606;
    float _1618 = fma(_1542, _1468, _1616);
    out.m_73.x = _1602;
    out.m_73.y = _1608;
    out.m_73.z = _1604;
    out.m_73.w = _1584;
    float _1620 = _1610 * _1568;
    float _1622 = -_1612;
    float _1624 = fma(_1546, _1582, _1622);
    float _1626 = _1448 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1628 = -_1614;
    float _1630 = fma(_1544, _1566, _1628);
    float _1632 = _1618 * _1548;
    float _1634 = -_1544;
    float _1636 = _908 * _1634;
    float _1638 = -_1598;
    float _1640 = _908 * _1638;
    float _1642 = _1626 * _1472;
    float _1644 = _1624 * _1548;
    float _1646 = fma(_918, _1542, _1636);
    float _1648 = fma(_918, _1572, _1640);
    float _1650 = -_1632;
    float _1652 = _908 * _1650;
    float _1654 = _1630 * _1548;
    float _1656 = _910 * _1598;
    float _1658 = _910 * _1544;
    float _1660 = _920 * _1544;
    float _1662 = _910 * _1632;
    float _1664 = fma(_924, _1572, _1656);
    float _1666 = fma(_924, _1542, _1658);
    float _1668 = fma(_936, _1542, _1660);
    float _1670 = fma(_924, _1644, _1662);
    float _1672 = fma(_928, _1592, _1664);
    float _1674 = fma(_928, _1546, _1666);
    float _1676 = fma(_922, _1546, _1646);
    out.m_75.x = _1620;
    out.m_75.y = _1642;
    float _1678 = fma(_944, _1546, _1668);
    float _1680 = _920 * _1598;
    float _1682 = fma(_922, _1592, _1648);
    float _1684 = _1672 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1686 = _920 * _1632;
    float _1688 = _1674 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1690 = fma(_918, _1644, _1652);
    float _1692 = fma(_928, _1654, _1670);
    float _1694 = _1672 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1696 = _1672 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1698 = _1674 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1700 = fma(_1682, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1684);
    float _1702 = _1674 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1704 = fma(_1682, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1696);
    float _1706 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1708 = fma(_1676, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1688);
    float _1710 = fma(_922, _1654, _1690);
    float _1712 = _1692 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1714 = fma(_1676, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1698);
    float _1716 = fma(_1676, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1702);
    float _1718 = fma(_936, _1572, _1680);
    float _1720 = fma(_936, _1644, _1686);
    float _1722 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1706);
    float _1724 = fma(_1710, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1712);
    float _1726 = _1692 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1728 = fma(_1678, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1714);
    float _1730 = fma(_1678, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1708);
    float _1732 = fma(_1678, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1716);
    float _1734 = fma(_944, _1592, _1718);
    float _1736 = fma(_944, _1654, _1720);
    float _1738 = _1692 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1740 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1742 = fma(_1710, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1726);
    float _1744 = _1294 + _1272;
    out.m_77.x = _1728;
    out.m_77.y = _1730;
    out.m_77.z = _1732;
    float _1746 = fma(_1682, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1694);
    float _1748 = fma(_1710, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1738);
    float _1750 = _1272 * 0.5;
    float _1752 = fma(_1736, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1742);
    float _1754 = _1744 * 0.5;
    float _1756 = fma(_1734, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1700);
    float _1758 = fma(_1734, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1704);
    float _1760 = fma(_1736, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1724);
    float _1762 = fma(_1736, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1748);
    float _1764 = fma(_1302, -0.5, _1750);
    float _1766 = fma(_1734, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1746);
    bool _1768 = _1082 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1770 = isnan(_1082);
    bool _1772 = _1768 || _1770;
    bool _1774 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1776 = _1772 || _1774;
    float _1778 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1722);
    out.m_79.x = _1752;
    out.m_79.y = _1760;
    out.m_79.z = _1762;
    float _1780 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1778);
    out.m_63.y = _1764;
    out.m_81.x = _1756;
    out.m_81.y = _1758;
    out.m_81.z = _1766;
    float _1782 = _1728;
    float _1784 = _1754;
    float _1786 = _1780;
    if (!_1776)
    {
        _1782 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1788 = _1782;
    out.gl_Position.x = _1294;
    out.gl_Position.y = _1302;
    out.gl_Position.z = _1780;
    out.gl_Position.w = _1272;
    out.m_63.x = _1754;
    float _1790 = _1788;
    float _1792 = _1788;
    if (!_1776)
    {
        _1784 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1794 = _1784;
    float _1796 = _1794;
    float _1798 = _1794;
    if (!_1776)
    {
        _1376 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1800 = _1376;
    float _1802 = _1800;
    float _1804 = _1800;
    if (!_1776)
    {
        _1786 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1806 = _1786;
    float _1808 = _1806;
    float _1810 = _1806;
    if (!_1776)
    {
        _1378 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1812 = _1378;
    float _1814 = _1812;
    float _1816 = _1812;
    if (!_1776)
    {
        _1380 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1818 = _1380;
    float _1820 = _1740 * _1326;
    float _1822 = -_1740;
    float _1824 = _1822 + 1.0;
    float _1826 = _1336 * _1820;
    float _1828 = _1338 * _1820;
    float _1830 = _1340 * _1820;
    out.m_83.x = _1826;
    out.m_83.y = _1828;
    out.m_83.z = _1830;
    out.m_83.w = _1824;
    bool _1832 = !_1776;
    float _1834 = _1818;
    float _1836 = _1818;
    if (!_1832)
    {
        bool _1838 = _1082 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1840 = isnan(_1082);
        bool _1842 = _1838 || _1840;
        bool _1844 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1846 = _1842 || _1844;
        if (!_1846)
        {
            float _1848 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1850 = _1082 + _1848;
            float _1852 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1854 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1852;
            float _1856 = 1.0 / _1854;
            float _1858 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1860 = _1858 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1862 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1864 = _1862 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1866 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1868 = _1866 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1872 = _1870 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1874 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1876 = _1874 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1878 = _1850 * _1856;
            float _1880 = precise::clamp(_1878, 0.0, 1.0);
            float _1882 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1884 = _1882 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1886 = fma(_1880, _1860, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1888 = fma(_1880, _1884, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1890 = fma(_1880, _1864, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1892 = fma(_1880, _1868, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1894 = fma(_1880, _1872, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1896 = fma(_1880, _1876, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1792 = _1888;
            _1816 = _1894;
            _1798 = _1886;
            _1810 = _1892;
            _1804 = _1890;
            _1836 = _1896;
            _1898 = true;
        }
        else
        {
            bool _1900 = _1082 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1902 = isnan(_1082);
            bool _1904 = _1900 || _1902;
            bool _1906 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1908 = _1904 || _1906;
            if (!_1908)
            {
                _1796 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1910 = _1796;
            _1798 = _1910;
            if (!_1908)
            {
                _1790 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1912 = _1790;
            _1792 = _1912;
            if (!_1908)
            {
                _1802 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1914 = _1802;
            _1804 = _1914;
            if (!_1908)
            {
                _1808 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1916 = _1808;
            _1810 = _1916;
            if (!_1908)
            {
                _1814 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1918 = _1814;
            _1816 = _1918;
            if (!_1908)
            {
                _1834 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1920 = _1834;
            bool _1922 = !_1908;
            _1836 = _1920;
            if (!_1922)
            {
                bool _1924 = _1082 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1926 = isnan(_1082);
                bool _1928 = _1924 || _1926;
                bool _1930 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1932 = _1928 || _1930;
                if (!_1932)
                {
                    float _1934 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1936 = _1082 + _1934;
                    float _1938 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1940 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1938;
                    float _1942 = 1.0 / _1940;
                    float _1944 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1946 = _1944 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1948 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1950 = _1948 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1952 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1954 = _1952 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1956 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1958 = _1956 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1960 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1962 = _1960 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1964 = _1936 * _1942;
                    float _1966 = precise::clamp(_1964, 0.0, 1.0);
                    float _1968 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1970 = _1968 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1972 = fma(_1966, _1946, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1974 = fma(_1966, _1970, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1976 = fma(_1966, _1950, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1978 = fma(_1966, _1954, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1980 = fma(_1966, _1958, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1982 = fma(_1966, _1962, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1792 = _1974;
                    _1816 = _1980;
                    _1798 = _1972;
                    _1810 = _1978;
                    _1804 = _1976;
                    _1836 = _1982;
                    _1898 = true;
                }
                else
                {
                    _1792 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1816 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1798 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1810 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1804 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1836 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1898 = false;
    float _1984 = _1792;
    float _1986 = _1816;
    float _1988 = _1798;
    float _1990 = _1810;
    float _1992 = _1804;
    float _1994 = _1836;
    float _1996 = fma(_1758, -0.5, 0.5);
    float _1998 = precise::clamp(_1996, 0.0, 1.0);
    float _2000 = -_1984;
    float _2002 = _2000 + _1986;
    float _2004 = -_1988;
    float _2006 = _2004 + _1990;
    float _2008 = -_1992;
    float _2010 = _2008 + _1994;
    bool _2012 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2014 = fma(_1998, _2002, _1984);
    float _2016 = fma(_1998, _2006, _1988);
    float _2018 = fma(_1998, _2010, _1992);
    float _2020 = _2014 * 0.586610972881317138671875;
    out.m_45.x = 1.0;
    float _2022 = fma(_2016, 0.298911988735198974609375, _2020);
    out.m_85.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2024 = fma(_2018, 0.114477999508380889892578125, _2022);
    out.m_87.x = 0.0;
    float _2026 = -_2024;
    float _2028 = _2016 + _2026;
    float _2030 = -_2024;
    float _2032 = _2014 + _2030;
    float _2034 = -_2024;
    float _2036 = _2018 + _2034;
    float _2038 = fma(_2028, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2024);
    float _2040 = fma(_2032, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2024);
    float _2042 = fma(_2036, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2024);
    out.m_89.x = _2038;
    out.m_89.y = _2040;
    out.m_89.z = _2042;
    if (!_2012)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2044 = -_1052;
    float _2046 = _2044 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2048 = -_1056;
    float _2050 = _2048 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2052 = -_1060;
    float _2054 = _2052 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2056 = _2046 * _2046;
    float _2058 = fma(_2050, _2050, _2056);
    float _2060 = fma(_2054, _2054, _2058);
    float _2062 = sqrt(_2060);
    float _2064 = rsqrt(_2060);
    float _2066 = -_2062;
    float _2068 = _2066 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2070 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2072 = precise::clamp(_2070, 0.0, 1.0);
    float _2074 = _2050 * _2064;
    float _2076 = _2046 * _2064;
    float _2078 = abs(_2072);
    float _2080 = log2(_2078);
    float _2082 = _2054 * _2064;
    float _2084 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2086 = _1758 * _2076;
    float _2088 = -_2076;
    float _2090 = -_2084;
    float _2092 = fma(_2088, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2090);
    float _2094 = fma(_1756, _2074, _2086);
    float _2096 = -_2082;
    float _2098 = fma(_2096, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2092);
    float _2100 = fma(_1766, _2082, _2094);
    float _2102 = precise::clamp(_2100, 0.0, 1.0);
    float _2104 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2106 = _2098 + _2104;
    float _2108 = _2080 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2110 = _2106 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2112 = precise::clamp(_2110, 0.0, 1.0);
    float _2114 = exp2(_2108);
    float _2116 = _2114 * _2112;
    float _2118 = _2102 * _2116;
    float _2120 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2122 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2124 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2120;
    out.m_87.y = _2122;
    out.m_87.z = _2124;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

