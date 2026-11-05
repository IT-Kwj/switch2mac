#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    texture2d<float> vp_t_tcb_C [[id(4)]];
    sampler vp_t_tcb_CSmplr [[id(5)]];
};

struct main0_out
{
    float4 m_34 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_52 [[user(locn3)]];
    float4 m_54 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(1)]];
    float4 m_31 [[attribute(2)]];
    float4 m_36 [[attribute(3)]];
    float4 m_50 [[attribute(4)]];
    float4 m_40 [[attribute(6)]];
    float4 m_38 [[attribute(7)]];
    float4 m_42 [[attribute(8)]];
};

static inline __attribute__((always_inline))
int _67(thread const int& _3750, thread const int& _3751, constant _10& support_buffer)
{
    float _3754 = as_type<float>(support_buffer._m4);
    int _3756 = _3751 + as_type<int>(_3754);
    int _3758 = 1 + _3756;
    float _3760 = support_buffer._m5[_3758].x;
    float _3762 = abs(_3760);
    bool _3764 = _3762 == 1.0;
    if (_3764)
    {
        return _3750;
    }
    float _3766 = float(_3750);
    float _3768 = _3766 / _3762;
    int _3770 = int(_3768);
    return _3770;
}

static inline __attribute__((always_inline))
int _68(thread const int& _3800, thread const int& _3801, constant _10& support_buffer)
{
    float _3804 = as_type<float>(support_buffer._m4);
    int _3806 = _3801 + as_type<int>(_3804);
    int _3808 = 1 + _3806;
    float _3810 = support_buffer._m5[_3808].x;
    bool _3812 = _3810 == 1.0;
    if (_3812)
    {
        return _3800;
    }
    float _3814 = float(_3800);
    float _3816 = _3814 * _3810;
    int _3818 = int(_3816);
    return _3818;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _550 = false;
    bool _274 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_31.w;
    float _74 = trunc(_72);
    int _76 = int(_74);
    bool _80 = _76 >= 1;
    float _82 = 0.0;
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _82;
    float _86 = _84;
    if (!_80)
    {
        out.m_34.x = 0.0;
    }
    int _88 = 0;
    if (!_80)
    {
        float _90 = _84 * 5.0;
        _88 = as_type<int>(_90);
    }
    int _92 = _88;
    int _94 = _92;
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1525 = as_type<float>(_92);
        out.gl_Position.z = _1525;
    }
    if (!_80)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _96 = in.m_36.w;
    bool _98 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _100 = isnan(_96);
    bool _102 = _98 || _100;
    bool _104 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _106 = _102 || _104;
    float _108 = -_96;
    float _110 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _112 = _110;
    if (_106)
    {
        float _114 = float(_76);
        _86 = _114;
    }
    float _116 = _86;
    bool _118 = _110 >= _116;
    bool _120 = !_106;
    bool _122 = _118 || _120;
    float _124 = _116;
    if (_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    if (_122)
    {
        out.m_34.x = 0.0;
    }
    if (_122)
    {
        float _128 = _126 * 5.0;
        _94 = as_type<int>(_128);
    }
    int _130 = _94;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1595 = as_type<float>(_130);
        out.gl_Position.z = _1595;
    }
    if (_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_38.w;
    float _134 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _140 = _136 || _138;
    bool _142 = isnan(1.0);
    bool _144 = _140 || _142;
    float _146 = in.m_36.x;
    float _148 = in.m_36.y;
    float _150 = in.m_36.z;
    float _152 = in.m_31.x;
    float _154 = in.m_31.y;
    float _156 = in.m_31.z;
    float _158 = 0.0;
    float _160 = _134;
    if (!_144)
    {
        float _162 = _134 * _134;
        float _164 = _162 * 0.5;
        _158 = _164;
    }
    float _166 = _158;
    float _168 = _166;
    if (!_144)
    {
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _168 = _170;
    }
    float _172 = _168;
    bool _174 = !_144;
    float _176 = _172;
    if (!_174)
    {
        float _178 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _180 = log2(_178);
        float _182 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _184 = _182 + 1.0;
        float _186 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = _134 * _180;
        float _190 = 1.0 / _184;
        float _192 = _186 * 0.693147182464599609375;
        float _194 = exp2(_188);
        float _196 = 1.0 / _192;
        float _198 = _194 + (-1.0);
        float _200 = -_198;
        float _202 = fma(_200, _196, _134);
        float _204 = _202 * _190;
        float _206 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _206;
    }
    float _208 = _176;
    bool _210 = !_144;
    if (!_210)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = 1.0 / _218;
        float _222 = _134 * _214;
        float _224 = exp2(_222);
        float _226 = -_224;
        float _228 = _226 + 1.0;
        float _230 = _228 * _220;
        _160 = _230;
    }
    float _232 = _160;
    bool _234 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _236 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _238 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _240 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _242 = fma(_232, _146, _236);
    float _244 = fma(_232, _148, _238);
    float _246 = fma(_232, _150, _240);
    float _248 = fma(_242, _132, _152);
    float _250 = fma(_244, _132, _154);
    float _252 = fma(_246, _132, _156);
    bool _254 = !_234;
    float _272;
    if (!_254)
    {
        float _256 = in.m_40.x;
        float _258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _260 = _256 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _262 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _264 = _262 * _258;
        float _266 = floor(_264);
        float _268 = -_266;
        float _270 = _264 + _268;
        _272 = _270;
        _274 = true;
    }
    else
    {
        float _276 = float(_76);
        float _278 = 1.0 / _276;
        float _280 = _110 * _278;
        _272 = _280;
    }
    _274 = false;
    float _282 = _272;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _286 = _282 + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _290 = _282 + _288;
    bool _292 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _294 = isnan(_282);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _320 = 1.0 / _306;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _324 = _282 + _322;
    float _326 = 1.0 / _318;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _330 = _282 + _328;
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _334 = 1.0 / _310;
    float _336 = _286 * _320;
    bool _338 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _340 = isnan(_282);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    bool _350 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _352 = isnan(_282);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = 1.0 / _314;
    float _364 = _330 * _326;
    float _366 = -_302;
    float _368 = _366 + 1.0;
    float _370 = _348 * _368;
    float _372 = -_348;
    float _374 = _372 + 1.0;
    float _376 = _290 * _334;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _382;
    bool _386 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _388 = isnan(_282);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = fma(_380, _336, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _400 = fma(_384, _336, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _402 = _324 * _362;
    bool _404 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _406 = isnan(_282);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _424 = fma(_418, _336, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _426 = -_414;
    float _428 = _426 + 1.0;
    float _430 = _414 * _374;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = _360 * _428;
    float _442 = -_360;
    float _444 = _442 + 1.0;
    float _446 = fma(_422, _376, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _448 = fma(_438, _376, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _450 = fma(_434, _376, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _452 = _396 * _444;
    float _454 = -_396;
    float _456 = _454 + 1.0;
    float _458 = _398 * _452;
    float _460 = _400 * _452;
    float _462 = _424 * _452;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _464;
    float _468 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].x, _458);
    float _470 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].y, _460);
    float _472 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].z, _462);
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _478;
    float _482 = fma(_446, _440, _468);
    float _484 = fma(_448, _440, _470);
    float _486 = fma(_450, _440, _472);
    float _488 = fma(_466, _402, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _490 = fma(_476, _402, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _500 = fma(_480, _402, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _506 = fma(_488, _430, _482);
    float _508 = fma(_494, _364, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _510 = fma(_498, _364, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _512 = fma(_490, _430, _484);
    float _514 = fma(_504, _364, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _516 = fma(_500, _430, _486);
    float _518 = fma(_508, _370, _506);
    float _520 = fma(_510, _370, _512);
    float _522 = fma(_514, _370, _516);
    float _524 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[147].x, _518);
    float _526 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[147].y, _520);
    float _528 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[147].z, _522);
    bool _530 = !_332;
    float _548;
    if (!_530)
    {
        float _532 = in.m_40.x;
        float _534 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _536 = _532 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _538 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[11].z, _110);
        float _540 = _538 * _534;
        float _542 = floor(_540);
        float _544 = -_542;
        float _546 = _540 + _544;
        _548 = _546;
        _550 = true;
    }
    else
    {
        float _552 = float(_76);
        float _554 = 1.0 / _552;
        float _556 = _110 * _554;
        _548 = _556;
    }
    _550 = false;
    float _558 = _548;
    int _560 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _562 = _560;
    int _564 = 0;
    int _566 = _67(_562, _564, (*spvDescriptorSet0.support_buffer));
    float _568 = in.m_40.x;
    float _570 = in.m_40.y;
    float _572 = in.m_42.z;
    float _574 = _568 * 8.0;
    float _576 = rint(_574);
    float _578 = _576 * 0.125;
    float _580 = precise::clamp(_578, 0.0, 1.0);
    int _582 = _566 + (-1);
    float _584 = trunc(_572);
    int _586 = int(_584);
    float _588 = float(_582);
    float _590 = _580 * _588;
    float _592 = trunc(_590);
    int _594 = int(_592);
    int _596 = _594 + 1;
    int _598 = min(_582, _596);
    int _600 = _594;
    int _602 = 0;
    int _604 = _68(_600, _602, (*spvDescriptorSet0.support_buffer));
    int _606 = _586;
    int _608 = 0;
    int _610 = _68(_606, _608, (*spvDescriptorSet0.support_buffer));
    float3 _614 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_604, _610)), 0).xyz;
    float _616 = _614.x;
    float _618 = _614.y;
    float _620 = _614.z;
    int _622 = _598;
    int _624 = 0;
    int _626 = _68(_622, _624, (*spvDescriptorSet0.support_buffer));
    int _628 = _586;
    int _630 = 0;
    int _632 = _68(_628, _630, (*spvDescriptorSet0.support_buffer));
    float3 _634 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_626, _632)), 0).xyz;
    float _636 = _634.x;
    float _638 = _634.y;
    float _640 = _634.z;
    float _642 = in.m_42.y;
    float _644 = _250 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _646 = _250 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _650 = _648 != 0;
    float _652 = _250 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _656 = _654 != 0;
    float _658 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[5].x, _644);
    float _660 = in.m_40.z;
    float _662 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _664 = log2(_662);
    float _666 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[4].x, _646);
    float _668 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[6].x, _652);
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _672 = _670 != 0;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _676 = _674 != 0;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _680 = _678 != 0;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _684 = _682 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _686;
    float _690 = 0.0;
    if (_650)
    {
        float _692 = in.m_40.x;
        _690 = _692;
    }
    float _694 = _690;
    float _696 = _568 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _698 = 1.0 / _688;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _702 = _570 > 0.5;
    float _704 = _570 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _706 = -_642;
    float _708 = _706 + 1.0;
    float _710 = -_700;
    float _712 = fma(_696, 2.0, _710);
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _716 = 1.0 / _684;
    float _718 = in.m_42.x;
    float _720 = _664 * _110;
    float _722 = _642;
    if (_656)
    {
        float _724 = _702 ? _708 : _642;
        _722 = _724;
    }
    float _726 = _722;
    float _728 = fma(_704, -2.0, _714);
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _732 = _558 + _730;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _736 = _558 + _734;
    float _738 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].z, _666);
    float _740 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _742 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].z, _658);
    float _744 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].z, _668);
    float _746 = _732 * _698;
    float _748 = _660 * 2.0;
    float _750 = _568 * 2.0;
    bool _752 = _694 > 0.5;
    bool _754 = _752 && _650;
    float _756 = exp2(_720);
    float _758 = _736 * _716;
    float _760 = _570 + _660;
    bool _762 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _764 = isnan(1.0);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _770 = _766 || _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _774 = 1.0 + _772;
    float _776 = _570 * 2.0;
    float _778 = _760 + (-1.0);
    bool _780 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _782 = isnan(0.0);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _788 = _784 || _786;
    float _790 = _740 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _792 = floor(_748);
    float _794 = 0.0;
    float _796 = _718;
    if (_650)
    {
        _794 = _718;
    }
    float _798 = _794;
    float _800 = fma(_790, _726, -0.5);
    float _802 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[76].y, _728);
    float _804 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _806 = -_756;
    float _808 = _806 + 1.0;
    float _810 = _570 + _568;
    float _812 = 1.0 / _774;
    float _814 = _798;
    if (_754)
    {
        float _816 = -_798;
        float _818 = _816 + 1.0;
        _814 = _818;
    }
    float _820 = _814;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _824 = _788 ? _808 : 0.0;
    float _826 = _810 + (-1.0);
    bool _828 = _558 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _830 = isnan(_558);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[78].z, _822);
    float _842 = floor(_750);
    float _844 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].z, _840);
    bool _846 = _792 > 0.0;
    float _848 = -_110;
    float _850 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[76].x, _712);
    bool _852 = _792 >= 0.0;
    bool _854 = isnan(_792);
    bool _856 = _852 || _854;
    bool _858 = isnan(0.0);
    bool _860 = _856 || _858;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _864 = _558 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _866 = isnan(_558);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = floor(_776);
    bool _878 = _558 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _880 = isnan(_558);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[78].w, _862);
    float _892 = -_838;
    float _894 = _892 + 1.0;
    float _896 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].w, _890);
    if (_650)
    {
        _796 = _820;
    }
    float _898 = _796;
    if (_770)
    {
        float _900 = _824 * _812;
        _112 = _900;
    }
    float _902 = _112;
    float _904 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _906 = _842 >= 0.0;
    bool _908 = isnan(_842);
    bool _910 = _906 || _908;
    bool _912 = isnan(0.0);
    bool _914 = _910 || _912;
    float _916 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _918 = _842 > 0.0;
    float _920 = -_888;
    float _922 = _920 + 1.0;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _924;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _928;
    float _932 = _888 * _894;
    int _934 = _860 ? 0 : 1;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _936;
    int _940 = _914 ? 0 : 1;
    float _942 = fma(_926, _746, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _944 = _876 > 0.0;
    float _946 = fma(_930, _746, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _948 = _876 >= 0.0;
    bool _950 = isnan(_876);
    bool _952 = _948 || _950;
    bool _954 = isnan(0.0);
    bool _956 = _952 || _954;
    float _958 = _874 * _922;
    float _960 = fma(_938, _746, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _962 = -_802;
    float _964 = fma(_896, _800, _962);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _970 = _942 * _958;
    float _972 = _946 * _958;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _976 = _974 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _982 = _960 * _958;
    float _984 = -_874;
    float _986 = _984 + 1.0;
    float _988 = fma(_968, _758, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _990 = fma(_976, _758, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _992 = fma(_980, _758, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _994 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[123].x, _982);
    float _996 = _904 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _998 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[123].y, _970);
    int _1000 = _956 ? 0 : 1;
    float _1002 = fma(_988, _932, _994);
    float _1004 = fma(_996, _898, -0.5);
    float _1006 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[123].z, _972);
    bool _1008 = !_672;
    int _1010 = _1008 ? 0 : 1;
    float _1012 = fma(_990, _932, _998);
    bool _1014 = !_676;
    int _1016 = _1014 ? 0 : 1;
    float _1018 = fma(_992, _932, _1006);
    int _1020 = ~_1000;
    int _1022 = _1020 + 1;
    int _1024 = _1022 + 1;
    float _1026 = fma(_844, _1004, _850);
    int _1028 = _1024;
    if (!_944)
    {
        int _1030 = ~_1000;
        int _1032 = _1030 + 1;
        _1028 = _1032;
    }
    int _1034 = _1028;
    float _1036 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1002);
    int _1038 = abs(_1010);
    float _1040 = _964 + 0.5;
    int _1042 = abs(_1016);
    float _1044 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1012);
    float _1046 = in.m_44.x;
    float _1048 = in.m_44.y;
    float _1050 = in.m_44.z;
    bool _1052 = !_680;
    int _1054 = _1052 ? 0 : 1;
    float _1056 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1018);
    int _1058 = ~_940;
    int _1060 = _1058 + 1;
    int _1062 = _1060 + 1;
    float _1064 = _570 + (-0.5);
    int _1066 = _1062;
    if (!_918)
    {
        int _1068 = ~_940;
        int _1070 = _1068 + 1;
        _1066 = _1070;
    }
    int _1072 = _1066;
    int _1074 = abs(_1054);
    float _1076 = float(_1038);
    float _1078 = float(_1042);
    float _1080 = float(_1072);
    float _1082 = float(_1034);
    int _1084 = ~_934;
    int _1086 = _1084 + 1;
    int _1088 = _1086 + 1;
    float _1090 = _1078 * _1080;
    int _1092 = _1088;
    if (!_846)
    {
        int _1094 = ~_934;
        int _1096 = _1094 + 1;
        _1092 = _1096;
    }
    int _1098 = _1092;
    float _1100 = _1090 * (-2.0);
    float _1102 = float(_1098);
    float _1104 = float(_1074);
    float _1106 = fma(_1100, _1048, _1048);
    float _1108 = fma(_804, _1100, _804);
    float _1110 = _1076 * _1102;
    float _1112 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1114 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1106);
    float _1116 = _1026 + 0.5;
    float _1118 = _1044 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1120 = _1104 * _1082;
    float _1122 = fma(_1108, _902, _1114);
    float _1124 = _660 + _568;
    float _1126 = _568 + (-0.5);
    float _1128 = floor(_590);
    float _1130 = in.m_38.x;
    float _1132 = in.m_38.y;
    float _1134 = in.m_38.z;
    float _1136 = _1110 * (-2.0);
    float _1138 = _1124 + (-1.0);
    out.m_46.x = _1116;
    out.m_46.y = _1040;
    float _1140 = _660 + (-0.5);
    float _1142 = fma(_1136, _1046, _1046);
    float _1144 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1146 = _1056 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1148 = fma(_916, _1136, _916);
    float _1150 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1142);
    float _1152 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1154 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1156 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1158 = _1120 * (-2.0);
    float _1160 = fma(_1148, _902, _1150);
    float _1162 = -_1128;
    float _1164 = _590 + _1162;
    float _1166 = _1122 * 0.15915493667125701904296875;
    float _1168 = fma(_1158, _1050, _1050);
    float _1170 = fma(_1144, _1158, _1144);
    float _1172 = _1160 * 0.15915493667125701904296875;
    out.m_48.x = _1152;
    out.m_48.y = _1154;
    out.m_48.z = _1156;
    float _1174 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1168);
    float _1176 = _1166 * 6.283185482025146484375;
    float _1178 = cos(_1176);
    float _1180 = _526 * _1132;
    float _1182 = _524 * _1130;
    float _1184 = fma(_1170, _902, _1174);
    float _1186 = _528 * _1134;
    float _1188 = _1184 * 0.15915493667125701904296875;
    float _1190 = _1172 * 6.283185482025146484375;
    float _1192 = cos(_1190);
    float _1194 = _1166 * 6.283185482025146484375;
    float _1196 = sin(_1194);
    float _1198 = _1172 * 6.283185482025146484375;
    float _1200 = sin(_1198);
    float _1202 = _1188 * 6.283185482025146484375;
    float _1204 = cos(_1202);
    float _1206 = _1192 * _1196;
    float _1208 = _1200 * _1196;
    float _1210 = _1200 * _1178;
    float _1212 = _1200 * _1204;
    float _1214 = _1192 * _1178;
    float _1216 = _1178 * _1204;
    float _1218 = -_618;
    float _1220 = _1218 + _638;
    float _1222 = -_616;
    float _1224 = _1222 + _636;
    float _1226 = -_620;
    float _1228 = _1226 + _640;
    float _1230 = fma(_1164, _1220, _618);
    float _1232 = fma(_1164, _1224, _616);
    float _1234 = _1188 * 6.283185482025146484375;
    float _1236 = sin(_1234);
    float _1238 = in.m_50.x;
    float _1240 = in.m_50.y;
    float _1242 = in.m_50.z;
    float _1244 = fma(_1164, _1228, _620);
    bool _1246 = _1230 != 0.0;
    bool _1248 = isnan(_1230);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan(0.0);
    bool _1254 = _1250 || _1252;
    float _1256 = _1192 * _1204;
    float _1258 = _1196 * _1204;
    bool _1260 = _1232 == 0.0;
    bool _1262 = !_1254;
    bool _1264 = _1260 && _1262;
    float _1266 = _1182 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1232);
    bool _1270 = _1244 == 0.0;
    bool _1272 = _1270 && _1264;
    float _1274 = fma(_1236, _1214, _1208);
    float _1276 = fma(_1236, _1208, _1214);
    float _1278 = _1180 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1280 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1230);
    float _1282 = -_1206;
    float _1284 = fma(_1236, _1210, _1282);
    float _1286 = _1266 * _1268;
    float _1288 = -_1210;
    float _1290 = fma(_1236, _1206, _1288);
    float _1292 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1244);
    float _1294 = _1278 * _1280;
    float _1296 = _1238;
    float _1298 = _1240;
    float _1300 = _1242;
    if (!_1272)
    {
        float _1302 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1238);
        _1296 = _1302;
    }
    float _1304 = _1296;
    float _1306 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    if (!_1272)
    {
        float _1308 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1240);
        _1298 = _1308;
    }
    float _1310 = _1298;
    float _1312 = -_1294;
    float _1314 = _1236 * _1312;
    if (!_1272)
    {
        float _1316 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1242);
        _1300 = _1316;
    }
    float _1318 = _1300;
    float _1320 = _1306 * _1292;
    float _1322 = _1256 * _1294;
    float _1324 = _1212 * _1294;
    float _1326 = -_1310;
    float _1328 = _1236 * _1326;
    float _1330 = _1256 * _1310;
    float _1332 = fma(_1274, _1286, _1322);
    float _1334 = _1212 * _1310;
    float _1336 = fma(_1216, _1286, _1314);
    float _1338 = fma(_1284, _1286, _1324);
    float _1340 = fma(_1290, _1320, _1332);
    float _1342 = fma(_1216, _1304, _1328);
    float _1344 = fma(_1274, _1304, _1330);
    float _1346 = fma(_1284, _1304, _1334);
    float _1348 = fma(_1258, _1320, _1336);
    float _1350 = fma(_1276, _1320, _1338);
    float _1352 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1354 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1356 = fma(_1276, _1318, _1346);
    float _1358 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1360 = fma(_1348, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1352);
    float _1362 = fma(_1348, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1354);
    float _1364 = _742 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1366 = fma(_1348, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1358);
    float _1368 = fma(_1350, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1360);
    float _1370 = fma(_1350, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1362);
    float _1372 = _738 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1374 = fma(_1258, _1318, _1342);
    float _1376 = fma(_1290, _1318, _1344);
    float _1378 = _1364 + _1370;
    float _1380 = fma(_1350, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1366);
    float _1382 = _744 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1384 = _1372 + _1368;
    float _1386 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1388 = _1376 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1390 = _1382 + _1380;
    float _1392 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1394 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1386);
    float _1396 = _1376 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1398 = _1376 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1400 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1402 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1392);
    float _1404 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1394);
    float _1406 = fma(_1374, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1388);
    float _1408 = fma(_1374, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1396);
    float _1410 = fma(_1374, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1398);
    float _1412 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1400);
    float _1414 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1416 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1402);
    float _1418 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1420 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1412);
    float _1422 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1414);
    float _1424 = _1416 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1426 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1428 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1430 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1432 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1434 = _1420 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1436 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1426);
    float _1438 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1422);
    float _1440 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1428);
    float _1442 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1430);
    float _1444 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1432);
    float _1446 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1436);
    float _1448 = _1438 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1450 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1440);
    float _1452 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1442);
    float _1454 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1444);
    float _1456 = fma(_1356, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1408);
    float _1458 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1446);
    float _1460 = fma(_1356, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1406);
    float _1462 = fma(_1356, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1410);
    float _1464 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1450);
    float _1466 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1452);
    float _1468 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1454);
    out.m_52.x = _1460;
    out.m_52.y = _1456;
    out.m_52.z = _1462;
    out.m_34.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_54.x = _1384;
    out.m_54.y = _1378;
    out.m_54.z = _1390;
    out.gl_Position.x = _1464;
    out.gl_Position.y = _1458;
    out.gl_Position.z = _1466;
    out.gl_Position.w = _1468;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _550 = false;
    bool _274 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_31.w;
    float _74 = trunc(_72);
    int _76 = int(_74);
    bool _80 = _76 >= 1;
    float _82 = 0.0;
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _82;
    float _86 = _84;
    if (!_80)
    {
        out.m_34.x = 0.0;
    }
    int _88 = 0;
    if (!_80)
    {
        float _90 = _84 * 5.0;
        _88 = as_type<int>(_90);
    }
    int _92 = _88;
    int _94 = _92;
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1525 = as_type<float>(_92);
        out.gl_Position.z = _1525;
    }
    if (!_80)
    {
        return out;
    }
    float _96 = in.m_36.w;
    bool _98 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _100 = isnan(_96);
    bool _102 = _98 || _100;
    bool _104 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _106 = _102 || _104;
    float _108 = -_96;
    float _110 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _112 = _110;
    if (_106)
    {
        float _114 = float(_76);
        _86 = _114;
    }
    float _116 = _86;
    bool _118 = _110 >= _116;
    bool _120 = !_106;
    bool _122 = _118 || _120;
    float _124 = _116;
    if (_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    if (_122)
    {
        out.m_34.x = 0.0;
    }
    if (_122)
    {
        float _128 = _126 * 5.0;
        _94 = as_type<int>(_128);
    }
    int _130 = _94;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1595 = as_type<float>(_130);
        out.gl_Position.z = _1595;
    }
    if (_122)
    {
        return out;
    }
    float _132 = in.m_38.w;
    float _134 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _140 = _136 || _138;
    bool _142 = isnan(1.0);
    bool _144 = _140 || _142;
    float _146 = in.m_36.x;
    float _148 = in.m_36.y;
    float _150 = in.m_36.z;
    float _152 = in.m_31.x;
    float _154 = in.m_31.y;
    float _156 = in.m_31.z;
    float _158 = 0.0;
    float _160 = _134;
    if (!_144)
    {
        float _162 = _134 * _134;
        float _164 = _162 * 0.5;
        _158 = _164;
    }
    float _166 = _158;
    float _168 = _166;
    if (!_144)
    {
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _168 = _170;
    }
    float _172 = _168;
    bool _174 = !_144;
    float _176 = _172;
    if (!_174)
    {
        float _178 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _180 = log2(_178);
        float _182 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _184 = _182 + 1.0;
        float _186 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = _134 * _180;
        float _190 = 1.0 / _184;
        float _192 = _186 * 0.693147182464599609375;
        float _194 = exp2(_188);
        float _196 = 1.0 / _192;
        float _198 = _194 + (-1.0);
        float _200 = -_198;
        float _202 = fma(_200, _196, _134);
        float _204 = _202 * _190;
        float _206 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _206;
    }
    float _208 = _176;
    bool _210 = !_144;
    if (!_210)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = 1.0 / _218;
        float _222 = _134 * _214;
        float _224 = exp2(_222);
        float _226 = -_224;
        float _228 = _226 + 1.0;
        float _230 = _228 * _220;
        _160 = _230;
    }
    float _232 = _160;
    bool _234 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _236 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _238 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _240 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _242 = fma(_232, _146, _236);
    float _244 = fma(_232, _148, _238);
    float _246 = fma(_232, _150, _240);
    float _248 = fma(_242, _132, _152);
    float _250 = fma(_244, _132, _154);
    float _252 = fma(_246, _132, _156);
    bool _254 = !_234;
    float _272;
    if (!_254)
    {
        float _256 = in.m_40.x;
        float _258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _260 = _256 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _262 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _264 = _262 * _258;
        float _266 = floor(_264);
        float _268 = -_266;
        float _270 = _264 + _268;
        _272 = _270;
        _274 = true;
    }
    else
    {
        float _276 = float(_76);
        float _278 = 1.0 / _276;
        float _280 = _110 * _278;
        _272 = _280;
    }
    _274 = false;
    float _282 = _272;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _286 = _282 + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _290 = _282 + _288;
    bool _292 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _294 = isnan(_282);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _320 = 1.0 / _306;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _324 = _282 + _322;
    float _326 = 1.0 / _318;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _330 = _282 + _328;
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _334 = 1.0 / _310;
    float _336 = _286 * _320;
    bool _338 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _340 = isnan(_282);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    bool _350 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _352 = isnan(_282);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = 1.0 / _314;
    float _364 = _330 * _326;
    float _366 = -_302;
    float _368 = _366 + 1.0;
    float _370 = _348 * _368;
    float _372 = -_348;
    float _374 = _372 + 1.0;
    float _376 = _290 * _334;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _382;
    bool _386 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _388 = isnan(_282);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = fma(_380, _336, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _400 = fma(_384, _336, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _402 = _324 * _362;
    bool _404 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _406 = isnan(_282);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _424 = fma(_418, _336, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _426 = -_414;
    float _428 = _426 + 1.0;
    float _430 = _414 * _374;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = _360 * _428;
    float _442 = -_360;
    float _444 = _442 + 1.0;
    float _446 = fma(_422, _376, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _448 = fma(_438, _376, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _450 = fma(_434, _376, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _452 = _396 * _444;
    float _454 = -_396;
    float _456 = _454 + 1.0;
    float _458 = _398 * _452;
    float _460 = _400 * _452;
    float _462 = _424 * _452;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _464;
    float _468 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].x, _458);
    float _470 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].y, _460);
    float _472 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].z, _462);
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _478;
    float _482 = fma(_446, _440, _468);
    float _484 = fma(_448, _440, _470);
    float _486 = fma(_450, _440, _472);
    float _488 = fma(_466, _402, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _490 = fma(_476, _402, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _500 = fma(_480, _402, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _506 = fma(_488, _430, _482);
    float _508 = fma(_494, _364, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _510 = fma(_498, _364, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _512 = fma(_490, _430, _484);
    float _514 = fma(_504, _364, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _516 = fma(_500, _430, _486);
    float _518 = fma(_508, _370, _506);
    float _520 = fma(_510, _370, _512);
    float _522 = fma(_514, _370, _516);
    float _524 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[147].x, _518);
    float _526 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[147].y, _520);
    float _528 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[147].z, _522);
    bool _530 = !_332;
    float _548;
    if (!_530)
    {
        float _532 = in.m_40.x;
        float _534 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _536 = _532 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _538 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[11].z, _110);
        float _540 = _538 * _534;
        float _542 = floor(_540);
        float _544 = -_542;
        float _546 = _540 + _544;
        _548 = _546;
        _550 = true;
    }
    else
    {
        float _552 = float(_76);
        float _554 = 1.0 / _552;
        float _556 = _110 * _554;
        _548 = _556;
    }
    _550 = false;
    float _558 = _548;
    int _560 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _562 = _560;
    int _564 = 0;
    int _566 = _67(_562, _564, (*spvDescriptorSet0.support_buffer));
    float _568 = in.m_40.x;
    float _570 = in.m_40.y;
    float _572 = in.m_42.z;
    float _574 = _568 * 8.0;
    float _576 = rint(_574);
    float _578 = _576 * 0.125;
    float _580 = precise::clamp(_578, 0.0, 1.0);
    int _582 = _566 + (-1);
    float _584 = trunc(_572);
    int _586 = int(_584);
    float _588 = float(_582);
    float _590 = _580 * _588;
    float _592 = trunc(_590);
    int _594 = int(_592);
    int _596 = _594 + 1;
    int _598 = min(_582, _596);
    int _600 = _594;
    int _602 = 0;
    int _604 = _68(_600, _602, (*spvDescriptorSet0.support_buffer));
    int _606 = _586;
    int _608 = 0;
    int _610 = _68(_606, _608, (*spvDescriptorSet0.support_buffer));
    float3 _614 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_604, _610)), 0).xyz;
    float _616 = _614.x;
    float _618 = _614.y;
    float _620 = _614.z;
    int _622 = _598;
    int _624 = 0;
    int _626 = _68(_622, _624, (*spvDescriptorSet0.support_buffer));
    int _628 = _586;
    int _630 = 0;
    int _632 = _68(_628, _630, (*spvDescriptorSet0.support_buffer));
    float3 _634 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_626, _632)), 0).xyz;
    float _636 = _634.x;
    float _638 = _634.y;
    float _640 = _634.z;
    float _642 = in.m_42.y;
    float _644 = _250 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _646 = _250 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _650 = _648 != 0;
    float _652 = _250 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _656 = _654 != 0;
    float _658 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[5].x, _644);
    float _660 = in.m_40.z;
    float _662 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _664 = log2(_662);
    float _666 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[4].x, _646);
    float _668 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[6].x, _652);
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _672 = _670 != 0;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _676 = _674 != 0;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _680 = _678 != 0;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _684 = _682 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _686;
    float _690 = 0.0;
    if (_650)
    {
        float _692 = in.m_40.x;
        _690 = _692;
    }
    float _694 = _690;
    float _696 = _568 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _698 = 1.0 / _688;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _702 = _570 > 0.5;
    float _704 = _570 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _706 = -_642;
    float _708 = _706 + 1.0;
    float _710 = -_700;
    float _712 = fma(_696, 2.0, _710);
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _716 = 1.0 / _684;
    float _718 = in.m_42.x;
    float _720 = _664 * _110;
    float _722 = _642;
    if (_656)
    {
        float _724 = _702 ? _708 : _642;
        _722 = _724;
    }
    float _726 = _722;
    float _728 = fma(_704, -2.0, _714);
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _732 = _558 + _730;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _736 = _558 + _734;
    float _738 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].z, _666);
    float _740 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _742 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].z, _658);
    float _744 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].z, _668);
    float _746 = _732 * _698;
    float _748 = _660 * 2.0;
    float _750 = _568 * 2.0;
    bool _752 = _694 > 0.5;
    bool _754 = _752 && _650;
    float _756 = exp2(_720);
    float _758 = _736 * _716;
    float _760 = _570 + _660;
    bool _762 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _764 = isnan(1.0);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _770 = _766 || _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _774 = 1.0 + _772;
    float _776 = _570 * 2.0;
    float _778 = _760 + (-1.0);
    bool _780 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _782 = isnan(0.0);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _788 = _784 || _786;
    float _790 = _740 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _792 = floor(_748);
    float _794 = 0.0;
    float _796 = _718;
    if (_650)
    {
        _794 = _718;
    }
    float _798 = _794;
    float _800 = fma(_790, _726, -0.5);
    float _802 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[76].y, _728);
    float _804 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _806 = -_756;
    float _808 = _806 + 1.0;
    float _810 = _570 + _568;
    float _812 = 1.0 / _774;
    float _814 = _798;
    if (_754)
    {
        float _816 = -_798;
        float _818 = _816 + 1.0;
        _814 = _818;
    }
    float _820 = _814;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _824 = _788 ? _808 : 0.0;
    float _826 = _810 + (-1.0);
    bool _828 = _558 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _830 = isnan(_558);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[78].z, _822);
    float _842 = floor(_750);
    float _844 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].z, _840);
    bool _846 = _792 > 0.0;
    float _848 = -_110;
    float _850 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[76].x, _712);
    bool _852 = _792 >= 0.0;
    bool _854 = isnan(_792);
    bool _856 = _852 || _854;
    bool _858 = isnan(0.0);
    bool _860 = _856 || _858;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _864 = _558 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _866 = isnan(_558);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = floor(_776);
    bool _878 = _558 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _880 = isnan(_558);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[78].w, _862);
    float _892 = -_838;
    float _894 = _892 + 1.0;
    float _896 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].w, _890);
    if (_650)
    {
        _796 = _820;
    }
    float _898 = _796;
    if (_770)
    {
        float _900 = _824 * _812;
        _112 = _900;
    }
    float _902 = _112;
    float _904 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _906 = _842 >= 0.0;
    bool _908 = isnan(_842);
    bool _910 = _906 || _908;
    bool _912 = isnan(0.0);
    bool _914 = _910 || _912;
    float _916 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _918 = _842 > 0.0;
    float _920 = -_888;
    float _922 = _920 + 1.0;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _924;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _928;
    float _932 = _888 * _894;
    int _934 = _860 ? 0 : 1;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _936;
    int _940 = _914 ? 0 : 1;
    float _942 = fma(_926, _746, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _944 = _876 > 0.0;
    float _946 = fma(_930, _746, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _948 = _876 >= 0.0;
    bool _950 = isnan(_876);
    bool _952 = _948 || _950;
    bool _954 = isnan(0.0);
    bool _956 = _952 || _954;
    float _958 = _874 * _922;
    float _960 = fma(_938, _746, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _962 = -_802;
    float _964 = fma(_896, _800, _962);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _970 = _942 * _958;
    float _972 = _946 * _958;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _976 = _974 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _982 = _960 * _958;
    float _984 = -_874;
    float _986 = _984 + 1.0;
    float _988 = fma(_968, _758, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _990 = fma(_976, _758, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _992 = fma(_980, _758, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _994 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[123].x, _982);
    float _996 = _904 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _998 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[123].y, _970);
    int _1000 = _956 ? 0 : 1;
    float _1002 = fma(_988, _932, _994);
    float _1004 = fma(_996, _898, -0.5);
    float _1006 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[123].z, _972);
    bool _1008 = !_672;
    int _1010 = _1008 ? 0 : 1;
    float _1012 = fma(_990, _932, _998);
    bool _1014 = !_676;
    int _1016 = _1014 ? 0 : 1;
    float _1018 = fma(_992, _932, _1006);
    int _1020 = ~_1000;
    int _1022 = _1020 + 1;
    int _1024 = _1022 + 1;
    float _1026 = fma(_844, _1004, _850);
    int _1028 = _1024;
    if (!_944)
    {
        int _1030 = ~_1000;
        int _1032 = _1030 + 1;
        _1028 = _1032;
    }
    int _1034 = _1028;
    float _1036 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1002);
    int _1038 = abs(_1010);
    float _1040 = _964 + 0.5;
    int _1042 = abs(_1016);
    float _1044 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1012);
    float _1046 = in.m_44.x;
    float _1048 = in.m_44.y;
    float _1050 = in.m_44.z;
    bool _1052 = !_680;
    int _1054 = _1052 ? 0 : 1;
    float _1056 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1018);
    int _1058 = ~_940;
    int _1060 = _1058 + 1;
    int _1062 = _1060 + 1;
    float _1064 = _570 + (-0.5);
    int _1066 = _1062;
    if (!_918)
    {
        int _1068 = ~_940;
        int _1070 = _1068 + 1;
        _1066 = _1070;
    }
    int _1072 = _1066;
    int _1074 = abs(_1054);
    float _1076 = float(_1038);
    float _1078 = float(_1042);
    float _1080 = float(_1072);
    float _1082 = float(_1034);
    int _1084 = ~_934;
    int _1086 = _1084 + 1;
    int _1088 = _1086 + 1;
    float _1090 = _1078 * _1080;
    int _1092 = _1088;
    if (!_846)
    {
        int _1094 = ~_934;
        int _1096 = _1094 + 1;
        _1092 = _1096;
    }
    int _1098 = _1092;
    float _1100 = _1090 * (-2.0);
    float _1102 = float(_1098);
    float _1104 = float(_1074);
    float _1106 = fma(_1100, _1048, _1048);
    float _1108 = fma(_804, _1100, _804);
    float _1110 = _1076 * _1102;
    float _1112 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1114 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1106);
    float _1116 = _1026 + 0.5;
    float _1118 = _1044 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1120 = _1104 * _1082;
    float _1122 = fma(_1108, _902, _1114);
    float _1124 = _660 + _568;
    float _1126 = _568 + (-0.5);
    float _1128 = floor(_590);
    float _1130 = in.m_38.x;
    float _1132 = in.m_38.y;
    float _1134 = in.m_38.z;
    float _1136 = _1110 * (-2.0);
    float _1138 = _1124 + (-1.0);
    out.m_46.x = _1116;
    out.m_46.y = _1040;
    float _1140 = _660 + (-0.5);
    float _1142 = fma(_1136, _1046, _1046);
    float _1144 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1146 = _1056 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1148 = fma(_916, _1136, _916);
    float _1150 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1142);
    float _1152 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1154 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1156 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1158 = _1120 * (-2.0);
    float _1160 = fma(_1148, _902, _1150);
    float _1162 = -_1128;
    float _1164 = _590 + _1162;
    float _1166 = _1122 * 0.15915493667125701904296875;
    float _1168 = fma(_1158, _1050, _1050);
    float _1170 = fma(_1144, _1158, _1144);
    float _1172 = _1160 * 0.15915493667125701904296875;
    out.m_48.x = _1152;
    out.m_48.y = _1154;
    out.m_48.z = _1156;
    float _1174 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1168);
    float _1176 = _1166 * 6.283185482025146484375;
    float _1178 = cos(_1176);
    float _1180 = _526 * _1132;
    float _1182 = _524 * _1130;
    float _1184 = fma(_1170, _902, _1174);
    float _1186 = _528 * _1134;
    float _1188 = _1184 * 0.15915493667125701904296875;
    float _1190 = _1172 * 6.283185482025146484375;
    float _1192 = cos(_1190);
    float _1194 = _1166 * 6.283185482025146484375;
    float _1196 = sin(_1194);
    float _1198 = _1172 * 6.283185482025146484375;
    float _1200 = sin(_1198);
    float _1202 = _1188 * 6.283185482025146484375;
    float _1204 = cos(_1202);
    float _1206 = _1192 * _1196;
    float _1208 = _1200 * _1196;
    float _1210 = _1200 * _1178;
    float _1212 = _1200 * _1204;
    float _1214 = _1192 * _1178;
    float _1216 = _1178 * _1204;
    float _1218 = -_618;
    float _1220 = _1218 + _638;
    float _1222 = -_616;
    float _1224 = _1222 + _636;
    float _1226 = -_620;
    float _1228 = _1226 + _640;
    float _1230 = fma(_1164, _1220, _618);
    float _1232 = fma(_1164, _1224, _616);
    float _1234 = _1188 * 6.283185482025146484375;
    float _1236 = sin(_1234);
    float _1238 = in.m_50.x;
    float _1240 = in.m_50.y;
    float _1242 = in.m_50.z;
    float _1244 = fma(_1164, _1228, _620);
    bool _1246 = _1230 != 0.0;
    bool _1248 = isnan(_1230);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan(0.0);
    bool _1254 = _1250 || _1252;
    float _1256 = _1192 * _1204;
    float _1258 = _1196 * _1204;
    bool _1260 = _1232 == 0.0;
    bool _1262 = !_1254;
    bool _1264 = _1260 && _1262;
    float _1266 = _1182 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1232);
    bool _1270 = _1244 == 0.0;
    bool _1272 = _1270 && _1264;
    float _1274 = fma(_1236, _1214, _1208);
    float _1276 = fma(_1236, _1208, _1214);
    float _1278 = _1180 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1280 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1230);
    float _1282 = -_1206;
    float _1284 = fma(_1236, _1210, _1282);
    float _1286 = _1266 * _1268;
    float _1288 = -_1210;
    float _1290 = fma(_1236, _1206, _1288);
    float _1292 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1244);
    float _1294 = _1278 * _1280;
    float _1296 = _1238;
    float _1298 = _1240;
    float _1300 = _1242;
    if (!_1272)
    {
        float _1302 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1238);
        _1296 = _1302;
    }
    float _1304 = _1296;
    float _1306 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    if (!_1272)
    {
        float _1308 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1240);
        _1298 = _1308;
    }
    float _1310 = _1298;
    float _1312 = -_1294;
    float _1314 = _1236 * _1312;
    if (!_1272)
    {
        float _1316 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1242);
        _1300 = _1316;
    }
    float _1318 = _1300;
    float _1320 = _1306 * _1292;
    float _1322 = _1256 * _1294;
    float _1324 = _1212 * _1294;
    float _1326 = -_1310;
    float _1328 = _1236 * _1326;
    float _1330 = _1256 * _1310;
    float _1332 = fma(_1274, _1286, _1322);
    float _1334 = _1212 * _1310;
    float _1336 = fma(_1216, _1286, _1314);
    float _1338 = fma(_1284, _1286, _1324);
    float _1340 = fma(_1290, _1320, _1332);
    float _1342 = fma(_1216, _1304, _1328);
    float _1344 = fma(_1274, _1304, _1330);
    float _1346 = fma(_1284, _1304, _1334);
    float _1348 = fma(_1258, _1320, _1336);
    float _1350 = fma(_1276, _1320, _1338);
    float _1352 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1354 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1356 = fma(_1276, _1318, _1346);
    float _1358 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1360 = fma(_1348, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1352);
    float _1362 = fma(_1348, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1354);
    float _1364 = _742 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1366 = fma(_1348, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1358);
    float _1368 = fma(_1350, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1360);
    float _1370 = fma(_1350, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1362);
    float _1372 = _738 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1374 = fma(_1258, _1318, _1342);
    float _1376 = fma(_1290, _1318, _1344);
    float _1378 = _1364 + _1370;
    float _1380 = fma(_1350, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1366);
    float _1382 = _744 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1384 = _1372 + _1368;
    float _1386 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1388 = _1376 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1390 = _1382 + _1380;
    float _1392 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1394 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1386);
    float _1396 = _1376 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1398 = _1376 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1400 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1402 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1392);
    float _1404 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1394);
    float _1406 = fma(_1374, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1388);
    float _1408 = fma(_1374, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1396);
    float _1410 = fma(_1374, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1398);
    float _1412 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1400);
    float _1414 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1416 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1402);
    float _1418 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1420 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1412);
    float _1422 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1414);
    float _1424 = _1416 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1426 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1428 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1430 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1432 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1434 = _1420 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1436 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1426);
    float _1438 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1422);
    float _1440 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1428);
    float _1442 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1430);
    float _1444 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1432);
    float _1446 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1436);
    float _1448 = _1438 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1450 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1440);
    float _1452 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1442);
    float _1454 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1444);
    float _1456 = fma(_1356, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1408);
    float _1458 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1446);
    float _1460 = fma(_1356, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1406);
    float _1462 = fma(_1356, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1410);
    float _1464 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1450);
    float _1466 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1452);
    float _1468 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1454);
    out.m_52.x = _1460;
    out.m_52.y = _1456;
    out.m_52.z = _1462;
    out.m_34.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_54.x = _1384;
    out.m_54.y = _1378;
    out.m_54.z = _1390;
    out.gl_Position.x = _1464;
    out.gl_Position.y = _1458;
    out.gl_Position.z = _1466;
    out.gl_Position.w = _1468;
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
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _550 = false;
    bool _274 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_31.w;
    float _74 = trunc(_72);
    int _76 = int(_74);
    bool _80 = _76 >= 1;
    float _82 = 0.0;
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _82;
    float _86 = _84;
    if (!_80)
    {
        out.m_34.x = 0.0;
    }
    int _88 = 0;
    if (!_80)
    {
        float _90 = _84 * 5.0;
        _88 = as_type<int>(_90);
    }
    int _92 = _88;
    int _94 = _92;
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1525 = as_type<float>(_92);
        out.gl_Position.z = _1525;
    }
    if (!_80)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _96 = in.m_36.w;
    bool _98 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _100 = isnan(_96);
    bool _102 = _98 || _100;
    bool _104 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _106 = _102 || _104;
    float _108 = -_96;
    float _110 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _112 = _110;
    if (_106)
    {
        float _114 = float(_76);
        _86 = _114;
    }
    float _116 = _86;
    bool _118 = _110 >= _116;
    bool _120 = !_106;
    bool _122 = _118 || _120;
    float _124 = _116;
    if (_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    if (_122)
    {
        out.m_34.x = 0.0;
    }
    if (_122)
    {
        float _128 = _126 * 5.0;
        _94 = as_type<int>(_128);
    }
    int _130 = _94;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1595 = as_type<float>(_130);
        out.gl_Position.z = _1595;
    }
    if (_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_38.w;
    float _134 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _140 = _136 || _138;
    bool _142 = isnan(1.0);
    bool _144 = _140 || _142;
    float _146 = in.m_36.x;
    float _148 = in.m_36.y;
    float _150 = in.m_36.z;
    float _152 = in.m_31.x;
    float _154 = in.m_31.y;
    float _156 = in.m_31.z;
    float _158 = 0.0;
    float _160 = _134;
    if (!_144)
    {
        float _162 = _134 * _134;
        float _164 = _162 * 0.5;
        _158 = _164;
    }
    float _166 = _158;
    float _168 = _166;
    if (!_144)
    {
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _168 = _170;
    }
    float _172 = _168;
    bool _174 = !_144;
    float _176 = _172;
    if (!_174)
    {
        float _178 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _180 = log2(_178);
        float _182 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _184 = _182 + 1.0;
        float _186 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = _134 * _180;
        float _190 = 1.0 / _184;
        float _192 = _186 * 0.693147182464599609375;
        float _194 = exp2(_188);
        float _196 = 1.0 / _192;
        float _198 = _194 + (-1.0);
        float _200 = -_198;
        float _202 = fma(_200, _196, _134);
        float _204 = _202 * _190;
        float _206 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _206;
    }
    float _208 = _176;
    bool _210 = !_144;
    if (!_210)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = 1.0 / _218;
        float _222 = _134 * _214;
        float _224 = exp2(_222);
        float _226 = -_224;
        float _228 = _226 + 1.0;
        float _230 = _228 * _220;
        _160 = _230;
    }
    float _232 = _160;
    bool _234 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _236 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _238 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _240 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _242 = fma(_232, _146, _236);
    float _244 = fma(_232, _148, _238);
    float _246 = fma(_232, _150, _240);
    float _248 = fma(_242, _132, _152);
    float _250 = fma(_244, _132, _154);
    float _252 = fma(_246, _132, _156);
    bool _254 = !_234;
    float _272;
    if (!_254)
    {
        float _256 = in.m_40.x;
        float _258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _260 = _256 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _262 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _264 = _262 * _258;
        float _266 = floor(_264);
        float _268 = -_266;
        float _270 = _264 + _268;
        _272 = _270;
        _274 = true;
    }
    else
    {
        float _276 = float(_76);
        float _278 = 1.0 / _276;
        float _280 = _110 * _278;
        _272 = _280;
    }
    _274 = false;
    float _282 = _272;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _286 = _282 + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _290 = _282 + _288;
    bool _292 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _294 = isnan(_282);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _320 = 1.0 / _306;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _324 = _282 + _322;
    float _326 = 1.0 / _318;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _330 = _282 + _328;
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _334 = 1.0 / _310;
    float _336 = _286 * _320;
    bool _338 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _340 = isnan(_282);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    bool _350 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _352 = isnan(_282);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = 1.0 / _314;
    float _364 = _330 * _326;
    float _366 = -_302;
    float _368 = _366 + 1.0;
    float _370 = _348 * _368;
    float _372 = -_348;
    float _374 = _372 + 1.0;
    float _376 = _290 * _334;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _382;
    bool _386 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _388 = isnan(_282);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = fma(_380, _336, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _400 = fma(_384, _336, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _402 = _324 * _362;
    bool _404 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _406 = isnan(_282);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _424 = fma(_418, _336, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _426 = -_414;
    float _428 = _426 + 1.0;
    float _430 = _414 * _374;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = _360 * _428;
    float _442 = -_360;
    float _444 = _442 + 1.0;
    float _446 = fma(_422, _376, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _448 = fma(_438, _376, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _450 = fma(_434, _376, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _452 = _396 * _444;
    float _454 = -_396;
    float _456 = _454 + 1.0;
    float _458 = _398 * _452;
    float _460 = _400 * _452;
    float _462 = _424 * _452;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _464;
    float _468 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].x, _458);
    float _470 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].y, _460);
    float _472 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].z, _462);
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _478;
    float _482 = fma(_446, _440, _468);
    float _484 = fma(_448, _440, _470);
    float _486 = fma(_450, _440, _472);
    float _488 = fma(_466, _402, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _490 = fma(_476, _402, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _500 = fma(_480, _402, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _506 = fma(_488, _430, _482);
    float _508 = fma(_494, _364, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _510 = fma(_498, _364, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _512 = fma(_490, _430, _484);
    float _514 = fma(_504, _364, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _516 = fma(_500, _430, _486);
    float _518 = fma(_508, _370, _506);
    float _520 = fma(_510, _370, _512);
    float _522 = fma(_514, _370, _516);
    float _524 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[147].x, _518);
    float _526 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[147].y, _520);
    float _528 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[147].z, _522);
    bool _530 = !_332;
    float _548;
    if (!_530)
    {
        float _532 = in.m_40.x;
        float _534 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _536 = _532 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _538 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[11].z, _110);
        float _540 = _538 * _534;
        float _542 = floor(_540);
        float _544 = -_542;
        float _546 = _540 + _544;
        _548 = _546;
        _550 = true;
    }
    else
    {
        float _552 = float(_76);
        float _554 = 1.0 / _552;
        float _556 = _110 * _554;
        _548 = _556;
    }
    _550 = false;
    float _558 = _548;
    int _560 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _562 = _560;
    int _564 = 0;
    int _566 = _67(_562, _564, (*spvDescriptorSet0.support_buffer));
    float _568 = in.m_40.x;
    float _570 = in.m_40.y;
    float _572 = in.m_42.z;
    float _574 = _568 * 8.0;
    float _576 = rint(_574);
    float _578 = _576 * 0.125;
    float _580 = precise::clamp(_578, 0.0, 1.0);
    int _582 = _566 + (-1);
    float _584 = trunc(_572);
    int _586 = int(_584);
    float _588 = float(_582);
    float _590 = _580 * _588;
    float _592 = trunc(_590);
    int _594 = int(_592);
    int _596 = _594 + 1;
    int _598 = min(_582, _596);
    int _600 = _594;
    int _602 = 0;
    int _604 = _68(_600, _602, (*spvDescriptorSet0.support_buffer));
    int _606 = _586;
    int _608 = 0;
    int _610 = _68(_606, _608, (*spvDescriptorSet0.support_buffer));
    float3 _614 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_604, _610)), 0).xyz;
    float _616 = _614.x;
    float _618 = _614.y;
    float _620 = _614.z;
    int _622 = _598;
    int _624 = 0;
    int _626 = _68(_622, _624, (*spvDescriptorSet0.support_buffer));
    int _628 = _586;
    int _630 = 0;
    int _632 = _68(_628, _630, (*spvDescriptorSet0.support_buffer));
    float3 _634 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_626, _632)), 0).xyz;
    float _636 = _634.x;
    float _638 = _634.y;
    float _640 = _634.z;
    float _642 = in.m_42.y;
    float _644 = _250 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _646 = _250 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _650 = _648 != 0;
    float _652 = _250 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _656 = _654 != 0;
    float _658 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[5].x, _644);
    float _660 = in.m_40.z;
    float _662 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _664 = log2(_662);
    float _666 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[4].x, _646);
    float _668 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[6].x, _652);
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _672 = _670 != 0;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _676 = _674 != 0;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _680 = _678 != 0;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _684 = _682 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _686;
    float _690 = 0.0;
    if (_650)
    {
        float _692 = in.m_40.x;
        _690 = _692;
    }
    float _694 = _690;
    float _696 = _568 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _698 = 1.0 / _688;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _702 = _570 > 0.5;
    float _704 = _570 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _706 = -_642;
    float _708 = _706 + 1.0;
    float _710 = -_700;
    float _712 = fma(_696, 2.0, _710);
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _716 = 1.0 / _684;
    float _718 = in.m_42.x;
    float _720 = _664 * _110;
    float _722 = _642;
    if (_656)
    {
        float _724 = _702 ? _708 : _642;
        _722 = _724;
    }
    float _726 = _722;
    float _728 = fma(_704, -2.0, _714);
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _732 = _558 + _730;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _736 = _558 + _734;
    float _738 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].z, _666);
    float _740 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _742 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].z, _658);
    float _744 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].z, _668);
    float _746 = _732 * _698;
    float _748 = _660 * 2.0;
    float _750 = _568 * 2.0;
    bool _752 = _694 > 0.5;
    bool _754 = _752 && _650;
    float _756 = exp2(_720);
    float _758 = _736 * _716;
    float _760 = _570 + _660;
    bool _762 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _764 = isnan(1.0);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _770 = _766 || _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _774 = 1.0 + _772;
    float _776 = _570 * 2.0;
    float _778 = _760 + (-1.0);
    bool _780 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _782 = isnan(0.0);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _788 = _784 || _786;
    float _790 = _740 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _792 = floor(_748);
    float _794 = 0.0;
    float _796 = _718;
    if (_650)
    {
        _794 = _718;
    }
    float _798 = _794;
    float _800 = fma(_790, _726, -0.5);
    float _802 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[76].y, _728);
    float _804 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _806 = -_756;
    float _808 = _806 + 1.0;
    float _810 = _570 + _568;
    float _812 = 1.0 / _774;
    float _814 = _798;
    if (_754)
    {
        float _816 = -_798;
        float _818 = _816 + 1.0;
        _814 = _818;
    }
    float _820 = _814;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _824 = _788 ? _808 : 0.0;
    float _826 = _810 + (-1.0);
    bool _828 = _558 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _830 = isnan(_558);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[78].z, _822);
    float _842 = floor(_750);
    float _844 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].z, _840);
    bool _846 = _792 > 0.0;
    float _848 = -_110;
    float _850 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[76].x, _712);
    bool _852 = _792 >= 0.0;
    bool _854 = isnan(_792);
    bool _856 = _852 || _854;
    bool _858 = isnan(0.0);
    bool _860 = _856 || _858;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _864 = _558 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _866 = isnan(_558);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = floor(_776);
    bool _878 = _558 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _880 = isnan(_558);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[78].w, _862);
    float _892 = -_838;
    float _894 = _892 + 1.0;
    float _896 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].w, _890);
    if (_650)
    {
        _796 = _820;
    }
    float _898 = _796;
    if (_770)
    {
        float _900 = _824 * _812;
        _112 = _900;
    }
    float _902 = _112;
    float _904 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _906 = _842 >= 0.0;
    bool _908 = isnan(_842);
    bool _910 = _906 || _908;
    bool _912 = isnan(0.0);
    bool _914 = _910 || _912;
    float _916 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _918 = _842 > 0.0;
    float _920 = -_888;
    float _922 = _920 + 1.0;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _924;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _928;
    float _932 = _888 * _894;
    int _934 = _860 ? 0 : 1;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _936;
    int _940 = _914 ? 0 : 1;
    float _942 = fma(_926, _746, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _944 = _876 > 0.0;
    float _946 = fma(_930, _746, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _948 = _876 >= 0.0;
    bool _950 = isnan(_876);
    bool _952 = _948 || _950;
    bool _954 = isnan(0.0);
    bool _956 = _952 || _954;
    float _958 = _874 * _922;
    float _960 = fma(_938, _746, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _962 = -_802;
    float _964 = fma(_896, _800, _962);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _970 = _942 * _958;
    float _972 = _946 * _958;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _976 = _974 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _982 = _960 * _958;
    float _984 = -_874;
    float _986 = _984 + 1.0;
    float _988 = fma(_968, _758, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _990 = fma(_976, _758, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _992 = fma(_980, _758, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _994 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[123].x, _982);
    float _996 = _904 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _998 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[123].y, _970);
    int _1000 = _956 ? 0 : 1;
    float _1002 = fma(_988, _932, _994);
    float _1004 = fma(_996, _898, -0.5);
    float _1006 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[123].z, _972);
    bool _1008 = !_672;
    int _1010 = _1008 ? 0 : 1;
    float _1012 = fma(_990, _932, _998);
    bool _1014 = !_676;
    int _1016 = _1014 ? 0 : 1;
    float _1018 = fma(_992, _932, _1006);
    int _1020 = ~_1000;
    int _1022 = _1020 + 1;
    int _1024 = _1022 + 1;
    float _1026 = fma(_844, _1004, _850);
    int _1028 = _1024;
    if (!_944)
    {
        int _1030 = ~_1000;
        int _1032 = _1030 + 1;
        _1028 = _1032;
    }
    int _1034 = _1028;
    float _1036 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1002);
    int _1038 = abs(_1010);
    float _1040 = _964 + 0.5;
    int _1042 = abs(_1016);
    float _1044 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1012);
    float _1046 = in.m_44.x;
    float _1048 = in.m_44.y;
    float _1050 = in.m_44.z;
    bool _1052 = !_680;
    int _1054 = _1052 ? 0 : 1;
    float _1056 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1018);
    int _1058 = ~_940;
    int _1060 = _1058 + 1;
    int _1062 = _1060 + 1;
    float _1064 = _570 + (-0.5);
    int _1066 = _1062;
    if (!_918)
    {
        int _1068 = ~_940;
        int _1070 = _1068 + 1;
        _1066 = _1070;
    }
    int _1072 = _1066;
    int _1074 = abs(_1054);
    float _1076 = float(_1038);
    float _1078 = float(_1042);
    float _1080 = float(_1072);
    float _1082 = float(_1034);
    int _1084 = ~_934;
    int _1086 = _1084 + 1;
    int _1088 = _1086 + 1;
    float _1090 = _1078 * _1080;
    int _1092 = _1088;
    if (!_846)
    {
        int _1094 = ~_934;
        int _1096 = _1094 + 1;
        _1092 = _1096;
    }
    int _1098 = _1092;
    float _1100 = _1090 * (-2.0);
    float _1102 = float(_1098);
    float _1104 = float(_1074);
    float _1106 = fma(_1100, _1048, _1048);
    float _1108 = fma(_804, _1100, _804);
    float _1110 = _1076 * _1102;
    float _1112 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1114 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1106);
    float _1116 = _1026 + 0.5;
    float _1118 = _1044 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1120 = _1104 * _1082;
    float _1122 = fma(_1108, _902, _1114);
    float _1124 = _660 + _568;
    float _1126 = _568 + (-0.5);
    float _1128 = floor(_590);
    float _1130 = in.m_38.x;
    float _1132 = in.m_38.y;
    float _1134 = in.m_38.z;
    float _1136 = _1110 * (-2.0);
    float _1138 = _1124 + (-1.0);
    out.m_46.x = _1116;
    out.m_46.y = _1040;
    float _1140 = _660 + (-0.5);
    float _1142 = fma(_1136, _1046, _1046);
    float _1144 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1146 = _1056 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1148 = fma(_916, _1136, _916);
    float _1150 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1142);
    float _1152 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1154 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1156 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1158 = _1120 * (-2.0);
    float _1160 = fma(_1148, _902, _1150);
    float _1162 = -_1128;
    float _1164 = _590 + _1162;
    float _1166 = _1122 * 0.15915493667125701904296875;
    float _1168 = fma(_1158, _1050, _1050);
    float _1170 = fma(_1144, _1158, _1144);
    float _1172 = _1160 * 0.15915493667125701904296875;
    out.m_48.x = _1152;
    out.m_48.y = _1154;
    out.m_48.z = _1156;
    float _1174 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1168);
    float _1176 = _1166 * 6.283185482025146484375;
    float _1178 = cos(_1176);
    float _1180 = _526 * _1132;
    float _1182 = _524 * _1130;
    float _1184 = fma(_1170, _902, _1174);
    float _1186 = _528 * _1134;
    float _1188 = _1184 * 0.15915493667125701904296875;
    float _1190 = _1172 * 6.283185482025146484375;
    float _1192 = cos(_1190);
    float _1194 = _1166 * 6.283185482025146484375;
    float _1196 = sin(_1194);
    float _1198 = _1172 * 6.283185482025146484375;
    float _1200 = sin(_1198);
    float _1202 = _1188 * 6.283185482025146484375;
    float _1204 = cos(_1202);
    float _1206 = _1192 * _1196;
    float _1208 = _1200 * _1196;
    float _1210 = _1200 * _1178;
    float _1212 = _1200 * _1204;
    float _1214 = _1192 * _1178;
    float _1216 = _1178 * _1204;
    float _1218 = -_618;
    float _1220 = _1218 + _638;
    float _1222 = -_616;
    float _1224 = _1222 + _636;
    float _1226 = -_620;
    float _1228 = _1226 + _640;
    float _1230 = fma(_1164, _1220, _618);
    float _1232 = fma(_1164, _1224, _616);
    float _1234 = _1188 * 6.283185482025146484375;
    float _1236 = sin(_1234);
    float _1238 = in.m_50.x;
    float _1240 = in.m_50.y;
    float _1242 = in.m_50.z;
    float _1244 = fma(_1164, _1228, _620);
    bool _1246 = _1230 != 0.0;
    bool _1248 = isnan(_1230);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan(0.0);
    bool _1254 = _1250 || _1252;
    float _1256 = _1192 * _1204;
    float _1258 = _1196 * _1204;
    bool _1260 = _1232 == 0.0;
    bool _1262 = !_1254;
    bool _1264 = _1260 && _1262;
    float _1266 = _1182 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1232);
    bool _1270 = _1244 == 0.0;
    bool _1272 = _1270 && _1264;
    float _1274 = fma(_1236, _1214, _1208);
    float _1276 = fma(_1236, _1208, _1214);
    float _1278 = _1180 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1280 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1230);
    float _1282 = -_1206;
    float _1284 = fma(_1236, _1210, _1282);
    float _1286 = _1266 * _1268;
    float _1288 = -_1210;
    float _1290 = fma(_1236, _1206, _1288);
    float _1292 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1244);
    float _1294 = _1278 * _1280;
    float _1296 = _1238;
    float _1298 = _1240;
    float _1300 = _1242;
    if (!_1272)
    {
        float _1302 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1238);
        _1296 = _1302;
    }
    float _1304 = _1296;
    float _1306 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    if (!_1272)
    {
        float _1308 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1240);
        _1298 = _1308;
    }
    float _1310 = _1298;
    float _1312 = -_1294;
    float _1314 = _1236 * _1312;
    if (!_1272)
    {
        float _1316 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1242);
        _1300 = _1316;
    }
    float _1318 = _1300;
    float _1320 = _1306 * _1292;
    float _1322 = _1256 * _1294;
    float _1324 = _1212 * _1294;
    float _1326 = -_1310;
    float _1328 = _1236 * _1326;
    float _1330 = _1256 * _1310;
    float _1332 = fma(_1274, _1286, _1322);
    float _1334 = _1212 * _1310;
    float _1336 = fma(_1216, _1286, _1314);
    float _1338 = fma(_1284, _1286, _1324);
    float _1340 = fma(_1290, _1320, _1332);
    float _1342 = fma(_1216, _1304, _1328);
    float _1344 = fma(_1274, _1304, _1330);
    float _1346 = fma(_1284, _1304, _1334);
    float _1348 = fma(_1258, _1320, _1336);
    float _1350 = fma(_1276, _1320, _1338);
    float _1352 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1354 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1356 = fma(_1276, _1318, _1346);
    float _1358 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1360 = fma(_1348, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1352);
    float _1362 = fma(_1348, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1354);
    float _1364 = _742 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1366 = fma(_1348, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1358);
    float _1368 = fma(_1350, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1360);
    float _1370 = fma(_1350, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1362);
    float _1372 = _738 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1374 = fma(_1258, _1318, _1342);
    float _1376 = fma(_1290, _1318, _1344);
    float _1378 = _1364 + _1370;
    float _1380 = fma(_1350, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1366);
    float _1382 = _744 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1384 = _1372 + _1368;
    float _1386 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1388 = _1376 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1390 = _1382 + _1380;
    float _1392 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1394 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1386);
    float _1396 = _1376 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1398 = _1376 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1400 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1402 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1392);
    float _1404 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1394);
    float _1406 = fma(_1374, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1388);
    float _1408 = fma(_1374, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1396);
    float _1410 = fma(_1374, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1398);
    float _1412 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1400);
    float _1414 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1416 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1402);
    float _1418 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1420 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1412);
    float _1422 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1414);
    float _1424 = _1416 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1426 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1428 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1430 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1432 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1434 = _1420 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1436 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1426);
    float _1438 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1422);
    float _1440 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1428);
    float _1442 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1430);
    float _1444 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1432);
    float _1446 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1436);
    float _1448 = _1438 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1450 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1440);
    float _1452 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1442);
    float _1454 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1444);
    float _1456 = fma(_1356, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1408);
    float _1458 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1446);
    float _1460 = fma(_1356, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1406);
    float _1462 = fma(_1356, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1410);
    float _1464 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1450);
    float _1466 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1452);
    float _1468 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1454);
    out.m_52.x = _1460;
    out.m_52.y = _1456;
    out.m_52.z = _1462;
    out.m_34.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_54.x = _1384;
    out.m_54.y = _1378;
    out.m_54.z = _1390;
    out.gl_Position.x = _1464;
    out.gl_Position.y = _1458;
    out.gl_Position.z = _1466;
    out.gl_Position.w = _1468;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

