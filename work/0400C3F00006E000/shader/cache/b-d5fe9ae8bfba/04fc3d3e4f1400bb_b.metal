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
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_24Smplr_w [[id(12)]];
    sampler vp_t_tcb_32Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_65 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_95 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 m_93 [[user(locn12)]];
    float4 m_89 [[user(locn13)]];
    float4 m_91 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_81 [[attribute(0)]];
    float4 m_53 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_75 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
    float4 m_59 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1846 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2130 = as_type<float>(_130);
        out.gl_Position.z = _2130;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_49.w;
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
        out.m_47.x = 0.0;
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
        float _2200 = as_type<float>(_168);
        out.gl_Position.z = _2200;
    }
    if (_160)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _170 = in.m_51.z;
    float _172 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _174 = log2(_172);
    float _176 = in.m_51.x;
    int _178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _180 = _178 != 0;
    float _182 = in.m_51.y;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _186 = _184 != 0;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _190 = _188 != 0;
    int _192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _194 = _192 != 0;
    float _196 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _198 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _202 = _170 * 2.0;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _208 = _176 * 2.0;
    float _210 = _176 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _212 = floor(_202);
    float _214 = _182 + _170;
    float _216 = -_196;
    float _218 = fma(_210, 2.0, _216);
    float _220 = _182 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _222 = _182 * 2.0;
    float _224 = -_148;
    float _226 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[76].x, _218);
    float _228 = floor(_208);
    float _230 = fma(_220, -2.0, _198);
    float _232 = _176 + (-0.5);
    bool _234 = _212 > 0.0;
    float _236 = _214 + (-1.0);
    bool _238 = _212 >= 0.0;
    bool _240 = isnan(_212);
    bool _242 = _238 || _240;
    bool _244 = isnan(0.0);
    bool _246 = _242 || _244;
    float _248 = _182 + _176;
    float _250 = floor(_222);
    int _252 = _246 ? 0 : 1;
    float _254 = _248 + (-1.0);
    float _256 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _258 = _236;
    float _260 = _254;
    float _262 = _176;
    if (!_180)
    {
        _258 = _182;
    }
    float _264 = _258;
    float _266 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _268 = ~_252;
    int _270 = _268 + 1;
    int _272 = _270 + 1;
    int _274 = _272;
    float _276 = _264;
    if (_180)
    {
        _260 = _176;
    }
    float _278 = _260;
    float _280 = _278;
    if (!_234)
    {
        int _282 = ~_252;
        int _284 = _282 + 1;
        _274 = _284;
    }
    int _286 = _274;
    if (!_180)
    {
        _280 = _170;
    }
    float _288 = _280;
    if (_180)
    {
        _276 = _176;
    }
    float _290 = _276;
    bool _292 = _228 > 0.0;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _296 = _228 >= 0.0;
    bool _298 = isnan(_228);
    bool _300 = _296 || _298;
    bool _302 = isnan(0.0);
    bool _304 = _300 || _302;
    float _306 = _288 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _308 = _290 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _310 = float(_286);
    float _312 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[83].z, _204);
    int _314 = _304 ? 0 : 1;
    float _316 = -_294;
    float _318 = fma(_308, 2.0, _316);
    bool _320 = !_186;
    float _322 = _320 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _324 = -_200;
    float _326 = fma(_306, 2.0, _324);
    int _328 = ~_314;
    int _330 = _328 + 1;
    int _332 = _330 + 1;
    float _334 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _312);
    int _336 = abs(as_type<int>(_322));
    float _338 = -_148;
    float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[86].x, _326);
    bool _342 = _250 > 0.0;
    float _344 = -_148;
    float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[81].x, _318);
    float _348 = float(_336);
    bool _350 = _250 >= 0.0;
    bool _352 = isnan(_250);
    bool _354 = _350 || _352;
    bool _356 = isnan(0.0);
    bool _358 = _354 || _356;
    int _360 = _332;
    float _362 = _306;
    float _364 = _322;
    float _366 = _290;
    if (!_292)
    {
        int _368 = ~_314;
        int _370 = _368 + 1;
        _360 = _370;
    }
    int _372 = _360;
    float _374 = _348 * _310;
    if (!_180)
    {
        _362 = _170;
    }
    float _376 = _362;
    float _378 = _174 * _148;
    float _380 = _374 * (-2.0);
    bool _382 = !_190;
    int _384 = _382 ? 0 : 1;
    float _386 = _376;
    if (_180)
    {
        _386 = _182;
    }
    float _388 = _386;
    float _390 = exp2(_378);
    if (_180)
    {
        _364 = _182;
    }
    float _392 = _364;
    float _394 = _388 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _396 = _392;
    if (!_180)
    {
        _396 = _176;
    }
    float _398 = _396;
    int _400 = abs(_384);
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (!_180)
    {
        _366 = _170;
    }
    float _404 = _366;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _408 = _404;
    if (_180)
    {
        _408 = _182;
    }
    float _410 = _408;
    float _412 = _398 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _414 = float(_372);
    float _416 = fma(_394, -2.0, _402);
    float _418 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[83].w, _406);
    float _420 = fma(_412, -2.0, _206);
    float _422 = in.m_53.x;
    float _424 = in.m_53.y;
    float _426 = in.m_53.z;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _430 = 1.0 + _428;
    float _432 = -_390;
    float _434 = _432 + 1.0;
    float _436 = 1.0 / _430;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _440 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _442 = isnan(1.0);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _448 = _444 || _446;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _452 = float(_400);
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _456 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _464 = _460 || _462;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _468 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[88].z, _438);
    float _470 = _452 * _414;
    float _472 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[78].z, _450);
    float _474 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[78].w, _454);
    float _476 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[88].w, _466);
    float _478 = _464 ? _434 : 0.0;
    float _480 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _230);
    float _482 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _468);
    bool _484 = !_194;
    int _486 = _484 ? 0 : 1;
    float _488 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _472);
    float _490 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _474);
    float _492 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _476);
    float _494 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _418);
    float _496 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _416);
    float _498 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _420);
    int _500 = as_type<int>(_480);
    if (_448)
    {
        float _502 = _478 * _436;
        _150 = _502;
    }
    float _504 = _150;
    float _506 = fma(_380, _422, _422);
    int _508 = abs(_486);
    float _510 = fma(_266, _380, _266);
    int _512 = _358 ? 0 : 1;
    float _514 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[196].x, _506);
    float _516 = _470 * (-2.0);
    int _518 = ~_512;
    int _520 = _518 + 1;
    int _522 = _520 + 1;
    float _524 = fma(_510, _504, _514);
    int _526 = _522;
    if (!_342)
    {
        int _528 = ~_512;
        int _530 = _528 + 1;
        _526 = _530;
    }
    int _532 = _526;
    float _534 = _182 + (-0.5);
    float _536 = fma(_516, _424, _424);
    float _538 = float(_508);
    float _540 = fma(_256, _516, _256);
    float _542 = float(_532);
    float _544 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[196].y, _536);
    float _546 = _176 + _170;
    float _548 = _524 * 0.15915493667125701904296875;
    float _550 = _538 * _542;
    float _552 = fma(_540, _504, _544);
    float _554 = _546 + (-1.0);
    float _556 = in.m_55.x;
    float _558 = in.m_55.y;
    float _560 = in.m_55.z;
    float _562 = _550 * (-2.0);
    float _564 = _552 * 0.15915493667125701904296875;
    float _566 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _568 = _170 + (-0.5);
    float _570 = fma(_562, _426, _426);
    float _572 = in.m_57.x;
    float _574 = in.m_57.y;
    float _576 = in.m_57.z;
    float _578 = fma(_566, _562, _566);
    float _580 = _548 * 6.283185482025146484375;
    float _582 = cos(_580);
    float _584 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[196].z, _570);
    float _586 = fma(_578, _504, _584);
    float _588 = _564 * 6.283185482025146484375;
    float _590 = sin(_588);
    float _592 = _586 * 0.15915493667125701904296875;
    float _594 = _564 * 6.283185482025146484375;
    float _596 = cos(_594);
    float _598 = _558 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _600 = _560 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _602 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _572);
    float _604 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _574);
    float _606 = _548 * 6.283185482025146484375;
    float _608 = sin(_606);
    float _610 = _600 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _612 = _582 * _590;
    float _614 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _576);
    float _616 = _614 * _610;
    float _618 = _592 * 6.283185482025146484375;
    float _620 = cos(_618);
    float _622 = _556 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _624 = in.m_44.x;
    float _626 = in.m_44.y;
    float _628 = in.m_44.z;
    float _630 = _622 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _632 = _598 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _634 = _592 * 6.283185482025146484375;
    float _636 = sin(_634);
    float _638 = _602 * _630;
    float _640 = _582 * _596;
    float _642 = _604 * _632;
    float _644 = _608 * _590;
    float _646 = _608 * _596;
    float _648 = _582 * _620;
    float _650 = _596 * _620;
    float _652 = _608 * _620;
    float _654 = _590 * _620;
    float _656 = _648 * _642;
    float _658 = fma(_636, _640, _644);
    float _660 = fma(_636, _644, _640);
    float _662 = -_612;
    float _664 = fma(_636, _646, _662);
    float _666 = -_646;
    float _668 = fma(_636, _612, _666);
    float _670 = -_642;
    float _672 = _636 * _670;
    float _674 = fma(_658, _638, _656);
    float _676 = _652 * _642;
    float _678 = _626 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _680 = fma(_650, _638, _672);
    float _682 = fma(_668, _616, _674);
    float _684 = fma(_664, _638, _676);
    float _686 = fma(_624, (*spvDescriptorSet0.vp_c10)._m0[5].x, _678);
    float _688 = fma(_654, _616, _680);
    float _690 = _682 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _692 = fma(_660, _616, _684);
    float _694 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[5].z, _686);
    float _696 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[9].x, _690);
    float _698 = _694 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _700 = fma(_692, (*spvDescriptorSet0.vp_c10)._m0[9].z, _696);
    float _702 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.2800000011920928955078125);
    float _704 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.310000002384185791015625);
    float _706 = _698 + _700;
    float _708 = fma(_706, 0.4000000059604644775390625, _702);
    float _710 = fma(_706, 0.3499999940395355224609375, _704);
    float _712 = _708 * 0.15915493667125701904296875;
    float _714 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.550000011920928955078125);
    float _716 = _710 * 0.15915493667125701904296875;
    float _718 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.60000002384185791015625);
    float _720 = fma(_706, 0.75, _714);
    float _722 = _712 * 6.283185482025146484375;
    float _724 = sin(_722);
    float _726 = fma(_706, 0.85000002384185791015625, _718);
    float _728 = _720 * 0.15915493667125701904296875;
    float _730 = _626 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _732 = _726 * 0.15915493667125701904296875;
    float _734 = _682 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _736 = _626 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _738 = _716 * 6.283185482025146484375;
    float _740 = sin(_738);
    float _742 = fma(_624, (*spvDescriptorSet0.vp_c10)._m0[6].x, _730);
    float _744 = _682 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _746 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[10].x, _734);
    float _748 = fma(_624, (*spvDescriptorSet0.vp_c10)._m0[4].x, _736);
    float _750 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[6].z, _742);
    float _752 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[8].x, _744);
    float _754 = fma(_692, (*spvDescriptorSet0.vp_c10)._m0[10].z, _746);
    float _756 = _728 * 6.283185482025146484375;
    float _758 = sin(_756);
    float _760 = _750 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _762 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[4].z, _748);
    float _764 = fma(_692, (*spvDescriptorSet0.vp_c10)._m0[8].z, _752);
    float _766 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.17000000178813934326171875;
    float _768 = _760 + _754;
    float _770 = _762 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _772 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.300000011920928955078125;
    float _774 = _732 * 6.283185482025146484375;
    float _776 = sin(_774);
    float _778 = fma(_768, 0.550000011920928955078125, _766);
    float _780 = _770 + _764;
    float _782 = _778 * 0.15915493667125701904296875;
    float _784 = fma(_780, 0.89999997615814208984375, _772);
    float _786 = _740 + _758;
    float _788 = _782 * 6.283185482025146484375;
    float _790 = sin(_788);
    float _792 = fma(_786, 0.00999999977648258209228515625, _768);
    float _794 = _724 + _776;
    float _796 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _798 = _792 + _796;
    float _800 = fma(_794, 0.00999999977648258209228515625, _780);
    float _802 = _798 * _798;
    float _804 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _806 = _800 + _804;
    float _808 = fma(_806, _806, _802);
    float _810 = _784 * 0.15915493667125701904296875;
    float _812 = _790 * 0.20999999344348907470703125;
    float _814 = sqrt(_808);
    float _816 = _810 * 6.283185482025146484375;
    float _818 = sin(_816);
    bool _820 = _814 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _822 = fma(_818, 0.300000011920928955078125, _812);
    float _824 = _706 + _822;
    float _826 = _822;
    float _828 = _790;
    float _830 = _812;
    int _832 = as_type<int>(_760);
    if (!_820)
    {
        _826 = _800;
    }
    float _834 = _826;
    float _836 = _834;
    if (!_820)
    {
        _828 = _792;
    }
    float _838 = _828;
    float _840 = _838;
    if (!_820)
    {
        _830 = _824;
    }
    float _842 = _830;
    bool _844 = !_820;
    float _846 = _842;
    if (!_844)
    {
        float _848 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _850 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _852 = _814 + _850;
        float _854 = _824 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _856 = rsqrt(_808);
        float _858 = _852 * _848;
        float _860 = _858 * 0.15915493667125701904296875;
        float _862 = _860 * 6.283185482025146484375;
        float _864 = cos(_862);
        float _866 = _860 * 6.283185482025146484375;
        float _868 = sin(_866);
        float _870 = _864 + (-1.0);
        float _872 = _870 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _874 = fma(_868, _854, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _876 = fma(_824, _864, _872);
        float _878 = _856 * _874;
        float _880 = fma(_806, _878, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _882 = fma(_798, _878, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _846 = _876;
        _836 = _880;
        _840 = _882;
    }
    float _884 = _846;
    float _886 = _836;
    float _888 = _840;
    float _890 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _892 = _884 + _890;
    float _894 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _896 = _886 + _894;
    float _898 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _900 = _888 + _898;
    float _902 = _892 * _892;
    float _904 = fma(_896, _896, _902);
    float _906 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _908 = fma(_900, _900, _904);
    float _910 = fma(_770, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _912 = precise::max(0.0, _906);
    float _914 = rsqrt(_908);
    float _916 = sqrt(_908);
    float _918 = _914 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _920 = floor(_910);
    float _922 = _896 * _918;
    float _924 = _900 * _918;
    float _926 = -_918;
    float _928 = -_912;
    float _930 = fma(_892, _926, _928);
    float _932 = _922 * _922;
    float _934 = _924 * _924;
    float _936 = _932 + _934;
    float _938 = sqrt(_936);
    bool _940 = _938 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _942 = _892;
    float _944 = _912;
    float _946 = _906;
    float _948 = _922;
    float _950 = _924;
    if (!_940)
    {
        _942 = _934;
    }
    float _952 = _942;
    float _954 = _952;
    if (!_940)
    {
        _944 = _932;
    }
    float _956 = _944;
    float _958 = _956;
    if (!_940)
    {
        _946 = _930;
    }
    float _960 = _946;
    bool _962 = !_940;
    float _964 = _960;
    if (!_962)
    {
        float _966 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _968 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _970 = _938 + _968;
        float _972 = rsqrt(_936);
        float _974 = _970 * _966;
        float _976 = _930 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _978 = _974 * 0.15915493667125701904296875;
        float _980 = _978 * 6.283185482025146484375;
        float _982 = sin(_980);
        float _984 = _978 * 6.283185482025146484375;
        float _986 = cos(_984);
        float _988 = fma(_982, _976, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _990 = _972 * _988;
        float _992 = _986 + (-1.0);
        float _994 = _922 * _990;
        float _996 = _924 * _990;
        float _998 = _992 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1000 = _996 * _996;
        float _1002 = fma(_930, _986, _998);
        float _1004 = _994 * _994;
        _964 = _1002;
        _958 = _1004;
        _954 = _1000;
        _948 = _994;
        _950 = _996;
    }
    float _1006 = _964;
    float _1008 = _958;
    float _1010 = _954;
    float _1012 = _948;
    float _1014 = _950;
    float _1016 = fma(_1006, _1006, _1008);
    float _1018 = _884 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1020 = _884 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1022 = _1016 + _1010;
    float _1024 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1018);
    float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1028 = fma(_916, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1026);
    float _1030 = precise::clamp(_1028, 0.0, 1.0);
    float _1032 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1020);
    float _1034 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1024);
    float _1036 = rsqrt(_1022);
    float _1038 = -_1030;
    float _1040 = _1038 + 1.0;
    float _1042 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1044 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1046 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1032);
    float _1048 = _884 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1050 = _1044 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1052 = abs(_1040);
    float _1054 = log2(_1052);
    float _1056 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1058 = fma(_760, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1060 = -_1050;
    float _1062 = fma(_1042, _1060, 1.0);
    float _1064 = _884 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1066 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1048);
    float _1068 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1070 = _1036 * _1012;
    float _1072 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1064);
    float _1074 = _1036 * _1006;
    float _1076 = _1036 * _1014;
    float _1078 = _1070 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1080 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1072);
    float _1082 = floor(_1058);
    float _1084 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1066);
    float _1086 = -_1078;
    float _1088 = fma(_1074, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1086);
    float _1090 = _1080 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1092 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1094 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1096 = -_1076;
    float _1098 = fma(_1096, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1088);
    float _1100 = _1054 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1102 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1092);
    float _1104 = -_920;
    float _1106 = _910 + _1104;
    float _1108 = fma(_1098, -0.5, 0.5);
    float _1110 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1102);
    float _1112 = fma(_1098, 0.5, 0.5);
    float _1114 = exp2(_1100);
    float _1116 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1118 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1110);
    float _1120 = fma(_1112, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1122 = -_1082;
    float _1124 = _1058 + _1122;
    float _1126 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1068);
    float _1128 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1116);
    float _1130 = fma(_1112, _1120, -0.212114393711090087890625);
    float _1132 = log2(_1062);
    float _1134 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1126);
    float _1136 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1128);
    float _1138 = fma(_1112, _1130, 1.570728778839111328125);
    float _1140 = _1074 + 1.0;
    float _1142 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1134);
    float _1144 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1136);
    float _1146 = 1.0 / _1118;
    float _1148 = sqrt(_1108);
    float2 _3783 = float2(_1106, _1124);
    float _1150 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3783, float2(0.0), isnan(_3783)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3783, float2(0.0), isnan(_3783)), level(0.0)).x;
    float _1152 = -_1074;
    float _1154 = fma(_1114, _1140, _1152);
    float _1156 = _1132 * 0.693147182464599609375;
    float _1158 = fma(_1154, 0.5, 0.5);
    float _1160 = _1156 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1162 = _1142 * _1146;
    float _1164 = _1144 * _1146;
    float _1166 = fma(_1162, 0.5, 0.5);
    float _1168 = fma(_1164, -0.5, 0.5);
    float _1170 = _1148 * 0.636619746685028076171875;
    float _1172 = -_1138;
    float _1174 = fma(_1170, _1172, 1.0);
    float3 _3827 = float3(_1166, _1168, _1160);
    float _1176 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3827, float3(0.0), isnan(_3827)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3827, float3(0.0), isnan(_3827)), level(0.0)).x;
    float2 _3837 = float2(_1174, _1158);
    float3 _1180 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3837, float2(0.0), isnan(_3837)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3837, float2(0.0), isnan(_3837)), level(0.0)).xyz;
    float _1182 = _1180.x;
    float _1184 = _1180.y;
    float _1186 = _1180.z;
    float _1188 = in.m_59.w;
    bool _1190 = _182 > 0.5;
    float _1192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1194 = in.m_61.y;
    bool _1196 = _170 > 0.5;
    float _1198 = _1054 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1200 = in.m_51.w;
    float _1202 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1204 = in.m_59.z;
    float _1206 = in.m_59.x;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1210 = in.m_59.y;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1214 = _1212 != 0;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1218 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.w = _1188;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1222 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1226 = _1224 != 0;
    float _1228 = -_1194;
    float _1230 = _1228 + 1.0;
    float _1232 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1236 = _1234 != 0;
    float _1238 = exp2(_1198);
    bool _1240 = _1200 > 0.5;
    float _1242 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1202);
    int _1244 = _1190 ? as_type<int>(_1230) : as_type<int>(_1194);
    out.m_65.x = _1222;
    out.m_65.y = _1232;
    out.m_65.z = _1218;
    int _1246 = _1240 ? as_type<int>(_1230) : as_type<int>(_1194);
    float _1248 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1242);
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1252 = _1250 != 0;
    float _1254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_63.z = _1204;
    float _1256 = _1214 ? as_type<float>(_1244) : _1194;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1260 = _1258 != 0;
    out.m_63.x = _1206;
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1264 = _1262 != 0;
    float _1266 = _698 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1268 = in.m_61.x;
    float _1270 = _1260 ? as_type<float>(_1246) : _1194;
    float _1272 = -_1238;
    float _1274 = _1272 + 1.0;
    float _1276 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1266);
    float _1278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1280 = _1194;
    bool _1282 = _1260;
    int _1284 = as_type<int>(_1266);
    float _1286 = _1230;
    float _1288 = _1118;
    float _1290 = _1144;
    if (_1252)
    {
        float _1292 = _1196 ? _1230 : _1194;
        _1280 = _1292;
    }
    float _1294 = _1280;
    out.m_63.y = _1210;
    float _1296 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1298 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1276);
    if (_1226)
    {
        bool _1300 = _176 > 0.5;
        _1282 = _1300;
    }
    bool _1302 = _1282;
    out.m_67.x = _886;
    out.m_67.y = _884;
    out.m_67.z = _888;
    float _1304 = fma(_1270, _1296, -0.5);
    float _1306 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1308 = _698 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1310 = _1192 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1312 = -_496;
    float _1314 = fma(_494, _1304, _1312);
    float _1316 = fma(_1310, _1256, -0.5);
    float _1318 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1322 = 1.0 / _1306;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1326 = fma(_1318, _1294, -0.5);
    float _1328 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1308);
    float _1330 = _1268;
    if (_1226)
    {
        float _1332 = -_1268;
        float _1334 = _1332 + 1.0;
        _1284 = as_type<int>(_1334);
    }
    int _1336 = _1284;
    if (!_1226)
    {
        _262 = _1268;
    }
    float _1338 = _262;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1342 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1328);
    float _1344 = -_480;
    float _1346 = fma(_490, _1316, _1344);
    float _1348 = _1338;
    if (_1226)
    {
        float _1350 = _1302 ? as_type<float>(_1336) : _1268;
        _1348 = _1350;
    }
    float _1352 = _1348;
    float _1354 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1356 = _1342 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1358 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1360 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1362 = _1356 + _1306;
    float _1364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1366 = _574 != 0.0;
    bool _1368 = isnan(_574);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan(0.0);
    bool _1374 = _1370 || _1372;
    out.m_69.x = _1354;
    out.m_69.y = _1358;
    out.m_69.z = _1360;
    float _1376 = _1362 * _1322;
    float _1378 = _1376 * 0.5;
    float _1380 = _1362;
    if (_1236)
    {
        float _1382 = -_1268;
        float _1384 = _1382 + 1.0;
        _500 = as_type<int>(_1384);
    }
    int _1386 = _500;
    bool _1388 = _572 == 0.0;
    bool _1390 = !_1374;
    bool _1392 = _1388 && _1390;
    float _1394 = in.m_71.x;
    float _1396 = in.m_71.y;
    float _1398 = in.m_71.z;
    float _1400 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1402 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1400);
    if (!_1236)
    {
        _1286 = _1268;
    }
    float _1404 = _1286;
    float _1406 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1408 = _576 == 0.0;
    bool _1410 = _1408 && _1392;
    float _1412 = _1404;
    if (_1264)
    {
        float _1414 = -_1268;
        float _1416 = _1414 + 1.0;
        _832 = as_type<int>(_1416);
    }
    int _1418 = _832;
    float _1420 = as_type<float>(_1418);
    if (_1236)
    {
        float _1422 = _1196 ? as_type<float>(_1386) : _1268;
        _1412 = _1422;
    }
    float _1424 = _1412;
    out.m_73.w = _1118;
    float _1426 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1428 = 1.0 / _1402;
    float _1430 = in.m_75.x;
    float _1432 = in.m_75.y;
    float _1434 = in.m_75.z;
    float _1436 = in.m_75.w;
    float _1438 = _1364;
    if (_1264)
    {
        float _1440 = _1190 ? as_type<float>(_1418) : _1268;
        _1330 = _1440;
    }
    float _1442 = _1330;
    float _1444 = fma(_1426, _1424, -0.5);
    float _1446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1448 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1410)
    {
        _1438 = _1398;
    }
    float _1450 = _1438;
    float _1452 = _1450;
    if (!_1410)
    {
        float _1454 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1398);
        _1452 = _1454;
    }
    float _1456 = _1452;
    float _1458 = fma(_334, _1444, _346);
    float _1460 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1462 = _1428 * _1460;
    float _1464 = fma(_1448, _1352, -0.5);
    if (_1410)
    {
        _1380 = _1394;
    }
    float _1466 = _1380;
    float _1468 = _1466;
    if (!_1410)
    {
        float _1470 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1394);
        _1468 = _1470;
    }
    float _1472 = _1468;
    float _1474 = abs(_1462);
    float _1476 = log2(_1474);
    if (_1410)
    {
        _1420 = _1396;
    }
    float _1478 = _1420;
    float _1480 = fma(_488, _1464, _226);
    float _1482 = _1478;
    if (!_1410)
    {
        float _1484 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1396);
        _1482 = _1484;
    }
    float _1486 = _1482;
    float _1488 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1490 = _1434 * _1394;
    float _1492 = _1432 * _1398;
    float _1494 = _1430 * _1396;
    float _1496 = fma(_1488, _1442, -0.5);
    float _1498 = -_1490;
    float _1500 = fma(_1430, _1398, _1498);
    float _1502 = -_1492;
    float _1504 = fma(_1434, _1396, _1502);
    float _1506 = -_1494;
    float _1508 = fma(_1432, _1394, _1506);
    float _1510 = fma(_482, _1496, _340);
    float _1512 = -_498;
    float _1514 = fma(_492, _1326, _1512);
    float _1516 = _1346 + 0.5;
    float _1518 = _1480 + 0.5;
    float _1520 = _1476 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1522 = _1458 + 0.5;
    float _1524 = _1314 + 0.5;
    float _1526 = _1500 * _1436;
    float _1528 = _1510 + 0.5;
    float _1530 = _1504 * _1436;
    float _1532 = exp2(_1520);
    float _1534 = _1508 * _1436;
    float _1536 = -_1486;
    float _1538 = _636 * _1536;
    float _1540 = -_1432;
    float _1542 = _636 * _1540;
    out.m_77.x = _1518;
    out.m_77.y = _1516;
    out.m_77.z = _1522;
    out.m_77.w = _1524;
    float _1544 = -_1526;
    float _1546 = _636 * _1544;
    float _1548 = fma(_650, _1472, _1538);
    float _1550 = fma(_650, _1430, _1542);
    float _1552 = fma(_650, _1530, _1546);
    float _1554 = _648 * _1432;
    float _1556 = _652 * _1432;
    float _1558 = fma(_654, _1434, _1550);
    float _1560 = _1514 + 0.5;
    float _1562 = fma(_658, _1430, _1554);
    float _1564 = fma(_664, _1430, _1556);
    float _1566 = fma(_1532, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1568 = precise::clamp(_1566, 0.0, 1.0);
    float _1570 = fma(_654, _1534, _1552);
    float _1572 = _648 * _1486;
    float _1574 = _648 * _1526;
    float _1576 = _652 * _1486;
    float _1578 = _652 * _1526;
    float _1580 = fma(_658, _1472, _1572);
    float _1582 = fma(_658, _1530, _1574);
    float _1584 = fma(_664, _1472, _1576);
    float _1586 = fma(_668, _1434, _1562);
    float _1588 = fma(_668, _1456, _1580);
    float _1590 = fma(_660, _1434, _1564);
    float _1592 = fma(_664, _1530, _1578);
    float _1594 = fma(_654, _1456, _1548);
    float _1596 = fma(_668, _1534, _1582);
    float _1598 = fma(_1568, -2.0, 3.0);
    float _1600 = _1568 * _1568;
    float _1602 = fma(_660, _1456, _1584);
    float _1604 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1606 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1608 = _1600 * _1598;
    out.m_79.x = _1528;
    out.m_79.y = _1560;
    float _1610 = fma(_660, _1534, _1592);
    float _1612 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1614 = _1596 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1616 = _1596 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1618 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1604);
    float _1620 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1606);
    float _1622 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1612);
    float _1624 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1614);
    float _1626 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1616);
    float _1628 = _1596 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1630 = fma(_1590, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1618);
    float _1632 = fma(_1590, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1620);
    float _1634 = fma(_1590, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1622);
    float _1636 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1628);
    float _1638 = fma(_1610, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1624);
    float _1640 = -_1608;
    float _1642 = _1640 + 1.0;
    float _1644 = in.m_81.x;
    float _1646 = fma(_1610, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1636);
    float _1648 = fma(_1610, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1626);
    float _1650 = _1588 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1652 = _1588 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1654 = _1588 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1656 = _1462 <= 8000.0;
    bool _1658 = isnan(_1462);
    bool _1660 = _1656 || _1658;
    bool _1662 = isnan(8000.0);
    bool _1664 = _1660 || _1662;
    float _1666 = float(_1664);
    float _1668 = fma(_1642, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1608);
    float _1670 = fma(_1594, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1650);
    float _1672 = fma(_1594, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1652);
    float _1674 = fma(_1594, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1654);
    float _1676 = _1666 * _1668;
    out.m_83.x = _1634;
    out.m_83.y = _1630;
    out.m_83.z = _1632;
    float _1678 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1248);
    float _1680 = _1142 + _1118;
    float _1682 = _1118 * 0.5;
    out.m_85.x = _1638;
    out.m_85.y = _1646;
    out.m_85.z = _1648;
    float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1686 = _1678 + _1684;
    float _1688 = _1680 * 0.5;
    float _1690 = fma(_1144, -0.5, _1682);
    bool _1692 = _916 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1694 = isnan(_916);
    bool _1696 = _1692 || _1694;
    bool _1698 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1700 = _1696 || _1698;
    out.gl_Position.x = _1142;
    out.gl_Position.y = _1144;
    out.gl_Position.z = _1686;
    out.gl_Position.w = _1118;
    float _1702 = fma(_1602, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1674);
    float _1704 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1706 = fma(_1602, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1670);
    float _1708 = fma(_1602, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1672);
    out.m_73.x = _1688;
    out.m_73.y = _1690;
    float _1710 = _1274 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_87.x = _1706;
    out.m_87.y = _1708;
    out.m_87.z = _1702;
    float _1712 = _1686;
    float _1714 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _1716 = _1710;
    if (!_1700)
    {
        _1288 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1718 = _1288;
    float _1720 = -_1710;
    float _1722 = _1720 + 1.0;
    float _1724 = _1718;
    float _1726 = _1718;
    if (!_1700)
    {
        _1712 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1728 = _1712;
    float _1730 = _1728;
    float _1732 = _1728;
    if (!_1700)
    {
        _1290 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1734 = _1290;
    float _1736 = -_1150;
    float _1738 = _1736 + 1.0;
    float _1740 = _1738 * _1704;
    float _1742 = precise::clamp(_1740, 0.0, 1.0);
    float _1744 = -_1742;
    float _1746 = fma(_1744, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1748 = _1734;
    float _1750 = _1734;
    if (!_1700)
    {
        _1714 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1752 = _1714;
    float _1754 = _1746 * _1644;
    float _1756 = _1754 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1758 = _1754;
    float _1760 = _1752;
    float _1762 = _1752;
    if (!_1700)
    {
        _1758 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1764 = _1758;
    float _1766 = _1710 * _1176;
    out.m_89.x = _1756;
    float _1768 = _1764;
    float _1770 = _1764;
    if (!_1700)
    {
        _1716 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1772 = _1716;
    float _1774 = _1182 * _1766;
    float _1776 = _1184 * _1766;
    float _1778 = _1186 * _1766;
    out.m_91.x = _1774;
    out.m_91.y = _1776;
    out.m_91.z = _1778;
    out.m_91.w = _1722;
    bool _1780 = !_1700;
    float _1782 = _1772;
    float _1784 = _1772;
    if (!_1780)
    {
        bool _1786 = _916 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1788 = isnan(_916);
        bool _1790 = _1786 || _1788;
        bool _1792 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1794 = _1790 || _1792;
        if (!_1794)
        {
            float _1796 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1798 = _916 + _1796;
            float _1800 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1802 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1800;
            float _1804 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1806 = _1804 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1808 = 1.0 / _1802;
            float _1810 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1812 = _1810 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1814 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1816 = _1814 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1818 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1820 = _1818 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1822 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1824 = _1822 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1826 = _1798 * _1808;
            float _1828 = precise::clamp(_1826, 0.0, 1.0);
            float _1830 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1832 = _1830 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1834 = fma(_1828, _1806, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1836 = fma(_1828, _1832, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1838 = fma(_1828, _1812, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1840 = fma(_1828, _1816, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1842 = fma(_1828, _1820, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1844 = fma(_1828, _1824, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1726 = _1838;
            _1784 = _1842;
            _1762 = _1834;
            _1750 = _1840;
            _1732 = _1836;
            _1770 = _1844;
            _1846 = true;
        }
        else
        {
            bool _1848 = _916 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1850 = isnan(_916);
            bool _1852 = _1848 || _1850;
            bool _1854 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1856 = _1852 || _1854;
            if (!_1856)
            {
                _1760 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1858 = _1760;
            _1762 = _1858;
            if (!_1856)
            {
                _1724 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1860 = _1724;
            _1726 = _1860;
            if (!_1856)
            {
                _1730 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1862 = _1730;
            _1732 = _1862;
            if (!_1856)
            {
                _1748 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1864 = _1748;
            _1750 = _1864;
            if (!_1856)
            {
                _1782 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1866 = _1782;
            _1784 = _1866;
            if (!_1856)
            {
                _1768 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1868 = _1768;
            bool _1870 = !_1856;
            _1770 = _1868;
            if (!_1870)
            {
                bool _1872 = _916 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1874 = isnan(_916);
                bool _1876 = _1872 || _1874;
                bool _1878 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1880 = _1876 || _1878;
                if (!_1880)
                {
                    float _1882 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1884 = _916 + _1882;
                    float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1888 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1886;
                    float _1890 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1892 = _1890 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1894 = 1.0 / _1888;
                    float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1898 = _1896 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1900 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1902 = _1900 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1904 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1906 = _1904 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1908 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1910 = _1908 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1912 = _1884 * _1894;
                    float _1914 = precise::clamp(_1912, 0.0, 1.0);
                    float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1918 = _1916 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1920 = fma(_1914, _1892, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1922 = fma(_1914, _1918, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1924 = fma(_1914, _1898, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1926 = fma(_1914, _1902, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1928 = fma(_1914, _1906, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1930 = fma(_1914, _1910, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1726 = _1924;
                    _1784 = _1928;
                    _1762 = _1920;
                    _1750 = _1926;
                    _1732 = _1922;
                    _1770 = _1930;
                    _1846 = true;
                }
                else
                {
                    _1726 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1784 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1762 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1750 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1732 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1770 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1846 = false;
    float _1932 = _1726;
    float _1934 = _1784;
    float _1936 = _1762;
    float _1938 = _1750;
    float _1940 = _1732;
    float _1942 = _1770;
    float _1944 = fma(_1708, -0.5, 0.5);
    float _1946 = precise::clamp(_1944, 0.0, 1.0);
    float _1948 = -_1932;
    float _1950 = _1948 + _1934;
    float _1952 = -_1936;
    float _1954 = _1952 + _1938;
    float _1956 = -_1940;
    float _1958 = _1956 + _1942;
    bool _1960 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1962 = fma(_1946, _1950, _1932);
    float _1964 = fma(_1946, _1954, _1936);
    float _1966 = fma(_1946, _1958, _1940);
    float _1968 = _1962 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _1970 = fma(_1964, 0.298911988735198974609375, _1968);
    out.m_89.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1972 = fma(_1966, 0.114477999508380889892578125, _1970);
    float _1974 = -_1972;
    float _1976 = _1964 + _1974;
    float _1978 = -_1972;
    float _1980 = _1962 + _1978;
    float _1982 = -_1972;
    float _1984 = _1966 + _1982;
    out.m_93.x = 0.0;
    float _1986 = fma(_1976, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1972);
    float _1988 = fma(_1980, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1972);
    float _1990 = fma(_1984, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1972);
    out.m_95.x = _1986;
    out.m_95.y = _1988;
    out.m_95.z = _1990;
    if (!_1960)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1992 = -_884;
    float _1994 = _1992 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1996 = -_886;
    float _1998 = _1996 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2000 = -_888;
    float _2002 = _2000 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2004 = _1994 * _1994;
    float _2006 = fma(_1998, _1998, _2004);
    float _2008 = fma(_2002, _2002, _2006);
    float _2010 = sqrt(_2008);
    float _2012 = rsqrt(_2008);
    float _2014 = -_2010;
    float _2016 = _2014 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2018 = _2016 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2020 = precise::clamp(_2018, 0.0, 1.0);
    float _2022 = _1998 * _2012;
    float _2024 = _1994 * _2012;
    float _2026 = abs(_2020);
    float _2028 = log2(_2026);
    float _2030 = _2002 * _2012;
    float _2032 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2034 = _1708 * _2024;
    float _2036 = -_2024;
    float _2038 = -_2032;
    float _2040 = fma(_2036, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2038);
    float _2042 = fma(_1706, _2022, _2034);
    float _2044 = -_2030;
    float _2046 = fma(_2044, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2040);
    float _2048 = fma(_1702, _2030, _2042);
    float _2050 = precise::clamp(_2048, 0.0, 1.0);
    float _2052 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2054 = _2046 + _2052;
    float _2056 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2058 = _2054 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2060 = precise::clamp(_2058, 0.0, 1.0);
    float _2062 = exp2(_2056);
    float _2064 = _2062 * _2060;
    float _2066 = _2050 * _2064;
    float _2068 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2070 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2072 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2068;
    out.m_93.y = _2070;
    out.m_93.z = _2072;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1846 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2130 = as_type<float>(_130);
        out.gl_Position.z = _2130;
    }
    if (!_118)
    {
        return out;
    }
    float _134 = in.m_49.w;
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
        out.m_47.x = 0.0;
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
        float _2200 = as_type<float>(_168);
        out.gl_Position.z = _2200;
    }
    if (_160)
    {
        return out;
    }
    float _170 = in.m_51.z;
    float _172 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _174 = log2(_172);
    float _176 = in.m_51.x;
    int _178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _180 = _178 != 0;
    float _182 = in.m_51.y;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _186 = _184 != 0;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _190 = _188 != 0;
    int _192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _194 = _192 != 0;
    float _196 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _198 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _202 = _170 * 2.0;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _208 = _176 * 2.0;
    float _210 = _176 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _212 = floor(_202);
    float _214 = _182 + _170;
    float _216 = -_196;
    float _218 = fma(_210, 2.0, _216);
    float _220 = _182 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _222 = _182 * 2.0;
    float _224 = -_148;
    float _226 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[76].x, _218);
    float _228 = floor(_208);
    float _230 = fma(_220, -2.0, _198);
    float _232 = _176 + (-0.5);
    bool _234 = _212 > 0.0;
    float _236 = _214 + (-1.0);
    bool _238 = _212 >= 0.0;
    bool _240 = isnan(_212);
    bool _242 = _238 || _240;
    bool _244 = isnan(0.0);
    bool _246 = _242 || _244;
    float _248 = _182 + _176;
    float _250 = floor(_222);
    int _252 = _246 ? 0 : 1;
    float _254 = _248 + (-1.0);
    float _256 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _258 = _236;
    float _260 = _254;
    float _262 = _176;
    if (!_180)
    {
        _258 = _182;
    }
    float _264 = _258;
    float _266 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _268 = ~_252;
    int _270 = _268 + 1;
    int _272 = _270 + 1;
    int _274 = _272;
    float _276 = _264;
    if (_180)
    {
        _260 = _176;
    }
    float _278 = _260;
    float _280 = _278;
    if (!_234)
    {
        int _282 = ~_252;
        int _284 = _282 + 1;
        _274 = _284;
    }
    int _286 = _274;
    if (!_180)
    {
        _280 = _170;
    }
    float _288 = _280;
    if (_180)
    {
        _276 = _176;
    }
    float _290 = _276;
    bool _292 = _228 > 0.0;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _296 = _228 >= 0.0;
    bool _298 = isnan(_228);
    bool _300 = _296 || _298;
    bool _302 = isnan(0.0);
    bool _304 = _300 || _302;
    float _306 = _288 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _308 = _290 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _310 = float(_286);
    float _312 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[83].z, _204);
    int _314 = _304 ? 0 : 1;
    float _316 = -_294;
    float _318 = fma(_308, 2.0, _316);
    bool _320 = !_186;
    float _322 = _320 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _324 = -_200;
    float _326 = fma(_306, 2.0, _324);
    int _328 = ~_314;
    int _330 = _328 + 1;
    int _332 = _330 + 1;
    float _334 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _312);
    int _336 = abs(as_type<int>(_322));
    float _338 = -_148;
    float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[86].x, _326);
    bool _342 = _250 > 0.0;
    float _344 = -_148;
    float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[81].x, _318);
    float _348 = float(_336);
    bool _350 = _250 >= 0.0;
    bool _352 = isnan(_250);
    bool _354 = _350 || _352;
    bool _356 = isnan(0.0);
    bool _358 = _354 || _356;
    int _360 = _332;
    float _362 = _306;
    float _364 = _322;
    float _366 = _290;
    if (!_292)
    {
        int _368 = ~_314;
        int _370 = _368 + 1;
        _360 = _370;
    }
    int _372 = _360;
    float _374 = _348 * _310;
    if (!_180)
    {
        _362 = _170;
    }
    float _376 = _362;
    float _378 = _174 * _148;
    float _380 = _374 * (-2.0);
    bool _382 = !_190;
    int _384 = _382 ? 0 : 1;
    float _386 = _376;
    if (_180)
    {
        _386 = _182;
    }
    float _388 = _386;
    float _390 = exp2(_378);
    if (_180)
    {
        _364 = _182;
    }
    float _392 = _364;
    float _394 = _388 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _396 = _392;
    if (!_180)
    {
        _396 = _176;
    }
    float _398 = _396;
    int _400 = abs(_384);
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (!_180)
    {
        _366 = _170;
    }
    float _404 = _366;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _408 = _404;
    if (_180)
    {
        _408 = _182;
    }
    float _410 = _408;
    float _412 = _398 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _414 = float(_372);
    float _416 = fma(_394, -2.0, _402);
    float _418 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[83].w, _406);
    float _420 = fma(_412, -2.0, _206);
    float _422 = in.m_53.x;
    float _424 = in.m_53.y;
    float _426 = in.m_53.z;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _430 = 1.0 + _428;
    float _432 = -_390;
    float _434 = _432 + 1.0;
    float _436 = 1.0 / _430;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _440 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _442 = isnan(1.0);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _448 = _444 || _446;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _452 = float(_400);
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _456 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _464 = _460 || _462;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _468 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[88].z, _438);
    float _470 = _452 * _414;
    float _472 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[78].z, _450);
    float _474 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[78].w, _454);
    float _476 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[88].w, _466);
    float _478 = _464 ? _434 : 0.0;
    float _480 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _230);
    float _482 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _468);
    bool _484 = !_194;
    int _486 = _484 ? 0 : 1;
    float _488 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _472);
    float _490 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _474);
    float _492 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _476);
    float _494 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _418);
    float _496 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _416);
    float _498 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _420);
    int _500 = as_type<int>(_480);
    if (_448)
    {
        float _502 = _478 * _436;
        _150 = _502;
    }
    float _504 = _150;
    float _506 = fma(_380, _422, _422);
    int _508 = abs(_486);
    float _510 = fma(_266, _380, _266);
    int _512 = _358 ? 0 : 1;
    float _514 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[196].x, _506);
    float _516 = _470 * (-2.0);
    int _518 = ~_512;
    int _520 = _518 + 1;
    int _522 = _520 + 1;
    float _524 = fma(_510, _504, _514);
    int _526 = _522;
    if (!_342)
    {
        int _528 = ~_512;
        int _530 = _528 + 1;
        _526 = _530;
    }
    int _532 = _526;
    float _534 = _182 + (-0.5);
    float _536 = fma(_516, _424, _424);
    float _538 = float(_508);
    float _540 = fma(_256, _516, _256);
    float _542 = float(_532);
    float _544 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[196].y, _536);
    float _546 = _176 + _170;
    float _548 = _524 * 0.15915493667125701904296875;
    float _550 = _538 * _542;
    float _552 = fma(_540, _504, _544);
    float _554 = _546 + (-1.0);
    float _556 = in.m_55.x;
    float _558 = in.m_55.y;
    float _560 = in.m_55.z;
    float _562 = _550 * (-2.0);
    float _564 = _552 * 0.15915493667125701904296875;
    float _566 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _568 = _170 + (-0.5);
    float _570 = fma(_562, _426, _426);
    float _572 = in.m_57.x;
    float _574 = in.m_57.y;
    float _576 = in.m_57.z;
    float _578 = fma(_566, _562, _566);
    float _580 = _548 * 6.283185482025146484375;
    float _582 = cos(_580);
    float _584 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[196].z, _570);
    float _586 = fma(_578, _504, _584);
    float _588 = _564 * 6.283185482025146484375;
    float _590 = sin(_588);
    float _592 = _586 * 0.15915493667125701904296875;
    float _594 = _564 * 6.283185482025146484375;
    float _596 = cos(_594);
    float _598 = _558 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _600 = _560 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _602 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _572);
    float _604 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _574);
    float _606 = _548 * 6.283185482025146484375;
    float _608 = sin(_606);
    float _610 = _600 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _612 = _582 * _590;
    float _614 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _576);
    float _616 = _614 * _610;
    float _618 = _592 * 6.283185482025146484375;
    float _620 = cos(_618);
    float _622 = _556 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _624 = in.m_44.x;
    float _626 = in.m_44.y;
    float _628 = in.m_44.z;
    float _630 = _622 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _632 = _598 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _634 = _592 * 6.283185482025146484375;
    float _636 = sin(_634);
    float _638 = _602 * _630;
    float _640 = _582 * _596;
    float _642 = _604 * _632;
    float _644 = _608 * _590;
    float _646 = _608 * _596;
    float _648 = _582 * _620;
    float _650 = _596 * _620;
    float _652 = _608 * _620;
    float _654 = _590 * _620;
    float _656 = _648 * _642;
    float _658 = fma(_636, _640, _644);
    float _660 = fma(_636, _644, _640);
    float _662 = -_612;
    float _664 = fma(_636, _646, _662);
    float _666 = -_646;
    float _668 = fma(_636, _612, _666);
    float _670 = -_642;
    float _672 = _636 * _670;
    float _674 = fma(_658, _638, _656);
    float _676 = _652 * _642;
    float _678 = _626 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _680 = fma(_650, _638, _672);
    float _682 = fma(_668, _616, _674);
    float _684 = fma(_664, _638, _676);
    float _686 = fma(_624, (*spvDescriptorSet0.vp_c10)._m0[5].x, _678);
    float _688 = fma(_654, _616, _680);
    float _690 = _682 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _692 = fma(_660, _616, _684);
    float _694 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[5].z, _686);
    float _696 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[9].x, _690);
    float _698 = _694 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _700 = fma(_692, (*spvDescriptorSet0.vp_c10)._m0[9].z, _696);
    float _702 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.2800000011920928955078125);
    float _704 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.310000002384185791015625);
    float _706 = _698 + _700;
    float _708 = fma(_706, 0.4000000059604644775390625, _702);
    float _710 = fma(_706, 0.3499999940395355224609375, _704);
    float _712 = _708 * 0.15915493667125701904296875;
    float _714 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.550000011920928955078125);
    float _716 = _710 * 0.15915493667125701904296875;
    float _718 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.60000002384185791015625);
    float _720 = fma(_706, 0.75, _714);
    float _722 = _712 * 6.283185482025146484375;
    float _724 = sin(_722);
    float _726 = fma(_706, 0.85000002384185791015625, _718);
    float _728 = _720 * 0.15915493667125701904296875;
    float _730 = _626 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _732 = _726 * 0.15915493667125701904296875;
    float _734 = _682 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _736 = _626 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _738 = _716 * 6.283185482025146484375;
    float _740 = sin(_738);
    float _742 = fma(_624, (*spvDescriptorSet0.vp_c10)._m0[6].x, _730);
    float _744 = _682 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _746 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[10].x, _734);
    float _748 = fma(_624, (*spvDescriptorSet0.vp_c10)._m0[4].x, _736);
    float _750 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[6].z, _742);
    float _752 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[8].x, _744);
    float _754 = fma(_692, (*spvDescriptorSet0.vp_c10)._m0[10].z, _746);
    float _756 = _728 * 6.283185482025146484375;
    float _758 = sin(_756);
    float _760 = _750 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _762 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[4].z, _748);
    float _764 = fma(_692, (*spvDescriptorSet0.vp_c10)._m0[8].z, _752);
    float _766 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.17000000178813934326171875;
    float _768 = _760 + _754;
    float _770 = _762 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _772 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.300000011920928955078125;
    float _774 = _732 * 6.283185482025146484375;
    float _776 = sin(_774);
    float _778 = fma(_768, 0.550000011920928955078125, _766);
    float _780 = _770 + _764;
    float _782 = _778 * 0.15915493667125701904296875;
    float _784 = fma(_780, 0.89999997615814208984375, _772);
    float _786 = _740 + _758;
    float _788 = _782 * 6.283185482025146484375;
    float _790 = sin(_788);
    float _792 = fma(_786, 0.00999999977648258209228515625, _768);
    float _794 = _724 + _776;
    float _796 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _798 = _792 + _796;
    float _800 = fma(_794, 0.00999999977648258209228515625, _780);
    float _802 = _798 * _798;
    float _804 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _806 = _800 + _804;
    float _808 = fma(_806, _806, _802);
    float _810 = _784 * 0.15915493667125701904296875;
    float _812 = _790 * 0.20999999344348907470703125;
    float _814 = sqrt(_808);
    float _816 = _810 * 6.283185482025146484375;
    float _818 = sin(_816);
    bool _820 = _814 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _822 = fma(_818, 0.300000011920928955078125, _812);
    float _824 = _706 + _822;
    float _826 = _822;
    float _828 = _790;
    float _830 = _812;
    int _832 = as_type<int>(_760);
    if (!_820)
    {
        _826 = _800;
    }
    float _834 = _826;
    float _836 = _834;
    if (!_820)
    {
        _828 = _792;
    }
    float _838 = _828;
    float _840 = _838;
    if (!_820)
    {
        _830 = _824;
    }
    float _842 = _830;
    bool _844 = !_820;
    float _846 = _842;
    if (!_844)
    {
        float _848 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _850 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _852 = _814 + _850;
        float _854 = _824 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _856 = rsqrt(_808);
        float _858 = _852 * _848;
        float _860 = _858 * 0.15915493667125701904296875;
        float _862 = _860 * 6.283185482025146484375;
        float _864 = cos(_862);
        float _866 = _860 * 6.283185482025146484375;
        float _868 = sin(_866);
        float _870 = _864 + (-1.0);
        float _872 = _870 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _874 = fma(_868, _854, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _876 = fma(_824, _864, _872);
        float _878 = _856 * _874;
        float _880 = fma(_806, _878, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _882 = fma(_798, _878, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _846 = _876;
        _836 = _880;
        _840 = _882;
    }
    float _884 = _846;
    float _886 = _836;
    float _888 = _840;
    float _890 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _892 = _884 + _890;
    float _894 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _896 = _886 + _894;
    float _898 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _900 = _888 + _898;
    float _902 = _892 * _892;
    float _904 = fma(_896, _896, _902);
    float _906 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _908 = fma(_900, _900, _904);
    float _910 = fma(_770, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _912 = precise::max(0.0, _906);
    float _914 = rsqrt(_908);
    float _916 = sqrt(_908);
    float _918 = _914 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _920 = floor(_910);
    float _922 = _896 * _918;
    float _924 = _900 * _918;
    float _926 = -_918;
    float _928 = -_912;
    float _930 = fma(_892, _926, _928);
    float _932 = _922 * _922;
    float _934 = _924 * _924;
    float _936 = _932 + _934;
    float _938 = sqrt(_936);
    bool _940 = _938 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _942 = _892;
    float _944 = _912;
    float _946 = _906;
    float _948 = _922;
    float _950 = _924;
    if (!_940)
    {
        _942 = _934;
    }
    float _952 = _942;
    float _954 = _952;
    if (!_940)
    {
        _944 = _932;
    }
    float _956 = _944;
    float _958 = _956;
    if (!_940)
    {
        _946 = _930;
    }
    float _960 = _946;
    bool _962 = !_940;
    float _964 = _960;
    if (!_962)
    {
        float _966 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _968 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _970 = _938 + _968;
        float _972 = rsqrt(_936);
        float _974 = _970 * _966;
        float _976 = _930 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _978 = _974 * 0.15915493667125701904296875;
        float _980 = _978 * 6.283185482025146484375;
        float _982 = sin(_980);
        float _984 = _978 * 6.283185482025146484375;
        float _986 = cos(_984);
        float _988 = fma(_982, _976, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _990 = _972 * _988;
        float _992 = _986 + (-1.0);
        float _994 = _922 * _990;
        float _996 = _924 * _990;
        float _998 = _992 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1000 = _996 * _996;
        float _1002 = fma(_930, _986, _998);
        float _1004 = _994 * _994;
        _964 = _1002;
        _958 = _1004;
        _954 = _1000;
        _948 = _994;
        _950 = _996;
    }
    float _1006 = _964;
    float _1008 = _958;
    float _1010 = _954;
    float _1012 = _948;
    float _1014 = _950;
    float _1016 = fma(_1006, _1006, _1008);
    float _1018 = _884 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1020 = _884 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1022 = _1016 + _1010;
    float _1024 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1018);
    float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1028 = fma(_916, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1026);
    float _1030 = precise::clamp(_1028, 0.0, 1.0);
    float _1032 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1020);
    float _1034 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1024);
    float _1036 = rsqrt(_1022);
    float _1038 = -_1030;
    float _1040 = _1038 + 1.0;
    float _1042 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1044 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1046 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1032);
    float _1048 = _884 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1050 = _1044 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1052 = abs(_1040);
    float _1054 = log2(_1052);
    float _1056 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1058 = fma(_760, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1060 = -_1050;
    float _1062 = fma(_1042, _1060, 1.0);
    float _1064 = _884 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1066 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1048);
    float _1068 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1070 = _1036 * _1012;
    float _1072 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1064);
    float _1074 = _1036 * _1006;
    float _1076 = _1036 * _1014;
    float _1078 = _1070 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1080 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1072);
    float _1082 = floor(_1058);
    float _1084 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1066);
    float _1086 = -_1078;
    float _1088 = fma(_1074, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1086);
    float _1090 = _1080 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1092 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1094 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1096 = -_1076;
    float _1098 = fma(_1096, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1088);
    float _1100 = _1054 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1102 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1092);
    float _1104 = -_920;
    float _1106 = _910 + _1104;
    float _1108 = fma(_1098, -0.5, 0.5);
    float _1110 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1102);
    float _1112 = fma(_1098, 0.5, 0.5);
    float _1114 = exp2(_1100);
    float _1116 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1118 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1110);
    float _1120 = fma(_1112, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1122 = -_1082;
    float _1124 = _1058 + _1122;
    float _1126 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1068);
    float _1128 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1116);
    float _1130 = fma(_1112, _1120, -0.212114393711090087890625);
    float _1132 = log2(_1062);
    float _1134 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1126);
    float _1136 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1128);
    float _1138 = fma(_1112, _1130, 1.570728778839111328125);
    float _1140 = _1074 + 1.0;
    float _1142 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1134);
    float _1144 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1136);
    float _1146 = 1.0 / _1118;
    float _1148 = sqrt(_1108);
    float2 _3783 = float2(_1106, _1124);
    float _1150 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3783, float2(0.0), isnan(_3783)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3783, float2(0.0), isnan(_3783)), level(0.0)).x;
    float _1152 = -_1074;
    float _1154 = fma(_1114, _1140, _1152);
    float _1156 = _1132 * 0.693147182464599609375;
    float _1158 = fma(_1154, 0.5, 0.5);
    float _1160 = _1156 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1162 = _1142 * _1146;
    float _1164 = _1144 * _1146;
    float _1166 = fma(_1162, 0.5, 0.5);
    float _1168 = fma(_1164, -0.5, 0.5);
    float _1170 = _1148 * 0.636619746685028076171875;
    float _1172 = -_1138;
    float _1174 = fma(_1170, _1172, 1.0);
    float3 _3827 = float3(_1166, _1168, _1160);
    float _1176 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3827, float3(0.0), isnan(_3827)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3827, float3(0.0), isnan(_3827)), level(0.0)).x;
    float2 _3837 = float2(_1174, _1158);
    float3 _1180 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3837, float2(0.0), isnan(_3837)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3837, float2(0.0), isnan(_3837)), level(0.0)).xyz;
    float _1182 = _1180.x;
    float _1184 = _1180.y;
    float _1186 = _1180.z;
    float _1188 = in.m_59.w;
    bool _1190 = _182 > 0.5;
    float _1192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1194 = in.m_61.y;
    bool _1196 = _170 > 0.5;
    float _1198 = _1054 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1200 = in.m_51.w;
    float _1202 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1204 = in.m_59.z;
    float _1206 = in.m_59.x;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1210 = in.m_59.y;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1214 = _1212 != 0;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1218 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.w = _1188;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1222 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1226 = _1224 != 0;
    float _1228 = -_1194;
    float _1230 = _1228 + 1.0;
    float _1232 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1236 = _1234 != 0;
    float _1238 = exp2(_1198);
    bool _1240 = _1200 > 0.5;
    float _1242 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1202);
    int _1244 = _1190 ? as_type<int>(_1230) : as_type<int>(_1194);
    out.m_65.x = _1222;
    out.m_65.y = _1232;
    out.m_65.z = _1218;
    int _1246 = _1240 ? as_type<int>(_1230) : as_type<int>(_1194);
    float _1248 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1242);
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1252 = _1250 != 0;
    float _1254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_63.z = _1204;
    float _1256 = _1214 ? as_type<float>(_1244) : _1194;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1260 = _1258 != 0;
    out.m_63.x = _1206;
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1264 = _1262 != 0;
    float _1266 = _698 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1268 = in.m_61.x;
    float _1270 = _1260 ? as_type<float>(_1246) : _1194;
    float _1272 = -_1238;
    float _1274 = _1272 + 1.0;
    float _1276 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1266);
    float _1278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1280 = _1194;
    bool _1282 = _1260;
    int _1284 = as_type<int>(_1266);
    float _1286 = _1230;
    float _1288 = _1118;
    float _1290 = _1144;
    if (_1252)
    {
        float _1292 = _1196 ? _1230 : _1194;
        _1280 = _1292;
    }
    float _1294 = _1280;
    out.m_63.y = _1210;
    float _1296 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1298 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1276);
    if (_1226)
    {
        bool _1300 = _176 > 0.5;
        _1282 = _1300;
    }
    bool _1302 = _1282;
    out.m_67.x = _886;
    out.m_67.y = _884;
    out.m_67.z = _888;
    float _1304 = fma(_1270, _1296, -0.5);
    float _1306 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1308 = _698 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1310 = _1192 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1312 = -_496;
    float _1314 = fma(_494, _1304, _1312);
    float _1316 = fma(_1310, _1256, -0.5);
    float _1318 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1322 = 1.0 / _1306;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1326 = fma(_1318, _1294, -0.5);
    float _1328 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1308);
    float _1330 = _1268;
    if (_1226)
    {
        float _1332 = -_1268;
        float _1334 = _1332 + 1.0;
        _1284 = as_type<int>(_1334);
    }
    int _1336 = _1284;
    if (!_1226)
    {
        _262 = _1268;
    }
    float _1338 = _262;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1342 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1328);
    float _1344 = -_480;
    float _1346 = fma(_490, _1316, _1344);
    float _1348 = _1338;
    if (_1226)
    {
        float _1350 = _1302 ? as_type<float>(_1336) : _1268;
        _1348 = _1350;
    }
    float _1352 = _1348;
    float _1354 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1356 = _1342 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1358 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1360 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1362 = _1356 + _1306;
    float _1364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1366 = _574 != 0.0;
    bool _1368 = isnan(_574);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan(0.0);
    bool _1374 = _1370 || _1372;
    out.m_69.x = _1354;
    out.m_69.y = _1358;
    out.m_69.z = _1360;
    float _1376 = _1362 * _1322;
    float _1378 = _1376 * 0.5;
    float _1380 = _1362;
    if (_1236)
    {
        float _1382 = -_1268;
        float _1384 = _1382 + 1.0;
        _500 = as_type<int>(_1384);
    }
    int _1386 = _500;
    bool _1388 = _572 == 0.0;
    bool _1390 = !_1374;
    bool _1392 = _1388 && _1390;
    float _1394 = in.m_71.x;
    float _1396 = in.m_71.y;
    float _1398 = in.m_71.z;
    float _1400 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1402 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1400);
    if (!_1236)
    {
        _1286 = _1268;
    }
    float _1404 = _1286;
    float _1406 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1408 = _576 == 0.0;
    bool _1410 = _1408 && _1392;
    float _1412 = _1404;
    if (_1264)
    {
        float _1414 = -_1268;
        float _1416 = _1414 + 1.0;
        _832 = as_type<int>(_1416);
    }
    int _1418 = _832;
    float _1420 = as_type<float>(_1418);
    if (_1236)
    {
        float _1422 = _1196 ? as_type<float>(_1386) : _1268;
        _1412 = _1422;
    }
    float _1424 = _1412;
    out.m_73.w = _1118;
    float _1426 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1428 = 1.0 / _1402;
    float _1430 = in.m_75.x;
    float _1432 = in.m_75.y;
    float _1434 = in.m_75.z;
    float _1436 = in.m_75.w;
    float _1438 = _1364;
    if (_1264)
    {
        float _1440 = _1190 ? as_type<float>(_1418) : _1268;
        _1330 = _1440;
    }
    float _1442 = _1330;
    float _1444 = fma(_1426, _1424, -0.5);
    float _1446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1448 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1410)
    {
        _1438 = _1398;
    }
    float _1450 = _1438;
    float _1452 = _1450;
    if (!_1410)
    {
        float _1454 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1398);
        _1452 = _1454;
    }
    float _1456 = _1452;
    float _1458 = fma(_334, _1444, _346);
    float _1460 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1462 = _1428 * _1460;
    float _1464 = fma(_1448, _1352, -0.5);
    if (_1410)
    {
        _1380 = _1394;
    }
    float _1466 = _1380;
    float _1468 = _1466;
    if (!_1410)
    {
        float _1470 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1394);
        _1468 = _1470;
    }
    float _1472 = _1468;
    float _1474 = abs(_1462);
    float _1476 = log2(_1474);
    if (_1410)
    {
        _1420 = _1396;
    }
    float _1478 = _1420;
    float _1480 = fma(_488, _1464, _226);
    float _1482 = _1478;
    if (!_1410)
    {
        float _1484 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1396);
        _1482 = _1484;
    }
    float _1486 = _1482;
    float _1488 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1490 = _1434 * _1394;
    float _1492 = _1432 * _1398;
    float _1494 = _1430 * _1396;
    float _1496 = fma(_1488, _1442, -0.5);
    float _1498 = -_1490;
    float _1500 = fma(_1430, _1398, _1498);
    float _1502 = -_1492;
    float _1504 = fma(_1434, _1396, _1502);
    float _1506 = -_1494;
    float _1508 = fma(_1432, _1394, _1506);
    float _1510 = fma(_482, _1496, _340);
    float _1512 = -_498;
    float _1514 = fma(_492, _1326, _1512);
    float _1516 = _1346 + 0.5;
    float _1518 = _1480 + 0.5;
    float _1520 = _1476 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1522 = _1458 + 0.5;
    float _1524 = _1314 + 0.5;
    float _1526 = _1500 * _1436;
    float _1528 = _1510 + 0.5;
    float _1530 = _1504 * _1436;
    float _1532 = exp2(_1520);
    float _1534 = _1508 * _1436;
    float _1536 = -_1486;
    float _1538 = _636 * _1536;
    float _1540 = -_1432;
    float _1542 = _636 * _1540;
    out.m_77.x = _1518;
    out.m_77.y = _1516;
    out.m_77.z = _1522;
    out.m_77.w = _1524;
    float _1544 = -_1526;
    float _1546 = _636 * _1544;
    float _1548 = fma(_650, _1472, _1538);
    float _1550 = fma(_650, _1430, _1542);
    float _1552 = fma(_650, _1530, _1546);
    float _1554 = _648 * _1432;
    float _1556 = _652 * _1432;
    float _1558 = fma(_654, _1434, _1550);
    float _1560 = _1514 + 0.5;
    float _1562 = fma(_658, _1430, _1554);
    float _1564 = fma(_664, _1430, _1556);
    float _1566 = fma(_1532, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1568 = precise::clamp(_1566, 0.0, 1.0);
    float _1570 = fma(_654, _1534, _1552);
    float _1572 = _648 * _1486;
    float _1574 = _648 * _1526;
    float _1576 = _652 * _1486;
    float _1578 = _652 * _1526;
    float _1580 = fma(_658, _1472, _1572);
    float _1582 = fma(_658, _1530, _1574);
    float _1584 = fma(_664, _1472, _1576);
    float _1586 = fma(_668, _1434, _1562);
    float _1588 = fma(_668, _1456, _1580);
    float _1590 = fma(_660, _1434, _1564);
    float _1592 = fma(_664, _1530, _1578);
    float _1594 = fma(_654, _1456, _1548);
    float _1596 = fma(_668, _1534, _1582);
    float _1598 = fma(_1568, -2.0, 3.0);
    float _1600 = _1568 * _1568;
    float _1602 = fma(_660, _1456, _1584);
    float _1604 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1606 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1608 = _1600 * _1598;
    out.m_79.x = _1528;
    out.m_79.y = _1560;
    float _1610 = fma(_660, _1534, _1592);
    float _1612 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1614 = _1596 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1616 = _1596 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1618 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1604);
    float _1620 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1606);
    float _1622 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1612);
    float _1624 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1614);
    float _1626 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1616);
    float _1628 = _1596 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1630 = fma(_1590, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1618);
    float _1632 = fma(_1590, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1620);
    float _1634 = fma(_1590, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1622);
    float _1636 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1628);
    float _1638 = fma(_1610, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1624);
    float _1640 = -_1608;
    float _1642 = _1640 + 1.0;
    float _1644 = in.m_81.x;
    float _1646 = fma(_1610, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1636);
    float _1648 = fma(_1610, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1626);
    float _1650 = _1588 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1652 = _1588 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1654 = _1588 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1656 = _1462 <= 8000.0;
    bool _1658 = isnan(_1462);
    bool _1660 = _1656 || _1658;
    bool _1662 = isnan(8000.0);
    bool _1664 = _1660 || _1662;
    float _1666 = float(_1664);
    float _1668 = fma(_1642, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1608);
    float _1670 = fma(_1594, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1650);
    float _1672 = fma(_1594, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1652);
    float _1674 = fma(_1594, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1654);
    float _1676 = _1666 * _1668;
    out.m_83.x = _1634;
    out.m_83.y = _1630;
    out.m_83.z = _1632;
    float _1678 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1248);
    float _1680 = _1142 + _1118;
    float _1682 = _1118 * 0.5;
    out.m_85.x = _1638;
    out.m_85.y = _1646;
    out.m_85.z = _1648;
    float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1686 = _1678 + _1684;
    float _1688 = _1680 * 0.5;
    float _1690 = fma(_1144, -0.5, _1682);
    bool _1692 = _916 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1694 = isnan(_916);
    bool _1696 = _1692 || _1694;
    bool _1698 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1700 = _1696 || _1698;
    out.gl_Position.x = _1142;
    out.gl_Position.y = _1144;
    out.gl_Position.z = _1686;
    out.gl_Position.w = _1118;
    float _1702 = fma(_1602, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1674);
    float _1704 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1706 = fma(_1602, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1670);
    float _1708 = fma(_1602, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1672);
    out.m_73.x = _1688;
    out.m_73.y = _1690;
    float _1710 = _1274 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_87.x = _1706;
    out.m_87.y = _1708;
    out.m_87.z = _1702;
    float _1712 = _1686;
    float _1714 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _1716 = _1710;
    if (!_1700)
    {
        _1288 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1718 = _1288;
    float _1720 = -_1710;
    float _1722 = _1720 + 1.0;
    float _1724 = _1718;
    float _1726 = _1718;
    if (!_1700)
    {
        _1712 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1728 = _1712;
    float _1730 = _1728;
    float _1732 = _1728;
    if (!_1700)
    {
        _1290 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1734 = _1290;
    float _1736 = -_1150;
    float _1738 = _1736 + 1.0;
    float _1740 = _1738 * _1704;
    float _1742 = precise::clamp(_1740, 0.0, 1.0);
    float _1744 = -_1742;
    float _1746 = fma(_1744, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1748 = _1734;
    float _1750 = _1734;
    if (!_1700)
    {
        _1714 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1752 = _1714;
    float _1754 = _1746 * _1644;
    float _1756 = _1754 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1758 = _1754;
    float _1760 = _1752;
    float _1762 = _1752;
    if (!_1700)
    {
        _1758 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1764 = _1758;
    float _1766 = _1710 * _1176;
    out.m_89.x = _1756;
    float _1768 = _1764;
    float _1770 = _1764;
    if (!_1700)
    {
        _1716 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1772 = _1716;
    float _1774 = _1182 * _1766;
    float _1776 = _1184 * _1766;
    float _1778 = _1186 * _1766;
    out.m_91.x = _1774;
    out.m_91.y = _1776;
    out.m_91.z = _1778;
    out.m_91.w = _1722;
    bool _1780 = !_1700;
    float _1782 = _1772;
    float _1784 = _1772;
    if (!_1780)
    {
        bool _1786 = _916 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1788 = isnan(_916);
        bool _1790 = _1786 || _1788;
        bool _1792 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1794 = _1790 || _1792;
        if (!_1794)
        {
            float _1796 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1798 = _916 + _1796;
            float _1800 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1802 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1800;
            float _1804 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1806 = _1804 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1808 = 1.0 / _1802;
            float _1810 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1812 = _1810 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1814 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1816 = _1814 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1818 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1820 = _1818 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1822 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1824 = _1822 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1826 = _1798 * _1808;
            float _1828 = precise::clamp(_1826, 0.0, 1.0);
            float _1830 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1832 = _1830 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1834 = fma(_1828, _1806, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1836 = fma(_1828, _1832, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1838 = fma(_1828, _1812, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1840 = fma(_1828, _1816, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1842 = fma(_1828, _1820, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1844 = fma(_1828, _1824, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1726 = _1838;
            _1784 = _1842;
            _1762 = _1834;
            _1750 = _1840;
            _1732 = _1836;
            _1770 = _1844;
            _1846 = true;
        }
        else
        {
            bool _1848 = _916 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1850 = isnan(_916);
            bool _1852 = _1848 || _1850;
            bool _1854 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1856 = _1852 || _1854;
            if (!_1856)
            {
                _1760 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1858 = _1760;
            _1762 = _1858;
            if (!_1856)
            {
                _1724 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1860 = _1724;
            _1726 = _1860;
            if (!_1856)
            {
                _1730 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1862 = _1730;
            _1732 = _1862;
            if (!_1856)
            {
                _1748 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1864 = _1748;
            _1750 = _1864;
            if (!_1856)
            {
                _1782 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1866 = _1782;
            _1784 = _1866;
            if (!_1856)
            {
                _1768 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1868 = _1768;
            bool _1870 = !_1856;
            _1770 = _1868;
            if (!_1870)
            {
                bool _1872 = _916 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1874 = isnan(_916);
                bool _1876 = _1872 || _1874;
                bool _1878 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1880 = _1876 || _1878;
                if (!_1880)
                {
                    float _1882 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1884 = _916 + _1882;
                    float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1888 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1886;
                    float _1890 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1892 = _1890 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1894 = 1.0 / _1888;
                    float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1898 = _1896 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1900 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1902 = _1900 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1904 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1906 = _1904 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1908 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1910 = _1908 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1912 = _1884 * _1894;
                    float _1914 = precise::clamp(_1912, 0.0, 1.0);
                    float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1918 = _1916 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1920 = fma(_1914, _1892, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1922 = fma(_1914, _1918, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1924 = fma(_1914, _1898, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1926 = fma(_1914, _1902, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1928 = fma(_1914, _1906, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1930 = fma(_1914, _1910, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1726 = _1924;
                    _1784 = _1928;
                    _1762 = _1920;
                    _1750 = _1926;
                    _1732 = _1922;
                    _1770 = _1930;
                    _1846 = true;
                }
                else
                {
                    _1726 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1784 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1762 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1750 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1732 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1770 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1846 = false;
    float _1932 = _1726;
    float _1934 = _1784;
    float _1936 = _1762;
    float _1938 = _1750;
    float _1940 = _1732;
    float _1942 = _1770;
    float _1944 = fma(_1708, -0.5, 0.5);
    float _1946 = precise::clamp(_1944, 0.0, 1.0);
    float _1948 = -_1932;
    float _1950 = _1948 + _1934;
    float _1952 = -_1936;
    float _1954 = _1952 + _1938;
    float _1956 = -_1940;
    float _1958 = _1956 + _1942;
    bool _1960 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1962 = fma(_1946, _1950, _1932);
    float _1964 = fma(_1946, _1954, _1936);
    float _1966 = fma(_1946, _1958, _1940);
    float _1968 = _1962 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _1970 = fma(_1964, 0.298911988735198974609375, _1968);
    out.m_89.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1972 = fma(_1966, 0.114477999508380889892578125, _1970);
    float _1974 = -_1972;
    float _1976 = _1964 + _1974;
    float _1978 = -_1972;
    float _1980 = _1962 + _1978;
    float _1982 = -_1972;
    float _1984 = _1966 + _1982;
    out.m_93.x = 0.0;
    float _1986 = fma(_1976, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1972);
    float _1988 = fma(_1980, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1972);
    float _1990 = fma(_1984, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1972);
    out.m_95.x = _1986;
    out.m_95.y = _1988;
    out.m_95.z = _1990;
    if (!_1960)
    {
        return out;
    }
    float _1992 = -_884;
    float _1994 = _1992 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1996 = -_886;
    float _1998 = _1996 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2000 = -_888;
    float _2002 = _2000 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2004 = _1994 * _1994;
    float _2006 = fma(_1998, _1998, _2004);
    float _2008 = fma(_2002, _2002, _2006);
    float _2010 = sqrt(_2008);
    float _2012 = rsqrt(_2008);
    float _2014 = -_2010;
    float _2016 = _2014 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2018 = _2016 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2020 = precise::clamp(_2018, 0.0, 1.0);
    float _2022 = _1998 * _2012;
    float _2024 = _1994 * _2012;
    float _2026 = abs(_2020);
    float _2028 = log2(_2026);
    float _2030 = _2002 * _2012;
    float _2032 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2034 = _1708 * _2024;
    float _2036 = -_2024;
    float _2038 = -_2032;
    float _2040 = fma(_2036, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2038);
    float _2042 = fma(_1706, _2022, _2034);
    float _2044 = -_2030;
    float _2046 = fma(_2044, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2040);
    float _2048 = fma(_1702, _2030, _2042);
    float _2050 = precise::clamp(_2048, 0.0, 1.0);
    float _2052 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2054 = _2046 + _2052;
    float _2056 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2058 = _2054 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2060 = precise::clamp(_2058, 0.0, 1.0);
    float _2062 = exp2(_2056);
    float _2064 = _2062 * _2060;
    float _2066 = _2050 * _2064;
    float _2068 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2070 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2072 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2068;
    out.m_93.y = _2070;
    out.m_93.z = _2072;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1846 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2130 = as_type<float>(_130);
        out.gl_Position.z = _2130;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_49.w;
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
        out.m_47.x = 0.0;
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
        float _2200 = as_type<float>(_168);
        out.gl_Position.z = _2200;
    }
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _170 = in.m_51.z;
    float _172 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _174 = log2(_172);
    float _176 = in.m_51.x;
    int _178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _180 = _178 != 0;
    float _182 = in.m_51.y;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _186 = _184 != 0;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _190 = _188 != 0;
    int _192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _194 = _192 != 0;
    float _196 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _198 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _202 = _170 * 2.0;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _208 = _176 * 2.0;
    float _210 = _176 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _212 = floor(_202);
    float _214 = _182 + _170;
    float _216 = -_196;
    float _218 = fma(_210, 2.0, _216);
    float _220 = _182 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _222 = _182 * 2.0;
    float _224 = -_148;
    float _226 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[76].x, _218);
    float _228 = floor(_208);
    float _230 = fma(_220, -2.0, _198);
    float _232 = _176 + (-0.5);
    bool _234 = _212 > 0.0;
    float _236 = _214 + (-1.0);
    bool _238 = _212 >= 0.0;
    bool _240 = isnan(_212);
    bool _242 = _238 || _240;
    bool _244 = isnan(0.0);
    bool _246 = _242 || _244;
    float _248 = _182 + _176;
    float _250 = floor(_222);
    int _252 = _246 ? 0 : 1;
    float _254 = _248 + (-1.0);
    float _256 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _258 = _236;
    float _260 = _254;
    float _262 = _176;
    if (!_180)
    {
        _258 = _182;
    }
    float _264 = _258;
    float _266 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _268 = ~_252;
    int _270 = _268 + 1;
    int _272 = _270 + 1;
    int _274 = _272;
    float _276 = _264;
    if (_180)
    {
        _260 = _176;
    }
    float _278 = _260;
    float _280 = _278;
    if (!_234)
    {
        int _282 = ~_252;
        int _284 = _282 + 1;
        _274 = _284;
    }
    int _286 = _274;
    if (!_180)
    {
        _280 = _170;
    }
    float _288 = _280;
    if (_180)
    {
        _276 = _176;
    }
    float _290 = _276;
    bool _292 = _228 > 0.0;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _296 = _228 >= 0.0;
    bool _298 = isnan(_228);
    bool _300 = _296 || _298;
    bool _302 = isnan(0.0);
    bool _304 = _300 || _302;
    float _306 = _288 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _308 = _290 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _310 = float(_286);
    float _312 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[83].z, _204);
    int _314 = _304 ? 0 : 1;
    float _316 = -_294;
    float _318 = fma(_308, 2.0, _316);
    bool _320 = !_186;
    float _322 = _320 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _324 = -_200;
    float _326 = fma(_306, 2.0, _324);
    int _328 = ~_314;
    int _330 = _328 + 1;
    int _332 = _330 + 1;
    float _334 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _312);
    int _336 = abs(as_type<int>(_322));
    float _338 = -_148;
    float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[86].x, _326);
    bool _342 = _250 > 0.0;
    float _344 = -_148;
    float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[81].x, _318);
    float _348 = float(_336);
    bool _350 = _250 >= 0.0;
    bool _352 = isnan(_250);
    bool _354 = _350 || _352;
    bool _356 = isnan(0.0);
    bool _358 = _354 || _356;
    int _360 = _332;
    float _362 = _306;
    float _364 = _322;
    float _366 = _290;
    if (!_292)
    {
        int _368 = ~_314;
        int _370 = _368 + 1;
        _360 = _370;
    }
    int _372 = _360;
    float _374 = _348 * _310;
    if (!_180)
    {
        _362 = _170;
    }
    float _376 = _362;
    float _378 = _174 * _148;
    float _380 = _374 * (-2.0);
    bool _382 = !_190;
    int _384 = _382 ? 0 : 1;
    float _386 = _376;
    if (_180)
    {
        _386 = _182;
    }
    float _388 = _386;
    float _390 = exp2(_378);
    if (_180)
    {
        _364 = _182;
    }
    float _392 = _364;
    float _394 = _388 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _396 = _392;
    if (!_180)
    {
        _396 = _176;
    }
    float _398 = _396;
    int _400 = abs(_384);
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (!_180)
    {
        _366 = _170;
    }
    float _404 = _366;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _408 = _404;
    if (_180)
    {
        _408 = _182;
    }
    float _410 = _408;
    float _412 = _398 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _414 = float(_372);
    float _416 = fma(_394, -2.0, _402);
    float _418 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[83].w, _406);
    float _420 = fma(_412, -2.0, _206);
    float _422 = in.m_53.x;
    float _424 = in.m_53.y;
    float _426 = in.m_53.z;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _430 = 1.0 + _428;
    float _432 = -_390;
    float _434 = _432 + 1.0;
    float _436 = 1.0 / _430;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _440 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _442 = isnan(1.0);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _448 = _444 || _446;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _452 = float(_400);
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _456 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _464 = _460 || _462;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _468 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[88].z, _438);
    float _470 = _452 * _414;
    float _472 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[78].z, _450);
    float _474 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[78].w, _454);
    float _476 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[88].w, _466);
    float _478 = _464 ? _434 : 0.0;
    float _480 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _230);
    float _482 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _468);
    bool _484 = !_194;
    int _486 = _484 ? 0 : 1;
    float _488 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _472);
    float _490 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _474);
    float _492 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _476);
    float _494 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _418);
    float _496 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _416);
    float _498 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _420);
    int _500 = as_type<int>(_480);
    if (_448)
    {
        float _502 = _478 * _436;
        _150 = _502;
    }
    float _504 = _150;
    float _506 = fma(_380, _422, _422);
    int _508 = abs(_486);
    float _510 = fma(_266, _380, _266);
    int _512 = _358 ? 0 : 1;
    float _514 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[196].x, _506);
    float _516 = _470 * (-2.0);
    int _518 = ~_512;
    int _520 = _518 + 1;
    int _522 = _520 + 1;
    float _524 = fma(_510, _504, _514);
    int _526 = _522;
    if (!_342)
    {
        int _528 = ~_512;
        int _530 = _528 + 1;
        _526 = _530;
    }
    int _532 = _526;
    float _534 = _182 + (-0.5);
    float _536 = fma(_516, _424, _424);
    float _538 = float(_508);
    float _540 = fma(_256, _516, _256);
    float _542 = float(_532);
    float _544 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[196].y, _536);
    float _546 = _176 + _170;
    float _548 = _524 * 0.15915493667125701904296875;
    float _550 = _538 * _542;
    float _552 = fma(_540, _504, _544);
    float _554 = _546 + (-1.0);
    float _556 = in.m_55.x;
    float _558 = in.m_55.y;
    float _560 = in.m_55.z;
    float _562 = _550 * (-2.0);
    float _564 = _552 * 0.15915493667125701904296875;
    float _566 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _568 = _170 + (-0.5);
    float _570 = fma(_562, _426, _426);
    float _572 = in.m_57.x;
    float _574 = in.m_57.y;
    float _576 = in.m_57.z;
    float _578 = fma(_566, _562, _566);
    float _580 = _548 * 6.283185482025146484375;
    float _582 = cos(_580);
    float _584 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[196].z, _570);
    float _586 = fma(_578, _504, _584);
    float _588 = _564 * 6.283185482025146484375;
    float _590 = sin(_588);
    float _592 = _586 * 0.15915493667125701904296875;
    float _594 = _564 * 6.283185482025146484375;
    float _596 = cos(_594);
    float _598 = _558 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _600 = _560 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _602 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _572);
    float _604 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _574);
    float _606 = _548 * 6.283185482025146484375;
    float _608 = sin(_606);
    float _610 = _600 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _612 = _582 * _590;
    float _614 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _576);
    float _616 = _614 * _610;
    float _618 = _592 * 6.283185482025146484375;
    float _620 = cos(_618);
    float _622 = _556 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _624 = in.m_44.x;
    float _626 = in.m_44.y;
    float _628 = in.m_44.z;
    float _630 = _622 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _632 = _598 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _634 = _592 * 6.283185482025146484375;
    float _636 = sin(_634);
    float _638 = _602 * _630;
    float _640 = _582 * _596;
    float _642 = _604 * _632;
    float _644 = _608 * _590;
    float _646 = _608 * _596;
    float _648 = _582 * _620;
    float _650 = _596 * _620;
    float _652 = _608 * _620;
    float _654 = _590 * _620;
    float _656 = _648 * _642;
    float _658 = fma(_636, _640, _644);
    float _660 = fma(_636, _644, _640);
    float _662 = -_612;
    float _664 = fma(_636, _646, _662);
    float _666 = -_646;
    float _668 = fma(_636, _612, _666);
    float _670 = -_642;
    float _672 = _636 * _670;
    float _674 = fma(_658, _638, _656);
    float _676 = _652 * _642;
    float _678 = _626 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _680 = fma(_650, _638, _672);
    float _682 = fma(_668, _616, _674);
    float _684 = fma(_664, _638, _676);
    float _686 = fma(_624, (*spvDescriptorSet0.vp_c10)._m0[5].x, _678);
    float _688 = fma(_654, _616, _680);
    float _690 = _682 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _692 = fma(_660, _616, _684);
    float _694 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[5].z, _686);
    float _696 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[9].x, _690);
    float _698 = _694 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _700 = fma(_692, (*spvDescriptorSet0.vp_c10)._m0[9].z, _696);
    float _702 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.2800000011920928955078125);
    float _704 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.310000002384185791015625);
    float _706 = _698 + _700;
    float _708 = fma(_706, 0.4000000059604644775390625, _702);
    float _710 = fma(_706, 0.3499999940395355224609375, _704);
    float _712 = _708 * 0.15915493667125701904296875;
    float _714 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.550000011920928955078125);
    float _716 = _710 * 0.15915493667125701904296875;
    float _718 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.60000002384185791015625);
    float _720 = fma(_706, 0.75, _714);
    float _722 = _712 * 6.283185482025146484375;
    float _724 = sin(_722);
    float _726 = fma(_706, 0.85000002384185791015625, _718);
    float _728 = _720 * 0.15915493667125701904296875;
    float _730 = _626 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _732 = _726 * 0.15915493667125701904296875;
    float _734 = _682 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _736 = _626 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _738 = _716 * 6.283185482025146484375;
    float _740 = sin(_738);
    float _742 = fma(_624, (*spvDescriptorSet0.vp_c10)._m0[6].x, _730);
    float _744 = _682 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _746 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[10].x, _734);
    float _748 = fma(_624, (*spvDescriptorSet0.vp_c10)._m0[4].x, _736);
    float _750 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[6].z, _742);
    float _752 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[8].x, _744);
    float _754 = fma(_692, (*spvDescriptorSet0.vp_c10)._m0[10].z, _746);
    float _756 = _728 * 6.283185482025146484375;
    float _758 = sin(_756);
    float _760 = _750 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _762 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[4].z, _748);
    float _764 = fma(_692, (*spvDescriptorSet0.vp_c10)._m0[8].z, _752);
    float _766 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.17000000178813934326171875;
    float _768 = _760 + _754;
    float _770 = _762 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _772 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.300000011920928955078125;
    float _774 = _732 * 6.283185482025146484375;
    float _776 = sin(_774);
    float _778 = fma(_768, 0.550000011920928955078125, _766);
    float _780 = _770 + _764;
    float _782 = _778 * 0.15915493667125701904296875;
    float _784 = fma(_780, 0.89999997615814208984375, _772);
    float _786 = _740 + _758;
    float _788 = _782 * 6.283185482025146484375;
    float _790 = sin(_788);
    float _792 = fma(_786, 0.00999999977648258209228515625, _768);
    float _794 = _724 + _776;
    float _796 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _798 = _792 + _796;
    float _800 = fma(_794, 0.00999999977648258209228515625, _780);
    float _802 = _798 * _798;
    float _804 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _806 = _800 + _804;
    float _808 = fma(_806, _806, _802);
    float _810 = _784 * 0.15915493667125701904296875;
    float _812 = _790 * 0.20999999344348907470703125;
    float _814 = sqrt(_808);
    float _816 = _810 * 6.283185482025146484375;
    float _818 = sin(_816);
    bool _820 = _814 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _822 = fma(_818, 0.300000011920928955078125, _812);
    float _824 = _706 + _822;
    float _826 = _822;
    float _828 = _790;
    float _830 = _812;
    int _832 = as_type<int>(_760);
    if (!_820)
    {
        _826 = _800;
    }
    float _834 = _826;
    float _836 = _834;
    if (!_820)
    {
        _828 = _792;
    }
    float _838 = _828;
    float _840 = _838;
    if (!_820)
    {
        _830 = _824;
    }
    float _842 = _830;
    bool _844 = !_820;
    float _846 = _842;
    if (!_844)
    {
        float _848 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _850 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _852 = _814 + _850;
        float _854 = _824 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _856 = rsqrt(_808);
        float _858 = _852 * _848;
        float _860 = _858 * 0.15915493667125701904296875;
        float _862 = _860 * 6.283185482025146484375;
        float _864 = cos(_862);
        float _866 = _860 * 6.283185482025146484375;
        float _868 = sin(_866);
        float _870 = _864 + (-1.0);
        float _872 = _870 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _874 = fma(_868, _854, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _876 = fma(_824, _864, _872);
        float _878 = _856 * _874;
        float _880 = fma(_806, _878, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _882 = fma(_798, _878, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _846 = _876;
        _836 = _880;
        _840 = _882;
    }
    float _884 = _846;
    float _886 = _836;
    float _888 = _840;
    float _890 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _892 = _884 + _890;
    float _894 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _896 = _886 + _894;
    float _898 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _900 = _888 + _898;
    float _902 = _892 * _892;
    float _904 = fma(_896, _896, _902);
    float _906 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _908 = fma(_900, _900, _904);
    float _910 = fma(_770, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _912 = precise::max(0.0, _906);
    float _914 = rsqrt(_908);
    float _916 = sqrt(_908);
    float _918 = _914 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _920 = floor(_910);
    float _922 = _896 * _918;
    float _924 = _900 * _918;
    float _926 = -_918;
    float _928 = -_912;
    float _930 = fma(_892, _926, _928);
    float _932 = _922 * _922;
    float _934 = _924 * _924;
    float _936 = _932 + _934;
    float _938 = sqrt(_936);
    bool _940 = _938 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _942 = _892;
    float _944 = _912;
    float _946 = _906;
    float _948 = _922;
    float _950 = _924;
    if (!_940)
    {
        _942 = _934;
    }
    float _952 = _942;
    float _954 = _952;
    if (!_940)
    {
        _944 = _932;
    }
    float _956 = _944;
    float _958 = _956;
    if (!_940)
    {
        _946 = _930;
    }
    float _960 = _946;
    bool _962 = !_940;
    float _964 = _960;
    if (!_962)
    {
        float _966 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _968 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _970 = _938 + _968;
        float _972 = rsqrt(_936);
        float _974 = _970 * _966;
        float _976 = _930 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _978 = _974 * 0.15915493667125701904296875;
        float _980 = _978 * 6.283185482025146484375;
        float _982 = sin(_980);
        float _984 = _978 * 6.283185482025146484375;
        float _986 = cos(_984);
        float _988 = fma(_982, _976, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _990 = _972 * _988;
        float _992 = _986 + (-1.0);
        float _994 = _922 * _990;
        float _996 = _924 * _990;
        float _998 = _992 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1000 = _996 * _996;
        float _1002 = fma(_930, _986, _998);
        float _1004 = _994 * _994;
        _964 = _1002;
        _958 = _1004;
        _954 = _1000;
        _948 = _994;
        _950 = _996;
    }
    float _1006 = _964;
    float _1008 = _958;
    float _1010 = _954;
    float _1012 = _948;
    float _1014 = _950;
    float _1016 = fma(_1006, _1006, _1008);
    float _1018 = _884 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1020 = _884 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1022 = _1016 + _1010;
    float _1024 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1018);
    float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1028 = fma(_916, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1026);
    float _1030 = precise::clamp(_1028, 0.0, 1.0);
    float _1032 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1020);
    float _1034 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1024);
    float _1036 = rsqrt(_1022);
    float _1038 = -_1030;
    float _1040 = _1038 + 1.0;
    float _1042 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1044 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1046 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1032);
    float _1048 = _884 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1050 = _1044 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1052 = abs(_1040);
    float _1054 = log2(_1052);
    float _1056 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1058 = fma(_760, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1060 = -_1050;
    float _1062 = fma(_1042, _1060, 1.0);
    float _1064 = _884 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1066 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1048);
    float _1068 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1070 = _1036 * _1012;
    float _1072 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1064);
    float _1074 = _1036 * _1006;
    float _1076 = _1036 * _1014;
    float _1078 = _1070 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1080 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1072);
    float _1082 = floor(_1058);
    float _1084 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1066);
    float _1086 = -_1078;
    float _1088 = fma(_1074, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1086);
    float _1090 = _1080 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1092 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1094 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1096 = -_1076;
    float _1098 = fma(_1096, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1088);
    float _1100 = _1054 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1102 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1092);
    float _1104 = -_920;
    float _1106 = _910 + _1104;
    float _1108 = fma(_1098, -0.5, 0.5);
    float _1110 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1102);
    float _1112 = fma(_1098, 0.5, 0.5);
    float _1114 = exp2(_1100);
    float _1116 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1118 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1110);
    float _1120 = fma(_1112, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1122 = -_1082;
    float _1124 = _1058 + _1122;
    float _1126 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1068);
    float _1128 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1116);
    float _1130 = fma(_1112, _1120, -0.212114393711090087890625);
    float _1132 = log2(_1062);
    float _1134 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1126);
    float _1136 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1128);
    float _1138 = fma(_1112, _1130, 1.570728778839111328125);
    float _1140 = _1074 + 1.0;
    float _1142 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1134);
    float _1144 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1136);
    float _1146 = 1.0 / _1118;
    float _1148 = sqrt(_1108);
    float2 _3783 = float2(_1106, _1124);
    float _1150 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3783, float2(0.0), isnan(_3783)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3783, float2(0.0), isnan(_3783)), level(0.0)).x;
    float _1152 = -_1074;
    float _1154 = fma(_1114, _1140, _1152);
    float _1156 = _1132 * 0.693147182464599609375;
    float _1158 = fma(_1154, 0.5, 0.5);
    float _1160 = _1156 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1162 = _1142 * _1146;
    float _1164 = _1144 * _1146;
    float _1166 = fma(_1162, 0.5, 0.5);
    float _1168 = fma(_1164, -0.5, 0.5);
    float _1170 = _1148 * 0.636619746685028076171875;
    float _1172 = -_1138;
    float _1174 = fma(_1170, _1172, 1.0);
    float3 _3827 = float3(_1166, _1168, _1160);
    float _1176 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3827, float3(0.0), isnan(_3827)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3827, float3(0.0), isnan(_3827)), level(0.0)).x;
    float2 _3837 = float2(_1174, _1158);
    float3 _1180 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3837, float2(0.0), isnan(_3837)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3837, float2(0.0), isnan(_3837)), level(0.0)).xyz;
    float _1182 = _1180.x;
    float _1184 = _1180.y;
    float _1186 = _1180.z;
    float _1188 = in.m_59.w;
    bool _1190 = _182 > 0.5;
    float _1192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1194 = in.m_61.y;
    bool _1196 = _170 > 0.5;
    float _1198 = _1054 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1200 = in.m_51.w;
    float _1202 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1204 = in.m_59.z;
    float _1206 = in.m_59.x;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1210 = in.m_59.y;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1214 = _1212 != 0;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1218 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.w = _1188;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1222 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1226 = _1224 != 0;
    float _1228 = -_1194;
    float _1230 = _1228 + 1.0;
    float _1232 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1236 = _1234 != 0;
    float _1238 = exp2(_1198);
    bool _1240 = _1200 > 0.5;
    float _1242 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1202);
    int _1244 = _1190 ? as_type<int>(_1230) : as_type<int>(_1194);
    out.m_65.x = _1222;
    out.m_65.y = _1232;
    out.m_65.z = _1218;
    int _1246 = _1240 ? as_type<int>(_1230) : as_type<int>(_1194);
    float _1248 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1242);
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1252 = _1250 != 0;
    float _1254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_63.z = _1204;
    float _1256 = _1214 ? as_type<float>(_1244) : _1194;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1260 = _1258 != 0;
    out.m_63.x = _1206;
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1264 = _1262 != 0;
    float _1266 = _698 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1268 = in.m_61.x;
    float _1270 = _1260 ? as_type<float>(_1246) : _1194;
    float _1272 = -_1238;
    float _1274 = _1272 + 1.0;
    float _1276 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1266);
    float _1278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1280 = _1194;
    bool _1282 = _1260;
    int _1284 = as_type<int>(_1266);
    float _1286 = _1230;
    float _1288 = _1118;
    float _1290 = _1144;
    if (_1252)
    {
        float _1292 = _1196 ? _1230 : _1194;
        _1280 = _1292;
    }
    float _1294 = _1280;
    out.m_63.y = _1210;
    float _1296 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1298 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1276);
    if (_1226)
    {
        bool _1300 = _176 > 0.5;
        _1282 = _1300;
    }
    bool _1302 = _1282;
    out.m_67.x = _886;
    out.m_67.y = _884;
    out.m_67.z = _888;
    float _1304 = fma(_1270, _1296, -0.5);
    float _1306 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1308 = _698 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1310 = _1192 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1312 = -_496;
    float _1314 = fma(_494, _1304, _1312);
    float _1316 = fma(_1310, _1256, -0.5);
    float _1318 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1322 = 1.0 / _1306;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1326 = fma(_1318, _1294, -0.5);
    float _1328 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1308);
    float _1330 = _1268;
    if (_1226)
    {
        float _1332 = -_1268;
        float _1334 = _1332 + 1.0;
        _1284 = as_type<int>(_1334);
    }
    int _1336 = _1284;
    if (!_1226)
    {
        _262 = _1268;
    }
    float _1338 = _262;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1342 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1328);
    float _1344 = -_480;
    float _1346 = fma(_490, _1316, _1344);
    float _1348 = _1338;
    if (_1226)
    {
        float _1350 = _1302 ? as_type<float>(_1336) : _1268;
        _1348 = _1350;
    }
    float _1352 = _1348;
    float _1354 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1356 = _1342 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1358 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1360 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1362 = _1356 + _1306;
    float _1364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1366 = _574 != 0.0;
    bool _1368 = isnan(_574);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan(0.0);
    bool _1374 = _1370 || _1372;
    out.m_69.x = _1354;
    out.m_69.y = _1358;
    out.m_69.z = _1360;
    float _1376 = _1362 * _1322;
    float _1378 = _1376 * 0.5;
    float _1380 = _1362;
    if (_1236)
    {
        float _1382 = -_1268;
        float _1384 = _1382 + 1.0;
        _500 = as_type<int>(_1384);
    }
    int _1386 = _500;
    bool _1388 = _572 == 0.0;
    bool _1390 = !_1374;
    bool _1392 = _1388 && _1390;
    float _1394 = in.m_71.x;
    float _1396 = in.m_71.y;
    float _1398 = in.m_71.z;
    float _1400 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1402 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1400);
    if (!_1236)
    {
        _1286 = _1268;
    }
    float _1404 = _1286;
    float _1406 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1408 = _576 == 0.0;
    bool _1410 = _1408 && _1392;
    float _1412 = _1404;
    if (_1264)
    {
        float _1414 = -_1268;
        float _1416 = _1414 + 1.0;
        _832 = as_type<int>(_1416);
    }
    int _1418 = _832;
    float _1420 = as_type<float>(_1418);
    if (_1236)
    {
        float _1422 = _1196 ? as_type<float>(_1386) : _1268;
        _1412 = _1422;
    }
    float _1424 = _1412;
    out.m_73.w = _1118;
    float _1426 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1428 = 1.0 / _1402;
    float _1430 = in.m_75.x;
    float _1432 = in.m_75.y;
    float _1434 = in.m_75.z;
    float _1436 = in.m_75.w;
    float _1438 = _1364;
    if (_1264)
    {
        float _1440 = _1190 ? as_type<float>(_1418) : _1268;
        _1330 = _1440;
    }
    float _1442 = _1330;
    float _1444 = fma(_1426, _1424, -0.5);
    float _1446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1448 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1410)
    {
        _1438 = _1398;
    }
    float _1450 = _1438;
    float _1452 = _1450;
    if (!_1410)
    {
        float _1454 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1398);
        _1452 = _1454;
    }
    float _1456 = _1452;
    float _1458 = fma(_334, _1444, _346);
    float _1460 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1462 = _1428 * _1460;
    float _1464 = fma(_1448, _1352, -0.5);
    if (_1410)
    {
        _1380 = _1394;
    }
    float _1466 = _1380;
    float _1468 = _1466;
    if (!_1410)
    {
        float _1470 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1394);
        _1468 = _1470;
    }
    float _1472 = _1468;
    float _1474 = abs(_1462);
    float _1476 = log2(_1474);
    if (_1410)
    {
        _1420 = _1396;
    }
    float _1478 = _1420;
    float _1480 = fma(_488, _1464, _226);
    float _1482 = _1478;
    if (!_1410)
    {
        float _1484 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1396);
        _1482 = _1484;
    }
    float _1486 = _1482;
    float _1488 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1490 = _1434 * _1394;
    float _1492 = _1432 * _1398;
    float _1494 = _1430 * _1396;
    float _1496 = fma(_1488, _1442, -0.5);
    float _1498 = -_1490;
    float _1500 = fma(_1430, _1398, _1498);
    float _1502 = -_1492;
    float _1504 = fma(_1434, _1396, _1502);
    float _1506 = -_1494;
    float _1508 = fma(_1432, _1394, _1506);
    float _1510 = fma(_482, _1496, _340);
    float _1512 = -_498;
    float _1514 = fma(_492, _1326, _1512);
    float _1516 = _1346 + 0.5;
    float _1518 = _1480 + 0.5;
    float _1520 = _1476 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1522 = _1458 + 0.5;
    float _1524 = _1314 + 0.5;
    float _1526 = _1500 * _1436;
    float _1528 = _1510 + 0.5;
    float _1530 = _1504 * _1436;
    float _1532 = exp2(_1520);
    float _1534 = _1508 * _1436;
    float _1536 = -_1486;
    float _1538 = _636 * _1536;
    float _1540 = -_1432;
    float _1542 = _636 * _1540;
    out.m_77.x = _1518;
    out.m_77.y = _1516;
    out.m_77.z = _1522;
    out.m_77.w = _1524;
    float _1544 = -_1526;
    float _1546 = _636 * _1544;
    float _1548 = fma(_650, _1472, _1538);
    float _1550 = fma(_650, _1430, _1542);
    float _1552 = fma(_650, _1530, _1546);
    float _1554 = _648 * _1432;
    float _1556 = _652 * _1432;
    float _1558 = fma(_654, _1434, _1550);
    float _1560 = _1514 + 0.5;
    float _1562 = fma(_658, _1430, _1554);
    float _1564 = fma(_664, _1430, _1556);
    float _1566 = fma(_1532, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1568 = precise::clamp(_1566, 0.0, 1.0);
    float _1570 = fma(_654, _1534, _1552);
    float _1572 = _648 * _1486;
    float _1574 = _648 * _1526;
    float _1576 = _652 * _1486;
    float _1578 = _652 * _1526;
    float _1580 = fma(_658, _1472, _1572);
    float _1582 = fma(_658, _1530, _1574);
    float _1584 = fma(_664, _1472, _1576);
    float _1586 = fma(_668, _1434, _1562);
    float _1588 = fma(_668, _1456, _1580);
    float _1590 = fma(_660, _1434, _1564);
    float _1592 = fma(_664, _1530, _1578);
    float _1594 = fma(_654, _1456, _1548);
    float _1596 = fma(_668, _1534, _1582);
    float _1598 = fma(_1568, -2.0, 3.0);
    float _1600 = _1568 * _1568;
    float _1602 = fma(_660, _1456, _1584);
    float _1604 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1606 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1608 = _1600 * _1598;
    out.m_79.x = _1528;
    out.m_79.y = _1560;
    float _1610 = fma(_660, _1534, _1592);
    float _1612 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1614 = _1596 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1616 = _1596 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1618 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1604);
    float _1620 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1606);
    float _1622 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1612);
    float _1624 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1614);
    float _1626 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1616);
    float _1628 = _1596 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1630 = fma(_1590, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1618);
    float _1632 = fma(_1590, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1620);
    float _1634 = fma(_1590, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1622);
    float _1636 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1628);
    float _1638 = fma(_1610, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1624);
    float _1640 = -_1608;
    float _1642 = _1640 + 1.0;
    float _1644 = in.m_81.x;
    float _1646 = fma(_1610, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1636);
    float _1648 = fma(_1610, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1626);
    float _1650 = _1588 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1652 = _1588 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1654 = _1588 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1656 = _1462 <= 8000.0;
    bool _1658 = isnan(_1462);
    bool _1660 = _1656 || _1658;
    bool _1662 = isnan(8000.0);
    bool _1664 = _1660 || _1662;
    float _1666 = float(_1664);
    float _1668 = fma(_1642, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1608);
    float _1670 = fma(_1594, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1650);
    float _1672 = fma(_1594, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1652);
    float _1674 = fma(_1594, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1654);
    float _1676 = _1666 * _1668;
    out.m_83.x = _1634;
    out.m_83.y = _1630;
    out.m_83.z = _1632;
    float _1678 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1248);
    float _1680 = _1142 + _1118;
    float _1682 = _1118 * 0.5;
    out.m_85.x = _1638;
    out.m_85.y = _1646;
    out.m_85.z = _1648;
    float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1686 = _1678 + _1684;
    float _1688 = _1680 * 0.5;
    float _1690 = fma(_1144, -0.5, _1682);
    bool _1692 = _916 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1694 = isnan(_916);
    bool _1696 = _1692 || _1694;
    bool _1698 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1700 = _1696 || _1698;
    out.gl_Position.x = _1142;
    out.gl_Position.y = _1144;
    out.gl_Position.z = _1686;
    out.gl_Position.w = _1118;
    float _1702 = fma(_1602, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1674);
    float _1704 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1706 = fma(_1602, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1670);
    float _1708 = fma(_1602, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1672);
    out.m_73.x = _1688;
    out.m_73.y = _1690;
    float _1710 = _1274 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_87.x = _1706;
    out.m_87.y = _1708;
    out.m_87.z = _1702;
    float _1712 = _1686;
    float _1714 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _1716 = _1710;
    if (!_1700)
    {
        _1288 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1718 = _1288;
    float _1720 = -_1710;
    float _1722 = _1720 + 1.0;
    float _1724 = _1718;
    float _1726 = _1718;
    if (!_1700)
    {
        _1712 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1728 = _1712;
    float _1730 = _1728;
    float _1732 = _1728;
    if (!_1700)
    {
        _1290 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1734 = _1290;
    float _1736 = -_1150;
    float _1738 = _1736 + 1.0;
    float _1740 = _1738 * _1704;
    float _1742 = precise::clamp(_1740, 0.0, 1.0);
    float _1744 = -_1742;
    float _1746 = fma(_1744, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1748 = _1734;
    float _1750 = _1734;
    if (!_1700)
    {
        _1714 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1752 = _1714;
    float _1754 = _1746 * _1644;
    float _1756 = _1754 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1758 = _1754;
    float _1760 = _1752;
    float _1762 = _1752;
    if (!_1700)
    {
        _1758 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1764 = _1758;
    float _1766 = _1710 * _1176;
    out.m_89.x = _1756;
    float _1768 = _1764;
    float _1770 = _1764;
    if (!_1700)
    {
        _1716 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1772 = _1716;
    float _1774 = _1182 * _1766;
    float _1776 = _1184 * _1766;
    float _1778 = _1186 * _1766;
    out.m_91.x = _1774;
    out.m_91.y = _1776;
    out.m_91.z = _1778;
    out.m_91.w = _1722;
    bool _1780 = !_1700;
    float _1782 = _1772;
    float _1784 = _1772;
    if (!_1780)
    {
        bool _1786 = _916 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1788 = isnan(_916);
        bool _1790 = _1786 || _1788;
        bool _1792 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1794 = _1790 || _1792;
        if (!_1794)
        {
            float _1796 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1798 = _916 + _1796;
            float _1800 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1802 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1800;
            float _1804 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1806 = _1804 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1808 = 1.0 / _1802;
            float _1810 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1812 = _1810 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1814 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1816 = _1814 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1818 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1820 = _1818 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1822 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1824 = _1822 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1826 = _1798 * _1808;
            float _1828 = precise::clamp(_1826, 0.0, 1.0);
            float _1830 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1832 = _1830 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1834 = fma(_1828, _1806, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1836 = fma(_1828, _1832, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1838 = fma(_1828, _1812, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1840 = fma(_1828, _1816, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1842 = fma(_1828, _1820, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1844 = fma(_1828, _1824, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1726 = _1838;
            _1784 = _1842;
            _1762 = _1834;
            _1750 = _1840;
            _1732 = _1836;
            _1770 = _1844;
            _1846 = true;
        }
        else
        {
            bool _1848 = _916 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1850 = isnan(_916);
            bool _1852 = _1848 || _1850;
            bool _1854 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1856 = _1852 || _1854;
            if (!_1856)
            {
                _1760 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1858 = _1760;
            _1762 = _1858;
            if (!_1856)
            {
                _1724 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1860 = _1724;
            _1726 = _1860;
            if (!_1856)
            {
                _1730 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1862 = _1730;
            _1732 = _1862;
            if (!_1856)
            {
                _1748 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1864 = _1748;
            _1750 = _1864;
            if (!_1856)
            {
                _1782 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1866 = _1782;
            _1784 = _1866;
            if (!_1856)
            {
                _1768 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1868 = _1768;
            bool _1870 = !_1856;
            _1770 = _1868;
            if (!_1870)
            {
                bool _1872 = _916 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1874 = isnan(_916);
                bool _1876 = _1872 || _1874;
                bool _1878 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1880 = _1876 || _1878;
                if (!_1880)
                {
                    float _1882 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1884 = _916 + _1882;
                    float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1888 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1886;
                    float _1890 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1892 = _1890 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1894 = 1.0 / _1888;
                    float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1898 = _1896 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1900 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1902 = _1900 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1904 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1906 = _1904 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1908 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1910 = _1908 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1912 = _1884 * _1894;
                    float _1914 = precise::clamp(_1912, 0.0, 1.0);
                    float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1918 = _1916 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1920 = fma(_1914, _1892, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1922 = fma(_1914, _1918, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1924 = fma(_1914, _1898, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1926 = fma(_1914, _1902, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1928 = fma(_1914, _1906, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1930 = fma(_1914, _1910, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1726 = _1924;
                    _1784 = _1928;
                    _1762 = _1920;
                    _1750 = _1926;
                    _1732 = _1922;
                    _1770 = _1930;
                    _1846 = true;
                }
                else
                {
                    _1726 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1784 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1762 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1750 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1732 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1770 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1846 = false;
    float _1932 = _1726;
    float _1934 = _1784;
    float _1936 = _1762;
    float _1938 = _1750;
    float _1940 = _1732;
    float _1942 = _1770;
    float _1944 = fma(_1708, -0.5, 0.5);
    float _1946 = precise::clamp(_1944, 0.0, 1.0);
    float _1948 = -_1932;
    float _1950 = _1948 + _1934;
    float _1952 = -_1936;
    float _1954 = _1952 + _1938;
    float _1956 = -_1940;
    float _1958 = _1956 + _1942;
    bool _1960 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1962 = fma(_1946, _1950, _1932);
    float _1964 = fma(_1946, _1954, _1936);
    float _1966 = fma(_1946, _1958, _1940);
    float _1968 = _1962 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _1970 = fma(_1964, 0.298911988735198974609375, _1968);
    out.m_89.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1972 = fma(_1966, 0.114477999508380889892578125, _1970);
    float _1974 = -_1972;
    float _1976 = _1964 + _1974;
    float _1978 = -_1972;
    float _1980 = _1962 + _1978;
    float _1982 = -_1972;
    float _1984 = _1966 + _1982;
    out.m_93.x = 0.0;
    float _1986 = fma(_1976, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1972);
    float _1988 = fma(_1980, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1972);
    float _1990 = fma(_1984, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1972);
    out.m_95.x = _1986;
    out.m_95.y = _1988;
    out.m_95.z = _1990;
    if (!_1960)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1992 = -_884;
    float _1994 = _1992 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1996 = -_886;
    float _1998 = _1996 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2000 = -_888;
    float _2002 = _2000 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2004 = _1994 * _1994;
    float _2006 = fma(_1998, _1998, _2004);
    float _2008 = fma(_2002, _2002, _2006);
    float _2010 = sqrt(_2008);
    float _2012 = rsqrt(_2008);
    float _2014 = -_2010;
    float _2016 = _2014 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2018 = _2016 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2020 = precise::clamp(_2018, 0.0, 1.0);
    float _2022 = _1998 * _2012;
    float _2024 = _1994 * _2012;
    float _2026 = abs(_2020);
    float _2028 = log2(_2026);
    float _2030 = _2002 * _2012;
    float _2032 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2034 = _1708 * _2024;
    float _2036 = -_2024;
    float _2038 = -_2032;
    float _2040 = fma(_2036, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2038);
    float _2042 = fma(_1706, _2022, _2034);
    float _2044 = -_2030;
    float _2046 = fma(_2044, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2040);
    float _2048 = fma(_1702, _2030, _2042);
    float _2050 = precise::clamp(_2048, 0.0, 1.0);
    float _2052 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2054 = _2046 + _2052;
    float _2056 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2058 = _2054 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2060 = precise::clamp(_2058, 0.0, 1.0);
    float _2062 = exp2(_2056);
    float _2064 = _2062 * _2060;
    float _2066 = _2050 * _2064;
    float _2068 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2070 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2072 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2068;
    out.m_93.y = _2070;
    out.m_93.z = _2072;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

