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
    float4 m_69 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_77 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_73 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_67 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
    float4 m_51 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_100);
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _106;
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2168 = as_type<float>(_116);
        out.gl_Position.z = _2168;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_47.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _136 = _134;
    if (_130)
    {
        float _138 = float(_100);
        _108 = _138;
    }
    float _140 = _108;
    bool _142 = _134 >= _140;
    bool _144 = !_130;
    bool _146 = _142 || _144;
    float _148 = _140;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _148;
    if (_146)
    {
        out.m_45.x = 0.0;
    }
    if (_146)
    {
        float _152 = _150 * 5.0;
        _118 = as_type<int>(_152);
    }
    int _154 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2238 = as_type<float>(_154);
        out.gl_Position.z = _2238;
    }
    if (_146)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _156 = in.m_49.z;
    float _158 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _162 = _160 != 0;
    float _164 = in.m_49.x;
    float _166 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _168 = _166 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _170 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _172 = _170 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _174 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _176 = _174 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _178 = 1.0 / _172;
    float _180 = 0.0;
    float _182 = _158;
    if (!_162)
    {
        float _184 = in.m_49.y;
        _180 = _184;
    }
    float _186 = _180;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _188;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _194 = _192 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _198 = _196 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _200;
    float _204 = 1.0 / _176;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _208 = _206 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _212 = _210 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _214 = in.m_51.y;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _222 = _220 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _224 = 1.0 / _208;
    float _226 = _190 * _178;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _228;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _234 = _232 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _236 = 1.0 / _168;
    float _238 = _194 * _204;
    float _240 = _204;
    if (!_162)
    {
        _240 = _186;
    }
    float _242 = _240;
    float _244 = _156 * 2.0;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _248 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _252 = _248 || _250;
    bool _254 = isnan(1.0);
    bool _256 = _252 || _254;
    float _258 = 1.0 / _198;
    float _260 = _242;
    float _262 = _186;
    if (_162)
    {
        float _264 = in.m_49.x;
        float _266 = in.m_49.y;
        _260 = _264;
        _262 = _266;
    }
    float _268 = _260;
    float _270 = _262;
    float _272 = _164 * 2.0;
    float _274 = -_214;
    float _276 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0030000000260770320892333984375, _274);
    float _278 = _202 * _224;
    float _280 = _214 * 78.233001708984375;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _284 = 1.0 / _234;
    float _286 = _222 * _236;
    float _288 = 0.0;
    if (!_256)
    {
        float _290 = _158 * _158;
        float _292 = _290 * 0.5;
        _288 = _292;
    }
    float _294 = _288;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _300 = floor(_276);
    float _302 = _218 * _258;
    float _304 = _294;
    if (!_256)
    {
        float _306 = _294 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _304 = _306;
    }
    float _308 = _304;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _312 = 1.0 / _298;
    float _314 = _212 * _284;
    float _316 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[83].z, _310);
    float _318 = floor(_244);
    float _320 = _300 * 12.98980045318603515625;
    float _322 = -_300;
    float _324 = _276 + _322;
    float _326 = floor(_272);
    float _328 = _164 + _156;
    float _330 = _230 * _312;
    float _332 = _328 + (-1.0);
    float _334 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _336 = log2(_334);
    float _338 = _272;
    float _340 = _308;
    if (!_162)
    {
        float _342 = in.m_49.z;
        _338 = _342;
    }
    float _344 = _338;
    float _346 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _348 = _318 > 0.0;
    float _350 = _268 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _352 = _318 >= 0.0;
    bool _354 = isnan(_318);
    bool _356 = _352 || _354;
    bool _358 = isnan(0.0);
    bool _360 = _356 || _358;
    float _362 = precise::max(_324, 0.64999997615814208984375);
    float _364 = -_246;
    float _366 = fma(_350, 2.0, _364);
    bool _368 = _326 > 0.0;
    bool _370 = _326 >= 0.0;
    bool _372 = isnan(_326);
    bool _374 = _370 || _372;
    bool _376 = isnan(0.0);
    bool _378 = _374 || _376;
    float _380 = in.m_53.x;
    float _382 = in.m_53.y;
    float _384 = in.m_53.z;
    float _386 = precise::min(_362, 1.0);
    float _388 = _336 * _134;
    float _390 = fma(_164, _280, _320);
    float _392 = fma(_386, 2.8571426868438720703125, -1.8571426868438720703125);
    float _394 = exp2(_388);
    float _396 = _390 * 0.15915493667125701904296875;
    float _398 = fma(_156, _280, _320);
    float _400 = _350;
    float _402 = _344;
    if (!_162)
    {
        _400 = _344;
    }
    float _404 = _400;
    float _406 = _398 * 0.15915493667125701904296875;
    float _408 = _404;
    if (_162)
    {
        _402 = _270;
    }
    float _410 = _402;
    float _412 = _396 * 6.283185482025146484375;
    float _414 = sin(_412);
    int _416 = _378 ? 0 : 1;
    float _418 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[83].w, _282);
    int _420 = _360 ? 0 : 1;
    int _422 = ~_416;
    int _424 = _422 + 1;
    int _426 = _424 + 1;
    float _428 = _406 * 6.283185482025146484375;
    float _430 = sin(_428);
    float _432 = -_214;
    float _434 = _432 + _382;
    float _436 = _270 * _214;
    int _438 = ~_420;
    int _440 = _438 + 1;
    int _442 = _440 + 1;
    int _444 = _442;
    int _446 = _426;
    float _448 = _418;
    if (!_348)
    {
        int _450 = ~_420;
        int _452 = _450 + 1;
        _444 = _452;
    }
    int _454 = _444;
    float _456 = fma(_436, 78.233001708984375, _320);
    if (!_368)
    {
        int _458 = ~_416;
        int _460 = _458 + 1;
        _446 = _460;
    }
    int _462 = _446;
    bool _464 = !_256;
    if (!_464)
    {
        float _466 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _468 = log2(_466);
        float _470 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _472 = _470 + 1.0;
        float _474 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _476 = _158 * _468;
        float _478 = 1.0 / _472;
        float _480 = _474 * 0.693147182464599609375;
        float _482 = exp2(_476);
        float _484 = 1.0 / _480;
        float _486 = _482 + (-1.0);
        float _488 = -_486;
        float _490 = fma(_488, _484, _158);
        float _492 = _490 * _478;
        float _494 = _492 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _340 = _494;
    }
    float _496 = _340;
    bool _498 = !_256;
    if (!_498)
    {
        float _500 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _502 = log2(_500);
        float _504 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _506 = _504 + 1.0;
        float _508 = 1.0 / _506;
        float _510 = _158 * _502;
        float _512 = exp2(_510);
        float _514 = -_512;
        float _516 = _514 + 1.0;
        float _518 = _516 * _508;
        _182 = _518;
    }
    float _520 = _182;
    float _522 = in.m_47.x;
    float _524 = in.m_47.y;
    float _526 = in.m_47.z;
    float _528 = _270 + _156;
    float _530 = _270 * 2.0;
    float _532 = _270 + _164;
    if (_162)
    {
        _408 = _270;
    }
    float _534 = _408;
    float _536 = _528 + (-1.0);
    float _538 = floor(_530);
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _542 = _534 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _544 = _532 + (-1.0);
    float _546 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _550 = 1.0 + _548;
    float _552 = _430 * 43758.546875;
    float _554 = _496 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _556 = _496 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _558 = _414 * 43758.546875;
    float _560 = fma(_542, -2.0, _540);
    float _562 = 1.0 / _550;
    float _564 = in.m_55.w;
    float _566 = -_394;
    float _568 = _566 + 1.0;
    bool _570 = _538 > 0.0;
    float _572 = in.m_42.x;
    float _574 = in.m_42.y;
    float _576 = in.m_42.z;
    bool _578 = _538 >= 0.0;
    bool _580 = isnan(_538);
    bool _582 = _578 || _580;
    bool _584 = isnan(0.0);
    bool _586 = _582 || _584;
    float _588 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _590 = floor(_552);
    float _592 = fma(_520, _522, _554);
    float _594 = fma(_520, _524, _556);
    float _596 = _456 * 0.15915493667125701904296875;
    bool _598 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _600 = _496 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _602 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _604 = isnan(1.0);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _610 = _606 || _608;
    float _612 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _418);
    float _614 = floor(_558);
    bool _616 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _618 = isnan(0.0);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _624 = _620 || _622;
    float _626 = fma(_520, _526, _600);
    int _628 = _586 ? 0 : 1;
    float _630 = _624 ? _568 : 0.0;
    float _632 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _316);
    float _634 = -_134;
    float _636 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[81].x, _366);
    float _638 = _596 * 6.283185482025146484375;
    float _640 = sin(_638);
    float _642 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _560);
    if (!_598)
    {
        _448 = _324;
    }
    float _644 = _448;
    float _646 = _644;
    if (_610)
    {
        float _648 = _630 * _562;
        _136 = _648;
    }
    float _650 = _136;
    float _652 = -_590;
    float _654 = _552 + _652;
    float _656 = fma(_592, _564, _572);
    float _658 = fma(_594, _564, _574);
    float _660 = fma(_626, _564, _576);
    float _662 = -_614;
    float _664 = _558 + _662;
    int _666 = ~_628;
    int _668 = _666 + 1;
    int _670 = _668 + 1;
    float _672 = _640 * 43758.546875;
    bool _674 = !_598;
    int _676 = _670;
    if (!_674)
    {
        float _678 = in.m_49.x;
        float _680 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _682 = _678 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _684 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[14].x, _324);
        float _686 = _684 * _680;
        float _688 = floor(_686);
        float _690 = -_688;
        float _692 = _686 + _690;
        _646 = _692;
    }
    float _694 = _646;
    if (!_570)
    {
        int _696 = ~_628;
        int _698 = _696 + 1;
        _676 = _698;
    }
    int _700 = _676;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _704 = _694 + _702;
    float _706 = floor(_672);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _710 = _694 + _708;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _714 = _694 + _712;
    float _716 = fma(_238, _704, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _720 = _694 + _718;
    float _722 = fma(_226, _710, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _726 = _694 + _724;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _730 = _694 + _728;
    float _732 = fma(_278, _720, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _734 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _736 = isnan(_694);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = fma(_302, _714, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _748 = fma(_286, _726, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _750 = fma(_314, _730, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _752 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _754 = isnan(_694);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = -_744;
    float _766 = _764 + 1.0;
    float _768 = -_706;
    float _770 = _672 + _768;
    bool _772 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _774 = isnan(_694);
    bool _776 = _772 || _774;
    bool _778 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _780 = _776 || _778;
    float _782 = float(_780);
    float _784 = _762 * _766;
    float _786 = -_762;
    float _788 = _786 + 1.0;
    float _790 = fma(_664, 2.0, -1.0);
    float _792 = fma(_654, 2.0, -1.0);
    float _794 = fma(_770, 2.0, -1.0);
    float _796 = -_782;
    float _798 = _796 + 1.0;
    float _800 = _658 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _802 = _658 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _806 = _804 != 0;
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _810 = _808 != 0;
    int _812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _814 = _812 != 0;
    float _816 = _658 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _818 = _744 * _798;
    float _820 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[4].x, _800);
    float _822 = _794 * _794;
    float _824 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[5].x, _802);
    float _826 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[6].x, _816);
    bool _828 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _830 = isnan(_694);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = fma(_790, _790, _822);
    bool _842 = !_806;
    int _844 = _842 ? 0 : 1;
    float _846 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[4].z, _820);
    bool _848 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _850 = isnan(_694);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = -_838;
    float _862 = _860 + 1.0;
    int _864 = abs(_844);
    float _866 = fma(_792, _792, _840);
    float _868 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[5].z, _824);
    float _870 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[6].z, _826);
    float _872 = _838 * _788;
    float _874 = _858 * _862;
    bool _876 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _878 = isnan(_694);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = -_858;
    float _890 = _888 + 1.0;
    float _892 = rsqrt(_866);
    float _894 = float(_454);
    float _896 = _392 * _392;
    float _898 = float(_864);
    float _900 = _886 * _890;
    float _902 = -_886;
    float _904 = _902 + 1.0;
    float _906 = float(_462);
    float _908 = _846 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _910 = _898 * _894;
    float _912 = _722 * _900;
    float _914 = in.m_57.x;
    float _916 = in.m_57.y;
    float _918 = in.m_57.z;
    bool _920 = !_810;
    int _922 = _920 ? 0 : 1;
    float _924 = _868 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _926 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[159].x, _912);
    float _928 = _910 * (-2.0);
    int _930 = abs(_922);
    float _932 = _792 * _892;
    float _934 = _790 * _892;
    float _936 = _794 * _892;
    float _938 = float(_930);
    float _940 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _942 = _924 + _940;
    bool _944 = !_814;
    int _946 = _944 ? 0 : 1;
    float _948 = fma(_716, _874, _926);
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _952 = _908 + _950;
    float _954 = _938 * _906;
    int _956 = abs(_946);
    float _958 = _870 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _960 = _942 * _942;
    float _962 = float(_700);
    float _964 = _936 * _936;
    float _966 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _968 = _958 + _966;
    float _970 = fma(_952, _952, _960);
    float _972 = _954 * (-2.0);
    float _974 = float(_956);
    float _976 = fma(_928, _914, _914);
    float _978 = fma(_968, _968, _970);
    float _980 = _164 + (-0.5);
    float _982 = fma(_588, _928, _588);
    float _984 = fma(_934, _934, _964);
    float _986 = fma(_746, _872, _948);
    float _988 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[196].x, _976);
    float _990 = fma(_972, _916, _916);
    float _992 = _270 + (-0.5);
    float _994 = in.m_51.x;
    float _996 = _974 * _962;
    float _998 = fma(_546, _972, _546);
    float _1000 = fma(_932, _932, _984);
    float _1002 = fma(_982, _650, _988);
    float _1004 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[196].y, _990);
    bool _1006 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1008 = isnan(_694);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1014 = _1010 || _1012;
    float _1016 = float(_1014);
    float _1018 = in.m_51.z;
    float _1020 = fma(_748, _784, _986);
    float _1022 = _996 * (-2.0);
    float _1024 = fma(_998, _650, _1004);
    float _1026 = in.m_55.x;
    float _1028 = in.m_55.y;
    float _1030 = in.m_55.z;
    bool _1032 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1034 = isnan(_694);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    float _1044 = rsqrt(_978);
    float _1046 = _1002 * 0.15915493667125701904296875;
    float _1048 = -_1016;
    float _1050 = _1048 + 1.0;
    float _1052 = fma(_1022, _918, _918);
    float _1054 = _156 + (-0.5);
    float _1056 = fma(_346, _1022, _346);
    float _1058 = _782 * _1050;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1062 = _694 + _1060;
    float _1064 = -_1042;
    float _1066 = _1064 + 1.0;
    float _1068 = fma(_732, _818, _1020);
    float _1070 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1052);
    float _1072 = fma(_330, _1062, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1074 = _1016 * _1066;
    float _1076 = fma(_750, _1058, _1068);
    float _1078 = fma(_1056, _650, _1070);
    float _1080 = _896 * 0.15915493667125701904296875;
    float _1082 = rsqrt(_1000);
    float _1084 = fma(_1072, _1074, _1076);
    float _1086 = _1024 * 0.15915493667125701904296875;
    float _1088 = _1078 * 0.15915493667125701904296875;
    float _1090 = -_994;
    float _1092 = _1090 + _380;
    float _1094 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1084);
    float _1096 = precise::clamp(_1094, 0.0, 1.0);
    float _1098 = _942 * _1044;
    float _1100 = -_1018;
    float _1102 = _1100 + _384;
    float _1104 = _1080 * 6.283185482025146484375;
    float _1106 = cos(_1104);
    float _1108 = _952 * _1044;
    float _1110 = -_1098;
    float _1112 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[18].w, _942);
    float _1114 = _1026 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1116 = _324 + _896;
    float _1118 = _968 * _1044;
    float _1120 = -_1108;
    float _1122 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[18].w, _952);
    float _1124 = _1112 * _1112;
    float _1126 = _1046 * 6.283185482025146484375;
    float _1128 = sin(_1126);
    float _1130 = -_1118;
    float _1132 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[18].w, _968);
    float _1134 = _934 * _1082;
    float _1136 = fma(_1122, _1122, _1124);
    float _1138 = _936 * _1082;
    float _1140 = _932 * _1082;
    float _1142 = _1096 * _1092;
    float _1144 = _1096 * _434;
    float _1146 = _1046 * 6.283185482025146484375;
    float _1148 = cos(_1146);
    float _1150 = _1096 * _1102;
    float _1152 = fma(_1132, _1132, _1136);
    float _1154 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1156 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1158 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1160 = _1154 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1162 = _1086 * 6.283185482025146484375;
    float _1164 = sin(_1162);
    float _1166 = _1086 * 6.283185482025146484375;
    float _1168 = cos(_1166);
    float _1170 = _1088 * 6.283185482025146484375;
    float _1172 = cos(_1170);
    float _1174 = -_1106;
    float _1176 = _1174 + 1.0;
    float _1178 = _1148 * _1164;
    float _1180 = _1134 * _1176;
    float _1182 = _1080 * 6.283185482025146484375;
    float _1184 = sin(_1182);
    float _1186 = _1148 * _1168;
    float _1188 = fma(_1134, _1180, _1106);
    float _1190 = _1128 * _1168;
    float _1192 = _1148 * _1172;
    float _1194 = _1128 * _1164;
    float _1196 = _1164 * _1172;
    float _1198 = _1138 * _1176;
    float _1200 = sqrt(_1152);
    float _1202 = _1168 * _1172;
    float _1204 = _1128 * _1172;
    float _1206 = _1134 * _1184;
    float _1208 = _1138 * _1184;
    float _1210 = _1140 * _1184;
    float _1212 = fma(_1140, _1198, _1206);
    float _1214 = -_1208;
    float _1216 = fma(_1140, _1180, _1214);
    float _1218 = fma(_1138, _1180, _1210);
    float _1220 = -_1210;
    float _1222 = fma(_1138, _1180, _1220);
    float _1224 = fma(_1138, _1198, _1106);
    float _1226 = fma(_1140, _1180, _1208);
    float _1228 = -_1206;
    float _1230 = fma(_1140, _1198, _1228);
    float _1232 = _1140 * _1140;
    float _1234 = _1144 * _1222;
    float _1236 = _1144 * _1224;
    float _1238 = _1144 * _1212;
    float _1240 = fma(_1176, _1232, _1106);
    float _1242 = fma(_1142, _1188, _1234);
    float _1244 = fma(_1142, _1218, _1236);
    float _1246 = fma(_1142, _1216, _1238);
    float _1248 = _1044 * _1200;
    float _1250 = fma(_1150, _1226, _1242);
    float _1252 = fma(_1150, _1230, _1244);
    float _1254 = fma(_1150, _1240, _1246);
    float _1256 = _1088 * 6.283185482025146484375;
    float _1258 = sin(_1256);
    float _1260 = -_1116;
    float _1262 = _1260 + _1252;
    float _1264 = _1250 + _994;
    float _1266 = _1248 * _1160;
    float _1268 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1262);
    float _1272 = _1248 * _1158;
    float _1274 = _1254 + _1018;
    float _1276 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1264);
    float _1278 = _1270 * _1266;
    float _1280 = _1248 * _1268;
    float _1282 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1274);
    float _1284 = _1276 * _1272;
    float _1286 = _1192 * _1278;
    float _1288 = _1282 * _1280;
    float _1290 = fma(_1258, _1186, _1194);
    float _1292 = -_1190;
    float _1294 = fma(_1258, _1178, _1292);
    float _1296 = -_1278;
    float _1298 = _1258 * _1296;
    float _1300 = -_1178;
    float _1302 = fma(_1258, _1190, _1300);
    float _1304 = fma(_1290, _1284, _1286);
    float _1306 = _1204 * _1278;
    float _1308 = fma(_1202, _1284, _1298);
    float _1310 = fma(_1258, _1194, _1186);
    float _1312 = fma(_1294, _1288, _1304);
    float _1314 = fma(_1302, _1284, _1306);
    float _1316 = fma(_1196, _1288, _1308);
    float _1318 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1320 = fma(_1310, _1288, _1314);
    float _1322 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1324 = fma(_1316, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1318);
    float _1326 = fma(_1316, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1322);
    float _1328 = fma(_1320, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1324);
    float _1330 = fma(_1320, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1326);
    float _1332 = _958 + _1328;
    float _1334 = _908 + _1330;
    float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1338 = _1332 + _1336;
    float _1340 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1342 = _1334 + _1340;
    float _1344 = _1338 * _1338;
    float _1346 = fma(_1342, _1342, _1344);
    float _1348 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1350 = sqrt(_1346);
    float _1352 = fma(_1316, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1348);
    float _1354 = fma(_1320, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1352);
    float _1356 = _924 + _1354;
    bool _1358 = _1350 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1360 = _1352;
    float _1362 = _924;
    float _1364 = _1334;
    float _1366 = _958;
    float _1368 = _908;
    float _1370 = _996;
    if (!_1358)
    {
        _1360 = _1332;
    }
    float _1372 = _1360;
    float _1374 = _1372;
    if (!_1358)
    {
        _1362 = _1356;
    }
    float _1376 = _1362;
    bool _1378 = !_1358;
    float _1380 = _1376;
    if (!_1378)
    {
        float _1382 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1384 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1386 = _1350 + _1384;
        float _1388 = rsqrt(_1346);
        float _1390 = _1386 * _1382;
        float _1392 = _1356 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1394 = _1390 * 0.15915493667125701904296875;
        float _1396 = _1394 * 6.283185482025146484375;
        float _1398 = cos(_1396);
        float _1400 = _1394 * 6.283185482025146484375;
        float _1402 = sin(_1400);
        float _1404 = _1398 + (-1.0);
        float _1406 = fma(_1402, _1392, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1408 = _1404 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1410 = _1388 * _1406;
        float _1412 = fma(_1356, _1398, _1408);
        float _1414 = fma(_1342, _1410, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1416 = fma(_1338, _1410, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1380 = _1412;
        _1364 = _1414;
        _1374 = _1416;
        _1366 = _1394;
        _1368 = _1406;
    }
    float _1418 = _1380;
    float _1420 = _1364;
    float _1422 = _1374;
    float _1424 = _1366;
    float _1426 = _1368;
    float _1428 = -_1098;
    float _1430 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1418);
    float _1432 = -_1108;
    float _1434 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1420);
    float _1436 = -_1118;
    float _1438 = fma(_1436, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1422);
    float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1442 = _1430 + _1440;
    float _1444 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1446 = _1434 + _1444;
    float _1448 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1450 = _1438 + _1448;
    float _1452 = _1442 * _1442;
    float _1454 = fma(_1446, _1446, _1452);
    float _1456 = fma(_1450, _1450, _1454);
    float _1458 = rsqrt(_1456);
    float _1460 = sqrt(_1456);
    float _1462 = _1458 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1464 = _1446 * _1462;
    float _1466 = _1450 * _1462;
    float _1468 = _1464 * _1464;
    float _1470 = _1466 * _1466;
    float _1472 = _1468 + _1470;
    float _1474 = sqrt(_1472);
    bool _1476 = _1474 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1478 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1480 = _1474 + _1478;
    float _1482 = _1450;
    float _1484 = _1426;
    float _1486 = _1480;
    float _1488 = _1424;
    float _1490 = _1442;
    if (_1476)
    {
        float _1492 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1482 = _1492;
    }
    float _1494 = _1482;
    if (_1476)
    {
        float _1496 = rsqrt(_1472);
        _1484 = _1496;
    }
    float _1498 = _1484;
    float _1500 = _1498;
    if (_1476)
    {
        float _1502 = _1480 * _1494;
        _1486 = _1502;
    }
    float _1504 = _1486;
    if (_1476)
    {
        float _1506 = _1504 * 0.15915493667125701904296875;
        _1488 = _1506;
    }
    float _1508 = _1488;
    float _1510 = _1452;
    if (_1476)
    {
        float _1512 = _1508 * 6.283185482025146484375;
        float _1514 = sin(_1512);
        _1510 = _1514;
    }
    float _1516 = _1510;
    float _1518 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1520 = precise::max(0.0, _1518);
    float _1522 = _1458;
    float _1524 = _1520;
    float _1526 = _1518;
    if (_1476)
    {
        float _1528 = _1508 * 6.283185482025146484375;
        float _1530 = cos(_1528);
        _1522 = _1530;
    }
    float _1532 = _1522;
    float _1534 = -_1462;
    float _1536 = -_1520;
    float _1538 = fma(_1442, _1534, _1536);
    if (!_1476)
    {
        _1524 = _1464;
    }
    float _1540 = _1524;
    float _1542 = _1540;
    if (_1476)
    {
        float _1544 = _1538 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1526 = _1544;
    }
    float _1546 = _1526;
    float _1548 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1550 = _1546;
    float _1552 = _1516;
    if (_1476)
    {
        float _1554 = fma(_1516, _1546, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1550 = _1554;
    }
    float _1556 = _1550;
    float _1558 = _1556;
    if (!_1476)
    {
        _1552 = _1468;
    }
    float _1560 = _1552;
    float _1562 = _1560;
    float _1564 = _1532;
    if (_1476)
    {
        float _1566 = _1532 + (-1.0);
        _1490 = _1566;
    }
    float _1568 = _1490;
    float _1570 = _1568;
    if (_1476)
    {
        float _1572 = _1498 * _1556;
        _1370 = _1572;
    }
    float _1574 = _1370;
    if (!_1476)
    {
        _1558 = _1538;
    }
    float _1576 = _1558;
    float _1578 = _1576;
    if (_1476)
    {
        float _1580 = _1568 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1500 = _1580;
    }
    float _1582 = _1500;
    if (_1476)
    {
        float _1584 = _1464 * _1574;
        _1542 = _1584;
    }
    float _1586 = _1542;
    if (!_1476)
    {
        _1570 = _1466;
    }
    float _1588 = _1570;
    float _1590 = _1588;
    if (_1476)
    {
        float _1592 = _1466 * _1574;
        _1590 = _1592;
    }
    float _1594 = _1590;
    if (_1476)
    {
        float _1596 = fma(_1538, _1532, _1582);
        _1578 = _1596;
    }
    float _1598 = _1578;
    if (_1476)
    {
        float _1600 = _1586 * _1586;
        _1562 = _1600;
    }
    float _1602 = _1562;
    if (!_1476)
    {
        _1564 = _1470;
    }
    float _1604 = _1564;
    float _1606 = _1604;
    if (_1476)
    {
        float _1608 = _1594 * _1594;
        _1606 = _1608;
    }
    float _1610 = _1606;
    float _1612 = fma(_1598, _1598, _1602);
    float _1614 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1616 = _1612 + _1610;
    float _1618 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1548);
    float _1620 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1624 = fma(_1460, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1622);
    float _1626 = precise::clamp(_1624, 0.0, 1.0);
    float _1628 = rsqrt(_1616);
    float _1630 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1618);
    float _1632 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1634 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1620);
    float _1636 = -_1626;
    float _1638 = _1636 + 1.0;
    float _1640 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1642 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1632);
    float _1644 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1634);
    float _1646 = abs(_1638);
    float _1648 = log2(_1646);
    float _1650 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1640);
    float _1652 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1642);
    float _1654 = _1644 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1656 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1658 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1650);
    float _1660 = _1652 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1662 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1664 = _1628 * _1586;
    float _1666 = _1628 * _1598;
    float _1668 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1670 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1662);
    float _1672 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1674 = _1628 * _1594;
    float _1676 = _1658 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1678 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1670);
    float _1680 = -_1672;
    float _1682 = fma(_1666, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1680);
    float _1684 = _1648 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1686 = -_1668;
    float _1688 = fma(_1686, _1614, 1.0);
    float _1690 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1678);
    float _1692 = -_1674;
    float _1694 = fma(_1692, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1682);
    float _1696 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1698 = log2(_1688);
    float _1700 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1702 = fma(_1694, -0.5, 0.5);
    float _1704 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1696);
    float _1706 = fma(_1694, 0.5, 0.5);
    float _1708 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1700);
    float _1710 = exp2(_1684);
    float _1712 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1704);
    float _1714 = fma(_1706, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1716 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1708);
    float _1718 = _1666 + 1.0;
    float _1720 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1712);
    float _1722 = fma(_1706, _1714, -0.212114393711090087890625);
    float _1724 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1716);
    float _1726 = 1.0 / _1690;
    float _1728 = _1698 * 0.693147182464599609375;
    float _1730 = fma(_1706, _1722, 1.570728778839111328125);
    float _1732 = sqrt(_1702);
    float _1734 = -_1666;
    float _1736 = fma(_1710, _1718, _1734);
    float _1738 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1740 = fma(_1736, 0.5, 0.5);
    float _1742 = _1720 * _1726;
    float _1744 = _1724 * _1726;
    float _1746 = fma(_1742, 0.5, 0.5);
    float _1748 = fma(_1744, -0.5, 0.5);
    float _1750 = _1732 * 0.636619746685028076171875;
    float3 _4701 = float3(_1746, _1748, _1738);
    float _1752 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4701, float3(0.0), isnan(_4701)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4701, float3(0.0), isnan(_4701)), level(0.0)).x;
    float _1754 = -_1730;
    float _1756 = fma(_1750, _1754, 1.0);
    float3 _4717 = float3(_1746, _1748, _1738);
    float4 _1759 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4717, float3(0.0), isnan(_4717)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4717, float3(0.0), isnan(_4717)), level(0.0)).xyzw;
    float _1761 = _1759.x;
    float _1763 = _1759.y;
    float _1765 = _1759.z;
    float _1767 = _1759.w;
    float2 _4734 = float2(_1756, _1740);
    float3 _1771 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4734, float2(0.0), isnan(_4734)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4734, float2(0.0), isnan(_4734)), level(0.0)).xyz;
    float _1773 = _1771.x;
    float _1775 = _1771.y;
    float _1777 = _1771.z;
    float _1779 = in.m_59.x;
    float _1781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1783 = _1648 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1787 = _1785 != 0;
    float _1789 = in.m_49.w;
    int _1791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1793 = _1791 != 0;
    float _1795 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1797 = in.m_59.y;
    float _1799 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1801 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1795);
    out.m_45.x = 1.0;
    float _1803 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1801);
    float _1805 = _1744;
    float _1807 = _1797;
    if (_1787)
    {
        float _1809 = in.m_49.z;
        _1805 = _1809;
    }
    float _1811 = _1805;
    float _1813 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1815 = exp2(_1783);
    float _1817 = in.m_61.x;
    float _1819 = in.m_61.y;
    float _1821 = in.m_61.z;
    float _1823 = in.m_61.w;
    float _1825 = 0.0;
    float _1827 = _1779;
    if (_1787)
    {
        _1825 = _1779;
    }
    float _1829 = _1825;
    out.m_63.x = _1434;
    out.m_63.y = _1430;
    out.m_63.z = _1438;
    float _1831 = -_1815;
    float _1833 = _1831 + 1.0;
    bool _1835 = _1811 > 0.5;
    bool _1837 = _1835 && _1787;
    float _1839 = in.m_65.x;
    float _1841 = in.m_65.y;
    float _1843 = in.m_65.z;
    float _1845 = _1829;
    if (_1837)
    {
        float _1847 = -_1829;
        float _1849 = _1847 + 1.0;
        _1845 = _1849;
    }
    float _1851 = _1845;
    bool _1853 = _1789 > 0.5;
    float _1855 = -_1797;
    float _1857 = _1855 + 1.0;
    if (_1787)
    {
        _1827 = _1851;
    }
    float _1859 = _1827;
    if (_1793)
    {
        float _1861 = _1853 ? _1857 : _1797;
        _1807 = _1861;
    }
    float _1863 = _1807;
    float _1865 = _1799 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1867 = _1252 != _1116;
    bool _1869 = isnan(_1252);
    bool _1871 = _1867 || _1869;
    bool _1873 = isnan(_1116);
    bool _1875 = _1871 || _1873;
    float _1877 = fma(_1813, _1859, -0.5);
    float _1879 = -_1819;
    float _1881 = _1258 * _1879;
    float _1883 = fma(_1865, _1863, -0.5);
    float _1885 = _1222 * _1841;
    float _1887 = _1224 * _1841;
    float _1889 = _1212 * _1841;
    float _1891 = fma(_632, _1877, _636);
    float _1893 = fma(_1188, _1839, _1885);
    float _1895 = fma(_1218, _1839, _1887);
    float _1897 = fma(_1216, _1839, _1889);
    float _1899 = _1192 * _1819;
    float _1901 = fma(_1226, _1843, _1893);
    float _1903 = fma(_1230, _1843, _1895);
    float _1905 = -_994;
    bool _1907 = _1250 == _1905;
    bool _1909 = !_1875;
    bool _1911 = _1907 && _1909;
    float _1913 = fma(_1290, _1817, _1899);
    float _1915 = fma(_1202, _1817, _1881);
    float _1917 = fma(_1240, _1843, _1897);
    float _1919 = -_1018;
    bool _1921 = _1254 == _1919;
    bool _1923 = _1921 && _1911;
    float _1925 = fma(_1294, _1821, _1913);
    float _1927 = fma(_1196, _1821, _1915);
    float _1929 = -_642;
    float _1931 = fma(_612, _1883, _1929);
    float _1933 = _1903 * _1817;
    float _1935 = _1925 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1937 = _1925 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1939 = _1925 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1941 = _1204 * _1819;
    float _1943 = fma(_1927, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1935);
    float _1945 = fma(_1927, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1937);
    float _1947 = _1901 * _1821;
    float _1949 = fma(_1302, _1817, _1941);
    float _1951 = _1917 * _1819;
    float _1953 = -_1933;
    float _1955 = fma(_1901, _1819, _1953);
    float _1957 = -_1947;
    float _1959 = fma(_1917, _1817, _1957);
    float _1961 = fma(_1310, _1821, _1949);
    float _1963 = -_1951;
    float _1965 = fma(_1903, _1821, _1963);
    float _1967 = _1903;
    float _1969 = _1901;
    float _1971 = _1917;
    if (!_1923)
    {
        float _1973 = fma(_1262, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1903);
        _1967 = _1973;
    }
    float _1975 = _1967;
    float _1977 = _1959 * _1823;
    float _1979 = _1955 * _1823;
    float _1981 = _1965 * _1823;
    if (!_1923)
    {
        float _1983 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1901);
        _1969 = _1983;
    }
    float _1985 = _1969;
    float _1987 = _1192 * _1977;
    float _1989 = -_1977;
    float _1991 = _1258 * _1989;
    float _1993 = _1192 * _1975;
    float _1995 = _1204 * _1977;
    float _1997 = fma(_1290, _1981, _1987);
    float _1999 = -_1975;
    float _2001 = _1258 * _1999;
    float _2003 = _1204 * _1975;
    float _2005 = fma(_1202, _1981, _1991);
    float _2007 = fma(_1294, _1979, _1997);
    if (!_1923)
    {
        float _2009 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1917);
        _1971 = _2009;
    }
    float _2011 = _1971;
    float _2013 = fma(_1290, _1985, _1993);
    float _2015 = fma(_1927, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1939);
    float _2017 = fma(_1202, _1985, _2001);
    float _2019 = fma(_1302, _1985, _2003);
    float _2021 = fma(_1196, _1979, _2005);
    float _2023 = _2007 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2025 = _2007 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2027 = _2007 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2029 = fma(_1294, _2011, _2013);
    float _2031 = fma(_1196, _2011, _2017);
    float _2033 = fma(_1310, _2011, _2019);
    float _2035 = fma(_2021, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2023);
    float _2037 = fma(_2021, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2025);
    float _2039 = fma(_2021, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2027);
    float _2041 = _2029 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2043 = _2029 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2045 = _2029 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2047 = fma(_1961, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1943);
    float _2049 = fma(_2031, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2041);
    float _2051 = fma(_2031, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2043);
    float _2053 = fma(_2031, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2045);
    float _2055 = fma(_1961, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1945);
    float _2057 = fma(_1961, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2015);
    float _2059 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1803);
    float _2061 = _1891 + 0.5;
    float _2063 = fma(_1302, _1981, _1995);
    out.m_67.x = _2047;
    out.m_67.y = _2055;
    out.m_67.z = _2057;
    float _2065 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2067 = _2059 + _2065;
    float _2069 = fma(_1310, _1979, _2063);
    float _2071 = _1931 + 0.5;
    float _2073 = _1690 + _2067;
    float _2075 = fma(_2069, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2035);
    float _2077 = fma(_2033, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2049);
    float _2079 = fma(_2033, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2051);
    float _2081 = _2073 * 0.5;
    float _2083 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2085 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2087 = fma(_2069, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2037);
    float _2089 = fma(_2069, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2039);
    float _2091 = fma(_2033, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2053);
    float _2093 = -_2085;
    float _2095 = _2093 + 1.0;
    float _2097 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.w = _2083;
    out.m_71.z = _2061;
    out.m_71.w = _2071;
    out.m_73.x = _2075;
    out.m_73.y = _2087;
    out.m_73.z = _2089;
    out.m_75.x = _2077;
    out.m_75.y = _2079;
    out.m_75.z = _2091;
    out.gl_Position.x = _1720;
    out.gl_Position.y = _1724;
    out.gl_Position.z = _2067;
    out.gl_Position.w = _1690;
    out.m_77.z = _2081;
    out.m_77.w = _1690;
    out.m_79.w = _2097;
    float _2099 = _2085 * _1752;
    float _2101 = _1767 * _2099;
    float _2103 = _1767 * _2095;
    float _2105 = _1777 * _2099;
    float _2107 = fma(_1773, _2101, _1761);
    float _2109 = fma(_1775, _2101, _1763);
    float _2111 = fma(_1767, _2105, _1765);
    out.m_81.x = _2107;
    out.m_81.y = _2109;
    out.m_81.z = _2111;
    out.m_81.w = _2103;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_100);
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _106;
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2168 = as_type<float>(_116);
        out.gl_Position.z = _2168;
    }
    if (!_104)
    {
        return out;
    }
    float _120 = in.m_47.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _136 = _134;
    if (_130)
    {
        float _138 = float(_100);
        _108 = _138;
    }
    float _140 = _108;
    bool _142 = _134 >= _140;
    bool _144 = !_130;
    bool _146 = _142 || _144;
    float _148 = _140;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _148;
    if (_146)
    {
        out.m_45.x = 0.0;
    }
    if (_146)
    {
        float _152 = _150 * 5.0;
        _118 = as_type<int>(_152);
    }
    int _154 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2238 = as_type<float>(_154);
        out.gl_Position.z = _2238;
    }
    if (_146)
    {
        return out;
    }
    float _156 = in.m_49.z;
    float _158 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _162 = _160 != 0;
    float _164 = in.m_49.x;
    float _166 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _168 = _166 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _170 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _172 = _170 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _174 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _176 = _174 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _178 = 1.0 / _172;
    float _180 = 0.0;
    float _182 = _158;
    if (!_162)
    {
        float _184 = in.m_49.y;
        _180 = _184;
    }
    float _186 = _180;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _188;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _194 = _192 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _198 = _196 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _200;
    float _204 = 1.0 / _176;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _208 = _206 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _212 = _210 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _214 = in.m_51.y;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _222 = _220 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _224 = 1.0 / _208;
    float _226 = _190 * _178;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _228;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _234 = _232 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _236 = 1.0 / _168;
    float _238 = _194 * _204;
    float _240 = _204;
    if (!_162)
    {
        _240 = _186;
    }
    float _242 = _240;
    float _244 = _156 * 2.0;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _248 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _252 = _248 || _250;
    bool _254 = isnan(1.0);
    bool _256 = _252 || _254;
    float _258 = 1.0 / _198;
    float _260 = _242;
    float _262 = _186;
    if (_162)
    {
        float _264 = in.m_49.x;
        float _266 = in.m_49.y;
        _260 = _264;
        _262 = _266;
    }
    float _268 = _260;
    float _270 = _262;
    float _272 = _164 * 2.0;
    float _274 = -_214;
    float _276 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0030000000260770320892333984375, _274);
    float _278 = _202 * _224;
    float _280 = _214 * 78.233001708984375;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _284 = 1.0 / _234;
    float _286 = _222 * _236;
    float _288 = 0.0;
    if (!_256)
    {
        float _290 = _158 * _158;
        float _292 = _290 * 0.5;
        _288 = _292;
    }
    float _294 = _288;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _300 = floor(_276);
    float _302 = _218 * _258;
    float _304 = _294;
    if (!_256)
    {
        float _306 = _294 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _304 = _306;
    }
    float _308 = _304;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _312 = 1.0 / _298;
    float _314 = _212 * _284;
    float _316 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[83].z, _310);
    float _318 = floor(_244);
    float _320 = _300 * 12.98980045318603515625;
    float _322 = -_300;
    float _324 = _276 + _322;
    float _326 = floor(_272);
    float _328 = _164 + _156;
    float _330 = _230 * _312;
    float _332 = _328 + (-1.0);
    float _334 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _336 = log2(_334);
    float _338 = _272;
    float _340 = _308;
    if (!_162)
    {
        float _342 = in.m_49.z;
        _338 = _342;
    }
    float _344 = _338;
    float _346 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _348 = _318 > 0.0;
    float _350 = _268 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _352 = _318 >= 0.0;
    bool _354 = isnan(_318);
    bool _356 = _352 || _354;
    bool _358 = isnan(0.0);
    bool _360 = _356 || _358;
    float _362 = precise::max(_324, 0.64999997615814208984375);
    float _364 = -_246;
    float _366 = fma(_350, 2.0, _364);
    bool _368 = _326 > 0.0;
    bool _370 = _326 >= 0.0;
    bool _372 = isnan(_326);
    bool _374 = _370 || _372;
    bool _376 = isnan(0.0);
    bool _378 = _374 || _376;
    float _380 = in.m_53.x;
    float _382 = in.m_53.y;
    float _384 = in.m_53.z;
    float _386 = precise::min(_362, 1.0);
    float _388 = _336 * _134;
    float _390 = fma(_164, _280, _320);
    float _392 = fma(_386, 2.8571426868438720703125, -1.8571426868438720703125);
    float _394 = exp2(_388);
    float _396 = _390 * 0.15915493667125701904296875;
    float _398 = fma(_156, _280, _320);
    float _400 = _350;
    float _402 = _344;
    if (!_162)
    {
        _400 = _344;
    }
    float _404 = _400;
    float _406 = _398 * 0.15915493667125701904296875;
    float _408 = _404;
    if (_162)
    {
        _402 = _270;
    }
    float _410 = _402;
    float _412 = _396 * 6.283185482025146484375;
    float _414 = sin(_412);
    int _416 = _378 ? 0 : 1;
    float _418 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[83].w, _282);
    int _420 = _360 ? 0 : 1;
    int _422 = ~_416;
    int _424 = _422 + 1;
    int _426 = _424 + 1;
    float _428 = _406 * 6.283185482025146484375;
    float _430 = sin(_428);
    float _432 = -_214;
    float _434 = _432 + _382;
    float _436 = _270 * _214;
    int _438 = ~_420;
    int _440 = _438 + 1;
    int _442 = _440 + 1;
    int _444 = _442;
    int _446 = _426;
    float _448 = _418;
    if (!_348)
    {
        int _450 = ~_420;
        int _452 = _450 + 1;
        _444 = _452;
    }
    int _454 = _444;
    float _456 = fma(_436, 78.233001708984375, _320);
    if (!_368)
    {
        int _458 = ~_416;
        int _460 = _458 + 1;
        _446 = _460;
    }
    int _462 = _446;
    bool _464 = !_256;
    if (!_464)
    {
        float _466 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _468 = log2(_466);
        float _470 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _472 = _470 + 1.0;
        float _474 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _476 = _158 * _468;
        float _478 = 1.0 / _472;
        float _480 = _474 * 0.693147182464599609375;
        float _482 = exp2(_476);
        float _484 = 1.0 / _480;
        float _486 = _482 + (-1.0);
        float _488 = -_486;
        float _490 = fma(_488, _484, _158);
        float _492 = _490 * _478;
        float _494 = _492 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _340 = _494;
    }
    float _496 = _340;
    bool _498 = !_256;
    if (!_498)
    {
        float _500 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _502 = log2(_500);
        float _504 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _506 = _504 + 1.0;
        float _508 = 1.0 / _506;
        float _510 = _158 * _502;
        float _512 = exp2(_510);
        float _514 = -_512;
        float _516 = _514 + 1.0;
        float _518 = _516 * _508;
        _182 = _518;
    }
    float _520 = _182;
    float _522 = in.m_47.x;
    float _524 = in.m_47.y;
    float _526 = in.m_47.z;
    float _528 = _270 + _156;
    float _530 = _270 * 2.0;
    float _532 = _270 + _164;
    if (_162)
    {
        _408 = _270;
    }
    float _534 = _408;
    float _536 = _528 + (-1.0);
    float _538 = floor(_530);
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _542 = _534 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _544 = _532 + (-1.0);
    float _546 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _550 = 1.0 + _548;
    float _552 = _430 * 43758.546875;
    float _554 = _496 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _556 = _496 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _558 = _414 * 43758.546875;
    float _560 = fma(_542, -2.0, _540);
    float _562 = 1.0 / _550;
    float _564 = in.m_55.w;
    float _566 = -_394;
    float _568 = _566 + 1.0;
    bool _570 = _538 > 0.0;
    float _572 = in.m_42.x;
    float _574 = in.m_42.y;
    float _576 = in.m_42.z;
    bool _578 = _538 >= 0.0;
    bool _580 = isnan(_538);
    bool _582 = _578 || _580;
    bool _584 = isnan(0.0);
    bool _586 = _582 || _584;
    float _588 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _590 = floor(_552);
    float _592 = fma(_520, _522, _554);
    float _594 = fma(_520, _524, _556);
    float _596 = _456 * 0.15915493667125701904296875;
    bool _598 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _600 = _496 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _602 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _604 = isnan(1.0);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _610 = _606 || _608;
    float _612 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _418);
    float _614 = floor(_558);
    bool _616 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _618 = isnan(0.0);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _624 = _620 || _622;
    float _626 = fma(_520, _526, _600);
    int _628 = _586 ? 0 : 1;
    float _630 = _624 ? _568 : 0.0;
    float _632 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _316);
    float _634 = -_134;
    float _636 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[81].x, _366);
    float _638 = _596 * 6.283185482025146484375;
    float _640 = sin(_638);
    float _642 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _560);
    if (!_598)
    {
        _448 = _324;
    }
    float _644 = _448;
    float _646 = _644;
    if (_610)
    {
        float _648 = _630 * _562;
        _136 = _648;
    }
    float _650 = _136;
    float _652 = -_590;
    float _654 = _552 + _652;
    float _656 = fma(_592, _564, _572);
    float _658 = fma(_594, _564, _574);
    float _660 = fma(_626, _564, _576);
    float _662 = -_614;
    float _664 = _558 + _662;
    int _666 = ~_628;
    int _668 = _666 + 1;
    int _670 = _668 + 1;
    float _672 = _640 * 43758.546875;
    bool _674 = !_598;
    int _676 = _670;
    if (!_674)
    {
        float _678 = in.m_49.x;
        float _680 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _682 = _678 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _684 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[14].x, _324);
        float _686 = _684 * _680;
        float _688 = floor(_686);
        float _690 = -_688;
        float _692 = _686 + _690;
        _646 = _692;
    }
    float _694 = _646;
    if (!_570)
    {
        int _696 = ~_628;
        int _698 = _696 + 1;
        _676 = _698;
    }
    int _700 = _676;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _704 = _694 + _702;
    float _706 = floor(_672);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _710 = _694 + _708;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _714 = _694 + _712;
    float _716 = fma(_238, _704, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _720 = _694 + _718;
    float _722 = fma(_226, _710, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _726 = _694 + _724;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _730 = _694 + _728;
    float _732 = fma(_278, _720, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _734 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _736 = isnan(_694);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = fma(_302, _714, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _748 = fma(_286, _726, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _750 = fma(_314, _730, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _752 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _754 = isnan(_694);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = -_744;
    float _766 = _764 + 1.0;
    float _768 = -_706;
    float _770 = _672 + _768;
    bool _772 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _774 = isnan(_694);
    bool _776 = _772 || _774;
    bool _778 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _780 = _776 || _778;
    float _782 = float(_780);
    float _784 = _762 * _766;
    float _786 = -_762;
    float _788 = _786 + 1.0;
    float _790 = fma(_664, 2.0, -1.0);
    float _792 = fma(_654, 2.0, -1.0);
    float _794 = fma(_770, 2.0, -1.0);
    float _796 = -_782;
    float _798 = _796 + 1.0;
    float _800 = _658 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _802 = _658 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _806 = _804 != 0;
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _810 = _808 != 0;
    int _812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _814 = _812 != 0;
    float _816 = _658 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _818 = _744 * _798;
    float _820 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[4].x, _800);
    float _822 = _794 * _794;
    float _824 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[5].x, _802);
    float _826 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[6].x, _816);
    bool _828 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _830 = isnan(_694);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = fma(_790, _790, _822);
    bool _842 = !_806;
    int _844 = _842 ? 0 : 1;
    float _846 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[4].z, _820);
    bool _848 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _850 = isnan(_694);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = -_838;
    float _862 = _860 + 1.0;
    int _864 = abs(_844);
    float _866 = fma(_792, _792, _840);
    float _868 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[5].z, _824);
    float _870 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[6].z, _826);
    float _872 = _838 * _788;
    float _874 = _858 * _862;
    bool _876 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _878 = isnan(_694);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = -_858;
    float _890 = _888 + 1.0;
    float _892 = rsqrt(_866);
    float _894 = float(_454);
    float _896 = _392 * _392;
    float _898 = float(_864);
    float _900 = _886 * _890;
    float _902 = -_886;
    float _904 = _902 + 1.0;
    float _906 = float(_462);
    float _908 = _846 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _910 = _898 * _894;
    float _912 = _722 * _900;
    float _914 = in.m_57.x;
    float _916 = in.m_57.y;
    float _918 = in.m_57.z;
    bool _920 = !_810;
    int _922 = _920 ? 0 : 1;
    float _924 = _868 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _926 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[159].x, _912);
    float _928 = _910 * (-2.0);
    int _930 = abs(_922);
    float _932 = _792 * _892;
    float _934 = _790 * _892;
    float _936 = _794 * _892;
    float _938 = float(_930);
    float _940 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _942 = _924 + _940;
    bool _944 = !_814;
    int _946 = _944 ? 0 : 1;
    float _948 = fma(_716, _874, _926);
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _952 = _908 + _950;
    float _954 = _938 * _906;
    int _956 = abs(_946);
    float _958 = _870 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _960 = _942 * _942;
    float _962 = float(_700);
    float _964 = _936 * _936;
    float _966 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _968 = _958 + _966;
    float _970 = fma(_952, _952, _960);
    float _972 = _954 * (-2.0);
    float _974 = float(_956);
    float _976 = fma(_928, _914, _914);
    float _978 = fma(_968, _968, _970);
    float _980 = _164 + (-0.5);
    float _982 = fma(_588, _928, _588);
    float _984 = fma(_934, _934, _964);
    float _986 = fma(_746, _872, _948);
    float _988 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[196].x, _976);
    float _990 = fma(_972, _916, _916);
    float _992 = _270 + (-0.5);
    float _994 = in.m_51.x;
    float _996 = _974 * _962;
    float _998 = fma(_546, _972, _546);
    float _1000 = fma(_932, _932, _984);
    float _1002 = fma(_982, _650, _988);
    float _1004 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[196].y, _990);
    bool _1006 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1008 = isnan(_694);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1014 = _1010 || _1012;
    float _1016 = float(_1014);
    float _1018 = in.m_51.z;
    float _1020 = fma(_748, _784, _986);
    float _1022 = _996 * (-2.0);
    float _1024 = fma(_998, _650, _1004);
    float _1026 = in.m_55.x;
    float _1028 = in.m_55.y;
    float _1030 = in.m_55.z;
    bool _1032 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1034 = isnan(_694);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    float _1044 = rsqrt(_978);
    float _1046 = _1002 * 0.15915493667125701904296875;
    float _1048 = -_1016;
    float _1050 = _1048 + 1.0;
    float _1052 = fma(_1022, _918, _918);
    float _1054 = _156 + (-0.5);
    float _1056 = fma(_346, _1022, _346);
    float _1058 = _782 * _1050;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1062 = _694 + _1060;
    float _1064 = -_1042;
    float _1066 = _1064 + 1.0;
    float _1068 = fma(_732, _818, _1020);
    float _1070 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1052);
    float _1072 = fma(_330, _1062, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1074 = _1016 * _1066;
    float _1076 = fma(_750, _1058, _1068);
    float _1078 = fma(_1056, _650, _1070);
    float _1080 = _896 * 0.15915493667125701904296875;
    float _1082 = rsqrt(_1000);
    float _1084 = fma(_1072, _1074, _1076);
    float _1086 = _1024 * 0.15915493667125701904296875;
    float _1088 = _1078 * 0.15915493667125701904296875;
    float _1090 = -_994;
    float _1092 = _1090 + _380;
    float _1094 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1084);
    float _1096 = precise::clamp(_1094, 0.0, 1.0);
    float _1098 = _942 * _1044;
    float _1100 = -_1018;
    float _1102 = _1100 + _384;
    float _1104 = _1080 * 6.283185482025146484375;
    float _1106 = cos(_1104);
    float _1108 = _952 * _1044;
    float _1110 = -_1098;
    float _1112 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[18].w, _942);
    float _1114 = _1026 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1116 = _324 + _896;
    float _1118 = _968 * _1044;
    float _1120 = -_1108;
    float _1122 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[18].w, _952);
    float _1124 = _1112 * _1112;
    float _1126 = _1046 * 6.283185482025146484375;
    float _1128 = sin(_1126);
    float _1130 = -_1118;
    float _1132 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[18].w, _968);
    float _1134 = _934 * _1082;
    float _1136 = fma(_1122, _1122, _1124);
    float _1138 = _936 * _1082;
    float _1140 = _932 * _1082;
    float _1142 = _1096 * _1092;
    float _1144 = _1096 * _434;
    float _1146 = _1046 * 6.283185482025146484375;
    float _1148 = cos(_1146);
    float _1150 = _1096 * _1102;
    float _1152 = fma(_1132, _1132, _1136);
    float _1154 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1156 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1158 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1160 = _1154 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1162 = _1086 * 6.283185482025146484375;
    float _1164 = sin(_1162);
    float _1166 = _1086 * 6.283185482025146484375;
    float _1168 = cos(_1166);
    float _1170 = _1088 * 6.283185482025146484375;
    float _1172 = cos(_1170);
    float _1174 = -_1106;
    float _1176 = _1174 + 1.0;
    float _1178 = _1148 * _1164;
    float _1180 = _1134 * _1176;
    float _1182 = _1080 * 6.283185482025146484375;
    float _1184 = sin(_1182);
    float _1186 = _1148 * _1168;
    float _1188 = fma(_1134, _1180, _1106);
    float _1190 = _1128 * _1168;
    float _1192 = _1148 * _1172;
    float _1194 = _1128 * _1164;
    float _1196 = _1164 * _1172;
    float _1198 = _1138 * _1176;
    float _1200 = sqrt(_1152);
    float _1202 = _1168 * _1172;
    float _1204 = _1128 * _1172;
    float _1206 = _1134 * _1184;
    float _1208 = _1138 * _1184;
    float _1210 = _1140 * _1184;
    float _1212 = fma(_1140, _1198, _1206);
    float _1214 = -_1208;
    float _1216 = fma(_1140, _1180, _1214);
    float _1218 = fma(_1138, _1180, _1210);
    float _1220 = -_1210;
    float _1222 = fma(_1138, _1180, _1220);
    float _1224 = fma(_1138, _1198, _1106);
    float _1226 = fma(_1140, _1180, _1208);
    float _1228 = -_1206;
    float _1230 = fma(_1140, _1198, _1228);
    float _1232 = _1140 * _1140;
    float _1234 = _1144 * _1222;
    float _1236 = _1144 * _1224;
    float _1238 = _1144 * _1212;
    float _1240 = fma(_1176, _1232, _1106);
    float _1242 = fma(_1142, _1188, _1234);
    float _1244 = fma(_1142, _1218, _1236);
    float _1246 = fma(_1142, _1216, _1238);
    float _1248 = _1044 * _1200;
    float _1250 = fma(_1150, _1226, _1242);
    float _1252 = fma(_1150, _1230, _1244);
    float _1254 = fma(_1150, _1240, _1246);
    float _1256 = _1088 * 6.283185482025146484375;
    float _1258 = sin(_1256);
    float _1260 = -_1116;
    float _1262 = _1260 + _1252;
    float _1264 = _1250 + _994;
    float _1266 = _1248 * _1160;
    float _1268 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1262);
    float _1272 = _1248 * _1158;
    float _1274 = _1254 + _1018;
    float _1276 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1264);
    float _1278 = _1270 * _1266;
    float _1280 = _1248 * _1268;
    float _1282 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1274);
    float _1284 = _1276 * _1272;
    float _1286 = _1192 * _1278;
    float _1288 = _1282 * _1280;
    float _1290 = fma(_1258, _1186, _1194);
    float _1292 = -_1190;
    float _1294 = fma(_1258, _1178, _1292);
    float _1296 = -_1278;
    float _1298 = _1258 * _1296;
    float _1300 = -_1178;
    float _1302 = fma(_1258, _1190, _1300);
    float _1304 = fma(_1290, _1284, _1286);
    float _1306 = _1204 * _1278;
    float _1308 = fma(_1202, _1284, _1298);
    float _1310 = fma(_1258, _1194, _1186);
    float _1312 = fma(_1294, _1288, _1304);
    float _1314 = fma(_1302, _1284, _1306);
    float _1316 = fma(_1196, _1288, _1308);
    float _1318 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1320 = fma(_1310, _1288, _1314);
    float _1322 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1324 = fma(_1316, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1318);
    float _1326 = fma(_1316, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1322);
    float _1328 = fma(_1320, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1324);
    float _1330 = fma(_1320, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1326);
    float _1332 = _958 + _1328;
    float _1334 = _908 + _1330;
    float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1338 = _1332 + _1336;
    float _1340 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1342 = _1334 + _1340;
    float _1344 = _1338 * _1338;
    float _1346 = fma(_1342, _1342, _1344);
    float _1348 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1350 = sqrt(_1346);
    float _1352 = fma(_1316, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1348);
    float _1354 = fma(_1320, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1352);
    float _1356 = _924 + _1354;
    bool _1358 = _1350 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1360 = _1352;
    float _1362 = _924;
    float _1364 = _1334;
    float _1366 = _958;
    float _1368 = _908;
    float _1370 = _996;
    if (!_1358)
    {
        _1360 = _1332;
    }
    float _1372 = _1360;
    float _1374 = _1372;
    if (!_1358)
    {
        _1362 = _1356;
    }
    float _1376 = _1362;
    bool _1378 = !_1358;
    float _1380 = _1376;
    if (!_1378)
    {
        float _1382 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1384 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1386 = _1350 + _1384;
        float _1388 = rsqrt(_1346);
        float _1390 = _1386 * _1382;
        float _1392 = _1356 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1394 = _1390 * 0.15915493667125701904296875;
        float _1396 = _1394 * 6.283185482025146484375;
        float _1398 = cos(_1396);
        float _1400 = _1394 * 6.283185482025146484375;
        float _1402 = sin(_1400);
        float _1404 = _1398 + (-1.0);
        float _1406 = fma(_1402, _1392, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1408 = _1404 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1410 = _1388 * _1406;
        float _1412 = fma(_1356, _1398, _1408);
        float _1414 = fma(_1342, _1410, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1416 = fma(_1338, _1410, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1380 = _1412;
        _1364 = _1414;
        _1374 = _1416;
        _1366 = _1394;
        _1368 = _1406;
    }
    float _1418 = _1380;
    float _1420 = _1364;
    float _1422 = _1374;
    float _1424 = _1366;
    float _1426 = _1368;
    float _1428 = -_1098;
    float _1430 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1418);
    float _1432 = -_1108;
    float _1434 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1420);
    float _1436 = -_1118;
    float _1438 = fma(_1436, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1422);
    float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1442 = _1430 + _1440;
    float _1444 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1446 = _1434 + _1444;
    float _1448 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1450 = _1438 + _1448;
    float _1452 = _1442 * _1442;
    float _1454 = fma(_1446, _1446, _1452);
    float _1456 = fma(_1450, _1450, _1454);
    float _1458 = rsqrt(_1456);
    float _1460 = sqrt(_1456);
    float _1462 = _1458 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1464 = _1446 * _1462;
    float _1466 = _1450 * _1462;
    float _1468 = _1464 * _1464;
    float _1470 = _1466 * _1466;
    float _1472 = _1468 + _1470;
    float _1474 = sqrt(_1472);
    bool _1476 = _1474 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1478 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1480 = _1474 + _1478;
    float _1482 = _1450;
    float _1484 = _1426;
    float _1486 = _1480;
    float _1488 = _1424;
    float _1490 = _1442;
    if (_1476)
    {
        float _1492 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1482 = _1492;
    }
    float _1494 = _1482;
    if (_1476)
    {
        float _1496 = rsqrt(_1472);
        _1484 = _1496;
    }
    float _1498 = _1484;
    float _1500 = _1498;
    if (_1476)
    {
        float _1502 = _1480 * _1494;
        _1486 = _1502;
    }
    float _1504 = _1486;
    if (_1476)
    {
        float _1506 = _1504 * 0.15915493667125701904296875;
        _1488 = _1506;
    }
    float _1508 = _1488;
    float _1510 = _1452;
    if (_1476)
    {
        float _1512 = _1508 * 6.283185482025146484375;
        float _1514 = sin(_1512);
        _1510 = _1514;
    }
    float _1516 = _1510;
    float _1518 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1520 = precise::max(0.0, _1518);
    float _1522 = _1458;
    float _1524 = _1520;
    float _1526 = _1518;
    if (_1476)
    {
        float _1528 = _1508 * 6.283185482025146484375;
        float _1530 = cos(_1528);
        _1522 = _1530;
    }
    float _1532 = _1522;
    float _1534 = -_1462;
    float _1536 = -_1520;
    float _1538 = fma(_1442, _1534, _1536);
    if (!_1476)
    {
        _1524 = _1464;
    }
    float _1540 = _1524;
    float _1542 = _1540;
    if (_1476)
    {
        float _1544 = _1538 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1526 = _1544;
    }
    float _1546 = _1526;
    float _1548 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1550 = _1546;
    float _1552 = _1516;
    if (_1476)
    {
        float _1554 = fma(_1516, _1546, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1550 = _1554;
    }
    float _1556 = _1550;
    float _1558 = _1556;
    if (!_1476)
    {
        _1552 = _1468;
    }
    float _1560 = _1552;
    float _1562 = _1560;
    float _1564 = _1532;
    if (_1476)
    {
        float _1566 = _1532 + (-1.0);
        _1490 = _1566;
    }
    float _1568 = _1490;
    float _1570 = _1568;
    if (_1476)
    {
        float _1572 = _1498 * _1556;
        _1370 = _1572;
    }
    float _1574 = _1370;
    if (!_1476)
    {
        _1558 = _1538;
    }
    float _1576 = _1558;
    float _1578 = _1576;
    if (_1476)
    {
        float _1580 = _1568 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1500 = _1580;
    }
    float _1582 = _1500;
    if (_1476)
    {
        float _1584 = _1464 * _1574;
        _1542 = _1584;
    }
    float _1586 = _1542;
    if (!_1476)
    {
        _1570 = _1466;
    }
    float _1588 = _1570;
    float _1590 = _1588;
    if (_1476)
    {
        float _1592 = _1466 * _1574;
        _1590 = _1592;
    }
    float _1594 = _1590;
    if (_1476)
    {
        float _1596 = fma(_1538, _1532, _1582);
        _1578 = _1596;
    }
    float _1598 = _1578;
    if (_1476)
    {
        float _1600 = _1586 * _1586;
        _1562 = _1600;
    }
    float _1602 = _1562;
    if (!_1476)
    {
        _1564 = _1470;
    }
    float _1604 = _1564;
    float _1606 = _1604;
    if (_1476)
    {
        float _1608 = _1594 * _1594;
        _1606 = _1608;
    }
    float _1610 = _1606;
    float _1612 = fma(_1598, _1598, _1602);
    float _1614 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1616 = _1612 + _1610;
    float _1618 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1548);
    float _1620 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1624 = fma(_1460, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1622);
    float _1626 = precise::clamp(_1624, 0.0, 1.0);
    float _1628 = rsqrt(_1616);
    float _1630 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1618);
    float _1632 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1634 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1620);
    float _1636 = -_1626;
    float _1638 = _1636 + 1.0;
    float _1640 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1642 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1632);
    float _1644 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1634);
    float _1646 = abs(_1638);
    float _1648 = log2(_1646);
    float _1650 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1640);
    float _1652 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1642);
    float _1654 = _1644 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1656 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1658 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1650);
    float _1660 = _1652 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1662 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1664 = _1628 * _1586;
    float _1666 = _1628 * _1598;
    float _1668 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1670 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1662);
    float _1672 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1674 = _1628 * _1594;
    float _1676 = _1658 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1678 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1670);
    float _1680 = -_1672;
    float _1682 = fma(_1666, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1680);
    float _1684 = _1648 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1686 = -_1668;
    float _1688 = fma(_1686, _1614, 1.0);
    float _1690 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1678);
    float _1692 = -_1674;
    float _1694 = fma(_1692, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1682);
    float _1696 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1698 = log2(_1688);
    float _1700 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1702 = fma(_1694, -0.5, 0.5);
    float _1704 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1696);
    float _1706 = fma(_1694, 0.5, 0.5);
    float _1708 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1700);
    float _1710 = exp2(_1684);
    float _1712 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1704);
    float _1714 = fma(_1706, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1716 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1708);
    float _1718 = _1666 + 1.0;
    float _1720 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1712);
    float _1722 = fma(_1706, _1714, -0.212114393711090087890625);
    float _1724 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1716);
    float _1726 = 1.0 / _1690;
    float _1728 = _1698 * 0.693147182464599609375;
    float _1730 = fma(_1706, _1722, 1.570728778839111328125);
    float _1732 = sqrt(_1702);
    float _1734 = -_1666;
    float _1736 = fma(_1710, _1718, _1734);
    float _1738 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1740 = fma(_1736, 0.5, 0.5);
    float _1742 = _1720 * _1726;
    float _1744 = _1724 * _1726;
    float _1746 = fma(_1742, 0.5, 0.5);
    float _1748 = fma(_1744, -0.5, 0.5);
    float _1750 = _1732 * 0.636619746685028076171875;
    float3 _4701 = float3(_1746, _1748, _1738);
    float _1752 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4701, float3(0.0), isnan(_4701)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4701, float3(0.0), isnan(_4701)), level(0.0)).x;
    float _1754 = -_1730;
    float _1756 = fma(_1750, _1754, 1.0);
    float3 _4717 = float3(_1746, _1748, _1738);
    float4 _1759 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4717, float3(0.0), isnan(_4717)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4717, float3(0.0), isnan(_4717)), level(0.0)).xyzw;
    float _1761 = _1759.x;
    float _1763 = _1759.y;
    float _1765 = _1759.z;
    float _1767 = _1759.w;
    float2 _4734 = float2(_1756, _1740);
    float3 _1771 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4734, float2(0.0), isnan(_4734)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4734, float2(0.0), isnan(_4734)), level(0.0)).xyz;
    float _1773 = _1771.x;
    float _1775 = _1771.y;
    float _1777 = _1771.z;
    float _1779 = in.m_59.x;
    float _1781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1783 = _1648 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1787 = _1785 != 0;
    float _1789 = in.m_49.w;
    int _1791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1793 = _1791 != 0;
    float _1795 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1797 = in.m_59.y;
    float _1799 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1801 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1795);
    out.m_45.x = 1.0;
    float _1803 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1801);
    float _1805 = _1744;
    float _1807 = _1797;
    if (_1787)
    {
        float _1809 = in.m_49.z;
        _1805 = _1809;
    }
    float _1811 = _1805;
    float _1813 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1815 = exp2(_1783);
    float _1817 = in.m_61.x;
    float _1819 = in.m_61.y;
    float _1821 = in.m_61.z;
    float _1823 = in.m_61.w;
    float _1825 = 0.0;
    float _1827 = _1779;
    if (_1787)
    {
        _1825 = _1779;
    }
    float _1829 = _1825;
    out.m_63.x = _1434;
    out.m_63.y = _1430;
    out.m_63.z = _1438;
    float _1831 = -_1815;
    float _1833 = _1831 + 1.0;
    bool _1835 = _1811 > 0.5;
    bool _1837 = _1835 && _1787;
    float _1839 = in.m_65.x;
    float _1841 = in.m_65.y;
    float _1843 = in.m_65.z;
    float _1845 = _1829;
    if (_1837)
    {
        float _1847 = -_1829;
        float _1849 = _1847 + 1.0;
        _1845 = _1849;
    }
    float _1851 = _1845;
    bool _1853 = _1789 > 0.5;
    float _1855 = -_1797;
    float _1857 = _1855 + 1.0;
    if (_1787)
    {
        _1827 = _1851;
    }
    float _1859 = _1827;
    if (_1793)
    {
        float _1861 = _1853 ? _1857 : _1797;
        _1807 = _1861;
    }
    float _1863 = _1807;
    float _1865 = _1799 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1867 = _1252 != _1116;
    bool _1869 = isnan(_1252);
    bool _1871 = _1867 || _1869;
    bool _1873 = isnan(_1116);
    bool _1875 = _1871 || _1873;
    float _1877 = fma(_1813, _1859, -0.5);
    float _1879 = -_1819;
    float _1881 = _1258 * _1879;
    float _1883 = fma(_1865, _1863, -0.5);
    float _1885 = _1222 * _1841;
    float _1887 = _1224 * _1841;
    float _1889 = _1212 * _1841;
    float _1891 = fma(_632, _1877, _636);
    float _1893 = fma(_1188, _1839, _1885);
    float _1895 = fma(_1218, _1839, _1887);
    float _1897 = fma(_1216, _1839, _1889);
    float _1899 = _1192 * _1819;
    float _1901 = fma(_1226, _1843, _1893);
    float _1903 = fma(_1230, _1843, _1895);
    float _1905 = -_994;
    bool _1907 = _1250 == _1905;
    bool _1909 = !_1875;
    bool _1911 = _1907 && _1909;
    float _1913 = fma(_1290, _1817, _1899);
    float _1915 = fma(_1202, _1817, _1881);
    float _1917 = fma(_1240, _1843, _1897);
    float _1919 = -_1018;
    bool _1921 = _1254 == _1919;
    bool _1923 = _1921 && _1911;
    float _1925 = fma(_1294, _1821, _1913);
    float _1927 = fma(_1196, _1821, _1915);
    float _1929 = -_642;
    float _1931 = fma(_612, _1883, _1929);
    float _1933 = _1903 * _1817;
    float _1935 = _1925 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1937 = _1925 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1939 = _1925 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1941 = _1204 * _1819;
    float _1943 = fma(_1927, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1935);
    float _1945 = fma(_1927, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1937);
    float _1947 = _1901 * _1821;
    float _1949 = fma(_1302, _1817, _1941);
    float _1951 = _1917 * _1819;
    float _1953 = -_1933;
    float _1955 = fma(_1901, _1819, _1953);
    float _1957 = -_1947;
    float _1959 = fma(_1917, _1817, _1957);
    float _1961 = fma(_1310, _1821, _1949);
    float _1963 = -_1951;
    float _1965 = fma(_1903, _1821, _1963);
    float _1967 = _1903;
    float _1969 = _1901;
    float _1971 = _1917;
    if (!_1923)
    {
        float _1973 = fma(_1262, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1903);
        _1967 = _1973;
    }
    float _1975 = _1967;
    float _1977 = _1959 * _1823;
    float _1979 = _1955 * _1823;
    float _1981 = _1965 * _1823;
    if (!_1923)
    {
        float _1983 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1901);
        _1969 = _1983;
    }
    float _1985 = _1969;
    float _1987 = _1192 * _1977;
    float _1989 = -_1977;
    float _1991 = _1258 * _1989;
    float _1993 = _1192 * _1975;
    float _1995 = _1204 * _1977;
    float _1997 = fma(_1290, _1981, _1987);
    float _1999 = -_1975;
    float _2001 = _1258 * _1999;
    float _2003 = _1204 * _1975;
    float _2005 = fma(_1202, _1981, _1991);
    float _2007 = fma(_1294, _1979, _1997);
    if (!_1923)
    {
        float _2009 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1917);
        _1971 = _2009;
    }
    float _2011 = _1971;
    float _2013 = fma(_1290, _1985, _1993);
    float _2015 = fma(_1927, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1939);
    float _2017 = fma(_1202, _1985, _2001);
    float _2019 = fma(_1302, _1985, _2003);
    float _2021 = fma(_1196, _1979, _2005);
    float _2023 = _2007 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2025 = _2007 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2027 = _2007 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2029 = fma(_1294, _2011, _2013);
    float _2031 = fma(_1196, _2011, _2017);
    float _2033 = fma(_1310, _2011, _2019);
    float _2035 = fma(_2021, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2023);
    float _2037 = fma(_2021, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2025);
    float _2039 = fma(_2021, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2027);
    float _2041 = _2029 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2043 = _2029 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2045 = _2029 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2047 = fma(_1961, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1943);
    float _2049 = fma(_2031, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2041);
    float _2051 = fma(_2031, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2043);
    float _2053 = fma(_2031, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2045);
    float _2055 = fma(_1961, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1945);
    float _2057 = fma(_1961, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2015);
    float _2059 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1803);
    float _2061 = _1891 + 0.5;
    float _2063 = fma(_1302, _1981, _1995);
    out.m_67.x = _2047;
    out.m_67.y = _2055;
    out.m_67.z = _2057;
    float _2065 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2067 = _2059 + _2065;
    float _2069 = fma(_1310, _1979, _2063);
    float _2071 = _1931 + 0.5;
    float _2073 = _1690 + _2067;
    float _2075 = fma(_2069, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2035);
    float _2077 = fma(_2033, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2049);
    float _2079 = fma(_2033, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2051);
    float _2081 = _2073 * 0.5;
    float _2083 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2085 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2087 = fma(_2069, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2037);
    float _2089 = fma(_2069, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2039);
    float _2091 = fma(_2033, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2053);
    float _2093 = -_2085;
    float _2095 = _2093 + 1.0;
    float _2097 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.w = _2083;
    out.m_71.z = _2061;
    out.m_71.w = _2071;
    out.m_73.x = _2075;
    out.m_73.y = _2087;
    out.m_73.z = _2089;
    out.m_75.x = _2077;
    out.m_75.y = _2079;
    out.m_75.z = _2091;
    out.gl_Position.x = _1720;
    out.gl_Position.y = _1724;
    out.gl_Position.z = _2067;
    out.gl_Position.w = _1690;
    out.m_77.z = _2081;
    out.m_77.w = _1690;
    out.m_79.w = _2097;
    float _2099 = _2085 * _1752;
    float _2101 = _1767 * _2099;
    float _2103 = _1767 * _2095;
    float _2105 = _1777 * _2099;
    float _2107 = fma(_1773, _2101, _1761);
    float _2109 = fma(_1775, _2101, _1763);
    float _2111 = fma(_1767, _2105, _1765);
    out.m_81.x = _2107;
    out.m_81.y = _2109;
    out.m_81.z = _2111;
    out.m_81.w = _2103;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_100);
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _106;
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2168 = as_type<float>(_116);
        out.gl_Position.z = _2168;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_47.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _136 = _134;
    if (_130)
    {
        float _138 = float(_100);
        _108 = _138;
    }
    float _140 = _108;
    bool _142 = _134 >= _140;
    bool _144 = !_130;
    bool _146 = _142 || _144;
    float _148 = _140;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _148;
    if (_146)
    {
        out.m_45.x = 0.0;
    }
    if (_146)
    {
        float _152 = _150 * 5.0;
        _118 = as_type<int>(_152);
    }
    int _154 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2238 = as_type<float>(_154);
        out.gl_Position.z = _2238;
    }
    if (_146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _156 = in.m_49.z;
    float _158 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _162 = _160 != 0;
    float _164 = in.m_49.x;
    float _166 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _168 = _166 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _170 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _172 = _170 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _174 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _176 = _174 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _178 = 1.0 / _172;
    float _180 = 0.0;
    float _182 = _158;
    if (!_162)
    {
        float _184 = in.m_49.y;
        _180 = _184;
    }
    float _186 = _180;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _188;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _194 = _192 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _198 = _196 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _200;
    float _204 = 1.0 / _176;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _208 = _206 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _212 = _210 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _214 = in.m_51.y;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _222 = _220 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _224 = 1.0 / _208;
    float _226 = _190 * _178;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _228;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _234 = _232 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _236 = 1.0 / _168;
    float _238 = _194 * _204;
    float _240 = _204;
    if (!_162)
    {
        _240 = _186;
    }
    float _242 = _240;
    float _244 = _156 * 2.0;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _248 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _252 = _248 || _250;
    bool _254 = isnan(1.0);
    bool _256 = _252 || _254;
    float _258 = 1.0 / _198;
    float _260 = _242;
    float _262 = _186;
    if (_162)
    {
        float _264 = in.m_49.x;
        float _266 = in.m_49.y;
        _260 = _264;
        _262 = _266;
    }
    float _268 = _260;
    float _270 = _262;
    float _272 = _164 * 2.0;
    float _274 = -_214;
    float _276 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0030000000260770320892333984375, _274);
    float _278 = _202 * _224;
    float _280 = _214 * 78.233001708984375;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _284 = 1.0 / _234;
    float _286 = _222 * _236;
    float _288 = 0.0;
    if (!_256)
    {
        float _290 = _158 * _158;
        float _292 = _290 * 0.5;
        _288 = _292;
    }
    float _294 = _288;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _300 = floor(_276);
    float _302 = _218 * _258;
    float _304 = _294;
    if (!_256)
    {
        float _306 = _294 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _304 = _306;
    }
    float _308 = _304;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _312 = 1.0 / _298;
    float _314 = _212 * _284;
    float _316 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[83].z, _310);
    float _318 = floor(_244);
    float _320 = _300 * 12.98980045318603515625;
    float _322 = -_300;
    float _324 = _276 + _322;
    float _326 = floor(_272);
    float _328 = _164 + _156;
    float _330 = _230 * _312;
    float _332 = _328 + (-1.0);
    float _334 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _336 = log2(_334);
    float _338 = _272;
    float _340 = _308;
    if (!_162)
    {
        float _342 = in.m_49.z;
        _338 = _342;
    }
    float _344 = _338;
    float _346 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _348 = _318 > 0.0;
    float _350 = _268 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _352 = _318 >= 0.0;
    bool _354 = isnan(_318);
    bool _356 = _352 || _354;
    bool _358 = isnan(0.0);
    bool _360 = _356 || _358;
    float _362 = precise::max(_324, 0.64999997615814208984375);
    float _364 = -_246;
    float _366 = fma(_350, 2.0, _364);
    bool _368 = _326 > 0.0;
    bool _370 = _326 >= 0.0;
    bool _372 = isnan(_326);
    bool _374 = _370 || _372;
    bool _376 = isnan(0.0);
    bool _378 = _374 || _376;
    float _380 = in.m_53.x;
    float _382 = in.m_53.y;
    float _384 = in.m_53.z;
    float _386 = precise::min(_362, 1.0);
    float _388 = _336 * _134;
    float _390 = fma(_164, _280, _320);
    float _392 = fma(_386, 2.8571426868438720703125, -1.8571426868438720703125);
    float _394 = exp2(_388);
    float _396 = _390 * 0.15915493667125701904296875;
    float _398 = fma(_156, _280, _320);
    float _400 = _350;
    float _402 = _344;
    if (!_162)
    {
        _400 = _344;
    }
    float _404 = _400;
    float _406 = _398 * 0.15915493667125701904296875;
    float _408 = _404;
    if (_162)
    {
        _402 = _270;
    }
    float _410 = _402;
    float _412 = _396 * 6.283185482025146484375;
    float _414 = sin(_412);
    int _416 = _378 ? 0 : 1;
    float _418 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[83].w, _282);
    int _420 = _360 ? 0 : 1;
    int _422 = ~_416;
    int _424 = _422 + 1;
    int _426 = _424 + 1;
    float _428 = _406 * 6.283185482025146484375;
    float _430 = sin(_428);
    float _432 = -_214;
    float _434 = _432 + _382;
    float _436 = _270 * _214;
    int _438 = ~_420;
    int _440 = _438 + 1;
    int _442 = _440 + 1;
    int _444 = _442;
    int _446 = _426;
    float _448 = _418;
    if (!_348)
    {
        int _450 = ~_420;
        int _452 = _450 + 1;
        _444 = _452;
    }
    int _454 = _444;
    float _456 = fma(_436, 78.233001708984375, _320);
    if (!_368)
    {
        int _458 = ~_416;
        int _460 = _458 + 1;
        _446 = _460;
    }
    int _462 = _446;
    bool _464 = !_256;
    if (!_464)
    {
        float _466 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _468 = log2(_466);
        float _470 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _472 = _470 + 1.0;
        float _474 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _476 = _158 * _468;
        float _478 = 1.0 / _472;
        float _480 = _474 * 0.693147182464599609375;
        float _482 = exp2(_476);
        float _484 = 1.0 / _480;
        float _486 = _482 + (-1.0);
        float _488 = -_486;
        float _490 = fma(_488, _484, _158);
        float _492 = _490 * _478;
        float _494 = _492 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _340 = _494;
    }
    float _496 = _340;
    bool _498 = !_256;
    if (!_498)
    {
        float _500 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _502 = log2(_500);
        float _504 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _506 = _504 + 1.0;
        float _508 = 1.0 / _506;
        float _510 = _158 * _502;
        float _512 = exp2(_510);
        float _514 = -_512;
        float _516 = _514 + 1.0;
        float _518 = _516 * _508;
        _182 = _518;
    }
    float _520 = _182;
    float _522 = in.m_47.x;
    float _524 = in.m_47.y;
    float _526 = in.m_47.z;
    float _528 = _270 + _156;
    float _530 = _270 * 2.0;
    float _532 = _270 + _164;
    if (_162)
    {
        _408 = _270;
    }
    float _534 = _408;
    float _536 = _528 + (-1.0);
    float _538 = floor(_530);
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _542 = _534 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _544 = _532 + (-1.0);
    float _546 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _550 = 1.0 + _548;
    float _552 = _430 * 43758.546875;
    float _554 = _496 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _556 = _496 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _558 = _414 * 43758.546875;
    float _560 = fma(_542, -2.0, _540);
    float _562 = 1.0 / _550;
    float _564 = in.m_55.w;
    float _566 = -_394;
    float _568 = _566 + 1.0;
    bool _570 = _538 > 0.0;
    float _572 = in.m_42.x;
    float _574 = in.m_42.y;
    float _576 = in.m_42.z;
    bool _578 = _538 >= 0.0;
    bool _580 = isnan(_538);
    bool _582 = _578 || _580;
    bool _584 = isnan(0.0);
    bool _586 = _582 || _584;
    float _588 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _590 = floor(_552);
    float _592 = fma(_520, _522, _554);
    float _594 = fma(_520, _524, _556);
    float _596 = _456 * 0.15915493667125701904296875;
    bool _598 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _600 = _496 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _602 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _604 = isnan(1.0);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _610 = _606 || _608;
    float _612 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _418);
    float _614 = floor(_558);
    bool _616 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _618 = isnan(0.0);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _624 = _620 || _622;
    float _626 = fma(_520, _526, _600);
    int _628 = _586 ? 0 : 1;
    float _630 = _624 ? _568 : 0.0;
    float _632 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _316);
    float _634 = -_134;
    float _636 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[81].x, _366);
    float _638 = _596 * 6.283185482025146484375;
    float _640 = sin(_638);
    float _642 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _560);
    if (!_598)
    {
        _448 = _324;
    }
    float _644 = _448;
    float _646 = _644;
    if (_610)
    {
        float _648 = _630 * _562;
        _136 = _648;
    }
    float _650 = _136;
    float _652 = -_590;
    float _654 = _552 + _652;
    float _656 = fma(_592, _564, _572);
    float _658 = fma(_594, _564, _574);
    float _660 = fma(_626, _564, _576);
    float _662 = -_614;
    float _664 = _558 + _662;
    int _666 = ~_628;
    int _668 = _666 + 1;
    int _670 = _668 + 1;
    float _672 = _640 * 43758.546875;
    bool _674 = !_598;
    int _676 = _670;
    if (!_674)
    {
        float _678 = in.m_49.x;
        float _680 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _682 = _678 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _684 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[14].x, _324);
        float _686 = _684 * _680;
        float _688 = floor(_686);
        float _690 = -_688;
        float _692 = _686 + _690;
        _646 = _692;
    }
    float _694 = _646;
    if (!_570)
    {
        int _696 = ~_628;
        int _698 = _696 + 1;
        _676 = _698;
    }
    int _700 = _676;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _704 = _694 + _702;
    float _706 = floor(_672);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _710 = _694 + _708;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _714 = _694 + _712;
    float _716 = fma(_238, _704, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _720 = _694 + _718;
    float _722 = fma(_226, _710, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _726 = _694 + _724;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _730 = _694 + _728;
    float _732 = fma(_278, _720, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _734 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _736 = isnan(_694);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = fma(_302, _714, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _748 = fma(_286, _726, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _750 = fma(_314, _730, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _752 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _754 = isnan(_694);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = -_744;
    float _766 = _764 + 1.0;
    float _768 = -_706;
    float _770 = _672 + _768;
    bool _772 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _774 = isnan(_694);
    bool _776 = _772 || _774;
    bool _778 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _780 = _776 || _778;
    float _782 = float(_780);
    float _784 = _762 * _766;
    float _786 = -_762;
    float _788 = _786 + 1.0;
    float _790 = fma(_664, 2.0, -1.0);
    float _792 = fma(_654, 2.0, -1.0);
    float _794 = fma(_770, 2.0, -1.0);
    float _796 = -_782;
    float _798 = _796 + 1.0;
    float _800 = _658 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _802 = _658 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _806 = _804 != 0;
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _810 = _808 != 0;
    int _812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _814 = _812 != 0;
    float _816 = _658 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _818 = _744 * _798;
    float _820 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[4].x, _800);
    float _822 = _794 * _794;
    float _824 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[5].x, _802);
    float _826 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[6].x, _816);
    bool _828 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _830 = isnan(_694);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = fma(_790, _790, _822);
    bool _842 = !_806;
    int _844 = _842 ? 0 : 1;
    float _846 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[4].z, _820);
    bool _848 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _850 = isnan(_694);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = -_838;
    float _862 = _860 + 1.0;
    int _864 = abs(_844);
    float _866 = fma(_792, _792, _840);
    float _868 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[5].z, _824);
    float _870 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[6].z, _826);
    float _872 = _838 * _788;
    float _874 = _858 * _862;
    bool _876 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _878 = isnan(_694);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = -_858;
    float _890 = _888 + 1.0;
    float _892 = rsqrt(_866);
    float _894 = float(_454);
    float _896 = _392 * _392;
    float _898 = float(_864);
    float _900 = _886 * _890;
    float _902 = -_886;
    float _904 = _902 + 1.0;
    float _906 = float(_462);
    float _908 = _846 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _910 = _898 * _894;
    float _912 = _722 * _900;
    float _914 = in.m_57.x;
    float _916 = in.m_57.y;
    float _918 = in.m_57.z;
    bool _920 = !_810;
    int _922 = _920 ? 0 : 1;
    float _924 = _868 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _926 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[159].x, _912);
    float _928 = _910 * (-2.0);
    int _930 = abs(_922);
    float _932 = _792 * _892;
    float _934 = _790 * _892;
    float _936 = _794 * _892;
    float _938 = float(_930);
    float _940 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _942 = _924 + _940;
    bool _944 = !_814;
    int _946 = _944 ? 0 : 1;
    float _948 = fma(_716, _874, _926);
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _952 = _908 + _950;
    float _954 = _938 * _906;
    int _956 = abs(_946);
    float _958 = _870 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _960 = _942 * _942;
    float _962 = float(_700);
    float _964 = _936 * _936;
    float _966 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _968 = _958 + _966;
    float _970 = fma(_952, _952, _960);
    float _972 = _954 * (-2.0);
    float _974 = float(_956);
    float _976 = fma(_928, _914, _914);
    float _978 = fma(_968, _968, _970);
    float _980 = _164 + (-0.5);
    float _982 = fma(_588, _928, _588);
    float _984 = fma(_934, _934, _964);
    float _986 = fma(_746, _872, _948);
    float _988 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[196].x, _976);
    float _990 = fma(_972, _916, _916);
    float _992 = _270 + (-0.5);
    float _994 = in.m_51.x;
    float _996 = _974 * _962;
    float _998 = fma(_546, _972, _546);
    float _1000 = fma(_932, _932, _984);
    float _1002 = fma(_982, _650, _988);
    float _1004 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[196].y, _990);
    bool _1006 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1008 = isnan(_694);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1014 = _1010 || _1012;
    float _1016 = float(_1014);
    float _1018 = in.m_51.z;
    float _1020 = fma(_748, _784, _986);
    float _1022 = _996 * (-2.0);
    float _1024 = fma(_998, _650, _1004);
    float _1026 = in.m_55.x;
    float _1028 = in.m_55.y;
    float _1030 = in.m_55.z;
    bool _1032 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1034 = isnan(_694);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    float _1044 = rsqrt(_978);
    float _1046 = _1002 * 0.15915493667125701904296875;
    float _1048 = -_1016;
    float _1050 = _1048 + 1.0;
    float _1052 = fma(_1022, _918, _918);
    float _1054 = _156 + (-0.5);
    float _1056 = fma(_346, _1022, _346);
    float _1058 = _782 * _1050;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1062 = _694 + _1060;
    float _1064 = -_1042;
    float _1066 = _1064 + 1.0;
    float _1068 = fma(_732, _818, _1020);
    float _1070 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1052);
    float _1072 = fma(_330, _1062, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1074 = _1016 * _1066;
    float _1076 = fma(_750, _1058, _1068);
    float _1078 = fma(_1056, _650, _1070);
    float _1080 = _896 * 0.15915493667125701904296875;
    float _1082 = rsqrt(_1000);
    float _1084 = fma(_1072, _1074, _1076);
    float _1086 = _1024 * 0.15915493667125701904296875;
    float _1088 = _1078 * 0.15915493667125701904296875;
    float _1090 = -_994;
    float _1092 = _1090 + _380;
    float _1094 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1084);
    float _1096 = precise::clamp(_1094, 0.0, 1.0);
    float _1098 = _942 * _1044;
    float _1100 = -_1018;
    float _1102 = _1100 + _384;
    float _1104 = _1080 * 6.283185482025146484375;
    float _1106 = cos(_1104);
    float _1108 = _952 * _1044;
    float _1110 = -_1098;
    float _1112 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[18].w, _942);
    float _1114 = _1026 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1116 = _324 + _896;
    float _1118 = _968 * _1044;
    float _1120 = -_1108;
    float _1122 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[18].w, _952);
    float _1124 = _1112 * _1112;
    float _1126 = _1046 * 6.283185482025146484375;
    float _1128 = sin(_1126);
    float _1130 = -_1118;
    float _1132 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[18].w, _968);
    float _1134 = _934 * _1082;
    float _1136 = fma(_1122, _1122, _1124);
    float _1138 = _936 * _1082;
    float _1140 = _932 * _1082;
    float _1142 = _1096 * _1092;
    float _1144 = _1096 * _434;
    float _1146 = _1046 * 6.283185482025146484375;
    float _1148 = cos(_1146);
    float _1150 = _1096 * _1102;
    float _1152 = fma(_1132, _1132, _1136);
    float _1154 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1156 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1158 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1160 = _1154 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1162 = _1086 * 6.283185482025146484375;
    float _1164 = sin(_1162);
    float _1166 = _1086 * 6.283185482025146484375;
    float _1168 = cos(_1166);
    float _1170 = _1088 * 6.283185482025146484375;
    float _1172 = cos(_1170);
    float _1174 = -_1106;
    float _1176 = _1174 + 1.0;
    float _1178 = _1148 * _1164;
    float _1180 = _1134 * _1176;
    float _1182 = _1080 * 6.283185482025146484375;
    float _1184 = sin(_1182);
    float _1186 = _1148 * _1168;
    float _1188 = fma(_1134, _1180, _1106);
    float _1190 = _1128 * _1168;
    float _1192 = _1148 * _1172;
    float _1194 = _1128 * _1164;
    float _1196 = _1164 * _1172;
    float _1198 = _1138 * _1176;
    float _1200 = sqrt(_1152);
    float _1202 = _1168 * _1172;
    float _1204 = _1128 * _1172;
    float _1206 = _1134 * _1184;
    float _1208 = _1138 * _1184;
    float _1210 = _1140 * _1184;
    float _1212 = fma(_1140, _1198, _1206);
    float _1214 = -_1208;
    float _1216 = fma(_1140, _1180, _1214);
    float _1218 = fma(_1138, _1180, _1210);
    float _1220 = -_1210;
    float _1222 = fma(_1138, _1180, _1220);
    float _1224 = fma(_1138, _1198, _1106);
    float _1226 = fma(_1140, _1180, _1208);
    float _1228 = -_1206;
    float _1230 = fma(_1140, _1198, _1228);
    float _1232 = _1140 * _1140;
    float _1234 = _1144 * _1222;
    float _1236 = _1144 * _1224;
    float _1238 = _1144 * _1212;
    float _1240 = fma(_1176, _1232, _1106);
    float _1242 = fma(_1142, _1188, _1234);
    float _1244 = fma(_1142, _1218, _1236);
    float _1246 = fma(_1142, _1216, _1238);
    float _1248 = _1044 * _1200;
    float _1250 = fma(_1150, _1226, _1242);
    float _1252 = fma(_1150, _1230, _1244);
    float _1254 = fma(_1150, _1240, _1246);
    float _1256 = _1088 * 6.283185482025146484375;
    float _1258 = sin(_1256);
    float _1260 = -_1116;
    float _1262 = _1260 + _1252;
    float _1264 = _1250 + _994;
    float _1266 = _1248 * _1160;
    float _1268 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1262);
    float _1272 = _1248 * _1158;
    float _1274 = _1254 + _1018;
    float _1276 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1264);
    float _1278 = _1270 * _1266;
    float _1280 = _1248 * _1268;
    float _1282 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1274);
    float _1284 = _1276 * _1272;
    float _1286 = _1192 * _1278;
    float _1288 = _1282 * _1280;
    float _1290 = fma(_1258, _1186, _1194);
    float _1292 = -_1190;
    float _1294 = fma(_1258, _1178, _1292);
    float _1296 = -_1278;
    float _1298 = _1258 * _1296;
    float _1300 = -_1178;
    float _1302 = fma(_1258, _1190, _1300);
    float _1304 = fma(_1290, _1284, _1286);
    float _1306 = _1204 * _1278;
    float _1308 = fma(_1202, _1284, _1298);
    float _1310 = fma(_1258, _1194, _1186);
    float _1312 = fma(_1294, _1288, _1304);
    float _1314 = fma(_1302, _1284, _1306);
    float _1316 = fma(_1196, _1288, _1308);
    float _1318 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1320 = fma(_1310, _1288, _1314);
    float _1322 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1324 = fma(_1316, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1318);
    float _1326 = fma(_1316, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1322);
    float _1328 = fma(_1320, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1324);
    float _1330 = fma(_1320, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1326);
    float _1332 = _958 + _1328;
    float _1334 = _908 + _1330;
    float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1338 = _1332 + _1336;
    float _1340 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1342 = _1334 + _1340;
    float _1344 = _1338 * _1338;
    float _1346 = fma(_1342, _1342, _1344);
    float _1348 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1350 = sqrt(_1346);
    float _1352 = fma(_1316, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1348);
    float _1354 = fma(_1320, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1352);
    float _1356 = _924 + _1354;
    bool _1358 = _1350 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1360 = _1352;
    float _1362 = _924;
    float _1364 = _1334;
    float _1366 = _958;
    float _1368 = _908;
    float _1370 = _996;
    if (!_1358)
    {
        _1360 = _1332;
    }
    float _1372 = _1360;
    float _1374 = _1372;
    if (!_1358)
    {
        _1362 = _1356;
    }
    float _1376 = _1362;
    bool _1378 = !_1358;
    float _1380 = _1376;
    if (!_1378)
    {
        float _1382 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1384 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1386 = _1350 + _1384;
        float _1388 = rsqrt(_1346);
        float _1390 = _1386 * _1382;
        float _1392 = _1356 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1394 = _1390 * 0.15915493667125701904296875;
        float _1396 = _1394 * 6.283185482025146484375;
        float _1398 = cos(_1396);
        float _1400 = _1394 * 6.283185482025146484375;
        float _1402 = sin(_1400);
        float _1404 = _1398 + (-1.0);
        float _1406 = fma(_1402, _1392, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1408 = _1404 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1410 = _1388 * _1406;
        float _1412 = fma(_1356, _1398, _1408);
        float _1414 = fma(_1342, _1410, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1416 = fma(_1338, _1410, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1380 = _1412;
        _1364 = _1414;
        _1374 = _1416;
        _1366 = _1394;
        _1368 = _1406;
    }
    float _1418 = _1380;
    float _1420 = _1364;
    float _1422 = _1374;
    float _1424 = _1366;
    float _1426 = _1368;
    float _1428 = -_1098;
    float _1430 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1418);
    float _1432 = -_1108;
    float _1434 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1420);
    float _1436 = -_1118;
    float _1438 = fma(_1436, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1422);
    float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1442 = _1430 + _1440;
    float _1444 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1446 = _1434 + _1444;
    float _1448 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1450 = _1438 + _1448;
    float _1452 = _1442 * _1442;
    float _1454 = fma(_1446, _1446, _1452);
    float _1456 = fma(_1450, _1450, _1454);
    float _1458 = rsqrt(_1456);
    float _1460 = sqrt(_1456);
    float _1462 = _1458 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1464 = _1446 * _1462;
    float _1466 = _1450 * _1462;
    float _1468 = _1464 * _1464;
    float _1470 = _1466 * _1466;
    float _1472 = _1468 + _1470;
    float _1474 = sqrt(_1472);
    bool _1476 = _1474 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1478 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1480 = _1474 + _1478;
    float _1482 = _1450;
    float _1484 = _1426;
    float _1486 = _1480;
    float _1488 = _1424;
    float _1490 = _1442;
    if (_1476)
    {
        float _1492 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1482 = _1492;
    }
    float _1494 = _1482;
    if (_1476)
    {
        float _1496 = rsqrt(_1472);
        _1484 = _1496;
    }
    float _1498 = _1484;
    float _1500 = _1498;
    if (_1476)
    {
        float _1502 = _1480 * _1494;
        _1486 = _1502;
    }
    float _1504 = _1486;
    if (_1476)
    {
        float _1506 = _1504 * 0.15915493667125701904296875;
        _1488 = _1506;
    }
    float _1508 = _1488;
    float _1510 = _1452;
    if (_1476)
    {
        float _1512 = _1508 * 6.283185482025146484375;
        float _1514 = sin(_1512);
        _1510 = _1514;
    }
    float _1516 = _1510;
    float _1518 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1520 = precise::max(0.0, _1518);
    float _1522 = _1458;
    float _1524 = _1520;
    float _1526 = _1518;
    if (_1476)
    {
        float _1528 = _1508 * 6.283185482025146484375;
        float _1530 = cos(_1528);
        _1522 = _1530;
    }
    float _1532 = _1522;
    float _1534 = -_1462;
    float _1536 = -_1520;
    float _1538 = fma(_1442, _1534, _1536);
    if (!_1476)
    {
        _1524 = _1464;
    }
    float _1540 = _1524;
    float _1542 = _1540;
    if (_1476)
    {
        float _1544 = _1538 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1526 = _1544;
    }
    float _1546 = _1526;
    float _1548 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1550 = _1546;
    float _1552 = _1516;
    if (_1476)
    {
        float _1554 = fma(_1516, _1546, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1550 = _1554;
    }
    float _1556 = _1550;
    float _1558 = _1556;
    if (!_1476)
    {
        _1552 = _1468;
    }
    float _1560 = _1552;
    float _1562 = _1560;
    float _1564 = _1532;
    if (_1476)
    {
        float _1566 = _1532 + (-1.0);
        _1490 = _1566;
    }
    float _1568 = _1490;
    float _1570 = _1568;
    if (_1476)
    {
        float _1572 = _1498 * _1556;
        _1370 = _1572;
    }
    float _1574 = _1370;
    if (!_1476)
    {
        _1558 = _1538;
    }
    float _1576 = _1558;
    float _1578 = _1576;
    if (_1476)
    {
        float _1580 = _1568 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1500 = _1580;
    }
    float _1582 = _1500;
    if (_1476)
    {
        float _1584 = _1464 * _1574;
        _1542 = _1584;
    }
    float _1586 = _1542;
    if (!_1476)
    {
        _1570 = _1466;
    }
    float _1588 = _1570;
    float _1590 = _1588;
    if (_1476)
    {
        float _1592 = _1466 * _1574;
        _1590 = _1592;
    }
    float _1594 = _1590;
    if (_1476)
    {
        float _1596 = fma(_1538, _1532, _1582);
        _1578 = _1596;
    }
    float _1598 = _1578;
    if (_1476)
    {
        float _1600 = _1586 * _1586;
        _1562 = _1600;
    }
    float _1602 = _1562;
    if (!_1476)
    {
        _1564 = _1470;
    }
    float _1604 = _1564;
    float _1606 = _1604;
    if (_1476)
    {
        float _1608 = _1594 * _1594;
        _1606 = _1608;
    }
    float _1610 = _1606;
    float _1612 = fma(_1598, _1598, _1602);
    float _1614 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1616 = _1612 + _1610;
    float _1618 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1548);
    float _1620 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1624 = fma(_1460, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1622);
    float _1626 = precise::clamp(_1624, 0.0, 1.0);
    float _1628 = rsqrt(_1616);
    float _1630 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1618);
    float _1632 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1634 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1620);
    float _1636 = -_1626;
    float _1638 = _1636 + 1.0;
    float _1640 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1642 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1632);
    float _1644 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1634);
    float _1646 = abs(_1638);
    float _1648 = log2(_1646);
    float _1650 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1640);
    float _1652 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1642);
    float _1654 = _1644 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1656 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1658 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1650);
    float _1660 = _1652 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1662 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1664 = _1628 * _1586;
    float _1666 = _1628 * _1598;
    float _1668 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1670 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1662);
    float _1672 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1674 = _1628 * _1594;
    float _1676 = _1658 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1678 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1670);
    float _1680 = -_1672;
    float _1682 = fma(_1666, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1680);
    float _1684 = _1648 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1686 = -_1668;
    float _1688 = fma(_1686, _1614, 1.0);
    float _1690 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1678);
    float _1692 = -_1674;
    float _1694 = fma(_1692, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1682);
    float _1696 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1698 = log2(_1688);
    float _1700 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1702 = fma(_1694, -0.5, 0.5);
    float _1704 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1696);
    float _1706 = fma(_1694, 0.5, 0.5);
    float _1708 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1700);
    float _1710 = exp2(_1684);
    float _1712 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1704);
    float _1714 = fma(_1706, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1716 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1708);
    float _1718 = _1666 + 1.0;
    float _1720 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1712);
    float _1722 = fma(_1706, _1714, -0.212114393711090087890625);
    float _1724 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1716);
    float _1726 = 1.0 / _1690;
    float _1728 = _1698 * 0.693147182464599609375;
    float _1730 = fma(_1706, _1722, 1.570728778839111328125);
    float _1732 = sqrt(_1702);
    float _1734 = -_1666;
    float _1736 = fma(_1710, _1718, _1734);
    float _1738 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1740 = fma(_1736, 0.5, 0.5);
    float _1742 = _1720 * _1726;
    float _1744 = _1724 * _1726;
    float _1746 = fma(_1742, 0.5, 0.5);
    float _1748 = fma(_1744, -0.5, 0.5);
    float _1750 = _1732 * 0.636619746685028076171875;
    float3 _4701 = float3(_1746, _1748, _1738);
    float _1752 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4701, float3(0.0), isnan(_4701)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4701, float3(0.0), isnan(_4701)), level(0.0)).x;
    float _1754 = -_1730;
    float _1756 = fma(_1750, _1754, 1.0);
    float3 _4717 = float3(_1746, _1748, _1738);
    float4 _1759 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4717, float3(0.0), isnan(_4717)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4717, float3(0.0), isnan(_4717)), level(0.0)).xyzw;
    float _1761 = _1759.x;
    float _1763 = _1759.y;
    float _1765 = _1759.z;
    float _1767 = _1759.w;
    float2 _4734 = float2(_1756, _1740);
    float3 _1771 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4734, float2(0.0), isnan(_4734)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4734, float2(0.0), isnan(_4734)), level(0.0)).xyz;
    float _1773 = _1771.x;
    float _1775 = _1771.y;
    float _1777 = _1771.z;
    float _1779 = in.m_59.x;
    float _1781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1783 = _1648 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1787 = _1785 != 0;
    float _1789 = in.m_49.w;
    int _1791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1793 = _1791 != 0;
    float _1795 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1797 = in.m_59.y;
    float _1799 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1801 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1795);
    out.m_45.x = 1.0;
    float _1803 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1801);
    float _1805 = _1744;
    float _1807 = _1797;
    if (_1787)
    {
        float _1809 = in.m_49.z;
        _1805 = _1809;
    }
    float _1811 = _1805;
    float _1813 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1815 = exp2(_1783);
    float _1817 = in.m_61.x;
    float _1819 = in.m_61.y;
    float _1821 = in.m_61.z;
    float _1823 = in.m_61.w;
    float _1825 = 0.0;
    float _1827 = _1779;
    if (_1787)
    {
        _1825 = _1779;
    }
    float _1829 = _1825;
    out.m_63.x = _1434;
    out.m_63.y = _1430;
    out.m_63.z = _1438;
    float _1831 = -_1815;
    float _1833 = _1831 + 1.0;
    bool _1835 = _1811 > 0.5;
    bool _1837 = _1835 && _1787;
    float _1839 = in.m_65.x;
    float _1841 = in.m_65.y;
    float _1843 = in.m_65.z;
    float _1845 = _1829;
    if (_1837)
    {
        float _1847 = -_1829;
        float _1849 = _1847 + 1.0;
        _1845 = _1849;
    }
    float _1851 = _1845;
    bool _1853 = _1789 > 0.5;
    float _1855 = -_1797;
    float _1857 = _1855 + 1.0;
    if (_1787)
    {
        _1827 = _1851;
    }
    float _1859 = _1827;
    if (_1793)
    {
        float _1861 = _1853 ? _1857 : _1797;
        _1807 = _1861;
    }
    float _1863 = _1807;
    float _1865 = _1799 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1867 = _1252 != _1116;
    bool _1869 = isnan(_1252);
    bool _1871 = _1867 || _1869;
    bool _1873 = isnan(_1116);
    bool _1875 = _1871 || _1873;
    float _1877 = fma(_1813, _1859, -0.5);
    float _1879 = -_1819;
    float _1881 = _1258 * _1879;
    float _1883 = fma(_1865, _1863, -0.5);
    float _1885 = _1222 * _1841;
    float _1887 = _1224 * _1841;
    float _1889 = _1212 * _1841;
    float _1891 = fma(_632, _1877, _636);
    float _1893 = fma(_1188, _1839, _1885);
    float _1895 = fma(_1218, _1839, _1887);
    float _1897 = fma(_1216, _1839, _1889);
    float _1899 = _1192 * _1819;
    float _1901 = fma(_1226, _1843, _1893);
    float _1903 = fma(_1230, _1843, _1895);
    float _1905 = -_994;
    bool _1907 = _1250 == _1905;
    bool _1909 = !_1875;
    bool _1911 = _1907 && _1909;
    float _1913 = fma(_1290, _1817, _1899);
    float _1915 = fma(_1202, _1817, _1881);
    float _1917 = fma(_1240, _1843, _1897);
    float _1919 = -_1018;
    bool _1921 = _1254 == _1919;
    bool _1923 = _1921 && _1911;
    float _1925 = fma(_1294, _1821, _1913);
    float _1927 = fma(_1196, _1821, _1915);
    float _1929 = -_642;
    float _1931 = fma(_612, _1883, _1929);
    float _1933 = _1903 * _1817;
    float _1935 = _1925 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1937 = _1925 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1939 = _1925 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1941 = _1204 * _1819;
    float _1943 = fma(_1927, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1935);
    float _1945 = fma(_1927, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1937);
    float _1947 = _1901 * _1821;
    float _1949 = fma(_1302, _1817, _1941);
    float _1951 = _1917 * _1819;
    float _1953 = -_1933;
    float _1955 = fma(_1901, _1819, _1953);
    float _1957 = -_1947;
    float _1959 = fma(_1917, _1817, _1957);
    float _1961 = fma(_1310, _1821, _1949);
    float _1963 = -_1951;
    float _1965 = fma(_1903, _1821, _1963);
    float _1967 = _1903;
    float _1969 = _1901;
    float _1971 = _1917;
    if (!_1923)
    {
        float _1973 = fma(_1262, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1903);
        _1967 = _1973;
    }
    float _1975 = _1967;
    float _1977 = _1959 * _1823;
    float _1979 = _1955 * _1823;
    float _1981 = _1965 * _1823;
    if (!_1923)
    {
        float _1983 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1901);
        _1969 = _1983;
    }
    float _1985 = _1969;
    float _1987 = _1192 * _1977;
    float _1989 = -_1977;
    float _1991 = _1258 * _1989;
    float _1993 = _1192 * _1975;
    float _1995 = _1204 * _1977;
    float _1997 = fma(_1290, _1981, _1987);
    float _1999 = -_1975;
    float _2001 = _1258 * _1999;
    float _2003 = _1204 * _1975;
    float _2005 = fma(_1202, _1981, _1991);
    float _2007 = fma(_1294, _1979, _1997);
    if (!_1923)
    {
        float _2009 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1917);
        _1971 = _2009;
    }
    float _2011 = _1971;
    float _2013 = fma(_1290, _1985, _1993);
    float _2015 = fma(_1927, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1939);
    float _2017 = fma(_1202, _1985, _2001);
    float _2019 = fma(_1302, _1985, _2003);
    float _2021 = fma(_1196, _1979, _2005);
    float _2023 = _2007 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2025 = _2007 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2027 = _2007 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2029 = fma(_1294, _2011, _2013);
    float _2031 = fma(_1196, _2011, _2017);
    float _2033 = fma(_1310, _2011, _2019);
    float _2035 = fma(_2021, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2023);
    float _2037 = fma(_2021, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2025);
    float _2039 = fma(_2021, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2027);
    float _2041 = _2029 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2043 = _2029 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2045 = _2029 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2047 = fma(_1961, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1943);
    float _2049 = fma(_2031, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2041);
    float _2051 = fma(_2031, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2043);
    float _2053 = fma(_2031, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2045);
    float _2055 = fma(_1961, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1945);
    float _2057 = fma(_1961, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2015);
    float _2059 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1803);
    float _2061 = _1891 + 0.5;
    float _2063 = fma(_1302, _1981, _1995);
    out.m_67.x = _2047;
    out.m_67.y = _2055;
    out.m_67.z = _2057;
    float _2065 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2067 = _2059 + _2065;
    float _2069 = fma(_1310, _1979, _2063);
    float _2071 = _1931 + 0.5;
    float _2073 = _1690 + _2067;
    float _2075 = fma(_2069, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2035);
    float _2077 = fma(_2033, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2049);
    float _2079 = fma(_2033, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2051);
    float _2081 = _2073 * 0.5;
    float _2083 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2085 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2087 = fma(_2069, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2037);
    float _2089 = fma(_2069, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2039);
    float _2091 = fma(_2033, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2053);
    float _2093 = -_2085;
    float _2095 = _2093 + 1.0;
    float _2097 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.w = _2083;
    out.m_71.z = _2061;
    out.m_71.w = _2071;
    out.m_73.x = _2075;
    out.m_73.y = _2087;
    out.m_73.z = _2089;
    out.m_75.x = _2077;
    out.m_75.y = _2079;
    out.m_75.z = _2091;
    out.gl_Position.x = _1720;
    out.gl_Position.y = _1724;
    out.gl_Position.z = _2067;
    out.gl_Position.w = _1690;
    out.m_77.z = _2081;
    out.m_77.w = _1690;
    out.m_79.w = _2097;
    float _2099 = _2085 * _1752;
    float _2101 = _1767 * _2099;
    float _2103 = _1767 * _2095;
    float _2105 = _1777 * _2099;
    float _2107 = fma(_1773, _2101, _1761);
    float _2109 = fma(_1775, _2101, _1763);
    float _2111 = fma(_1767, _2105, _1765);
    out.m_81.x = _2107;
    out.m_81.y = _2109;
    out.m_81.z = _2111;
    out.m_81.w = _2103;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

