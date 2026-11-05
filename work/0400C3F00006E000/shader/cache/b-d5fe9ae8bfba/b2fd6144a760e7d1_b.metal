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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
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
    float4 m_67 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_71 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _432 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _1880 = as_type<float>(_110);
        out.gl_Position.z = _1880;
    }
    if (!_98)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _114 = in.m_47.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = 0.0;
    float _132 = _128;
    if (_124)
    {
        float _134 = float(_94);
        _130 = _134;
    }
    float _136 = _130;
    bool _138 = _128 >= _136;
    bool _140 = !_124;
    bool _142 = _138 || _140;
    if (_142)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _104;
    if (_142)
    {
        out.m_45.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _112 = as_type<int>(_146);
    }
    int _148 = _112;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1949 = as_type<float>(_148);
        out.gl_Position.z = _1949;
    }
    if (_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_49.x;
    float _152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _154 = _128 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _156 = _128 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _158 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    int _172 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _174 = _172 != 0;
    float _176 = _154 * _152;
    float _178 = 1.4012984643248170709237295832899e-45;
    if (!_168)
    {
        float _180 = _158 * _158;
        float _182 = _180 * 0.5;
        _178 = _182;
    }
    float _184 = _178;
    float _186 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[20].x, _176);
    float _188 = _156 * _170;
    float _190 = _184;
    float _192 = _186;
    if (!_168)
    {
        float _194 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _194;
    }
    float _196 = _190;
    float _198 = in.m_47.x;
    float _200 = in.m_47.y;
    float _202 = in.m_47.z;
    float _204 = floor(_186);
    float _206 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[20].y, _188);
    float _208 = _186 * 6.283185482025146484375;
    float _210 = _208 * 0.15915493667125701904296875;
    float _212 = _206 * 6.283185482025146484375;
    float _214 = floor(_206);
    float _216 = _212 * 0.15915493667125701904296875;
    float _218 = _210 * 6.283185482025146484375;
    float _220 = cos(_218);
    float _222 = -_204;
    float _224 = _186 + _222;
    float _226 = _196;
    if (!_168)
    {
        _192 = _158;
    }
    float _228 = _192;
    float _230 = _216 * 6.283185482025146484375;
    float _232 = cos(_230);
    float _234 = -_214;
    float _236 = _206 + _234;
    bool _238 = !_168;
    float _240 = _228;
    if (!_238)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = _158 * _244;
        float _254 = 1.0 / _248;
        float _256 = _250 * 0.693147182464599609375;
        float _258 = exp2(_252);
        float _260 = 1.0 / _256;
        float _262 = _258 + (-1.0);
        float _264 = -_262;
        float _266 = fma(_264, _260, _158);
        float _268 = _266 * _254;
        float _270 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _226 = _270;
    }
    float _272 = _226;
    bool _274 = !_168;
    if (!_274)
    {
        float _276 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _278 = log2(_276);
        float _280 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _282 = _280 + 1.0;
        float _284 = 1.0 / _282;
        float _286 = _158 * _278;
        float _288 = exp2(_286);
        float _290 = -_288;
        float _292 = _290 + 1.0;
        float _294 = _292 * _284;
        _240 = _294;
    }
    float _296 = _240;
    float _298 = in.m_51.w;
    float _300 = -_224;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _304 = _224 < 0.5;
    float _306 = float(_304);
    float _308 = fma(_232, 0.5, 0.5);
    float _310 = fma(_220, 0.5, 0.5);
    bool _312 = _236 < 0.5;
    float _314 = float(_312);
    float _316 = -_306;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _322 = _320 != 0;
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _326 = _324 != 0;
    float _328 = -_236;
    float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _332 = -_310;
    float _334 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _336 = -_314;
    float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _340 = -_308;
    float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _344 = !_322;
    int _346 = _344 ? 0 : 1;
    float _348 = in.m_42.x;
    float _350 = in.m_42.y;
    float _352 = in.m_42.z;
    float _354 = _272 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _356 = _272 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _358 = !_174;
    int _360 = _358 ? 0 : 1;
    int _362 = abs(_346);
    float _364 = fma(_296, _198, _354);
    float _366 = fma(_296, _200, _356);
    int _368 = abs(_360);
    float _370 = _272 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _372 = !_326;
    int _374 = _372 ? 0 : 1;
    float _376 = fma(_296, _202, _370);
    int _378 = abs(_374);
    bool _380 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _382 = float(_362);
    float _384 = float(_368);
    float _386 = float(_378);
    float _388 = abs(_302);
    float _390 = _382 * _388;
    float _392 = abs(_330);
    float _394 = _382 * _392;
    float _396 = fma(_364, _298, _348);
    float _398 = fma(_366, _298, _350);
    float _400 = fma(_384, _334, _390);
    float _402 = fma(_384, _342, _394);
    float _404 = fma(_376, _298, _352);
    float _406 = abs(_318);
    float _408 = fma(_386, _406, _400);
    float _410 = abs(_338);
    float _412 = fma(_386, _410, _402);
    bool _414 = !_380;
    float _430;
    if (!_414)
    {
        float _416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _418 = _150 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _420 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _422 = _420 * _416;
        float _424 = floor(_422);
        float _426 = -_424;
        float _428 = _422 + _426;
        _430 = _428;
        _432 = true;
    }
    else
    {
        float _434 = float(_94);
        float _436 = 1.0 / _434;
        float _438 = _128 * _436;
        _430 = _438;
    }
    _432 = false;
    float _440 = _430;
    float _442 = in.m_49.y;
    float _444 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _446 = log2(_444);
    float _448 = _150 * 2.0;
    float _450 = in.m_49.z;
    float _452 = _150 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _456 = floor(_448);
    float _458 = -_454;
    float _460 = fma(_452, 2.0, _458);
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _466 = _464 != 0;
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _470 = _468 != 0;
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _474 = _472 != 0;
    float _476 = _446 * _128;
    bool _478 = !_470;
    int _480 = _478 ? 0 : 1;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _484 = exp2(_476);
    float _486 = _442 * 2.0;
    float _488 = _442 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _490 = _456 >= 0.0;
    bool _492 = isnan(_456);
    bool _494 = _490 || _492;
    bool _496 = isnan(0.0);
    bool _498 = _494 || _496;
    float _500 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[78].w, _482);
    float _502 = _442 + _450;
    float _504 = fma(_488, -2.0, _462);
    float _506 = _150 + _450;
    float _508 = floor(_486);
    float _510 = _502 + (-1.0);
    float _512 = _450 * 2.0;
    float _514 = _506 + (-1.0);
    float _516 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _518 = _456 > 0.0;
    float _520 = floor(_512);
    float _522 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _526 = 1.0 + _524;
    float _528 = -_484;
    float _530 = _528 + 1.0;
    int _532 = _498 ? 0 : 1;
    float _534 = 1.0 / _526;
    bool _536 = _508 >= 0.0;
    bool _538 = isnan(_508);
    bool _540 = _536 || _538;
    bool _542 = isnan(0.0);
    bool _544 = _540 || _542;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _548 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _550 = isnan(0.0);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _556 = _552 || _554;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _560 = _544 ? 0 : 1;
    bool _562 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _564 = isnan(1.0);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _570 = _566 || _568;
    float _572 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[78].z, _558);
    float _574 = _556 ? _530 : 0.0;
    bool _576 = _520 > 0.0;
    float _578 = in.m_53.x;
    float _580 = in.m_53.y;
    float _582 = in.m_53.z;
    bool _584 = _520 >= 0.0;
    bool _586 = isnan(_520);
    bool _588 = _584 || _586;
    bool _590 = isnan(0.0);
    bool _592 = _588 || _590;
    float _594 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[79].z, _546);
    bool _596 = _508 > 0.0;
    float _598 = -_128;
    float _600 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[76].x, _460);
    float _602 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _504);
    float _604 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[79].x, _594);
    float _606 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _572);
    float _608 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _500);
    if (_570)
    {
        float _610 = _574 * _534;
        _132 = _610;
    }
    float _612 = _132;
    int _614 = abs(_480);
    float _616 = in.m_55.x;
    float _618 = in.m_55.y;
    float _620 = in.m_55.z;
    int _622 = ~_532;
    int _624 = _622 + 1;
    int _626 = _624 + 1;
    float _628 = _450 + (-0.5);
    int _630 = _626;
    if (!_518)
    {
        int _632 = ~_532;
        int _634 = _632 + 1;
        _630 = _634;
    }
    int _636 = _630;
    int _638 = ~_560;
    int _640 = _638 + 1;
    int _642 = _640 + 1;
    int _644 = _642;
    if (!_596)
    {
        int _646 = ~_560;
        int _648 = _646 + 1;
        _644 = _648;
    }
    int _650 = _644;
    float _652 = float(_614);
    float _654 = float(_636);
    int _656 = _592 ? 0 : 1;
    bool _658 = !_474;
    int _660 = _658 ? 0 : 1;
    float _662 = _652 * _654;
    int _664 = ~_656;
    int _666 = _664 + 1;
    int _668 = _666 + 1;
    float _670 = _442 + (-0.5);
    bool _672 = !_466;
    int _674 = _672 ? 0 : 1;
    float _676 = _662 * (-2.0);
    int _678 = _668;
    if (!_576)
    {
        int _680 = ~_656;
        int _682 = _680 + 1;
        _678 = _682;
    }
    int _684 = _678;
    int _686 = abs(_660);
    float _688 = fma(_516, _676, _516);
    int _690 = abs(_674);
    float _692 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.0500000007450580596923828125, _582);
    float _694 = float(_686);
    float _696 = fma(_676, _618, _618);
    float _698 = float(_650);
    float _700 = _692 * 5.0;
    float _702 = float(_690);
    float _704 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[196].y, _696);
    float _706 = float(_684);
    float _708 = _694 * _698;
    float _710 = _700 * 0.15915493667125701904296875;
    float _712 = fma(_688, _612, _704);
    float _714 = _708 * (-2.0);
    float _716 = _702 * _706;
    float _718 = in.m_51.x;
    float _720 = in.m_51.y;
    float _722 = in.m_51.z;
    float _724 = _712 * 0.15915493667125701904296875;
    float _726 = _150 + _442;
    float _728 = fma(_714, _620, _620);
    float _730 = _716 * (-2.0);
    float _732 = fma(_522, _714, _522);
    float _734 = _726 + (-1.0);
    float _736 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[196].z, _728);
    float _738 = fma(_730, _616, _616);
    float _740 = in.m_57.w;
    float _742 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _744 = _150 + (-0.5);
    float _746 = _710 * 6.283185482025146484375;
    float _748 = sin(_746);
    float _750 = fma(_732, _612, _736);
    float _752 = fma(_742, _730, _742);
    float _754 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[196].x, _738);
    float _756 = fma(_752, _612, _754);
    float _758 = _724 * 6.283185482025146484375;
    float _760 = sin(_758);
    float _762 = _750 * 0.15915493667125701904296875;
    float _764 = _756 * 0.15915493667125701904296875;
    float _766 = _718 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _768 = _722 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _770 = -(*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _772 = _770 + 1.0;
    float _774 = precise::clamp(_772, 0.0, 1.0);
    float _776 = _724 * 6.283185482025146484375;
    float _778 = cos(_776);
    float _780 = _748 * 0.0199999995529651641845703125;
    float _782 = _720 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _784 = fma(_774, 0.875, 0.125);
    float _786 = _408 * _766;
    float _788 = _780 * _740;
    float _790 = _412 * _782;
    float _792 = _784 * _580;
    float _794 = _762 * 6.283185482025146484375;
    float _796 = cos(_794);
    float _798 = _788 + _578;
    float _800 = _790 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _792);
    float _804 = _786 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _806 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _798);
    float _808 = _788 + _582;
    float _810 = _800 * _802;
    float _812 = _762 * 6.283185482025146484375;
    float _814 = sin(_812);
    float _816 = _804 * _806;
    float _818 = _768 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _820 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _808);
    float _822 = _818 * _820;
    float _824 = _764 * 6.283185482025146484375;
    float _826 = cos(_824);
    float _828 = _778 * _796;
    float _830 = _760 * _796;
    float _832 = _764 * 6.283185482025146484375;
    float _834 = sin(_832);
    float _836 = _778 * _814;
    float _838 = _760 * _814;
    float _840 = _826 * _796;
    float _842 = _826 * _814;
    float _844 = _826 * _760;
    float _846 = _826 * _778;
    float _848 = _840 * _810;
    float _850 = -_836;
    float _852 = fma(_834, _830, _850);
    float _854 = fma(_834, _838, _828);
    float _856 = fma(_834, _828, _838);
    float _858 = fma(_842, _816, _848);
    float _860 = _852 * _810;
    float _862 = -_830;
    float _864 = fma(_834, _836, _862);
    float _866 = _856 * _810;
    float _868 = _398 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _870 = fma(_854, _816, _860);
    float _872 = -_834;
    float _874 = fma(_872, _822, _858);
    float _876 = fma(_864, _816, _866);
    float _878 = _398 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _880 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[6].x, _868);
    float _882 = fma(_844, _822, _870);
    float _884 = _874 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _886 = fma(_846, _822, _876);
    float _888 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[4].x, _878);
    float _890 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[6].z, _880);
    float _892 = _874 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _894 = fma(_882, (*spvDescriptorSet0.vp_c10)._m0[10].x, _884);
    float _896 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[4].z, _888);
    float _898 = _890 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _900 = fma(_882, (*spvDescriptorSet0.vp_c10)._m0[8].x, _892);
    float _902 = fma(_886, (*spvDescriptorSet0.vp_c10)._m0[10].z, _894);
    float _904 = _896 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _906 = fma(_886, (*spvDescriptorSet0.vp_c10)._m0[8].z, _900);
    float _908 = _898 + _902;
    float _910 = _904 + _906;
    float _912 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _914 = _908 + _912;
    float _916 = _398 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _918 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _920 = _910 + _918;
    float _922 = _914 * _914;
    float _924 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[5].x, _916);
    float _926 = fma(_920, _920, _922);
    float _928 = _874 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _930 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[5].z, _924);
    float _932 = sqrt(_926);
    float _934 = fma(_882, (*spvDescriptorSet0.vp_c10)._m0[9].x, _928);
    float _936 = _930 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _938 = fma(_886, (*spvDescriptorSet0.vp_c10)._m0[9].z, _934);
    float _940 = _936 + _938;
    bool _942 = _932 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _944 = _938;
    float _946 = _908;
    float _948 = _910;
    float _950 = _920;
    float _952 = _886;
    if (!_942)
    {
        _944 = _908;
    }
    float _954 = _944;
    float _956 = _954;
    if (!_942)
    {
        _946 = _940;
    }
    float _958 = _946;
    bool _960 = !_942;
    float _962 = _958;
    if (!_960)
    {
        float _964 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _966 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _968 = _932 + _966;
        float _970 = _940 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _972 = rsqrt(_926);
        float _974 = _968 * _964;
        float _976 = _974 * 0.15915493667125701904296875;
        float _978 = _976 * 6.283185482025146484375;
        float _980 = cos(_978);
        float _982 = _976 * 6.283185482025146484375;
        float _984 = sin(_982);
        float _986 = _980 + (-1.0);
        float _988 = fma(_984, _970, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _990 = _986 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _992 = _972 * _988;
        float _994 = fma(_940, _980, _990);
        float _996 = fma(_920, _992, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _998 = fma(_914, _992, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _962 = _994;
        _948 = _996;
        _956 = _998;
    }
    float _1000 = _962;
    float _1002 = _948;
    float _1004 = _956;
    float _1006 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1008 = _1000 + _1006;
    float _1010 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1012 = _1002 + _1010;
    float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1016 = _1004 + _1014;
    float _1018 = _1008 * _1008;
    float _1020 = fma(_1012, _1012, _1018);
    float _1022 = fma(_1016, _1016, _1020);
    float _1024 = rsqrt(_1022);
    float _1026 = sqrt(_1022);
    float _1028 = _1024 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1030 = _1012 * _1028;
    float _1032 = _1016 * _1028;
    float _1034 = _1030 * _1030;
    float _1036 = _1032 * _1032;
    float _1038 = _1034 + _1036;
    float _1040 = sqrt(_1038);
    bool _1042 = _1040 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1046 = _1040 + _1044;
    float _1048 = _1016;
    float _1050 = _1038;
    float _1052 = _1046;
    float _1054 = _1008;
    if (_1042)
    {
        float _1056 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1048 = _1056;
    }
    float _1058 = _1048;
    if (_1042)
    {
        float _1060 = rsqrt(_1038);
        _1050 = _1060;
    }
    float _1062 = _1050;
    float _1064 = _1062;
    if (_1042)
    {
        float _1066 = _1046 * _1058;
        _1052 = _1066;
    }
    float _1068 = _1052;
    if (_1042)
    {
        float _1070 = _1068 * 0.15915493667125701904296875;
        _950 = _1070;
    }
    float _1072 = _950;
    float _1074 = _1058;
    float _1076 = _1072;
    if (_1042)
    {
        float _1078 = _1072 * 6.283185482025146484375;
        float _1080 = sin(_1078);
        _1074 = _1080;
    }
    float _1082 = _1074;
    float _1084 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1086 = precise::max(0.0, _1084);
    float _1088 = _1024;
    float _1090 = _1086;
    if (_1042)
    {
        float _1092 = _1072 * 6.283185482025146484375;
        float _1094 = cos(_1092);
        _1088 = _1094;
    }
    float _1096 = _1088;
    float _1098 = -_1028;
    float _1100 = -_1086;
    float _1102 = fma(_1008, _1098, _1100);
    if (_1042)
    {
        float _1104 = _1102 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1090 = _1104;
    }
    float _1106 = _1090;
    float _1108 = _1106;
    float _1110 = _1082;
    if (_1042)
    {
        float _1112 = fma(_1082, _1106, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1108 = _1112;
    }
    float _1114 = _1108;
    float _1116 = _1114;
    if (!_1042)
    {
        _1110 = _1030;
    }
    float _1118 = _1110;
    float _1120 = _1118;
    float _1122 = _1096;
    if (_1042)
    {
        float _1124 = _1096 + (-1.0);
        _1054 = _1124;
    }
    float _1126 = _1054;
    float _1128 = _1126;
    if (_1042)
    {
        float _1130 = _1062 * _1114;
        _952 = _1130;
    }
    float _1132 = _952;
    if (!_1042)
    {
        _1116 = _1102;
    }
    float _1134 = _1116;
    float _1136 = _1134;
    if (_1042)
    {
        float _1138 = _1126 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1076 = _1138;
    }
    float _1140 = _1076;
    if (_1042)
    {
        float _1142 = _1030 * _1132;
        _1120 = _1142;
    }
    float _1144 = _1120;
    if (!_1042)
    {
        _1128 = _1032;
    }
    float _1146 = _1128;
    float _1148 = _1146;
    if (_1042)
    {
        float _1150 = _1032 * _1132;
        _1148 = _1150;
    }
    float _1152 = _1148;
    if (!_1042)
    {
        _1064 = _1034;
    }
    float _1154 = _1064;
    float _1156 = _1154;
    if (_1042)
    {
        float _1158 = fma(_1102, _1096, _1140);
        _1136 = _1158;
    }
    float _1160 = _1136;
    if (_1042)
    {
        float _1162 = _1144 * _1144;
        _1156 = _1162;
    }
    float _1164 = _1156;
    if (!_1042)
    {
        _1122 = _1036;
    }
    float _1166 = _1122;
    float _1168 = _1166;
    if (_1042)
    {
        float _1170 = _1152 * _1152;
        _1168 = _1170;
    }
    float _1172 = _1168;
    float _1174 = fma(_1160, _1160, _1164);
    float _1176 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1178 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1180 = _1174 + _1172;
    float _1182 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1176);
    float _1184 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1186 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1188 = fma(_1026, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1186);
    float _1190 = precise::clamp(_1188, 0.0, 1.0);
    float _1192 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1194 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1182);
    float _1196 = rsqrt(_1180);
    float _1198 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1200 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1184);
    float _1202 = -_1190;
    float _1204 = _1202 + 1.0;
    float _1206 = _1194 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1208 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1198);
    float _1210 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1200);
    float _1212 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1192);
    float _1214 = abs(_1204);
    float _1216 = log2(_1214);
    float _1218 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1208);
    float _1220 = _1210 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1222 = _1206 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1224 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1212);
    float _1226 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1228 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1230 = -_1222;
    float _1232 = fma(_1230, _1178, 1.0);
    float _1234 = _1196 * _1144;
    float _1236 = _1196 * _1160;
    float _1238 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1228);
    float _1240 = _1196 * _1152;
    float _1242 = _1234 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1244 = _1224 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1246 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1238);
    float _1248 = log2(_1232);
    float _1250 = -_1242;
    float _1252 = fma(_1236, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1250);
    float _1254 = _1216 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1256 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1246);
    float _1258 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1260 = -_1240;
    float _1262 = fma(_1260, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1252);
    float _1264 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1266 = _1236 + 1.0;
    float _1268 = exp2(_1254);
    float _1270 = fma(_1262, -0.5, 0.5);
    float _1272 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1264);
    float _1274 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1258);
    float _1276 = fma(_1262, 0.5, 0.5);
    float _1278 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1272);
    float _1280 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1274);
    float _1282 = 1.0 / _1256;
    float _1284 = fma(_1276, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1286 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1278);
    float _1288 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1280);
    float _1290 = _1248 * 0.693147182464599609375;
    float _1292 = fma(_1276, _1284, -0.212114393711090087890625);
    float _1294 = sqrt(_1270);
    float _1296 = -_1236;
    float _1298 = fma(_1268, _1266, _1296);
    float _1300 = _1290 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1302 = fma(_1276, _1292, 1.570728778839111328125);
    float _1304 = fma(_1298, 0.5, 0.5);
    float _1306 = _1286 * _1282;
    float _1308 = _1288 * _1282;
    float _1310 = fma(_1306, 0.5, 0.5);
    float _1312 = _1294 * 0.636619746685028076171875;
    float _1314 = fma(_1308, -0.5, 0.5);
    float _1316 = -_1302;
    float _1318 = fma(_1312, _1316, 1.0);
    float3 _3756 = float3(_1310, _1314, _1300);
    float _1320 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3756, float3(0.0), isnan(_3756)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3756, float3(0.0), isnan(_3756)), level(0.0)).x;
    float3 _3767 = float3(_1310, _1314, _1300);
    float4 _1323 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3767, float3(0.0), isnan(_3767)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3767, float3(0.0), isnan(_3767)), level(0.0)).xyzw;
    float _1325 = _1323.x;
    float _1327 = _1323.y;
    float _1329 = _1323.z;
    float _1331 = _1323.w;
    float2 _3784 = float2(_1318, _1304);
    float3 _1335 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3784, float2(0.0), isnan(_3784)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3784, float2(0.0), isnan(_3784)), level(0.0)).xyz;
    float _1337 = _1335.x;
    float _1339 = _1335.y;
    float _1341 = _1335.z;
    float _1343 = in.m_59.y;
    float _1345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1347 = in.m_59.x;
    bool _1349 = _442 > 0.5;
    float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1353 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1351;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1359 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _1361 = _1359 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _1363 = 1.0 / _1353;
    float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1367 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _1365;
    int _1369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1371 = _1369 != 0;
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1375 = _440 + _1373;
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1379 = _1377 != 0;
    out.m_45.x = 1.0;
    float _1381 = _604 * (-0.15915493667125701904296875);
    float _1383 = 1.0 / _1357;
    bool _1385 = _150 > 0.5;
    bool _1387 = _1385 && _1379;
    float _1389 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1391 = _440 + _1389;
    float _1393 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1397 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1395;
    float _1399 = -_1343;
    float _1401 = _1399 + 1.0;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1407 = 1.0 / _1361;
    float _1409 = _1391 * _1363;
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1411;
    float _1415 = _1343;
    if (_1371)
    {
        float _1417 = _1349 ? _1401 : _1343;
        _1415 = _1417;
    }
    float _1419 = _1415;
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1423 = _440 + _1421;
    bool _1425 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1427 = isnan(_440);
    bool _1429 = _1425 || _1427;
    bool _1431 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1433 = _1429 || _1431;
    float _1435 = float(_1433);
    float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1439 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1437;
    float _1441 = 1.0 / _1367;
    float _1443 = _1375 * _1383;
    float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _1447 = _440 + _1445;
    float _1449 = fma(_1393, _1419, -0.5);
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1453 = _1451 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1457 = _1455 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    bool _1459 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _1461 = isnan(_440);
    bool _1463 = _1459 || _1461;
    bool _1465 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _1467 = _1463 || _1465;
    float _1469 = float(_1467);
    float _1471 = fma(_1413, _1409, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1473 = _1447 * _1407;
    bool _1475 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _1477 = isnan(_440);
    bool _1479 = _1475 || _1477;
    bool _1481 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _1483 = _1479 || _1481;
    float _1485 = float(_1483);
    float _1487 = fma(_1453, _1443, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1491 = fma(_1439, _1409, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1493 = fma(_1397, _1409, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1495 = _1423 * _1441;
    float _1497 = fma(_1457, _1443, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1499 = -_1469;
    float _1501 = _1499 + 1.0;
    float _1503 = fma(_1405, _1443, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1505 = -_1485;
    float _1507 = _1505 + 1.0;
    bool _1509 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1511 = isnan(_440);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1517 = _1513 || _1515;
    float _1519 = float(_1517);
    float _1521 = _1485 * _1501;
    float _1523 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1525 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _1523;
    float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1529 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _1527;
    float _1531 = _1435 * _1507;
    float _1533 = -_1435;
    float _1535 = _1533 + 1.0;
    float _1537 = _1381 * 6.283185482025146484375;
    float _1539 = sin(_1537);
    float _1541 = fma(_1525, _1495, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _1543 = fma(_1529, _1495, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _1545 = _1519 * _1535;
    float _1547 = _1535;
    float _1549 = _1347;
    if (!_1379)
    {
        _1547 = _1347;
    }
    float _1551 = _1547;
    float _1553 = _1551;
    if (_1387)
    {
        float _1555 = -_1347;
        float _1557 = _1555 + 1.0;
        _1549 = _1557;
    }
    float _1559 = _1549;
    bool _1561 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1563 = isnan(_440);
    bool _1565 = _1561 || _1563;
    bool _1567 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1569 = _1565 || _1567;
    float _1571 = float(_1569);
    float _1573 = -_1519;
    float _1575 = _1573 + 1.0;
    float _1577 = _1381 * 6.283185482025146484375;
    float _1579 = cos(_1577);
    float _1581 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1379)
    {
        _1553 = _1559;
    }
    float _1583 = _1553;
    float _1585 = _1571 * _1575;
    float _1587 = -_1571;
    float _1589 = _1587 + 1.0;
    bool _1591 = _792 != 0.0;
    bool _1593 = isnan(_792);
    bool _1595 = _1591 || _1593;
    bool _1597 = isnan(0.0);
    bool _1599 = _1595 || _1597;
    float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _1603 = _1601 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _1605 = _1491 * _1585;
    float _1607 = fma(_1581, _1583, -0.5);
    float _1609 = _1539 * _1449;
    float _1611 = _1471 * _1585;
    float _1613 = _1493 * _1585;
    float _1615 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1605);
    float _1617 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1611);
    float _1619 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1613);
    float _1621 = _1579 * _1449;
    float _1623 = -_1609;
    float _1625 = fma(_1579, _1607, _1623);
    float _1627 = fma(_1497, _1545, _1615);
    float _1629 = -_578;
    bool _1631 = _788 == _1629;
    bool _1633 = !_1599;
    bool _1635 = _1631 && _1633;
    float _1637 = fma(_1539, _1607, _1621);
    float _1639 = fma(_606, _1625, _600);
    float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1643 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _1641;
    float _1645 = in.m_61.x;
    float _1647 = in.m_61.y;
    float _1649 = in.m_61.z;
    float _1651 = -_582;
    bool _1653 = _788 == _1651;
    bool _1655 = _1653 && _1635;
    float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _1659 = _1657 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _1661 = fma(_1643, _1495, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _1663 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _1665 = _1663 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1667 = fma(_1487, _1545, _1617);
    float _1669 = fma(_1503, _1545, _1619);
    float _1671 = -_602;
    float _1673 = fma(_608, _1637, _1671);
    float _1675 = fma(_1603, _1473, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _1677 = fma(_1659, _1473, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1681 = _1216 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1683 = fma(_1665, _1473, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _1685 = fma(_1541, _1531, _1667);
    float _1687 = fma(_1543, _1531, _1627);
    float _1689 = fma(_1661, _1531, _1669);
    float _1691 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1693 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1695 = fma(_1675, _1521, _1685);
    float _1697 = fma(_1677, _1521, _1687);
    float _1699 = fma(_1683, _1521, _1689);
    float _1701 = _1647;
    float _1703 = _1645;
    float _1705 = _1649;
    if (!_1655)
    {
        float _1707 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1647);
        _1701 = _1707;
    }
    float _1709 = _1701;
    float _1711 = exp2(_1681);
    float _1713 = _1679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1715 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1717 = _1693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1719 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[111].x, _1695);
    float _1721 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[111].y, _1697);
    float _1723 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[111].z, _1699);
    if (!_1655)
    {
        float _1725 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1645);
        _1703 = _1725;
    }
    float _1727 = _1703;
    float _1729 = _840 * _1709;
    out.m_63.x = _1713;
    out.m_63.y = _1715;
    out.m_63.z = _1717;
    float _1731 = _1719 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1733 = _852 * _1709;
    float _1735 = _856 * _1709;
    float _1737 = fma(_842, _1727, _1729);
    if (!_1655)
    {
        float _1739 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1649);
        _1705 = _1739;
    }
    float _1741 = _1705;
    float _1743 = fma(_854, _1727, _1733);
    float _1745 = fma(_864, _1727, _1735);
    float _1747 = _1639 + 0.5;
    float _1749 = _1673 + 0.5;
    float _1751 = -_834;
    float _1753 = fma(_1751, _1741, _1737);
    float _1755 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1757 = _1721 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1759 = _1723 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1761 = _1731 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1763 = fma(_844, _1741, _1743);
    float _1765 = _1757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1767 = _1759 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1769 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1755);
    float _1771 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1773 = -_1711;
    float _1775 = _1773 + 1.0;
    out.m_65.x = _1747;
    out.m_65.y = _1749;
    float _1777 = fma(_846, _1741, _1745);
    float _1779 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1769);
    float _1781 = fma(_1763, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1771);
    out.m_67.x = _1761;
    out.m_67.y = _1765;
    out.m_67.z = _1767;
    float _1783 = _1775 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1785 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1779);
    float _1787 = fma(_1777, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1781);
    float _1789 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.gl_Position.x = _1286;
    out.gl_Position.y = _1288;
    out.gl_Position.z = _1785;
    out.gl_Position.w = _1256;
    float _1791 = fma(_1763, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1789);
    float _1793 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1795 = _1785 + _1256;
    float _1797 = fma(_1763, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1793);
    float _1799 = _1795 * 0.5;
    float _1801 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1803 = fma(_1777, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1797);
    float _1805 = fma(_1777, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1791);
    out.m_69.w = _1801;
    out.m_71.x = _1787;
    out.m_71.y = _1803;
    out.m_71.z = _1805;
    out.m_73.z = _1799;
    out.m_73.w = _1256;
    float _1807 = _1783 * _1320;
    float _1809 = -_1783;
    float _1811 = _1809 + 1.0;
    float _1813 = _1331 * _1807;
    float _1815 = _1341 * _1807;
    float _1817 = _1331 * _1811;
    float _1819 = fma(_1337, _1813, _1325);
    float _1821 = fma(_1339, _1813, _1327);
    float _1823 = fma(_1331, _1815, _1329);
    out.m_75.x = _1819;
    out.m_75.y = _1821;
    out.m_75.z = _1823;
    out.m_75.w = _1817;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _432 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _1880 = as_type<float>(_110);
        out.gl_Position.z = _1880;
    }
    if (!_98)
    {
        return out;
    }
    float _114 = in.m_47.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = 0.0;
    float _132 = _128;
    if (_124)
    {
        float _134 = float(_94);
        _130 = _134;
    }
    float _136 = _130;
    bool _138 = _128 >= _136;
    bool _140 = !_124;
    bool _142 = _138 || _140;
    if (_142)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _104;
    if (_142)
    {
        out.m_45.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _112 = as_type<int>(_146);
    }
    int _148 = _112;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1949 = as_type<float>(_148);
        out.gl_Position.z = _1949;
    }
    if (_142)
    {
        return out;
    }
    float _150 = in.m_49.x;
    float _152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _154 = _128 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _156 = _128 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _158 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    int _172 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _174 = _172 != 0;
    float _176 = _154 * _152;
    float _178 = 1.4012984643248170709237295832899e-45;
    if (!_168)
    {
        float _180 = _158 * _158;
        float _182 = _180 * 0.5;
        _178 = _182;
    }
    float _184 = _178;
    float _186 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[20].x, _176);
    float _188 = _156 * _170;
    float _190 = _184;
    float _192 = _186;
    if (!_168)
    {
        float _194 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _194;
    }
    float _196 = _190;
    float _198 = in.m_47.x;
    float _200 = in.m_47.y;
    float _202 = in.m_47.z;
    float _204 = floor(_186);
    float _206 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[20].y, _188);
    float _208 = _186 * 6.283185482025146484375;
    float _210 = _208 * 0.15915493667125701904296875;
    float _212 = _206 * 6.283185482025146484375;
    float _214 = floor(_206);
    float _216 = _212 * 0.15915493667125701904296875;
    float _218 = _210 * 6.283185482025146484375;
    float _220 = cos(_218);
    float _222 = -_204;
    float _224 = _186 + _222;
    float _226 = _196;
    if (!_168)
    {
        _192 = _158;
    }
    float _228 = _192;
    float _230 = _216 * 6.283185482025146484375;
    float _232 = cos(_230);
    float _234 = -_214;
    float _236 = _206 + _234;
    bool _238 = !_168;
    float _240 = _228;
    if (!_238)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = _158 * _244;
        float _254 = 1.0 / _248;
        float _256 = _250 * 0.693147182464599609375;
        float _258 = exp2(_252);
        float _260 = 1.0 / _256;
        float _262 = _258 + (-1.0);
        float _264 = -_262;
        float _266 = fma(_264, _260, _158);
        float _268 = _266 * _254;
        float _270 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _226 = _270;
    }
    float _272 = _226;
    bool _274 = !_168;
    if (!_274)
    {
        float _276 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _278 = log2(_276);
        float _280 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _282 = _280 + 1.0;
        float _284 = 1.0 / _282;
        float _286 = _158 * _278;
        float _288 = exp2(_286);
        float _290 = -_288;
        float _292 = _290 + 1.0;
        float _294 = _292 * _284;
        _240 = _294;
    }
    float _296 = _240;
    float _298 = in.m_51.w;
    float _300 = -_224;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _304 = _224 < 0.5;
    float _306 = float(_304);
    float _308 = fma(_232, 0.5, 0.5);
    float _310 = fma(_220, 0.5, 0.5);
    bool _312 = _236 < 0.5;
    float _314 = float(_312);
    float _316 = -_306;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _322 = _320 != 0;
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _326 = _324 != 0;
    float _328 = -_236;
    float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _332 = -_310;
    float _334 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _336 = -_314;
    float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _340 = -_308;
    float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _344 = !_322;
    int _346 = _344 ? 0 : 1;
    float _348 = in.m_42.x;
    float _350 = in.m_42.y;
    float _352 = in.m_42.z;
    float _354 = _272 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _356 = _272 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _358 = !_174;
    int _360 = _358 ? 0 : 1;
    int _362 = abs(_346);
    float _364 = fma(_296, _198, _354);
    float _366 = fma(_296, _200, _356);
    int _368 = abs(_360);
    float _370 = _272 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _372 = !_326;
    int _374 = _372 ? 0 : 1;
    float _376 = fma(_296, _202, _370);
    int _378 = abs(_374);
    bool _380 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _382 = float(_362);
    float _384 = float(_368);
    float _386 = float(_378);
    float _388 = abs(_302);
    float _390 = _382 * _388;
    float _392 = abs(_330);
    float _394 = _382 * _392;
    float _396 = fma(_364, _298, _348);
    float _398 = fma(_366, _298, _350);
    float _400 = fma(_384, _334, _390);
    float _402 = fma(_384, _342, _394);
    float _404 = fma(_376, _298, _352);
    float _406 = abs(_318);
    float _408 = fma(_386, _406, _400);
    float _410 = abs(_338);
    float _412 = fma(_386, _410, _402);
    bool _414 = !_380;
    float _430;
    if (!_414)
    {
        float _416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _418 = _150 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _420 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _422 = _420 * _416;
        float _424 = floor(_422);
        float _426 = -_424;
        float _428 = _422 + _426;
        _430 = _428;
        _432 = true;
    }
    else
    {
        float _434 = float(_94);
        float _436 = 1.0 / _434;
        float _438 = _128 * _436;
        _430 = _438;
    }
    _432 = false;
    float _440 = _430;
    float _442 = in.m_49.y;
    float _444 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _446 = log2(_444);
    float _448 = _150 * 2.0;
    float _450 = in.m_49.z;
    float _452 = _150 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _456 = floor(_448);
    float _458 = -_454;
    float _460 = fma(_452, 2.0, _458);
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _466 = _464 != 0;
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _470 = _468 != 0;
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _474 = _472 != 0;
    float _476 = _446 * _128;
    bool _478 = !_470;
    int _480 = _478 ? 0 : 1;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _484 = exp2(_476);
    float _486 = _442 * 2.0;
    float _488 = _442 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _490 = _456 >= 0.0;
    bool _492 = isnan(_456);
    bool _494 = _490 || _492;
    bool _496 = isnan(0.0);
    bool _498 = _494 || _496;
    float _500 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[78].w, _482);
    float _502 = _442 + _450;
    float _504 = fma(_488, -2.0, _462);
    float _506 = _150 + _450;
    float _508 = floor(_486);
    float _510 = _502 + (-1.0);
    float _512 = _450 * 2.0;
    float _514 = _506 + (-1.0);
    float _516 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _518 = _456 > 0.0;
    float _520 = floor(_512);
    float _522 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _526 = 1.0 + _524;
    float _528 = -_484;
    float _530 = _528 + 1.0;
    int _532 = _498 ? 0 : 1;
    float _534 = 1.0 / _526;
    bool _536 = _508 >= 0.0;
    bool _538 = isnan(_508);
    bool _540 = _536 || _538;
    bool _542 = isnan(0.0);
    bool _544 = _540 || _542;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _548 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _550 = isnan(0.0);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _556 = _552 || _554;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _560 = _544 ? 0 : 1;
    bool _562 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _564 = isnan(1.0);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _570 = _566 || _568;
    float _572 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[78].z, _558);
    float _574 = _556 ? _530 : 0.0;
    bool _576 = _520 > 0.0;
    float _578 = in.m_53.x;
    float _580 = in.m_53.y;
    float _582 = in.m_53.z;
    bool _584 = _520 >= 0.0;
    bool _586 = isnan(_520);
    bool _588 = _584 || _586;
    bool _590 = isnan(0.0);
    bool _592 = _588 || _590;
    float _594 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[79].z, _546);
    bool _596 = _508 > 0.0;
    float _598 = -_128;
    float _600 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[76].x, _460);
    float _602 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _504);
    float _604 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[79].x, _594);
    float _606 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _572);
    float _608 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _500);
    if (_570)
    {
        float _610 = _574 * _534;
        _132 = _610;
    }
    float _612 = _132;
    int _614 = abs(_480);
    float _616 = in.m_55.x;
    float _618 = in.m_55.y;
    float _620 = in.m_55.z;
    int _622 = ~_532;
    int _624 = _622 + 1;
    int _626 = _624 + 1;
    float _628 = _450 + (-0.5);
    int _630 = _626;
    if (!_518)
    {
        int _632 = ~_532;
        int _634 = _632 + 1;
        _630 = _634;
    }
    int _636 = _630;
    int _638 = ~_560;
    int _640 = _638 + 1;
    int _642 = _640 + 1;
    int _644 = _642;
    if (!_596)
    {
        int _646 = ~_560;
        int _648 = _646 + 1;
        _644 = _648;
    }
    int _650 = _644;
    float _652 = float(_614);
    float _654 = float(_636);
    int _656 = _592 ? 0 : 1;
    bool _658 = !_474;
    int _660 = _658 ? 0 : 1;
    float _662 = _652 * _654;
    int _664 = ~_656;
    int _666 = _664 + 1;
    int _668 = _666 + 1;
    float _670 = _442 + (-0.5);
    bool _672 = !_466;
    int _674 = _672 ? 0 : 1;
    float _676 = _662 * (-2.0);
    int _678 = _668;
    if (!_576)
    {
        int _680 = ~_656;
        int _682 = _680 + 1;
        _678 = _682;
    }
    int _684 = _678;
    int _686 = abs(_660);
    float _688 = fma(_516, _676, _516);
    int _690 = abs(_674);
    float _692 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.0500000007450580596923828125, _582);
    float _694 = float(_686);
    float _696 = fma(_676, _618, _618);
    float _698 = float(_650);
    float _700 = _692 * 5.0;
    float _702 = float(_690);
    float _704 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[196].y, _696);
    float _706 = float(_684);
    float _708 = _694 * _698;
    float _710 = _700 * 0.15915493667125701904296875;
    float _712 = fma(_688, _612, _704);
    float _714 = _708 * (-2.0);
    float _716 = _702 * _706;
    float _718 = in.m_51.x;
    float _720 = in.m_51.y;
    float _722 = in.m_51.z;
    float _724 = _712 * 0.15915493667125701904296875;
    float _726 = _150 + _442;
    float _728 = fma(_714, _620, _620);
    float _730 = _716 * (-2.0);
    float _732 = fma(_522, _714, _522);
    float _734 = _726 + (-1.0);
    float _736 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[196].z, _728);
    float _738 = fma(_730, _616, _616);
    float _740 = in.m_57.w;
    float _742 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _744 = _150 + (-0.5);
    float _746 = _710 * 6.283185482025146484375;
    float _748 = sin(_746);
    float _750 = fma(_732, _612, _736);
    float _752 = fma(_742, _730, _742);
    float _754 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[196].x, _738);
    float _756 = fma(_752, _612, _754);
    float _758 = _724 * 6.283185482025146484375;
    float _760 = sin(_758);
    float _762 = _750 * 0.15915493667125701904296875;
    float _764 = _756 * 0.15915493667125701904296875;
    float _766 = _718 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _768 = _722 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _770 = -(*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _772 = _770 + 1.0;
    float _774 = precise::clamp(_772, 0.0, 1.0);
    float _776 = _724 * 6.283185482025146484375;
    float _778 = cos(_776);
    float _780 = _748 * 0.0199999995529651641845703125;
    float _782 = _720 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _784 = fma(_774, 0.875, 0.125);
    float _786 = _408 * _766;
    float _788 = _780 * _740;
    float _790 = _412 * _782;
    float _792 = _784 * _580;
    float _794 = _762 * 6.283185482025146484375;
    float _796 = cos(_794);
    float _798 = _788 + _578;
    float _800 = _790 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _792);
    float _804 = _786 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _806 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _798);
    float _808 = _788 + _582;
    float _810 = _800 * _802;
    float _812 = _762 * 6.283185482025146484375;
    float _814 = sin(_812);
    float _816 = _804 * _806;
    float _818 = _768 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _820 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _808);
    float _822 = _818 * _820;
    float _824 = _764 * 6.283185482025146484375;
    float _826 = cos(_824);
    float _828 = _778 * _796;
    float _830 = _760 * _796;
    float _832 = _764 * 6.283185482025146484375;
    float _834 = sin(_832);
    float _836 = _778 * _814;
    float _838 = _760 * _814;
    float _840 = _826 * _796;
    float _842 = _826 * _814;
    float _844 = _826 * _760;
    float _846 = _826 * _778;
    float _848 = _840 * _810;
    float _850 = -_836;
    float _852 = fma(_834, _830, _850);
    float _854 = fma(_834, _838, _828);
    float _856 = fma(_834, _828, _838);
    float _858 = fma(_842, _816, _848);
    float _860 = _852 * _810;
    float _862 = -_830;
    float _864 = fma(_834, _836, _862);
    float _866 = _856 * _810;
    float _868 = _398 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _870 = fma(_854, _816, _860);
    float _872 = -_834;
    float _874 = fma(_872, _822, _858);
    float _876 = fma(_864, _816, _866);
    float _878 = _398 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _880 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[6].x, _868);
    float _882 = fma(_844, _822, _870);
    float _884 = _874 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _886 = fma(_846, _822, _876);
    float _888 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[4].x, _878);
    float _890 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[6].z, _880);
    float _892 = _874 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _894 = fma(_882, (*spvDescriptorSet0.vp_c10)._m0[10].x, _884);
    float _896 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[4].z, _888);
    float _898 = _890 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _900 = fma(_882, (*spvDescriptorSet0.vp_c10)._m0[8].x, _892);
    float _902 = fma(_886, (*spvDescriptorSet0.vp_c10)._m0[10].z, _894);
    float _904 = _896 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _906 = fma(_886, (*spvDescriptorSet0.vp_c10)._m0[8].z, _900);
    float _908 = _898 + _902;
    float _910 = _904 + _906;
    float _912 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _914 = _908 + _912;
    float _916 = _398 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _918 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _920 = _910 + _918;
    float _922 = _914 * _914;
    float _924 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[5].x, _916);
    float _926 = fma(_920, _920, _922);
    float _928 = _874 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _930 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[5].z, _924);
    float _932 = sqrt(_926);
    float _934 = fma(_882, (*spvDescriptorSet0.vp_c10)._m0[9].x, _928);
    float _936 = _930 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _938 = fma(_886, (*spvDescriptorSet0.vp_c10)._m0[9].z, _934);
    float _940 = _936 + _938;
    bool _942 = _932 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _944 = _938;
    float _946 = _908;
    float _948 = _910;
    float _950 = _920;
    float _952 = _886;
    if (!_942)
    {
        _944 = _908;
    }
    float _954 = _944;
    float _956 = _954;
    if (!_942)
    {
        _946 = _940;
    }
    float _958 = _946;
    bool _960 = !_942;
    float _962 = _958;
    if (!_960)
    {
        float _964 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _966 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _968 = _932 + _966;
        float _970 = _940 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _972 = rsqrt(_926);
        float _974 = _968 * _964;
        float _976 = _974 * 0.15915493667125701904296875;
        float _978 = _976 * 6.283185482025146484375;
        float _980 = cos(_978);
        float _982 = _976 * 6.283185482025146484375;
        float _984 = sin(_982);
        float _986 = _980 + (-1.0);
        float _988 = fma(_984, _970, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _990 = _986 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _992 = _972 * _988;
        float _994 = fma(_940, _980, _990);
        float _996 = fma(_920, _992, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _998 = fma(_914, _992, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _962 = _994;
        _948 = _996;
        _956 = _998;
    }
    float _1000 = _962;
    float _1002 = _948;
    float _1004 = _956;
    float _1006 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1008 = _1000 + _1006;
    float _1010 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1012 = _1002 + _1010;
    float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1016 = _1004 + _1014;
    float _1018 = _1008 * _1008;
    float _1020 = fma(_1012, _1012, _1018);
    float _1022 = fma(_1016, _1016, _1020);
    float _1024 = rsqrt(_1022);
    float _1026 = sqrt(_1022);
    float _1028 = _1024 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1030 = _1012 * _1028;
    float _1032 = _1016 * _1028;
    float _1034 = _1030 * _1030;
    float _1036 = _1032 * _1032;
    float _1038 = _1034 + _1036;
    float _1040 = sqrt(_1038);
    bool _1042 = _1040 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1046 = _1040 + _1044;
    float _1048 = _1016;
    float _1050 = _1038;
    float _1052 = _1046;
    float _1054 = _1008;
    if (_1042)
    {
        float _1056 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1048 = _1056;
    }
    float _1058 = _1048;
    if (_1042)
    {
        float _1060 = rsqrt(_1038);
        _1050 = _1060;
    }
    float _1062 = _1050;
    float _1064 = _1062;
    if (_1042)
    {
        float _1066 = _1046 * _1058;
        _1052 = _1066;
    }
    float _1068 = _1052;
    if (_1042)
    {
        float _1070 = _1068 * 0.15915493667125701904296875;
        _950 = _1070;
    }
    float _1072 = _950;
    float _1074 = _1058;
    float _1076 = _1072;
    if (_1042)
    {
        float _1078 = _1072 * 6.283185482025146484375;
        float _1080 = sin(_1078);
        _1074 = _1080;
    }
    float _1082 = _1074;
    float _1084 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1086 = precise::max(0.0, _1084);
    float _1088 = _1024;
    float _1090 = _1086;
    if (_1042)
    {
        float _1092 = _1072 * 6.283185482025146484375;
        float _1094 = cos(_1092);
        _1088 = _1094;
    }
    float _1096 = _1088;
    float _1098 = -_1028;
    float _1100 = -_1086;
    float _1102 = fma(_1008, _1098, _1100);
    if (_1042)
    {
        float _1104 = _1102 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1090 = _1104;
    }
    float _1106 = _1090;
    float _1108 = _1106;
    float _1110 = _1082;
    if (_1042)
    {
        float _1112 = fma(_1082, _1106, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1108 = _1112;
    }
    float _1114 = _1108;
    float _1116 = _1114;
    if (!_1042)
    {
        _1110 = _1030;
    }
    float _1118 = _1110;
    float _1120 = _1118;
    float _1122 = _1096;
    if (_1042)
    {
        float _1124 = _1096 + (-1.0);
        _1054 = _1124;
    }
    float _1126 = _1054;
    float _1128 = _1126;
    if (_1042)
    {
        float _1130 = _1062 * _1114;
        _952 = _1130;
    }
    float _1132 = _952;
    if (!_1042)
    {
        _1116 = _1102;
    }
    float _1134 = _1116;
    float _1136 = _1134;
    if (_1042)
    {
        float _1138 = _1126 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1076 = _1138;
    }
    float _1140 = _1076;
    if (_1042)
    {
        float _1142 = _1030 * _1132;
        _1120 = _1142;
    }
    float _1144 = _1120;
    if (!_1042)
    {
        _1128 = _1032;
    }
    float _1146 = _1128;
    float _1148 = _1146;
    if (_1042)
    {
        float _1150 = _1032 * _1132;
        _1148 = _1150;
    }
    float _1152 = _1148;
    if (!_1042)
    {
        _1064 = _1034;
    }
    float _1154 = _1064;
    float _1156 = _1154;
    if (_1042)
    {
        float _1158 = fma(_1102, _1096, _1140);
        _1136 = _1158;
    }
    float _1160 = _1136;
    if (_1042)
    {
        float _1162 = _1144 * _1144;
        _1156 = _1162;
    }
    float _1164 = _1156;
    if (!_1042)
    {
        _1122 = _1036;
    }
    float _1166 = _1122;
    float _1168 = _1166;
    if (_1042)
    {
        float _1170 = _1152 * _1152;
        _1168 = _1170;
    }
    float _1172 = _1168;
    float _1174 = fma(_1160, _1160, _1164);
    float _1176 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1178 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1180 = _1174 + _1172;
    float _1182 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1176);
    float _1184 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1186 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1188 = fma(_1026, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1186);
    float _1190 = precise::clamp(_1188, 0.0, 1.0);
    float _1192 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1194 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1182);
    float _1196 = rsqrt(_1180);
    float _1198 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1200 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1184);
    float _1202 = -_1190;
    float _1204 = _1202 + 1.0;
    float _1206 = _1194 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1208 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1198);
    float _1210 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1200);
    float _1212 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1192);
    float _1214 = abs(_1204);
    float _1216 = log2(_1214);
    float _1218 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1208);
    float _1220 = _1210 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1222 = _1206 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1224 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1212);
    float _1226 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1228 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1230 = -_1222;
    float _1232 = fma(_1230, _1178, 1.0);
    float _1234 = _1196 * _1144;
    float _1236 = _1196 * _1160;
    float _1238 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1228);
    float _1240 = _1196 * _1152;
    float _1242 = _1234 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1244 = _1224 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1246 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1238);
    float _1248 = log2(_1232);
    float _1250 = -_1242;
    float _1252 = fma(_1236, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1250);
    float _1254 = _1216 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1256 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1246);
    float _1258 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1260 = -_1240;
    float _1262 = fma(_1260, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1252);
    float _1264 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1266 = _1236 + 1.0;
    float _1268 = exp2(_1254);
    float _1270 = fma(_1262, -0.5, 0.5);
    float _1272 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1264);
    float _1274 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1258);
    float _1276 = fma(_1262, 0.5, 0.5);
    float _1278 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1272);
    float _1280 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1274);
    float _1282 = 1.0 / _1256;
    float _1284 = fma(_1276, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1286 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1278);
    float _1288 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1280);
    float _1290 = _1248 * 0.693147182464599609375;
    float _1292 = fma(_1276, _1284, -0.212114393711090087890625);
    float _1294 = sqrt(_1270);
    float _1296 = -_1236;
    float _1298 = fma(_1268, _1266, _1296);
    float _1300 = _1290 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1302 = fma(_1276, _1292, 1.570728778839111328125);
    float _1304 = fma(_1298, 0.5, 0.5);
    float _1306 = _1286 * _1282;
    float _1308 = _1288 * _1282;
    float _1310 = fma(_1306, 0.5, 0.5);
    float _1312 = _1294 * 0.636619746685028076171875;
    float _1314 = fma(_1308, -0.5, 0.5);
    float _1316 = -_1302;
    float _1318 = fma(_1312, _1316, 1.0);
    float3 _3756 = float3(_1310, _1314, _1300);
    float _1320 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3756, float3(0.0), isnan(_3756)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3756, float3(0.0), isnan(_3756)), level(0.0)).x;
    float3 _3767 = float3(_1310, _1314, _1300);
    float4 _1323 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3767, float3(0.0), isnan(_3767)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3767, float3(0.0), isnan(_3767)), level(0.0)).xyzw;
    float _1325 = _1323.x;
    float _1327 = _1323.y;
    float _1329 = _1323.z;
    float _1331 = _1323.w;
    float2 _3784 = float2(_1318, _1304);
    float3 _1335 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3784, float2(0.0), isnan(_3784)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3784, float2(0.0), isnan(_3784)), level(0.0)).xyz;
    float _1337 = _1335.x;
    float _1339 = _1335.y;
    float _1341 = _1335.z;
    float _1343 = in.m_59.y;
    float _1345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1347 = in.m_59.x;
    bool _1349 = _442 > 0.5;
    float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1353 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1351;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1359 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _1361 = _1359 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _1363 = 1.0 / _1353;
    float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1367 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _1365;
    int _1369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1371 = _1369 != 0;
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1375 = _440 + _1373;
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1379 = _1377 != 0;
    out.m_45.x = 1.0;
    float _1381 = _604 * (-0.15915493667125701904296875);
    float _1383 = 1.0 / _1357;
    bool _1385 = _150 > 0.5;
    bool _1387 = _1385 && _1379;
    float _1389 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1391 = _440 + _1389;
    float _1393 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1397 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1395;
    float _1399 = -_1343;
    float _1401 = _1399 + 1.0;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1407 = 1.0 / _1361;
    float _1409 = _1391 * _1363;
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1411;
    float _1415 = _1343;
    if (_1371)
    {
        float _1417 = _1349 ? _1401 : _1343;
        _1415 = _1417;
    }
    float _1419 = _1415;
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1423 = _440 + _1421;
    bool _1425 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1427 = isnan(_440);
    bool _1429 = _1425 || _1427;
    bool _1431 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1433 = _1429 || _1431;
    float _1435 = float(_1433);
    float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1439 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1437;
    float _1441 = 1.0 / _1367;
    float _1443 = _1375 * _1383;
    float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _1447 = _440 + _1445;
    float _1449 = fma(_1393, _1419, -0.5);
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1453 = _1451 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1457 = _1455 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    bool _1459 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _1461 = isnan(_440);
    bool _1463 = _1459 || _1461;
    bool _1465 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _1467 = _1463 || _1465;
    float _1469 = float(_1467);
    float _1471 = fma(_1413, _1409, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1473 = _1447 * _1407;
    bool _1475 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _1477 = isnan(_440);
    bool _1479 = _1475 || _1477;
    bool _1481 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _1483 = _1479 || _1481;
    float _1485 = float(_1483);
    float _1487 = fma(_1453, _1443, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1491 = fma(_1439, _1409, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1493 = fma(_1397, _1409, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1495 = _1423 * _1441;
    float _1497 = fma(_1457, _1443, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1499 = -_1469;
    float _1501 = _1499 + 1.0;
    float _1503 = fma(_1405, _1443, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1505 = -_1485;
    float _1507 = _1505 + 1.0;
    bool _1509 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1511 = isnan(_440);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1517 = _1513 || _1515;
    float _1519 = float(_1517);
    float _1521 = _1485 * _1501;
    float _1523 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1525 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _1523;
    float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1529 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _1527;
    float _1531 = _1435 * _1507;
    float _1533 = -_1435;
    float _1535 = _1533 + 1.0;
    float _1537 = _1381 * 6.283185482025146484375;
    float _1539 = sin(_1537);
    float _1541 = fma(_1525, _1495, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _1543 = fma(_1529, _1495, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _1545 = _1519 * _1535;
    float _1547 = _1535;
    float _1549 = _1347;
    if (!_1379)
    {
        _1547 = _1347;
    }
    float _1551 = _1547;
    float _1553 = _1551;
    if (_1387)
    {
        float _1555 = -_1347;
        float _1557 = _1555 + 1.0;
        _1549 = _1557;
    }
    float _1559 = _1549;
    bool _1561 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1563 = isnan(_440);
    bool _1565 = _1561 || _1563;
    bool _1567 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1569 = _1565 || _1567;
    float _1571 = float(_1569);
    float _1573 = -_1519;
    float _1575 = _1573 + 1.0;
    float _1577 = _1381 * 6.283185482025146484375;
    float _1579 = cos(_1577);
    float _1581 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1379)
    {
        _1553 = _1559;
    }
    float _1583 = _1553;
    float _1585 = _1571 * _1575;
    float _1587 = -_1571;
    float _1589 = _1587 + 1.0;
    bool _1591 = _792 != 0.0;
    bool _1593 = isnan(_792);
    bool _1595 = _1591 || _1593;
    bool _1597 = isnan(0.0);
    bool _1599 = _1595 || _1597;
    float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _1603 = _1601 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _1605 = _1491 * _1585;
    float _1607 = fma(_1581, _1583, -0.5);
    float _1609 = _1539 * _1449;
    float _1611 = _1471 * _1585;
    float _1613 = _1493 * _1585;
    float _1615 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1605);
    float _1617 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1611);
    float _1619 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1613);
    float _1621 = _1579 * _1449;
    float _1623 = -_1609;
    float _1625 = fma(_1579, _1607, _1623);
    float _1627 = fma(_1497, _1545, _1615);
    float _1629 = -_578;
    bool _1631 = _788 == _1629;
    bool _1633 = !_1599;
    bool _1635 = _1631 && _1633;
    float _1637 = fma(_1539, _1607, _1621);
    float _1639 = fma(_606, _1625, _600);
    float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1643 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _1641;
    float _1645 = in.m_61.x;
    float _1647 = in.m_61.y;
    float _1649 = in.m_61.z;
    float _1651 = -_582;
    bool _1653 = _788 == _1651;
    bool _1655 = _1653 && _1635;
    float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _1659 = _1657 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _1661 = fma(_1643, _1495, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _1663 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _1665 = _1663 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1667 = fma(_1487, _1545, _1617);
    float _1669 = fma(_1503, _1545, _1619);
    float _1671 = -_602;
    float _1673 = fma(_608, _1637, _1671);
    float _1675 = fma(_1603, _1473, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _1677 = fma(_1659, _1473, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1681 = _1216 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1683 = fma(_1665, _1473, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _1685 = fma(_1541, _1531, _1667);
    float _1687 = fma(_1543, _1531, _1627);
    float _1689 = fma(_1661, _1531, _1669);
    float _1691 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1693 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1695 = fma(_1675, _1521, _1685);
    float _1697 = fma(_1677, _1521, _1687);
    float _1699 = fma(_1683, _1521, _1689);
    float _1701 = _1647;
    float _1703 = _1645;
    float _1705 = _1649;
    if (!_1655)
    {
        float _1707 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1647);
        _1701 = _1707;
    }
    float _1709 = _1701;
    float _1711 = exp2(_1681);
    float _1713 = _1679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1715 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1717 = _1693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1719 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[111].x, _1695);
    float _1721 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[111].y, _1697);
    float _1723 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[111].z, _1699);
    if (!_1655)
    {
        float _1725 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1645);
        _1703 = _1725;
    }
    float _1727 = _1703;
    float _1729 = _840 * _1709;
    out.m_63.x = _1713;
    out.m_63.y = _1715;
    out.m_63.z = _1717;
    float _1731 = _1719 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1733 = _852 * _1709;
    float _1735 = _856 * _1709;
    float _1737 = fma(_842, _1727, _1729);
    if (!_1655)
    {
        float _1739 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1649);
        _1705 = _1739;
    }
    float _1741 = _1705;
    float _1743 = fma(_854, _1727, _1733);
    float _1745 = fma(_864, _1727, _1735);
    float _1747 = _1639 + 0.5;
    float _1749 = _1673 + 0.5;
    float _1751 = -_834;
    float _1753 = fma(_1751, _1741, _1737);
    float _1755 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1757 = _1721 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1759 = _1723 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1761 = _1731 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1763 = fma(_844, _1741, _1743);
    float _1765 = _1757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1767 = _1759 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1769 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1755);
    float _1771 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1773 = -_1711;
    float _1775 = _1773 + 1.0;
    out.m_65.x = _1747;
    out.m_65.y = _1749;
    float _1777 = fma(_846, _1741, _1745);
    float _1779 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1769);
    float _1781 = fma(_1763, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1771);
    out.m_67.x = _1761;
    out.m_67.y = _1765;
    out.m_67.z = _1767;
    float _1783 = _1775 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1785 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1779);
    float _1787 = fma(_1777, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1781);
    float _1789 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.gl_Position.x = _1286;
    out.gl_Position.y = _1288;
    out.gl_Position.z = _1785;
    out.gl_Position.w = _1256;
    float _1791 = fma(_1763, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1789);
    float _1793 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1795 = _1785 + _1256;
    float _1797 = fma(_1763, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1793);
    float _1799 = _1795 * 0.5;
    float _1801 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1803 = fma(_1777, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1797);
    float _1805 = fma(_1777, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1791);
    out.m_69.w = _1801;
    out.m_71.x = _1787;
    out.m_71.y = _1803;
    out.m_71.z = _1805;
    out.m_73.z = _1799;
    out.m_73.w = _1256;
    float _1807 = _1783 * _1320;
    float _1809 = -_1783;
    float _1811 = _1809 + 1.0;
    float _1813 = _1331 * _1807;
    float _1815 = _1341 * _1807;
    float _1817 = _1331 * _1811;
    float _1819 = fma(_1337, _1813, _1325);
    float _1821 = fma(_1339, _1813, _1327);
    float _1823 = fma(_1331, _1815, _1329);
    out.m_75.x = _1819;
    out.m_75.y = _1821;
    out.m_75.z = _1823;
    out.m_75.w = _1817;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _432 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _1880 = as_type<float>(_110);
        out.gl_Position.z = _1880;
    }
    if (!_98)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _114 = in.m_47.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = 0.0;
    float _132 = _128;
    if (_124)
    {
        float _134 = float(_94);
        _130 = _134;
    }
    float _136 = _130;
    bool _138 = _128 >= _136;
    bool _140 = !_124;
    bool _142 = _138 || _140;
    if (_142)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _104;
    if (_142)
    {
        out.m_45.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _112 = as_type<int>(_146);
    }
    int _148 = _112;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1949 = as_type<float>(_148);
        out.gl_Position.z = _1949;
    }
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_49.x;
    float _152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _154 = _128 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _156 = _128 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _158 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    int _172 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _174 = _172 != 0;
    float _176 = _154 * _152;
    float _178 = 1.4012984643248170709237295832899e-45;
    if (!_168)
    {
        float _180 = _158 * _158;
        float _182 = _180 * 0.5;
        _178 = _182;
    }
    float _184 = _178;
    float _186 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[20].x, _176);
    float _188 = _156 * _170;
    float _190 = _184;
    float _192 = _186;
    if (!_168)
    {
        float _194 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _194;
    }
    float _196 = _190;
    float _198 = in.m_47.x;
    float _200 = in.m_47.y;
    float _202 = in.m_47.z;
    float _204 = floor(_186);
    float _206 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[20].y, _188);
    float _208 = _186 * 6.283185482025146484375;
    float _210 = _208 * 0.15915493667125701904296875;
    float _212 = _206 * 6.283185482025146484375;
    float _214 = floor(_206);
    float _216 = _212 * 0.15915493667125701904296875;
    float _218 = _210 * 6.283185482025146484375;
    float _220 = cos(_218);
    float _222 = -_204;
    float _224 = _186 + _222;
    float _226 = _196;
    if (!_168)
    {
        _192 = _158;
    }
    float _228 = _192;
    float _230 = _216 * 6.283185482025146484375;
    float _232 = cos(_230);
    float _234 = -_214;
    float _236 = _206 + _234;
    bool _238 = !_168;
    float _240 = _228;
    if (!_238)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = _158 * _244;
        float _254 = 1.0 / _248;
        float _256 = _250 * 0.693147182464599609375;
        float _258 = exp2(_252);
        float _260 = 1.0 / _256;
        float _262 = _258 + (-1.0);
        float _264 = -_262;
        float _266 = fma(_264, _260, _158);
        float _268 = _266 * _254;
        float _270 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _226 = _270;
    }
    float _272 = _226;
    bool _274 = !_168;
    if (!_274)
    {
        float _276 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _278 = log2(_276);
        float _280 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _282 = _280 + 1.0;
        float _284 = 1.0 / _282;
        float _286 = _158 * _278;
        float _288 = exp2(_286);
        float _290 = -_288;
        float _292 = _290 + 1.0;
        float _294 = _292 * _284;
        _240 = _294;
    }
    float _296 = _240;
    float _298 = in.m_51.w;
    float _300 = -_224;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _304 = _224 < 0.5;
    float _306 = float(_304);
    float _308 = fma(_232, 0.5, 0.5);
    float _310 = fma(_220, 0.5, 0.5);
    bool _312 = _236 < 0.5;
    float _314 = float(_312);
    float _316 = -_306;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _322 = _320 != 0;
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _326 = _324 != 0;
    float _328 = -_236;
    float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _332 = -_310;
    float _334 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _336 = -_314;
    float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _340 = -_308;
    float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _344 = !_322;
    int _346 = _344 ? 0 : 1;
    float _348 = in.m_42.x;
    float _350 = in.m_42.y;
    float _352 = in.m_42.z;
    float _354 = _272 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _356 = _272 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _358 = !_174;
    int _360 = _358 ? 0 : 1;
    int _362 = abs(_346);
    float _364 = fma(_296, _198, _354);
    float _366 = fma(_296, _200, _356);
    int _368 = abs(_360);
    float _370 = _272 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _372 = !_326;
    int _374 = _372 ? 0 : 1;
    float _376 = fma(_296, _202, _370);
    int _378 = abs(_374);
    bool _380 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _382 = float(_362);
    float _384 = float(_368);
    float _386 = float(_378);
    float _388 = abs(_302);
    float _390 = _382 * _388;
    float _392 = abs(_330);
    float _394 = _382 * _392;
    float _396 = fma(_364, _298, _348);
    float _398 = fma(_366, _298, _350);
    float _400 = fma(_384, _334, _390);
    float _402 = fma(_384, _342, _394);
    float _404 = fma(_376, _298, _352);
    float _406 = abs(_318);
    float _408 = fma(_386, _406, _400);
    float _410 = abs(_338);
    float _412 = fma(_386, _410, _402);
    bool _414 = !_380;
    float _430;
    if (!_414)
    {
        float _416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _418 = _150 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _420 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _422 = _420 * _416;
        float _424 = floor(_422);
        float _426 = -_424;
        float _428 = _422 + _426;
        _430 = _428;
        _432 = true;
    }
    else
    {
        float _434 = float(_94);
        float _436 = 1.0 / _434;
        float _438 = _128 * _436;
        _430 = _438;
    }
    _432 = false;
    float _440 = _430;
    float _442 = in.m_49.y;
    float _444 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _446 = log2(_444);
    float _448 = _150 * 2.0;
    float _450 = in.m_49.z;
    float _452 = _150 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _456 = floor(_448);
    float _458 = -_454;
    float _460 = fma(_452, 2.0, _458);
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _466 = _464 != 0;
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _470 = _468 != 0;
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _474 = _472 != 0;
    float _476 = _446 * _128;
    bool _478 = !_470;
    int _480 = _478 ? 0 : 1;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _484 = exp2(_476);
    float _486 = _442 * 2.0;
    float _488 = _442 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _490 = _456 >= 0.0;
    bool _492 = isnan(_456);
    bool _494 = _490 || _492;
    bool _496 = isnan(0.0);
    bool _498 = _494 || _496;
    float _500 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[78].w, _482);
    float _502 = _442 + _450;
    float _504 = fma(_488, -2.0, _462);
    float _506 = _150 + _450;
    float _508 = floor(_486);
    float _510 = _502 + (-1.0);
    float _512 = _450 * 2.0;
    float _514 = _506 + (-1.0);
    float _516 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _518 = _456 > 0.0;
    float _520 = floor(_512);
    float _522 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _526 = 1.0 + _524;
    float _528 = -_484;
    float _530 = _528 + 1.0;
    int _532 = _498 ? 0 : 1;
    float _534 = 1.0 / _526;
    bool _536 = _508 >= 0.0;
    bool _538 = isnan(_508);
    bool _540 = _536 || _538;
    bool _542 = isnan(0.0);
    bool _544 = _540 || _542;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _548 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _550 = isnan(0.0);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _556 = _552 || _554;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _560 = _544 ? 0 : 1;
    bool _562 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _564 = isnan(1.0);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _570 = _566 || _568;
    float _572 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[78].z, _558);
    float _574 = _556 ? _530 : 0.0;
    bool _576 = _520 > 0.0;
    float _578 = in.m_53.x;
    float _580 = in.m_53.y;
    float _582 = in.m_53.z;
    bool _584 = _520 >= 0.0;
    bool _586 = isnan(_520);
    bool _588 = _584 || _586;
    bool _590 = isnan(0.0);
    bool _592 = _588 || _590;
    float _594 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[79].z, _546);
    bool _596 = _508 > 0.0;
    float _598 = -_128;
    float _600 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[76].x, _460);
    float _602 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _504);
    float _604 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[79].x, _594);
    float _606 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _572);
    float _608 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _500);
    if (_570)
    {
        float _610 = _574 * _534;
        _132 = _610;
    }
    float _612 = _132;
    int _614 = abs(_480);
    float _616 = in.m_55.x;
    float _618 = in.m_55.y;
    float _620 = in.m_55.z;
    int _622 = ~_532;
    int _624 = _622 + 1;
    int _626 = _624 + 1;
    float _628 = _450 + (-0.5);
    int _630 = _626;
    if (!_518)
    {
        int _632 = ~_532;
        int _634 = _632 + 1;
        _630 = _634;
    }
    int _636 = _630;
    int _638 = ~_560;
    int _640 = _638 + 1;
    int _642 = _640 + 1;
    int _644 = _642;
    if (!_596)
    {
        int _646 = ~_560;
        int _648 = _646 + 1;
        _644 = _648;
    }
    int _650 = _644;
    float _652 = float(_614);
    float _654 = float(_636);
    int _656 = _592 ? 0 : 1;
    bool _658 = !_474;
    int _660 = _658 ? 0 : 1;
    float _662 = _652 * _654;
    int _664 = ~_656;
    int _666 = _664 + 1;
    int _668 = _666 + 1;
    float _670 = _442 + (-0.5);
    bool _672 = !_466;
    int _674 = _672 ? 0 : 1;
    float _676 = _662 * (-2.0);
    int _678 = _668;
    if (!_576)
    {
        int _680 = ~_656;
        int _682 = _680 + 1;
        _678 = _682;
    }
    int _684 = _678;
    int _686 = abs(_660);
    float _688 = fma(_516, _676, _516);
    int _690 = abs(_674);
    float _692 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.0500000007450580596923828125, _582);
    float _694 = float(_686);
    float _696 = fma(_676, _618, _618);
    float _698 = float(_650);
    float _700 = _692 * 5.0;
    float _702 = float(_690);
    float _704 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[196].y, _696);
    float _706 = float(_684);
    float _708 = _694 * _698;
    float _710 = _700 * 0.15915493667125701904296875;
    float _712 = fma(_688, _612, _704);
    float _714 = _708 * (-2.0);
    float _716 = _702 * _706;
    float _718 = in.m_51.x;
    float _720 = in.m_51.y;
    float _722 = in.m_51.z;
    float _724 = _712 * 0.15915493667125701904296875;
    float _726 = _150 + _442;
    float _728 = fma(_714, _620, _620);
    float _730 = _716 * (-2.0);
    float _732 = fma(_522, _714, _522);
    float _734 = _726 + (-1.0);
    float _736 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[196].z, _728);
    float _738 = fma(_730, _616, _616);
    float _740 = in.m_57.w;
    float _742 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _744 = _150 + (-0.5);
    float _746 = _710 * 6.283185482025146484375;
    float _748 = sin(_746);
    float _750 = fma(_732, _612, _736);
    float _752 = fma(_742, _730, _742);
    float _754 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[196].x, _738);
    float _756 = fma(_752, _612, _754);
    float _758 = _724 * 6.283185482025146484375;
    float _760 = sin(_758);
    float _762 = _750 * 0.15915493667125701904296875;
    float _764 = _756 * 0.15915493667125701904296875;
    float _766 = _718 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _768 = _722 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _770 = -(*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _772 = _770 + 1.0;
    float _774 = precise::clamp(_772, 0.0, 1.0);
    float _776 = _724 * 6.283185482025146484375;
    float _778 = cos(_776);
    float _780 = _748 * 0.0199999995529651641845703125;
    float _782 = _720 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _784 = fma(_774, 0.875, 0.125);
    float _786 = _408 * _766;
    float _788 = _780 * _740;
    float _790 = _412 * _782;
    float _792 = _784 * _580;
    float _794 = _762 * 6.283185482025146484375;
    float _796 = cos(_794);
    float _798 = _788 + _578;
    float _800 = _790 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _792);
    float _804 = _786 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _806 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _798);
    float _808 = _788 + _582;
    float _810 = _800 * _802;
    float _812 = _762 * 6.283185482025146484375;
    float _814 = sin(_812);
    float _816 = _804 * _806;
    float _818 = _768 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _820 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _808);
    float _822 = _818 * _820;
    float _824 = _764 * 6.283185482025146484375;
    float _826 = cos(_824);
    float _828 = _778 * _796;
    float _830 = _760 * _796;
    float _832 = _764 * 6.283185482025146484375;
    float _834 = sin(_832);
    float _836 = _778 * _814;
    float _838 = _760 * _814;
    float _840 = _826 * _796;
    float _842 = _826 * _814;
    float _844 = _826 * _760;
    float _846 = _826 * _778;
    float _848 = _840 * _810;
    float _850 = -_836;
    float _852 = fma(_834, _830, _850);
    float _854 = fma(_834, _838, _828);
    float _856 = fma(_834, _828, _838);
    float _858 = fma(_842, _816, _848);
    float _860 = _852 * _810;
    float _862 = -_830;
    float _864 = fma(_834, _836, _862);
    float _866 = _856 * _810;
    float _868 = _398 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _870 = fma(_854, _816, _860);
    float _872 = -_834;
    float _874 = fma(_872, _822, _858);
    float _876 = fma(_864, _816, _866);
    float _878 = _398 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _880 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[6].x, _868);
    float _882 = fma(_844, _822, _870);
    float _884 = _874 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _886 = fma(_846, _822, _876);
    float _888 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[4].x, _878);
    float _890 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[6].z, _880);
    float _892 = _874 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _894 = fma(_882, (*spvDescriptorSet0.vp_c10)._m0[10].x, _884);
    float _896 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[4].z, _888);
    float _898 = _890 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _900 = fma(_882, (*spvDescriptorSet0.vp_c10)._m0[8].x, _892);
    float _902 = fma(_886, (*spvDescriptorSet0.vp_c10)._m0[10].z, _894);
    float _904 = _896 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _906 = fma(_886, (*spvDescriptorSet0.vp_c10)._m0[8].z, _900);
    float _908 = _898 + _902;
    float _910 = _904 + _906;
    float _912 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _914 = _908 + _912;
    float _916 = _398 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _918 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _920 = _910 + _918;
    float _922 = _914 * _914;
    float _924 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[5].x, _916);
    float _926 = fma(_920, _920, _922);
    float _928 = _874 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _930 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[5].z, _924);
    float _932 = sqrt(_926);
    float _934 = fma(_882, (*spvDescriptorSet0.vp_c10)._m0[9].x, _928);
    float _936 = _930 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _938 = fma(_886, (*spvDescriptorSet0.vp_c10)._m0[9].z, _934);
    float _940 = _936 + _938;
    bool _942 = _932 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _944 = _938;
    float _946 = _908;
    float _948 = _910;
    float _950 = _920;
    float _952 = _886;
    if (!_942)
    {
        _944 = _908;
    }
    float _954 = _944;
    float _956 = _954;
    if (!_942)
    {
        _946 = _940;
    }
    float _958 = _946;
    bool _960 = !_942;
    float _962 = _958;
    if (!_960)
    {
        float _964 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _966 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _968 = _932 + _966;
        float _970 = _940 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _972 = rsqrt(_926);
        float _974 = _968 * _964;
        float _976 = _974 * 0.15915493667125701904296875;
        float _978 = _976 * 6.283185482025146484375;
        float _980 = cos(_978);
        float _982 = _976 * 6.283185482025146484375;
        float _984 = sin(_982);
        float _986 = _980 + (-1.0);
        float _988 = fma(_984, _970, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _990 = _986 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _992 = _972 * _988;
        float _994 = fma(_940, _980, _990);
        float _996 = fma(_920, _992, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _998 = fma(_914, _992, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _962 = _994;
        _948 = _996;
        _956 = _998;
    }
    float _1000 = _962;
    float _1002 = _948;
    float _1004 = _956;
    float _1006 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1008 = _1000 + _1006;
    float _1010 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1012 = _1002 + _1010;
    float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1016 = _1004 + _1014;
    float _1018 = _1008 * _1008;
    float _1020 = fma(_1012, _1012, _1018);
    float _1022 = fma(_1016, _1016, _1020);
    float _1024 = rsqrt(_1022);
    float _1026 = sqrt(_1022);
    float _1028 = _1024 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1030 = _1012 * _1028;
    float _1032 = _1016 * _1028;
    float _1034 = _1030 * _1030;
    float _1036 = _1032 * _1032;
    float _1038 = _1034 + _1036;
    float _1040 = sqrt(_1038);
    bool _1042 = _1040 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1046 = _1040 + _1044;
    float _1048 = _1016;
    float _1050 = _1038;
    float _1052 = _1046;
    float _1054 = _1008;
    if (_1042)
    {
        float _1056 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1048 = _1056;
    }
    float _1058 = _1048;
    if (_1042)
    {
        float _1060 = rsqrt(_1038);
        _1050 = _1060;
    }
    float _1062 = _1050;
    float _1064 = _1062;
    if (_1042)
    {
        float _1066 = _1046 * _1058;
        _1052 = _1066;
    }
    float _1068 = _1052;
    if (_1042)
    {
        float _1070 = _1068 * 0.15915493667125701904296875;
        _950 = _1070;
    }
    float _1072 = _950;
    float _1074 = _1058;
    float _1076 = _1072;
    if (_1042)
    {
        float _1078 = _1072 * 6.283185482025146484375;
        float _1080 = sin(_1078);
        _1074 = _1080;
    }
    float _1082 = _1074;
    float _1084 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1086 = precise::max(0.0, _1084);
    float _1088 = _1024;
    float _1090 = _1086;
    if (_1042)
    {
        float _1092 = _1072 * 6.283185482025146484375;
        float _1094 = cos(_1092);
        _1088 = _1094;
    }
    float _1096 = _1088;
    float _1098 = -_1028;
    float _1100 = -_1086;
    float _1102 = fma(_1008, _1098, _1100);
    if (_1042)
    {
        float _1104 = _1102 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1090 = _1104;
    }
    float _1106 = _1090;
    float _1108 = _1106;
    float _1110 = _1082;
    if (_1042)
    {
        float _1112 = fma(_1082, _1106, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1108 = _1112;
    }
    float _1114 = _1108;
    float _1116 = _1114;
    if (!_1042)
    {
        _1110 = _1030;
    }
    float _1118 = _1110;
    float _1120 = _1118;
    float _1122 = _1096;
    if (_1042)
    {
        float _1124 = _1096 + (-1.0);
        _1054 = _1124;
    }
    float _1126 = _1054;
    float _1128 = _1126;
    if (_1042)
    {
        float _1130 = _1062 * _1114;
        _952 = _1130;
    }
    float _1132 = _952;
    if (!_1042)
    {
        _1116 = _1102;
    }
    float _1134 = _1116;
    float _1136 = _1134;
    if (_1042)
    {
        float _1138 = _1126 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1076 = _1138;
    }
    float _1140 = _1076;
    if (_1042)
    {
        float _1142 = _1030 * _1132;
        _1120 = _1142;
    }
    float _1144 = _1120;
    if (!_1042)
    {
        _1128 = _1032;
    }
    float _1146 = _1128;
    float _1148 = _1146;
    if (_1042)
    {
        float _1150 = _1032 * _1132;
        _1148 = _1150;
    }
    float _1152 = _1148;
    if (!_1042)
    {
        _1064 = _1034;
    }
    float _1154 = _1064;
    float _1156 = _1154;
    if (_1042)
    {
        float _1158 = fma(_1102, _1096, _1140);
        _1136 = _1158;
    }
    float _1160 = _1136;
    if (_1042)
    {
        float _1162 = _1144 * _1144;
        _1156 = _1162;
    }
    float _1164 = _1156;
    if (!_1042)
    {
        _1122 = _1036;
    }
    float _1166 = _1122;
    float _1168 = _1166;
    if (_1042)
    {
        float _1170 = _1152 * _1152;
        _1168 = _1170;
    }
    float _1172 = _1168;
    float _1174 = fma(_1160, _1160, _1164);
    float _1176 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1178 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1180 = _1174 + _1172;
    float _1182 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1176);
    float _1184 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1186 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1188 = fma(_1026, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1186);
    float _1190 = precise::clamp(_1188, 0.0, 1.0);
    float _1192 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1194 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1182);
    float _1196 = rsqrt(_1180);
    float _1198 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1200 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1184);
    float _1202 = -_1190;
    float _1204 = _1202 + 1.0;
    float _1206 = _1194 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1208 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1198);
    float _1210 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1200);
    float _1212 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1192);
    float _1214 = abs(_1204);
    float _1216 = log2(_1214);
    float _1218 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1208);
    float _1220 = _1210 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1222 = _1206 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1224 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1212);
    float _1226 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1228 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1230 = -_1222;
    float _1232 = fma(_1230, _1178, 1.0);
    float _1234 = _1196 * _1144;
    float _1236 = _1196 * _1160;
    float _1238 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1228);
    float _1240 = _1196 * _1152;
    float _1242 = _1234 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1244 = _1224 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1246 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1238);
    float _1248 = log2(_1232);
    float _1250 = -_1242;
    float _1252 = fma(_1236, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1250);
    float _1254 = _1216 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1256 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1246);
    float _1258 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1260 = -_1240;
    float _1262 = fma(_1260, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1252);
    float _1264 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1266 = _1236 + 1.0;
    float _1268 = exp2(_1254);
    float _1270 = fma(_1262, -0.5, 0.5);
    float _1272 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1264);
    float _1274 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1258);
    float _1276 = fma(_1262, 0.5, 0.5);
    float _1278 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1272);
    float _1280 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1274);
    float _1282 = 1.0 / _1256;
    float _1284 = fma(_1276, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1286 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1278);
    float _1288 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1280);
    float _1290 = _1248 * 0.693147182464599609375;
    float _1292 = fma(_1276, _1284, -0.212114393711090087890625);
    float _1294 = sqrt(_1270);
    float _1296 = -_1236;
    float _1298 = fma(_1268, _1266, _1296);
    float _1300 = _1290 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1302 = fma(_1276, _1292, 1.570728778839111328125);
    float _1304 = fma(_1298, 0.5, 0.5);
    float _1306 = _1286 * _1282;
    float _1308 = _1288 * _1282;
    float _1310 = fma(_1306, 0.5, 0.5);
    float _1312 = _1294 * 0.636619746685028076171875;
    float _1314 = fma(_1308, -0.5, 0.5);
    float _1316 = -_1302;
    float _1318 = fma(_1312, _1316, 1.0);
    float3 _3756 = float3(_1310, _1314, _1300);
    float _1320 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3756, float3(0.0), isnan(_3756)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3756, float3(0.0), isnan(_3756)), level(0.0)).x;
    float3 _3767 = float3(_1310, _1314, _1300);
    float4 _1323 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3767, float3(0.0), isnan(_3767)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3767, float3(0.0), isnan(_3767)), level(0.0)).xyzw;
    float _1325 = _1323.x;
    float _1327 = _1323.y;
    float _1329 = _1323.z;
    float _1331 = _1323.w;
    float2 _3784 = float2(_1318, _1304);
    float3 _1335 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3784, float2(0.0), isnan(_3784)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3784, float2(0.0), isnan(_3784)), level(0.0)).xyz;
    float _1337 = _1335.x;
    float _1339 = _1335.y;
    float _1341 = _1335.z;
    float _1343 = in.m_59.y;
    float _1345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1347 = in.m_59.x;
    bool _1349 = _442 > 0.5;
    float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1353 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1351;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1359 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _1361 = _1359 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _1363 = 1.0 / _1353;
    float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1367 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _1365;
    int _1369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1371 = _1369 != 0;
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1375 = _440 + _1373;
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1379 = _1377 != 0;
    out.m_45.x = 1.0;
    float _1381 = _604 * (-0.15915493667125701904296875);
    float _1383 = 1.0 / _1357;
    bool _1385 = _150 > 0.5;
    bool _1387 = _1385 && _1379;
    float _1389 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1391 = _440 + _1389;
    float _1393 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1397 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1395;
    float _1399 = -_1343;
    float _1401 = _1399 + 1.0;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1407 = 1.0 / _1361;
    float _1409 = _1391 * _1363;
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1411;
    float _1415 = _1343;
    if (_1371)
    {
        float _1417 = _1349 ? _1401 : _1343;
        _1415 = _1417;
    }
    float _1419 = _1415;
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1423 = _440 + _1421;
    bool _1425 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1427 = isnan(_440);
    bool _1429 = _1425 || _1427;
    bool _1431 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1433 = _1429 || _1431;
    float _1435 = float(_1433);
    float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1439 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1437;
    float _1441 = 1.0 / _1367;
    float _1443 = _1375 * _1383;
    float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _1447 = _440 + _1445;
    float _1449 = fma(_1393, _1419, -0.5);
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1453 = _1451 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1457 = _1455 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    bool _1459 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _1461 = isnan(_440);
    bool _1463 = _1459 || _1461;
    bool _1465 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _1467 = _1463 || _1465;
    float _1469 = float(_1467);
    float _1471 = fma(_1413, _1409, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1473 = _1447 * _1407;
    bool _1475 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _1477 = isnan(_440);
    bool _1479 = _1475 || _1477;
    bool _1481 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _1483 = _1479 || _1481;
    float _1485 = float(_1483);
    float _1487 = fma(_1453, _1443, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1491 = fma(_1439, _1409, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1493 = fma(_1397, _1409, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1495 = _1423 * _1441;
    float _1497 = fma(_1457, _1443, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1499 = -_1469;
    float _1501 = _1499 + 1.0;
    float _1503 = fma(_1405, _1443, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1505 = -_1485;
    float _1507 = _1505 + 1.0;
    bool _1509 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1511 = isnan(_440);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1517 = _1513 || _1515;
    float _1519 = float(_1517);
    float _1521 = _1485 * _1501;
    float _1523 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1525 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _1523;
    float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1529 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _1527;
    float _1531 = _1435 * _1507;
    float _1533 = -_1435;
    float _1535 = _1533 + 1.0;
    float _1537 = _1381 * 6.283185482025146484375;
    float _1539 = sin(_1537);
    float _1541 = fma(_1525, _1495, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _1543 = fma(_1529, _1495, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _1545 = _1519 * _1535;
    float _1547 = _1535;
    float _1549 = _1347;
    if (!_1379)
    {
        _1547 = _1347;
    }
    float _1551 = _1547;
    float _1553 = _1551;
    if (_1387)
    {
        float _1555 = -_1347;
        float _1557 = _1555 + 1.0;
        _1549 = _1557;
    }
    float _1559 = _1549;
    bool _1561 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1563 = isnan(_440);
    bool _1565 = _1561 || _1563;
    bool _1567 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1569 = _1565 || _1567;
    float _1571 = float(_1569);
    float _1573 = -_1519;
    float _1575 = _1573 + 1.0;
    float _1577 = _1381 * 6.283185482025146484375;
    float _1579 = cos(_1577);
    float _1581 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1379)
    {
        _1553 = _1559;
    }
    float _1583 = _1553;
    float _1585 = _1571 * _1575;
    float _1587 = -_1571;
    float _1589 = _1587 + 1.0;
    bool _1591 = _792 != 0.0;
    bool _1593 = isnan(_792);
    bool _1595 = _1591 || _1593;
    bool _1597 = isnan(0.0);
    bool _1599 = _1595 || _1597;
    float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _1603 = _1601 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _1605 = _1491 * _1585;
    float _1607 = fma(_1581, _1583, -0.5);
    float _1609 = _1539 * _1449;
    float _1611 = _1471 * _1585;
    float _1613 = _1493 * _1585;
    float _1615 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1605);
    float _1617 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1611);
    float _1619 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1613);
    float _1621 = _1579 * _1449;
    float _1623 = -_1609;
    float _1625 = fma(_1579, _1607, _1623);
    float _1627 = fma(_1497, _1545, _1615);
    float _1629 = -_578;
    bool _1631 = _788 == _1629;
    bool _1633 = !_1599;
    bool _1635 = _1631 && _1633;
    float _1637 = fma(_1539, _1607, _1621);
    float _1639 = fma(_606, _1625, _600);
    float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1643 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _1641;
    float _1645 = in.m_61.x;
    float _1647 = in.m_61.y;
    float _1649 = in.m_61.z;
    float _1651 = -_582;
    bool _1653 = _788 == _1651;
    bool _1655 = _1653 && _1635;
    float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _1659 = _1657 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _1661 = fma(_1643, _1495, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _1663 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _1665 = _1663 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1667 = fma(_1487, _1545, _1617);
    float _1669 = fma(_1503, _1545, _1619);
    float _1671 = -_602;
    float _1673 = fma(_608, _1637, _1671);
    float _1675 = fma(_1603, _1473, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _1677 = fma(_1659, _1473, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1681 = _1216 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1683 = fma(_1665, _1473, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _1685 = fma(_1541, _1531, _1667);
    float _1687 = fma(_1543, _1531, _1627);
    float _1689 = fma(_1661, _1531, _1669);
    float _1691 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1693 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1695 = fma(_1675, _1521, _1685);
    float _1697 = fma(_1677, _1521, _1687);
    float _1699 = fma(_1683, _1521, _1689);
    float _1701 = _1647;
    float _1703 = _1645;
    float _1705 = _1649;
    if (!_1655)
    {
        float _1707 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1647);
        _1701 = _1707;
    }
    float _1709 = _1701;
    float _1711 = exp2(_1681);
    float _1713 = _1679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1715 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1717 = _1693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1719 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[111].x, _1695);
    float _1721 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[111].y, _1697);
    float _1723 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[111].z, _1699);
    if (!_1655)
    {
        float _1725 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1645);
        _1703 = _1725;
    }
    float _1727 = _1703;
    float _1729 = _840 * _1709;
    out.m_63.x = _1713;
    out.m_63.y = _1715;
    out.m_63.z = _1717;
    float _1731 = _1719 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1733 = _852 * _1709;
    float _1735 = _856 * _1709;
    float _1737 = fma(_842, _1727, _1729);
    if (!_1655)
    {
        float _1739 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1649);
        _1705 = _1739;
    }
    float _1741 = _1705;
    float _1743 = fma(_854, _1727, _1733);
    float _1745 = fma(_864, _1727, _1735);
    float _1747 = _1639 + 0.5;
    float _1749 = _1673 + 0.5;
    float _1751 = -_834;
    float _1753 = fma(_1751, _1741, _1737);
    float _1755 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1757 = _1721 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1759 = _1723 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1761 = _1731 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1763 = fma(_844, _1741, _1743);
    float _1765 = _1757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1767 = _1759 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1769 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1755);
    float _1771 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1773 = -_1711;
    float _1775 = _1773 + 1.0;
    out.m_65.x = _1747;
    out.m_65.y = _1749;
    float _1777 = fma(_846, _1741, _1745);
    float _1779 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1769);
    float _1781 = fma(_1763, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1771);
    out.m_67.x = _1761;
    out.m_67.y = _1765;
    out.m_67.z = _1767;
    float _1783 = _1775 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1785 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1779);
    float _1787 = fma(_1777, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1781);
    float _1789 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.gl_Position.x = _1286;
    out.gl_Position.y = _1288;
    out.gl_Position.z = _1785;
    out.gl_Position.w = _1256;
    float _1791 = fma(_1763, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1789);
    float _1793 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1795 = _1785 + _1256;
    float _1797 = fma(_1763, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1793);
    float _1799 = _1795 * 0.5;
    float _1801 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1803 = fma(_1777, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1797);
    float _1805 = fma(_1777, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1791);
    out.m_69.w = _1801;
    out.m_71.x = _1787;
    out.m_71.y = _1803;
    out.m_71.z = _1805;
    out.m_73.z = _1799;
    out.m_73.w = _1256;
    float _1807 = _1783 * _1320;
    float _1809 = -_1783;
    float _1811 = _1809 + 1.0;
    float _1813 = _1331 * _1807;
    float _1815 = _1341 * _1807;
    float _1817 = _1331 * _1811;
    float _1819 = fma(_1337, _1813, _1325);
    float _1821 = fma(_1339, _1813, _1327);
    float _1823 = fma(_1331, _1815, _1329);
    out.m_75.x = _1819;
    out.m_75.y = _1821;
    out.m_75.z = _1823;
    out.m_75.w = _1817;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

