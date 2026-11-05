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
    float4 m_65 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_67 [[user(locn5)]];
    float4 m_59 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_57 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _378 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1700 = as_type<float>(_106);
        out.gl_Position.z = _1700;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    float _128 = _124;
    if (_120)
    {
        float _130 = float(_90);
        _126 = _130;
    }
    float _132 = _126;
    bool _134 = _124 >= _132;
    bool _136 = !_120;
    bool _138 = _134 || _136;
    if (_138)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _100;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1769 = as_type<float>(_144);
        out.gl_Position.z = _1769;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_49.x;
    float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _150 = _124 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _152 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = _150 * _148;
    float _166 = 0.0;
    if (!_162)
    {
        float _168 = _152 * _152;
        float _170 = _168 * 0.5;
        _166 = _170;
    }
    float _172 = _166;
    float _174 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[20].x, _164);
    float _176 = _172;
    if (!_162)
    {
        float _178 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    float _182 = in.m_47.x;
    float _184 = in.m_47.y;
    float _186 = in.m_47.z;
    float _188 = _174 * 6.283185482025146484375;
    float _190 = floor(_174);
    float _192 = _188 * 0.15915493667125701904296875;
    int _194 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _196 = _194 != 0;
    float _198 = _192 * 6.283185482025146484375;
    float _200 = cos(_198);
    float _202 = 1.4012984643248170709237295832899e-45;
    float _204 = _180;
    if (!_162)
    {
        _202 = _152;
    }
    float _206 = _202;
    float _208 = -_190;
    float _210 = _174 + _208;
    bool _212 = !_162;
    float _214 = _206;
    if (!_212)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = _152 * _218;
        float _228 = 1.0 / _222;
        float _230 = _224 * 0.693147182464599609375;
        float _232 = exp2(_226);
        float _234 = 1.0 / _230;
        float _236 = _232 + (-1.0);
        float _238 = -_236;
        float _240 = fma(_238, _234, _152);
        float _242 = _240 * _228;
        float _244 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _244;
    }
    float _246 = _204;
    bool _248 = !_162;
    if (!_248)
    {
        float _250 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = log2(_250);
        float _254 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _256 = _254 + 1.0;
        float _258 = 1.0 / _256;
        float _260 = _152 * _252;
        float _262 = exp2(_260);
        float _264 = -_262;
        float _266 = _264 + 1.0;
        float _268 = _266 * _258;
        _214 = _268;
    }
    float _270 = _214;
    float _272 = in.m_51.w;
    float _274 = in.m_42.x;
    float _276 = in.m_42.y;
    float _278 = in.m_42.z;
    int _280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _282 = _280 != 0;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _286 = _284 != 0;
    float _288 = fma(_200, 0.5, 0.5);
    bool _290 = _210 < 0.5;
    float _292 = float(_290);
    float _294 = -_210;
    float _296 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _298 = !_196;
    int _300 = _298 ? 0 : 1;
    float _302 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _304 = !_282;
    int _306 = _304 ? 0 : 1;
    float _308 = -_292;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _312 = -_288;
    float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _316 = abs(_300);
    int _318 = abs(_306);
    float _320 = fma(_270, _182, _302);
    bool _322 = !_286;
    int _324 = _322 ? 0 : 1;
    float _326 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _330 = fma(_270, _184, _326);
    int _332 = abs(_324);
    float _334 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _336 = float(_318);
    float _338 = float(_316);
    float _340 = fma(_270, _186, _334);
    float _342 = abs(_296);
    float _344 = _336 * _342;
    float _346 = fma(_320, _272, _274);
    float _348 = fma(_340, _272, _278);
    float _350 = float(_332);
    float _352 = fma(_338, _314, _344);
    float _354 = fma(_330, _272, _276);
    float _356 = abs(_310);
    float _358 = fma(_350, _356, _352);
    bool _360 = !_328;
    float _376;
    if (!_360)
    {
        float _362 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _364 = _146 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _366 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _368 = _366 * _362;
        float _370 = floor(_368);
        float _372 = -_370;
        float _374 = _368 + _372;
        _376 = _374;
        _378 = true;
    }
    else
    {
        float _380 = float(_90);
        float _382 = 1.0 / _380;
        float _384 = _124 * _382;
        _376 = _384;
    }
    _378 = false;
    float _386 = _376;
    float _388 = in.m_49.y;
    float _390 = _146 * 2.0;
    float _392 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _394 = in.m_49.z;
    float _396 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _398 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _400 = floor(_390);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _412 = _410 != 0;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _416 = _414 != 0;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _420 = _418 != 0;
    float _422 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[4].x, _392);
    float _424 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[5].x, _396);
    float _426 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[6].x, _398);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _430 = _386 + _428;
    float _432 = 1.0 / _408;
    float _434 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[4].z, _422);
    float _436 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[5].z, _424);
    float _438 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[6].z, _426);
    float _440 = _434 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _442 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _444 = log2(_442);
    bool _446 = _400 > 0.0;
    float _448 = _438 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _450 = _400 >= 0.0;
    bool _452 = isnan(_400);
    bool _454 = _450 || _452;
    bool _456 = isnan(0.0);
    bool _458 = _454 || _456;
    float _460 = _388 * 2.0;
    float _462 = _394 * 2.0;
    float _464 = _146 + _394;
    int _466 = _458 ? 0 : 1;
    float _468 = floor(_460);
    float _470 = _430 * _432;
    float _472 = _388 + _394;
    float _474 = _464 + (-1.0);
    float _476 = _394 + (-0.5);
    float _478 = _472 + (-1.0);
    float _480 = 1.0 / _404;
    int _482 = ~_466;
    int _484 = _482 + 1;
    int _486 = _484 + 1;
    float _488 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _490 = _444 * _124;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _492;
    int _496 = _486;
    if (!_446)
    {
        int _498 = ~_466;
        int _500 = _498 + 1;
        _496 = _500;
    }
    int _502 = _496;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _508 = _468 > 0.0;
    float _510 = floor(_462);
    bool _512 = _468 >= 0.0;
    bool _514 = isnan(_468);
    bool _516 = _512 || _514;
    bool _518 = isnan(0.0);
    bool _520 = _516 || _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _524 = _386 + _522;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _528 = 1.0 + _526;
    bool _530 = !_416;
    int _532 = _530 ? 0 : 1;
    bool _534 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _536 = isnan(0.0);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _542 = _538 || _540;
    float _544 = _524 * _480;
    float _546 = exp2(_490);
    float _548 = _146 + _388;
    float _550 = fma(_494, _544, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _552 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _554 = isnan(_386);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = _548 + (-1.0);
    float _566 = _388 + (-0.5);
    float _568 = _146 + (-0.5);
    bool _570 = _510 > 0.0;
    float _572 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _574 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _576 = _510 >= 0.0;
    bool _578 = isnan(_510);
    bool _580 = _576 || _578;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _590;
    bool _594 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _596 = isnan(_386);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = 1.0 / _528;
    float _608 = -_546;
    float _610 = _608 + 1.0;
    float _612 = fma(_588, _544, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _614 = fma(_592, _544, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _616 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _618 = isnan(_386);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -_604;
    float _630 = _628 + 1.0;
    float _632 = _542 ? _610 : 0.0;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _638 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _640 = isnan(1.0);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _646 = _642 || _644;
    float _648 = in.m_53.x;
    float _650 = in.m_53.y;
    float _652 = in.m_53.z;
    float _654 = _626 * _630;
    float _656 = -_626;
    float _658 = _656 + 1.0;
    int _660 = abs(_532);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _666 = fma(_636, _470, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _668 = _562 * _658;
    float _670 = fma(_506, _470, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _672 = fma(_664, _470, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _674 = float(_502);
    float _676 = _550 * _668;
    if (_646)
    {
        float _678 = _632 * _606;
        _128 = _678;
    }
    float _680 = _128;
    float _682 = float(_660);
    float _684 = _612 * _668;
    float _686 = _614 * _668;
    float _688 = -_562;
    float _690 = _688 + 1.0;
    int _692 = _584 ? 0 : 1;
    float _694 = _682 * _674;
    int _696 = _520 ? 0 : 1;
    float _698 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[143].x, _676);
    float _700 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[143].y, _684);
    float _702 = _694 * (-2.0);
    float _704 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[143].z, _686);
    int _706 = ~_692;
    int _708 = _706 + 1;
    int _710 = _708 + 1;
    float _712 = -_440;
    float _714 = _712 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _716 = fma(_702, _650, _650);
    float _718 = fma(_488, _702, _488);
    float _720 = _436 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _722 = !_412;
    int _724 = _722 ? 0 : 1;
    float _726 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[196].y, _716);
    int _728 = _710;
    if (!_570)
    {
        int _730 = ~_692;
        int _732 = _730 + 1;
        _728 = _732;
    }
    int _734 = _728;
    float _736 = -_720;
    float _738 = _736 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _740 = !_420;
    int _742 = _740 ? 0 : 1;
    float _744 = fma(_670, _654, _698);
    int _746 = abs(_724);
    float _748 = fma(_666, _654, _700);
    int _750 = abs(_742);
    float _752 = _738 * _738;
    float _754 = float(_746);
    float _756 = fma(_672, _654, _704);
    float _758 = float(_734);
    float _760 = fma(_714, _714, _752);
    int _762 = ~_696;
    int _764 = _762 + 1;
    int _766 = _764 + 1;
    float _768 = fma(_718, _680, _726);
    int _770 = _766;
    if (!_508)
    {
        int _772 = ~_696;
        int _774 = _772 + 1;
        _770 = _774;
    }
    int _776 = _770;
    float _778 = -_448;
    float _780 = _778 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _782 = _754 * _758;
    float _784 = float(_776);
    float _786 = fma(_780, _780, _760);
    float _788 = float(_750);
    float _790 = _782 * (-2.0);
    float _792 = _768 * 0.15915493667125701904296875;
    float _794 = rsqrt(_786);
    float _796 = in.m_51.x;
    float _798 = in.m_51.y;
    float _800 = in.m_51.z;
    float _802 = fma(_790, _648, _648);
    float _804 = _788 * _784;
    float _806 = fma(_572, _790, _572);
    float _808 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[145].x, _744);
    float _810 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[196].x, _802);
    float _812 = _804 * (-2.0);
    float _814 = in.m_55.x;
    float _816 = in.m_55.y;
    float _818 = in.m_55.z;
    float _820 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[145].z, _756);
    float _822 = fma(_806, _680, _810);
    float _824 = fma(_812, _652, _652);
    float _826 = fma(_574, _812, _574);
    float _828 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[145].y, _748);
    float _830 = _822 * 0.15915493667125701904296875;
    float _832 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[196].z, _824);
    float _834 = _714 * _794;
    float _836 = _780 * _794;
    float _838 = _738 * _794;
    float _840 = fma(_826, _680, _832);
    float _842 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _844 = _834 * _842;
    float _846 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _848 = _836 * _846;
    float _850 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _852 = _838 * _850;
    float _854 = _840 * 0.15915493667125701904296875;
    float _856 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _858 = -_844;
    float _860 = fma(_836, _856, _858);
    float _862 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _864 = -_848;
    float _866 = fma(_838, _862, _864);
    float _868 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _870 = -_852;
    float _872 = fma(_834, _868, _870);
    float _874 = _792 * 6.283185482025146484375;
    float _876 = sin(_874);
    float _878 = _860 * _860;
    float _880 = _808 * _796;
    float _882 = _828 * _798;
    float _884 = _820 * _800;
    float _886 = fma(_866, _866, _878);
    float _888 = _358 * _880;
    float _890 = _358 * _882;
    float _892 = _792 * 6.283185482025146484375;
    float _894 = cos(_892);
    float _896 = fma(_872, _872, _886);
    float _898 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _816);
    float _900 = _890 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _902 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _814);
    float _904 = _888 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _906 = _358 * _884;
    float _908 = _900 * _898;
    float _910 = _830 * 6.283185482025146484375;
    float _912 = sin(_910);
    float _914 = _904 * _902;
    float _916 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _818);
    float _918 = _906 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _920 = _918 * _916;
    float _922 = _830 * 6.283185482025146484375;
    float _924 = cos(_922);
    float _926 = _854 * 6.283185482025146484375;
    float _928 = cos(_926);
    float _930 = _912 * _876;
    float _932 = _912 * _894;
    float _934 = _854 * 6.283185482025146484375;
    float _936 = sin(_934);
    float _938 = _924 * _894;
    float _940 = _924 * _876;
    float _942 = rsqrt(_896);
    float _944 = _912 * _928;
    float _946 = _894 * _928;
    float _948 = _924 * _928;
    float _950 = _876 * _928;
    float _952 = fma(_936, _938, _930);
    float _954 = -_908;
    float _956 = _936 * _954;
    float _958 = fma(_936, _930, _938);
    float _960 = -_940;
    float _962 = fma(_936, _932, _960);
    float _964 = _948 * _908;
    float _966 = -_932;
    float _968 = fma(_936, _940, _966);
    float _970 = fma(_946, _914, _956);
    float _972 = _866 * _942;
    float _974 = _860 * _942;
    float _976 = fma(_952, _914, _964);
    float _978 = _944 * _908;
    float _980 = _838 * _972;
    float _982 = _872 * _942;
    float _984 = _836 * _974;
    float _986 = fma(_962, _914, _978);
    float _988 = -_980;
    float _990 = fma(_834, _974, _988);
    float _992 = fma(_968, _920, _976);
    float _994 = fma(_950, _920, _970);
    float _996 = -_984;
    float _998 = fma(_838, _982, _996);
    float _1000 = fma(_958, _920, _986);
    float _1002 = _990 * _992;
    float _1004 = _834 * _982;
    float _1006 = _998 * _992;
    float _1008 = fma(_982, _994, _1002);
    float _1010 = -_1004;
    float _1012 = fma(_836, _972, _1010);
    float _1014 = fma(_972, _994, _1006);
    float _1016 = fma(_836, _1000, _1008);
    float _1018 = fma(_834, _1000, _1014);
    float _1020 = _448 + _1016;
    float _1022 = _440 + _1018;
    float _1024 = _1012 * _992;
    float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1028 = _1020 + _1026;
    float _1030 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1032 = _1022 + _1030;
    float _1034 = fma(_974, _994, _1024);
    float _1036 = _1028 * _1028;
    float _1038 = fma(_838, _1000, _1034);
    float _1040 = fma(_1032, _1032, _1036);
    float _1042 = _720 + _1038;
    float _1044 = sqrt(_1040);
    bool _1046 = _1044 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1048 = _994;
    float _1050 = _1022;
    float _1052 = _1020;
    float _1054 = _1034;
    float _1056 = _1032;
    float _1058 = _820;
    if (!_1046)
    {
        _1048 = _1042;
    }
    float _1060 = _1048;
    bool _1062 = !_1046;
    float _1064 = _1060;
    if (!_1062)
    {
        float _1066 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1070 = _1044 + _1068;
        float _1072 = rsqrt(_1040);
        float _1074 = _1070 * _1066;
        float _1076 = _1042 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1078 = _1074 * 0.15915493667125701904296875;
        float _1080 = _1078 * 6.283185482025146484375;
        float _1082 = cos(_1080);
        float _1084 = _1078 * 6.283185482025146484375;
        float _1086 = sin(_1084);
        float _1088 = _1082 + (-1.0);
        float _1090 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1092 = fma(_1086, _1076, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1094 = fma(_1042, _1082, _1090);
        float _1096 = _1072 * _1092;
        float _1098 = fma(_1032, _1096, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1100 = fma(_1028, _1096, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1064 = _1094;
        _1050 = _1098;
        _1052 = _1100;
    }
    float _1102 = _1064;
    float _1104 = _1050;
    float _1106 = _1052;
    float _1108 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1110 = _1102 + _1108;
    float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1114 = _1104 + _1112;
    float _1116 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1118 = _1106 + _1116;
    float _1120 = _1110 * _1110;
    float _1122 = fma(_1114, _1114, _1120);
    float _1124 = fma(_1118, _1118, _1122);
    float _1126 = rsqrt(_1124);
    float _1128 = sqrt(_1124);
    float _1130 = _1126 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1132 = _1114 * _1130;
    float _1134 = _1118 * _1130;
    float _1136 = _1132 * _1132;
    float _1138 = _1134 * _1134;
    float _1140 = _1136 + _1138;
    float _1142 = sqrt(_1140);
    bool _1144 = _1142 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1148 = _1142 + _1146;
    float _1150 = _1122;
    float _1152 = _1148;
    float _1154 = _1130;
    if (_1144)
    {
        float _1156 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1150 = _1156;
    }
    float _1158 = _1150;
    if (_1144)
    {
        float _1160 = rsqrt(_1140);
        _1054 = _1160;
    }
    float _1162 = _1054;
    float _1164 = _1162;
    if (_1144)
    {
        float _1166 = _1148 * _1158;
        _1152 = _1166;
    }
    float _1168 = _1152;
    if (_1144)
    {
        float _1170 = _1168 * 0.15915493667125701904296875;
        _1056 = _1170;
    }
    float _1172 = _1056;
    float _1174 = _1158;
    float _1176 = _1172;
    if (_1144)
    {
        float _1178 = _1172 * 6.283185482025146484375;
        float _1180 = sin(_1178);
        _1174 = _1180;
    }
    float _1182 = _1174;
    float _1184 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1186 = precise::max(0.0, _1184);
    float _1188 = _1028;
    float _1190 = _1186;
    if (_1144)
    {
        float _1192 = _1172 * 6.283185482025146484375;
        float _1194 = cos(_1192);
        _1188 = _1194;
    }
    float _1196 = _1188;
    float _1198 = -_1130;
    float _1200 = -_1186;
    float _1202 = fma(_1110, _1198, _1200);
    if (_1144)
    {
        float _1204 = _1202 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1190 = _1204;
    }
    float _1206 = _1190;
    float _1208 = _1206;
    if (!_1144)
    {
        _1176 = _1136;
    }
    float _1210 = _1176;
    float _1212 = _1182;
    float _1214 = _1210;
    if (_1144)
    {
        float _1216 = fma(_1182, _1206, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1208 = _1216;
    }
    float _1218 = _1208;
    float _1220 = _1218;
    float _1222 = _1196;
    if (_1144)
    {
        float _1224 = _1196 + (-1.0);
        _1212 = _1224;
    }
    float _1226 = _1212;
    float _1228 = _1226;
    if (_1144)
    {
        float _1230 = _1162 * _1218;
        _1058 = _1230;
    }
    float _1232 = _1058;
    if (!_1144)
    {
        _1164 = _1132;
    }
    float _1234 = _1164;
    float _1236 = _1234;
    if (_1144)
    {
        float _1238 = _1226 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1154 = _1238;
    }
    float _1240 = _1154;
    if (_1144)
    {
        float _1242 = _1132 * _1232;
        _1236 = _1242;
    }
    float _1244 = _1236;
    if (!_1144)
    {
        _1220 = _1202;
    }
    float _1246 = _1220;
    float _1248 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1250 = fma(_1128, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1248);
    float _1252 = precise::clamp(_1250, 0.0, 1.0);
    float _1254 = _1246;
    if (!_1144)
    {
        _1228 = _1134;
    }
    float _1256 = _1228;
    float _1258 = _1256;
    if (_1144)
    {
        float _1260 = fma(_1202, _1196, _1240);
        _1254 = _1260;
    }
    float _1262 = _1254;
    if (_1144)
    {
        float _1264 = _1134 * _1232;
        _1258 = _1264;
    }
    float _1266 = _1258;
    if (_1144)
    {
        float _1268 = _1244 * _1244;
        _1214 = _1268;
    }
    float _1270 = _1214;
    if (!_1144)
    {
        _1222 = _1138;
    }
    float _1272 = _1222;
    float _1274 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1276 = _1272;
    if (_1144)
    {
        float _1278 = _1266 * _1266;
        _1276 = _1278;
    }
    float _1280 = _1276;
    float _1282 = fma(_1262, _1262, _1270);
    float _1284 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1286 = -_1252;
    float _1288 = _1286 + 1.0;
    float _1290 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1292 = _1282 + _1280;
    float _1294 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1284);
    float _1296 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1298 = abs(_1288);
    float _1300 = log2(_1298);
    float _1302 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1290);
    float _1304 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1294);
    float _1306 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1296);
    float _1308 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1302);
    float _1310 = _1304 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1312 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1306);
    float _1314 = rsqrt(_1292);
    float _1316 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1318 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1320 = _1312 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1322 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1316);
    float _1324 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1326 = _1310 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1328 = -_1326;
    float _1330 = fma(_1328, _1274, 1.0);
    float _1332 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1322);
    float _1334 = _1300 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1336 = _1314 * _1244;
    float _1338 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1324);
    float _1340 = _1314 * _1262;
    float _1342 = _1314 * _1266;
    float _1344 = _1336 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1346 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1348 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1338);
    float _1350 = exp2(_1334);
    float _1352 = -_1344;
    float _1354 = fma(_1340, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1352);
    float _1356 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1358 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1348);
    float _1360 = -_1342;
    float _1362 = fma(_1360, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1354);
    float _1364 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1366 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1356);
    float _1368 = log2(_1330);
    float _1370 = fma(_1362, -0.5, 0.5);
    float _1372 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1364);
    float _1374 = _1340 + 1.0;
    float _1376 = fma(_1362, 0.5, 0.5);
    float _1378 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1366);
    float _1380 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1372);
    float _1382 = 1.0 / _1358;
    float _1384 = -_1340;
    float _1386 = fma(_1350, _1374, _1384);
    float _1388 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1380);
    float _1390 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1378);
    float _1392 = fma(_1376, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1394 = sqrt(_1370);
    float _1396 = _1368 * 0.693147182464599609375;
    float _1398 = fma(_1376, _1392, -0.212114393711090087890625);
    float _1400 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1402 = fma(_1376, _1398, 1.570728778839111328125);
    float _1404 = fma(_1386, 0.5, 0.5);
    float _1406 = _1388 * _1382;
    float _1408 = _1390 * _1382;
    float _1410 = fma(_1406, 0.5, 0.5);
    float _1412 = fma(_1408, -0.5, 0.5);
    float _1414 = _1394 * 0.636619746685028076171875;
    float3 _3718 = float3(_1410, _1412, _1400);
    float _1416 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3718, float3(0.0), isnan(_3718)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3718, float3(0.0), isnan(_3718)), level(0.0)).x;
    float _1418 = -_1402;
    float _1420 = fma(_1414, _1418, 1.0);
    float3 _3734 = float3(_1410, _1412, _1400);
    float4 _1423 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3734, float3(0.0), isnan(_3734)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3734, float3(0.0), isnan(_3734)), level(0.0)).xyzw;
    float _1425 = _1423.x;
    float _1427 = _1423.y;
    float _1429 = _1423.z;
    float _1431 = _1423.w;
    float2 _3751 = float2(_1420, _1404);
    float3 _1435 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3751, float2(0.0), isnan(_3751)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3751, float2(0.0), isnan(_3751)), level(0.0)).xyz;
    float _1437 = _1435.x;
    float _1439 = _1435.y;
    float _1441 = _1435.z;
    float _1443 = in.m_57.x;
    float _1445 = in.m_57.y;
    float _1447 = in.m_57.z;
    bool _1449 = _816 != 0.0;
    bool _1451 = isnan(_816);
    bool _1453 = _1449 || _1451;
    bool _1455 = isnan(0.0);
    bool _1457 = _1453 || _1455;
    float _1459 = _948 * _1012;
    float _1461 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1463 = _358 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1465 = _814 == 0.0;
    bool _1467 = !_1457;
    bool _1469 = _1465 && _1467;
    float _1471 = -_936;
    float _1473 = fma(_1471, _974, _1459);
    float _1475 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1461);
    float _1477 = _948 * _990;
    bool _1479 = _818 == 0.0;
    bool _1481 = _1479 && _1469;
    float _1483 = _1463 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1485 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1475);
    float _1487 = -_936;
    float _1489 = fma(_1487, _982, _1477);
    out.m_59.x = _1104;
    out.m_59.y = _1102;
    out.m_59.z = _1106;
    float _1491 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1485);
    out.m_61.x = _1114;
    out.m_61.y = _1110;
    out.m_61.z = _1118;
    out.gl_Position.x = _1388;
    out.gl_Position.y = _1390;
    out.gl_Position.z = _1491;
    out.gl_Position.w = _1358;
    float _1493 = _1447;
    float _1495 = _1443;
    float _1497 = _1445;
    if (!_1481)
    {
        float _1499 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1447);
        _1493 = _1499;
    }
    float _1501 = _1493;
    float _1503 = _948 * _998;
    if (!_1481)
    {
        float _1505 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1443);
        _1495 = _1505;
    }
    float _1507 = _1495;
    float _1509 = _952 * _998;
    if (!_1481)
    {
        float _1511 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1445);
        _1497 = _1511;
    }
    float _1513 = _1497;
    float _1515 = -_936;
    float _1517 = fma(_1515, _972, _1503);
    float _1519 = _952 * _1012;
    float _1521 = fma(_946, _972, _1509);
    float _1523 = _952 * _990;
    float _1525 = fma(_944, _834, _1517);
    float _1527 = fma(_946, _974, _1519);
    float _1529 = fma(_962, _834, _1521);
    float _1531 = _1525 * _1513;
    float _1533 = _968 * _998;
    float _1535 = _968 * _1012;
    float _1537 = _968 * _990;
    float _1539 = fma(_1529, _1507, _1531);
    float _1541 = _1300 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1543 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1545 = fma(_944, _838, _1473);
    float _1547 = fma(_950, _972, _1533);
    float _1549 = fma(_950, _974, _1535);
    float _1551 = fma(_950, _982, _1537);
    float _1553 = exp2(_1541);
    float _1555 = fma(_946, _982, _1523);
    float _1557 = fma(_944, _836, _1489);
    float _1559 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1561 = fma(_962, _838, _1527);
    float _1563 = _1545 * _1513;
    float _1565 = _1358 * 0.5;
    float _1567 = fma(_962, _836, _1555);
    float _1569 = fma(_958, _838, _1549);
    float _1571 = fma(_1561, _1507, _1563);
    float _1573 = fma(_1390, -0.5, _1565);
    float _1575 = _1557 * _1513;
    float _1577 = fma(_958, _834, _1547);
    float _1579 = fma(_958, _836, _1551);
    float _1581 = fma(_1569, _1501, _1571);
    float _1583 = fma(_1567, _1507, _1575);
    float _1585 = -_1553;
    float _1587 = _1585 + 1.0;
    float _1589 = fma(_1577, _1501, _1539);
    float _1591 = _1587 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1593 = fma(_1579, _1501, _1583);
    float _1595 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1597 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1599 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1603 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1605 = _1491 + _1358;
    float _1607 = _1388 + _1358;
    float _1609 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1613 = _1595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1615 = _1597 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1617 = _1599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1619 = _1601 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1621 = _1603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1623 = _1605 * 0.5;
    float _1625 = _1607 * 0.5;
    out.m_63.x = _1613;
    out.m_63.y = _1615;
    out.m_63.z = _1617;
    out.m_63.w = _1609;
    out.m_65.x = _1559;
    out.m_65.y = _1619;
    out.m_65.z = _1621;
    out.m_65.w = _1611;
    out.m_67.x = _1589;
    out.m_67.y = _1581;
    out.m_67.z = _1593;
    out.m_69.x = _1625;
    out.m_69.y = _1573;
    out.m_69.z = _1623;
    out.m_69.w = _1358;
    out.m_45.x = _1483;
    float _1627 = _1591 * _1416;
    float _1629 = -_1591;
    float _1631 = _1629 + 1.0;
    float _1633 = _1431 * _1627;
    float _1635 = _1431 * _1631;
    float _1637 = _1441 * _1627;
    float _1639 = fma(_1437, _1633, _1425);
    float _1641 = fma(_1439, _1633, _1427);
    float _1643 = fma(_1431, _1637, _1429);
    out.m_71.x = _1639;
    out.m_71.y = _1641;
    out.m_71.z = _1643;
    out.m_71.w = _1635;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _378 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1700 = as_type<float>(_106);
        out.gl_Position.z = _1700;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    float _128 = _124;
    if (_120)
    {
        float _130 = float(_90);
        _126 = _130;
    }
    float _132 = _126;
    bool _134 = _124 >= _132;
    bool _136 = !_120;
    bool _138 = _134 || _136;
    if (_138)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _100;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1769 = as_type<float>(_144);
        out.gl_Position.z = _1769;
    }
    if (_138)
    {
        return out;
    }
    float _146 = in.m_49.x;
    float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _150 = _124 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _152 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = _150 * _148;
    float _166 = 0.0;
    if (!_162)
    {
        float _168 = _152 * _152;
        float _170 = _168 * 0.5;
        _166 = _170;
    }
    float _172 = _166;
    float _174 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[20].x, _164);
    float _176 = _172;
    if (!_162)
    {
        float _178 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    float _182 = in.m_47.x;
    float _184 = in.m_47.y;
    float _186 = in.m_47.z;
    float _188 = _174 * 6.283185482025146484375;
    float _190 = floor(_174);
    float _192 = _188 * 0.15915493667125701904296875;
    int _194 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _196 = _194 != 0;
    float _198 = _192 * 6.283185482025146484375;
    float _200 = cos(_198);
    float _202 = 1.4012984643248170709237295832899e-45;
    float _204 = _180;
    if (!_162)
    {
        _202 = _152;
    }
    float _206 = _202;
    float _208 = -_190;
    float _210 = _174 + _208;
    bool _212 = !_162;
    float _214 = _206;
    if (!_212)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = _152 * _218;
        float _228 = 1.0 / _222;
        float _230 = _224 * 0.693147182464599609375;
        float _232 = exp2(_226);
        float _234 = 1.0 / _230;
        float _236 = _232 + (-1.0);
        float _238 = -_236;
        float _240 = fma(_238, _234, _152);
        float _242 = _240 * _228;
        float _244 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _244;
    }
    float _246 = _204;
    bool _248 = !_162;
    if (!_248)
    {
        float _250 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = log2(_250);
        float _254 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _256 = _254 + 1.0;
        float _258 = 1.0 / _256;
        float _260 = _152 * _252;
        float _262 = exp2(_260);
        float _264 = -_262;
        float _266 = _264 + 1.0;
        float _268 = _266 * _258;
        _214 = _268;
    }
    float _270 = _214;
    float _272 = in.m_51.w;
    float _274 = in.m_42.x;
    float _276 = in.m_42.y;
    float _278 = in.m_42.z;
    int _280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _282 = _280 != 0;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _286 = _284 != 0;
    float _288 = fma(_200, 0.5, 0.5);
    bool _290 = _210 < 0.5;
    float _292 = float(_290);
    float _294 = -_210;
    float _296 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _298 = !_196;
    int _300 = _298 ? 0 : 1;
    float _302 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _304 = !_282;
    int _306 = _304 ? 0 : 1;
    float _308 = -_292;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _312 = -_288;
    float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _316 = abs(_300);
    int _318 = abs(_306);
    float _320 = fma(_270, _182, _302);
    bool _322 = !_286;
    int _324 = _322 ? 0 : 1;
    float _326 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _330 = fma(_270, _184, _326);
    int _332 = abs(_324);
    float _334 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _336 = float(_318);
    float _338 = float(_316);
    float _340 = fma(_270, _186, _334);
    float _342 = abs(_296);
    float _344 = _336 * _342;
    float _346 = fma(_320, _272, _274);
    float _348 = fma(_340, _272, _278);
    float _350 = float(_332);
    float _352 = fma(_338, _314, _344);
    float _354 = fma(_330, _272, _276);
    float _356 = abs(_310);
    float _358 = fma(_350, _356, _352);
    bool _360 = !_328;
    float _376;
    if (!_360)
    {
        float _362 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _364 = _146 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _366 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _368 = _366 * _362;
        float _370 = floor(_368);
        float _372 = -_370;
        float _374 = _368 + _372;
        _376 = _374;
        _378 = true;
    }
    else
    {
        float _380 = float(_90);
        float _382 = 1.0 / _380;
        float _384 = _124 * _382;
        _376 = _384;
    }
    _378 = false;
    float _386 = _376;
    float _388 = in.m_49.y;
    float _390 = _146 * 2.0;
    float _392 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _394 = in.m_49.z;
    float _396 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _398 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _400 = floor(_390);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _412 = _410 != 0;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _416 = _414 != 0;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _420 = _418 != 0;
    float _422 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[4].x, _392);
    float _424 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[5].x, _396);
    float _426 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[6].x, _398);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _430 = _386 + _428;
    float _432 = 1.0 / _408;
    float _434 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[4].z, _422);
    float _436 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[5].z, _424);
    float _438 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[6].z, _426);
    float _440 = _434 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _442 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _444 = log2(_442);
    bool _446 = _400 > 0.0;
    float _448 = _438 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _450 = _400 >= 0.0;
    bool _452 = isnan(_400);
    bool _454 = _450 || _452;
    bool _456 = isnan(0.0);
    bool _458 = _454 || _456;
    float _460 = _388 * 2.0;
    float _462 = _394 * 2.0;
    float _464 = _146 + _394;
    int _466 = _458 ? 0 : 1;
    float _468 = floor(_460);
    float _470 = _430 * _432;
    float _472 = _388 + _394;
    float _474 = _464 + (-1.0);
    float _476 = _394 + (-0.5);
    float _478 = _472 + (-1.0);
    float _480 = 1.0 / _404;
    int _482 = ~_466;
    int _484 = _482 + 1;
    int _486 = _484 + 1;
    float _488 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _490 = _444 * _124;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _492;
    int _496 = _486;
    if (!_446)
    {
        int _498 = ~_466;
        int _500 = _498 + 1;
        _496 = _500;
    }
    int _502 = _496;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _508 = _468 > 0.0;
    float _510 = floor(_462);
    bool _512 = _468 >= 0.0;
    bool _514 = isnan(_468);
    bool _516 = _512 || _514;
    bool _518 = isnan(0.0);
    bool _520 = _516 || _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _524 = _386 + _522;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _528 = 1.0 + _526;
    bool _530 = !_416;
    int _532 = _530 ? 0 : 1;
    bool _534 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _536 = isnan(0.0);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _542 = _538 || _540;
    float _544 = _524 * _480;
    float _546 = exp2(_490);
    float _548 = _146 + _388;
    float _550 = fma(_494, _544, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _552 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _554 = isnan(_386);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = _548 + (-1.0);
    float _566 = _388 + (-0.5);
    float _568 = _146 + (-0.5);
    bool _570 = _510 > 0.0;
    float _572 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _574 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _576 = _510 >= 0.0;
    bool _578 = isnan(_510);
    bool _580 = _576 || _578;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _590;
    bool _594 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _596 = isnan(_386);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = 1.0 / _528;
    float _608 = -_546;
    float _610 = _608 + 1.0;
    float _612 = fma(_588, _544, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _614 = fma(_592, _544, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _616 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _618 = isnan(_386);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -_604;
    float _630 = _628 + 1.0;
    float _632 = _542 ? _610 : 0.0;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _638 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _640 = isnan(1.0);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _646 = _642 || _644;
    float _648 = in.m_53.x;
    float _650 = in.m_53.y;
    float _652 = in.m_53.z;
    float _654 = _626 * _630;
    float _656 = -_626;
    float _658 = _656 + 1.0;
    int _660 = abs(_532);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _666 = fma(_636, _470, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _668 = _562 * _658;
    float _670 = fma(_506, _470, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _672 = fma(_664, _470, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _674 = float(_502);
    float _676 = _550 * _668;
    if (_646)
    {
        float _678 = _632 * _606;
        _128 = _678;
    }
    float _680 = _128;
    float _682 = float(_660);
    float _684 = _612 * _668;
    float _686 = _614 * _668;
    float _688 = -_562;
    float _690 = _688 + 1.0;
    int _692 = _584 ? 0 : 1;
    float _694 = _682 * _674;
    int _696 = _520 ? 0 : 1;
    float _698 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[143].x, _676);
    float _700 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[143].y, _684);
    float _702 = _694 * (-2.0);
    float _704 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[143].z, _686);
    int _706 = ~_692;
    int _708 = _706 + 1;
    int _710 = _708 + 1;
    float _712 = -_440;
    float _714 = _712 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _716 = fma(_702, _650, _650);
    float _718 = fma(_488, _702, _488);
    float _720 = _436 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _722 = !_412;
    int _724 = _722 ? 0 : 1;
    float _726 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[196].y, _716);
    int _728 = _710;
    if (!_570)
    {
        int _730 = ~_692;
        int _732 = _730 + 1;
        _728 = _732;
    }
    int _734 = _728;
    float _736 = -_720;
    float _738 = _736 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _740 = !_420;
    int _742 = _740 ? 0 : 1;
    float _744 = fma(_670, _654, _698);
    int _746 = abs(_724);
    float _748 = fma(_666, _654, _700);
    int _750 = abs(_742);
    float _752 = _738 * _738;
    float _754 = float(_746);
    float _756 = fma(_672, _654, _704);
    float _758 = float(_734);
    float _760 = fma(_714, _714, _752);
    int _762 = ~_696;
    int _764 = _762 + 1;
    int _766 = _764 + 1;
    float _768 = fma(_718, _680, _726);
    int _770 = _766;
    if (!_508)
    {
        int _772 = ~_696;
        int _774 = _772 + 1;
        _770 = _774;
    }
    int _776 = _770;
    float _778 = -_448;
    float _780 = _778 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _782 = _754 * _758;
    float _784 = float(_776);
    float _786 = fma(_780, _780, _760);
    float _788 = float(_750);
    float _790 = _782 * (-2.0);
    float _792 = _768 * 0.15915493667125701904296875;
    float _794 = rsqrt(_786);
    float _796 = in.m_51.x;
    float _798 = in.m_51.y;
    float _800 = in.m_51.z;
    float _802 = fma(_790, _648, _648);
    float _804 = _788 * _784;
    float _806 = fma(_572, _790, _572);
    float _808 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[145].x, _744);
    float _810 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[196].x, _802);
    float _812 = _804 * (-2.0);
    float _814 = in.m_55.x;
    float _816 = in.m_55.y;
    float _818 = in.m_55.z;
    float _820 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[145].z, _756);
    float _822 = fma(_806, _680, _810);
    float _824 = fma(_812, _652, _652);
    float _826 = fma(_574, _812, _574);
    float _828 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[145].y, _748);
    float _830 = _822 * 0.15915493667125701904296875;
    float _832 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[196].z, _824);
    float _834 = _714 * _794;
    float _836 = _780 * _794;
    float _838 = _738 * _794;
    float _840 = fma(_826, _680, _832);
    float _842 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _844 = _834 * _842;
    float _846 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _848 = _836 * _846;
    float _850 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _852 = _838 * _850;
    float _854 = _840 * 0.15915493667125701904296875;
    float _856 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _858 = -_844;
    float _860 = fma(_836, _856, _858);
    float _862 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _864 = -_848;
    float _866 = fma(_838, _862, _864);
    float _868 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _870 = -_852;
    float _872 = fma(_834, _868, _870);
    float _874 = _792 * 6.283185482025146484375;
    float _876 = sin(_874);
    float _878 = _860 * _860;
    float _880 = _808 * _796;
    float _882 = _828 * _798;
    float _884 = _820 * _800;
    float _886 = fma(_866, _866, _878);
    float _888 = _358 * _880;
    float _890 = _358 * _882;
    float _892 = _792 * 6.283185482025146484375;
    float _894 = cos(_892);
    float _896 = fma(_872, _872, _886);
    float _898 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _816);
    float _900 = _890 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _902 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _814);
    float _904 = _888 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _906 = _358 * _884;
    float _908 = _900 * _898;
    float _910 = _830 * 6.283185482025146484375;
    float _912 = sin(_910);
    float _914 = _904 * _902;
    float _916 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _818);
    float _918 = _906 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _920 = _918 * _916;
    float _922 = _830 * 6.283185482025146484375;
    float _924 = cos(_922);
    float _926 = _854 * 6.283185482025146484375;
    float _928 = cos(_926);
    float _930 = _912 * _876;
    float _932 = _912 * _894;
    float _934 = _854 * 6.283185482025146484375;
    float _936 = sin(_934);
    float _938 = _924 * _894;
    float _940 = _924 * _876;
    float _942 = rsqrt(_896);
    float _944 = _912 * _928;
    float _946 = _894 * _928;
    float _948 = _924 * _928;
    float _950 = _876 * _928;
    float _952 = fma(_936, _938, _930);
    float _954 = -_908;
    float _956 = _936 * _954;
    float _958 = fma(_936, _930, _938);
    float _960 = -_940;
    float _962 = fma(_936, _932, _960);
    float _964 = _948 * _908;
    float _966 = -_932;
    float _968 = fma(_936, _940, _966);
    float _970 = fma(_946, _914, _956);
    float _972 = _866 * _942;
    float _974 = _860 * _942;
    float _976 = fma(_952, _914, _964);
    float _978 = _944 * _908;
    float _980 = _838 * _972;
    float _982 = _872 * _942;
    float _984 = _836 * _974;
    float _986 = fma(_962, _914, _978);
    float _988 = -_980;
    float _990 = fma(_834, _974, _988);
    float _992 = fma(_968, _920, _976);
    float _994 = fma(_950, _920, _970);
    float _996 = -_984;
    float _998 = fma(_838, _982, _996);
    float _1000 = fma(_958, _920, _986);
    float _1002 = _990 * _992;
    float _1004 = _834 * _982;
    float _1006 = _998 * _992;
    float _1008 = fma(_982, _994, _1002);
    float _1010 = -_1004;
    float _1012 = fma(_836, _972, _1010);
    float _1014 = fma(_972, _994, _1006);
    float _1016 = fma(_836, _1000, _1008);
    float _1018 = fma(_834, _1000, _1014);
    float _1020 = _448 + _1016;
    float _1022 = _440 + _1018;
    float _1024 = _1012 * _992;
    float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1028 = _1020 + _1026;
    float _1030 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1032 = _1022 + _1030;
    float _1034 = fma(_974, _994, _1024);
    float _1036 = _1028 * _1028;
    float _1038 = fma(_838, _1000, _1034);
    float _1040 = fma(_1032, _1032, _1036);
    float _1042 = _720 + _1038;
    float _1044 = sqrt(_1040);
    bool _1046 = _1044 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1048 = _994;
    float _1050 = _1022;
    float _1052 = _1020;
    float _1054 = _1034;
    float _1056 = _1032;
    float _1058 = _820;
    if (!_1046)
    {
        _1048 = _1042;
    }
    float _1060 = _1048;
    bool _1062 = !_1046;
    float _1064 = _1060;
    if (!_1062)
    {
        float _1066 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1070 = _1044 + _1068;
        float _1072 = rsqrt(_1040);
        float _1074 = _1070 * _1066;
        float _1076 = _1042 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1078 = _1074 * 0.15915493667125701904296875;
        float _1080 = _1078 * 6.283185482025146484375;
        float _1082 = cos(_1080);
        float _1084 = _1078 * 6.283185482025146484375;
        float _1086 = sin(_1084);
        float _1088 = _1082 + (-1.0);
        float _1090 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1092 = fma(_1086, _1076, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1094 = fma(_1042, _1082, _1090);
        float _1096 = _1072 * _1092;
        float _1098 = fma(_1032, _1096, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1100 = fma(_1028, _1096, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1064 = _1094;
        _1050 = _1098;
        _1052 = _1100;
    }
    float _1102 = _1064;
    float _1104 = _1050;
    float _1106 = _1052;
    float _1108 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1110 = _1102 + _1108;
    float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1114 = _1104 + _1112;
    float _1116 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1118 = _1106 + _1116;
    float _1120 = _1110 * _1110;
    float _1122 = fma(_1114, _1114, _1120);
    float _1124 = fma(_1118, _1118, _1122);
    float _1126 = rsqrt(_1124);
    float _1128 = sqrt(_1124);
    float _1130 = _1126 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1132 = _1114 * _1130;
    float _1134 = _1118 * _1130;
    float _1136 = _1132 * _1132;
    float _1138 = _1134 * _1134;
    float _1140 = _1136 + _1138;
    float _1142 = sqrt(_1140);
    bool _1144 = _1142 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1148 = _1142 + _1146;
    float _1150 = _1122;
    float _1152 = _1148;
    float _1154 = _1130;
    if (_1144)
    {
        float _1156 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1150 = _1156;
    }
    float _1158 = _1150;
    if (_1144)
    {
        float _1160 = rsqrt(_1140);
        _1054 = _1160;
    }
    float _1162 = _1054;
    float _1164 = _1162;
    if (_1144)
    {
        float _1166 = _1148 * _1158;
        _1152 = _1166;
    }
    float _1168 = _1152;
    if (_1144)
    {
        float _1170 = _1168 * 0.15915493667125701904296875;
        _1056 = _1170;
    }
    float _1172 = _1056;
    float _1174 = _1158;
    float _1176 = _1172;
    if (_1144)
    {
        float _1178 = _1172 * 6.283185482025146484375;
        float _1180 = sin(_1178);
        _1174 = _1180;
    }
    float _1182 = _1174;
    float _1184 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1186 = precise::max(0.0, _1184);
    float _1188 = _1028;
    float _1190 = _1186;
    if (_1144)
    {
        float _1192 = _1172 * 6.283185482025146484375;
        float _1194 = cos(_1192);
        _1188 = _1194;
    }
    float _1196 = _1188;
    float _1198 = -_1130;
    float _1200 = -_1186;
    float _1202 = fma(_1110, _1198, _1200);
    if (_1144)
    {
        float _1204 = _1202 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1190 = _1204;
    }
    float _1206 = _1190;
    float _1208 = _1206;
    if (!_1144)
    {
        _1176 = _1136;
    }
    float _1210 = _1176;
    float _1212 = _1182;
    float _1214 = _1210;
    if (_1144)
    {
        float _1216 = fma(_1182, _1206, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1208 = _1216;
    }
    float _1218 = _1208;
    float _1220 = _1218;
    float _1222 = _1196;
    if (_1144)
    {
        float _1224 = _1196 + (-1.0);
        _1212 = _1224;
    }
    float _1226 = _1212;
    float _1228 = _1226;
    if (_1144)
    {
        float _1230 = _1162 * _1218;
        _1058 = _1230;
    }
    float _1232 = _1058;
    if (!_1144)
    {
        _1164 = _1132;
    }
    float _1234 = _1164;
    float _1236 = _1234;
    if (_1144)
    {
        float _1238 = _1226 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1154 = _1238;
    }
    float _1240 = _1154;
    if (_1144)
    {
        float _1242 = _1132 * _1232;
        _1236 = _1242;
    }
    float _1244 = _1236;
    if (!_1144)
    {
        _1220 = _1202;
    }
    float _1246 = _1220;
    float _1248 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1250 = fma(_1128, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1248);
    float _1252 = precise::clamp(_1250, 0.0, 1.0);
    float _1254 = _1246;
    if (!_1144)
    {
        _1228 = _1134;
    }
    float _1256 = _1228;
    float _1258 = _1256;
    if (_1144)
    {
        float _1260 = fma(_1202, _1196, _1240);
        _1254 = _1260;
    }
    float _1262 = _1254;
    if (_1144)
    {
        float _1264 = _1134 * _1232;
        _1258 = _1264;
    }
    float _1266 = _1258;
    if (_1144)
    {
        float _1268 = _1244 * _1244;
        _1214 = _1268;
    }
    float _1270 = _1214;
    if (!_1144)
    {
        _1222 = _1138;
    }
    float _1272 = _1222;
    float _1274 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1276 = _1272;
    if (_1144)
    {
        float _1278 = _1266 * _1266;
        _1276 = _1278;
    }
    float _1280 = _1276;
    float _1282 = fma(_1262, _1262, _1270);
    float _1284 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1286 = -_1252;
    float _1288 = _1286 + 1.0;
    float _1290 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1292 = _1282 + _1280;
    float _1294 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1284);
    float _1296 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1298 = abs(_1288);
    float _1300 = log2(_1298);
    float _1302 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1290);
    float _1304 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1294);
    float _1306 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1296);
    float _1308 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1302);
    float _1310 = _1304 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1312 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1306);
    float _1314 = rsqrt(_1292);
    float _1316 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1318 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1320 = _1312 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1322 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1316);
    float _1324 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1326 = _1310 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1328 = -_1326;
    float _1330 = fma(_1328, _1274, 1.0);
    float _1332 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1322);
    float _1334 = _1300 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1336 = _1314 * _1244;
    float _1338 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1324);
    float _1340 = _1314 * _1262;
    float _1342 = _1314 * _1266;
    float _1344 = _1336 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1346 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1348 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1338);
    float _1350 = exp2(_1334);
    float _1352 = -_1344;
    float _1354 = fma(_1340, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1352);
    float _1356 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1358 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1348);
    float _1360 = -_1342;
    float _1362 = fma(_1360, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1354);
    float _1364 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1366 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1356);
    float _1368 = log2(_1330);
    float _1370 = fma(_1362, -0.5, 0.5);
    float _1372 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1364);
    float _1374 = _1340 + 1.0;
    float _1376 = fma(_1362, 0.5, 0.5);
    float _1378 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1366);
    float _1380 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1372);
    float _1382 = 1.0 / _1358;
    float _1384 = -_1340;
    float _1386 = fma(_1350, _1374, _1384);
    float _1388 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1380);
    float _1390 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1378);
    float _1392 = fma(_1376, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1394 = sqrt(_1370);
    float _1396 = _1368 * 0.693147182464599609375;
    float _1398 = fma(_1376, _1392, -0.212114393711090087890625);
    float _1400 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1402 = fma(_1376, _1398, 1.570728778839111328125);
    float _1404 = fma(_1386, 0.5, 0.5);
    float _1406 = _1388 * _1382;
    float _1408 = _1390 * _1382;
    float _1410 = fma(_1406, 0.5, 0.5);
    float _1412 = fma(_1408, -0.5, 0.5);
    float _1414 = _1394 * 0.636619746685028076171875;
    float3 _3718 = float3(_1410, _1412, _1400);
    float _1416 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3718, float3(0.0), isnan(_3718)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3718, float3(0.0), isnan(_3718)), level(0.0)).x;
    float _1418 = -_1402;
    float _1420 = fma(_1414, _1418, 1.0);
    float3 _3734 = float3(_1410, _1412, _1400);
    float4 _1423 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3734, float3(0.0), isnan(_3734)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3734, float3(0.0), isnan(_3734)), level(0.0)).xyzw;
    float _1425 = _1423.x;
    float _1427 = _1423.y;
    float _1429 = _1423.z;
    float _1431 = _1423.w;
    float2 _3751 = float2(_1420, _1404);
    float3 _1435 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3751, float2(0.0), isnan(_3751)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3751, float2(0.0), isnan(_3751)), level(0.0)).xyz;
    float _1437 = _1435.x;
    float _1439 = _1435.y;
    float _1441 = _1435.z;
    float _1443 = in.m_57.x;
    float _1445 = in.m_57.y;
    float _1447 = in.m_57.z;
    bool _1449 = _816 != 0.0;
    bool _1451 = isnan(_816);
    bool _1453 = _1449 || _1451;
    bool _1455 = isnan(0.0);
    bool _1457 = _1453 || _1455;
    float _1459 = _948 * _1012;
    float _1461 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1463 = _358 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1465 = _814 == 0.0;
    bool _1467 = !_1457;
    bool _1469 = _1465 && _1467;
    float _1471 = -_936;
    float _1473 = fma(_1471, _974, _1459);
    float _1475 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1461);
    float _1477 = _948 * _990;
    bool _1479 = _818 == 0.0;
    bool _1481 = _1479 && _1469;
    float _1483 = _1463 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1485 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1475);
    float _1487 = -_936;
    float _1489 = fma(_1487, _982, _1477);
    out.m_59.x = _1104;
    out.m_59.y = _1102;
    out.m_59.z = _1106;
    float _1491 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1485);
    out.m_61.x = _1114;
    out.m_61.y = _1110;
    out.m_61.z = _1118;
    out.gl_Position.x = _1388;
    out.gl_Position.y = _1390;
    out.gl_Position.z = _1491;
    out.gl_Position.w = _1358;
    float _1493 = _1447;
    float _1495 = _1443;
    float _1497 = _1445;
    if (!_1481)
    {
        float _1499 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1447);
        _1493 = _1499;
    }
    float _1501 = _1493;
    float _1503 = _948 * _998;
    if (!_1481)
    {
        float _1505 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1443);
        _1495 = _1505;
    }
    float _1507 = _1495;
    float _1509 = _952 * _998;
    if (!_1481)
    {
        float _1511 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1445);
        _1497 = _1511;
    }
    float _1513 = _1497;
    float _1515 = -_936;
    float _1517 = fma(_1515, _972, _1503);
    float _1519 = _952 * _1012;
    float _1521 = fma(_946, _972, _1509);
    float _1523 = _952 * _990;
    float _1525 = fma(_944, _834, _1517);
    float _1527 = fma(_946, _974, _1519);
    float _1529 = fma(_962, _834, _1521);
    float _1531 = _1525 * _1513;
    float _1533 = _968 * _998;
    float _1535 = _968 * _1012;
    float _1537 = _968 * _990;
    float _1539 = fma(_1529, _1507, _1531);
    float _1541 = _1300 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1543 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1545 = fma(_944, _838, _1473);
    float _1547 = fma(_950, _972, _1533);
    float _1549 = fma(_950, _974, _1535);
    float _1551 = fma(_950, _982, _1537);
    float _1553 = exp2(_1541);
    float _1555 = fma(_946, _982, _1523);
    float _1557 = fma(_944, _836, _1489);
    float _1559 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1561 = fma(_962, _838, _1527);
    float _1563 = _1545 * _1513;
    float _1565 = _1358 * 0.5;
    float _1567 = fma(_962, _836, _1555);
    float _1569 = fma(_958, _838, _1549);
    float _1571 = fma(_1561, _1507, _1563);
    float _1573 = fma(_1390, -0.5, _1565);
    float _1575 = _1557 * _1513;
    float _1577 = fma(_958, _834, _1547);
    float _1579 = fma(_958, _836, _1551);
    float _1581 = fma(_1569, _1501, _1571);
    float _1583 = fma(_1567, _1507, _1575);
    float _1585 = -_1553;
    float _1587 = _1585 + 1.0;
    float _1589 = fma(_1577, _1501, _1539);
    float _1591 = _1587 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1593 = fma(_1579, _1501, _1583);
    float _1595 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1597 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1599 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1603 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1605 = _1491 + _1358;
    float _1607 = _1388 + _1358;
    float _1609 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1613 = _1595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1615 = _1597 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1617 = _1599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1619 = _1601 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1621 = _1603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1623 = _1605 * 0.5;
    float _1625 = _1607 * 0.5;
    out.m_63.x = _1613;
    out.m_63.y = _1615;
    out.m_63.z = _1617;
    out.m_63.w = _1609;
    out.m_65.x = _1559;
    out.m_65.y = _1619;
    out.m_65.z = _1621;
    out.m_65.w = _1611;
    out.m_67.x = _1589;
    out.m_67.y = _1581;
    out.m_67.z = _1593;
    out.m_69.x = _1625;
    out.m_69.y = _1573;
    out.m_69.z = _1623;
    out.m_69.w = _1358;
    out.m_45.x = _1483;
    float _1627 = _1591 * _1416;
    float _1629 = -_1591;
    float _1631 = _1629 + 1.0;
    float _1633 = _1431 * _1627;
    float _1635 = _1431 * _1631;
    float _1637 = _1441 * _1627;
    float _1639 = fma(_1437, _1633, _1425);
    float _1641 = fma(_1439, _1633, _1427);
    float _1643 = fma(_1431, _1637, _1429);
    out.m_71.x = _1639;
    out.m_71.y = _1641;
    out.m_71.z = _1643;
    out.m_71.w = _1635;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _378 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1700 = as_type<float>(_106);
        out.gl_Position.z = _1700;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    float _128 = _124;
    if (_120)
    {
        float _130 = float(_90);
        _126 = _130;
    }
    float _132 = _126;
    bool _134 = _124 >= _132;
    bool _136 = !_120;
    bool _138 = _134 || _136;
    if (_138)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _100;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1769 = as_type<float>(_144);
        out.gl_Position.z = _1769;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_49.x;
    float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _150 = _124 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _152 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = _150 * _148;
    float _166 = 0.0;
    if (!_162)
    {
        float _168 = _152 * _152;
        float _170 = _168 * 0.5;
        _166 = _170;
    }
    float _172 = _166;
    float _174 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[20].x, _164);
    float _176 = _172;
    if (!_162)
    {
        float _178 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    float _182 = in.m_47.x;
    float _184 = in.m_47.y;
    float _186 = in.m_47.z;
    float _188 = _174 * 6.283185482025146484375;
    float _190 = floor(_174);
    float _192 = _188 * 0.15915493667125701904296875;
    int _194 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _196 = _194 != 0;
    float _198 = _192 * 6.283185482025146484375;
    float _200 = cos(_198);
    float _202 = 1.4012984643248170709237295832899e-45;
    float _204 = _180;
    if (!_162)
    {
        _202 = _152;
    }
    float _206 = _202;
    float _208 = -_190;
    float _210 = _174 + _208;
    bool _212 = !_162;
    float _214 = _206;
    if (!_212)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = _152 * _218;
        float _228 = 1.0 / _222;
        float _230 = _224 * 0.693147182464599609375;
        float _232 = exp2(_226);
        float _234 = 1.0 / _230;
        float _236 = _232 + (-1.0);
        float _238 = -_236;
        float _240 = fma(_238, _234, _152);
        float _242 = _240 * _228;
        float _244 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _244;
    }
    float _246 = _204;
    bool _248 = !_162;
    if (!_248)
    {
        float _250 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = log2(_250);
        float _254 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _256 = _254 + 1.0;
        float _258 = 1.0 / _256;
        float _260 = _152 * _252;
        float _262 = exp2(_260);
        float _264 = -_262;
        float _266 = _264 + 1.0;
        float _268 = _266 * _258;
        _214 = _268;
    }
    float _270 = _214;
    float _272 = in.m_51.w;
    float _274 = in.m_42.x;
    float _276 = in.m_42.y;
    float _278 = in.m_42.z;
    int _280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _282 = _280 != 0;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _286 = _284 != 0;
    float _288 = fma(_200, 0.5, 0.5);
    bool _290 = _210 < 0.5;
    float _292 = float(_290);
    float _294 = -_210;
    float _296 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _298 = !_196;
    int _300 = _298 ? 0 : 1;
    float _302 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _304 = !_282;
    int _306 = _304 ? 0 : 1;
    float _308 = -_292;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _312 = -_288;
    float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _316 = abs(_300);
    int _318 = abs(_306);
    float _320 = fma(_270, _182, _302);
    bool _322 = !_286;
    int _324 = _322 ? 0 : 1;
    float _326 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _330 = fma(_270, _184, _326);
    int _332 = abs(_324);
    float _334 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _336 = float(_318);
    float _338 = float(_316);
    float _340 = fma(_270, _186, _334);
    float _342 = abs(_296);
    float _344 = _336 * _342;
    float _346 = fma(_320, _272, _274);
    float _348 = fma(_340, _272, _278);
    float _350 = float(_332);
    float _352 = fma(_338, _314, _344);
    float _354 = fma(_330, _272, _276);
    float _356 = abs(_310);
    float _358 = fma(_350, _356, _352);
    bool _360 = !_328;
    float _376;
    if (!_360)
    {
        float _362 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _364 = _146 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _366 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _368 = _366 * _362;
        float _370 = floor(_368);
        float _372 = -_370;
        float _374 = _368 + _372;
        _376 = _374;
        _378 = true;
    }
    else
    {
        float _380 = float(_90);
        float _382 = 1.0 / _380;
        float _384 = _124 * _382;
        _376 = _384;
    }
    _378 = false;
    float _386 = _376;
    float _388 = in.m_49.y;
    float _390 = _146 * 2.0;
    float _392 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _394 = in.m_49.z;
    float _396 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _398 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _400 = floor(_390);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _412 = _410 != 0;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _416 = _414 != 0;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _420 = _418 != 0;
    float _422 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[4].x, _392);
    float _424 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[5].x, _396);
    float _426 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[6].x, _398);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _430 = _386 + _428;
    float _432 = 1.0 / _408;
    float _434 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[4].z, _422);
    float _436 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[5].z, _424);
    float _438 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[6].z, _426);
    float _440 = _434 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _442 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _444 = log2(_442);
    bool _446 = _400 > 0.0;
    float _448 = _438 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _450 = _400 >= 0.0;
    bool _452 = isnan(_400);
    bool _454 = _450 || _452;
    bool _456 = isnan(0.0);
    bool _458 = _454 || _456;
    float _460 = _388 * 2.0;
    float _462 = _394 * 2.0;
    float _464 = _146 + _394;
    int _466 = _458 ? 0 : 1;
    float _468 = floor(_460);
    float _470 = _430 * _432;
    float _472 = _388 + _394;
    float _474 = _464 + (-1.0);
    float _476 = _394 + (-0.5);
    float _478 = _472 + (-1.0);
    float _480 = 1.0 / _404;
    int _482 = ~_466;
    int _484 = _482 + 1;
    int _486 = _484 + 1;
    float _488 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _490 = _444 * _124;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _492;
    int _496 = _486;
    if (!_446)
    {
        int _498 = ~_466;
        int _500 = _498 + 1;
        _496 = _500;
    }
    int _502 = _496;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _508 = _468 > 0.0;
    float _510 = floor(_462);
    bool _512 = _468 >= 0.0;
    bool _514 = isnan(_468);
    bool _516 = _512 || _514;
    bool _518 = isnan(0.0);
    bool _520 = _516 || _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _524 = _386 + _522;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _528 = 1.0 + _526;
    bool _530 = !_416;
    int _532 = _530 ? 0 : 1;
    bool _534 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _536 = isnan(0.0);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _542 = _538 || _540;
    float _544 = _524 * _480;
    float _546 = exp2(_490);
    float _548 = _146 + _388;
    float _550 = fma(_494, _544, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _552 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _554 = isnan(_386);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = _548 + (-1.0);
    float _566 = _388 + (-0.5);
    float _568 = _146 + (-0.5);
    bool _570 = _510 > 0.0;
    float _572 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _574 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _576 = _510 >= 0.0;
    bool _578 = isnan(_510);
    bool _580 = _576 || _578;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _590;
    bool _594 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _596 = isnan(_386);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = 1.0 / _528;
    float _608 = -_546;
    float _610 = _608 + 1.0;
    float _612 = fma(_588, _544, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _614 = fma(_592, _544, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _616 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _618 = isnan(_386);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -_604;
    float _630 = _628 + 1.0;
    float _632 = _542 ? _610 : 0.0;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _638 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _640 = isnan(1.0);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _646 = _642 || _644;
    float _648 = in.m_53.x;
    float _650 = in.m_53.y;
    float _652 = in.m_53.z;
    float _654 = _626 * _630;
    float _656 = -_626;
    float _658 = _656 + 1.0;
    int _660 = abs(_532);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _666 = fma(_636, _470, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _668 = _562 * _658;
    float _670 = fma(_506, _470, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _672 = fma(_664, _470, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _674 = float(_502);
    float _676 = _550 * _668;
    if (_646)
    {
        float _678 = _632 * _606;
        _128 = _678;
    }
    float _680 = _128;
    float _682 = float(_660);
    float _684 = _612 * _668;
    float _686 = _614 * _668;
    float _688 = -_562;
    float _690 = _688 + 1.0;
    int _692 = _584 ? 0 : 1;
    float _694 = _682 * _674;
    int _696 = _520 ? 0 : 1;
    float _698 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[143].x, _676);
    float _700 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[143].y, _684);
    float _702 = _694 * (-2.0);
    float _704 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[143].z, _686);
    int _706 = ~_692;
    int _708 = _706 + 1;
    int _710 = _708 + 1;
    float _712 = -_440;
    float _714 = _712 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _716 = fma(_702, _650, _650);
    float _718 = fma(_488, _702, _488);
    float _720 = _436 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _722 = !_412;
    int _724 = _722 ? 0 : 1;
    float _726 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[196].y, _716);
    int _728 = _710;
    if (!_570)
    {
        int _730 = ~_692;
        int _732 = _730 + 1;
        _728 = _732;
    }
    int _734 = _728;
    float _736 = -_720;
    float _738 = _736 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _740 = !_420;
    int _742 = _740 ? 0 : 1;
    float _744 = fma(_670, _654, _698);
    int _746 = abs(_724);
    float _748 = fma(_666, _654, _700);
    int _750 = abs(_742);
    float _752 = _738 * _738;
    float _754 = float(_746);
    float _756 = fma(_672, _654, _704);
    float _758 = float(_734);
    float _760 = fma(_714, _714, _752);
    int _762 = ~_696;
    int _764 = _762 + 1;
    int _766 = _764 + 1;
    float _768 = fma(_718, _680, _726);
    int _770 = _766;
    if (!_508)
    {
        int _772 = ~_696;
        int _774 = _772 + 1;
        _770 = _774;
    }
    int _776 = _770;
    float _778 = -_448;
    float _780 = _778 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _782 = _754 * _758;
    float _784 = float(_776);
    float _786 = fma(_780, _780, _760);
    float _788 = float(_750);
    float _790 = _782 * (-2.0);
    float _792 = _768 * 0.15915493667125701904296875;
    float _794 = rsqrt(_786);
    float _796 = in.m_51.x;
    float _798 = in.m_51.y;
    float _800 = in.m_51.z;
    float _802 = fma(_790, _648, _648);
    float _804 = _788 * _784;
    float _806 = fma(_572, _790, _572);
    float _808 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[145].x, _744);
    float _810 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[196].x, _802);
    float _812 = _804 * (-2.0);
    float _814 = in.m_55.x;
    float _816 = in.m_55.y;
    float _818 = in.m_55.z;
    float _820 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[145].z, _756);
    float _822 = fma(_806, _680, _810);
    float _824 = fma(_812, _652, _652);
    float _826 = fma(_574, _812, _574);
    float _828 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[145].y, _748);
    float _830 = _822 * 0.15915493667125701904296875;
    float _832 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[196].z, _824);
    float _834 = _714 * _794;
    float _836 = _780 * _794;
    float _838 = _738 * _794;
    float _840 = fma(_826, _680, _832);
    float _842 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _844 = _834 * _842;
    float _846 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _848 = _836 * _846;
    float _850 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _852 = _838 * _850;
    float _854 = _840 * 0.15915493667125701904296875;
    float _856 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _858 = -_844;
    float _860 = fma(_836, _856, _858);
    float _862 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _864 = -_848;
    float _866 = fma(_838, _862, _864);
    float _868 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _870 = -_852;
    float _872 = fma(_834, _868, _870);
    float _874 = _792 * 6.283185482025146484375;
    float _876 = sin(_874);
    float _878 = _860 * _860;
    float _880 = _808 * _796;
    float _882 = _828 * _798;
    float _884 = _820 * _800;
    float _886 = fma(_866, _866, _878);
    float _888 = _358 * _880;
    float _890 = _358 * _882;
    float _892 = _792 * 6.283185482025146484375;
    float _894 = cos(_892);
    float _896 = fma(_872, _872, _886);
    float _898 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _816);
    float _900 = _890 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _902 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _814);
    float _904 = _888 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _906 = _358 * _884;
    float _908 = _900 * _898;
    float _910 = _830 * 6.283185482025146484375;
    float _912 = sin(_910);
    float _914 = _904 * _902;
    float _916 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _818);
    float _918 = _906 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _920 = _918 * _916;
    float _922 = _830 * 6.283185482025146484375;
    float _924 = cos(_922);
    float _926 = _854 * 6.283185482025146484375;
    float _928 = cos(_926);
    float _930 = _912 * _876;
    float _932 = _912 * _894;
    float _934 = _854 * 6.283185482025146484375;
    float _936 = sin(_934);
    float _938 = _924 * _894;
    float _940 = _924 * _876;
    float _942 = rsqrt(_896);
    float _944 = _912 * _928;
    float _946 = _894 * _928;
    float _948 = _924 * _928;
    float _950 = _876 * _928;
    float _952 = fma(_936, _938, _930);
    float _954 = -_908;
    float _956 = _936 * _954;
    float _958 = fma(_936, _930, _938);
    float _960 = -_940;
    float _962 = fma(_936, _932, _960);
    float _964 = _948 * _908;
    float _966 = -_932;
    float _968 = fma(_936, _940, _966);
    float _970 = fma(_946, _914, _956);
    float _972 = _866 * _942;
    float _974 = _860 * _942;
    float _976 = fma(_952, _914, _964);
    float _978 = _944 * _908;
    float _980 = _838 * _972;
    float _982 = _872 * _942;
    float _984 = _836 * _974;
    float _986 = fma(_962, _914, _978);
    float _988 = -_980;
    float _990 = fma(_834, _974, _988);
    float _992 = fma(_968, _920, _976);
    float _994 = fma(_950, _920, _970);
    float _996 = -_984;
    float _998 = fma(_838, _982, _996);
    float _1000 = fma(_958, _920, _986);
    float _1002 = _990 * _992;
    float _1004 = _834 * _982;
    float _1006 = _998 * _992;
    float _1008 = fma(_982, _994, _1002);
    float _1010 = -_1004;
    float _1012 = fma(_836, _972, _1010);
    float _1014 = fma(_972, _994, _1006);
    float _1016 = fma(_836, _1000, _1008);
    float _1018 = fma(_834, _1000, _1014);
    float _1020 = _448 + _1016;
    float _1022 = _440 + _1018;
    float _1024 = _1012 * _992;
    float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1028 = _1020 + _1026;
    float _1030 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1032 = _1022 + _1030;
    float _1034 = fma(_974, _994, _1024);
    float _1036 = _1028 * _1028;
    float _1038 = fma(_838, _1000, _1034);
    float _1040 = fma(_1032, _1032, _1036);
    float _1042 = _720 + _1038;
    float _1044 = sqrt(_1040);
    bool _1046 = _1044 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1048 = _994;
    float _1050 = _1022;
    float _1052 = _1020;
    float _1054 = _1034;
    float _1056 = _1032;
    float _1058 = _820;
    if (!_1046)
    {
        _1048 = _1042;
    }
    float _1060 = _1048;
    bool _1062 = !_1046;
    float _1064 = _1060;
    if (!_1062)
    {
        float _1066 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1070 = _1044 + _1068;
        float _1072 = rsqrt(_1040);
        float _1074 = _1070 * _1066;
        float _1076 = _1042 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1078 = _1074 * 0.15915493667125701904296875;
        float _1080 = _1078 * 6.283185482025146484375;
        float _1082 = cos(_1080);
        float _1084 = _1078 * 6.283185482025146484375;
        float _1086 = sin(_1084);
        float _1088 = _1082 + (-1.0);
        float _1090 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1092 = fma(_1086, _1076, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1094 = fma(_1042, _1082, _1090);
        float _1096 = _1072 * _1092;
        float _1098 = fma(_1032, _1096, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1100 = fma(_1028, _1096, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1064 = _1094;
        _1050 = _1098;
        _1052 = _1100;
    }
    float _1102 = _1064;
    float _1104 = _1050;
    float _1106 = _1052;
    float _1108 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1110 = _1102 + _1108;
    float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1114 = _1104 + _1112;
    float _1116 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1118 = _1106 + _1116;
    float _1120 = _1110 * _1110;
    float _1122 = fma(_1114, _1114, _1120);
    float _1124 = fma(_1118, _1118, _1122);
    float _1126 = rsqrt(_1124);
    float _1128 = sqrt(_1124);
    float _1130 = _1126 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1132 = _1114 * _1130;
    float _1134 = _1118 * _1130;
    float _1136 = _1132 * _1132;
    float _1138 = _1134 * _1134;
    float _1140 = _1136 + _1138;
    float _1142 = sqrt(_1140);
    bool _1144 = _1142 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1148 = _1142 + _1146;
    float _1150 = _1122;
    float _1152 = _1148;
    float _1154 = _1130;
    if (_1144)
    {
        float _1156 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1150 = _1156;
    }
    float _1158 = _1150;
    if (_1144)
    {
        float _1160 = rsqrt(_1140);
        _1054 = _1160;
    }
    float _1162 = _1054;
    float _1164 = _1162;
    if (_1144)
    {
        float _1166 = _1148 * _1158;
        _1152 = _1166;
    }
    float _1168 = _1152;
    if (_1144)
    {
        float _1170 = _1168 * 0.15915493667125701904296875;
        _1056 = _1170;
    }
    float _1172 = _1056;
    float _1174 = _1158;
    float _1176 = _1172;
    if (_1144)
    {
        float _1178 = _1172 * 6.283185482025146484375;
        float _1180 = sin(_1178);
        _1174 = _1180;
    }
    float _1182 = _1174;
    float _1184 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1186 = precise::max(0.0, _1184);
    float _1188 = _1028;
    float _1190 = _1186;
    if (_1144)
    {
        float _1192 = _1172 * 6.283185482025146484375;
        float _1194 = cos(_1192);
        _1188 = _1194;
    }
    float _1196 = _1188;
    float _1198 = -_1130;
    float _1200 = -_1186;
    float _1202 = fma(_1110, _1198, _1200);
    if (_1144)
    {
        float _1204 = _1202 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1190 = _1204;
    }
    float _1206 = _1190;
    float _1208 = _1206;
    if (!_1144)
    {
        _1176 = _1136;
    }
    float _1210 = _1176;
    float _1212 = _1182;
    float _1214 = _1210;
    if (_1144)
    {
        float _1216 = fma(_1182, _1206, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1208 = _1216;
    }
    float _1218 = _1208;
    float _1220 = _1218;
    float _1222 = _1196;
    if (_1144)
    {
        float _1224 = _1196 + (-1.0);
        _1212 = _1224;
    }
    float _1226 = _1212;
    float _1228 = _1226;
    if (_1144)
    {
        float _1230 = _1162 * _1218;
        _1058 = _1230;
    }
    float _1232 = _1058;
    if (!_1144)
    {
        _1164 = _1132;
    }
    float _1234 = _1164;
    float _1236 = _1234;
    if (_1144)
    {
        float _1238 = _1226 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1154 = _1238;
    }
    float _1240 = _1154;
    if (_1144)
    {
        float _1242 = _1132 * _1232;
        _1236 = _1242;
    }
    float _1244 = _1236;
    if (!_1144)
    {
        _1220 = _1202;
    }
    float _1246 = _1220;
    float _1248 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1250 = fma(_1128, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1248);
    float _1252 = precise::clamp(_1250, 0.0, 1.0);
    float _1254 = _1246;
    if (!_1144)
    {
        _1228 = _1134;
    }
    float _1256 = _1228;
    float _1258 = _1256;
    if (_1144)
    {
        float _1260 = fma(_1202, _1196, _1240);
        _1254 = _1260;
    }
    float _1262 = _1254;
    if (_1144)
    {
        float _1264 = _1134 * _1232;
        _1258 = _1264;
    }
    float _1266 = _1258;
    if (_1144)
    {
        float _1268 = _1244 * _1244;
        _1214 = _1268;
    }
    float _1270 = _1214;
    if (!_1144)
    {
        _1222 = _1138;
    }
    float _1272 = _1222;
    float _1274 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1276 = _1272;
    if (_1144)
    {
        float _1278 = _1266 * _1266;
        _1276 = _1278;
    }
    float _1280 = _1276;
    float _1282 = fma(_1262, _1262, _1270);
    float _1284 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1286 = -_1252;
    float _1288 = _1286 + 1.0;
    float _1290 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1292 = _1282 + _1280;
    float _1294 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1284);
    float _1296 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1298 = abs(_1288);
    float _1300 = log2(_1298);
    float _1302 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1290);
    float _1304 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1294);
    float _1306 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1296);
    float _1308 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1302);
    float _1310 = _1304 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1312 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1306);
    float _1314 = rsqrt(_1292);
    float _1316 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1318 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1320 = _1312 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1322 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1316);
    float _1324 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1326 = _1310 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1328 = -_1326;
    float _1330 = fma(_1328, _1274, 1.0);
    float _1332 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1322);
    float _1334 = _1300 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1336 = _1314 * _1244;
    float _1338 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1324);
    float _1340 = _1314 * _1262;
    float _1342 = _1314 * _1266;
    float _1344 = _1336 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1346 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1348 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1338);
    float _1350 = exp2(_1334);
    float _1352 = -_1344;
    float _1354 = fma(_1340, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1352);
    float _1356 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1358 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1348);
    float _1360 = -_1342;
    float _1362 = fma(_1360, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1354);
    float _1364 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1366 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1356);
    float _1368 = log2(_1330);
    float _1370 = fma(_1362, -0.5, 0.5);
    float _1372 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1364);
    float _1374 = _1340 + 1.0;
    float _1376 = fma(_1362, 0.5, 0.5);
    float _1378 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1366);
    float _1380 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1372);
    float _1382 = 1.0 / _1358;
    float _1384 = -_1340;
    float _1386 = fma(_1350, _1374, _1384);
    float _1388 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1380);
    float _1390 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1378);
    float _1392 = fma(_1376, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1394 = sqrt(_1370);
    float _1396 = _1368 * 0.693147182464599609375;
    float _1398 = fma(_1376, _1392, -0.212114393711090087890625);
    float _1400 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1402 = fma(_1376, _1398, 1.570728778839111328125);
    float _1404 = fma(_1386, 0.5, 0.5);
    float _1406 = _1388 * _1382;
    float _1408 = _1390 * _1382;
    float _1410 = fma(_1406, 0.5, 0.5);
    float _1412 = fma(_1408, -0.5, 0.5);
    float _1414 = _1394 * 0.636619746685028076171875;
    float3 _3718 = float3(_1410, _1412, _1400);
    float _1416 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3718, float3(0.0), isnan(_3718)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3718, float3(0.0), isnan(_3718)), level(0.0)).x;
    float _1418 = -_1402;
    float _1420 = fma(_1414, _1418, 1.0);
    float3 _3734 = float3(_1410, _1412, _1400);
    float4 _1423 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3734, float3(0.0), isnan(_3734)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3734, float3(0.0), isnan(_3734)), level(0.0)).xyzw;
    float _1425 = _1423.x;
    float _1427 = _1423.y;
    float _1429 = _1423.z;
    float _1431 = _1423.w;
    float2 _3751 = float2(_1420, _1404);
    float3 _1435 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3751, float2(0.0), isnan(_3751)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3751, float2(0.0), isnan(_3751)), level(0.0)).xyz;
    float _1437 = _1435.x;
    float _1439 = _1435.y;
    float _1441 = _1435.z;
    float _1443 = in.m_57.x;
    float _1445 = in.m_57.y;
    float _1447 = in.m_57.z;
    bool _1449 = _816 != 0.0;
    bool _1451 = isnan(_816);
    bool _1453 = _1449 || _1451;
    bool _1455 = isnan(0.0);
    bool _1457 = _1453 || _1455;
    float _1459 = _948 * _1012;
    float _1461 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1463 = _358 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1465 = _814 == 0.0;
    bool _1467 = !_1457;
    bool _1469 = _1465 && _1467;
    float _1471 = -_936;
    float _1473 = fma(_1471, _974, _1459);
    float _1475 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1461);
    float _1477 = _948 * _990;
    bool _1479 = _818 == 0.0;
    bool _1481 = _1479 && _1469;
    float _1483 = _1463 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1485 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1475);
    float _1487 = -_936;
    float _1489 = fma(_1487, _982, _1477);
    out.m_59.x = _1104;
    out.m_59.y = _1102;
    out.m_59.z = _1106;
    float _1491 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1485);
    out.m_61.x = _1114;
    out.m_61.y = _1110;
    out.m_61.z = _1118;
    out.gl_Position.x = _1388;
    out.gl_Position.y = _1390;
    out.gl_Position.z = _1491;
    out.gl_Position.w = _1358;
    float _1493 = _1447;
    float _1495 = _1443;
    float _1497 = _1445;
    if (!_1481)
    {
        float _1499 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1447);
        _1493 = _1499;
    }
    float _1501 = _1493;
    float _1503 = _948 * _998;
    if (!_1481)
    {
        float _1505 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1443);
        _1495 = _1505;
    }
    float _1507 = _1495;
    float _1509 = _952 * _998;
    if (!_1481)
    {
        float _1511 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1445);
        _1497 = _1511;
    }
    float _1513 = _1497;
    float _1515 = -_936;
    float _1517 = fma(_1515, _972, _1503);
    float _1519 = _952 * _1012;
    float _1521 = fma(_946, _972, _1509);
    float _1523 = _952 * _990;
    float _1525 = fma(_944, _834, _1517);
    float _1527 = fma(_946, _974, _1519);
    float _1529 = fma(_962, _834, _1521);
    float _1531 = _1525 * _1513;
    float _1533 = _968 * _998;
    float _1535 = _968 * _1012;
    float _1537 = _968 * _990;
    float _1539 = fma(_1529, _1507, _1531);
    float _1541 = _1300 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1543 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1545 = fma(_944, _838, _1473);
    float _1547 = fma(_950, _972, _1533);
    float _1549 = fma(_950, _974, _1535);
    float _1551 = fma(_950, _982, _1537);
    float _1553 = exp2(_1541);
    float _1555 = fma(_946, _982, _1523);
    float _1557 = fma(_944, _836, _1489);
    float _1559 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1561 = fma(_962, _838, _1527);
    float _1563 = _1545 * _1513;
    float _1565 = _1358 * 0.5;
    float _1567 = fma(_962, _836, _1555);
    float _1569 = fma(_958, _838, _1549);
    float _1571 = fma(_1561, _1507, _1563);
    float _1573 = fma(_1390, -0.5, _1565);
    float _1575 = _1557 * _1513;
    float _1577 = fma(_958, _834, _1547);
    float _1579 = fma(_958, _836, _1551);
    float _1581 = fma(_1569, _1501, _1571);
    float _1583 = fma(_1567, _1507, _1575);
    float _1585 = -_1553;
    float _1587 = _1585 + 1.0;
    float _1589 = fma(_1577, _1501, _1539);
    float _1591 = _1587 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1593 = fma(_1579, _1501, _1583);
    float _1595 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1597 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1599 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1603 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1605 = _1491 + _1358;
    float _1607 = _1388 + _1358;
    float _1609 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1613 = _1595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1615 = _1597 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1617 = _1599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1619 = _1601 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1621 = _1603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1623 = _1605 * 0.5;
    float _1625 = _1607 * 0.5;
    out.m_63.x = _1613;
    out.m_63.y = _1615;
    out.m_63.z = _1617;
    out.m_63.w = _1609;
    out.m_65.x = _1559;
    out.m_65.y = _1619;
    out.m_65.z = _1621;
    out.m_65.w = _1611;
    out.m_67.x = _1589;
    out.m_67.y = _1581;
    out.m_67.z = _1593;
    out.m_69.x = _1625;
    out.m_69.y = _1573;
    out.m_69.z = _1623;
    out.m_69.w = _1358;
    out.m_45.x = _1483;
    float _1627 = _1591 * _1416;
    float _1629 = -_1591;
    float _1631 = _1629 + 1.0;
    float _1633 = _1431 * _1627;
    float _1635 = _1431 * _1631;
    float _1637 = _1441 * _1627;
    float _1639 = fma(_1437, _1633, _1425);
    float _1641 = fma(_1439, _1633, _1427);
    float _1643 = fma(_1431, _1637, _1429);
    out.m_71.x = _1639;
    out.m_71.y = _1641;
    out.m_71.z = _1643;
    out.m_71.w = _1635;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

