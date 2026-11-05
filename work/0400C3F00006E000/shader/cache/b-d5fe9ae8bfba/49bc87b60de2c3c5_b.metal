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
    constant _16* vp_c7 [[id(5)]];
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
    float4 m_67 [[user(locn0)]];
    float4 m_71 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 m_75 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1310 = false;
    bool _460 = false;
    bool _292 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_47.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2090 = as_type<float>(_110);
        out.gl_Position.z = _2090;
    }
    if (!_98)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _114 = in.m_49.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = _128;
    if (_124)
    {
        float _132 = float(_94);
        _104 = _132;
    }
    float _134 = _104;
    bool _136 = _128 >= _134;
    bool _138 = !_124;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_140)
    {
        out.m_47.x = 0.0;
    }
    if (_140)
    {
        float _146 = _144 * 5.0;
        _112 = as_type<int>(_146);
    }
    int _148 = _112;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2160 = as_type<float>(_148);
        out.gl_Position.z = _2160;
    }
    if (_140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_51.w;
    float _152 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_49.x;
    float _166 = in.m_49.y;
    float _168 = in.m_49.z;
    float _170 = in.m_44.x;
    float _172 = in.m_44.y;
    float _174 = in.m_44.z;
    float _176 = 0.0;
    float _178 = _152;
    if (!_162)
    {
        float _180 = _152 * _152;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_162)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    bool _192 = !_162;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _152 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _152);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _224;
    }
    float _226 = _194;
    bool _228 = !_162;
    if (!_228)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = 1.0 / _236;
        float _240 = _152 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _178 = _248;
    }
    float _250 = _178;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _254 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = fma(_250, _164, _254);
    float _262 = fma(_250, _166, _256);
    float _264 = fma(_250, _168, _258);
    float _266 = fma(_260, _150, _170);
    float _268 = fma(_262, _150, _172);
    float _270 = fma(_264, _150, _174);
    bool _272 = !_252;
    float _290;
    if (!_272)
    {
        float _274 = in.m_53.x;
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _278 = _274 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _282 = _280 * _276;
        float _284 = floor(_282);
        float _286 = -_284;
        float _288 = _282 + _286;
        _290 = _288;
        _292 = true;
    }
    else
    {
        float _294 = float(_94);
        float _296 = 1.0 / _294;
        float _298 = _128 * _296;
        _290 = _298;
    }
    _292 = false;
    float _300 = _290;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _300 + _302;
    bool _306 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _308 = isnan(_300);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _320 = _300 + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _330 = 1.0 / _324;
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _334 = 1.0 / _328;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _336;
    float _340 = _304 * _330;
    bool _342 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _344 = isnan(_300);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -_316;
    float _356 = _354 + 1.0;
    bool _358 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _360 = isnan(_300);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = fma(_338, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _372 = _368 * _356;
    float _374 = -_368;
    float _376 = _374 + 1.0;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    float _386 = _320 * _334;
    float _388 = _352 * _376;
    float _390 = fma(_380, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _392 = fma(_384, _340, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _394 = -_352;
    float _396 = _394 + 1.0;
    float _398 = _370 * _388;
    float _400 = _390 * _388;
    float _402 = _392 * _388;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[143].x, _400);
    float _418 = fma(_406, _386, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _420 = fma(_410, _386, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _422 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[143].y, _398);
    float _424 = fma(_414, _386, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[143].z, _402);
    float _428 = fma(_418, _372, _416);
    float _430 = fma(_420, _372, _422);
    float _432 = fma(_424, _372, _426);
    float _434 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[145].x, _428);
    float _436 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[145].y, _430);
    float _438 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[145].z, _432);
    bool _440 = !_332;
    float _458;
    if (!_440)
    {
        float _442 = in.m_53.x;
        float _444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _446 = _442 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _448 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _450 = _448 * _444;
        float _452 = floor(_450);
        float _454 = -_452;
        float _456 = _450 + _454;
        _458 = _456;
        _460 = true;
    }
    else
    {
        float _462 = float(_94);
        float _464 = 1.0 / _462;
        float _466 = _128 * _464;
        _458 = _466;
    }
    _460 = false;
    float _468 = _458;
    float _470 = in.m_53.x;
    float _472 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _474 = log2(_472);
    float _476 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _478 = in.m_53.z;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _486 = _484 != 0;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _490 = _488 != 0;
    float _492 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _494 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _496 = in.m_53.y;
    float _498 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _476);
    float _500 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _492);
    float _502 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _494);
    float _504 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].z, _498);
    float _506 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].z, _500);
    float _508 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].z, _502);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _512 = _468 + _510;
    float _514 = _474 * _128;
    float _516 = _506 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _518 = !_486;
    int _520 = _518 ? 0 : 1;
    float _522 = in.m_55.x;
    bool _524 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _526 = isnan(_468);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _538 = _516 + _536;
    float _540 = _470 * 2.0;
    bool _542 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _544 = isnan(_468);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    float _554 = -_534;
    float _556 = _554 + 1.0;
    float _558 = _478 * 2.0;
    float _560 = floor(_540);
    float _562 = _552 * _556;
    float _564 = _496 + _478;
    float _566 = _496 * 2.0;
    float _568 = -_552;
    float _570 = _568 + 1.0;
    float _572 = _564 + (-1.0);
    float _574 = floor(_558);
    float _576 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _578 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _580 = isnan(1.0);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _586 = _582 || _584;
    float _588 = floor(_566);
    bool _590 = _560 > 0.0;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _594 = 1.0 + _592;
    bool _596 = _560 >= 0.0;
    bool _598 = isnan(_560);
    bool _600 = _596 || _598;
    bool _602 = isnan(0.0);
    bool _604 = _600 || _602;
    float _606 = _470 + _478;
    int _608 = _604 ? 0 : 1;
    float _610 = exp2(_514);
    bool _612 = _574 > 0.0;
    float _614 = _606 + (-1.0);
    int _616 = ~_608;
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    bool _622 = _574 >= 0.0;
    bool _624 = isnan(_574);
    bool _626 = _622 || _624;
    bool _628 = isnan(0.0);
    bool _630 = _626 || _628;
    float _632 = _508 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _634 = _620;
    float _636 = _556;
    float _638 = _496;
    float _640 = _632;
    if (!_590)
    {
        int _642 = ~_608;
        int _644 = _642 + 1;
        _634 = _644;
    }
    int _646 = _634;
    float _648 = _504 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _650 = 1.0 / _594;
    float _652 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _654 = _632 + _652;
    float _656 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _658 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _660 = _648 + _658;
    bool _662 = _588 > 0.0;
    int _664 = abs(_520);
    float _666 = _660 * _660;
    bool _668 = !_482;
    int _670 = _668 ? 0 : 1;
    float _672 = -_610;
    float _674 = _672 + 1.0;
    int _676 = _630 ? 0 : 1;
    float _678 = fma(_538, _538, _666);
    bool _680 = _588 >= 0.0;
    bool _682 = isnan(_588);
    bool _684 = _680 || _682;
    bool _686 = isnan(0.0);
    bool _688 = _684 || _686;
    float _690 = in.m_57.x;
    float _692 = in.m_57.y;
    float _694 = in.m_57.z;
    int _696 = abs(_670);
    float _698 = fma(_654, _654, _678);
    int _700 = ~_676;
    int _702 = _700 + 1;
    int _704 = _702 + 1;
    float _706 = float(_664);
    float _708 = float(_646);
    float _710 = rsqrt(_698);
    int _712 = _704;
    float _714 = _648;
    if (!_612)
    {
        int _716 = ~_676;
        int _718 = _716 + 1;
        _712 = _718;
    }
    int _720 = _712;
    bool _722 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _724 = isnan(0.0);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _730 = _726 || _728;
    float _732 = _706 * _708;
    int _734 = _688 ? 0 : 1;
    float _736 = _730 ? _674 : 0.0;
    int _738 = ~_734;
    int _740 = _738 + 1;
    int _742 = _740 + 1;
    float _744 = float(_696);
    int _746 = _742;
    if (_586)
    {
        float _748 = _736 * _650;
        _130 = _748;
    }
    float _750 = _130;
    float _752 = float(_720);
    float _754 = _732 * (-2.0);
    if (!_662)
    {
        int _756 = ~_734;
        int _758 = _756 + 1;
        _746 = _758;
    }
    int _760 = _746;
    float _762 = _660 * _710;
    bool _764 = _496 > 0.5;
    float _766 = _744 * _752;
    float _768 = _538 * _710;
    float _770 = -_762;
    float _772 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[18].w, _660);
    float _774 = fma(_576, _754, _576);
    bool _776 = !_490;
    int _778 = _776 ? 0 : 1;
    float _780 = -_768;
    float _782 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[18].w, _538);
    float _784 = _772 * _772;
    float _786 = fma(_754, _692, _692);
    float _788 = _496 + (-0.5);
    float _790 = float(_760);
    float _792 = fma(_782, _782, _784);
    int _794 = abs(_778);
    float _796 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[196].y, _786);
    float _798 = _470 + _496;
    float _800 = _654 * _710;
    float _802 = float(_794);
    float _804 = _798 + (-1.0);
    float _806 = fma(_774, _750, _796);
    float _808 = _766 * (-2.0);
    float _810 = -_800;
    float _812 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[18].w, _654);
    float _814 = _802 * _790;
    float _816 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _818 = _470 + (-0.5);
    float _820 = fma(_808, _690, _690);
    float _822 = _814 * (-2.0);
    float _824 = fma(_816, _808, _816);
    float _826 = fma(_812, _812, _792);
    float _828 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[196].x, _820);
    float _830 = fma(_656, _822, _656);
    float _832 = fma(_822, _694, _694);
    float _834 = _478 + (-0.5);
    float _836 = fma(_824, _750, _828);
    float _838 = in.m_51.x;
    float _840 = in.m_51.y;
    float _842 = in.m_51.z;
    float _844 = _806 * 0.15915493667125701904296875;
    float _846 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[196].z, _832);
    float _848 = _836 * 0.15915493667125701904296875;
    float _850 = sqrt(_826);
    float _852 = in.m_59.x;
    float _854 = in.m_59.y;
    float _856 = in.m_59.z;
    float _858 = fma(_830, _750, _846);
    float _860 = _858 * 0.15915493667125701904296875;
    int _862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _864 = _862 != 0;
    float _866 = _844 * 6.283185482025146484375;
    float _868 = sin(_866);
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _872 = _870 != 0;
    bool _874 = _470 > 0.5;
    bool _876 = _874 && _864;
    float _878 = _844 * 6.283185482025146484375;
    float _880 = cos(_878);
    float _882 = _434 * _838;
    float _884 = _436 * _840;
    float _886 = _710 * _850;
    float _888 = _438 * _842;
    float _890 = _848 * 6.283185482025146484375;
    float _892 = cos(_890);
    float _894 = _882 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _896 = _884 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _898 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _852);
    float _900 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _854);
    bool _902 = _854 != 0.0;
    bool _904 = isnan(_854);
    bool _906 = _902 || _904;
    bool _908 = isnan(0.0);
    bool _910 = _906 || _908;
    float _912 = _762;
    if (_864)
    {
        _636 = _522;
    }
    float _914 = _636;
    float _916 = _860 * 6.283185482025146484375;
    float _918 = cos(_916);
    bool _920 = _852 == 0.0;
    bool _922 = !_910;
    bool _924 = _920 && _922;
    float _926 = _914;
    if (!_864)
    {
        _638 = _522;
    }
    float _928 = _638;
    float _930 = _928;
    if (_876)
    {
        float _932 = -_914;
        float _934 = _932 + 1.0;
        _926 = _934;
    }
    float _936 = _926;
    bool _938 = _856 == 0.0;
    bool _940 = _938 && _924;
    float _942 = _848 * 6.283185482025146484375;
    float _944 = sin(_942);
    float _946 = _892 * _880;
    float _948 = _892 * _868;
    if (_864)
    {
        _930 = _936;
    }
    float _950 = _930;
    float _952 = _860 * 6.283185482025146484375;
    float _954 = sin(_952);
    float _956 = _892 * _918;
    float _958 = _880 * _918;
    float _960 = _868 * _918;
    float _962 = _944 * _880;
    float _964 = _944 * _868;
    float _966 = _886 * _894;
    float _968 = _886 * _896;
    float _970 = _944 * _918;
    float _972 = _898 * _966;
    float _974 = _888 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _976 = -_948;
    float _978 = fma(_954, _962, _976);
    float _980 = -_962;
    float _982 = fma(_954, _948, _980);
    float _984 = _900 * _968;
    float _986 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _856);
    float _988 = _886 * _974;
    float _990 = fma(_954, _946, _964);
    float _992 = _956 * _984;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _998 = -_984;
    float _1000 = _954 * _998;
    float _1002 = _986 * _988;
    float _1004 = fma(_990, _972, _992);
    float _1006 = _970 * _984;
    float _1008 = fma(_958, _972, _1000);
    float _1010 = 1.0 / _996;
    float _1012 = fma(_982, _1002, _1004);
    float _1014 = fma(_954, _964, _946);
    float _1016 = fma(_978, _972, _1006);
    float _1018 = fma(_960, _1002, _1008);
    float _1020 = _1012 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1022 = _1012 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1024 = fma(_1014, _1002, _1016);
    float _1026 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1020);
    float _1028 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1022);
    float _1030 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1026);
    float _1032 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1028);
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1034;
    float _1038 = _516 + _1030;
    float _1040 = _632 + _1032;
    float _1042 = in.m_55.y;
    float _1044 = _1036 * _1010;
    float _1046 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1048 = _1038 + _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1052 = _1040 + _1050;
    float _1054 = in.m_61.x;
    float _1056 = in.m_61.y;
    float _1058 = in.m_61.z;
    float _1060 = fma(_1044, _512, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1062 = _1048 * _1048;
    float _1064 = _1052 * _1052;
    float _1066 = _1060 * _562;
    float _1068 = _1062 + _1064;
    float _1070 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1066);
    float _1072 = sqrt(_1068);
    float _1074 = -_1042;
    float _1076 = _1074 + 1.0;
    float _1078 = _1056;
    float _1080 = _1042;
    float _1082 = _1054;
    float _1084 = _1058;
    float _1086 = _1062;
    float _1088 = _1064;
    float _1090 = _1038;
    float _1092 = _1040;
    if (!_940)
    {
        float _1094 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1056);
        _1078 = _1094;
    }
    float _1096 = _1078;
    float _1098 = _1012 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    if (_872)
    {
        float _1100 = _764 ? _1076 : _1042;
        _1080 = _1100;
    }
    float _1102 = _1080;
    if (!_940)
    {
        float _1104 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1054);
        _1082 = _1104;
    }
    float _1106 = _1082;
    bool _1108 = _1072 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1110 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1098);
    float _1112 = -_1096;
    float _1114 = _954 * _1112;
    float _1116 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1118 = _956 * _1096;
    float _1120 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1110);
    float _1122 = _970 * _1096;
    float _1124 = fma(_958, _1106, _1114);
    float _1126 = fma(_990, _1106, _1118);
    float _1128 = _648 + _1120;
    float _1130 = fma(_978, _1106, _1122);
    float _1132 = _1106;
    if (!_940)
    {
        float _1134 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1058);
        _1084 = _1134;
    }
    float _1136 = _1084;
    float _1138 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1070);
    if (!_1108)
    {
        _1132 = _1128;
    }
    float _1140 = _1132;
    bool _1142 = !_1108;
    float _1144 = _1140;
    if (!_1142)
    {
        float _1146 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1148 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1150 = _1072 + _1148;
        float _1152 = _1128 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1154 = rsqrt(_1068);
        float _1156 = _1150 * _1146;
        float _1158 = _1156 * 0.15915493667125701904296875;
        float _1160 = _1158 * 6.283185482025146484375;
        float _1162 = sin(_1160);
        float _1164 = _1158 * 6.283185482025146484375;
        float _1166 = cos(_1164);
        float _1168 = fma(_1162, _1152, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1170 = _1154 * _1168;
        float _1172 = _1166 + (-1.0);
        float _1174 = fma(_1048, _1170, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1176 = fma(_1052, _1170, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1178 = _1172 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1180 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1182 = _1174 + _1180;
        float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1186 = _1176 + _1184;
        float _1188 = fma(_1128, _1166, _1178);
        float _1190 = _1182 * _1182;
        float _1192 = _1186 * _1186;
        _1144 = _1188;
        _1086 = _1190;
        _1088 = _1192;
        _1090 = _1174;
        _1092 = _1176;
    }
    float _1194 = _1144;
    float _1196 = _1086;
    float _1198 = _1088;
    float _1200 = _1090;
    float _1202 = _1092;
    float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1206 = _1194 + _1204;
    float _1208 = fma(_982, _1136, _1126);
    float _1210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1212 = fma(_960, _1136, _1124);
    float _1214 = fma(_1206, _1206, _1196);
    float _1216 = _1208 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1218 = _1208 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1220 = _1208 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1222 = _1214 + _1198;
    float _1224 = fma(_1212, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1216);
    float _1226 = fma(_1212, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1218);
    float _1228 = fma(_1212, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1220);
    float _1230 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1232 = sqrt(_1222);
    float _1234 = fma(_1014, _1136, _1130);
    float _1236 = _950 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1244 = _1230 * _1116;
    float _1246 = _1138 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1248 = _1236 * _1210;
    float _1250 = fma(_1234, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1224);
    float _1252 = fma(_1234, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1226);
    float _1254 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1256 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1258 = _1242 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1260 = fma(_1234, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1228);
    out.m_63.x = _1248;
    out.m_63.y = _1244;
    bool _1262 = _1232 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1264 = isnan(_1232);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1270 = _1266 || _1268;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    out.m_67.x = _1254;
    out.m_67.y = _1256;
    out.m_67.z = _1258;
    out.m_67.w = _1246;
    out.m_69.x = _1250;
    out.m_69.y = _1252;
    out.m_69.z = _1260;
    float _1272 = _1224;
    float _1274 = _1254;
    if (!_1270)
    {
        _1272 = 1.0;
    }
    float _1276 = _1272;
    bool _1278 = !_1270;
    float _1280 = _1276;
    if (!_1278)
    {
        bool _1282 = _1232 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1284 = isnan(_1232);
        bool _1286 = _1282 || _1284;
        bool _1288 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1290 = _1286 || _1288;
        if (!_1290)
        {
            float _1292 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1294 = _1232 + _1292;
            float _1296 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1298 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1296;
            float _1300 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1302 = _1300 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1304 = 1.0 / _1298;
            float _1306 = _1294 * _1304;
            float _1308 = fma(_1306, _1302, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1280 = _1308;
            _1310 = true;
        }
        else
        {
            bool _1312 = _1232 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1314 = isnan(_1232);
            bool _1316 = _1312 || _1314;
            bool _1318 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1320 = _1316 || _1318;
            if (!_1320)
            {
                float _1322 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1324 = _1232 + _1322;
                float _1326 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1328 = _1326 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1330 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1332 = _1330 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1334 = 1.0 / _1328;
                float _1336 = _1324 * _1334;
                float _1338 = fma(_1336, _1332, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1280 = _1338;
                _1310 = true;
            }
            else
            {
                _1280 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1310 = false;
    float _1340 = _1280;
    float _1342 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1344 = _1194 + _1342;
    float _1346 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1348 = _1200 + _1346;
    float _1350 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1352 = _1202 + _1350;
    bool _1354 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1356 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan(0.5);
    bool _1362 = _1358 || _1360;
    float _1364 = fma(_1344, _1340, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1366 = fma(_1348, _1340, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1368 = fma(_1352, _1340, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1370 = -_768;
    float _1372 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[18].w, _516);
    float _1374 = -_762;
    float _1376 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1364);
    float _1378 = -_768;
    float _1380 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1366);
    float _1382 = -_800;
    float _1384 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1368);
    float _1386 = -_762;
    float _1388 = fma(_1386, (*spvDescriptorSet0.vp_c9)._m0[18].w, _648);
    float _1390 = -_800;
    float _1392 = fma(_1390, (*spvDescriptorSet0.vp_c9)._m0[18].w, _632);
    float _1394 = _1380;
    float _1396 = _1384;
    if (_1362)
    {
        _912 = _1376;
    }
    float _1398 = _912;
    float _1400 = _1398;
    if (!_1362)
    {
        float _1402 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1404 = _1388 + _1402;
        float _1406 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1408 = _1372 + _1406;
        float _1410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1412 = -_632;
        float _1414 = _1412 + _1368;
        float _1416 = _1404 * _1404;
        float _1418 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1420 = _1392 + _1418;
        float _1422 = -_648;
        float _1424 = _1422 + _1364;
        float _1426 = fma(_1408, _1408, _1416);
        float _1428 = -_516;
        float _1430 = _1428 + _1366;
        float _1432 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1434 = fma(_1420, _1420, _1426);
        float _1436 = sqrt(_1434);
        float _1438 = 1.0 / _886;
        float _1440 = precise::min(_1436, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1442 = _1440 * _1410;
        float _1444 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1446 = _1442 * _1438;
        float _1448 = _1444 * _1446;
        float _1450 = _1414 * _1446;
        float _1452 = fma(_1430, _1448, _1372);
        float _1454 = fma(_1424, _1448, _1388);
        float _1456 = fma(_1444, _1450, _1392);
        _1400 = _1454;
        _1394 = _1452;
        _1396 = _1456;
        _714 = _1424;
        _640 = _1450;
    }
    float _1458 = _1400;
    float _1460 = _1394;
    float _1462 = _1396;
    float _1464 = _714;
    float _1466 = _640;
    float _1468 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1470 = _1458 + _1468;
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1474 = _1460 + _1472;
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1478 = _1462 + _1476;
    float _1480 = _1470 * _1470;
    float _1482 = fma(_1474, _1474, _1480);
    float _1484 = fma(_1478, _1478, _1482);
    float _1486 = rsqrt(_1484);
    float _1488 = sqrt(_1484);
    float _1490 = _1486 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1492 = _1474 * _1490;
    float _1494 = _1478 * _1490;
    float _1496 = _1492 * _1492;
    float _1498 = _1494 * _1494;
    float _1500 = _1496 + _1498;
    float _1502 = sqrt(_1500);
    bool _1504 = _1502 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1506 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1508 = _1502 + _1506;
    float _1510 = _1482;
    float _1512 = _1500;
    float _1514 = _1508;
    float _1516 = _1464;
    float _1518 = _1492;
    if (_1504)
    {
        float _1520 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1510 = _1520;
    }
    float _1522 = _1510;
    if (_1504)
    {
        float _1524 = rsqrt(_1500);
        _1512 = _1524;
    }
    float _1526 = _1512;
    float _1528 = _1526;
    if (_1504)
    {
        float _1530 = _1508 * _1522;
        _1514 = _1530;
    }
    float _1532 = _1514;
    if (_1504)
    {
        float _1534 = _1532 * 0.15915493667125701904296875;
        _1516 = _1534;
    }
    float _1536 = _1516;
    float _1538 = _1522;
    float _1540 = _1536;
    if (_1504)
    {
        float _1542 = _1536 * 6.283185482025146484375;
        float _1544 = sin(_1542);
        _1538 = _1544;
    }
    float _1546 = _1538;
    float _1548 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1550 = precise::max(0.0, _1548);
    float _1552 = _1466;
    float _1554 = _1550;
    if (_1504)
    {
        float _1556 = _1536 * 6.283185482025146484375;
        float _1558 = cos(_1556);
        _1552 = _1558;
    }
    float _1560 = _1552;
    float _1562 = -_1490;
    float _1564 = -_1550;
    float _1566 = fma(_1470, _1562, _1564);
    if (_1504)
    {
        float _1568 = _1566 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1554 = _1568;
    }
    float _1570 = _1554;
    float _1572 = _1546;
    float _1574 = _1570;
    if (_1504)
    {
        float _1576 = fma(_1546, _1570, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1572 = _1576;
    }
    float _1578 = _1572;
    float _1580 = _1578;
    float _1582 = _1560;
    if (_1504)
    {
        float _1584 = _1560 + (-1.0);
        _1574 = _1584;
    }
    float _1586 = _1574;
    float _1588 = _1586;
    if (_1504)
    {
        float _1590 = _1526 * _1578;
        _1274 = _1590;
    }
    float _1592 = _1274;
    if (!_1504)
    {
        _1580 = _1566;
    }
    float _1594 = _1580;
    float _1596 = _1594;
    if (_1504)
    {
        float _1598 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1540 = _1598;
    }
    float _1600 = _1540;
    if (_1504)
    {
        float _1602 = _1492 * _1592;
        _1518 = _1602;
    }
    float _1604 = _1518;
    if (!_1504)
    {
        _1588 = _1494;
    }
    float _1606 = _1588;
    float _1608 = _1606;
    if (_1504)
    {
        float _1610 = _1494 * _1592;
        _1608 = _1610;
    }
    float _1612 = _1608;
    if (!_1504)
    {
        _1528 = _1496;
    }
    float _1614 = _1528;
    float _1616 = _1614;
    if (_1504)
    {
        float _1618 = fma(_1566, _1560, _1600);
        _1596 = _1618;
    }
    float _1620 = _1596;
    if (_1504)
    {
        float _1622 = _1604 * _1604;
        _1616 = _1622;
    }
    float _1624 = _1616;
    if (!_1504)
    {
        _1582 = _1498;
    }
    float _1626 = _1582;
    float _1628 = _1626;
    if (_1504)
    {
        float _1630 = _1612 * _1612;
        _1628 = _1630;
    }
    float _1632 = _1628;
    float _1634 = fma(_1620, _1620, _1624);
    float _1636 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1638 = _1634 + _1632;
    float _1640 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1642 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1644 = fma(_1488, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1642);
    float _1646 = precise::clamp(_1644, 0.0, 1.0);
    float _1648 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1650 = rsqrt(_1638);
    float _1652 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1640);
    float _1654 = -_1646;
    float _1656 = _1654 + 1.0;
    float _1658 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1660 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1662 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1652);
    float _1664 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1636);
    float _1666 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1658);
    float _1668 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1660);
    float _1670 = _1662 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1672 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1664);
    float _1674 = abs(_1656);
    float _1676 = log2(_1674);
    float _1678 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1666);
    float _1680 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1682 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1684 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1668);
    float _1686 = _1650 * _1604;
    float _1688 = -_1680;
    float _1690 = fma(_1688, _1648, 1.0);
    float _1692 = _1650 * _1620;
    float _1694 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1696 = _1686 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1698 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1700 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1702 = _1650 * _1612;
    float _1704 = -_1696;
    float _1706 = fma(_1692, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1704);
    float _1708 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1698);
    float _1710 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1712 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1714 = -_1702;
    float _1716 = fma(_1714, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1706);
    float _1718 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1708);
    float _1720 = log2(_1690);
    float _1722 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1724 = fma(_1716, -0.5, 0.5);
    float _1726 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1718);
    float _1728 = fma(_1716, 0.5, 0.5);
    float _1730 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1710);
    float _1732 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1722);
    float _1734 = _1692 + 1.0;
    float _1736 = exp2(_1712);
    float _1738 = fma(_1728, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1740 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1730);
    float _1742 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1732);
    float _1744 = fma(_1728, _1738, -0.212114393711090087890625);
    float _1746 = 1.0 / _1726;
    float _1748 = fma(_1728, _1744, 1.570728778839111328125);
    float _1750 = _1720 * 0.693147182464599609375;
    float _1752 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1754 = sqrt(_1724);
    float _1756 = -_1692;
    float _1758 = fma(_1736, _1734, _1756);
    float _1760 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1740);
    float _1762 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1742);
    float _1764 = _1760 * _1746;
    float _1766 = _1762 * _1746;
    float _1768 = fma(_1764, 0.5, 0.5);
    float _1770 = fma(_1766, -0.5, 0.5);
    float _1772 = fma(_1758, 0.5, 0.5);
    float _1774 = _1754 * 0.636619746685028076171875;
    float _1776 = -_1748;
    float _1778 = fma(_1774, _1776, 1.0);
    float3 _4740 = float3(_1768, _1770, _1752);
    float _1780 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4740, float3(0.0), isnan(_4740)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4740, float3(0.0), isnan(_4740)), level(0.0)).x;
    float3 _4751 = float3(_1768, _1770, _1752);
    float4 _1783 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4751, float3(0.0), isnan(_4751)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4751, float3(0.0), isnan(_4751)), level(0.0)).xyzw;
    float _1785 = _1783.x;
    float _1787 = _1783.y;
    float _1789 = _1783.z;
    float _1791 = _1783.w;
    float2 _4768 = float2(_1778, _1772);
    float3 _1795 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4768, float2(0.0), isnan(_4768)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4768, float2(0.0), isnan(_4768)), level(0.0)).xyz;
    float _1797 = _1795.x;
    float _1799 = _1795.y;
    float _1801 = _1795.z;
    float _1803 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1805 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1807 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1803);
    float _1809 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1805);
    float _1811 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1807);
    float _1813 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1809);
    float _1815 = _1811 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1817 = _1813 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1819 = 1.0 / _1815;
    float _1821 = _1817 + _1815;
    float _1823 = _1821 * _1819;
    float _1825 = _1823 * 0.5;
    float _1827 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1829 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1831 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1829);
    float _1833 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1827);
    bool _1835 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1837 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan(0.5);
    bool _1843 = _1839 || _1841;
    float _1845 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1847 = 1.0 / _1831;
    float _1849 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1833);
    float _1851 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1849);
    float _1853 = exp2(_1845);
    float _1855 = _1676;
    float _1857 = _1670;
    if (_1843)
    {
        _1855 = 1.0;
    }
    float _1859 = _1855;
    float _1861 = _1859;
    if (_1843)
    {
        _1857 = 1.0;
    }
    float _1863 = _1857;
    float _1865 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1867 = _1847 * _1865;
    float _1869 = _1863;
    if (!_1843)
    {
        float _1871 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1873 = _1871 * 0.15915493667125701904296875;
        float _1875 = _1873 * 6.283185482025146484375;
        float _1877 = cos(_1875);
        float _1879 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1881 = _1879 * 0.15915493667125701904296875;
        float _1883 = _1873 * 6.283185482025146484375;
        float _1885 = sin(_1883);
        float _1887 = 1.0 / _1877;
        float _1889 = _1881 * 6.283185482025146484375;
        float _1891 = cos(_1889);
        float _1893 = _1885 * _1887;
        float _1895 = _1881 * 6.283185482025146484375;
        float _1897 = sin(_1895);
        float _1899 = _1891 * _1893;
        float _1901 = 1.0 / _1899;
        float _1903 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1905 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1903;
        float _1907 = 1.0 / _1905;
        float _1909 = _1897 * _1901;
        float _1911 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1913 = fma(_1867, _1909, _1911);
        float _1915 = _1913 * _1907;
        float _1917 = precise::clamp(_1915, 0.0, 1.0);
        _1861 = _1917;
    }
    float _1919 = _1861;
    if (!_1843)
    {
        float _1921 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1923 = _1921 * 0.15915493667125701904296875;
        float _1925 = _1923 * 6.283185482025146484375;
        float _1927 = cos(_1925);
        float _1929 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1931 = _1929 * 0.15915493667125701904296875;
        float _1933 = _1923 * 6.283185482025146484375;
        float _1935 = sin(_1933);
        float _1937 = 1.0 / _1927;
        float _1939 = _1931 * 6.283185482025146484375;
        float _1941 = cos(_1939);
        float _1943 = _1935 * _1937;
        float _1945 = _1931 * 6.283185482025146484375;
        float _1947 = sin(_1945);
        float _1949 = _1941 * _1943;
        float _1951 = 1.0 / _1949;
        float _1953 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1955 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1953;
        float _1957 = 1.0 / _1955;
        float _1959 = _1947 * _1951;
        float _1961 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1963 = fma(_1867, _1959, _1961);
        float _1965 = _1963 * _1957;
        float _1967 = precise::clamp(_1965, 0.0, 1.0);
        float _1969 = -_1967;
        float _1971 = _1969 + 1.0;
        _1869 = _1971;
    }
    float _1973 = _1869;
    float _1975 = -_1853;
    float _1977 = _1975 + 1.0;
    bool _1979 = _1919 > 0.0;
    bool _1981 = isnan(_1919);
    bool _1983 = _1979 || _1981;
    bool _1985 = isnan(0.0);
    bool _1987 = _1983 || _1985;
    float _1989 = _1919 * _1973;
    float _1991 = _1726 * 0.5;
    float _1993 = _1977 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1995 = _1973 <= 0.0;
    bool _1997 = !_1987;
    bool _1999 = _1995 || _1997;
    float _2001 = _1851 + _1726;
    float _2003 = _1760 + _1726;
    float _2005 = _1993 * _1780;
    float _2007 = -_1993;
    float _2009 = _2007 + 1.0;
    float _2011 = _1989 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2013 = fma(_1762, -0.5, _1991);
    float _2015 = _1791 * _2005;
    float _2017 = _1801 * _2005;
    out.m_71.x = _1474;
    out.m_71.y = _1470;
    out.m_71.z = _1478;
    float _2019 = fma(_1797, _2015, _1785);
    float _2021 = fma(_1799, _2015, _1787);
    float _2023 = _1791 * _2009;
    float _2025 = _2001 * 0.5;
    float _2027 = _2003 * 0.5;
    float _2029 = _2011 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2031 = fma(_1791, _2017, _1789);
    out.gl_Position.x = _1760;
    out.gl_Position.y = _1762;
    out.gl_Position.z = _1851;
    out.gl_Position.w = _1726;
    out.m_73.x = _2027;
    out.m_73.y = _2013;
    out.m_73.z = _2025;
    out.m_73.w = _1726;
    out.m_47.x = _2029;
    out.m_75.x = _2019;
    out.m_75.y = _2021;
    out.m_75.z = _2031;
    out.m_75.w = _2023;
    if (!_1999)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2033 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2033;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1310 = false;
    bool _460 = false;
    bool _292 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_47.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2090 = as_type<float>(_110);
        out.gl_Position.z = _2090;
    }
    if (!_98)
    {
        return out;
    }
    float _114 = in.m_49.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = _128;
    if (_124)
    {
        float _132 = float(_94);
        _104 = _132;
    }
    float _134 = _104;
    bool _136 = _128 >= _134;
    bool _138 = !_124;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_140)
    {
        out.m_47.x = 0.0;
    }
    if (_140)
    {
        float _146 = _144 * 5.0;
        _112 = as_type<int>(_146);
    }
    int _148 = _112;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2160 = as_type<float>(_148);
        out.gl_Position.z = _2160;
    }
    if (_140)
    {
        return out;
    }
    float _150 = in.m_51.w;
    float _152 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_49.x;
    float _166 = in.m_49.y;
    float _168 = in.m_49.z;
    float _170 = in.m_44.x;
    float _172 = in.m_44.y;
    float _174 = in.m_44.z;
    float _176 = 0.0;
    float _178 = _152;
    if (!_162)
    {
        float _180 = _152 * _152;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_162)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    bool _192 = !_162;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _152 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _152);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _224;
    }
    float _226 = _194;
    bool _228 = !_162;
    if (!_228)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = 1.0 / _236;
        float _240 = _152 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _178 = _248;
    }
    float _250 = _178;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _254 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = fma(_250, _164, _254);
    float _262 = fma(_250, _166, _256);
    float _264 = fma(_250, _168, _258);
    float _266 = fma(_260, _150, _170);
    float _268 = fma(_262, _150, _172);
    float _270 = fma(_264, _150, _174);
    bool _272 = !_252;
    float _290;
    if (!_272)
    {
        float _274 = in.m_53.x;
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _278 = _274 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _282 = _280 * _276;
        float _284 = floor(_282);
        float _286 = -_284;
        float _288 = _282 + _286;
        _290 = _288;
        _292 = true;
    }
    else
    {
        float _294 = float(_94);
        float _296 = 1.0 / _294;
        float _298 = _128 * _296;
        _290 = _298;
    }
    _292 = false;
    float _300 = _290;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _300 + _302;
    bool _306 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _308 = isnan(_300);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _320 = _300 + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _330 = 1.0 / _324;
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _334 = 1.0 / _328;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _336;
    float _340 = _304 * _330;
    bool _342 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _344 = isnan(_300);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -_316;
    float _356 = _354 + 1.0;
    bool _358 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _360 = isnan(_300);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = fma(_338, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _372 = _368 * _356;
    float _374 = -_368;
    float _376 = _374 + 1.0;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    float _386 = _320 * _334;
    float _388 = _352 * _376;
    float _390 = fma(_380, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _392 = fma(_384, _340, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _394 = -_352;
    float _396 = _394 + 1.0;
    float _398 = _370 * _388;
    float _400 = _390 * _388;
    float _402 = _392 * _388;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[143].x, _400);
    float _418 = fma(_406, _386, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _420 = fma(_410, _386, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _422 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[143].y, _398);
    float _424 = fma(_414, _386, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[143].z, _402);
    float _428 = fma(_418, _372, _416);
    float _430 = fma(_420, _372, _422);
    float _432 = fma(_424, _372, _426);
    float _434 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[145].x, _428);
    float _436 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[145].y, _430);
    float _438 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[145].z, _432);
    bool _440 = !_332;
    float _458;
    if (!_440)
    {
        float _442 = in.m_53.x;
        float _444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _446 = _442 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _448 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _450 = _448 * _444;
        float _452 = floor(_450);
        float _454 = -_452;
        float _456 = _450 + _454;
        _458 = _456;
        _460 = true;
    }
    else
    {
        float _462 = float(_94);
        float _464 = 1.0 / _462;
        float _466 = _128 * _464;
        _458 = _466;
    }
    _460 = false;
    float _468 = _458;
    float _470 = in.m_53.x;
    float _472 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _474 = log2(_472);
    float _476 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _478 = in.m_53.z;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _486 = _484 != 0;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _490 = _488 != 0;
    float _492 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _494 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _496 = in.m_53.y;
    float _498 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _476);
    float _500 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _492);
    float _502 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _494);
    float _504 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].z, _498);
    float _506 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].z, _500);
    float _508 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].z, _502);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _512 = _468 + _510;
    float _514 = _474 * _128;
    float _516 = _506 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _518 = !_486;
    int _520 = _518 ? 0 : 1;
    float _522 = in.m_55.x;
    bool _524 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _526 = isnan(_468);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _538 = _516 + _536;
    float _540 = _470 * 2.0;
    bool _542 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _544 = isnan(_468);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    float _554 = -_534;
    float _556 = _554 + 1.0;
    float _558 = _478 * 2.0;
    float _560 = floor(_540);
    float _562 = _552 * _556;
    float _564 = _496 + _478;
    float _566 = _496 * 2.0;
    float _568 = -_552;
    float _570 = _568 + 1.0;
    float _572 = _564 + (-1.0);
    float _574 = floor(_558);
    float _576 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _578 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _580 = isnan(1.0);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _586 = _582 || _584;
    float _588 = floor(_566);
    bool _590 = _560 > 0.0;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _594 = 1.0 + _592;
    bool _596 = _560 >= 0.0;
    bool _598 = isnan(_560);
    bool _600 = _596 || _598;
    bool _602 = isnan(0.0);
    bool _604 = _600 || _602;
    float _606 = _470 + _478;
    int _608 = _604 ? 0 : 1;
    float _610 = exp2(_514);
    bool _612 = _574 > 0.0;
    float _614 = _606 + (-1.0);
    int _616 = ~_608;
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    bool _622 = _574 >= 0.0;
    bool _624 = isnan(_574);
    bool _626 = _622 || _624;
    bool _628 = isnan(0.0);
    bool _630 = _626 || _628;
    float _632 = _508 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _634 = _620;
    float _636 = _556;
    float _638 = _496;
    float _640 = _632;
    if (!_590)
    {
        int _642 = ~_608;
        int _644 = _642 + 1;
        _634 = _644;
    }
    int _646 = _634;
    float _648 = _504 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _650 = 1.0 / _594;
    float _652 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _654 = _632 + _652;
    float _656 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _658 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _660 = _648 + _658;
    bool _662 = _588 > 0.0;
    int _664 = abs(_520);
    float _666 = _660 * _660;
    bool _668 = !_482;
    int _670 = _668 ? 0 : 1;
    float _672 = -_610;
    float _674 = _672 + 1.0;
    int _676 = _630 ? 0 : 1;
    float _678 = fma(_538, _538, _666);
    bool _680 = _588 >= 0.0;
    bool _682 = isnan(_588);
    bool _684 = _680 || _682;
    bool _686 = isnan(0.0);
    bool _688 = _684 || _686;
    float _690 = in.m_57.x;
    float _692 = in.m_57.y;
    float _694 = in.m_57.z;
    int _696 = abs(_670);
    float _698 = fma(_654, _654, _678);
    int _700 = ~_676;
    int _702 = _700 + 1;
    int _704 = _702 + 1;
    float _706 = float(_664);
    float _708 = float(_646);
    float _710 = rsqrt(_698);
    int _712 = _704;
    float _714 = _648;
    if (!_612)
    {
        int _716 = ~_676;
        int _718 = _716 + 1;
        _712 = _718;
    }
    int _720 = _712;
    bool _722 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _724 = isnan(0.0);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _730 = _726 || _728;
    float _732 = _706 * _708;
    int _734 = _688 ? 0 : 1;
    float _736 = _730 ? _674 : 0.0;
    int _738 = ~_734;
    int _740 = _738 + 1;
    int _742 = _740 + 1;
    float _744 = float(_696);
    int _746 = _742;
    if (_586)
    {
        float _748 = _736 * _650;
        _130 = _748;
    }
    float _750 = _130;
    float _752 = float(_720);
    float _754 = _732 * (-2.0);
    if (!_662)
    {
        int _756 = ~_734;
        int _758 = _756 + 1;
        _746 = _758;
    }
    int _760 = _746;
    float _762 = _660 * _710;
    bool _764 = _496 > 0.5;
    float _766 = _744 * _752;
    float _768 = _538 * _710;
    float _770 = -_762;
    float _772 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[18].w, _660);
    float _774 = fma(_576, _754, _576);
    bool _776 = !_490;
    int _778 = _776 ? 0 : 1;
    float _780 = -_768;
    float _782 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[18].w, _538);
    float _784 = _772 * _772;
    float _786 = fma(_754, _692, _692);
    float _788 = _496 + (-0.5);
    float _790 = float(_760);
    float _792 = fma(_782, _782, _784);
    int _794 = abs(_778);
    float _796 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[196].y, _786);
    float _798 = _470 + _496;
    float _800 = _654 * _710;
    float _802 = float(_794);
    float _804 = _798 + (-1.0);
    float _806 = fma(_774, _750, _796);
    float _808 = _766 * (-2.0);
    float _810 = -_800;
    float _812 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[18].w, _654);
    float _814 = _802 * _790;
    float _816 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _818 = _470 + (-0.5);
    float _820 = fma(_808, _690, _690);
    float _822 = _814 * (-2.0);
    float _824 = fma(_816, _808, _816);
    float _826 = fma(_812, _812, _792);
    float _828 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[196].x, _820);
    float _830 = fma(_656, _822, _656);
    float _832 = fma(_822, _694, _694);
    float _834 = _478 + (-0.5);
    float _836 = fma(_824, _750, _828);
    float _838 = in.m_51.x;
    float _840 = in.m_51.y;
    float _842 = in.m_51.z;
    float _844 = _806 * 0.15915493667125701904296875;
    float _846 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[196].z, _832);
    float _848 = _836 * 0.15915493667125701904296875;
    float _850 = sqrt(_826);
    float _852 = in.m_59.x;
    float _854 = in.m_59.y;
    float _856 = in.m_59.z;
    float _858 = fma(_830, _750, _846);
    float _860 = _858 * 0.15915493667125701904296875;
    int _862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _864 = _862 != 0;
    float _866 = _844 * 6.283185482025146484375;
    float _868 = sin(_866);
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _872 = _870 != 0;
    bool _874 = _470 > 0.5;
    bool _876 = _874 && _864;
    float _878 = _844 * 6.283185482025146484375;
    float _880 = cos(_878);
    float _882 = _434 * _838;
    float _884 = _436 * _840;
    float _886 = _710 * _850;
    float _888 = _438 * _842;
    float _890 = _848 * 6.283185482025146484375;
    float _892 = cos(_890);
    float _894 = _882 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _896 = _884 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _898 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _852);
    float _900 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _854);
    bool _902 = _854 != 0.0;
    bool _904 = isnan(_854);
    bool _906 = _902 || _904;
    bool _908 = isnan(0.0);
    bool _910 = _906 || _908;
    float _912 = _762;
    if (_864)
    {
        _636 = _522;
    }
    float _914 = _636;
    float _916 = _860 * 6.283185482025146484375;
    float _918 = cos(_916);
    bool _920 = _852 == 0.0;
    bool _922 = !_910;
    bool _924 = _920 && _922;
    float _926 = _914;
    if (!_864)
    {
        _638 = _522;
    }
    float _928 = _638;
    float _930 = _928;
    if (_876)
    {
        float _932 = -_914;
        float _934 = _932 + 1.0;
        _926 = _934;
    }
    float _936 = _926;
    bool _938 = _856 == 0.0;
    bool _940 = _938 && _924;
    float _942 = _848 * 6.283185482025146484375;
    float _944 = sin(_942);
    float _946 = _892 * _880;
    float _948 = _892 * _868;
    if (_864)
    {
        _930 = _936;
    }
    float _950 = _930;
    float _952 = _860 * 6.283185482025146484375;
    float _954 = sin(_952);
    float _956 = _892 * _918;
    float _958 = _880 * _918;
    float _960 = _868 * _918;
    float _962 = _944 * _880;
    float _964 = _944 * _868;
    float _966 = _886 * _894;
    float _968 = _886 * _896;
    float _970 = _944 * _918;
    float _972 = _898 * _966;
    float _974 = _888 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _976 = -_948;
    float _978 = fma(_954, _962, _976);
    float _980 = -_962;
    float _982 = fma(_954, _948, _980);
    float _984 = _900 * _968;
    float _986 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _856);
    float _988 = _886 * _974;
    float _990 = fma(_954, _946, _964);
    float _992 = _956 * _984;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _998 = -_984;
    float _1000 = _954 * _998;
    float _1002 = _986 * _988;
    float _1004 = fma(_990, _972, _992);
    float _1006 = _970 * _984;
    float _1008 = fma(_958, _972, _1000);
    float _1010 = 1.0 / _996;
    float _1012 = fma(_982, _1002, _1004);
    float _1014 = fma(_954, _964, _946);
    float _1016 = fma(_978, _972, _1006);
    float _1018 = fma(_960, _1002, _1008);
    float _1020 = _1012 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1022 = _1012 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1024 = fma(_1014, _1002, _1016);
    float _1026 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1020);
    float _1028 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1022);
    float _1030 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1026);
    float _1032 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1028);
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1034;
    float _1038 = _516 + _1030;
    float _1040 = _632 + _1032;
    float _1042 = in.m_55.y;
    float _1044 = _1036 * _1010;
    float _1046 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1048 = _1038 + _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1052 = _1040 + _1050;
    float _1054 = in.m_61.x;
    float _1056 = in.m_61.y;
    float _1058 = in.m_61.z;
    float _1060 = fma(_1044, _512, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1062 = _1048 * _1048;
    float _1064 = _1052 * _1052;
    float _1066 = _1060 * _562;
    float _1068 = _1062 + _1064;
    float _1070 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1066);
    float _1072 = sqrt(_1068);
    float _1074 = -_1042;
    float _1076 = _1074 + 1.0;
    float _1078 = _1056;
    float _1080 = _1042;
    float _1082 = _1054;
    float _1084 = _1058;
    float _1086 = _1062;
    float _1088 = _1064;
    float _1090 = _1038;
    float _1092 = _1040;
    if (!_940)
    {
        float _1094 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1056);
        _1078 = _1094;
    }
    float _1096 = _1078;
    float _1098 = _1012 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    if (_872)
    {
        float _1100 = _764 ? _1076 : _1042;
        _1080 = _1100;
    }
    float _1102 = _1080;
    if (!_940)
    {
        float _1104 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1054);
        _1082 = _1104;
    }
    float _1106 = _1082;
    bool _1108 = _1072 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1110 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1098);
    float _1112 = -_1096;
    float _1114 = _954 * _1112;
    float _1116 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1118 = _956 * _1096;
    float _1120 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1110);
    float _1122 = _970 * _1096;
    float _1124 = fma(_958, _1106, _1114);
    float _1126 = fma(_990, _1106, _1118);
    float _1128 = _648 + _1120;
    float _1130 = fma(_978, _1106, _1122);
    float _1132 = _1106;
    if (!_940)
    {
        float _1134 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1058);
        _1084 = _1134;
    }
    float _1136 = _1084;
    float _1138 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1070);
    if (!_1108)
    {
        _1132 = _1128;
    }
    float _1140 = _1132;
    bool _1142 = !_1108;
    float _1144 = _1140;
    if (!_1142)
    {
        float _1146 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1148 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1150 = _1072 + _1148;
        float _1152 = _1128 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1154 = rsqrt(_1068);
        float _1156 = _1150 * _1146;
        float _1158 = _1156 * 0.15915493667125701904296875;
        float _1160 = _1158 * 6.283185482025146484375;
        float _1162 = sin(_1160);
        float _1164 = _1158 * 6.283185482025146484375;
        float _1166 = cos(_1164);
        float _1168 = fma(_1162, _1152, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1170 = _1154 * _1168;
        float _1172 = _1166 + (-1.0);
        float _1174 = fma(_1048, _1170, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1176 = fma(_1052, _1170, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1178 = _1172 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1180 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1182 = _1174 + _1180;
        float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1186 = _1176 + _1184;
        float _1188 = fma(_1128, _1166, _1178);
        float _1190 = _1182 * _1182;
        float _1192 = _1186 * _1186;
        _1144 = _1188;
        _1086 = _1190;
        _1088 = _1192;
        _1090 = _1174;
        _1092 = _1176;
    }
    float _1194 = _1144;
    float _1196 = _1086;
    float _1198 = _1088;
    float _1200 = _1090;
    float _1202 = _1092;
    float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1206 = _1194 + _1204;
    float _1208 = fma(_982, _1136, _1126);
    float _1210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1212 = fma(_960, _1136, _1124);
    float _1214 = fma(_1206, _1206, _1196);
    float _1216 = _1208 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1218 = _1208 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1220 = _1208 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1222 = _1214 + _1198;
    float _1224 = fma(_1212, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1216);
    float _1226 = fma(_1212, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1218);
    float _1228 = fma(_1212, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1220);
    float _1230 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1232 = sqrt(_1222);
    float _1234 = fma(_1014, _1136, _1130);
    float _1236 = _950 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1244 = _1230 * _1116;
    float _1246 = _1138 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1248 = _1236 * _1210;
    float _1250 = fma(_1234, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1224);
    float _1252 = fma(_1234, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1226);
    float _1254 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1256 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1258 = _1242 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1260 = fma(_1234, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1228);
    out.m_63.x = _1248;
    out.m_63.y = _1244;
    bool _1262 = _1232 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1264 = isnan(_1232);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1270 = _1266 || _1268;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    out.m_67.x = _1254;
    out.m_67.y = _1256;
    out.m_67.z = _1258;
    out.m_67.w = _1246;
    out.m_69.x = _1250;
    out.m_69.y = _1252;
    out.m_69.z = _1260;
    float _1272 = _1224;
    float _1274 = _1254;
    if (!_1270)
    {
        _1272 = 1.0;
    }
    float _1276 = _1272;
    bool _1278 = !_1270;
    float _1280 = _1276;
    if (!_1278)
    {
        bool _1282 = _1232 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1284 = isnan(_1232);
        bool _1286 = _1282 || _1284;
        bool _1288 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1290 = _1286 || _1288;
        if (!_1290)
        {
            float _1292 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1294 = _1232 + _1292;
            float _1296 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1298 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1296;
            float _1300 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1302 = _1300 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1304 = 1.0 / _1298;
            float _1306 = _1294 * _1304;
            float _1308 = fma(_1306, _1302, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1280 = _1308;
            _1310 = true;
        }
        else
        {
            bool _1312 = _1232 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1314 = isnan(_1232);
            bool _1316 = _1312 || _1314;
            bool _1318 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1320 = _1316 || _1318;
            if (!_1320)
            {
                float _1322 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1324 = _1232 + _1322;
                float _1326 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1328 = _1326 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1330 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1332 = _1330 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1334 = 1.0 / _1328;
                float _1336 = _1324 * _1334;
                float _1338 = fma(_1336, _1332, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1280 = _1338;
                _1310 = true;
            }
            else
            {
                _1280 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1310 = false;
    float _1340 = _1280;
    float _1342 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1344 = _1194 + _1342;
    float _1346 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1348 = _1200 + _1346;
    float _1350 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1352 = _1202 + _1350;
    bool _1354 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1356 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan(0.5);
    bool _1362 = _1358 || _1360;
    float _1364 = fma(_1344, _1340, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1366 = fma(_1348, _1340, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1368 = fma(_1352, _1340, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1370 = -_768;
    float _1372 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[18].w, _516);
    float _1374 = -_762;
    float _1376 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1364);
    float _1378 = -_768;
    float _1380 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1366);
    float _1382 = -_800;
    float _1384 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1368);
    float _1386 = -_762;
    float _1388 = fma(_1386, (*spvDescriptorSet0.vp_c9)._m0[18].w, _648);
    float _1390 = -_800;
    float _1392 = fma(_1390, (*spvDescriptorSet0.vp_c9)._m0[18].w, _632);
    float _1394 = _1380;
    float _1396 = _1384;
    if (_1362)
    {
        _912 = _1376;
    }
    float _1398 = _912;
    float _1400 = _1398;
    if (!_1362)
    {
        float _1402 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1404 = _1388 + _1402;
        float _1406 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1408 = _1372 + _1406;
        float _1410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1412 = -_632;
        float _1414 = _1412 + _1368;
        float _1416 = _1404 * _1404;
        float _1418 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1420 = _1392 + _1418;
        float _1422 = -_648;
        float _1424 = _1422 + _1364;
        float _1426 = fma(_1408, _1408, _1416);
        float _1428 = -_516;
        float _1430 = _1428 + _1366;
        float _1432 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1434 = fma(_1420, _1420, _1426);
        float _1436 = sqrt(_1434);
        float _1438 = 1.0 / _886;
        float _1440 = precise::min(_1436, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1442 = _1440 * _1410;
        float _1444 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1446 = _1442 * _1438;
        float _1448 = _1444 * _1446;
        float _1450 = _1414 * _1446;
        float _1452 = fma(_1430, _1448, _1372);
        float _1454 = fma(_1424, _1448, _1388);
        float _1456 = fma(_1444, _1450, _1392);
        _1400 = _1454;
        _1394 = _1452;
        _1396 = _1456;
        _714 = _1424;
        _640 = _1450;
    }
    float _1458 = _1400;
    float _1460 = _1394;
    float _1462 = _1396;
    float _1464 = _714;
    float _1466 = _640;
    float _1468 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1470 = _1458 + _1468;
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1474 = _1460 + _1472;
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1478 = _1462 + _1476;
    float _1480 = _1470 * _1470;
    float _1482 = fma(_1474, _1474, _1480);
    float _1484 = fma(_1478, _1478, _1482);
    float _1486 = rsqrt(_1484);
    float _1488 = sqrt(_1484);
    float _1490 = _1486 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1492 = _1474 * _1490;
    float _1494 = _1478 * _1490;
    float _1496 = _1492 * _1492;
    float _1498 = _1494 * _1494;
    float _1500 = _1496 + _1498;
    float _1502 = sqrt(_1500);
    bool _1504 = _1502 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1506 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1508 = _1502 + _1506;
    float _1510 = _1482;
    float _1512 = _1500;
    float _1514 = _1508;
    float _1516 = _1464;
    float _1518 = _1492;
    if (_1504)
    {
        float _1520 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1510 = _1520;
    }
    float _1522 = _1510;
    if (_1504)
    {
        float _1524 = rsqrt(_1500);
        _1512 = _1524;
    }
    float _1526 = _1512;
    float _1528 = _1526;
    if (_1504)
    {
        float _1530 = _1508 * _1522;
        _1514 = _1530;
    }
    float _1532 = _1514;
    if (_1504)
    {
        float _1534 = _1532 * 0.15915493667125701904296875;
        _1516 = _1534;
    }
    float _1536 = _1516;
    float _1538 = _1522;
    float _1540 = _1536;
    if (_1504)
    {
        float _1542 = _1536 * 6.283185482025146484375;
        float _1544 = sin(_1542);
        _1538 = _1544;
    }
    float _1546 = _1538;
    float _1548 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1550 = precise::max(0.0, _1548);
    float _1552 = _1466;
    float _1554 = _1550;
    if (_1504)
    {
        float _1556 = _1536 * 6.283185482025146484375;
        float _1558 = cos(_1556);
        _1552 = _1558;
    }
    float _1560 = _1552;
    float _1562 = -_1490;
    float _1564 = -_1550;
    float _1566 = fma(_1470, _1562, _1564);
    if (_1504)
    {
        float _1568 = _1566 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1554 = _1568;
    }
    float _1570 = _1554;
    float _1572 = _1546;
    float _1574 = _1570;
    if (_1504)
    {
        float _1576 = fma(_1546, _1570, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1572 = _1576;
    }
    float _1578 = _1572;
    float _1580 = _1578;
    float _1582 = _1560;
    if (_1504)
    {
        float _1584 = _1560 + (-1.0);
        _1574 = _1584;
    }
    float _1586 = _1574;
    float _1588 = _1586;
    if (_1504)
    {
        float _1590 = _1526 * _1578;
        _1274 = _1590;
    }
    float _1592 = _1274;
    if (!_1504)
    {
        _1580 = _1566;
    }
    float _1594 = _1580;
    float _1596 = _1594;
    if (_1504)
    {
        float _1598 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1540 = _1598;
    }
    float _1600 = _1540;
    if (_1504)
    {
        float _1602 = _1492 * _1592;
        _1518 = _1602;
    }
    float _1604 = _1518;
    if (!_1504)
    {
        _1588 = _1494;
    }
    float _1606 = _1588;
    float _1608 = _1606;
    if (_1504)
    {
        float _1610 = _1494 * _1592;
        _1608 = _1610;
    }
    float _1612 = _1608;
    if (!_1504)
    {
        _1528 = _1496;
    }
    float _1614 = _1528;
    float _1616 = _1614;
    if (_1504)
    {
        float _1618 = fma(_1566, _1560, _1600);
        _1596 = _1618;
    }
    float _1620 = _1596;
    if (_1504)
    {
        float _1622 = _1604 * _1604;
        _1616 = _1622;
    }
    float _1624 = _1616;
    if (!_1504)
    {
        _1582 = _1498;
    }
    float _1626 = _1582;
    float _1628 = _1626;
    if (_1504)
    {
        float _1630 = _1612 * _1612;
        _1628 = _1630;
    }
    float _1632 = _1628;
    float _1634 = fma(_1620, _1620, _1624);
    float _1636 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1638 = _1634 + _1632;
    float _1640 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1642 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1644 = fma(_1488, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1642);
    float _1646 = precise::clamp(_1644, 0.0, 1.0);
    float _1648 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1650 = rsqrt(_1638);
    float _1652 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1640);
    float _1654 = -_1646;
    float _1656 = _1654 + 1.0;
    float _1658 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1660 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1662 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1652);
    float _1664 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1636);
    float _1666 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1658);
    float _1668 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1660);
    float _1670 = _1662 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1672 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1664);
    float _1674 = abs(_1656);
    float _1676 = log2(_1674);
    float _1678 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1666);
    float _1680 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1682 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1684 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1668);
    float _1686 = _1650 * _1604;
    float _1688 = -_1680;
    float _1690 = fma(_1688, _1648, 1.0);
    float _1692 = _1650 * _1620;
    float _1694 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1696 = _1686 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1698 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1700 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1702 = _1650 * _1612;
    float _1704 = -_1696;
    float _1706 = fma(_1692, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1704);
    float _1708 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1698);
    float _1710 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1712 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1714 = -_1702;
    float _1716 = fma(_1714, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1706);
    float _1718 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1708);
    float _1720 = log2(_1690);
    float _1722 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1724 = fma(_1716, -0.5, 0.5);
    float _1726 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1718);
    float _1728 = fma(_1716, 0.5, 0.5);
    float _1730 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1710);
    float _1732 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1722);
    float _1734 = _1692 + 1.0;
    float _1736 = exp2(_1712);
    float _1738 = fma(_1728, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1740 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1730);
    float _1742 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1732);
    float _1744 = fma(_1728, _1738, -0.212114393711090087890625);
    float _1746 = 1.0 / _1726;
    float _1748 = fma(_1728, _1744, 1.570728778839111328125);
    float _1750 = _1720 * 0.693147182464599609375;
    float _1752 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1754 = sqrt(_1724);
    float _1756 = -_1692;
    float _1758 = fma(_1736, _1734, _1756);
    float _1760 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1740);
    float _1762 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1742);
    float _1764 = _1760 * _1746;
    float _1766 = _1762 * _1746;
    float _1768 = fma(_1764, 0.5, 0.5);
    float _1770 = fma(_1766, -0.5, 0.5);
    float _1772 = fma(_1758, 0.5, 0.5);
    float _1774 = _1754 * 0.636619746685028076171875;
    float _1776 = -_1748;
    float _1778 = fma(_1774, _1776, 1.0);
    float3 _4740 = float3(_1768, _1770, _1752);
    float _1780 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4740, float3(0.0), isnan(_4740)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4740, float3(0.0), isnan(_4740)), level(0.0)).x;
    float3 _4751 = float3(_1768, _1770, _1752);
    float4 _1783 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4751, float3(0.0), isnan(_4751)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4751, float3(0.0), isnan(_4751)), level(0.0)).xyzw;
    float _1785 = _1783.x;
    float _1787 = _1783.y;
    float _1789 = _1783.z;
    float _1791 = _1783.w;
    float2 _4768 = float2(_1778, _1772);
    float3 _1795 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4768, float2(0.0), isnan(_4768)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4768, float2(0.0), isnan(_4768)), level(0.0)).xyz;
    float _1797 = _1795.x;
    float _1799 = _1795.y;
    float _1801 = _1795.z;
    float _1803 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1805 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1807 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1803);
    float _1809 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1805);
    float _1811 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1807);
    float _1813 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1809);
    float _1815 = _1811 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1817 = _1813 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1819 = 1.0 / _1815;
    float _1821 = _1817 + _1815;
    float _1823 = _1821 * _1819;
    float _1825 = _1823 * 0.5;
    float _1827 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1829 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1831 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1829);
    float _1833 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1827);
    bool _1835 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1837 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan(0.5);
    bool _1843 = _1839 || _1841;
    float _1845 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1847 = 1.0 / _1831;
    float _1849 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1833);
    float _1851 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1849);
    float _1853 = exp2(_1845);
    float _1855 = _1676;
    float _1857 = _1670;
    if (_1843)
    {
        _1855 = 1.0;
    }
    float _1859 = _1855;
    float _1861 = _1859;
    if (_1843)
    {
        _1857 = 1.0;
    }
    float _1863 = _1857;
    float _1865 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1867 = _1847 * _1865;
    float _1869 = _1863;
    if (!_1843)
    {
        float _1871 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1873 = _1871 * 0.15915493667125701904296875;
        float _1875 = _1873 * 6.283185482025146484375;
        float _1877 = cos(_1875);
        float _1879 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1881 = _1879 * 0.15915493667125701904296875;
        float _1883 = _1873 * 6.283185482025146484375;
        float _1885 = sin(_1883);
        float _1887 = 1.0 / _1877;
        float _1889 = _1881 * 6.283185482025146484375;
        float _1891 = cos(_1889);
        float _1893 = _1885 * _1887;
        float _1895 = _1881 * 6.283185482025146484375;
        float _1897 = sin(_1895);
        float _1899 = _1891 * _1893;
        float _1901 = 1.0 / _1899;
        float _1903 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1905 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1903;
        float _1907 = 1.0 / _1905;
        float _1909 = _1897 * _1901;
        float _1911 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1913 = fma(_1867, _1909, _1911);
        float _1915 = _1913 * _1907;
        float _1917 = precise::clamp(_1915, 0.0, 1.0);
        _1861 = _1917;
    }
    float _1919 = _1861;
    if (!_1843)
    {
        float _1921 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1923 = _1921 * 0.15915493667125701904296875;
        float _1925 = _1923 * 6.283185482025146484375;
        float _1927 = cos(_1925);
        float _1929 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1931 = _1929 * 0.15915493667125701904296875;
        float _1933 = _1923 * 6.283185482025146484375;
        float _1935 = sin(_1933);
        float _1937 = 1.0 / _1927;
        float _1939 = _1931 * 6.283185482025146484375;
        float _1941 = cos(_1939);
        float _1943 = _1935 * _1937;
        float _1945 = _1931 * 6.283185482025146484375;
        float _1947 = sin(_1945);
        float _1949 = _1941 * _1943;
        float _1951 = 1.0 / _1949;
        float _1953 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1955 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1953;
        float _1957 = 1.0 / _1955;
        float _1959 = _1947 * _1951;
        float _1961 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1963 = fma(_1867, _1959, _1961);
        float _1965 = _1963 * _1957;
        float _1967 = precise::clamp(_1965, 0.0, 1.0);
        float _1969 = -_1967;
        float _1971 = _1969 + 1.0;
        _1869 = _1971;
    }
    float _1973 = _1869;
    float _1975 = -_1853;
    float _1977 = _1975 + 1.0;
    bool _1979 = _1919 > 0.0;
    bool _1981 = isnan(_1919);
    bool _1983 = _1979 || _1981;
    bool _1985 = isnan(0.0);
    bool _1987 = _1983 || _1985;
    float _1989 = _1919 * _1973;
    float _1991 = _1726 * 0.5;
    float _1993 = _1977 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1995 = _1973 <= 0.0;
    bool _1997 = !_1987;
    bool _1999 = _1995 || _1997;
    float _2001 = _1851 + _1726;
    float _2003 = _1760 + _1726;
    float _2005 = _1993 * _1780;
    float _2007 = -_1993;
    float _2009 = _2007 + 1.0;
    float _2011 = _1989 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2013 = fma(_1762, -0.5, _1991);
    float _2015 = _1791 * _2005;
    float _2017 = _1801 * _2005;
    out.m_71.x = _1474;
    out.m_71.y = _1470;
    out.m_71.z = _1478;
    float _2019 = fma(_1797, _2015, _1785);
    float _2021 = fma(_1799, _2015, _1787);
    float _2023 = _1791 * _2009;
    float _2025 = _2001 * 0.5;
    float _2027 = _2003 * 0.5;
    float _2029 = _2011 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2031 = fma(_1791, _2017, _1789);
    out.gl_Position.x = _1760;
    out.gl_Position.y = _1762;
    out.gl_Position.z = _1851;
    out.gl_Position.w = _1726;
    out.m_73.x = _2027;
    out.m_73.y = _2013;
    out.m_73.z = _2025;
    out.m_73.w = _1726;
    out.m_47.x = _2029;
    out.m_75.x = _2019;
    out.m_75.y = _2021;
    out.m_75.z = _2031;
    out.m_75.w = _2023;
    if (!_1999)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2033 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2033;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1310 = false;
    bool _460 = false;
    bool _292 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_47.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2090 = as_type<float>(_110);
        out.gl_Position.z = _2090;
    }
    if (!_98)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _114 = in.m_49.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = _128;
    if (_124)
    {
        float _132 = float(_94);
        _104 = _132;
    }
    float _134 = _104;
    bool _136 = _128 >= _134;
    bool _138 = !_124;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_140)
    {
        out.m_47.x = 0.0;
    }
    if (_140)
    {
        float _146 = _144 * 5.0;
        _112 = as_type<int>(_146);
    }
    int _148 = _112;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2160 = as_type<float>(_148);
        out.gl_Position.z = _2160;
    }
    if (_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_51.w;
    float _152 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_49.x;
    float _166 = in.m_49.y;
    float _168 = in.m_49.z;
    float _170 = in.m_44.x;
    float _172 = in.m_44.y;
    float _174 = in.m_44.z;
    float _176 = 0.0;
    float _178 = _152;
    if (!_162)
    {
        float _180 = _152 * _152;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_162)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    bool _192 = !_162;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _152 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _152);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _224;
    }
    float _226 = _194;
    bool _228 = !_162;
    if (!_228)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = 1.0 / _236;
        float _240 = _152 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _178 = _248;
    }
    float _250 = _178;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _254 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = fma(_250, _164, _254);
    float _262 = fma(_250, _166, _256);
    float _264 = fma(_250, _168, _258);
    float _266 = fma(_260, _150, _170);
    float _268 = fma(_262, _150, _172);
    float _270 = fma(_264, _150, _174);
    bool _272 = !_252;
    float _290;
    if (!_272)
    {
        float _274 = in.m_53.x;
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _278 = _274 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _282 = _280 * _276;
        float _284 = floor(_282);
        float _286 = -_284;
        float _288 = _282 + _286;
        _290 = _288;
        _292 = true;
    }
    else
    {
        float _294 = float(_94);
        float _296 = 1.0 / _294;
        float _298 = _128 * _296;
        _290 = _298;
    }
    _292 = false;
    float _300 = _290;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _300 + _302;
    bool _306 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _308 = isnan(_300);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _320 = _300 + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _330 = 1.0 / _324;
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _334 = 1.0 / _328;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _336;
    float _340 = _304 * _330;
    bool _342 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _344 = isnan(_300);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -_316;
    float _356 = _354 + 1.0;
    bool _358 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _360 = isnan(_300);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = fma(_338, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _372 = _368 * _356;
    float _374 = -_368;
    float _376 = _374 + 1.0;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    float _386 = _320 * _334;
    float _388 = _352 * _376;
    float _390 = fma(_380, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _392 = fma(_384, _340, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _394 = -_352;
    float _396 = _394 + 1.0;
    float _398 = _370 * _388;
    float _400 = _390 * _388;
    float _402 = _392 * _388;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[143].x, _400);
    float _418 = fma(_406, _386, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _420 = fma(_410, _386, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _422 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[143].y, _398);
    float _424 = fma(_414, _386, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[143].z, _402);
    float _428 = fma(_418, _372, _416);
    float _430 = fma(_420, _372, _422);
    float _432 = fma(_424, _372, _426);
    float _434 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[145].x, _428);
    float _436 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[145].y, _430);
    float _438 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[145].z, _432);
    bool _440 = !_332;
    float _458;
    if (!_440)
    {
        float _442 = in.m_53.x;
        float _444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _446 = _442 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _448 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _450 = _448 * _444;
        float _452 = floor(_450);
        float _454 = -_452;
        float _456 = _450 + _454;
        _458 = _456;
        _460 = true;
    }
    else
    {
        float _462 = float(_94);
        float _464 = 1.0 / _462;
        float _466 = _128 * _464;
        _458 = _466;
    }
    _460 = false;
    float _468 = _458;
    float _470 = in.m_53.x;
    float _472 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _474 = log2(_472);
    float _476 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _478 = in.m_53.z;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _486 = _484 != 0;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _490 = _488 != 0;
    float _492 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _494 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _496 = in.m_53.y;
    float _498 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _476);
    float _500 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _492);
    float _502 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _494);
    float _504 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].z, _498);
    float _506 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].z, _500);
    float _508 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].z, _502);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _512 = _468 + _510;
    float _514 = _474 * _128;
    float _516 = _506 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _518 = !_486;
    int _520 = _518 ? 0 : 1;
    float _522 = in.m_55.x;
    bool _524 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _526 = isnan(_468);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _538 = _516 + _536;
    float _540 = _470 * 2.0;
    bool _542 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _544 = isnan(_468);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    float _554 = -_534;
    float _556 = _554 + 1.0;
    float _558 = _478 * 2.0;
    float _560 = floor(_540);
    float _562 = _552 * _556;
    float _564 = _496 + _478;
    float _566 = _496 * 2.0;
    float _568 = -_552;
    float _570 = _568 + 1.0;
    float _572 = _564 + (-1.0);
    float _574 = floor(_558);
    float _576 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _578 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _580 = isnan(1.0);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _586 = _582 || _584;
    float _588 = floor(_566);
    bool _590 = _560 > 0.0;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _594 = 1.0 + _592;
    bool _596 = _560 >= 0.0;
    bool _598 = isnan(_560);
    bool _600 = _596 || _598;
    bool _602 = isnan(0.0);
    bool _604 = _600 || _602;
    float _606 = _470 + _478;
    int _608 = _604 ? 0 : 1;
    float _610 = exp2(_514);
    bool _612 = _574 > 0.0;
    float _614 = _606 + (-1.0);
    int _616 = ~_608;
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    bool _622 = _574 >= 0.0;
    bool _624 = isnan(_574);
    bool _626 = _622 || _624;
    bool _628 = isnan(0.0);
    bool _630 = _626 || _628;
    float _632 = _508 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _634 = _620;
    float _636 = _556;
    float _638 = _496;
    float _640 = _632;
    if (!_590)
    {
        int _642 = ~_608;
        int _644 = _642 + 1;
        _634 = _644;
    }
    int _646 = _634;
    float _648 = _504 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _650 = 1.0 / _594;
    float _652 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _654 = _632 + _652;
    float _656 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _658 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _660 = _648 + _658;
    bool _662 = _588 > 0.0;
    int _664 = abs(_520);
    float _666 = _660 * _660;
    bool _668 = !_482;
    int _670 = _668 ? 0 : 1;
    float _672 = -_610;
    float _674 = _672 + 1.0;
    int _676 = _630 ? 0 : 1;
    float _678 = fma(_538, _538, _666);
    bool _680 = _588 >= 0.0;
    bool _682 = isnan(_588);
    bool _684 = _680 || _682;
    bool _686 = isnan(0.0);
    bool _688 = _684 || _686;
    float _690 = in.m_57.x;
    float _692 = in.m_57.y;
    float _694 = in.m_57.z;
    int _696 = abs(_670);
    float _698 = fma(_654, _654, _678);
    int _700 = ~_676;
    int _702 = _700 + 1;
    int _704 = _702 + 1;
    float _706 = float(_664);
    float _708 = float(_646);
    float _710 = rsqrt(_698);
    int _712 = _704;
    float _714 = _648;
    if (!_612)
    {
        int _716 = ~_676;
        int _718 = _716 + 1;
        _712 = _718;
    }
    int _720 = _712;
    bool _722 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _724 = isnan(0.0);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _730 = _726 || _728;
    float _732 = _706 * _708;
    int _734 = _688 ? 0 : 1;
    float _736 = _730 ? _674 : 0.0;
    int _738 = ~_734;
    int _740 = _738 + 1;
    int _742 = _740 + 1;
    float _744 = float(_696);
    int _746 = _742;
    if (_586)
    {
        float _748 = _736 * _650;
        _130 = _748;
    }
    float _750 = _130;
    float _752 = float(_720);
    float _754 = _732 * (-2.0);
    if (!_662)
    {
        int _756 = ~_734;
        int _758 = _756 + 1;
        _746 = _758;
    }
    int _760 = _746;
    float _762 = _660 * _710;
    bool _764 = _496 > 0.5;
    float _766 = _744 * _752;
    float _768 = _538 * _710;
    float _770 = -_762;
    float _772 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[18].w, _660);
    float _774 = fma(_576, _754, _576);
    bool _776 = !_490;
    int _778 = _776 ? 0 : 1;
    float _780 = -_768;
    float _782 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[18].w, _538);
    float _784 = _772 * _772;
    float _786 = fma(_754, _692, _692);
    float _788 = _496 + (-0.5);
    float _790 = float(_760);
    float _792 = fma(_782, _782, _784);
    int _794 = abs(_778);
    float _796 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[196].y, _786);
    float _798 = _470 + _496;
    float _800 = _654 * _710;
    float _802 = float(_794);
    float _804 = _798 + (-1.0);
    float _806 = fma(_774, _750, _796);
    float _808 = _766 * (-2.0);
    float _810 = -_800;
    float _812 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[18].w, _654);
    float _814 = _802 * _790;
    float _816 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _818 = _470 + (-0.5);
    float _820 = fma(_808, _690, _690);
    float _822 = _814 * (-2.0);
    float _824 = fma(_816, _808, _816);
    float _826 = fma(_812, _812, _792);
    float _828 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[196].x, _820);
    float _830 = fma(_656, _822, _656);
    float _832 = fma(_822, _694, _694);
    float _834 = _478 + (-0.5);
    float _836 = fma(_824, _750, _828);
    float _838 = in.m_51.x;
    float _840 = in.m_51.y;
    float _842 = in.m_51.z;
    float _844 = _806 * 0.15915493667125701904296875;
    float _846 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[196].z, _832);
    float _848 = _836 * 0.15915493667125701904296875;
    float _850 = sqrt(_826);
    float _852 = in.m_59.x;
    float _854 = in.m_59.y;
    float _856 = in.m_59.z;
    float _858 = fma(_830, _750, _846);
    float _860 = _858 * 0.15915493667125701904296875;
    int _862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _864 = _862 != 0;
    float _866 = _844 * 6.283185482025146484375;
    float _868 = sin(_866);
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _872 = _870 != 0;
    bool _874 = _470 > 0.5;
    bool _876 = _874 && _864;
    float _878 = _844 * 6.283185482025146484375;
    float _880 = cos(_878);
    float _882 = _434 * _838;
    float _884 = _436 * _840;
    float _886 = _710 * _850;
    float _888 = _438 * _842;
    float _890 = _848 * 6.283185482025146484375;
    float _892 = cos(_890);
    float _894 = _882 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _896 = _884 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _898 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _852);
    float _900 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _854);
    bool _902 = _854 != 0.0;
    bool _904 = isnan(_854);
    bool _906 = _902 || _904;
    bool _908 = isnan(0.0);
    bool _910 = _906 || _908;
    float _912 = _762;
    if (_864)
    {
        _636 = _522;
    }
    float _914 = _636;
    float _916 = _860 * 6.283185482025146484375;
    float _918 = cos(_916);
    bool _920 = _852 == 0.0;
    bool _922 = !_910;
    bool _924 = _920 && _922;
    float _926 = _914;
    if (!_864)
    {
        _638 = _522;
    }
    float _928 = _638;
    float _930 = _928;
    if (_876)
    {
        float _932 = -_914;
        float _934 = _932 + 1.0;
        _926 = _934;
    }
    float _936 = _926;
    bool _938 = _856 == 0.0;
    bool _940 = _938 && _924;
    float _942 = _848 * 6.283185482025146484375;
    float _944 = sin(_942);
    float _946 = _892 * _880;
    float _948 = _892 * _868;
    if (_864)
    {
        _930 = _936;
    }
    float _950 = _930;
    float _952 = _860 * 6.283185482025146484375;
    float _954 = sin(_952);
    float _956 = _892 * _918;
    float _958 = _880 * _918;
    float _960 = _868 * _918;
    float _962 = _944 * _880;
    float _964 = _944 * _868;
    float _966 = _886 * _894;
    float _968 = _886 * _896;
    float _970 = _944 * _918;
    float _972 = _898 * _966;
    float _974 = _888 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _976 = -_948;
    float _978 = fma(_954, _962, _976);
    float _980 = -_962;
    float _982 = fma(_954, _948, _980);
    float _984 = _900 * _968;
    float _986 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _856);
    float _988 = _886 * _974;
    float _990 = fma(_954, _946, _964);
    float _992 = _956 * _984;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _998 = -_984;
    float _1000 = _954 * _998;
    float _1002 = _986 * _988;
    float _1004 = fma(_990, _972, _992);
    float _1006 = _970 * _984;
    float _1008 = fma(_958, _972, _1000);
    float _1010 = 1.0 / _996;
    float _1012 = fma(_982, _1002, _1004);
    float _1014 = fma(_954, _964, _946);
    float _1016 = fma(_978, _972, _1006);
    float _1018 = fma(_960, _1002, _1008);
    float _1020 = _1012 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1022 = _1012 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1024 = fma(_1014, _1002, _1016);
    float _1026 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1020);
    float _1028 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1022);
    float _1030 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1026);
    float _1032 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1028);
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1034;
    float _1038 = _516 + _1030;
    float _1040 = _632 + _1032;
    float _1042 = in.m_55.y;
    float _1044 = _1036 * _1010;
    float _1046 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1048 = _1038 + _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1052 = _1040 + _1050;
    float _1054 = in.m_61.x;
    float _1056 = in.m_61.y;
    float _1058 = in.m_61.z;
    float _1060 = fma(_1044, _512, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1062 = _1048 * _1048;
    float _1064 = _1052 * _1052;
    float _1066 = _1060 * _562;
    float _1068 = _1062 + _1064;
    float _1070 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1066);
    float _1072 = sqrt(_1068);
    float _1074 = -_1042;
    float _1076 = _1074 + 1.0;
    float _1078 = _1056;
    float _1080 = _1042;
    float _1082 = _1054;
    float _1084 = _1058;
    float _1086 = _1062;
    float _1088 = _1064;
    float _1090 = _1038;
    float _1092 = _1040;
    if (!_940)
    {
        float _1094 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1056);
        _1078 = _1094;
    }
    float _1096 = _1078;
    float _1098 = _1012 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    if (_872)
    {
        float _1100 = _764 ? _1076 : _1042;
        _1080 = _1100;
    }
    float _1102 = _1080;
    if (!_940)
    {
        float _1104 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1054);
        _1082 = _1104;
    }
    float _1106 = _1082;
    bool _1108 = _1072 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1110 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1098);
    float _1112 = -_1096;
    float _1114 = _954 * _1112;
    float _1116 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1118 = _956 * _1096;
    float _1120 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1110);
    float _1122 = _970 * _1096;
    float _1124 = fma(_958, _1106, _1114);
    float _1126 = fma(_990, _1106, _1118);
    float _1128 = _648 + _1120;
    float _1130 = fma(_978, _1106, _1122);
    float _1132 = _1106;
    if (!_940)
    {
        float _1134 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1058);
        _1084 = _1134;
    }
    float _1136 = _1084;
    float _1138 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1070);
    if (!_1108)
    {
        _1132 = _1128;
    }
    float _1140 = _1132;
    bool _1142 = !_1108;
    float _1144 = _1140;
    if (!_1142)
    {
        float _1146 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1148 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1150 = _1072 + _1148;
        float _1152 = _1128 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1154 = rsqrt(_1068);
        float _1156 = _1150 * _1146;
        float _1158 = _1156 * 0.15915493667125701904296875;
        float _1160 = _1158 * 6.283185482025146484375;
        float _1162 = sin(_1160);
        float _1164 = _1158 * 6.283185482025146484375;
        float _1166 = cos(_1164);
        float _1168 = fma(_1162, _1152, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1170 = _1154 * _1168;
        float _1172 = _1166 + (-1.0);
        float _1174 = fma(_1048, _1170, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1176 = fma(_1052, _1170, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1178 = _1172 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1180 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1182 = _1174 + _1180;
        float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1186 = _1176 + _1184;
        float _1188 = fma(_1128, _1166, _1178);
        float _1190 = _1182 * _1182;
        float _1192 = _1186 * _1186;
        _1144 = _1188;
        _1086 = _1190;
        _1088 = _1192;
        _1090 = _1174;
        _1092 = _1176;
    }
    float _1194 = _1144;
    float _1196 = _1086;
    float _1198 = _1088;
    float _1200 = _1090;
    float _1202 = _1092;
    float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1206 = _1194 + _1204;
    float _1208 = fma(_982, _1136, _1126);
    float _1210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1212 = fma(_960, _1136, _1124);
    float _1214 = fma(_1206, _1206, _1196);
    float _1216 = _1208 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1218 = _1208 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1220 = _1208 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1222 = _1214 + _1198;
    float _1224 = fma(_1212, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1216);
    float _1226 = fma(_1212, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1218);
    float _1228 = fma(_1212, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1220);
    float _1230 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1232 = sqrt(_1222);
    float _1234 = fma(_1014, _1136, _1130);
    float _1236 = _950 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1244 = _1230 * _1116;
    float _1246 = _1138 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1248 = _1236 * _1210;
    float _1250 = fma(_1234, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1224);
    float _1252 = fma(_1234, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1226);
    float _1254 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1256 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1258 = _1242 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1260 = fma(_1234, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1228);
    out.m_63.x = _1248;
    out.m_63.y = _1244;
    bool _1262 = _1232 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1264 = isnan(_1232);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1270 = _1266 || _1268;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    out.m_67.x = _1254;
    out.m_67.y = _1256;
    out.m_67.z = _1258;
    out.m_67.w = _1246;
    out.m_69.x = _1250;
    out.m_69.y = _1252;
    out.m_69.z = _1260;
    float _1272 = _1224;
    float _1274 = _1254;
    if (!_1270)
    {
        _1272 = 1.0;
    }
    float _1276 = _1272;
    bool _1278 = !_1270;
    float _1280 = _1276;
    if (!_1278)
    {
        bool _1282 = _1232 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1284 = isnan(_1232);
        bool _1286 = _1282 || _1284;
        bool _1288 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1290 = _1286 || _1288;
        if (!_1290)
        {
            float _1292 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1294 = _1232 + _1292;
            float _1296 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1298 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1296;
            float _1300 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1302 = _1300 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1304 = 1.0 / _1298;
            float _1306 = _1294 * _1304;
            float _1308 = fma(_1306, _1302, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1280 = _1308;
            _1310 = true;
        }
        else
        {
            bool _1312 = _1232 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1314 = isnan(_1232);
            bool _1316 = _1312 || _1314;
            bool _1318 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1320 = _1316 || _1318;
            if (!_1320)
            {
                float _1322 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1324 = _1232 + _1322;
                float _1326 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1328 = _1326 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1330 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1332 = _1330 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1334 = 1.0 / _1328;
                float _1336 = _1324 * _1334;
                float _1338 = fma(_1336, _1332, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1280 = _1338;
                _1310 = true;
            }
            else
            {
                _1280 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1310 = false;
    float _1340 = _1280;
    float _1342 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1344 = _1194 + _1342;
    float _1346 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1348 = _1200 + _1346;
    float _1350 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1352 = _1202 + _1350;
    bool _1354 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1356 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan(0.5);
    bool _1362 = _1358 || _1360;
    float _1364 = fma(_1344, _1340, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1366 = fma(_1348, _1340, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1368 = fma(_1352, _1340, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1370 = -_768;
    float _1372 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[18].w, _516);
    float _1374 = -_762;
    float _1376 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1364);
    float _1378 = -_768;
    float _1380 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1366);
    float _1382 = -_800;
    float _1384 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1368);
    float _1386 = -_762;
    float _1388 = fma(_1386, (*spvDescriptorSet0.vp_c9)._m0[18].w, _648);
    float _1390 = -_800;
    float _1392 = fma(_1390, (*spvDescriptorSet0.vp_c9)._m0[18].w, _632);
    float _1394 = _1380;
    float _1396 = _1384;
    if (_1362)
    {
        _912 = _1376;
    }
    float _1398 = _912;
    float _1400 = _1398;
    if (!_1362)
    {
        float _1402 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1404 = _1388 + _1402;
        float _1406 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1408 = _1372 + _1406;
        float _1410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1412 = -_632;
        float _1414 = _1412 + _1368;
        float _1416 = _1404 * _1404;
        float _1418 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1420 = _1392 + _1418;
        float _1422 = -_648;
        float _1424 = _1422 + _1364;
        float _1426 = fma(_1408, _1408, _1416);
        float _1428 = -_516;
        float _1430 = _1428 + _1366;
        float _1432 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1434 = fma(_1420, _1420, _1426);
        float _1436 = sqrt(_1434);
        float _1438 = 1.0 / _886;
        float _1440 = precise::min(_1436, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1442 = _1440 * _1410;
        float _1444 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1446 = _1442 * _1438;
        float _1448 = _1444 * _1446;
        float _1450 = _1414 * _1446;
        float _1452 = fma(_1430, _1448, _1372);
        float _1454 = fma(_1424, _1448, _1388);
        float _1456 = fma(_1444, _1450, _1392);
        _1400 = _1454;
        _1394 = _1452;
        _1396 = _1456;
        _714 = _1424;
        _640 = _1450;
    }
    float _1458 = _1400;
    float _1460 = _1394;
    float _1462 = _1396;
    float _1464 = _714;
    float _1466 = _640;
    float _1468 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1470 = _1458 + _1468;
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1474 = _1460 + _1472;
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1478 = _1462 + _1476;
    float _1480 = _1470 * _1470;
    float _1482 = fma(_1474, _1474, _1480);
    float _1484 = fma(_1478, _1478, _1482);
    float _1486 = rsqrt(_1484);
    float _1488 = sqrt(_1484);
    float _1490 = _1486 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1492 = _1474 * _1490;
    float _1494 = _1478 * _1490;
    float _1496 = _1492 * _1492;
    float _1498 = _1494 * _1494;
    float _1500 = _1496 + _1498;
    float _1502 = sqrt(_1500);
    bool _1504 = _1502 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1506 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1508 = _1502 + _1506;
    float _1510 = _1482;
    float _1512 = _1500;
    float _1514 = _1508;
    float _1516 = _1464;
    float _1518 = _1492;
    if (_1504)
    {
        float _1520 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1510 = _1520;
    }
    float _1522 = _1510;
    if (_1504)
    {
        float _1524 = rsqrt(_1500);
        _1512 = _1524;
    }
    float _1526 = _1512;
    float _1528 = _1526;
    if (_1504)
    {
        float _1530 = _1508 * _1522;
        _1514 = _1530;
    }
    float _1532 = _1514;
    if (_1504)
    {
        float _1534 = _1532 * 0.15915493667125701904296875;
        _1516 = _1534;
    }
    float _1536 = _1516;
    float _1538 = _1522;
    float _1540 = _1536;
    if (_1504)
    {
        float _1542 = _1536 * 6.283185482025146484375;
        float _1544 = sin(_1542);
        _1538 = _1544;
    }
    float _1546 = _1538;
    float _1548 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1550 = precise::max(0.0, _1548);
    float _1552 = _1466;
    float _1554 = _1550;
    if (_1504)
    {
        float _1556 = _1536 * 6.283185482025146484375;
        float _1558 = cos(_1556);
        _1552 = _1558;
    }
    float _1560 = _1552;
    float _1562 = -_1490;
    float _1564 = -_1550;
    float _1566 = fma(_1470, _1562, _1564);
    if (_1504)
    {
        float _1568 = _1566 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1554 = _1568;
    }
    float _1570 = _1554;
    float _1572 = _1546;
    float _1574 = _1570;
    if (_1504)
    {
        float _1576 = fma(_1546, _1570, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1572 = _1576;
    }
    float _1578 = _1572;
    float _1580 = _1578;
    float _1582 = _1560;
    if (_1504)
    {
        float _1584 = _1560 + (-1.0);
        _1574 = _1584;
    }
    float _1586 = _1574;
    float _1588 = _1586;
    if (_1504)
    {
        float _1590 = _1526 * _1578;
        _1274 = _1590;
    }
    float _1592 = _1274;
    if (!_1504)
    {
        _1580 = _1566;
    }
    float _1594 = _1580;
    float _1596 = _1594;
    if (_1504)
    {
        float _1598 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1540 = _1598;
    }
    float _1600 = _1540;
    if (_1504)
    {
        float _1602 = _1492 * _1592;
        _1518 = _1602;
    }
    float _1604 = _1518;
    if (!_1504)
    {
        _1588 = _1494;
    }
    float _1606 = _1588;
    float _1608 = _1606;
    if (_1504)
    {
        float _1610 = _1494 * _1592;
        _1608 = _1610;
    }
    float _1612 = _1608;
    if (!_1504)
    {
        _1528 = _1496;
    }
    float _1614 = _1528;
    float _1616 = _1614;
    if (_1504)
    {
        float _1618 = fma(_1566, _1560, _1600);
        _1596 = _1618;
    }
    float _1620 = _1596;
    if (_1504)
    {
        float _1622 = _1604 * _1604;
        _1616 = _1622;
    }
    float _1624 = _1616;
    if (!_1504)
    {
        _1582 = _1498;
    }
    float _1626 = _1582;
    float _1628 = _1626;
    if (_1504)
    {
        float _1630 = _1612 * _1612;
        _1628 = _1630;
    }
    float _1632 = _1628;
    float _1634 = fma(_1620, _1620, _1624);
    float _1636 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1638 = _1634 + _1632;
    float _1640 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1642 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1644 = fma(_1488, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1642);
    float _1646 = precise::clamp(_1644, 0.0, 1.0);
    float _1648 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1650 = rsqrt(_1638);
    float _1652 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1640);
    float _1654 = -_1646;
    float _1656 = _1654 + 1.0;
    float _1658 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1660 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1662 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1652);
    float _1664 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1636);
    float _1666 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1658);
    float _1668 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1660);
    float _1670 = _1662 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1672 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1664);
    float _1674 = abs(_1656);
    float _1676 = log2(_1674);
    float _1678 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1666);
    float _1680 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1682 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1684 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1668);
    float _1686 = _1650 * _1604;
    float _1688 = -_1680;
    float _1690 = fma(_1688, _1648, 1.0);
    float _1692 = _1650 * _1620;
    float _1694 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1696 = _1686 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1698 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1700 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1702 = _1650 * _1612;
    float _1704 = -_1696;
    float _1706 = fma(_1692, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1704);
    float _1708 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1698);
    float _1710 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1712 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1714 = -_1702;
    float _1716 = fma(_1714, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1706);
    float _1718 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1708);
    float _1720 = log2(_1690);
    float _1722 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1724 = fma(_1716, -0.5, 0.5);
    float _1726 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1718);
    float _1728 = fma(_1716, 0.5, 0.5);
    float _1730 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1710);
    float _1732 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1722);
    float _1734 = _1692 + 1.0;
    float _1736 = exp2(_1712);
    float _1738 = fma(_1728, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1740 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1730);
    float _1742 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1732);
    float _1744 = fma(_1728, _1738, -0.212114393711090087890625);
    float _1746 = 1.0 / _1726;
    float _1748 = fma(_1728, _1744, 1.570728778839111328125);
    float _1750 = _1720 * 0.693147182464599609375;
    float _1752 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1754 = sqrt(_1724);
    float _1756 = -_1692;
    float _1758 = fma(_1736, _1734, _1756);
    float _1760 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1740);
    float _1762 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1742);
    float _1764 = _1760 * _1746;
    float _1766 = _1762 * _1746;
    float _1768 = fma(_1764, 0.5, 0.5);
    float _1770 = fma(_1766, -0.5, 0.5);
    float _1772 = fma(_1758, 0.5, 0.5);
    float _1774 = _1754 * 0.636619746685028076171875;
    float _1776 = -_1748;
    float _1778 = fma(_1774, _1776, 1.0);
    float3 _4740 = float3(_1768, _1770, _1752);
    float _1780 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4740, float3(0.0), isnan(_4740)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4740, float3(0.0), isnan(_4740)), level(0.0)).x;
    float3 _4751 = float3(_1768, _1770, _1752);
    float4 _1783 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4751, float3(0.0), isnan(_4751)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4751, float3(0.0), isnan(_4751)), level(0.0)).xyzw;
    float _1785 = _1783.x;
    float _1787 = _1783.y;
    float _1789 = _1783.z;
    float _1791 = _1783.w;
    float2 _4768 = float2(_1778, _1772);
    float3 _1795 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4768, float2(0.0), isnan(_4768)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4768, float2(0.0), isnan(_4768)), level(0.0)).xyz;
    float _1797 = _1795.x;
    float _1799 = _1795.y;
    float _1801 = _1795.z;
    float _1803 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1805 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1807 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1803);
    float _1809 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1805);
    float _1811 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1807);
    float _1813 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1809);
    float _1815 = _1811 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1817 = _1813 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1819 = 1.0 / _1815;
    float _1821 = _1817 + _1815;
    float _1823 = _1821 * _1819;
    float _1825 = _1823 * 0.5;
    float _1827 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1829 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1831 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1829);
    float _1833 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1827);
    bool _1835 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1837 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan(0.5);
    bool _1843 = _1839 || _1841;
    float _1845 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1847 = 1.0 / _1831;
    float _1849 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1833);
    float _1851 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1849);
    float _1853 = exp2(_1845);
    float _1855 = _1676;
    float _1857 = _1670;
    if (_1843)
    {
        _1855 = 1.0;
    }
    float _1859 = _1855;
    float _1861 = _1859;
    if (_1843)
    {
        _1857 = 1.0;
    }
    float _1863 = _1857;
    float _1865 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1867 = _1847 * _1865;
    float _1869 = _1863;
    if (!_1843)
    {
        float _1871 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1873 = _1871 * 0.15915493667125701904296875;
        float _1875 = _1873 * 6.283185482025146484375;
        float _1877 = cos(_1875);
        float _1879 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1881 = _1879 * 0.15915493667125701904296875;
        float _1883 = _1873 * 6.283185482025146484375;
        float _1885 = sin(_1883);
        float _1887 = 1.0 / _1877;
        float _1889 = _1881 * 6.283185482025146484375;
        float _1891 = cos(_1889);
        float _1893 = _1885 * _1887;
        float _1895 = _1881 * 6.283185482025146484375;
        float _1897 = sin(_1895);
        float _1899 = _1891 * _1893;
        float _1901 = 1.0 / _1899;
        float _1903 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1905 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1903;
        float _1907 = 1.0 / _1905;
        float _1909 = _1897 * _1901;
        float _1911 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1913 = fma(_1867, _1909, _1911);
        float _1915 = _1913 * _1907;
        float _1917 = precise::clamp(_1915, 0.0, 1.0);
        _1861 = _1917;
    }
    float _1919 = _1861;
    if (!_1843)
    {
        float _1921 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1923 = _1921 * 0.15915493667125701904296875;
        float _1925 = _1923 * 6.283185482025146484375;
        float _1927 = cos(_1925);
        float _1929 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1931 = _1929 * 0.15915493667125701904296875;
        float _1933 = _1923 * 6.283185482025146484375;
        float _1935 = sin(_1933);
        float _1937 = 1.0 / _1927;
        float _1939 = _1931 * 6.283185482025146484375;
        float _1941 = cos(_1939);
        float _1943 = _1935 * _1937;
        float _1945 = _1931 * 6.283185482025146484375;
        float _1947 = sin(_1945);
        float _1949 = _1941 * _1943;
        float _1951 = 1.0 / _1949;
        float _1953 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1955 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1953;
        float _1957 = 1.0 / _1955;
        float _1959 = _1947 * _1951;
        float _1961 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1963 = fma(_1867, _1959, _1961);
        float _1965 = _1963 * _1957;
        float _1967 = precise::clamp(_1965, 0.0, 1.0);
        float _1969 = -_1967;
        float _1971 = _1969 + 1.0;
        _1869 = _1971;
    }
    float _1973 = _1869;
    float _1975 = -_1853;
    float _1977 = _1975 + 1.0;
    bool _1979 = _1919 > 0.0;
    bool _1981 = isnan(_1919);
    bool _1983 = _1979 || _1981;
    bool _1985 = isnan(0.0);
    bool _1987 = _1983 || _1985;
    float _1989 = _1919 * _1973;
    float _1991 = _1726 * 0.5;
    float _1993 = _1977 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1995 = _1973 <= 0.0;
    bool _1997 = !_1987;
    bool _1999 = _1995 || _1997;
    float _2001 = _1851 + _1726;
    float _2003 = _1760 + _1726;
    float _2005 = _1993 * _1780;
    float _2007 = -_1993;
    float _2009 = _2007 + 1.0;
    float _2011 = _1989 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2013 = fma(_1762, -0.5, _1991);
    float _2015 = _1791 * _2005;
    float _2017 = _1801 * _2005;
    out.m_71.x = _1474;
    out.m_71.y = _1470;
    out.m_71.z = _1478;
    float _2019 = fma(_1797, _2015, _1785);
    float _2021 = fma(_1799, _2015, _1787);
    float _2023 = _1791 * _2009;
    float _2025 = _2001 * 0.5;
    float _2027 = _2003 * 0.5;
    float _2029 = _2011 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2031 = fma(_1791, _2017, _1789);
    out.gl_Position.x = _1760;
    out.gl_Position.y = _1762;
    out.gl_Position.z = _1851;
    out.gl_Position.w = _1726;
    out.m_73.x = _2027;
    out.m_73.y = _2013;
    out.m_73.z = _2025;
    out.m_73.w = _1726;
    out.m_47.x = _2029;
    out.m_75.x = _2019;
    out.m_75.y = _2021;
    out.m_75.z = _2031;
    out.m_75.w = _2023;
    if (!_1999)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2033 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2033;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

