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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_81 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_97 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_79 [[user(locn5)]];
    float4 m_89 [[user(locn6)]];
    float4 m_85 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_73 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_95 [[user(locn11)]];
    float4 m_91 [[user(locn12)]];
    float4 m_93 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_75 [[attribute(9)]];
    float4 m_69 [[attribute(10)]];
    float4 m_59 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2279 = false;
    bool _218 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    float _126 = _124;
    if (!_120)
    {
        out.m_49.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _124 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2564 = as_type<float>(_132);
        out.gl_Position.z = _2564;
    }
    if (!_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _136 = in.m_51.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = _150;
    if (_146)
    {
        float _154 = float(_116);
        _126 = _154;
    }
    float _156 = _126;
    bool _158 = _150 >= _156;
    bool _160 = !_146;
    bool _162 = _158 || _160;
    float _164 = _156;
    if (_162)
    {
        _164 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _164;
    if (_162)
    {
        out.m_49.x = 0.0;
    }
    if (_162)
    {
        float _168 = _166 * 5.0;
        _134 = as_type<int>(_168);
    }
    int _170 = _134;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2634 = as_type<float>(_170);
        out.gl_Position.z = _2634;
    }
    if (_162)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _172 = in.m_53.x;
    float _174 = in.m_53.y;
    float _176 = in.m_53.z;
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _180 = _174 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _182 = _174 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _184 = _174 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _186 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].x, _180);
    float _188 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].x, _182);
    float _190 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].x, _184);
    float _192 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[4].z, _186);
    float _194 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[5].z, _188);
    float _196 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[6].z, _190);
    bool _198 = !_178;
    float _216;
    if (!_198)
    {
        float _200 = in.m_55.x;
        float _202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _204 = _200 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _206 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _208 = _206 * _202;
        float _210 = floor(_208);
        float _212 = -_210;
        float _214 = _208 + _212;
        _216 = _214;
        _218 = true;
    }
    else
    {
        float _220 = float(_116);
        float _222 = 1.0 / _220;
        float _224 = _150 * _222;
        _216 = _224;
    }
    _218 = false;
    float _226 = _216;
    float _228 = in.m_55.z;
    float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _232 = log2(_230);
    float _234 = in.m_55.x;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _242 = _240 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _246 = _244 != 0;
    int _248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _250 = _248 != 0;
    int _252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _254 = _252 != 0;
    float _256 = in.m_55.y;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _260 = _226 + _258;
    float _262 = 1.0 / _242;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _270 = _226 + _268;
    float _272 = _194 * _194;
    float _274 = in.m_57.y;
    float _276 = 1.0 / _238;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _282;
    float _286 = fma(_192, _192, _272);
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _290 = _288 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _296 = _228 * 2.0;
    float _298 = fma(_196, _196, _286);
    float _300 = _260 * _262;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _226 + _302;
    float _306 = _234 * 2.0;
    float _308 = floor(_296);
    float _310 = _234 + _228;
    float _312 = _256 * 2.0;
    float _314 = fma(_290, _300, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _316 = _304 * _276;
    float _318 = _256 + _228;
    float _320 = _310 + (-1.0);
    float _322 = floor(_306);
    float _324 = _318 + (-1.0);
    float _326 = fma(_280, _316, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _328 = fma(_284, _316, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _330 = fma(_294, _300, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _332 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _334 = _234 + _256;
    float _336 = floor(_312);
    float _338 = _232 * _150;
    float _340 = _334 + (-1.0);
    bool _342 = _308 >= 0.0;
    bool _344 = isnan(_308);
    bool _346 = _342 || _344;
    bool _348 = isnan(0.0);
    bool _350 = _346 || _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _352;
    bool _356 = _308 > 0.0;
    float _358 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _360 = exp2(_338);
    bool _362 = _322 >= 0.0;
    bool _364 = isnan(_322);
    bool _366 = _362 || _364;
    bool _368 = isnan(0.0);
    bool _370 = _366 || _368;
    float _372 = in.m_57.x;
    bool _374 = _322 > 0.0;
    int _376 = _370 ? 0 : 1;
    float _378 = 1.0 / _266;
    bool _380 = _336 > 0.0;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _382;
    float _386 = -_360;
    float _388 = _386 + 1.0;
    float _390 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _392 = _350 ? 0 : 1;
    float _394 = in.m_59.x;
    bool _396 = _336 >= 0.0;
    bool _398 = isnan(_336);
    bool _400 = _396 || _398;
    bool _402 = isnan(0.0);
    bool _404 = _400 || _402;
    float _406 = rsqrt(_298);
    int _408 = _404 ? 0 : 1;
    float _410 = _270 * _378;
    bool _412 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _414 = isnan(0.0);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _420 = _416 || _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _424 = 1.0 + _422;
    float _426 = fma(_354, _410, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _428 = _420 ? _388 : 0.0;
    float _430 = 1.0 / _424;
    bool _432 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _434 = isnan(1.0);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _440 = _436 || _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _442;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _450 = fma(_384, _410, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _452 = fma(_444, _316, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _454 = _226 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _456 = isnan(_226);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = fma(_448, _300, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _468 = fma(_234, 6.283185482025146484375, _150);
    float _470 = _192 * _406;
    float _472 = _194 * _406;
    float _474 = _468 * 0.15915493667125701904296875;
    float _476 = _196 * _406;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _478;
    float _482 = _332;
    float _484 = _390;
    int _486 = as_type<int>(_228);
    int _488 = as_type<int>(_256);
    if (_440)
    {
        float _490 = _428 * _430;
        _152 = _490;
    }
    float _492 = _152;
    bool _494 = _226 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _496 = isnan(_226);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = -_394;
    float _508 = _506 + 1.0;
    bool _510 = _372 >= 0.0;
    bool _512 = isnan(_372);
    bool _514 = _510 || _512;
    bool _516 = isnan(0.0);
    bool _518 = _514 || _516;
    float _520 = _474 * 6.283185482025146484375;
    float _522 = sin(_520);
    bool _524 = _226 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _526 = isnan(_226);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -_504;
    float _538 = _536 + 1.0;
    int _540 = _518 ? 0 : 1;
    float _542 = fma(_480, _410, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _544 = _372 > 0.0;
    float _546 = _464 * _538;
    float _548 = -_464;
    float _550 = _548 + 1.0;
    bool _552 = _226 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _554 = isnan(_226);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    int _564 = ~_540;
    int _566 = _564 + 1;
    int _568 = _566 + 1;
    float _570 = _534 * _550;
    float _572 = -_534;
    float _574 = _572 + 1.0;
    float _576 = _562 * _574;
    float _578 = -_562;
    float _580 = _578 + 1.0;
    int _582 = _568;
    float _584 = _394;
    if (!_544)
    {
        int _586 = ~_540;
        int _588 = _586 + 1;
        _582 = _588;
    }
    int _590 = _582;
    float _592 = _522 * 0.52359879016876220703125;
    float _594 = _326 * _576;
    float _596 = _452 * _576;
    float _598 = _328 * _576;
    float _600 = _508 * _592;
    float _602 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[143].x, _594);
    float _604 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[143].y, _596);
    float _606 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[143].z, _598);
    int _608 = ~_392;
    int _610 = _608 + 1;
    int _612 = _610 + 1;
    float _614 = fma(_314, _570, _602);
    int _616 = ~_376;
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    float _622 = fma(_330, _570, _606);
    int _624 = _612;
    int _626 = _620;
    if (!_356)
    {
        int _628 = ~_392;
        int _630 = _628 + 1;
        _624 = _630;
    }
    int _632 = _624;
    float _634 = fma(_466, _570, _604);
    if (!_374)
    {
        int _636 = ~_376;
        int _638 = _636 + 1;
        _626 = _638;
    }
    int _640 = _626;
    float _642 = fma(_542, _546, _614);
    bool _644 = !_246;
    int _646 = _644 ? 0 : 1;
    float _648 = fma(_426, _546, _634);
    bool _650 = !_250;
    int _652 = _650 ? 0 : 1;
    float _654 = fma(_450, _546, _622);
    bool _656 = !_254;
    int _658 = _656 ? 0 : 1;
    float _660 = _472 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _662 = abs(_646);
    int _664 = abs(_652);
    int _666 = abs(_658);
    float _668 = in.m_61.x;
    float _670 = in.m_61.y;
    float _672 = in.m_61.z;
    float _674 = float(_662);
    float _676 = float(_632);
    int _678 = ~_408;
    int _680 = _678 + 1;
    int _682 = _680 + 1;
    int _684 = _682;
    float _686 = as_type<float>(_640);
    if (!_380)
    {
        int _688 = ~_408;
        int _690 = _688 + 1;
        _684 = _690;
    }
    int _692 = _684;
    float _694 = _674 * _676;
    float _696 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[8].y, _660);
    float _698 = float(_590);
    float _700 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[146].x, _642);
    float _702 = _694 * (-2.0);
    float _704 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[146].z, _654);
    float _706 = float(_664);
    float _708 = _234 + (-0.5);
    float _710 = float(_640);
    float _712 = fma(_358, _702, _358);
    float _714 = float(_666);
    float _716 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[10].y, _696);
    float _718 = float(_692);
    float _720 = _706 * _710;
    float _722 = _698 * _600;
    float _724 = fma(_702, _668, _668);
    float _726 = _720 * (-2.0);
    float _728 = _714 * _718;
    float _730 = abs(_716);
    bool _732 = _730 > 0.99989998340606689453125;
    float _734 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[196].x, _724);
    float _736 = fma(_726, _670, _670);
    float _738 = _728 * (-2.0);
    float _740 = fma(_332, _726, _332);
    float _742 = fma(_712, _492, _734);
    float _744 = _722 * (-0.15915493667125701904296875);
    float _746 = fma(_738, _672, _672);
    float _748 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[146].y, _648);
    float _750 = _742 * 0.15915493667125701904296875;
    float _752 = _256 + (-0.5);
    float _754 = in.m_57.z;
    float _756 = _744 * 6.283185482025146484375;
    float _758 = sin(_756);
    float _760 = _728;
    if (_732)
    {
        _686 = 0.001000000047497451305389404296875;
    }
    float _762 = _686;
    float _764 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[196].y, _736);
    float _766 = in.m_63.x;
    float _768 = in.m_63.y;
    float _770 = in.m_63.z;
    if (!_732)
    {
        _760 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _772 = _760;
    float _774 = _772;
    if (_732)
    {
        float _776 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _774 = _776;
    }
    float _778 = _774;
    float _780 = fma(_390, _738, _390);
    float _782 = _744 * 6.283185482025146484375;
    float _784 = cos(_782);
    if (!_732)
    {
        _482 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _786 = _482;
    float _788 = _228 + (-0.5);
    float _790 = _786;
    if (!_732)
    {
        _484 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _792 = _484;
    float _794 = _792;
    if (_732)
    {
        float _796 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _794 = _796;
    }
    float _798 = _794;
    float _800 = _698 * 0.0500000007450580596923828125;
    float _802 = fma(_740, _492, _764);
    float _804 = _750 * 6.283185482025146484375;
    float _806 = sin(_804);
    float _808 = -_800;
    float _810 = _808 + _372;
    float _812 = _802 * 0.15915493667125701904296875;
    if (_732)
    {
        float _814 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _790 = _814;
    }
    float _816 = _790;
    float _818 = -_778;
    float _820 = _476 * _818;
    float _822 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[196].z, _746);
    float _824 = _754 + (-0.039999999105930328369140625);
    float _826 = _758 * _810;
    float _828 = -_798;
    float _830 = -_820;
    float _832 = fma(_470, _828, _830);
    float _834 = -_798;
    float _836 = _472 * _834;
    float _838 = fma(_780, _492, _822);
    float _840 = -_816;
    float _842 = _470 * _840;
    float _844 = _700 * _766;
    float _846 = -_816;
    float _848 = -_836;
    float _850 = fma(_476, _846, _848);
    float _852 = _832 * _832;
    float _854 = _784 * _810;
    float _856 = -_778;
    float _858 = -_842;
    float _860 = fma(_472, _856, _858);
    float _862 = -_826;
    float _864 = fma(_784, _824, _862);
    float _866 = fma(_850, _850, _852);
    float _868 = fma(_758, _824, _854);
    float _870 = _838 * 0.15915493667125701904296875;
    float _872 = _750 * 6.283185482025146484375;
    float _874 = cos(_872);
    float _876 = fma(_860, _860, _866);
    float _878 = _748 * _768;
    float _880 = _800 + _868;
    float _882 = _844 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _884 = _878 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _886 = _864 + 0.039999999105930328369140625;
    float _888 = _812 * 6.283185482025146484375;
    float _890 = sin(_888);
    float _892 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _880);
    float _894 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _274);
    float _896 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _886);
    float _898 = _892 * _882;
    float _900 = _894 * _884;
    float _902 = _812 * 6.283185482025146484375;
    float _904 = cos(_902);
    float _906 = _870 * 6.283185482025146484375;
    float _908 = cos(_906);
    float _910 = _704 * _770;
    float _912 = _806 * _890;
    float _914 = in.m_46.x;
    float _916 = in.m_46.y;
    float _918 = in.m_46.z;
    float _920 = rsqrt(_876);
    float _922 = _874 * _904;
    float _924 = _806 * _904;
    float _926 = _870 * 6.283185482025146484375;
    float _928 = sin(_926);
    float _930 = _874 * _908;
    float _932 = _806 * _908;
    float _934 = _860 * _920;
    float _936 = _874 * _890;
    float _938 = _904 * _908;
    float _940 = _890 * _908;
    float _942 = _832 * _920;
    float _944 = _850 * _920;
    float _946 = _916 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _948 = fma(_928, _922, _912);
    float _950 = -_924;
    float _952 = fma(_928, _936, _950);
    float _954 = fma(_928, _912, _922);
    float _956 = -_936;
    float _958 = fma(_928, _924, _956);
    float _960 = _910 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _962 = _472 * _934;
    float _964 = _470 * _930;
    float _966 = _948 * _470;
    float _968 = _470 * _952;
    float _970 = -_962;
    float _972 = fma(_476, _942, _970);
    float _974 = -_928;
    float _976 = fma(_974, _944, _964);
    float _978 = fma(_938, _944, _966);
    float _980 = fma(_940, _944, _968);
    float _982 = _896 * _960;
    float _984 = fma(_932, _972, _976);
    float _986 = fma(_958, _972, _978);
    float _988 = fma(_954, _972, _980);
    float _990 = _476 * _930;
    float _992 = _470 * _942;
    float _994 = _948 * _476;
    float _996 = _476 * _952;
    float _998 = -_928;
    float _1000 = fma(_998, _934, _990);
    float _1002 = -_992;
    float _1004 = fma(_472, _944, _1002);
    float _1006 = _916 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1008 = fma(_938, _934, _994);
    float _1010 = fma(_940, _934, _996);
    float _1012 = fma(_932, _1004, _1000);
    float _1014 = fma(_914, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1006);
    float _1016 = fma(_958, _1004, _1008);
    float _1018 = fma(_954, _1004, _1010);
    float _1020 = _900 * _1012;
    float _1022 = fma(_914, (*spvDescriptorSet0.vp_c10)._m0[4].x, _946);
    float _1024 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1014);
    float _1026 = _900 * _984;
    float _1028 = fma(_898, _1016, _1020);
    float _1030 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1022);
    float _1032 = _1024 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1034 = fma(_898, _986, _1026);
    float _1036 = fma(_982, _1018, _1028);
    float _1038 = _1030 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1040 = _476 * _944;
    float _1042 = fma(_982, _988, _1034);
    float _1044 = _1032 + _1036;
    float _1046 = _472 * _930;
    float _1048 = _948 * _472;
    float _1050 = _1038 + _1042;
    float _1052 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1054 = _1044 + _1052;
    float _1056 = -_928;
    float _1058 = fma(_1056, _942, _1046);
    float _1060 = -_1040;
    float _1062 = fma(_470, _934, _1060);
    float _1064 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1066 = _1050 + _1064;
    float _1068 = _1054 * _1054;
    float _1070 = _472 * _952;
    float _1072 = fma(_938, _942, _1048);
    float _1074 = fma(_932, _1062, _1058);
    float _1076 = fma(_1066, _1066, _1068);
    float _1078 = _916 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1080 = fma(_940, _942, _1070);
    float _1082 = sqrt(_1076);
    float _1084 = fma(_958, _1062, _1072);
    float _1086 = _900 * _1074;
    float _1088 = fma(_914, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1078);
    bool _1090 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1092 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1094 = _1090 || _1092;
    bool _1096 = isnan(0.5);
    bool _1098 = _1094 || _1096;
    float _1100 = fma(_954, _1062, _1080);
    float _1102 = fma(_898, _1084, _1086);
    float _1104 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1088);
    float _1106 = fma(_982, _1100, _1102);
    float _1108 = _1104 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1110 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan(0.5);
    bool _1118 = _1114 || _1116;
    float _1120 = _1108 + _1106;
    bool _1122 = _1082 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1124 = _1046;
    float _1126 = _1104;
    float _1128 = _1050;
    float _1130 = _1044;
    float _1132 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1134 = _918;
    float _1136 = _1058;
    float _1138 = _898;
    float _1140 = _1080;
    float _1142 = _1040;
    float _1144 = _880;
    if (_1098)
    {
        _1124 = 1.0;
    }
    float _1146 = _1124;
    float _1148 = _1146;
    if (!_1122)
    {
        _1126 = _1120;
    }
    float _1150 = _1126;
    bool _1152 = !_1122;
    float _1154 = _1150;
    if (!_1152)
    {
        float _1156 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1158 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1160 = _1082 + _1158;
        float _1162 = _1120 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1164 = rsqrt(_1076);
        float _1166 = _1160 * _1156;
        float _1168 = _1166 * 0.15915493667125701904296875;
        float _1170 = _1168 * 6.283185482025146484375;
        float _1172 = cos(_1170);
        float _1174 = _1168 * 6.283185482025146484375;
        float _1176 = sin(_1174);
        float _1178 = _1172 + (-1.0);
        float _1180 = _1178 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1182 = fma(_1176, _1162, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1184 = fma(_1120, _1172, _1180);
        float _1186 = _1164 * _1182;
        float _1188 = fma(_1066, _1186, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1190 = fma(_1054, _1186, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1128 = _1188;
        _1130 = _1190;
        _1154 = _1184;
        _1132 = _1176;
        _1134 = _1180;
    }
    float _1192 = _1128;
    float _1194 = _1130;
    float _1196 = _1154;
    float _1198 = _1132;
    float _1200 = _1134;
    float _1202 = _1198;
    float _1204 = _1200;
    float _1206 = _1196;
    if (_1118)
    {
        _1202 = _1192;
    }
    float _1208 = _1202;
    float _1210 = _1208;
    if (_1118)
    {
        _1204 = _1194;
    }
    float _1212 = _1204;
    float _1214 = _1212;
    if (!_1118)
    {
        float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1218 = _1108 + _1216;
        float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1222 = _1038 + _1220;
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1226 = -_1038;
        float _1228 = _1226 + _1192;
        float _1230 = _1218 * _1218;
        float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1234 = _1032 + _1232;
        float _1236 = fma(_1222, _1222, _1230);
        float _1238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1240 = fma(_1234, _1234, _1236);
        float _1242 = sqrt(_1240);
        float _1244 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1246 = precise::min(_1242, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1248 = _1246 * _1238;
        float _1250 = -_1108;
        float _1252 = _1250 + _1196;
        float _1254 = _1244 * _1248;
        float _1256 = -_1032;
        float _1258 = _1256 + _1194;
        float _1260 = fma(_1252, _1254, _1108);
        float _1262 = fma(_1228, _1254, _1038);
        float _1264 = fma(_1258, _1254, _1032);
        _1206 = _1260;
        _1210 = _1262;
        _1214 = _1264;
        _1136 = _1258;
    }
    float _1266 = _1206;
    float _1268 = _1210;
    float _1270 = _1214;
    float _1272 = _1136;
    if (!_1098)
    {
        float _1274 = in.m_65.w;
        int _1276 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _1278 = _1276 == 4;
        bool _1280 = _1276 == 8;
        bool _1282 = _1276 == 12;
        int _1284 = as_type<int>(_1274) << 16;
        int _1286 = as_type<int>(_1274) << 8;
        int _1288 = as_type<int>(_1274) << 24;
        int _1290 = _1284 >> 24;
        int _1292 = _1286 >> 24;
        int _1294 = as_type<int>(_1274) >> 24;
        int _1296 = _1288 >> 24;
        float _1298 = float(_1290);
        float _1300 = float(_1292);
        float _1302 = float(_1294);
        float _1304 = _1298 * 0.0078740157186985015869140625;
        float _1306 = float(_1296);
        float _1308 = _1300 * 0.0078740157186985015869140625;
        float _1310 = _1302 * 0.0078740157186985015869140625;
        float _1312 = precise::min(_1304, 1.0);
        float _1314 = _1306 * 0.0078740157186985015869140625;
        float _1316 = precise::min(_1308, 1.0);
        float _1318 = precise::min(_1310, 1.0);
        float _1320 = precise::min(_1314, 1.0);
        float _1322 = precise::max(_1312, -1.0);
        float _1324 = precise::max(_1316, -1.0);
        float _1326 = precise::max(_1318, -1.0);
        float _1328 = precise::max(_1320, -1.0);
        float _1330 = _1328;
        _1138 = as_type<float>(_1276);
        if (_1278)
        {
            _1330 = _1322;
        }
        float _1332 = _1330;
        float _1334 = _1332;
        if (_1280)
        {
            _1334 = _1324;
        }
        float _1336 = _1334;
        float _1338 = _1336;
        if (_1282)
        {
            _1338 = _1326;
        }
        float _1340 = _1338;
        float _1342 = abs(_1340);
        float _1344 = (-0.0) + _1342;
        _1148 = _1344;
    }
    float _1346 = _1148;
    float _1348 = _1138;
    float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1352 = _1266 + _1350;
    float _1354 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1356 = _1268 + _1354;
    float _1358 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1360 = _1270 + _1358;
    float _1362 = _1352 * _1352;
    bool _1364 = _1346 != 0.0;
    bool _1366 = isnan(_1346);
    bool _1368 = _1364 || _1366;
    bool _1370 = isnan(0.0);
    bool _1372 = _1368 || _1370;
    float _1374 = fma(_1356, _1356, _1362);
    float _1376 = fma(_1360, _1360, _1374);
    float _1378 = rsqrt(_1376);
    float _1380 = sqrt(_1376);
    float _1382 = _1378 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1384 = _1356 * _1382;
    float _1386 = _1360 * _1382;
    float _1388 = _1384 * _1384;
    float _1390 = _1386 * _1386;
    float _1392 = _1388 + _1390;
    float _1394 = sqrt(_1392);
    bool _1396 = _1394 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1398 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1400 = _1394 + _1398;
    float _1402 = _1348;
    float _1404 = _1392;
    float _1406 = _1400;
    float _1408 = _1352;
    float _1410 = _1386;
    float _1412 = _1390;
    if (_1396)
    {
        float _1414 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1402 = _1414;
    }
    float _1416 = _1402;
    if (_1396)
    {
        float _1418 = rsqrt(_1392);
        _1404 = _1418;
    }
    float _1420 = _1404;
    if (_1396)
    {
        float _1422 = _1400 * _1416;
        _1406 = _1422;
    }
    float _1424 = _1406;
    if (_1396)
    {
        float _1426 = _1424 * 0.15915493667125701904296875;
        _1140 = _1426;
    }
    float _1428 = _1140;
    float _1430 = _1072;
    if (_1396)
    {
        float _1432 = _1428 * 6.283185482025146484375;
        float _1434 = sin(_1432);
        _1430 = _1434;
    }
    float _1436 = _1430;
    float _1438 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1440 = precise::max(0.0, _1438);
    float _1442 = _1272;
    float _1444 = _1438;
    float _1446 = _1440;
    if (_1396)
    {
        float _1448 = _1428 * 6.283185482025146484375;
        float _1450 = cos(_1448);
        _1442 = _1450;
    }
    float _1452 = _1442;
    float _1454 = -_1382;
    float _1456 = -_1440;
    float _1458 = fma(_1352, _1454, _1456);
    if (_1396)
    {
        float _1460 = _1458 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1408 = _1460;
    }
    float _1462 = _1408;
    float _1464 = _1436;
    float _1466 = _1462;
    if (_1396)
    {
        float _1468 = fma(_1436, _1462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1464 = _1468;
    }
    float _1470 = _1464;
    float _1472 = _1470;
    if (!_1396)
    {
        _1466 = _1458;
    }
    float _1474 = _1466;
    float _1476 = _1474;
    if (_1396)
    {
        float _1478 = _1452 + (-1.0);
        _1444 = _1478;
    }
    float _1480 = _1444;
    float _1482 = _1480;
    if (_1396)
    {
        float _1484 = _1420 * _1470;
        _1142 = _1484;
    }
    float _1486 = _1142;
    float _1488 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1396)
    {
        _1472 = _1388;
    }
    float _1490 = _1472;
    float _1492 = _1490;
    if (_1396)
    {
        float _1494 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1446 = _1494;
    }
    float _1496 = _1446;
    if (!_1396)
    {
        _1482 = _1384;
    }
    float _1498 = _1482;
    float _1500 = _1498;
    if (_1396)
    {
        float _1502 = _1384 * _1486;
        _1500 = _1502;
    }
    float _1504 = _1500;
    float _1506 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1488);
    if (_1396)
    {
        float _1508 = fma(_1458, _1452, _1496);
        _1476 = _1508;
    }
    float _1510 = _1476;
    if (_1396)
    {
        float _1512 = _1386 * _1486;
        _1410 = _1512;
    }
    float _1514 = _1410;
    if (_1396)
    {
        float _1516 = _1504 * _1504;
        _1492 = _1516;
    }
    float _1518 = _1492;
    float _1520 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1506);
    float _1522 = fma(_1038, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1396)
    {
        float _1524 = _1514 * _1514;
        _1412 = _1524;
    }
    float _1526 = _1412;
    float _1528 = fma(_1510, _1510, _1518);
    float _1530 = _1520 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1532 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1534 = _1528 + _1526;
    float _1536 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1538 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1540 = floor(_1522);
    float _1542 = fma(_1032, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1544 = -_1536;
    float _1546 = fma(_1544, _1532, 1.0);
    float _1548 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1538);
    float _1550 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1552 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1554 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1548);
    float _1556 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1550);
    float _1558 = rsqrt(_1534);
    float _1560 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1552);
    float _1562 = _1554 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1564 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1556);
    float _1566 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1560);
    float _1568 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1570 = _1564 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1572 = floor(_1542);
    float _1574 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1576 = fma(_1380, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1574);
    float _1578 = precise::clamp(_1576, 0.0, 1.0);
    float _1580 = _1566 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1582 = -_1578;
    float _1584 = _1582 + 1.0;
    float _1586 = _1558 * _1504;
    float _1588 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1568);
    float _1590 = _1558 * _1510;
    float _1592 = abs(_1584);
    float _1594 = log2(_1592);
    float _1596 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1598 = _1558 * _1514;
    float _1600 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1588);
    float _1602 = -_1596;
    float _1604 = fma(_1590, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1602);
    float _1606 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1608 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1600);
    float _1610 = log2(_1546);
    float _1612 = -_1598;
    float _1614 = fma(_1612, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1604);
    float _1616 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1618 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1606);
    float _1620 = fma(_1614, -0.5, 0.5);
    float _1622 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1616);
    float _1624 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1618);
    float _1626 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1628 = 1.0 / _1608;
    float _1630 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1622);
    float _1632 = fma(_1614, 0.5, 0.5);
    float _1634 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1630);
    float _1636 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1624);
    float _1638 = fma(_1632, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1640 = sqrt(_1620);
    float _1642 = -_1540;
    float _1644 = _1522 + _1642;
    float _1646 = _1614;
    float _1648 = _1540;
    float _1650 = _1608;
    float _1652 = _1636;
    if (_1372)
    {
        _1646 = _1634;
    }
    float _1654 = _1646;
    float _1656 = fma(_1632, _1638, -0.212114393711090087890625);
    float _1658 = _1654;
    if (_1372)
    {
        _1648 = _1636;
    }
    float _1660 = _1648;
    float _1662 = -_1572;
    float _1664 = _1542 + _1662;
    float _1666 = _1660;
    if (!_1372)
    {
        _1658 = 0.0;
    }
    float _1668 = _1658;
    float _1670 = fma(_1632, _1656, 1.570728778839111328125);
    float _1672 = exp2(_1626);
    if (!_1372)
    {
        _1666 = 0.0;
    }
    float _1674 = _1666;
    float _1676 = _1590 + 1.0;
    float _1678 = _1610 * 0.693147182464599609375;
    float _1680 = _1628 * _1668;
    float2 _4948 = float2(_1644, _1664);
    float _1682 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4948, float2(0.0), isnan(_4948)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4948, float2(0.0), isnan(_4948)), level(0.0)).x;
    float _1684 = _1628 * _1674;
    float _1686 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1688 = _1640 * 0.636619746685028076171875;
    float _1690 = fma(_1684, -0.5, 0.5);
    float _1692 = -_1670;
    float _1694 = fma(_1688, _1692, 1.0);
    float _1696 = -_1590;
    float _1698 = fma(_1672, _1676, _1696);
    float _1700 = fma(_1680, 0.5, 0.5);
    float _1702 = fma(_1698, 0.5, 0.5);
    float3 _4986 = float3(_1700, _1690, _1686);
    float _1704 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4986, float3(0.0), isnan(_4986)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4986, float3(0.0), isnan(_4986)), level(0.0)).x;
    float3 _4997 = float3(_1700, _1690, _1686);
    float4 _1707 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4997, float3(0.0), isnan(_4997)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4997, float3(0.0), isnan(_4997)), level(0.0)).xyzw;
    float _1709 = _1707.x;
    float _1711 = _1707.y;
    float _1713 = _1707.z;
    float _1715 = _1707.w;
    float2 _5013 = float2(_1694, _1702);
    float3 _1719 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5013, float2(0.0), isnan(_5013)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5013, float2(0.0), isnan(_5013)), level(0.0)).xyz;
    float _1721 = _1719.x;
    float _1723 = _1719.y;
    float _1725 = _1719.z;
    float _1727 = _1108 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1729 = _1108 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1731 = in.m_55.w;
    bool _1733 = _256 > 0.5;
    float _1735 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1727);
    float _1737 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1729);
    out.m_67.x = _394;
    float _1739 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1735);
    float _1741 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1737);
    float _1743 = in.m_69.y;
    float _1745 = _1739 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1747 = _1741 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1749 = in.m_69.x;
    float _1751 = 1.0 / _1745;
    float _1753 = _1747 + _1745;
    float _1755 = in.m_59.y;
    int _1757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1759 = _1757 != 0;
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1765 = _1763 != 0;
    float _1767 = in.m_71.z;
    int _1769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1771 = _1769 != 0;
    float _1773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1777 = _1775 != 0;
    float _1779 = in.m_71.x;
    bool _1781 = _1731 > 0.5;
    float _1783 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1785 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_73.x = _1268;
    out.m_73.y = _1266;
    out.m_73.z = _1270;
    float _1787 = _1753 * _1751;
    float _1789 = _1787 * 0.5;
    float _1791 = -_1743;
    float _1793 = _1791 + 1.0;
    float _1795 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1785);
    float _1797 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1799 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1797);
    float _1801 = 0.0;
    float _1803 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    bool _1805 = _1771;
    bool _1807 = _1781;
    float _1809 = _1743;
    if (!_1759)
    {
        _1801 = _1749;
    }
    float _1811 = _1801;
    float _1813 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1795);
    int _1815 = _1781 ? as_type<int>(_1793) : as_type<int>(_1743);
    out.m_67.y = _1755;
    float _1817 = _1811;
    if (!_1759)
    {
        _1803 = _1811;
    }
    float _1819 = _1803;
    float _1821 = 1.0 / _1799;
    float _1823 = _1819;
    if (_1759)
    {
        _1817 = _1749;
    }
    float _1825 = _1817;
    float _1827 = _1767 + (-0.039999999105930328369140625);
    float _1829 = _1771 ? as_type<float>(_1815) : _1743;
    float _1831 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1813);
    float _1833 = _1831;
    if (_1765)
    {
        bool _1835 = _228 > 0.5;
        _1805 = _1835;
    }
    bool _1837 = _1805;
    if (_1765)
    {
        float _1839 = -_1825;
        float _1841 = _1839 + 1.0;
        _486 = as_type<int>(_1841);
    }
    int _1843 = _486;
    float _1845 = -_800;
    float _1847 = _1845 + _1779;
    if (!_1765)
    {
        _584 = _1825;
    }
    float _1849 = _584;
    float _1851 = _1849;
    if (_1759)
    {
        float _1853 = -_1825;
        float _1855 = _1853 + 1.0;
        _488 = as_type<int>(_1855);
    }
    int _1857 = _488;
    if (_1759)
    {
        bool _1859 = _234 > 0.5;
        _1807 = _1859;
    }
    bool _1861 = _1807;
    float _1863 = _784 * _1847;
    if (_1765)
    {
        float _1865 = _1837 ? as_type<float>(_1843) : _1825;
        _1851 = _1865;
    }
    float _1867 = _1851;
    float _1869 = _758 * _1847;
    float _1871 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1873 = fma(_758, _1827, _1863);
    float _1875 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1877 = _1821 * _1875;
    float _1879 = -_1869;
    float _1881 = fma(_784, _1827, _1879);
    if (_1777)
    {
        float _1883 = _1733 ? _1793 : _1743;
        _1809 = _1883;
    }
    float _1885 = _1809;
    float _1887 = _1867 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1889 = _274 != 0.0;
    bool _1891 = isnan(_274);
    bool _1893 = _1889 || _1891;
    bool _1895 = isnan(0.0);
    bool _1897 = _1893 || _1895;
    float _1899 = _1761 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1901 = abs(_1877);
    float _1903 = log2(_1901);
    if (_1759)
    {
        float _1905 = _1861 ? as_type<float>(_1857) : _1825;
        _1823 = _1905;
    }
    float _1907 = _1823;
    float _1909 = _1885 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1911 = -_800;
    bool _1913 = _868 == _1911;
    bool _1915 = !_1897;
    bool _1917 = _1913 && _1915;
    float _1919 = _1829 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1921 = _800 + _1873;
    float _1923 = _1907 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1925 = _864 == (-0.039999999105930328369140625);
    bool _1927 = _1925 && _1917;
    float _1929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1931 = _1919 * _1871;
    float _1933 = _1909 * _1773;
    float _1935 = in.m_71.y;
    float _1937 = in.m_75.x;
    float _1939 = in.m_75.y;
    float _1941 = in.m_75.z;
    float _1943 = in.m_75.w;
    float _1945 = _1903 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1947 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1949 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.gl_Position.x = _1634;
    out.gl_Position.y = _1636;
    out.gl_Position.z = _1831;
    out.gl_Position.w = _1608;
    float _1951 = _1949 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1953 = _1923 * _1929;
    float _1955 = exp2(_1945);
    float _1957 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1959 = _1881 + 0.039999999105930328369140625;
    float _1961 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1963 = _1957 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1965 = _1903;
    if (_1927)
    {
        _1965 = _1959;
    }
    float _1967 = _1965;
    float _1969 = _1887 * _1947;
    float _1971 = _1967;
    float _1973 = _1947;
    if (!_1927)
    {
        float _1975 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1959);
        _1971 = _1975;
    }
    float _1977 = _1971;
    out.m_77.x = _1951;
    out.m_77.y = _1963;
    out.m_77.z = _1899;
    if (_1927)
    {
        _1973 = _1921;
    }
    float _1979 = _1973;
    float _1981 = _1979;
    if (!_1927)
    {
        float _1983 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1921);
        _1981 = _1983;
    }
    float _1985 = _1981;
    if (_1927)
    {
        _1144 = _1935;
    }
    float _1987 = _1144;
    out.m_79.x = _1953;
    out.m_79.y = _1933;
    out.m_79.z = _1969;
    out.m_79.w = _1931;
    float _1989 = _1921 * _1941;
    float _1991 = fma(_1955, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1993 = precise::clamp(_1991, 0.0, 1.0);
    float _1995 = _1987;
    if (!_1927)
    {
        float _1997 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1935);
        _1995 = _1997;
    }
    float _1999 = _1995;
    out.m_81.w = _1961;
    bool _2001 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2003 = isnan(_1380);
    bool _2005 = _2001 || _2003;
    bool _2007 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2009 = _2005 || _2007;
    float _2011 = _1959 * _1939;
    float _2013 = -_1989;
    float _2015 = fma(_1959, _1937, _2013);
    float _2017 = exp2(_1783);
    float _2019 = -_2011;
    float _2021 = fma(_1941, _1935, _2019);
    float _2023 = _2015 * _1943;
    float _2025 = _1937 * _1935;
    float _2027 = fma(_1993, -2.0, 3.0);
    float _2029 = _1993 * _1993;
    float _2031 = _2021 * _1943;
    float _2033 = -_2025;
    float _2035 = fma(_1921, _1939, _2033);
    float _2037 = _1074 * _1939;
    float _2039 = _2029 * _2027;
    float _2041 = _1074 * _1999;
    float _2043 = _2035 * _1943;
    float _2045 = _984 * _1939;
    float _2047 = _984 * _1999;
    float _2049 = _1012 * _1939;
    float _2051 = _1012 * _1999;
    float _2053 = _984 * _2023;
    float _2055 = _1012 * _2023;
    float _2057 = _1074 * _2023;
    float _2059 = fma(_986, _1985, _2047);
    float _2061 = fma(_1084, _1985, _2041);
    float _2063 = fma(_986, _1937, _2045);
    float _2065 = fma(_1084, _1937, _2037);
    float _2067 = fma(_1016, _1937, _2049);
    float _2069 = -_2039;
    float _2071 = _2069 + 1.0;
    float _2073 = fma(_988, _1941, _2063);
    float _2075 = fma(_1100, _1941, _2065);
    float _2077 = fma(_1018, _1941, _2067);
    bool _2079 = _1877 <= 8000.0;
    bool _2081 = isnan(_1877);
    bool _2083 = _2079 || _2081;
    bool _2085 = isnan(8000.0);
    bool _2087 = _2083 || _2085;
    float _2089 = float(_2087);
    float _2091 = in.m_65.x;
    float _2093 = fma(_2071, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2039);
    float _2095 = fma(_988, _1977, _2059);
    float _2097 = -_2017;
    float _2099 = _2097 + 1.0;
    float _2101 = fma(_986, _2031, _2053);
    float _2103 = _2089 * _2093;
    float _2105 = fma(_1084, _2031, _2057);
    float _2107 = fma(_1016, _2031, _2055);
    out.m_83.x = _2073;
    out.m_83.y = _2075;
    out.m_83.z = _2077;
    float _2109 = _2103 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2111 = _2099 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2113 = fma(_988, _2043, _2101);
    float _2115 = fma(_1100, _2043, _2105);
    float _2117 = fma(_1018, _2043, _2107);
    float _2119 = fma(_1016, _1985, _2051);
    float _2121 = _1831 + _1608;
    float _2123 = -_2111;
    float _2125 = _2123 + 1.0;
    float _2127 = fma(_1100, _1977, _2061);
    out.m_85.x = _2113;
    out.m_85.y = _2115;
    out.m_85.z = _2117;
    int _2129 = as_type<int>(_2065);
    float _2131 = _2075;
    float _2133 = _2125;
    if (!_1372)
    {
        float _2135 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        _2129 = as_type<int>(_2135);
    }
    int _2137 = _2129;
    float _2139 = fma(_1018, _1977, _2119);
    float _2141 = _2121 * 0.5;
    float _2143 = _1346 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2145 = _2143;
    float _2147 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_1372)
    {
        _2145 = 0.0;
    }
    float _2149 = _2145;
    out.m_87.x = _2095;
    out.m_87.y = _2127;
    out.m_87.z = _2139;
    if (!_2009)
    {
        _2131 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2151 = _2131;
    float _2153 = _2151;
    float _2155 = _2151;
    if (!_2009)
    {
        _1650 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2157 = _1650;
    float _2159 = _2157;
    float _2161 = _2157;
    if (!_1372)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5789 = as_type<float>(_2137);
        out.gl_Position.z = _5789;
    }
    if (!_2009)
    {
        _1833 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2163 = _1833;
    float _2165 = _2163;
    float _2167 = _2163;
    if (!_2009)
    {
        _1652 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2169 = _1652;
    out.m_89.z = _2141;
    out.m_89.w = _1608;
    float _2171 = -_1682;
    float _2173 = _2171 + 1.0;
    float _2175 = _2173 * _2109;
    float _2177 = precise::clamp(_2175, 0.0, 1.0);
    float _2179 = -_2177;
    float _2181 = fma(_2179, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2183 = _2169;
    float _2185 = _2169;
    if (!_2009)
    {
        _2147 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2187 = _2147;
    float _2189 = _2181 * _2091;
    float _2191 = _2111 * _1704;
    float _2193 = _2189 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2195 = _1715 * _2125;
    float _2197 = _2187;
    float _2199 = _2187;
    if (!_2009)
    {
        _2133 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2201 = _2133;
    float _2203 = _1715 * _2191;
    float _2205 = _1725 * _2191;
    out.m_91.x = _2193;
    float _2207 = fma(_1721, _2203, _1709);
    float _2209 = fma(_1723, _2203, _1711);
    float _2211 = fma(_1715, _2205, _1713);
    out.m_93.x = _2207;
    out.m_93.y = _2209;
    out.m_93.z = _2211;
    out.m_93.w = _2195;
    bool _2213 = !_2009;
    float _2215 = _2201;
    float _2217 = _2201;
    if (!_2213)
    {
        bool _2219 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2221 = isnan(_1380);
        bool _2223 = _2219 || _2221;
        bool _2225 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2227 = _2223 || _2225;
        if (!_2227)
        {
            float _2229 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2231 = _1380 + _2229;
            float _2233 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2235 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2233;
            float _2237 = 1.0 / _2235;
            float _2239 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2241 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2245 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2249 = _2247 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2257 = _2255 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2259 = _2231 * _2237;
            float _2261 = precise::clamp(_2259, 0.0, 1.0);
            float _2263 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2265 = _2263 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2267 = fma(_2261, _2241, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2269 = fma(_2261, _2265, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2271 = fma(_2261, _2245, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2273 = fma(_2261, _2249, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2275 = fma(_2261, _2253, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2277 = fma(_2261, _2257, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2199 = _2269;
            _2185 = _2275;
            _2155 = _2267;
            _2167 = _2273;
            _2161 = _2271;
            _2217 = _2277;
            _2279 = true;
        }
        else
        {
            bool _2281 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2283 = isnan(_1380);
            bool _2285 = _2281 || _2283;
            bool _2287 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2289 = _2285 || _2287;
            if (!_2289)
            {
                _2153 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2291 = _2153;
            _2155 = _2291;
            if (!_2289)
            {
                _2197 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2293 = _2197;
            _2199 = _2293;
            if (!_2289)
            {
                _2159 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2295 = _2159;
            _2161 = _2295;
            if (!_2289)
            {
                _2165 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2297 = _2165;
            _2167 = _2297;
            if (!_2289)
            {
                _2183 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2299 = _2183;
            _2185 = _2299;
            if (!_2289)
            {
                _2215 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2301 = _2215;
            bool _2303 = !_2289;
            _2217 = _2301;
            if (!_2303)
            {
                bool _2305 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2307 = isnan(_1380);
                bool _2309 = _2305 || _2307;
                bool _2311 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2313 = _2309 || _2311;
                if (!_2313)
                {
                    float _2315 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2317 = _1380 + _2315;
                    float _2319 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2321 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2319;
                    float _2323 = 1.0 / _2321;
                    float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2327 = _2325 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2329 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2331 = _2329 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2337 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2339 = _2337 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2341 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2343 = _2341 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2345 = _2317 * _2323;
                    float _2347 = precise::clamp(_2345, 0.0, 1.0);
                    float _2349 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2351 = _2349 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2353 = fma(_2347, _2327, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2355 = fma(_2347, _2351, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2357 = fma(_2347, _2331, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2359 = fma(_2347, _2335, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2361 = fma(_2347, _2339, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2363 = fma(_2347, _2343, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2199 = _2355;
                    _2185 = _2361;
                    _2155 = _2353;
                    _2167 = _2359;
                    _2161 = _2357;
                    _2217 = _2363;
                    _2279 = true;
                }
                else
                {
                    _2199 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2185 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2155 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2167 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2161 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2217 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2279 = false;
    float _2365 = _2199;
    float _2367 = _2185;
    float _2369 = _2155;
    float _2371 = _2167;
    float _2373 = _2161;
    float _2375 = _2217;
    float _2377 = fma(_2127, -0.5, 0.5);
    float _2379 = precise::clamp(_2377, 0.0, 1.0);
    float _2381 = -_2365;
    float _2383 = _2381 + _2367;
    float _2385 = -_2369;
    float _2387 = _2385 + _2371;
    float _2389 = -_2373;
    float _2391 = _2389 + _2375;
    bool _2393 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2395 = fma(_2379, _2383, _2365);
    float _2397 = fma(_2379, _2387, _2369);
    float _2399 = fma(_2379, _2391, _2373);
    float _2401 = _2149 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2403 = _2395 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _2405 = fma(_2397, 0.298911988735198974609375, _2403);
    out.m_91.w = _2401;
    float _2407 = fma(_2399, 0.114477999508380889892578125, _2405);
    out.m_95.x = 0.0;
    float _2409 = -_2407;
    float _2411 = _2397 + _2409;
    float _2413 = -_2407;
    float _2415 = _2395 + _2413;
    float _2417 = -_2407;
    float _2419 = _2399 + _2417;
    float _2421 = fma(_2411, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2407);
    float _2423 = fma(_2415, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2407);
    float _2425 = fma(_2419, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2407);
    out.m_97.x = _2421;
    out.m_97.y = _2423;
    out.m_97.z = _2425;
    if (!_2393)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2427 = -_1266;
    float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2431 = -_1268;
    float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2435 = -_1270;
    float _2437 = _2435 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2439 = _2429 * _2429;
    float _2441 = fma(_2433, _2433, _2439);
    float _2443 = fma(_2437, _2437, _2441);
    float _2445 = sqrt(_2443);
    float _2447 = rsqrt(_2443);
    float _2449 = -_2445;
    float _2451 = _2449 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2453 = _2451 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2455 = precise::clamp(_2453, 0.0, 1.0);
    float _2457 = _2433 * _2447;
    float _2459 = _2429 * _2447;
    float _2461 = abs(_2455);
    float _2463 = log2(_2461);
    float _2465 = _2437 * _2447;
    float _2467 = _2457 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2469 = _2127 * _2459;
    float _2471 = -_2459;
    float _2473 = -_2467;
    float _2475 = fma(_2471, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2473);
    float _2477 = fma(_2095, _2457, _2469);
    float _2479 = -_2465;
    float _2481 = fma(_2479, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2475);
    float _2483 = fma(_2139, _2465, _2477);
    float _2485 = precise::clamp(_2483, 0.0, 1.0);
    float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2489 = _2481 + _2487;
    float _2491 = _2463 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2493 = _2489 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2495 = precise::clamp(_2493, 0.0, 1.0);
    float _2497 = exp2(_2491);
    float _2499 = _2497 * _2495;
    float _2501 = _2485 * _2499;
    float _2503 = _2501 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2505 = _2501 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2507 = _2501 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _2503;
    out.m_95.y = _2505;
    out.m_95.z = _2507;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2279 = false;
    bool _218 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    float _126 = _124;
    if (!_120)
    {
        out.m_49.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _124 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2564 = as_type<float>(_132);
        out.gl_Position.z = _2564;
    }
    if (!_120)
    {
        return out;
    }
    float _136 = in.m_51.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = _150;
    if (_146)
    {
        float _154 = float(_116);
        _126 = _154;
    }
    float _156 = _126;
    bool _158 = _150 >= _156;
    bool _160 = !_146;
    bool _162 = _158 || _160;
    float _164 = _156;
    if (_162)
    {
        _164 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _164;
    if (_162)
    {
        out.m_49.x = 0.0;
    }
    if (_162)
    {
        float _168 = _166 * 5.0;
        _134 = as_type<int>(_168);
    }
    int _170 = _134;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2634 = as_type<float>(_170);
        out.gl_Position.z = _2634;
    }
    if (_162)
    {
        return out;
    }
    float _172 = in.m_53.x;
    float _174 = in.m_53.y;
    float _176 = in.m_53.z;
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _180 = _174 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _182 = _174 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _184 = _174 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _186 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].x, _180);
    float _188 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].x, _182);
    float _190 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].x, _184);
    float _192 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[4].z, _186);
    float _194 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[5].z, _188);
    float _196 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[6].z, _190);
    bool _198 = !_178;
    float _216;
    if (!_198)
    {
        float _200 = in.m_55.x;
        float _202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _204 = _200 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _206 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _208 = _206 * _202;
        float _210 = floor(_208);
        float _212 = -_210;
        float _214 = _208 + _212;
        _216 = _214;
        _218 = true;
    }
    else
    {
        float _220 = float(_116);
        float _222 = 1.0 / _220;
        float _224 = _150 * _222;
        _216 = _224;
    }
    _218 = false;
    float _226 = _216;
    float _228 = in.m_55.z;
    float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _232 = log2(_230);
    float _234 = in.m_55.x;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _242 = _240 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _246 = _244 != 0;
    int _248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _250 = _248 != 0;
    int _252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _254 = _252 != 0;
    float _256 = in.m_55.y;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _260 = _226 + _258;
    float _262 = 1.0 / _242;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _270 = _226 + _268;
    float _272 = _194 * _194;
    float _274 = in.m_57.y;
    float _276 = 1.0 / _238;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _282;
    float _286 = fma(_192, _192, _272);
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _290 = _288 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _296 = _228 * 2.0;
    float _298 = fma(_196, _196, _286);
    float _300 = _260 * _262;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _226 + _302;
    float _306 = _234 * 2.0;
    float _308 = floor(_296);
    float _310 = _234 + _228;
    float _312 = _256 * 2.0;
    float _314 = fma(_290, _300, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _316 = _304 * _276;
    float _318 = _256 + _228;
    float _320 = _310 + (-1.0);
    float _322 = floor(_306);
    float _324 = _318 + (-1.0);
    float _326 = fma(_280, _316, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _328 = fma(_284, _316, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _330 = fma(_294, _300, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _332 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _334 = _234 + _256;
    float _336 = floor(_312);
    float _338 = _232 * _150;
    float _340 = _334 + (-1.0);
    bool _342 = _308 >= 0.0;
    bool _344 = isnan(_308);
    bool _346 = _342 || _344;
    bool _348 = isnan(0.0);
    bool _350 = _346 || _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _352;
    bool _356 = _308 > 0.0;
    float _358 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _360 = exp2(_338);
    bool _362 = _322 >= 0.0;
    bool _364 = isnan(_322);
    bool _366 = _362 || _364;
    bool _368 = isnan(0.0);
    bool _370 = _366 || _368;
    float _372 = in.m_57.x;
    bool _374 = _322 > 0.0;
    int _376 = _370 ? 0 : 1;
    float _378 = 1.0 / _266;
    bool _380 = _336 > 0.0;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _382;
    float _386 = -_360;
    float _388 = _386 + 1.0;
    float _390 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _392 = _350 ? 0 : 1;
    float _394 = in.m_59.x;
    bool _396 = _336 >= 0.0;
    bool _398 = isnan(_336);
    bool _400 = _396 || _398;
    bool _402 = isnan(0.0);
    bool _404 = _400 || _402;
    float _406 = rsqrt(_298);
    int _408 = _404 ? 0 : 1;
    float _410 = _270 * _378;
    bool _412 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _414 = isnan(0.0);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _420 = _416 || _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _424 = 1.0 + _422;
    float _426 = fma(_354, _410, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _428 = _420 ? _388 : 0.0;
    float _430 = 1.0 / _424;
    bool _432 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _434 = isnan(1.0);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _440 = _436 || _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _442;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _450 = fma(_384, _410, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _452 = fma(_444, _316, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _454 = _226 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _456 = isnan(_226);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = fma(_448, _300, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _468 = fma(_234, 6.283185482025146484375, _150);
    float _470 = _192 * _406;
    float _472 = _194 * _406;
    float _474 = _468 * 0.15915493667125701904296875;
    float _476 = _196 * _406;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _478;
    float _482 = _332;
    float _484 = _390;
    int _486 = as_type<int>(_228);
    int _488 = as_type<int>(_256);
    if (_440)
    {
        float _490 = _428 * _430;
        _152 = _490;
    }
    float _492 = _152;
    bool _494 = _226 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _496 = isnan(_226);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = -_394;
    float _508 = _506 + 1.0;
    bool _510 = _372 >= 0.0;
    bool _512 = isnan(_372);
    bool _514 = _510 || _512;
    bool _516 = isnan(0.0);
    bool _518 = _514 || _516;
    float _520 = _474 * 6.283185482025146484375;
    float _522 = sin(_520);
    bool _524 = _226 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _526 = isnan(_226);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -_504;
    float _538 = _536 + 1.0;
    int _540 = _518 ? 0 : 1;
    float _542 = fma(_480, _410, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _544 = _372 > 0.0;
    float _546 = _464 * _538;
    float _548 = -_464;
    float _550 = _548 + 1.0;
    bool _552 = _226 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _554 = isnan(_226);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    int _564 = ~_540;
    int _566 = _564 + 1;
    int _568 = _566 + 1;
    float _570 = _534 * _550;
    float _572 = -_534;
    float _574 = _572 + 1.0;
    float _576 = _562 * _574;
    float _578 = -_562;
    float _580 = _578 + 1.0;
    int _582 = _568;
    float _584 = _394;
    if (!_544)
    {
        int _586 = ~_540;
        int _588 = _586 + 1;
        _582 = _588;
    }
    int _590 = _582;
    float _592 = _522 * 0.52359879016876220703125;
    float _594 = _326 * _576;
    float _596 = _452 * _576;
    float _598 = _328 * _576;
    float _600 = _508 * _592;
    float _602 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[143].x, _594);
    float _604 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[143].y, _596);
    float _606 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[143].z, _598);
    int _608 = ~_392;
    int _610 = _608 + 1;
    int _612 = _610 + 1;
    float _614 = fma(_314, _570, _602);
    int _616 = ~_376;
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    float _622 = fma(_330, _570, _606);
    int _624 = _612;
    int _626 = _620;
    if (!_356)
    {
        int _628 = ~_392;
        int _630 = _628 + 1;
        _624 = _630;
    }
    int _632 = _624;
    float _634 = fma(_466, _570, _604);
    if (!_374)
    {
        int _636 = ~_376;
        int _638 = _636 + 1;
        _626 = _638;
    }
    int _640 = _626;
    float _642 = fma(_542, _546, _614);
    bool _644 = !_246;
    int _646 = _644 ? 0 : 1;
    float _648 = fma(_426, _546, _634);
    bool _650 = !_250;
    int _652 = _650 ? 0 : 1;
    float _654 = fma(_450, _546, _622);
    bool _656 = !_254;
    int _658 = _656 ? 0 : 1;
    float _660 = _472 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _662 = abs(_646);
    int _664 = abs(_652);
    int _666 = abs(_658);
    float _668 = in.m_61.x;
    float _670 = in.m_61.y;
    float _672 = in.m_61.z;
    float _674 = float(_662);
    float _676 = float(_632);
    int _678 = ~_408;
    int _680 = _678 + 1;
    int _682 = _680 + 1;
    int _684 = _682;
    float _686 = as_type<float>(_640);
    if (!_380)
    {
        int _688 = ~_408;
        int _690 = _688 + 1;
        _684 = _690;
    }
    int _692 = _684;
    float _694 = _674 * _676;
    float _696 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[8].y, _660);
    float _698 = float(_590);
    float _700 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[146].x, _642);
    float _702 = _694 * (-2.0);
    float _704 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[146].z, _654);
    float _706 = float(_664);
    float _708 = _234 + (-0.5);
    float _710 = float(_640);
    float _712 = fma(_358, _702, _358);
    float _714 = float(_666);
    float _716 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[10].y, _696);
    float _718 = float(_692);
    float _720 = _706 * _710;
    float _722 = _698 * _600;
    float _724 = fma(_702, _668, _668);
    float _726 = _720 * (-2.0);
    float _728 = _714 * _718;
    float _730 = abs(_716);
    bool _732 = _730 > 0.99989998340606689453125;
    float _734 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[196].x, _724);
    float _736 = fma(_726, _670, _670);
    float _738 = _728 * (-2.0);
    float _740 = fma(_332, _726, _332);
    float _742 = fma(_712, _492, _734);
    float _744 = _722 * (-0.15915493667125701904296875);
    float _746 = fma(_738, _672, _672);
    float _748 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[146].y, _648);
    float _750 = _742 * 0.15915493667125701904296875;
    float _752 = _256 + (-0.5);
    float _754 = in.m_57.z;
    float _756 = _744 * 6.283185482025146484375;
    float _758 = sin(_756);
    float _760 = _728;
    if (_732)
    {
        _686 = 0.001000000047497451305389404296875;
    }
    float _762 = _686;
    float _764 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[196].y, _736);
    float _766 = in.m_63.x;
    float _768 = in.m_63.y;
    float _770 = in.m_63.z;
    if (!_732)
    {
        _760 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _772 = _760;
    float _774 = _772;
    if (_732)
    {
        float _776 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _774 = _776;
    }
    float _778 = _774;
    float _780 = fma(_390, _738, _390);
    float _782 = _744 * 6.283185482025146484375;
    float _784 = cos(_782);
    if (!_732)
    {
        _482 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _786 = _482;
    float _788 = _228 + (-0.5);
    float _790 = _786;
    if (!_732)
    {
        _484 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _792 = _484;
    float _794 = _792;
    if (_732)
    {
        float _796 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _794 = _796;
    }
    float _798 = _794;
    float _800 = _698 * 0.0500000007450580596923828125;
    float _802 = fma(_740, _492, _764);
    float _804 = _750 * 6.283185482025146484375;
    float _806 = sin(_804);
    float _808 = -_800;
    float _810 = _808 + _372;
    float _812 = _802 * 0.15915493667125701904296875;
    if (_732)
    {
        float _814 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _790 = _814;
    }
    float _816 = _790;
    float _818 = -_778;
    float _820 = _476 * _818;
    float _822 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[196].z, _746);
    float _824 = _754 + (-0.039999999105930328369140625);
    float _826 = _758 * _810;
    float _828 = -_798;
    float _830 = -_820;
    float _832 = fma(_470, _828, _830);
    float _834 = -_798;
    float _836 = _472 * _834;
    float _838 = fma(_780, _492, _822);
    float _840 = -_816;
    float _842 = _470 * _840;
    float _844 = _700 * _766;
    float _846 = -_816;
    float _848 = -_836;
    float _850 = fma(_476, _846, _848);
    float _852 = _832 * _832;
    float _854 = _784 * _810;
    float _856 = -_778;
    float _858 = -_842;
    float _860 = fma(_472, _856, _858);
    float _862 = -_826;
    float _864 = fma(_784, _824, _862);
    float _866 = fma(_850, _850, _852);
    float _868 = fma(_758, _824, _854);
    float _870 = _838 * 0.15915493667125701904296875;
    float _872 = _750 * 6.283185482025146484375;
    float _874 = cos(_872);
    float _876 = fma(_860, _860, _866);
    float _878 = _748 * _768;
    float _880 = _800 + _868;
    float _882 = _844 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _884 = _878 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _886 = _864 + 0.039999999105930328369140625;
    float _888 = _812 * 6.283185482025146484375;
    float _890 = sin(_888);
    float _892 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _880);
    float _894 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _274);
    float _896 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _886);
    float _898 = _892 * _882;
    float _900 = _894 * _884;
    float _902 = _812 * 6.283185482025146484375;
    float _904 = cos(_902);
    float _906 = _870 * 6.283185482025146484375;
    float _908 = cos(_906);
    float _910 = _704 * _770;
    float _912 = _806 * _890;
    float _914 = in.m_46.x;
    float _916 = in.m_46.y;
    float _918 = in.m_46.z;
    float _920 = rsqrt(_876);
    float _922 = _874 * _904;
    float _924 = _806 * _904;
    float _926 = _870 * 6.283185482025146484375;
    float _928 = sin(_926);
    float _930 = _874 * _908;
    float _932 = _806 * _908;
    float _934 = _860 * _920;
    float _936 = _874 * _890;
    float _938 = _904 * _908;
    float _940 = _890 * _908;
    float _942 = _832 * _920;
    float _944 = _850 * _920;
    float _946 = _916 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _948 = fma(_928, _922, _912);
    float _950 = -_924;
    float _952 = fma(_928, _936, _950);
    float _954 = fma(_928, _912, _922);
    float _956 = -_936;
    float _958 = fma(_928, _924, _956);
    float _960 = _910 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _962 = _472 * _934;
    float _964 = _470 * _930;
    float _966 = _948 * _470;
    float _968 = _470 * _952;
    float _970 = -_962;
    float _972 = fma(_476, _942, _970);
    float _974 = -_928;
    float _976 = fma(_974, _944, _964);
    float _978 = fma(_938, _944, _966);
    float _980 = fma(_940, _944, _968);
    float _982 = _896 * _960;
    float _984 = fma(_932, _972, _976);
    float _986 = fma(_958, _972, _978);
    float _988 = fma(_954, _972, _980);
    float _990 = _476 * _930;
    float _992 = _470 * _942;
    float _994 = _948 * _476;
    float _996 = _476 * _952;
    float _998 = -_928;
    float _1000 = fma(_998, _934, _990);
    float _1002 = -_992;
    float _1004 = fma(_472, _944, _1002);
    float _1006 = _916 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1008 = fma(_938, _934, _994);
    float _1010 = fma(_940, _934, _996);
    float _1012 = fma(_932, _1004, _1000);
    float _1014 = fma(_914, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1006);
    float _1016 = fma(_958, _1004, _1008);
    float _1018 = fma(_954, _1004, _1010);
    float _1020 = _900 * _1012;
    float _1022 = fma(_914, (*spvDescriptorSet0.vp_c10)._m0[4].x, _946);
    float _1024 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1014);
    float _1026 = _900 * _984;
    float _1028 = fma(_898, _1016, _1020);
    float _1030 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1022);
    float _1032 = _1024 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1034 = fma(_898, _986, _1026);
    float _1036 = fma(_982, _1018, _1028);
    float _1038 = _1030 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1040 = _476 * _944;
    float _1042 = fma(_982, _988, _1034);
    float _1044 = _1032 + _1036;
    float _1046 = _472 * _930;
    float _1048 = _948 * _472;
    float _1050 = _1038 + _1042;
    float _1052 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1054 = _1044 + _1052;
    float _1056 = -_928;
    float _1058 = fma(_1056, _942, _1046);
    float _1060 = -_1040;
    float _1062 = fma(_470, _934, _1060);
    float _1064 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1066 = _1050 + _1064;
    float _1068 = _1054 * _1054;
    float _1070 = _472 * _952;
    float _1072 = fma(_938, _942, _1048);
    float _1074 = fma(_932, _1062, _1058);
    float _1076 = fma(_1066, _1066, _1068);
    float _1078 = _916 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1080 = fma(_940, _942, _1070);
    float _1082 = sqrt(_1076);
    float _1084 = fma(_958, _1062, _1072);
    float _1086 = _900 * _1074;
    float _1088 = fma(_914, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1078);
    bool _1090 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1092 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1094 = _1090 || _1092;
    bool _1096 = isnan(0.5);
    bool _1098 = _1094 || _1096;
    float _1100 = fma(_954, _1062, _1080);
    float _1102 = fma(_898, _1084, _1086);
    float _1104 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1088);
    float _1106 = fma(_982, _1100, _1102);
    float _1108 = _1104 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1110 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan(0.5);
    bool _1118 = _1114 || _1116;
    float _1120 = _1108 + _1106;
    bool _1122 = _1082 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1124 = _1046;
    float _1126 = _1104;
    float _1128 = _1050;
    float _1130 = _1044;
    float _1132 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1134 = _918;
    float _1136 = _1058;
    float _1138 = _898;
    float _1140 = _1080;
    float _1142 = _1040;
    float _1144 = _880;
    if (_1098)
    {
        _1124 = 1.0;
    }
    float _1146 = _1124;
    float _1148 = _1146;
    if (!_1122)
    {
        _1126 = _1120;
    }
    float _1150 = _1126;
    bool _1152 = !_1122;
    float _1154 = _1150;
    if (!_1152)
    {
        float _1156 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1158 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1160 = _1082 + _1158;
        float _1162 = _1120 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1164 = rsqrt(_1076);
        float _1166 = _1160 * _1156;
        float _1168 = _1166 * 0.15915493667125701904296875;
        float _1170 = _1168 * 6.283185482025146484375;
        float _1172 = cos(_1170);
        float _1174 = _1168 * 6.283185482025146484375;
        float _1176 = sin(_1174);
        float _1178 = _1172 + (-1.0);
        float _1180 = _1178 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1182 = fma(_1176, _1162, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1184 = fma(_1120, _1172, _1180);
        float _1186 = _1164 * _1182;
        float _1188 = fma(_1066, _1186, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1190 = fma(_1054, _1186, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1128 = _1188;
        _1130 = _1190;
        _1154 = _1184;
        _1132 = _1176;
        _1134 = _1180;
    }
    float _1192 = _1128;
    float _1194 = _1130;
    float _1196 = _1154;
    float _1198 = _1132;
    float _1200 = _1134;
    float _1202 = _1198;
    float _1204 = _1200;
    float _1206 = _1196;
    if (_1118)
    {
        _1202 = _1192;
    }
    float _1208 = _1202;
    float _1210 = _1208;
    if (_1118)
    {
        _1204 = _1194;
    }
    float _1212 = _1204;
    float _1214 = _1212;
    if (!_1118)
    {
        float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1218 = _1108 + _1216;
        float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1222 = _1038 + _1220;
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1226 = -_1038;
        float _1228 = _1226 + _1192;
        float _1230 = _1218 * _1218;
        float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1234 = _1032 + _1232;
        float _1236 = fma(_1222, _1222, _1230);
        float _1238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1240 = fma(_1234, _1234, _1236);
        float _1242 = sqrt(_1240);
        float _1244 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1246 = precise::min(_1242, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1248 = _1246 * _1238;
        float _1250 = -_1108;
        float _1252 = _1250 + _1196;
        float _1254 = _1244 * _1248;
        float _1256 = -_1032;
        float _1258 = _1256 + _1194;
        float _1260 = fma(_1252, _1254, _1108);
        float _1262 = fma(_1228, _1254, _1038);
        float _1264 = fma(_1258, _1254, _1032);
        _1206 = _1260;
        _1210 = _1262;
        _1214 = _1264;
        _1136 = _1258;
    }
    float _1266 = _1206;
    float _1268 = _1210;
    float _1270 = _1214;
    float _1272 = _1136;
    if (!_1098)
    {
        float _1274 = in.m_65.w;
        int _1276 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _1278 = _1276 == 4;
        bool _1280 = _1276 == 8;
        bool _1282 = _1276 == 12;
        int _1284 = as_type<int>(_1274) << 16;
        int _1286 = as_type<int>(_1274) << 8;
        int _1288 = as_type<int>(_1274) << 24;
        int _1290 = _1284 >> 24;
        int _1292 = _1286 >> 24;
        int _1294 = as_type<int>(_1274) >> 24;
        int _1296 = _1288 >> 24;
        float _1298 = float(_1290);
        float _1300 = float(_1292);
        float _1302 = float(_1294);
        float _1304 = _1298 * 0.0078740157186985015869140625;
        float _1306 = float(_1296);
        float _1308 = _1300 * 0.0078740157186985015869140625;
        float _1310 = _1302 * 0.0078740157186985015869140625;
        float _1312 = precise::min(_1304, 1.0);
        float _1314 = _1306 * 0.0078740157186985015869140625;
        float _1316 = precise::min(_1308, 1.0);
        float _1318 = precise::min(_1310, 1.0);
        float _1320 = precise::min(_1314, 1.0);
        float _1322 = precise::max(_1312, -1.0);
        float _1324 = precise::max(_1316, -1.0);
        float _1326 = precise::max(_1318, -1.0);
        float _1328 = precise::max(_1320, -1.0);
        float _1330 = _1328;
        _1138 = as_type<float>(_1276);
        if (_1278)
        {
            _1330 = _1322;
        }
        float _1332 = _1330;
        float _1334 = _1332;
        if (_1280)
        {
            _1334 = _1324;
        }
        float _1336 = _1334;
        float _1338 = _1336;
        if (_1282)
        {
            _1338 = _1326;
        }
        float _1340 = _1338;
        float _1342 = abs(_1340);
        float _1344 = (-0.0) + _1342;
        _1148 = _1344;
    }
    float _1346 = _1148;
    float _1348 = _1138;
    float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1352 = _1266 + _1350;
    float _1354 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1356 = _1268 + _1354;
    float _1358 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1360 = _1270 + _1358;
    float _1362 = _1352 * _1352;
    bool _1364 = _1346 != 0.0;
    bool _1366 = isnan(_1346);
    bool _1368 = _1364 || _1366;
    bool _1370 = isnan(0.0);
    bool _1372 = _1368 || _1370;
    float _1374 = fma(_1356, _1356, _1362);
    float _1376 = fma(_1360, _1360, _1374);
    float _1378 = rsqrt(_1376);
    float _1380 = sqrt(_1376);
    float _1382 = _1378 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1384 = _1356 * _1382;
    float _1386 = _1360 * _1382;
    float _1388 = _1384 * _1384;
    float _1390 = _1386 * _1386;
    float _1392 = _1388 + _1390;
    float _1394 = sqrt(_1392);
    bool _1396 = _1394 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1398 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1400 = _1394 + _1398;
    float _1402 = _1348;
    float _1404 = _1392;
    float _1406 = _1400;
    float _1408 = _1352;
    float _1410 = _1386;
    float _1412 = _1390;
    if (_1396)
    {
        float _1414 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1402 = _1414;
    }
    float _1416 = _1402;
    if (_1396)
    {
        float _1418 = rsqrt(_1392);
        _1404 = _1418;
    }
    float _1420 = _1404;
    if (_1396)
    {
        float _1422 = _1400 * _1416;
        _1406 = _1422;
    }
    float _1424 = _1406;
    if (_1396)
    {
        float _1426 = _1424 * 0.15915493667125701904296875;
        _1140 = _1426;
    }
    float _1428 = _1140;
    float _1430 = _1072;
    if (_1396)
    {
        float _1432 = _1428 * 6.283185482025146484375;
        float _1434 = sin(_1432);
        _1430 = _1434;
    }
    float _1436 = _1430;
    float _1438 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1440 = precise::max(0.0, _1438);
    float _1442 = _1272;
    float _1444 = _1438;
    float _1446 = _1440;
    if (_1396)
    {
        float _1448 = _1428 * 6.283185482025146484375;
        float _1450 = cos(_1448);
        _1442 = _1450;
    }
    float _1452 = _1442;
    float _1454 = -_1382;
    float _1456 = -_1440;
    float _1458 = fma(_1352, _1454, _1456);
    if (_1396)
    {
        float _1460 = _1458 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1408 = _1460;
    }
    float _1462 = _1408;
    float _1464 = _1436;
    float _1466 = _1462;
    if (_1396)
    {
        float _1468 = fma(_1436, _1462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1464 = _1468;
    }
    float _1470 = _1464;
    float _1472 = _1470;
    if (!_1396)
    {
        _1466 = _1458;
    }
    float _1474 = _1466;
    float _1476 = _1474;
    if (_1396)
    {
        float _1478 = _1452 + (-1.0);
        _1444 = _1478;
    }
    float _1480 = _1444;
    float _1482 = _1480;
    if (_1396)
    {
        float _1484 = _1420 * _1470;
        _1142 = _1484;
    }
    float _1486 = _1142;
    float _1488 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1396)
    {
        _1472 = _1388;
    }
    float _1490 = _1472;
    float _1492 = _1490;
    if (_1396)
    {
        float _1494 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1446 = _1494;
    }
    float _1496 = _1446;
    if (!_1396)
    {
        _1482 = _1384;
    }
    float _1498 = _1482;
    float _1500 = _1498;
    if (_1396)
    {
        float _1502 = _1384 * _1486;
        _1500 = _1502;
    }
    float _1504 = _1500;
    float _1506 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1488);
    if (_1396)
    {
        float _1508 = fma(_1458, _1452, _1496);
        _1476 = _1508;
    }
    float _1510 = _1476;
    if (_1396)
    {
        float _1512 = _1386 * _1486;
        _1410 = _1512;
    }
    float _1514 = _1410;
    if (_1396)
    {
        float _1516 = _1504 * _1504;
        _1492 = _1516;
    }
    float _1518 = _1492;
    float _1520 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1506);
    float _1522 = fma(_1038, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1396)
    {
        float _1524 = _1514 * _1514;
        _1412 = _1524;
    }
    float _1526 = _1412;
    float _1528 = fma(_1510, _1510, _1518);
    float _1530 = _1520 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1532 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1534 = _1528 + _1526;
    float _1536 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1538 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1540 = floor(_1522);
    float _1542 = fma(_1032, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1544 = -_1536;
    float _1546 = fma(_1544, _1532, 1.0);
    float _1548 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1538);
    float _1550 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1552 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1554 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1548);
    float _1556 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1550);
    float _1558 = rsqrt(_1534);
    float _1560 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1552);
    float _1562 = _1554 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1564 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1556);
    float _1566 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1560);
    float _1568 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1570 = _1564 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1572 = floor(_1542);
    float _1574 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1576 = fma(_1380, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1574);
    float _1578 = precise::clamp(_1576, 0.0, 1.0);
    float _1580 = _1566 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1582 = -_1578;
    float _1584 = _1582 + 1.0;
    float _1586 = _1558 * _1504;
    float _1588 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1568);
    float _1590 = _1558 * _1510;
    float _1592 = abs(_1584);
    float _1594 = log2(_1592);
    float _1596 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1598 = _1558 * _1514;
    float _1600 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1588);
    float _1602 = -_1596;
    float _1604 = fma(_1590, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1602);
    float _1606 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1608 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1600);
    float _1610 = log2(_1546);
    float _1612 = -_1598;
    float _1614 = fma(_1612, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1604);
    float _1616 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1618 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1606);
    float _1620 = fma(_1614, -0.5, 0.5);
    float _1622 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1616);
    float _1624 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1618);
    float _1626 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1628 = 1.0 / _1608;
    float _1630 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1622);
    float _1632 = fma(_1614, 0.5, 0.5);
    float _1634 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1630);
    float _1636 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1624);
    float _1638 = fma(_1632, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1640 = sqrt(_1620);
    float _1642 = -_1540;
    float _1644 = _1522 + _1642;
    float _1646 = _1614;
    float _1648 = _1540;
    float _1650 = _1608;
    float _1652 = _1636;
    if (_1372)
    {
        _1646 = _1634;
    }
    float _1654 = _1646;
    float _1656 = fma(_1632, _1638, -0.212114393711090087890625);
    float _1658 = _1654;
    if (_1372)
    {
        _1648 = _1636;
    }
    float _1660 = _1648;
    float _1662 = -_1572;
    float _1664 = _1542 + _1662;
    float _1666 = _1660;
    if (!_1372)
    {
        _1658 = 0.0;
    }
    float _1668 = _1658;
    float _1670 = fma(_1632, _1656, 1.570728778839111328125);
    float _1672 = exp2(_1626);
    if (!_1372)
    {
        _1666 = 0.0;
    }
    float _1674 = _1666;
    float _1676 = _1590 + 1.0;
    float _1678 = _1610 * 0.693147182464599609375;
    float _1680 = _1628 * _1668;
    float2 _4948 = float2(_1644, _1664);
    float _1682 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4948, float2(0.0), isnan(_4948)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4948, float2(0.0), isnan(_4948)), level(0.0)).x;
    float _1684 = _1628 * _1674;
    float _1686 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1688 = _1640 * 0.636619746685028076171875;
    float _1690 = fma(_1684, -0.5, 0.5);
    float _1692 = -_1670;
    float _1694 = fma(_1688, _1692, 1.0);
    float _1696 = -_1590;
    float _1698 = fma(_1672, _1676, _1696);
    float _1700 = fma(_1680, 0.5, 0.5);
    float _1702 = fma(_1698, 0.5, 0.5);
    float3 _4986 = float3(_1700, _1690, _1686);
    float _1704 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4986, float3(0.0), isnan(_4986)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4986, float3(0.0), isnan(_4986)), level(0.0)).x;
    float3 _4997 = float3(_1700, _1690, _1686);
    float4 _1707 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4997, float3(0.0), isnan(_4997)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4997, float3(0.0), isnan(_4997)), level(0.0)).xyzw;
    float _1709 = _1707.x;
    float _1711 = _1707.y;
    float _1713 = _1707.z;
    float _1715 = _1707.w;
    float2 _5013 = float2(_1694, _1702);
    float3 _1719 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5013, float2(0.0), isnan(_5013)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5013, float2(0.0), isnan(_5013)), level(0.0)).xyz;
    float _1721 = _1719.x;
    float _1723 = _1719.y;
    float _1725 = _1719.z;
    float _1727 = _1108 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1729 = _1108 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1731 = in.m_55.w;
    bool _1733 = _256 > 0.5;
    float _1735 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1727);
    float _1737 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1729);
    out.m_67.x = _394;
    float _1739 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1735);
    float _1741 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1737);
    float _1743 = in.m_69.y;
    float _1745 = _1739 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1747 = _1741 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1749 = in.m_69.x;
    float _1751 = 1.0 / _1745;
    float _1753 = _1747 + _1745;
    float _1755 = in.m_59.y;
    int _1757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1759 = _1757 != 0;
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1765 = _1763 != 0;
    float _1767 = in.m_71.z;
    int _1769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1771 = _1769 != 0;
    float _1773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1777 = _1775 != 0;
    float _1779 = in.m_71.x;
    bool _1781 = _1731 > 0.5;
    float _1783 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1785 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_73.x = _1268;
    out.m_73.y = _1266;
    out.m_73.z = _1270;
    float _1787 = _1753 * _1751;
    float _1789 = _1787 * 0.5;
    float _1791 = -_1743;
    float _1793 = _1791 + 1.0;
    float _1795 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1785);
    float _1797 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1799 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1797);
    float _1801 = 0.0;
    float _1803 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    bool _1805 = _1771;
    bool _1807 = _1781;
    float _1809 = _1743;
    if (!_1759)
    {
        _1801 = _1749;
    }
    float _1811 = _1801;
    float _1813 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1795);
    int _1815 = _1781 ? as_type<int>(_1793) : as_type<int>(_1743);
    out.m_67.y = _1755;
    float _1817 = _1811;
    if (!_1759)
    {
        _1803 = _1811;
    }
    float _1819 = _1803;
    float _1821 = 1.0 / _1799;
    float _1823 = _1819;
    if (_1759)
    {
        _1817 = _1749;
    }
    float _1825 = _1817;
    float _1827 = _1767 + (-0.039999999105930328369140625);
    float _1829 = _1771 ? as_type<float>(_1815) : _1743;
    float _1831 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1813);
    float _1833 = _1831;
    if (_1765)
    {
        bool _1835 = _228 > 0.5;
        _1805 = _1835;
    }
    bool _1837 = _1805;
    if (_1765)
    {
        float _1839 = -_1825;
        float _1841 = _1839 + 1.0;
        _486 = as_type<int>(_1841);
    }
    int _1843 = _486;
    float _1845 = -_800;
    float _1847 = _1845 + _1779;
    if (!_1765)
    {
        _584 = _1825;
    }
    float _1849 = _584;
    float _1851 = _1849;
    if (_1759)
    {
        float _1853 = -_1825;
        float _1855 = _1853 + 1.0;
        _488 = as_type<int>(_1855);
    }
    int _1857 = _488;
    if (_1759)
    {
        bool _1859 = _234 > 0.5;
        _1807 = _1859;
    }
    bool _1861 = _1807;
    float _1863 = _784 * _1847;
    if (_1765)
    {
        float _1865 = _1837 ? as_type<float>(_1843) : _1825;
        _1851 = _1865;
    }
    float _1867 = _1851;
    float _1869 = _758 * _1847;
    float _1871 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1873 = fma(_758, _1827, _1863);
    float _1875 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1877 = _1821 * _1875;
    float _1879 = -_1869;
    float _1881 = fma(_784, _1827, _1879);
    if (_1777)
    {
        float _1883 = _1733 ? _1793 : _1743;
        _1809 = _1883;
    }
    float _1885 = _1809;
    float _1887 = _1867 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1889 = _274 != 0.0;
    bool _1891 = isnan(_274);
    bool _1893 = _1889 || _1891;
    bool _1895 = isnan(0.0);
    bool _1897 = _1893 || _1895;
    float _1899 = _1761 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1901 = abs(_1877);
    float _1903 = log2(_1901);
    if (_1759)
    {
        float _1905 = _1861 ? as_type<float>(_1857) : _1825;
        _1823 = _1905;
    }
    float _1907 = _1823;
    float _1909 = _1885 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1911 = -_800;
    bool _1913 = _868 == _1911;
    bool _1915 = !_1897;
    bool _1917 = _1913 && _1915;
    float _1919 = _1829 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1921 = _800 + _1873;
    float _1923 = _1907 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1925 = _864 == (-0.039999999105930328369140625);
    bool _1927 = _1925 && _1917;
    float _1929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1931 = _1919 * _1871;
    float _1933 = _1909 * _1773;
    float _1935 = in.m_71.y;
    float _1937 = in.m_75.x;
    float _1939 = in.m_75.y;
    float _1941 = in.m_75.z;
    float _1943 = in.m_75.w;
    float _1945 = _1903 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1947 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1949 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.gl_Position.x = _1634;
    out.gl_Position.y = _1636;
    out.gl_Position.z = _1831;
    out.gl_Position.w = _1608;
    float _1951 = _1949 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1953 = _1923 * _1929;
    float _1955 = exp2(_1945);
    float _1957 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1959 = _1881 + 0.039999999105930328369140625;
    float _1961 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1963 = _1957 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1965 = _1903;
    if (_1927)
    {
        _1965 = _1959;
    }
    float _1967 = _1965;
    float _1969 = _1887 * _1947;
    float _1971 = _1967;
    float _1973 = _1947;
    if (!_1927)
    {
        float _1975 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1959);
        _1971 = _1975;
    }
    float _1977 = _1971;
    out.m_77.x = _1951;
    out.m_77.y = _1963;
    out.m_77.z = _1899;
    if (_1927)
    {
        _1973 = _1921;
    }
    float _1979 = _1973;
    float _1981 = _1979;
    if (!_1927)
    {
        float _1983 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1921);
        _1981 = _1983;
    }
    float _1985 = _1981;
    if (_1927)
    {
        _1144 = _1935;
    }
    float _1987 = _1144;
    out.m_79.x = _1953;
    out.m_79.y = _1933;
    out.m_79.z = _1969;
    out.m_79.w = _1931;
    float _1989 = _1921 * _1941;
    float _1991 = fma(_1955, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1993 = precise::clamp(_1991, 0.0, 1.0);
    float _1995 = _1987;
    if (!_1927)
    {
        float _1997 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1935);
        _1995 = _1997;
    }
    float _1999 = _1995;
    out.m_81.w = _1961;
    bool _2001 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2003 = isnan(_1380);
    bool _2005 = _2001 || _2003;
    bool _2007 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2009 = _2005 || _2007;
    float _2011 = _1959 * _1939;
    float _2013 = -_1989;
    float _2015 = fma(_1959, _1937, _2013);
    float _2017 = exp2(_1783);
    float _2019 = -_2011;
    float _2021 = fma(_1941, _1935, _2019);
    float _2023 = _2015 * _1943;
    float _2025 = _1937 * _1935;
    float _2027 = fma(_1993, -2.0, 3.0);
    float _2029 = _1993 * _1993;
    float _2031 = _2021 * _1943;
    float _2033 = -_2025;
    float _2035 = fma(_1921, _1939, _2033);
    float _2037 = _1074 * _1939;
    float _2039 = _2029 * _2027;
    float _2041 = _1074 * _1999;
    float _2043 = _2035 * _1943;
    float _2045 = _984 * _1939;
    float _2047 = _984 * _1999;
    float _2049 = _1012 * _1939;
    float _2051 = _1012 * _1999;
    float _2053 = _984 * _2023;
    float _2055 = _1012 * _2023;
    float _2057 = _1074 * _2023;
    float _2059 = fma(_986, _1985, _2047);
    float _2061 = fma(_1084, _1985, _2041);
    float _2063 = fma(_986, _1937, _2045);
    float _2065 = fma(_1084, _1937, _2037);
    float _2067 = fma(_1016, _1937, _2049);
    float _2069 = -_2039;
    float _2071 = _2069 + 1.0;
    float _2073 = fma(_988, _1941, _2063);
    float _2075 = fma(_1100, _1941, _2065);
    float _2077 = fma(_1018, _1941, _2067);
    bool _2079 = _1877 <= 8000.0;
    bool _2081 = isnan(_1877);
    bool _2083 = _2079 || _2081;
    bool _2085 = isnan(8000.0);
    bool _2087 = _2083 || _2085;
    float _2089 = float(_2087);
    float _2091 = in.m_65.x;
    float _2093 = fma(_2071, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2039);
    float _2095 = fma(_988, _1977, _2059);
    float _2097 = -_2017;
    float _2099 = _2097 + 1.0;
    float _2101 = fma(_986, _2031, _2053);
    float _2103 = _2089 * _2093;
    float _2105 = fma(_1084, _2031, _2057);
    float _2107 = fma(_1016, _2031, _2055);
    out.m_83.x = _2073;
    out.m_83.y = _2075;
    out.m_83.z = _2077;
    float _2109 = _2103 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2111 = _2099 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2113 = fma(_988, _2043, _2101);
    float _2115 = fma(_1100, _2043, _2105);
    float _2117 = fma(_1018, _2043, _2107);
    float _2119 = fma(_1016, _1985, _2051);
    float _2121 = _1831 + _1608;
    float _2123 = -_2111;
    float _2125 = _2123 + 1.0;
    float _2127 = fma(_1100, _1977, _2061);
    out.m_85.x = _2113;
    out.m_85.y = _2115;
    out.m_85.z = _2117;
    int _2129 = as_type<int>(_2065);
    float _2131 = _2075;
    float _2133 = _2125;
    if (!_1372)
    {
        float _2135 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        _2129 = as_type<int>(_2135);
    }
    int _2137 = _2129;
    float _2139 = fma(_1018, _1977, _2119);
    float _2141 = _2121 * 0.5;
    float _2143 = _1346 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2145 = _2143;
    float _2147 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_1372)
    {
        _2145 = 0.0;
    }
    float _2149 = _2145;
    out.m_87.x = _2095;
    out.m_87.y = _2127;
    out.m_87.z = _2139;
    if (!_2009)
    {
        _2131 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2151 = _2131;
    float _2153 = _2151;
    float _2155 = _2151;
    if (!_2009)
    {
        _1650 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2157 = _1650;
    float _2159 = _2157;
    float _2161 = _2157;
    if (!_1372)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5789 = as_type<float>(_2137);
        out.gl_Position.z = _5789;
    }
    if (!_2009)
    {
        _1833 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2163 = _1833;
    float _2165 = _2163;
    float _2167 = _2163;
    if (!_2009)
    {
        _1652 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2169 = _1652;
    out.m_89.z = _2141;
    out.m_89.w = _1608;
    float _2171 = -_1682;
    float _2173 = _2171 + 1.0;
    float _2175 = _2173 * _2109;
    float _2177 = precise::clamp(_2175, 0.0, 1.0);
    float _2179 = -_2177;
    float _2181 = fma(_2179, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2183 = _2169;
    float _2185 = _2169;
    if (!_2009)
    {
        _2147 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2187 = _2147;
    float _2189 = _2181 * _2091;
    float _2191 = _2111 * _1704;
    float _2193 = _2189 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2195 = _1715 * _2125;
    float _2197 = _2187;
    float _2199 = _2187;
    if (!_2009)
    {
        _2133 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2201 = _2133;
    float _2203 = _1715 * _2191;
    float _2205 = _1725 * _2191;
    out.m_91.x = _2193;
    float _2207 = fma(_1721, _2203, _1709);
    float _2209 = fma(_1723, _2203, _1711);
    float _2211 = fma(_1715, _2205, _1713);
    out.m_93.x = _2207;
    out.m_93.y = _2209;
    out.m_93.z = _2211;
    out.m_93.w = _2195;
    bool _2213 = !_2009;
    float _2215 = _2201;
    float _2217 = _2201;
    if (!_2213)
    {
        bool _2219 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2221 = isnan(_1380);
        bool _2223 = _2219 || _2221;
        bool _2225 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2227 = _2223 || _2225;
        if (!_2227)
        {
            float _2229 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2231 = _1380 + _2229;
            float _2233 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2235 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2233;
            float _2237 = 1.0 / _2235;
            float _2239 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2241 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2245 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2249 = _2247 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2257 = _2255 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2259 = _2231 * _2237;
            float _2261 = precise::clamp(_2259, 0.0, 1.0);
            float _2263 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2265 = _2263 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2267 = fma(_2261, _2241, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2269 = fma(_2261, _2265, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2271 = fma(_2261, _2245, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2273 = fma(_2261, _2249, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2275 = fma(_2261, _2253, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2277 = fma(_2261, _2257, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2199 = _2269;
            _2185 = _2275;
            _2155 = _2267;
            _2167 = _2273;
            _2161 = _2271;
            _2217 = _2277;
            _2279 = true;
        }
        else
        {
            bool _2281 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2283 = isnan(_1380);
            bool _2285 = _2281 || _2283;
            bool _2287 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2289 = _2285 || _2287;
            if (!_2289)
            {
                _2153 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2291 = _2153;
            _2155 = _2291;
            if (!_2289)
            {
                _2197 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2293 = _2197;
            _2199 = _2293;
            if (!_2289)
            {
                _2159 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2295 = _2159;
            _2161 = _2295;
            if (!_2289)
            {
                _2165 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2297 = _2165;
            _2167 = _2297;
            if (!_2289)
            {
                _2183 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2299 = _2183;
            _2185 = _2299;
            if (!_2289)
            {
                _2215 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2301 = _2215;
            bool _2303 = !_2289;
            _2217 = _2301;
            if (!_2303)
            {
                bool _2305 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2307 = isnan(_1380);
                bool _2309 = _2305 || _2307;
                bool _2311 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2313 = _2309 || _2311;
                if (!_2313)
                {
                    float _2315 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2317 = _1380 + _2315;
                    float _2319 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2321 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2319;
                    float _2323 = 1.0 / _2321;
                    float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2327 = _2325 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2329 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2331 = _2329 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2337 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2339 = _2337 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2341 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2343 = _2341 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2345 = _2317 * _2323;
                    float _2347 = precise::clamp(_2345, 0.0, 1.0);
                    float _2349 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2351 = _2349 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2353 = fma(_2347, _2327, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2355 = fma(_2347, _2351, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2357 = fma(_2347, _2331, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2359 = fma(_2347, _2335, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2361 = fma(_2347, _2339, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2363 = fma(_2347, _2343, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2199 = _2355;
                    _2185 = _2361;
                    _2155 = _2353;
                    _2167 = _2359;
                    _2161 = _2357;
                    _2217 = _2363;
                    _2279 = true;
                }
                else
                {
                    _2199 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2185 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2155 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2167 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2161 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2217 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2279 = false;
    float _2365 = _2199;
    float _2367 = _2185;
    float _2369 = _2155;
    float _2371 = _2167;
    float _2373 = _2161;
    float _2375 = _2217;
    float _2377 = fma(_2127, -0.5, 0.5);
    float _2379 = precise::clamp(_2377, 0.0, 1.0);
    float _2381 = -_2365;
    float _2383 = _2381 + _2367;
    float _2385 = -_2369;
    float _2387 = _2385 + _2371;
    float _2389 = -_2373;
    float _2391 = _2389 + _2375;
    bool _2393 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2395 = fma(_2379, _2383, _2365);
    float _2397 = fma(_2379, _2387, _2369);
    float _2399 = fma(_2379, _2391, _2373);
    float _2401 = _2149 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2403 = _2395 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _2405 = fma(_2397, 0.298911988735198974609375, _2403);
    out.m_91.w = _2401;
    float _2407 = fma(_2399, 0.114477999508380889892578125, _2405);
    out.m_95.x = 0.0;
    float _2409 = -_2407;
    float _2411 = _2397 + _2409;
    float _2413 = -_2407;
    float _2415 = _2395 + _2413;
    float _2417 = -_2407;
    float _2419 = _2399 + _2417;
    float _2421 = fma(_2411, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2407);
    float _2423 = fma(_2415, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2407);
    float _2425 = fma(_2419, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2407);
    out.m_97.x = _2421;
    out.m_97.y = _2423;
    out.m_97.z = _2425;
    if (!_2393)
    {
        return out;
    }
    float _2427 = -_1266;
    float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2431 = -_1268;
    float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2435 = -_1270;
    float _2437 = _2435 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2439 = _2429 * _2429;
    float _2441 = fma(_2433, _2433, _2439);
    float _2443 = fma(_2437, _2437, _2441);
    float _2445 = sqrt(_2443);
    float _2447 = rsqrt(_2443);
    float _2449 = -_2445;
    float _2451 = _2449 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2453 = _2451 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2455 = precise::clamp(_2453, 0.0, 1.0);
    float _2457 = _2433 * _2447;
    float _2459 = _2429 * _2447;
    float _2461 = abs(_2455);
    float _2463 = log2(_2461);
    float _2465 = _2437 * _2447;
    float _2467 = _2457 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2469 = _2127 * _2459;
    float _2471 = -_2459;
    float _2473 = -_2467;
    float _2475 = fma(_2471, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2473);
    float _2477 = fma(_2095, _2457, _2469);
    float _2479 = -_2465;
    float _2481 = fma(_2479, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2475);
    float _2483 = fma(_2139, _2465, _2477);
    float _2485 = precise::clamp(_2483, 0.0, 1.0);
    float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2489 = _2481 + _2487;
    float _2491 = _2463 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2493 = _2489 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2495 = precise::clamp(_2493, 0.0, 1.0);
    float _2497 = exp2(_2491);
    float _2499 = _2497 * _2495;
    float _2501 = _2485 * _2499;
    float _2503 = _2501 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2505 = _2501 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2507 = _2501 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _2503;
    out.m_95.y = _2505;
    out.m_95.z = _2507;
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
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2279 = false;
    bool _218 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    float _126 = _124;
    if (!_120)
    {
        out.m_49.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _124 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2564 = as_type<float>(_132);
        out.gl_Position.z = _2564;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _136 = in.m_51.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = _150;
    if (_146)
    {
        float _154 = float(_116);
        _126 = _154;
    }
    float _156 = _126;
    bool _158 = _150 >= _156;
    bool _160 = !_146;
    bool _162 = _158 || _160;
    float _164 = _156;
    if (_162)
    {
        _164 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _164;
    if (_162)
    {
        out.m_49.x = 0.0;
    }
    if (_162)
    {
        float _168 = _166 * 5.0;
        _134 = as_type<int>(_168);
    }
    int _170 = _134;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2634 = as_type<float>(_170);
        out.gl_Position.z = _2634;
    }
    if (_162)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _172 = in.m_53.x;
    float _174 = in.m_53.y;
    float _176 = in.m_53.z;
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _180 = _174 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _182 = _174 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _184 = _174 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _186 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].x, _180);
    float _188 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].x, _182);
    float _190 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].x, _184);
    float _192 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[4].z, _186);
    float _194 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[5].z, _188);
    float _196 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[6].z, _190);
    bool _198 = !_178;
    float _216;
    if (!_198)
    {
        float _200 = in.m_55.x;
        float _202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _204 = _200 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _206 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _208 = _206 * _202;
        float _210 = floor(_208);
        float _212 = -_210;
        float _214 = _208 + _212;
        _216 = _214;
        _218 = true;
    }
    else
    {
        float _220 = float(_116);
        float _222 = 1.0 / _220;
        float _224 = _150 * _222;
        _216 = _224;
    }
    _218 = false;
    float _226 = _216;
    float _228 = in.m_55.z;
    float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _232 = log2(_230);
    float _234 = in.m_55.x;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _242 = _240 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _246 = _244 != 0;
    int _248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _250 = _248 != 0;
    int _252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _254 = _252 != 0;
    float _256 = in.m_55.y;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _260 = _226 + _258;
    float _262 = 1.0 / _242;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _270 = _226 + _268;
    float _272 = _194 * _194;
    float _274 = in.m_57.y;
    float _276 = 1.0 / _238;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _282;
    float _286 = fma(_192, _192, _272);
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _290 = _288 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _296 = _228 * 2.0;
    float _298 = fma(_196, _196, _286);
    float _300 = _260 * _262;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _226 + _302;
    float _306 = _234 * 2.0;
    float _308 = floor(_296);
    float _310 = _234 + _228;
    float _312 = _256 * 2.0;
    float _314 = fma(_290, _300, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _316 = _304 * _276;
    float _318 = _256 + _228;
    float _320 = _310 + (-1.0);
    float _322 = floor(_306);
    float _324 = _318 + (-1.0);
    float _326 = fma(_280, _316, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _328 = fma(_284, _316, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _330 = fma(_294, _300, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _332 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _334 = _234 + _256;
    float _336 = floor(_312);
    float _338 = _232 * _150;
    float _340 = _334 + (-1.0);
    bool _342 = _308 >= 0.0;
    bool _344 = isnan(_308);
    bool _346 = _342 || _344;
    bool _348 = isnan(0.0);
    bool _350 = _346 || _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _352;
    bool _356 = _308 > 0.0;
    float _358 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _360 = exp2(_338);
    bool _362 = _322 >= 0.0;
    bool _364 = isnan(_322);
    bool _366 = _362 || _364;
    bool _368 = isnan(0.0);
    bool _370 = _366 || _368;
    float _372 = in.m_57.x;
    bool _374 = _322 > 0.0;
    int _376 = _370 ? 0 : 1;
    float _378 = 1.0 / _266;
    bool _380 = _336 > 0.0;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _382;
    float _386 = -_360;
    float _388 = _386 + 1.0;
    float _390 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _392 = _350 ? 0 : 1;
    float _394 = in.m_59.x;
    bool _396 = _336 >= 0.0;
    bool _398 = isnan(_336);
    bool _400 = _396 || _398;
    bool _402 = isnan(0.0);
    bool _404 = _400 || _402;
    float _406 = rsqrt(_298);
    int _408 = _404 ? 0 : 1;
    float _410 = _270 * _378;
    bool _412 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _414 = isnan(0.0);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _420 = _416 || _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _424 = 1.0 + _422;
    float _426 = fma(_354, _410, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _428 = _420 ? _388 : 0.0;
    float _430 = 1.0 / _424;
    bool _432 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _434 = isnan(1.0);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _440 = _436 || _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _442;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _450 = fma(_384, _410, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _452 = fma(_444, _316, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _454 = _226 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _456 = isnan(_226);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = fma(_448, _300, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _468 = fma(_234, 6.283185482025146484375, _150);
    float _470 = _192 * _406;
    float _472 = _194 * _406;
    float _474 = _468 * 0.15915493667125701904296875;
    float _476 = _196 * _406;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _478;
    float _482 = _332;
    float _484 = _390;
    int _486 = as_type<int>(_228);
    int _488 = as_type<int>(_256);
    if (_440)
    {
        float _490 = _428 * _430;
        _152 = _490;
    }
    float _492 = _152;
    bool _494 = _226 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _496 = isnan(_226);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = -_394;
    float _508 = _506 + 1.0;
    bool _510 = _372 >= 0.0;
    bool _512 = isnan(_372);
    bool _514 = _510 || _512;
    bool _516 = isnan(0.0);
    bool _518 = _514 || _516;
    float _520 = _474 * 6.283185482025146484375;
    float _522 = sin(_520);
    bool _524 = _226 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _526 = isnan(_226);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -_504;
    float _538 = _536 + 1.0;
    int _540 = _518 ? 0 : 1;
    float _542 = fma(_480, _410, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _544 = _372 > 0.0;
    float _546 = _464 * _538;
    float _548 = -_464;
    float _550 = _548 + 1.0;
    bool _552 = _226 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _554 = isnan(_226);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    int _564 = ~_540;
    int _566 = _564 + 1;
    int _568 = _566 + 1;
    float _570 = _534 * _550;
    float _572 = -_534;
    float _574 = _572 + 1.0;
    float _576 = _562 * _574;
    float _578 = -_562;
    float _580 = _578 + 1.0;
    int _582 = _568;
    float _584 = _394;
    if (!_544)
    {
        int _586 = ~_540;
        int _588 = _586 + 1;
        _582 = _588;
    }
    int _590 = _582;
    float _592 = _522 * 0.52359879016876220703125;
    float _594 = _326 * _576;
    float _596 = _452 * _576;
    float _598 = _328 * _576;
    float _600 = _508 * _592;
    float _602 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[143].x, _594);
    float _604 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[143].y, _596);
    float _606 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[143].z, _598);
    int _608 = ~_392;
    int _610 = _608 + 1;
    int _612 = _610 + 1;
    float _614 = fma(_314, _570, _602);
    int _616 = ~_376;
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    float _622 = fma(_330, _570, _606);
    int _624 = _612;
    int _626 = _620;
    if (!_356)
    {
        int _628 = ~_392;
        int _630 = _628 + 1;
        _624 = _630;
    }
    int _632 = _624;
    float _634 = fma(_466, _570, _604);
    if (!_374)
    {
        int _636 = ~_376;
        int _638 = _636 + 1;
        _626 = _638;
    }
    int _640 = _626;
    float _642 = fma(_542, _546, _614);
    bool _644 = !_246;
    int _646 = _644 ? 0 : 1;
    float _648 = fma(_426, _546, _634);
    bool _650 = !_250;
    int _652 = _650 ? 0 : 1;
    float _654 = fma(_450, _546, _622);
    bool _656 = !_254;
    int _658 = _656 ? 0 : 1;
    float _660 = _472 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _662 = abs(_646);
    int _664 = abs(_652);
    int _666 = abs(_658);
    float _668 = in.m_61.x;
    float _670 = in.m_61.y;
    float _672 = in.m_61.z;
    float _674 = float(_662);
    float _676 = float(_632);
    int _678 = ~_408;
    int _680 = _678 + 1;
    int _682 = _680 + 1;
    int _684 = _682;
    float _686 = as_type<float>(_640);
    if (!_380)
    {
        int _688 = ~_408;
        int _690 = _688 + 1;
        _684 = _690;
    }
    int _692 = _684;
    float _694 = _674 * _676;
    float _696 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[8].y, _660);
    float _698 = float(_590);
    float _700 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[146].x, _642);
    float _702 = _694 * (-2.0);
    float _704 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[146].z, _654);
    float _706 = float(_664);
    float _708 = _234 + (-0.5);
    float _710 = float(_640);
    float _712 = fma(_358, _702, _358);
    float _714 = float(_666);
    float _716 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[10].y, _696);
    float _718 = float(_692);
    float _720 = _706 * _710;
    float _722 = _698 * _600;
    float _724 = fma(_702, _668, _668);
    float _726 = _720 * (-2.0);
    float _728 = _714 * _718;
    float _730 = abs(_716);
    bool _732 = _730 > 0.99989998340606689453125;
    float _734 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[196].x, _724);
    float _736 = fma(_726, _670, _670);
    float _738 = _728 * (-2.0);
    float _740 = fma(_332, _726, _332);
    float _742 = fma(_712, _492, _734);
    float _744 = _722 * (-0.15915493667125701904296875);
    float _746 = fma(_738, _672, _672);
    float _748 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[146].y, _648);
    float _750 = _742 * 0.15915493667125701904296875;
    float _752 = _256 + (-0.5);
    float _754 = in.m_57.z;
    float _756 = _744 * 6.283185482025146484375;
    float _758 = sin(_756);
    float _760 = _728;
    if (_732)
    {
        _686 = 0.001000000047497451305389404296875;
    }
    float _762 = _686;
    float _764 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[196].y, _736);
    float _766 = in.m_63.x;
    float _768 = in.m_63.y;
    float _770 = in.m_63.z;
    if (!_732)
    {
        _760 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _772 = _760;
    float _774 = _772;
    if (_732)
    {
        float _776 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _774 = _776;
    }
    float _778 = _774;
    float _780 = fma(_390, _738, _390);
    float _782 = _744 * 6.283185482025146484375;
    float _784 = cos(_782);
    if (!_732)
    {
        _482 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _786 = _482;
    float _788 = _228 + (-0.5);
    float _790 = _786;
    if (!_732)
    {
        _484 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _792 = _484;
    float _794 = _792;
    if (_732)
    {
        float _796 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _794 = _796;
    }
    float _798 = _794;
    float _800 = _698 * 0.0500000007450580596923828125;
    float _802 = fma(_740, _492, _764);
    float _804 = _750 * 6.283185482025146484375;
    float _806 = sin(_804);
    float _808 = -_800;
    float _810 = _808 + _372;
    float _812 = _802 * 0.15915493667125701904296875;
    if (_732)
    {
        float _814 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _790 = _814;
    }
    float _816 = _790;
    float _818 = -_778;
    float _820 = _476 * _818;
    float _822 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[196].z, _746);
    float _824 = _754 + (-0.039999999105930328369140625);
    float _826 = _758 * _810;
    float _828 = -_798;
    float _830 = -_820;
    float _832 = fma(_470, _828, _830);
    float _834 = -_798;
    float _836 = _472 * _834;
    float _838 = fma(_780, _492, _822);
    float _840 = -_816;
    float _842 = _470 * _840;
    float _844 = _700 * _766;
    float _846 = -_816;
    float _848 = -_836;
    float _850 = fma(_476, _846, _848);
    float _852 = _832 * _832;
    float _854 = _784 * _810;
    float _856 = -_778;
    float _858 = -_842;
    float _860 = fma(_472, _856, _858);
    float _862 = -_826;
    float _864 = fma(_784, _824, _862);
    float _866 = fma(_850, _850, _852);
    float _868 = fma(_758, _824, _854);
    float _870 = _838 * 0.15915493667125701904296875;
    float _872 = _750 * 6.283185482025146484375;
    float _874 = cos(_872);
    float _876 = fma(_860, _860, _866);
    float _878 = _748 * _768;
    float _880 = _800 + _868;
    float _882 = _844 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _884 = _878 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _886 = _864 + 0.039999999105930328369140625;
    float _888 = _812 * 6.283185482025146484375;
    float _890 = sin(_888);
    float _892 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _880);
    float _894 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _274);
    float _896 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _886);
    float _898 = _892 * _882;
    float _900 = _894 * _884;
    float _902 = _812 * 6.283185482025146484375;
    float _904 = cos(_902);
    float _906 = _870 * 6.283185482025146484375;
    float _908 = cos(_906);
    float _910 = _704 * _770;
    float _912 = _806 * _890;
    float _914 = in.m_46.x;
    float _916 = in.m_46.y;
    float _918 = in.m_46.z;
    float _920 = rsqrt(_876);
    float _922 = _874 * _904;
    float _924 = _806 * _904;
    float _926 = _870 * 6.283185482025146484375;
    float _928 = sin(_926);
    float _930 = _874 * _908;
    float _932 = _806 * _908;
    float _934 = _860 * _920;
    float _936 = _874 * _890;
    float _938 = _904 * _908;
    float _940 = _890 * _908;
    float _942 = _832 * _920;
    float _944 = _850 * _920;
    float _946 = _916 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _948 = fma(_928, _922, _912);
    float _950 = -_924;
    float _952 = fma(_928, _936, _950);
    float _954 = fma(_928, _912, _922);
    float _956 = -_936;
    float _958 = fma(_928, _924, _956);
    float _960 = _910 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _962 = _472 * _934;
    float _964 = _470 * _930;
    float _966 = _948 * _470;
    float _968 = _470 * _952;
    float _970 = -_962;
    float _972 = fma(_476, _942, _970);
    float _974 = -_928;
    float _976 = fma(_974, _944, _964);
    float _978 = fma(_938, _944, _966);
    float _980 = fma(_940, _944, _968);
    float _982 = _896 * _960;
    float _984 = fma(_932, _972, _976);
    float _986 = fma(_958, _972, _978);
    float _988 = fma(_954, _972, _980);
    float _990 = _476 * _930;
    float _992 = _470 * _942;
    float _994 = _948 * _476;
    float _996 = _476 * _952;
    float _998 = -_928;
    float _1000 = fma(_998, _934, _990);
    float _1002 = -_992;
    float _1004 = fma(_472, _944, _1002);
    float _1006 = _916 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1008 = fma(_938, _934, _994);
    float _1010 = fma(_940, _934, _996);
    float _1012 = fma(_932, _1004, _1000);
    float _1014 = fma(_914, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1006);
    float _1016 = fma(_958, _1004, _1008);
    float _1018 = fma(_954, _1004, _1010);
    float _1020 = _900 * _1012;
    float _1022 = fma(_914, (*spvDescriptorSet0.vp_c10)._m0[4].x, _946);
    float _1024 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1014);
    float _1026 = _900 * _984;
    float _1028 = fma(_898, _1016, _1020);
    float _1030 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1022);
    float _1032 = _1024 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1034 = fma(_898, _986, _1026);
    float _1036 = fma(_982, _1018, _1028);
    float _1038 = _1030 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1040 = _476 * _944;
    float _1042 = fma(_982, _988, _1034);
    float _1044 = _1032 + _1036;
    float _1046 = _472 * _930;
    float _1048 = _948 * _472;
    float _1050 = _1038 + _1042;
    float _1052 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1054 = _1044 + _1052;
    float _1056 = -_928;
    float _1058 = fma(_1056, _942, _1046);
    float _1060 = -_1040;
    float _1062 = fma(_470, _934, _1060);
    float _1064 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1066 = _1050 + _1064;
    float _1068 = _1054 * _1054;
    float _1070 = _472 * _952;
    float _1072 = fma(_938, _942, _1048);
    float _1074 = fma(_932, _1062, _1058);
    float _1076 = fma(_1066, _1066, _1068);
    float _1078 = _916 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1080 = fma(_940, _942, _1070);
    float _1082 = sqrt(_1076);
    float _1084 = fma(_958, _1062, _1072);
    float _1086 = _900 * _1074;
    float _1088 = fma(_914, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1078);
    bool _1090 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1092 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1094 = _1090 || _1092;
    bool _1096 = isnan(0.5);
    bool _1098 = _1094 || _1096;
    float _1100 = fma(_954, _1062, _1080);
    float _1102 = fma(_898, _1084, _1086);
    float _1104 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1088);
    float _1106 = fma(_982, _1100, _1102);
    float _1108 = _1104 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1110 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan(0.5);
    bool _1118 = _1114 || _1116;
    float _1120 = _1108 + _1106;
    bool _1122 = _1082 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1124 = _1046;
    float _1126 = _1104;
    float _1128 = _1050;
    float _1130 = _1044;
    float _1132 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1134 = _918;
    float _1136 = _1058;
    float _1138 = _898;
    float _1140 = _1080;
    float _1142 = _1040;
    float _1144 = _880;
    if (_1098)
    {
        _1124 = 1.0;
    }
    float _1146 = _1124;
    float _1148 = _1146;
    if (!_1122)
    {
        _1126 = _1120;
    }
    float _1150 = _1126;
    bool _1152 = !_1122;
    float _1154 = _1150;
    if (!_1152)
    {
        float _1156 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1158 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1160 = _1082 + _1158;
        float _1162 = _1120 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1164 = rsqrt(_1076);
        float _1166 = _1160 * _1156;
        float _1168 = _1166 * 0.15915493667125701904296875;
        float _1170 = _1168 * 6.283185482025146484375;
        float _1172 = cos(_1170);
        float _1174 = _1168 * 6.283185482025146484375;
        float _1176 = sin(_1174);
        float _1178 = _1172 + (-1.0);
        float _1180 = _1178 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1182 = fma(_1176, _1162, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1184 = fma(_1120, _1172, _1180);
        float _1186 = _1164 * _1182;
        float _1188 = fma(_1066, _1186, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1190 = fma(_1054, _1186, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1128 = _1188;
        _1130 = _1190;
        _1154 = _1184;
        _1132 = _1176;
        _1134 = _1180;
    }
    float _1192 = _1128;
    float _1194 = _1130;
    float _1196 = _1154;
    float _1198 = _1132;
    float _1200 = _1134;
    float _1202 = _1198;
    float _1204 = _1200;
    float _1206 = _1196;
    if (_1118)
    {
        _1202 = _1192;
    }
    float _1208 = _1202;
    float _1210 = _1208;
    if (_1118)
    {
        _1204 = _1194;
    }
    float _1212 = _1204;
    float _1214 = _1212;
    if (!_1118)
    {
        float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1218 = _1108 + _1216;
        float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1222 = _1038 + _1220;
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1226 = -_1038;
        float _1228 = _1226 + _1192;
        float _1230 = _1218 * _1218;
        float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1234 = _1032 + _1232;
        float _1236 = fma(_1222, _1222, _1230);
        float _1238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1240 = fma(_1234, _1234, _1236);
        float _1242 = sqrt(_1240);
        float _1244 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1246 = precise::min(_1242, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1248 = _1246 * _1238;
        float _1250 = -_1108;
        float _1252 = _1250 + _1196;
        float _1254 = _1244 * _1248;
        float _1256 = -_1032;
        float _1258 = _1256 + _1194;
        float _1260 = fma(_1252, _1254, _1108);
        float _1262 = fma(_1228, _1254, _1038);
        float _1264 = fma(_1258, _1254, _1032);
        _1206 = _1260;
        _1210 = _1262;
        _1214 = _1264;
        _1136 = _1258;
    }
    float _1266 = _1206;
    float _1268 = _1210;
    float _1270 = _1214;
    float _1272 = _1136;
    if (!_1098)
    {
        float _1274 = in.m_65.w;
        int _1276 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _1278 = _1276 == 4;
        bool _1280 = _1276 == 8;
        bool _1282 = _1276 == 12;
        int _1284 = as_type<int>(_1274) << 16;
        int _1286 = as_type<int>(_1274) << 8;
        int _1288 = as_type<int>(_1274) << 24;
        int _1290 = _1284 >> 24;
        int _1292 = _1286 >> 24;
        int _1294 = as_type<int>(_1274) >> 24;
        int _1296 = _1288 >> 24;
        float _1298 = float(_1290);
        float _1300 = float(_1292);
        float _1302 = float(_1294);
        float _1304 = _1298 * 0.0078740157186985015869140625;
        float _1306 = float(_1296);
        float _1308 = _1300 * 0.0078740157186985015869140625;
        float _1310 = _1302 * 0.0078740157186985015869140625;
        float _1312 = precise::min(_1304, 1.0);
        float _1314 = _1306 * 0.0078740157186985015869140625;
        float _1316 = precise::min(_1308, 1.0);
        float _1318 = precise::min(_1310, 1.0);
        float _1320 = precise::min(_1314, 1.0);
        float _1322 = precise::max(_1312, -1.0);
        float _1324 = precise::max(_1316, -1.0);
        float _1326 = precise::max(_1318, -1.0);
        float _1328 = precise::max(_1320, -1.0);
        float _1330 = _1328;
        _1138 = as_type<float>(_1276);
        if (_1278)
        {
            _1330 = _1322;
        }
        float _1332 = _1330;
        float _1334 = _1332;
        if (_1280)
        {
            _1334 = _1324;
        }
        float _1336 = _1334;
        float _1338 = _1336;
        if (_1282)
        {
            _1338 = _1326;
        }
        float _1340 = _1338;
        float _1342 = abs(_1340);
        float _1344 = (-0.0) + _1342;
        _1148 = _1344;
    }
    float _1346 = _1148;
    float _1348 = _1138;
    float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1352 = _1266 + _1350;
    float _1354 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1356 = _1268 + _1354;
    float _1358 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1360 = _1270 + _1358;
    float _1362 = _1352 * _1352;
    bool _1364 = _1346 != 0.0;
    bool _1366 = isnan(_1346);
    bool _1368 = _1364 || _1366;
    bool _1370 = isnan(0.0);
    bool _1372 = _1368 || _1370;
    float _1374 = fma(_1356, _1356, _1362);
    float _1376 = fma(_1360, _1360, _1374);
    float _1378 = rsqrt(_1376);
    float _1380 = sqrt(_1376);
    float _1382 = _1378 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1384 = _1356 * _1382;
    float _1386 = _1360 * _1382;
    float _1388 = _1384 * _1384;
    float _1390 = _1386 * _1386;
    float _1392 = _1388 + _1390;
    float _1394 = sqrt(_1392);
    bool _1396 = _1394 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1398 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1400 = _1394 + _1398;
    float _1402 = _1348;
    float _1404 = _1392;
    float _1406 = _1400;
    float _1408 = _1352;
    float _1410 = _1386;
    float _1412 = _1390;
    if (_1396)
    {
        float _1414 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1402 = _1414;
    }
    float _1416 = _1402;
    if (_1396)
    {
        float _1418 = rsqrt(_1392);
        _1404 = _1418;
    }
    float _1420 = _1404;
    if (_1396)
    {
        float _1422 = _1400 * _1416;
        _1406 = _1422;
    }
    float _1424 = _1406;
    if (_1396)
    {
        float _1426 = _1424 * 0.15915493667125701904296875;
        _1140 = _1426;
    }
    float _1428 = _1140;
    float _1430 = _1072;
    if (_1396)
    {
        float _1432 = _1428 * 6.283185482025146484375;
        float _1434 = sin(_1432);
        _1430 = _1434;
    }
    float _1436 = _1430;
    float _1438 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1440 = precise::max(0.0, _1438);
    float _1442 = _1272;
    float _1444 = _1438;
    float _1446 = _1440;
    if (_1396)
    {
        float _1448 = _1428 * 6.283185482025146484375;
        float _1450 = cos(_1448);
        _1442 = _1450;
    }
    float _1452 = _1442;
    float _1454 = -_1382;
    float _1456 = -_1440;
    float _1458 = fma(_1352, _1454, _1456);
    if (_1396)
    {
        float _1460 = _1458 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1408 = _1460;
    }
    float _1462 = _1408;
    float _1464 = _1436;
    float _1466 = _1462;
    if (_1396)
    {
        float _1468 = fma(_1436, _1462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1464 = _1468;
    }
    float _1470 = _1464;
    float _1472 = _1470;
    if (!_1396)
    {
        _1466 = _1458;
    }
    float _1474 = _1466;
    float _1476 = _1474;
    if (_1396)
    {
        float _1478 = _1452 + (-1.0);
        _1444 = _1478;
    }
    float _1480 = _1444;
    float _1482 = _1480;
    if (_1396)
    {
        float _1484 = _1420 * _1470;
        _1142 = _1484;
    }
    float _1486 = _1142;
    float _1488 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1396)
    {
        _1472 = _1388;
    }
    float _1490 = _1472;
    float _1492 = _1490;
    if (_1396)
    {
        float _1494 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1446 = _1494;
    }
    float _1496 = _1446;
    if (!_1396)
    {
        _1482 = _1384;
    }
    float _1498 = _1482;
    float _1500 = _1498;
    if (_1396)
    {
        float _1502 = _1384 * _1486;
        _1500 = _1502;
    }
    float _1504 = _1500;
    float _1506 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1488);
    if (_1396)
    {
        float _1508 = fma(_1458, _1452, _1496);
        _1476 = _1508;
    }
    float _1510 = _1476;
    if (_1396)
    {
        float _1512 = _1386 * _1486;
        _1410 = _1512;
    }
    float _1514 = _1410;
    if (_1396)
    {
        float _1516 = _1504 * _1504;
        _1492 = _1516;
    }
    float _1518 = _1492;
    float _1520 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1506);
    float _1522 = fma(_1038, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1396)
    {
        float _1524 = _1514 * _1514;
        _1412 = _1524;
    }
    float _1526 = _1412;
    float _1528 = fma(_1510, _1510, _1518);
    float _1530 = _1520 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1532 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1534 = _1528 + _1526;
    float _1536 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1538 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1540 = floor(_1522);
    float _1542 = fma(_1032, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1544 = -_1536;
    float _1546 = fma(_1544, _1532, 1.0);
    float _1548 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1538);
    float _1550 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1552 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1554 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1548);
    float _1556 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1550);
    float _1558 = rsqrt(_1534);
    float _1560 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1552);
    float _1562 = _1554 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1564 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1556);
    float _1566 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1560);
    float _1568 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1570 = _1564 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1572 = floor(_1542);
    float _1574 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1576 = fma(_1380, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1574);
    float _1578 = precise::clamp(_1576, 0.0, 1.0);
    float _1580 = _1566 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1582 = -_1578;
    float _1584 = _1582 + 1.0;
    float _1586 = _1558 * _1504;
    float _1588 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1568);
    float _1590 = _1558 * _1510;
    float _1592 = abs(_1584);
    float _1594 = log2(_1592);
    float _1596 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1598 = _1558 * _1514;
    float _1600 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1588);
    float _1602 = -_1596;
    float _1604 = fma(_1590, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1602);
    float _1606 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1608 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1600);
    float _1610 = log2(_1546);
    float _1612 = -_1598;
    float _1614 = fma(_1612, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1604);
    float _1616 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1618 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1606);
    float _1620 = fma(_1614, -0.5, 0.5);
    float _1622 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1616);
    float _1624 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1618);
    float _1626 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1628 = 1.0 / _1608;
    float _1630 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1622);
    float _1632 = fma(_1614, 0.5, 0.5);
    float _1634 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1630);
    float _1636 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1624);
    float _1638 = fma(_1632, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1640 = sqrt(_1620);
    float _1642 = -_1540;
    float _1644 = _1522 + _1642;
    float _1646 = _1614;
    float _1648 = _1540;
    float _1650 = _1608;
    float _1652 = _1636;
    if (_1372)
    {
        _1646 = _1634;
    }
    float _1654 = _1646;
    float _1656 = fma(_1632, _1638, -0.212114393711090087890625);
    float _1658 = _1654;
    if (_1372)
    {
        _1648 = _1636;
    }
    float _1660 = _1648;
    float _1662 = -_1572;
    float _1664 = _1542 + _1662;
    float _1666 = _1660;
    if (!_1372)
    {
        _1658 = 0.0;
    }
    float _1668 = _1658;
    float _1670 = fma(_1632, _1656, 1.570728778839111328125);
    float _1672 = exp2(_1626);
    if (!_1372)
    {
        _1666 = 0.0;
    }
    float _1674 = _1666;
    float _1676 = _1590 + 1.0;
    float _1678 = _1610 * 0.693147182464599609375;
    float _1680 = _1628 * _1668;
    float2 _4948 = float2(_1644, _1664);
    float _1682 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4948, float2(0.0), isnan(_4948)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4948, float2(0.0), isnan(_4948)), level(0.0)).x;
    float _1684 = _1628 * _1674;
    float _1686 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1688 = _1640 * 0.636619746685028076171875;
    float _1690 = fma(_1684, -0.5, 0.5);
    float _1692 = -_1670;
    float _1694 = fma(_1688, _1692, 1.0);
    float _1696 = -_1590;
    float _1698 = fma(_1672, _1676, _1696);
    float _1700 = fma(_1680, 0.5, 0.5);
    float _1702 = fma(_1698, 0.5, 0.5);
    float3 _4986 = float3(_1700, _1690, _1686);
    float _1704 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4986, float3(0.0), isnan(_4986)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4986, float3(0.0), isnan(_4986)), level(0.0)).x;
    float3 _4997 = float3(_1700, _1690, _1686);
    float4 _1707 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4997, float3(0.0), isnan(_4997)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4997, float3(0.0), isnan(_4997)), level(0.0)).xyzw;
    float _1709 = _1707.x;
    float _1711 = _1707.y;
    float _1713 = _1707.z;
    float _1715 = _1707.w;
    float2 _5013 = float2(_1694, _1702);
    float3 _1719 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5013, float2(0.0), isnan(_5013)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5013, float2(0.0), isnan(_5013)), level(0.0)).xyz;
    float _1721 = _1719.x;
    float _1723 = _1719.y;
    float _1725 = _1719.z;
    float _1727 = _1108 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1729 = _1108 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1731 = in.m_55.w;
    bool _1733 = _256 > 0.5;
    float _1735 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1727);
    float _1737 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1729);
    out.m_67.x = _394;
    float _1739 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1735);
    float _1741 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1737);
    float _1743 = in.m_69.y;
    float _1745 = _1739 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1747 = _1741 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1749 = in.m_69.x;
    float _1751 = 1.0 / _1745;
    float _1753 = _1747 + _1745;
    float _1755 = in.m_59.y;
    int _1757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1759 = _1757 != 0;
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1765 = _1763 != 0;
    float _1767 = in.m_71.z;
    int _1769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1771 = _1769 != 0;
    float _1773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1777 = _1775 != 0;
    float _1779 = in.m_71.x;
    bool _1781 = _1731 > 0.5;
    float _1783 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1785 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_73.x = _1268;
    out.m_73.y = _1266;
    out.m_73.z = _1270;
    float _1787 = _1753 * _1751;
    float _1789 = _1787 * 0.5;
    float _1791 = -_1743;
    float _1793 = _1791 + 1.0;
    float _1795 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1785);
    float _1797 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1799 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1797);
    float _1801 = 0.0;
    float _1803 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    bool _1805 = _1771;
    bool _1807 = _1781;
    float _1809 = _1743;
    if (!_1759)
    {
        _1801 = _1749;
    }
    float _1811 = _1801;
    float _1813 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1795);
    int _1815 = _1781 ? as_type<int>(_1793) : as_type<int>(_1743);
    out.m_67.y = _1755;
    float _1817 = _1811;
    if (!_1759)
    {
        _1803 = _1811;
    }
    float _1819 = _1803;
    float _1821 = 1.0 / _1799;
    float _1823 = _1819;
    if (_1759)
    {
        _1817 = _1749;
    }
    float _1825 = _1817;
    float _1827 = _1767 + (-0.039999999105930328369140625);
    float _1829 = _1771 ? as_type<float>(_1815) : _1743;
    float _1831 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1813);
    float _1833 = _1831;
    if (_1765)
    {
        bool _1835 = _228 > 0.5;
        _1805 = _1835;
    }
    bool _1837 = _1805;
    if (_1765)
    {
        float _1839 = -_1825;
        float _1841 = _1839 + 1.0;
        _486 = as_type<int>(_1841);
    }
    int _1843 = _486;
    float _1845 = -_800;
    float _1847 = _1845 + _1779;
    if (!_1765)
    {
        _584 = _1825;
    }
    float _1849 = _584;
    float _1851 = _1849;
    if (_1759)
    {
        float _1853 = -_1825;
        float _1855 = _1853 + 1.0;
        _488 = as_type<int>(_1855);
    }
    int _1857 = _488;
    if (_1759)
    {
        bool _1859 = _234 > 0.5;
        _1807 = _1859;
    }
    bool _1861 = _1807;
    float _1863 = _784 * _1847;
    if (_1765)
    {
        float _1865 = _1837 ? as_type<float>(_1843) : _1825;
        _1851 = _1865;
    }
    float _1867 = _1851;
    float _1869 = _758 * _1847;
    float _1871 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1873 = fma(_758, _1827, _1863);
    float _1875 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1877 = _1821 * _1875;
    float _1879 = -_1869;
    float _1881 = fma(_784, _1827, _1879);
    if (_1777)
    {
        float _1883 = _1733 ? _1793 : _1743;
        _1809 = _1883;
    }
    float _1885 = _1809;
    float _1887 = _1867 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1889 = _274 != 0.0;
    bool _1891 = isnan(_274);
    bool _1893 = _1889 || _1891;
    bool _1895 = isnan(0.0);
    bool _1897 = _1893 || _1895;
    float _1899 = _1761 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1901 = abs(_1877);
    float _1903 = log2(_1901);
    if (_1759)
    {
        float _1905 = _1861 ? as_type<float>(_1857) : _1825;
        _1823 = _1905;
    }
    float _1907 = _1823;
    float _1909 = _1885 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1911 = -_800;
    bool _1913 = _868 == _1911;
    bool _1915 = !_1897;
    bool _1917 = _1913 && _1915;
    float _1919 = _1829 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1921 = _800 + _1873;
    float _1923 = _1907 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1925 = _864 == (-0.039999999105930328369140625);
    bool _1927 = _1925 && _1917;
    float _1929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1931 = _1919 * _1871;
    float _1933 = _1909 * _1773;
    float _1935 = in.m_71.y;
    float _1937 = in.m_75.x;
    float _1939 = in.m_75.y;
    float _1941 = in.m_75.z;
    float _1943 = in.m_75.w;
    float _1945 = _1903 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1947 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1949 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.gl_Position.x = _1634;
    out.gl_Position.y = _1636;
    out.gl_Position.z = _1831;
    out.gl_Position.w = _1608;
    float _1951 = _1949 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1953 = _1923 * _1929;
    float _1955 = exp2(_1945);
    float _1957 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1959 = _1881 + 0.039999999105930328369140625;
    float _1961 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1963 = _1957 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1965 = _1903;
    if (_1927)
    {
        _1965 = _1959;
    }
    float _1967 = _1965;
    float _1969 = _1887 * _1947;
    float _1971 = _1967;
    float _1973 = _1947;
    if (!_1927)
    {
        float _1975 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1959);
        _1971 = _1975;
    }
    float _1977 = _1971;
    out.m_77.x = _1951;
    out.m_77.y = _1963;
    out.m_77.z = _1899;
    if (_1927)
    {
        _1973 = _1921;
    }
    float _1979 = _1973;
    float _1981 = _1979;
    if (!_1927)
    {
        float _1983 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1921);
        _1981 = _1983;
    }
    float _1985 = _1981;
    if (_1927)
    {
        _1144 = _1935;
    }
    float _1987 = _1144;
    out.m_79.x = _1953;
    out.m_79.y = _1933;
    out.m_79.z = _1969;
    out.m_79.w = _1931;
    float _1989 = _1921 * _1941;
    float _1991 = fma(_1955, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1993 = precise::clamp(_1991, 0.0, 1.0);
    float _1995 = _1987;
    if (!_1927)
    {
        float _1997 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1935);
        _1995 = _1997;
    }
    float _1999 = _1995;
    out.m_81.w = _1961;
    bool _2001 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2003 = isnan(_1380);
    bool _2005 = _2001 || _2003;
    bool _2007 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2009 = _2005 || _2007;
    float _2011 = _1959 * _1939;
    float _2013 = -_1989;
    float _2015 = fma(_1959, _1937, _2013);
    float _2017 = exp2(_1783);
    float _2019 = -_2011;
    float _2021 = fma(_1941, _1935, _2019);
    float _2023 = _2015 * _1943;
    float _2025 = _1937 * _1935;
    float _2027 = fma(_1993, -2.0, 3.0);
    float _2029 = _1993 * _1993;
    float _2031 = _2021 * _1943;
    float _2033 = -_2025;
    float _2035 = fma(_1921, _1939, _2033);
    float _2037 = _1074 * _1939;
    float _2039 = _2029 * _2027;
    float _2041 = _1074 * _1999;
    float _2043 = _2035 * _1943;
    float _2045 = _984 * _1939;
    float _2047 = _984 * _1999;
    float _2049 = _1012 * _1939;
    float _2051 = _1012 * _1999;
    float _2053 = _984 * _2023;
    float _2055 = _1012 * _2023;
    float _2057 = _1074 * _2023;
    float _2059 = fma(_986, _1985, _2047);
    float _2061 = fma(_1084, _1985, _2041);
    float _2063 = fma(_986, _1937, _2045);
    float _2065 = fma(_1084, _1937, _2037);
    float _2067 = fma(_1016, _1937, _2049);
    float _2069 = -_2039;
    float _2071 = _2069 + 1.0;
    float _2073 = fma(_988, _1941, _2063);
    float _2075 = fma(_1100, _1941, _2065);
    float _2077 = fma(_1018, _1941, _2067);
    bool _2079 = _1877 <= 8000.0;
    bool _2081 = isnan(_1877);
    bool _2083 = _2079 || _2081;
    bool _2085 = isnan(8000.0);
    bool _2087 = _2083 || _2085;
    float _2089 = float(_2087);
    float _2091 = in.m_65.x;
    float _2093 = fma(_2071, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2039);
    float _2095 = fma(_988, _1977, _2059);
    float _2097 = -_2017;
    float _2099 = _2097 + 1.0;
    float _2101 = fma(_986, _2031, _2053);
    float _2103 = _2089 * _2093;
    float _2105 = fma(_1084, _2031, _2057);
    float _2107 = fma(_1016, _2031, _2055);
    out.m_83.x = _2073;
    out.m_83.y = _2075;
    out.m_83.z = _2077;
    float _2109 = _2103 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2111 = _2099 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2113 = fma(_988, _2043, _2101);
    float _2115 = fma(_1100, _2043, _2105);
    float _2117 = fma(_1018, _2043, _2107);
    float _2119 = fma(_1016, _1985, _2051);
    float _2121 = _1831 + _1608;
    float _2123 = -_2111;
    float _2125 = _2123 + 1.0;
    float _2127 = fma(_1100, _1977, _2061);
    out.m_85.x = _2113;
    out.m_85.y = _2115;
    out.m_85.z = _2117;
    int _2129 = as_type<int>(_2065);
    float _2131 = _2075;
    float _2133 = _2125;
    if (!_1372)
    {
        float _2135 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        _2129 = as_type<int>(_2135);
    }
    int _2137 = _2129;
    float _2139 = fma(_1018, _1977, _2119);
    float _2141 = _2121 * 0.5;
    float _2143 = _1346 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2145 = _2143;
    float _2147 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_1372)
    {
        _2145 = 0.0;
    }
    float _2149 = _2145;
    out.m_87.x = _2095;
    out.m_87.y = _2127;
    out.m_87.z = _2139;
    if (!_2009)
    {
        _2131 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2151 = _2131;
    float _2153 = _2151;
    float _2155 = _2151;
    if (!_2009)
    {
        _1650 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2157 = _1650;
    float _2159 = _2157;
    float _2161 = _2157;
    if (!_1372)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5789 = as_type<float>(_2137);
        out.gl_Position.z = _5789;
    }
    if (!_2009)
    {
        _1833 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2163 = _1833;
    float _2165 = _2163;
    float _2167 = _2163;
    if (!_2009)
    {
        _1652 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2169 = _1652;
    out.m_89.z = _2141;
    out.m_89.w = _1608;
    float _2171 = -_1682;
    float _2173 = _2171 + 1.0;
    float _2175 = _2173 * _2109;
    float _2177 = precise::clamp(_2175, 0.0, 1.0);
    float _2179 = -_2177;
    float _2181 = fma(_2179, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2183 = _2169;
    float _2185 = _2169;
    if (!_2009)
    {
        _2147 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2187 = _2147;
    float _2189 = _2181 * _2091;
    float _2191 = _2111 * _1704;
    float _2193 = _2189 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2195 = _1715 * _2125;
    float _2197 = _2187;
    float _2199 = _2187;
    if (!_2009)
    {
        _2133 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2201 = _2133;
    float _2203 = _1715 * _2191;
    float _2205 = _1725 * _2191;
    out.m_91.x = _2193;
    float _2207 = fma(_1721, _2203, _1709);
    float _2209 = fma(_1723, _2203, _1711);
    float _2211 = fma(_1715, _2205, _1713);
    out.m_93.x = _2207;
    out.m_93.y = _2209;
    out.m_93.z = _2211;
    out.m_93.w = _2195;
    bool _2213 = !_2009;
    float _2215 = _2201;
    float _2217 = _2201;
    if (!_2213)
    {
        bool _2219 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2221 = isnan(_1380);
        bool _2223 = _2219 || _2221;
        bool _2225 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2227 = _2223 || _2225;
        if (!_2227)
        {
            float _2229 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2231 = _1380 + _2229;
            float _2233 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2235 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2233;
            float _2237 = 1.0 / _2235;
            float _2239 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2241 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2245 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2249 = _2247 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2257 = _2255 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2259 = _2231 * _2237;
            float _2261 = precise::clamp(_2259, 0.0, 1.0);
            float _2263 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2265 = _2263 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2267 = fma(_2261, _2241, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2269 = fma(_2261, _2265, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2271 = fma(_2261, _2245, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2273 = fma(_2261, _2249, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2275 = fma(_2261, _2253, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2277 = fma(_2261, _2257, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2199 = _2269;
            _2185 = _2275;
            _2155 = _2267;
            _2167 = _2273;
            _2161 = _2271;
            _2217 = _2277;
            _2279 = true;
        }
        else
        {
            bool _2281 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2283 = isnan(_1380);
            bool _2285 = _2281 || _2283;
            bool _2287 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2289 = _2285 || _2287;
            if (!_2289)
            {
                _2153 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2291 = _2153;
            _2155 = _2291;
            if (!_2289)
            {
                _2197 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2293 = _2197;
            _2199 = _2293;
            if (!_2289)
            {
                _2159 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2295 = _2159;
            _2161 = _2295;
            if (!_2289)
            {
                _2165 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2297 = _2165;
            _2167 = _2297;
            if (!_2289)
            {
                _2183 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2299 = _2183;
            _2185 = _2299;
            if (!_2289)
            {
                _2215 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2301 = _2215;
            bool _2303 = !_2289;
            _2217 = _2301;
            if (!_2303)
            {
                bool _2305 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2307 = isnan(_1380);
                bool _2309 = _2305 || _2307;
                bool _2311 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2313 = _2309 || _2311;
                if (!_2313)
                {
                    float _2315 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2317 = _1380 + _2315;
                    float _2319 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2321 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2319;
                    float _2323 = 1.0 / _2321;
                    float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2327 = _2325 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2329 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2331 = _2329 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2337 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2339 = _2337 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2341 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2343 = _2341 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2345 = _2317 * _2323;
                    float _2347 = precise::clamp(_2345, 0.0, 1.0);
                    float _2349 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2351 = _2349 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2353 = fma(_2347, _2327, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2355 = fma(_2347, _2351, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2357 = fma(_2347, _2331, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2359 = fma(_2347, _2335, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2361 = fma(_2347, _2339, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2363 = fma(_2347, _2343, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2199 = _2355;
                    _2185 = _2361;
                    _2155 = _2353;
                    _2167 = _2359;
                    _2161 = _2357;
                    _2217 = _2363;
                    _2279 = true;
                }
                else
                {
                    _2199 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2185 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2155 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2167 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2161 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2217 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2279 = false;
    float _2365 = _2199;
    float _2367 = _2185;
    float _2369 = _2155;
    float _2371 = _2167;
    float _2373 = _2161;
    float _2375 = _2217;
    float _2377 = fma(_2127, -0.5, 0.5);
    float _2379 = precise::clamp(_2377, 0.0, 1.0);
    float _2381 = -_2365;
    float _2383 = _2381 + _2367;
    float _2385 = -_2369;
    float _2387 = _2385 + _2371;
    float _2389 = -_2373;
    float _2391 = _2389 + _2375;
    bool _2393 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2395 = fma(_2379, _2383, _2365);
    float _2397 = fma(_2379, _2387, _2369);
    float _2399 = fma(_2379, _2391, _2373);
    float _2401 = _2149 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2403 = _2395 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _2405 = fma(_2397, 0.298911988735198974609375, _2403);
    out.m_91.w = _2401;
    float _2407 = fma(_2399, 0.114477999508380889892578125, _2405);
    out.m_95.x = 0.0;
    float _2409 = -_2407;
    float _2411 = _2397 + _2409;
    float _2413 = -_2407;
    float _2415 = _2395 + _2413;
    float _2417 = -_2407;
    float _2419 = _2399 + _2417;
    float _2421 = fma(_2411, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2407);
    float _2423 = fma(_2415, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2407);
    float _2425 = fma(_2419, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2407);
    out.m_97.x = _2421;
    out.m_97.y = _2423;
    out.m_97.z = _2425;
    if (!_2393)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2427 = -_1266;
    float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2431 = -_1268;
    float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2435 = -_1270;
    float _2437 = _2435 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2439 = _2429 * _2429;
    float _2441 = fma(_2433, _2433, _2439);
    float _2443 = fma(_2437, _2437, _2441);
    float _2445 = sqrt(_2443);
    float _2447 = rsqrt(_2443);
    float _2449 = -_2445;
    float _2451 = _2449 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2453 = _2451 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2455 = precise::clamp(_2453, 0.0, 1.0);
    float _2457 = _2433 * _2447;
    float _2459 = _2429 * _2447;
    float _2461 = abs(_2455);
    float _2463 = log2(_2461);
    float _2465 = _2437 * _2447;
    float _2467 = _2457 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2469 = _2127 * _2459;
    float _2471 = -_2459;
    float _2473 = -_2467;
    float _2475 = fma(_2471, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2473);
    float _2477 = fma(_2095, _2457, _2469);
    float _2479 = -_2465;
    float _2481 = fma(_2479, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2475);
    float _2483 = fma(_2139, _2465, _2477);
    float _2485 = precise::clamp(_2483, 0.0, 1.0);
    float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2489 = _2481 + _2487;
    float _2491 = _2463 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2493 = _2489 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2495 = precise::clamp(_2493, 0.0, 1.0);
    float _2497 = exp2(_2491);
    float _2499 = _2497 * _2495;
    float _2501 = _2485 * _2499;
    float _2503 = _2501 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2505 = _2501 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2507 = _2501 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _2503;
    out.m_95.y = _2505;
    out.m_95.z = _2507;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

