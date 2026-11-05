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
    float4 m_67 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_71 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _600 = false;
    bool _380 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2160 = as_type<float>(_112);
        out.gl_Position.z = _2160;
    }
    if (!_100)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _116 = in.m_47.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = _130;
    if (_126)
    {
        float _134 = float(_96);
        _106 = _134;
    }
    float _136 = _106;
    bool _138 = _130 >= _136;
    bool _140 = !_126;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_45.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _114 = as_type<int>(_148);
    }
    int _150 = _114;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2230 = as_type<float>(_150);
        out.gl_Position.z = _2230;
    }
    if (_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_49.x;
    float _154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _156 = _130 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _158 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    int _170 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _172 = _170 != 0;
    float _174 = _156 * _154;
    float _176 = 0.0;
    float _178 = _158;
    if (!_168)
    {
        float _180 = _158 * _158;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[20].x, _174);
    float _188 = _184;
    if (!_168)
    {
        float _190 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    float _194 = in.m_47.x;
    float _196 = in.m_47.y;
    float _198 = in.m_47.z;
    float _200 = _186 * 6.283185482025146484375;
    float _202 = floor(_186);
    float _204 = _200 * 0.15915493667125701904296875;
    float _206 = _204 * 6.283185482025146484375;
    float _208 = cos(_206);
    float _210 = -_202;
    float _212 = _186 + _210;
    bool _214 = !_168;
    float _216 = _192;
    if (!_214)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _158 * _220;
        float _230 = 1.0 / _224;
        float _232 = _226 * 0.693147182464599609375;
        float _234 = exp2(_228);
        float _236 = 1.0 / _232;
        float _238 = _234 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _236, _158);
        float _244 = _242 * _230;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _246;
    }
    float _248 = _216;
    bool _250 = !_168;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _158 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _178 = _270;
    }
    float _272 = _178;
    float _274 = in.m_51.w;
    int _276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _278 = _276 != 0;
    int _280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _282 = _280 != 0;
    float _284 = in.m_42.x;
    float _286 = in.m_42.y;
    float _288 = in.m_42.z;
    float _290 = -_212;
    float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _294 = _212 < 0.5;
    float _296 = float(_294);
    bool _298 = !_278;
    int _300 = _298 ? 0 : 1;
    float _302 = fma(_208, 0.5, 0.5);
    bool _304 = !_172;
    int _306 = _304 ? 0 : 1;
    float _308 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _310 = abs(_300);
    float _312 = -_296;
    float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _316 = -_302;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _320 = fma(_272, _194, _308);
    int _322 = abs(_306);
    float _324 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _326 = !_282;
    int _328 = _326 ? 0 : 1;
    float _330 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _334 = abs(_328);
    float _336 = fma(_272, _196, _324);
    float _338 = float(_310);
    float _340 = fma(_272, _198, _330);
    float _342 = float(_322);
    float _344 = abs(_292);
    float _346 = _338 * _344;
    float _348 = float(_334);
    float _350 = fma(_342, _318, _346);
    float _352 = fma(_320, _274, _284);
    float _354 = fma(_336, _274, _286);
    float _356 = fma(_340, _274, _288);
    float _358 = abs(_314);
    float _360 = fma(_348, _358, _350);
    bool _362 = !_332;
    float _378;
    if (!_362)
    {
        float _364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _366 = _152 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _368 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _370 = _368 * _364;
        float _372 = floor(_370);
        float _374 = -_372;
        float _376 = _370 + _374;
        _378 = _376;
        _380 = true;
    }
    else
    {
        float _382 = float(_96);
        float _384 = 1.0 / _382;
        float _386 = _130 * _384;
        _378 = _386;
    }
    _380 = false;
    float _388 = _378;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _392 = _388 + _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _396 = _388 + _394;
    bool _398 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _400 = isnan(_388);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _416 = _388 + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _426 = 1.0 / _412;
    bool _428 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _430 = 1.0 / _420;
    float _432 = 1.0 / _424;
    float _434 = _392 * _426;
    bool _436 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _438 = isnan(_388);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _444 = _440 || _442;
    float _446 = float(_444);
    float _448 = -_408;
    float _450 = _448 + 1.0;
    float _452 = _446 * _450;
    float _454 = _396 * _430;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _460;
    bool _464 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _466 = isnan(_388);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = -_446;
    float _478 = _476 + 1.0;
    float _480 = fma(_458, _454, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _482 = fma(_462, _454, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _488 = _416 * _432;
    bool _490 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _492 = isnan(_388);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _510 = fma(_486, _488, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _512 = fma(_504, _454, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _514 = -_500;
    float _516 = _514 + 1.0;
    float _518 = _500 * _478;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _524 = fma(_508, _488, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _526 = _474 * _516;
    float _528 = -_474;
    float _530 = _528 + 1.0;
    float _532 = fma(_522, _488, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _534 = _480 * _526;
    float _536 = _482 * _526;
    float _538 = _512 * _526;
    float _540 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[143].x, _534);
    float _542 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[143].y, _536);
    float _544 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[143].z, _538);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _546;
    float _550 = fma(_524, _518, _540);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _556;
    float _560 = fma(_548, _434, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _562 = fma(_532, _518, _542);
    float _564 = fma(_554, _434, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _566 = fma(_558, _434, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _568 = fma(_510, _518, _544);
    float _570 = fma(_560, _452, _550);
    float _572 = fma(_564, _452, _562);
    float _574 = fma(_566, _452, _568);
    float _576 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[146].x, _570);
    float _578 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[146].y, _572);
    float _580 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[146].z, _574);
    bool _582 = !_428;
    float _598;
    if (!_582)
    {
        float _584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _586 = _152 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _588 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _590 = _588 * _584;
        float _592 = floor(_590);
        float _594 = -_592;
        float _596 = _590 + _594;
        _598 = _596;
        _600 = true;
    }
    else
    {
        float _602 = float(_96);
        float _604 = 1.0 / _602;
        float _606 = _130 * _604;
        _598 = _606;
    }
    _600 = false;
    float _608 = _598;
    float _610 = in.m_49.z;
    float _612 = _152 * 2.0;
    float _614 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _616 = log2(_614);
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _620 = _618 != 0;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _624 = _622 != 0;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _628 = _626 != 0;
    float _630 = in.m_49.y;
    float _632 = floor(_612);
    bool _634 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _636 = isnan(0.0);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _642 = _638 || _640;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _646 = 1.0 + _644;
    float _648 = _616 * _130;
    float _650 = 1.0 / _646;
    float _652 = _610 * 2.0;
    bool _654 = _632 > 0.0;
    float _656 = exp2(_648);
    float _658 = _152 + _630;
    bool _660 = _632 >= 0.0;
    bool _662 = isnan(_632);
    bool _664 = _660 || _662;
    bool _666 = isnan(0.0);
    bool _668 = _664 || _666;
    float _670 = _630 * 2.0;
    float _672 = _658 + (-1.0);
    float _674 = _630 + _610;
    float _676 = floor(_652);
    float _678 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _680 = _674 + (-1.0);
    int _682 = _668 ? 0 : 1;
    float _684 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _686 = !_624;
    int _688 = _686 ? 0 : 1;
    float _690 = floor(_670);
    int _692 = ~_682;
    int _694 = _692 + 1;
    int _696 = _694 + 1;
    float _698 = -_656;
    float _700 = _698 + 1.0;
    int _702 = _696;
    if (!_654)
    {
        int _704 = ~_682;
        int _706 = _704 + 1;
        _702 = _706;
    }
    int _708 = _702;
    bool _710 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _712 = isnan(1.0);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _718 = _714 || _716;
    bool _720 = !_620;
    int _722 = _720 ? 0 : 1;
    bool _724 = _676 > 0.0;
    bool _726 = _676 >= 0.0;
    bool _728 = isnan(_676);
    bool _730 = _726 || _728;
    bool _732 = isnan(0.0);
    bool _734 = _730 || _732;
    int _736 = abs(_688);
    float _738 = in.m_53.x;
    float _740 = in.m_53.y;
    float _742 = in.m_53.z;
    float _744 = _642 ? _700 : 0.0;
    float _746 = float(_736);
    float _748 = float(_708);
    if (_718)
    {
        float _750 = _744 * _650;
        _132 = _750;
    }
    float _752 = _132;
    int _754 = _734 ? 0 : 1;
    float _756 = _630 + (-0.5);
    int _758 = abs(_722);
    float _760 = _746 * _748;
    int _762 = ~_754;
    int _764 = _762 + 1;
    int _766 = _764 + 1;
    int _768 = _766;
    if (!_724)
    {
        int _770 = ~_754;
        int _772 = _770 + 1;
        _768 = _772;
    }
    int _774 = _768;
    float _776 = _760 * (-2.0);
    bool _778 = _690 > 0.0;
    bool _780 = !_628;
    int _782 = _780 ? 0 : 1;
    float _784 = float(_758);
    float _786 = float(_774);
    float _788 = fma(_776, _740, _740);
    bool _790 = _690 >= 0.0;
    bool _792 = isnan(_690);
    bool _794 = _790 || _792;
    bool _796 = isnan(0.0);
    bool _798 = _794 || _796;
    float _800 = fma(_684, _776, _684);
    int _802 = abs(_782);
    float _804 = _784 * _786;
    int _806 = _798 ? 0 : 1;
    float _808 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[196].y, _788);
    float _810 = _804 * (-2.0);
    int _812 = ~_806;
    int _814 = _812 + 1;
    int _816 = _814 + 1;
    float _818 = _152 + (-0.5);
    int _820 = _816;
    float _822 = _690;
    if (!_778)
    {
        int _824 = ~_806;
        int _826 = _824 + 1;
        _820 = _826;
    }
    int _828 = _820;
    float _830 = fma(_810, _738, _738);
    float _832 = fma(_800, _752, _808);
    float _834 = float(_802);
    float _836 = fma(_678, _810, _678);
    float _838 = float(_828);
    float _840 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[196].x, _830);
    float _842 = _152 + _610;
    float _844 = _832 * 0.15915493667125701904296875;
    bool _846 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _848 = isnan(0.5);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _854 = _850 || _852;
    float _856 = _834 * _838;
    float _858 = fma(_836, _752, _840);
    float _860 = _842 + (-1.0);
    float _862 = _856 * (-2.0);
    float _864 = in.m_51.x;
    float _866 = in.m_51.y;
    float _868 = in.m_51.z;
    float _870 = _844 * 6.283185482025146484375;
    float _872 = sin(_870);
    float _874 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _876 = fma(_862, _742, _742);
    float _878 = _610 + (-0.5);
    float _880 = in.m_55.x;
    float _882 = in.m_55.y;
    float _884 = in.m_55.z;
    float _886 = fma(_874, _862, _874);
    float _888 = _858 * 0.15915493667125701904296875;
    float _890 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[196].z, _876);
    float _892 = _844 * 6.283185482025146484375;
    float _894 = cos(_892);
    float _896 = fma(_886, _752, _890);
    float _898 = _888 * 6.283185482025146484375;
    float _900 = cos(_898);
    float _902 = _896 * 0.15915493667125701904296875;
    float _904 = _576 * _864;
    float _906 = _888 * 6.283185482025146484375;
    float _908 = sin(_906);
    float _910 = _578 * _866;
    float _912 = _580 * _868;
    float _914 = _904 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _916 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _880);
    float _918 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _882);
    float _920 = _910 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _884);
    float _924 = _902 * 6.283185482025146484375;
    float _926 = cos(_924);
    float _928 = _916 * _914;
    float _930 = _912 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _932 = _918 * _920;
    float _934 = _900 * _894;
    float _936 = _900 * _872;
    float _938 = _922 * _930;
    float _940 = _902 * 6.283185482025146484375;
    float _942 = sin(_940);
    float _944 = _908 * _872;
    float _946 = _908 * _894;
    float _948 = _900 * _926;
    float _950 = _908 * _926;
    float _952 = _894 * _926;
    float _954 = _872 * _926;
    float _956 = _948 * _932;
    float _958 = fma(_942, _934, _944);
    float _960 = -_936;
    float _962 = fma(_942, _946, _960);
    float _964 = -_946;
    float _966 = fma(_942, _936, _964);
    float _968 = -_932;
    float _970 = _942 * _968;
    float _972 = _950 * _932;
    float _974 = fma(_958, _928, _956);
    float _976 = fma(_942, _944, _934);
    float _978 = fma(_952, _928, _970);
    float _980 = fma(_962, _928, _972);
    float _982 = fma(_966, _938, _974);
    float _984 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _986 = fma(_954, _938, _978);
    float _988 = fma(_976, _938, _980);
    float _990 = _982 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _992 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[6].x, _984);
    float _994 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _996 = _982 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _998 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[26].x, _990);
    float _1000 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[6].z, _992);
    float _1002 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[4].x, _994);
    float _1004 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[24].x, _996);
    float _1006 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[26].z, _998);
    float _1008 = _1000 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1010 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1002);
    float _1012 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1004);
    float _1014 = _1006 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1016 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1018 = _1010 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1020 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1022 = _1008 + _1014;
    float _1024 = _982 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1026 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1016);
    float _1028 = _1018 + _1020;
    float _1030 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1032 = _1022 + _1030;
    float _1034 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1024);
    float _1036 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1026);
    float _1038 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1040 = _1028 + _1038;
    float _1042 = _1032 * _1032;
    float _1044 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1034);
    float _1046 = _1036 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1048 = fma(_1040, _1040, _1042);
    float _1050 = _1044 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1052 = sqrt(_1048);
    float _1054 = _1046 + _1050;
    bool _1056 = _1052 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1058 = _1050;
    float _1060 = _1036;
    float _1062 = _1028;
    float _1064 = _1040;
    float _1066 = _988;
    float _1068 = _1046;
    float _1070 = _1008;
    if (!_1056)
    {
        _1058 = _1028;
    }
    float _1072 = _1058;
    float _1074 = _1072;
    if (!_1056)
    {
        _1060 = _1022;
    }
    float _1076 = _1060;
    float _1078 = _1076;
    if (!_1056)
    {
        _1062 = _1054;
    }
    float _1080 = _1062;
    bool _1082 = !_1056;
    float _1084 = _1080;
    if (!_1082)
    {
        float _1086 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1090 = _1052 + _1088;
        float _1092 = _1054 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1094 = rsqrt(_1048);
        float _1096 = _1090 * _1086;
        float _1098 = _1096 * 0.15915493667125701904296875;
        float _1100 = _1098 * 6.283185482025146484375;
        float _1102 = sin(_1100);
        float _1104 = _1098 * 6.283185482025146484375;
        float _1106 = cos(_1104);
        float _1108 = fma(_1102, _1092, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1110 = _1094 * _1108;
        float _1112 = _1106 + (-1.0);
        float _1114 = fma(_1040, _1110, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1116 = fma(_1032, _1110, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1118 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1120 = fma(_1054, _1106, _1118);
        _1074 = _1114;
        _1078 = _1116;
        _1084 = _1120;
    }
    float _1122 = _1074;
    float _1124 = _1078;
    float _1126 = _1084;
    float _1128 = _1126;
    float _1130 = _1122;
    float _1132 = _1124;
    if (!_854)
    {
        float _1134 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1136 = _1046 + _1134;
        float _1138 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1140 = _1018 + _1138;
        float _1142 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1144 = -_1018;
        float _1146 = _1144 + _1122;
        float _1148 = _1136 * _1136;
        float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1152 = _1008 + _1150;
        float _1154 = -_1008;
        float _1156 = _1154 + _1124;
        float _1158 = fma(_1140, _1140, _1148);
        float _1160 = fma(_1152, _1152, _1158);
        float _1162 = sqrt(_1160);
        float _1164 = precise::min(_1162, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1166 = _1164 * _1142;
        float _1168 = -_1046;
        float _1170 = _1168 + _1126;
        float _1172 = fma(_1146, _1166, _1018);
        float _1174 = fma(_1170, _1166, _1046);
        float _1176 = fma(_1156, _1166, _1008);
        _1128 = _1174;
        _1130 = _1172;
        _1132 = _1176;
    }
    float _1178 = _1128;
    float _1180 = _1130;
    float _1182 = _1132;
    float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1186 = _1178 + _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1190 = _1180 + _1188;
    float _1192 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1194 = _1182 + _1192;
    float _1196 = _1186 * _1186;
    float _1198 = fma(_1190, _1190, _1196);
    float _1200 = fma(_1194, _1194, _1198);
    float _1202 = rsqrt(_1200);
    float _1204 = sqrt(_1200);
    float _1206 = _1202 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1208 = _1190 * _1206;
    float _1210 = _1194 * _1206;
    float _1212 = _1208 * _1208;
    float _1214 = _1210 * _1210;
    float _1216 = _1212 + _1214;
    float _1218 = sqrt(_1216);
    bool _1220 = _1218 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1224 = _1218 + _1222;
    float _1226 = _1194;
    float _1228 = _1224;
    float _1230 = _1186;
    if (_1220)
    {
        float _1232 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1226 = _1232;
    }
    float _1234 = _1226;
    if (_1220)
    {
        float _1236 = rsqrt(_1216);
        _1064 = _1236;
    }
    float _1238 = _1064;
    float _1240 = _1238;
    if (_1220)
    {
        float _1242 = _1224 * _1234;
        _1228 = _1242;
    }
    float _1244 = _1228;
    if (_1220)
    {
        float _1246 = _1244 * 0.15915493667125701904296875;
        _1066 = _1246;
    }
    float _1248 = _1066;
    float _1250 = _1196;
    if (_1220)
    {
        float _1252 = _1248 * 6.283185482025146484375;
        float _1254 = sin(_1252);
        _1250 = _1254;
    }
    float _1256 = _1250;
    float _1258 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1260 = precise::max(0.0, _1258);
    float _1262 = _1202;
    float _1264 = _1260;
    float _1266 = _1258;
    if (_1220)
    {
        float _1268 = _1248 * 6.283185482025146484375;
        float _1270 = cos(_1268);
        _1262 = _1270;
    }
    float _1272 = _1262;
    float _1274 = -_1206;
    float _1276 = -_1260;
    float _1278 = fma(_1186, _1274, _1276);
    if (!_1220)
    {
        _1264 = _1208;
    }
    float _1280 = _1264;
    float _1282 = _1280;
    if (_1220)
    {
        float _1284 = _1278 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1266 = _1284;
    }
    float _1286 = _1266;
    float _1288 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1290 = _1256;
    float _1292 = _1286;
    if (_1220)
    {
        float _1294 = fma(_1256, _1286, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1230 = _1294;
    }
    float _1296 = _1230;
    float _1298 = _1296;
    if (!_1220)
    {
        _1290 = _1212;
    }
    float _1300 = _1290;
    float _1302 = _1300;
    float _1304 = _1272;
    if (_1220)
    {
        float _1306 = _1272 + (-1.0);
        _1292 = _1306;
    }
    float _1308 = _1292;
    float _1310 = _1308;
    if (_1220)
    {
        float _1312 = _1238 * _1296;
        _822 = _1312;
    }
    float _1314 = _822;
    if (!_1220)
    {
        _1298 = _1278;
    }
    float _1316 = _1298;
    float _1318 = _1316;
    if (_1220)
    {
        float _1320 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1240 = _1320;
    }
    float _1322 = _1240;
    if (_1220)
    {
        float _1324 = _1208 * _1314;
        _1282 = _1324;
    }
    float _1326 = _1282;
    if (!_1220)
    {
        _1310 = _1210;
    }
    float _1328 = _1310;
    float _1330 = _1328;
    if (_1220)
    {
        float _1332 = _1210 * _1314;
        _1330 = _1332;
    }
    float _1334 = _1330;
    if (_1220)
    {
        float _1336 = fma(_1278, _1272, _1322);
        _1318 = _1336;
    }
    float _1338 = _1318;
    if (_1220)
    {
        float _1340 = _1326 * _1326;
        _1302 = _1340;
    }
    float _1342 = _1302;
    if (!_1220)
    {
        _1304 = _1214;
    }
    float _1344 = _1304;
    float _1346 = _1344;
    if (_1220)
    {
        float _1348 = _1334 * _1334;
        _1346 = _1348;
    }
    float _1350 = _1346;
    float _1352 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1354 = fma(_1204, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1352);
    float _1356 = precise::clamp(_1354, 0.0, 1.0);
    float _1358 = fma(_1338, _1338, _1342);
    float _1360 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1362 = -_1356;
    float _1364 = _1362 + 1.0;
    float _1366 = _1358 + _1350;
    float _1368 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1360);
    float _1370 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1372 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1374 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1376 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1368);
    float _1378 = rsqrt(_1366);
    float _1380 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1370);
    float _1382 = _1376 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1384 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1372);
    float _1386 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1380);
    float _1388 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1374);
    float _1390 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1392 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1384);
    float _1394 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1396 = abs(_1364);
    float _1398 = log2(_1396);
    float _1400 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1388);
    float _1402 = _1392 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1404 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1406 = -_1390;
    float _1408 = fma(_1406, _1288, 1.0);
    float _1410 = _1400 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1412 = _1378 * _1326;
    float _1414 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1404);
    float _1416 = _1378 * _1338;
    float _1418 = _1378 * _1334;
    float _1420 = _1412 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1422 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1414);
    float _1424 = log2(_1408);
    float _1426 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1428 = -_1420;
    float _1430 = fma(_1416, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1428);
    float _1432 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1422);
    float _1434 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1436 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1438 = -_1418;
    float _1440 = fma(_1438, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1430);
    float _1442 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1426);
    float _1444 = exp2(_1434);
    float _1446 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1436);
    float _1448 = fma(_1440, -0.5, 0.5);
    float _1450 = fma(_1440, 0.5, 0.5);
    float _1452 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1442);
    float _1454 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1446);
    float _1456 = _1416 + 1.0;
    float _1458 = 1.0 / _1432;
    float _1460 = fma(_1450, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1462 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1454);
    float _1464 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1452);
    float _1466 = _1424 * 0.693147182464599609375;
    float _1468 = fma(_1450, _1460, -0.212114393711090087890625);
    float _1470 = sqrt(_1448);
    float _1472 = -_1416;
    float _1474 = fma(_1444, _1456, _1472);
    float _1476 = fma(_1450, _1468, 1.570728778839111328125);
    float _1478 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1480 = fma(_1474, 0.5, 0.5);
    float _1482 = _1462 * _1458;
    float _1484 = _1464 * _1458;
    float _1486 = fma(_1482, 0.5, 0.5);
    float _1488 = fma(_1484, -0.5, 0.5);
    float _1490 = _1470 * 0.636619746685028076171875;
    float3 _4298 = float3(_1486, _1488, _1478);
    float _1492 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4298, float3(0.0), isnan(_4298)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4298, float3(0.0), isnan(_4298)), level(0.0)).x;
    float _1494 = -_1476;
    float _1496 = fma(_1490, _1494, 1.0);
    float3 _4314 = float3(_1486, _1488, _1478);
    float4 _1499 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4314, float3(0.0), isnan(_4314)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4314, float3(0.0), isnan(_4314)), level(0.0)).xyzw;
    float _1501 = _1499.x;
    float _1503 = _1499.y;
    float _1505 = _1499.z;
    float _1507 = _1499.w;
    float2 _4331 = float2(_1496, _1480);
    float3 _1511 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4331, float2(0.0), isnan(_4331)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4331, float2(0.0), isnan(_4331)), level(0.0)).xyz;
    float _1513 = _1511.x;
    float _1515 = _1511.y;
    float _1517 = _1511.z;
    float _1519 = in.m_49.w;
    float _1521 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1523 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1525 = isnan(0.5);
    bool _1527 = _1523 || _1525;
    bool _1529 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1531 = _1527 || _1529;
    float _1533 = in.m_57.y;
    int _1535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1537 = _1535 != 0;
    float _1539 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1543 = _1541 != 0;
    float _1545 = exp2(_1521);
    int _1547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1549 = _1547 != 0;
    int _1551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1553 = _1551 != 0;
    float _1555 = in.m_57.x;
    bool _1557 = _630 > 0.5;
    float _1559 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1561 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1563 = _1559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1565 = _1519 > 0.5;
    float _1567 = -_1545;
    float _1569 = _1567 + 1.0;
    float _1571 = -_1533;
    float _1573 = _1571 + 1.0;
    bool _1575 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1577 = isnan(_608);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1583 = _1579 || _1581;
    float _1585 = float(_1583);
    float _1587 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1589 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1587;
    int _1591 = _1565 ? as_type<int>(_1573) : as_type<int>(_1533);
    float _1593 = 1.0 / _1589;
    bool _1595 = _1565;
    bool _1597 = _1543;
    float _1599 = _1533;
    if (_1537)
    {
        bool _1601 = _152 > 0.5;
        _1595 = _1601;
    }
    bool _1603 = _1595;
    float _1605 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1607 = _1543 ? as_type<float>(_1591) : _1533;
    float _1609 = _1605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1549)
    {
        bool _1611 = _610 > 0.5;
        _1597 = _1611;
    }
    bool _1613 = _1597;
    float _1615 = _1607 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1617 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1619 = _608 + _1617;
    float _1621 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1623 = (*spvDescriptorSet0.vp_c9)._m0[108].y;
    if (_1553)
    {
        float _1625 = _1557 ? _1573 : _1533;
        _1599 = _1625;
    }
    float _1627 = _1599;
    float _1629 = _1621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1631 = 0.0;
    if (!_1537)
    {
        _1631 = _1555;
    }
    float _1633 = _1631;
    float _1635 = _1619 * _1593;
    float _1637 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1639 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1637;
    float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1643 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1641;
    out.m_59.x = _1629;
    out.m_59.y = _1563;
    out.m_59.z = _1609;
    out.m_59.w = _1561;
    float _1645 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1647 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1645;
    bool _1649 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1651 = isnan(_608);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = fma(_1639, _1635, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1663 = fma(_1643, _1635, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _1665 = _882 != 0.0;
    bool _1667 = isnan(_882);
    bool _1669 = _1665 || _1667;
    bool _1671 = isnan(0.0);
    bool _1673 = _1669 || _1671;
    float _1675 = in.m_61.x;
    float _1677 = in.m_61.y;
    float _1679 = in.m_61.z;
    float _1681 = _1633;
    int _1683 = as_type<int>(_1663);
    if (!_1537)
    {
        _1623 = _1633;
    }
    float _1685 = _1623;
    float _1687 = fma(_1647, _1635, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1689 = _1685;
    if (_1537)
    {
        _1681 = _1555;
    }
    float _1691 = _1681;
    float _1693 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1695 = _880 == 0.0;
    bool _1697 = !_1673;
    bool _1699 = _1695 && _1697;
    float _1701 = 0.0;
    float _1703 = _1693;
    if (!_1531)
    {
        _1701 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1705 = _1701;
    float _1707 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1709 = -_1659;
    float _1711 = _1709 + 1.0;
    bool _1713 = _884 == 0.0;
    bool _1715 = _1713 && _1699;
    float _1717 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1707);
    float _1719 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1721 = _1585 * _1711;
    int _1723 = as_type<int>(_1721);
    float _1725 = _1705;
    if (!_1549)
    {
        _1068 = _1691;
    }
    float _1727 = _1068;
    float _1729 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1717);
    float _1731 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1719);
    float _1733 = _1663 * _1721;
    float _1735 = _1727;
    if (_1549)
    {
        float _1737 = -_1691;
        float _1739 = _1737 + 1.0;
        _1683 = as_type<int>(_1739);
    }
    int _1741 = _1683;
    float _1743 = _1729 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1745 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1731);
    float _1747 = _1661 * _1721;
    float _1749 = _1687 * _1721;
    float _1751 = 1.0 / _1743;
    float _1753 = _1743;
    float _1755 = _1745;
    if (_1537)
    {
        float _1757 = -_1691;
        float _1759 = _1757 + 1.0;
        _1723 = as_type<int>(_1759);
    }
    int _1761 = _1723;
    if (_1549)
    {
        float _1763 = _1613 ? as_type<float>(_1741) : _1691;
        _1735 = _1763;
    }
    float _1765 = _1735;
    float _1767 = _1745 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1769 = -_1585;
    float _1771 = _1769 + 1.0;
    float _1773 = _1771;
    if (_1715)
    {
        _1070 = _1675;
    }
    float _1775 = _1070;
    float _1777 = _1775;
    if (!_1715)
    {
        float _1779 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1675);
        _1777 = _1779;
    }
    float _1781 = _1777;
    if (_1537)
    {
        float _1783 = _1603 ? as_type<float>(_1761) : _1691;
        _1689 = _1783;
    }
    float _1785 = _1689;
    float _1787 = _1767 + _1743;
    float _1789 = fma(_1771, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1747);
    float _1791 = fma(_1771, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1733);
    float _1793 = fma(_1771, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1749);
    float _1795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1797 = _1791;
    float _1799 = _1793;
    if (_1715)
    {
        _1773 = _1679;
    }
    float _1801 = _1773;
    float _1803 = in.m_63.x;
    float _1805 = in.m_63.y;
    float _1807 = in.m_63.z;
    float _1809 = in.m_63.w;
    float _1811 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1789);
    float _1813 = _1787 * _1751;
    float _1815 = _1813 * 0.5;
    float _1817 = _1801;
    if (_1715)
    {
        _1753 = _1801;
    }
    float _1819 = _1753;
    float _1821 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1823 = _1819;
    if (!_1715)
    {
        _1817 = _1679;
    }
    float _1825 = _1817;
    if (!_1531)
    {
        float _1827 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1829 = fma(_1815, _1705, _1827);
        _1725 = _1829;
    }
    float _1831 = _1725;
    float _1833 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1791);
    if (!_1531)
    {
        _1797 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1835 = _1797;
    float _1837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1839 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1793);
    float _1841 = _1835;
    if (_1715)
    {
        _1755 = _1677;
    }
    float _1843 = _1755;
    float _1845 = _1843;
    if (!_1715)
    {
        float _1847 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1677);
        _1845 = _1847;
    }
    float _1849 = _1845;
    if (!_1531)
    {
        float _1851 = -_1835;
        float _1853 = _1851 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1799 = _1853;
    }
    float _1855 = _1799;
    float _1857 = _1615 * _1795;
    if (!_1715)
    {
        float _1859 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1825);
        _1823 = _1859;
    }
    float _1861 = _1823;
    float _1863 = _1765 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1865 = _1831;
    if (!_1531)
    {
        float _1867 = 1.0 / _1831;
        _1865 = _1867;
    }
    float _1869 = _1865;
    float _1871 = _1803 * _1677;
    float _1873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1875 = _1821 * _1837;
    float _1877 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1879 = _1805 * _1825;
    float _1881 = _1807 * _1675;
    float _1883 = -_1871;
    float _1885 = fma(_1805, _1675, _1883);
    float _1887 = _1877 * _1693;
    if (_1531)
    {
        _1703 = 1.0;
    }
    float _1889 = _1703;
    float _1891 = _1615;
    float _1893 = _1889;
    if (!_1531)
    {
        float _1895 = 1.0 / _1855;
        _1891 = _1895;
    }
    float _1897 = _1891;
    if (!_1531)
    {
        float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1901 = -_1835;
        float _1903 = fma(_1869, _1899, _1901);
        _1841 = _1903;
    }
    float _1905 = _1841;
    float _1907 = -_1879;
    float _1909 = fma(_1807, _1677, _1907);
    float _1911 = _1833 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1913 = -_1881;
    float _1915 = fma(_1803, _1825, _1913);
    float _1917 = _1811 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1919 = _1839 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1921 = _1863 * _1873;
    float _1923 = _948 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1925 = _1917 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1927 = _1911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1929 = _1919 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _1887;
    out.m_65.y = _1875;
    out.m_65.z = _1921;
    out.m_65.w = _1857;
    float _1931 = _1915 * _1809;
    float _1933 = -_942;
    float _1935 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1923);
    if (!_1531)
    {
        float _1937 = _1905 * _1897;
        float _1939 = precise::clamp(_1937, 0.0, 1.0);
        _1893 = _1939;
    }
    float _1941 = _1893;
    float _1943 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1945 = _958 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1947 = _1941 > 0.0;
    bool _1949 = isnan(_1941);
    bool _1951 = _1947 || _1949;
    bool _1953 = isnan(0.0);
    bool _1955 = _1951 || _1953;
    out.m_67.x = _1925;
    out.m_67.y = _1927;
    out.m_67.z = _1929;
    out.m_67.w = _1943;
    float _1957 = _1941 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1959 = _948 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1961 = _958 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1963 = _1909 * _1809;
    float _1965 = _360 * _1957;
    float _1967 = _948 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1969 = _958 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1971 = _1885 * _1809;
    float _1973 = -_942;
    float _1975 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1959);
    float _1977 = -_942;
    float _1979 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1967);
    float _1981 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1961);
    float _1983 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1969);
    float _1985 = _966 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1987 = _966 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1989 = _966 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1991 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1979);
    float _1993 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1975);
    float _1995 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1945);
    float _1997 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1935);
    float _1999 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1985);
    float _2001 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1987);
    float _2003 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1989);
    float _2005 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1981);
    float _2007 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1983);
    float _2009 = _1991 * _1805;
    float _2011 = _1993 * _1805;
    float _2013 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1995);
    float _2015 = _1997 * _1805;
    float _2017 = _1993 * _1849;
    float _2019 = _1931 * _1993;
    float _2021 = _1991 * _1849;
    float _2023 = _1931 * _1991;
    float _2025 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1999);
    float _2027 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2001);
    float _2029 = fma(_2005, _1803, _2009);
    float _2031 = fma(_2007, _1803, _2011);
    float _2033 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2003);
    float _2035 = fma(_2013, _1803, _2015);
    float _2037 = fma(_1963, _2005, _2023);
    float _2039 = fma(_2025, _1807, _2029);
    float _2041 = fma(_2027, _1807, _2031);
    float _2043 = fma(_2033, _1807, _2035);
    float _2045 = fma(_2005, _1781, _2021);
    float _2047 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1539);
    float _2049 = fma(_2007, _1781, _2017);
    float _2051 = _1931 * _1997;
    float _2053 = fma(_2025, _1861, _2045);
    out.m_69.x = _2039;
    out.m_69.y = _2041;
    out.m_69.z = _2043;
    float _2055 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2047);
    float _2057 = fma(_2027, _1861, _2049);
    float _2059 = fma(_1963, _2007, _2019);
    float _2061 = fma(_1963, _2013, _2051);
    float _2063 = _1997 * _1849;
    float _2065 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2055);
    float _2067 = fma(_1971, _2025, _2037);
    float _2069 = fma(_1971, _2027, _2059);
    float _2071 = fma(_1971, _2033, _2061);
    float _2073 = fma(_2013, _1781, _2063);
    float _2075 = _2065 + _1432;
    float _2077 = _1569 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1462;
    out.gl_Position.y = _1464;
    out.gl_Position.z = _2065;
    out.gl_Position.w = _1432;
    float _2079 = fma(_2033, _1861, _2073);
    float _2081 = -_2077;
    float _2083 = _2081 + 1.0;
    out.m_71.x = _2067;
    out.m_71.y = _2069;
    out.m_71.z = _2071;
    float _2085 = _2075 * 0.5;
    float _2087 = _1965 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = _2053;
    out.m_73.y = _2057;
    out.m_73.z = _2079;
    out.m_75.z = _2085;
    out.m_75.w = _1432;
    out.m_45.x = _2087;
    float _2089 = _2077 * _1492;
    float _2091 = _1507 * _2089;
    float _2093 = _1507 * _2083;
    float _2095 = _1517 * _2089;
    float _2097 = fma(_1513, _2091, _1501);
    float _2099 = fma(_1515, _2091, _1503);
    float _2101 = fma(_1507, _2095, _1505);
    out.m_77.x = _2097;
    out.m_77.y = _2099;
    out.m_77.z = _2101;
    out.m_77.w = _2093;
    if (_1955)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2103 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2103;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _600 = false;
    bool _380 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2160 = as_type<float>(_112);
        out.gl_Position.z = _2160;
    }
    if (!_100)
    {
        return out;
    }
    float _116 = in.m_47.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = _130;
    if (_126)
    {
        float _134 = float(_96);
        _106 = _134;
    }
    float _136 = _106;
    bool _138 = _130 >= _136;
    bool _140 = !_126;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_45.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _114 = as_type<int>(_148);
    }
    int _150 = _114;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2230 = as_type<float>(_150);
        out.gl_Position.z = _2230;
    }
    if (_142)
    {
        return out;
    }
    float _152 = in.m_49.x;
    float _154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _156 = _130 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _158 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    int _170 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _172 = _170 != 0;
    float _174 = _156 * _154;
    float _176 = 0.0;
    float _178 = _158;
    if (!_168)
    {
        float _180 = _158 * _158;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[20].x, _174);
    float _188 = _184;
    if (!_168)
    {
        float _190 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    float _194 = in.m_47.x;
    float _196 = in.m_47.y;
    float _198 = in.m_47.z;
    float _200 = _186 * 6.283185482025146484375;
    float _202 = floor(_186);
    float _204 = _200 * 0.15915493667125701904296875;
    float _206 = _204 * 6.283185482025146484375;
    float _208 = cos(_206);
    float _210 = -_202;
    float _212 = _186 + _210;
    bool _214 = !_168;
    float _216 = _192;
    if (!_214)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _158 * _220;
        float _230 = 1.0 / _224;
        float _232 = _226 * 0.693147182464599609375;
        float _234 = exp2(_228);
        float _236 = 1.0 / _232;
        float _238 = _234 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _236, _158);
        float _244 = _242 * _230;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _246;
    }
    float _248 = _216;
    bool _250 = !_168;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _158 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _178 = _270;
    }
    float _272 = _178;
    float _274 = in.m_51.w;
    int _276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _278 = _276 != 0;
    int _280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _282 = _280 != 0;
    float _284 = in.m_42.x;
    float _286 = in.m_42.y;
    float _288 = in.m_42.z;
    float _290 = -_212;
    float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _294 = _212 < 0.5;
    float _296 = float(_294);
    bool _298 = !_278;
    int _300 = _298 ? 0 : 1;
    float _302 = fma(_208, 0.5, 0.5);
    bool _304 = !_172;
    int _306 = _304 ? 0 : 1;
    float _308 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _310 = abs(_300);
    float _312 = -_296;
    float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _316 = -_302;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _320 = fma(_272, _194, _308);
    int _322 = abs(_306);
    float _324 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _326 = !_282;
    int _328 = _326 ? 0 : 1;
    float _330 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _334 = abs(_328);
    float _336 = fma(_272, _196, _324);
    float _338 = float(_310);
    float _340 = fma(_272, _198, _330);
    float _342 = float(_322);
    float _344 = abs(_292);
    float _346 = _338 * _344;
    float _348 = float(_334);
    float _350 = fma(_342, _318, _346);
    float _352 = fma(_320, _274, _284);
    float _354 = fma(_336, _274, _286);
    float _356 = fma(_340, _274, _288);
    float _358 = abs(_314);
    float _360 = fma(_348, _358, _350);
    bool _362 = !_332;
    float _378;
    if (!_362)
    {
        float _364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _366 = _152 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _368 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _370 = _368 * _364;
        float _372 = floor(_370);
        float _374 = -_372;
        float _376 = _370 + _374;
        _378 = _376;
        _380 = true;
    }
    else
    {
        float _382 = float(_96);
        float _384 = 1.0 / _382;
        float _386 = _130 * _384;
        _378 = _386;
    }
    _380 = false;
    float _388 = _378;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _392 = _388 + _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _396 = _388 + _394;
    bool _398 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _400 = isnan(_388);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _416 = _388 + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _426 = 1.0 / _412;
    bool _428 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _430 = 1.0 / _420;
    float _432 = 1.0 / _424;
    float _434 = _392 * _426;
    bool _436 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _438 = isnan(_388);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _444 = _440 || _442;
    float _446 = float(_444);
    float _448 = -_408;
    float _450 = _448 + 1.0;
    float _452 = _446 * _450;
    float _454 = _396 * _430;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _460;
    bool _464 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _466 = isnan(_388);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = -_446;
    float _478 = _476 + 1.0;
    float _480 = fma(_458, _454, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _482 = fma(_462, _454, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _488 = _416 * _432;
    bool _490 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _492 = isnan(_388);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _510 = fma(_486, _488, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _512 = fma(_504, _454, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _514 = -_500;
    float _516 = _514 + 1.0;
    float _518 = _500 * _478;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _524 = fma(_508, _488, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _526 = _474 * _516;
    float _528 = -_474;
    float _530 = _528 + 1.0;
    float _532 = fma(_522, _488, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _534 = _480 * _526;
    float _536 = _482 * _526;
    float _538 = _512 * _526;
    float _540 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[143].x, _534);
    float _542 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[143].y, _536);
    float _544 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[143].z, _538);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _546;
    float _550 = fma(_524, _518, _540);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _556;
    float _560 = fma(_548, _434, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _562 = fma(_532, _518, _542);
    float _564 = fma(_554, _434, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _566 = fma(_558, _434, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _568 = fma(_510, _518, _544);
    float _570 = fma(_560, _452, _550);
    float _572 = fma(_564, _452, _562);
    float _574 = fma(_566, _452, _568);
    float _576 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[146].x, _570);
    float _578 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[146].y, _572);
    float _580 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[146].z, _574);
    bool _582 = !_428;
    float _598;
    if (!_582)
    {
        float _584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _586 = _152 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _588 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _590 = _588 * _584;
        float _592 = floor(_590);
        float _594 = -_592;
        float _596 = _590 + _594;
        _598 = _596;
        _600 = true;
    }
    else
    {
        float _602 = float(_96);
        float _604 = 1.0 / _602;
        float _606 = _130 * _604;
        _598 = _606;
    }
    _600 = false;
    float _608 = _598;
    float _610 = in.m_49.z;
    float _612 = _152 * 2.0;
    float _614 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _616 = log2(_614);
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _620 = _618 != 0;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _624 = _622 != 0;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _628 = _626 != 0;
    float _630 = in.m_49.y;
    float _632 = floor(_612);
    bool _634 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _636 = isnan(0.0);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _642 = _638 || _640;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _646 = 1.0 + _644;
    float _648 = _616 * _130;
    float _650 = 1.0 / _646;
    float _652 = _610 * 2.0;
    bool _654 = _632 > 0.0;
    float _656 = exp2(_648);
    float _658 = _152 + _630;
    bool _660 = _632 >= 0.0;
    bool _662 = isnan(_632);
    bool _664 = _660 || _662;
    bool _666 = isnan(0.0);
    bool _668 = _664 || _666;
    float _670 = _630 * 2.0;
    float _672 = _658 + (-1.0);
    float _674 = _630 + _610;
    float _676 = floor(_652);
    float _678 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _680 = _674 + (-1.0);
    int _682 = _668 ? 0 : 1;
    float _684 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _686 = !_624;
    int _688 = _686 ? 0 : 1;
    float _690 = floor(_670);
    int _692 = ~_682;
    int _694 = _692 + 1;
    int _696 = _694 + 1;
    float _698 = -_656;
    float _700 = _698 + 1.0;
    int _702 = _696;
    if (!_654)
    {
        int _704 = ~_682;
        int _706 = _704 + 1;
        _702 = _706;
    }
    int _708 = _702;
    bool _710 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _712 = isnan(1.0);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _718 = _714 || _716;
    bool _720 = !_620;
    int _722 = _720 ? 0 : 1;
    bool _724 = _676 > 0.0;
    bool _726 = _676 >= 0.0;
    bool _728 = isnan(_676);
    bool _730 = _726 || _728;
    bool _732 = isnan(0.0);
    bool _734 = _730 || _732;
    int _736 = abs(_688);
    float _738 = in.m_53.x;
    float _740 = in.m_53.y;
    float _742 = in.m_53.z;
    float _744 = _642 ? _700 : 0.0;
    float _746 = float(_736);
    float _748 = float(_708);
    if (_718)
    {
        float _750 = _744 * _650;
        _132 = _750;
    }
    float _752 = _132;
    int _754 = _734 ? 0 : 1;
    float _756 = _630 + (-0.5);
    int _758 = abs(_722);
    float _760 = _746 * _748;
    int _762 = ~_754;
    int _764 = _762 + 1;
    int _766 = _764 + 1;
    int _768 = _766;
    if (!_724)
    {
        int _770 = ~_754;
        int _772 = _770 + 1;
        _768 = _772;
    }
    int _774 = _768;
    float _776 = _760 * (-2.0);
    bool _778 = _690 > 0.0;
    bool _780 = !_628;
    int _782 = _780 ? 0 : 1;
    float _784 = float(_758);
    float _786 = float(_774);
    float _788 = fma(_776, _740, _740);
    bool _790 = _690 >= 0.0;
    bool _792 = isnan(_690);
    bool _794 = _790 || _792;
    bool _796 = isnan(0.0);
    bool _798 = _794 || _796;
    float _800 = fma(_684, _776, _684);
    int _802 = abs(_782);
    float _804 = _784 * _786;
    int _806 = _798 ? 0 : 1;
    float _808 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[196].y, _788);
    float _810 = _804 * (-2.0);
    int _812 = ~_806;
    int _814 = _812 + 1;
    int _816 = _814 + 1;
    float _818 = _152 + (-0.5);
    int _820 = _816;
    float _822 = _690;
    if (!_778)
    {
        int _824 = ~_806;
        int _826 = _824 + 1;
        _820 = _826;
    }
    int _828 = _820;
    float _830 = fma(_810, _738, _738);
    float _832 = fma(_800, _752, _808);
    float _834 = float(_802);
    float _836 = fma(_678, _810, _678);
    float _838 = float(_828);
    float _840 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[196].x, _830);
    float _842 = _152 + _610;
    float _844 = _832 * 0.15915493667125701904296875;
    bool _846 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _848 = isnan(0.5);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _854 = _850 || _852;
    float _856 = _834 * _838;
    float _858 = fma(_836, _752, _840);
    float _860 = _842 + (-1.0);
    float _862 = _856 * (-2.0);
    float _864 = in.m_51.x;
    float _866 = in.m_51.y;
    float _868 = in.m_51.z;
    float _870 = _844 * 6.283185482025146484375;
    float _872 = sin(_870);
    float _874 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _876 = fma(_862, _742, _742);
    float _878 = _610 + (-0.5);
    float _880 = in.m_55.x;
    float _882 = in.m_55.y;
    float _884 = in.m_55.z;
    float _886 = fma(_874, _862, _874);
    float _888 = _858 * 0.15915493667125701904296875;
    float _890 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[196].z, _876);
    float _892 = _844 * 6.283185482025146484375;
    float _894 = cos(_892);
    float _896 = fma(_886, _752, _890);
    float _898 = _888 * 6.283185482025146484375;
    float _900 = cos(_898);
    float _902 = _896 * 0.15915493667125701904296875;
    float _904 = _576 * _864;
    float _906 = _888 * 6.283185482025146484375;
    float _908 = sin(_906);
    float _910 = _578 * _866;
    float _912 = _580 * _868;
    float _914 = _904 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _916 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _880);
    float _918 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _882);
    float _920 = _910 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _884);
    float _924 = _902 * 6.283185482025146484375;
    float _926 = cos(_924);
    float _928 = _916 * _914;
    float _930 = _912 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _932 = _918 * _920;
    float _934 = _900 * _894;
    float _936 = _900 * _872;
    float _938 = _922 * _930;
    float _940 = _902 * 6.283185482025146484375;
    float _942 = sin(_940);
    float _944 = _908 * _872;
    float _946 = _908 * _894;
    float _948 = _900 * _926;
    float _950 = _908 * _926;
    float _952 = _894 * _926;
    float _954 = _872 * _926;
    float _956 = _948 * _932;
    float _958 = fma(_942, _934, _944);
    float _960 = -_936;
    float _962 = fma(_942, _946, _960);
    float _964 = -_946;
    float _966 = fma(_942, _936, _964);
    float _968 = -_932;
    float _970 = _942 * _968;
    float _972 = _950 * _932;
    float _974 = fma(_958, _928, _956);
    float _976 = fma(_942, _944, _934);
    float _978 = fma(_952, _928, _970);
    float _980 = fma(_962, _928, _972);
    float _982 = fma(_966, _938, _974);
    float _984 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _986 = fma(_954, _938, _978);
    float _988 = fma(_976, _938, _980);
    float _990 = _982 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _992 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[6].x, _984);
    float _994 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _996 = _982 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _998 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[26].x, _990);
    float _1000 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[6].z, _992);
    float _1002 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[4].x, _994);
    float _1004 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[24].x, _996);
    float _1006 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[26].z, _998);
    float _1008 = _1000 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1010 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1002);
    float _1012 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1004);
    float _1014 = _1006 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1016 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1018 = _1010 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1020 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1022 = _1008 + _1014;
    float _1024 = _982 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1026 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1016);
    float _1028 = _1018 + _1020;
    float _1030 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1032 = _1022 + _1030;
    float _1034 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1024);
    float _1036 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1026);
    float _1038 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1040 = _1028 + _1038;
    float _1042 = _1032 * _1032;
    float _1044 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1034);
    float _1046 = _1036 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1048 = fma(_1040, _1040, _1042);
    float _1050 = _1044 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1052 = sqrt(_1048);
    float _1054 = _1046 + _1050;
    bool _1056 = _1052 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1058 = _1050;
    float _1060 = _1036;
    float _1062 = _1028;
    float _1064 = _1040;
    float _1066 = _988;
    float _1068 = _1046;
    float _1070 = _1008;
    if (!_1056)
    {
        _1058 = _1028;
    }
    float _1072 = _1058;
    float _1074 = _1072;
    if (!_1056)
    {
        _1060 = _1022;
    }
    float _1076 = _1060;
    float _1078 = _1076;
    if (!_1056)
    {
        _1062 = _1054;
    }
    float _1080 = _1062;
    bool _1082 = !_1056;
    float _1084 = _1080;
    if (!_1082)
    {
        float _1086 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1090 = _1052 + _1088;
        float _1092 = _1054 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1094 = rsqrt(_1048);
        float _1096 = _1090 * _1086;
        float _1098 = _1096 * 0.15915493667125701904296875;
        float _1100 = _1098 * 6.283185482025146484375;
        float _1102 = sin(_1100);
        float _1104 = _1098 * 6.283185482025146484375;
        float _1106 = cos(_1104);
        float _1108 = fma(_1102, _1092, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1110 = _1094 * _1108;
        float _1112 = _1106 + (-1.0);
        float _1114 = fma(_1040, _1110, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1116 = fma(_1032, _1110, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1118 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1120 = fma(_1054, _1106, _1118);
        _1074 = _1114;
        _1078 = _1116;
        _1084 = _1120;
    }
    float _1122 = _1074;
    float _1124 = _1078;
    float _1126 = _1084;
    float _1128 = _1126;
    float _1130 = _1122;
    float _1132 = _1124;
    if (!_854)
    {
        float _1134 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1136 = _1046 + _1134;
        float _1138 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1140 = _1018 + _1138;
        float _1142 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1144 = -_1018;
        float _1146 = _1144 + _1122;
        float _1148 = _1136 * _1136;
        float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1152 = _1008 + _1150;
        float _1154 = -_1008;
        float _1156 = _1154 + _1124;
        float _1158 = fma(_1140, _1140, _1148);
        float _1160 = fma(_1152, _1152, _1158);
        float _1162 = sqrt(_1160);
        float _1164 = precise::min(_1162, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1166 = _1164 * _1142;
        float _1168 = -_1046;
        float _1170 = _1168 + _1126;
        float _1172 = fma(_1146, _1166, _1018);
        float _1174 = fma(_1170, _1166, _1046);
        float _1176 = fma(_1156, _1166, _1008);
        _1128 = _1174;
        _1130 = _1172;
        _1132 = _1176;
    }
    float _1178 = _1128;
    float _1180 = _1130;
    float _1182 = _1132;
    float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1186 = _1178 + _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1190 = _1180 + _1188;
    float _1192 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1194 = _1182 + _1192;
    float _1196 = _1186 * _1186;
    float _1198 = fma(_1190, _1190, _1196);
    float _1200 = fma(_1194, _1194, _1198);
    float _1202 = rsqrt(_1200);
    float _1204 = sqrt(_1200);
    float _1206 = _1202 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1208 = _1190 * _1206;
    float _1210 = _1194 * _1206;
    float _1212 = _1208 * _1208;
    float _1214 = _1210 * _1210;
    float _1216 = _1212 + _1214;
    float _1218 = sqrt(_1216);
    bool _1220 = _1218 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1224 = _1218 + _1222;
    float _1226 = _1194;
    float _1228 = _1224;
    float _1230 = _1186;
    if (_1220)
    {
        float _1232 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1226 = _1232;
    }
    float _1234 = _1226;
    if (_1220)
    {
        float _1236 = rsqrt(_1216);
        _1064 = _1236;
    }
    float _1238 = _1064;
    float _1240 = _1238;
    if (_1220)
    {
        float _1242 = _1224 * _1234;
        _1228 = _1242;
    }
    float _1244 = _1228;
    if (_1220)
    {
        float _1246 = _1244 * 0.15915493667125701904296875;
        _1066 = _1246;
    }
    float _1248 = _1066;
    float _1250 = _1196;
    if (_1220)
    {
        float _1252 = _1248 * 6.283185482025146484375;
        float _1254 = sin(_1252);
        _1250 = _1254;
    }
    float _1256 = _1250;
    float _1258 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1260 = precise::max(0.0, _1258);
    float _1262 = _1202;
    float _1264 = _1260;
    float _1266 = _1258;
    if (_1220)
    {
        float _1268 = _1248 * 6.283185482025146484375;
        float _1270 = cos(_1268);
        _1262 = _1270;
    }
    float _1272 = _1262;
    float _1274 = -_1206;
    float _1276 = -_1260;
    float _1278 = fma(_1186, _1274, _1276);
    if (!_1220)
    {
        _1264 = _1208;
    }
    float _1280 = _1264;
    float _1282 = _1280;
    if (_1220)
    {
        float _1284 = _1278 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1266 = _1284;
    }
    float _1286 = _1266;
    float _1288 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1290 = _1256;
    float _1292 = _1286;
    if (_1220)
    {
        float _1294 = fma(_1256, _1286, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1230 = _1294;
    }
    float _1296 = _1230;
    float _1298 = _1296;
    if (!_1220)
    {
        _1290 = _1212;
    }
    float _1300 = _1290;
    float _1302 = _1300;
    float _1304 = _1272;
    if (_1220)
    {
        float _1306 = _1272 + (-1.0);
        _1292 = _1306;
    }
    float _1308 = _1292;
    float _1310 = _1308;
    if (_1220)
    {
        float _1312 = _1238 * _1296;
        _822 = _1312;
    }
    float _1314 = _822;
    if (!_1220)
    {
        _1298 = _1278;
    }
    float _1316 = _1298;
    float _1318 = _1316;
    if (_1220)
    {
        float _1320 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1240 = _1320;
    }
    float _1322 = _1240;
    if (_1220)
    {
        float _1324 = _1208 * _1314;
        _1282 = _1324;
    }
    float _1326 = _1282;
    if (!_1220)
    {
        _1310 = _1210;
    }
    float _1328 = _1310;
    float _1330 = _1328;
    if (_1220)
    {
        float _1332 = _1210 * _1314;
        _1330 = _1332;
    }
    float _1334 = _1330;
    if (_1220)
    {
        float _1336 = fma(_1278, _1272, _1322);
        _1318 = _1336;
    }
    float _1338 = _1318;
    if (_1220)
    {
        float _1340 = _1326 * _1326;
        _1302 = _1340;
    }
    float _1342 = _1302;
    if (!_1220)
    {
        _1304 = _1214;
    }
    float _1344 = _1304;
    float _1346 = _1344;
    if (_1220)
    {
        float _1348 = _1334 * _1334;
        _1346 = _1348;
    }
    float _1350 = _1346;
    float _1352 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1354 = fma(_1204, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1352);
    float _1356 = precise::clamp(_1354, 0.0, 1.0);
    float _1358 = fma(_1338, _1338, _1342);
    float _1360 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1362 = -_1356;
    float _1364 = _1362 + 1.0;
    float _1366 = _1358 + _1350;
    float _1368 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1360);
    float _1370 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1372 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1374 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1376 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1368);
    float _1378 = rsqrt(_1366);
    float _1380 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1370);
    float _1382 = _1376 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1384 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1372);
    float _1386 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1380);
    float _1388 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1374);
    float _1390 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1392 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1384);
    float _1394 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1396 = abs(_1364);
    float _1398 = log2(_1396);
    float _1400 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1388);
    float _1402 = _1392 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1404 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1406 = -_1390;
    float _1408 = fma(_1406, _1288, 1.0);
    float _1410 = _1400 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1412 = _1378 * _1326;
    float _1414 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1404);
    float _1416 = _1378 * _1338;
    float _1418 = _1378 * _1334;
    float _1420 = _1412 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1422 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1414);
    float _1424 = log2(_1408);
    float _1426 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1428 = -_1420;
    float _1430 = fma(_1416, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1428);
    float _1432 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1422);
    float _1434 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1436 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1438 = -_1418;
    float _1440 = fma(_1438, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1430);
    float _1442 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1426);
    float _1444 = exp2(_1434);
    float _1446 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1436);
    float _1448 = fma(_1440, -0.5, 0.5);
    float _1450 = fma(_1440, 0.5, 0.5);
    float _1452 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1442);
    float _1454 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1446);
    float _1456 = _1416 + 1.0;
    float _1458 = 1.0 / _1432;
    float _1460 = fma(_1450, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1462 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1454);
    float _1464 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1452);
    float _1466 = _1424 * 0.693147182464599609375;
    float _1468 = fma(_1450, _1460, -0.212114393711090087890625);
    float _1470 = sqrt(_1448);
    float _1472 = -_1416;
    float _1474 = fma(_1444, _1456, _1472);
    float _1476 = fma(_1450, _1468, 1.570728778839111328125);
    float _1478 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1480 = fma(_1474, 0.5, 0.5);
    float _1482 = _1462 * _1458;
    float _1484 = _1464 * _1458;
    float _1486 = fma(_1482, 0.5, 0.5);
    float _1488 = fma(_1484, -0.5, 0.5);
    float _1490 = _1470 * 0.636619746685028076171875;
    float3 _4298 = float3(_1486, _1488, _1478);
    float _1492 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4298, float3(0.0), isnan(_4298)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4298, float3(0.0), isnan(_4298)), level(0.0)).x;
    float _1494 = -_1476;
    float _1496 = fma(_1490, _1494, 1.0);
    float3 _4314 = float3(_1486, _1488, _1478);
    float4 _1499 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4314, float3(0.0), isnan(_4314)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4314, float3(0.0), isnan(_4314)), level(0.0)).xyzw;
    float _1501 = _1499.x;
    float _1503 = _1499.y;
    float _1505 = _1499.z;
    float _1507 = _1499.w;
    float2 _4331 = float2(_1496, _1480);
    float3 _1511 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4331, float2(0.0), isnan(_4331)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4331, float2(0.0), isnan(_4331)), level(0.0)).xyz;
    float _1513 = _1511.x;
    float _1515 = _1511.y;
    float _1517 = _1511.z;
    float _1519 = in.m_49.w;
    float _1521 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1523 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1525 = isnan(0.5);
    bool _1527 = _1523 || _1525;
    bool _1529 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1531 = _1527 || _1529;
    float _1533 = in.m_57.y;
    int _1535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1537 = _1535 != 0;
    float _1539 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1543 = _1541 != 0;
    float _1545 = exp2(_1521);
    int _1547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1549 = _1547 != 0;
    int _1551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1553 = _1551 != 0;
    float _1555 = in.m_57.x;
    bool _1557 = _630 > 0.5;
    float _1559 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1561 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1563 = _1559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1565 = _1519 > 0.5;
    float _1567 = -_1545;
    float _1569 = _1567 + 1.0;
    float _1571 = -_1533;
    float _1573 = _1571 + 1.0;
    bool _1575 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1577 = isnan(_608);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1583 = _1579 || _1581;
    float _1585 = float(_1583);
    float _1587 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1589 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1587;
    int _1591 = _1565 ? as_type<int>(_1573) : as_type<int>(_1533);
    float _1593 = 1.0 / _1589;
    bool _1595 = _1565;
    bool _1597 = _1543;
    float _1599 = _1533;
    if (_1537)
    {
        bool _1601 = _152 > 0.5;
        _1595 = _1601;
    }
    bool _1603 = _1595;
    float _1605 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1607 = _1543 ? as_type<float>(_1591) : _1533;
    float _1609 = _1605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1549)
    {
        bool _1611 = _610 > 0.5;
        _1597 = _1611;
    }
    bool _1613 = _1597;
    float _1615 = _1607 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1617 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1619 = _608 + _1617;
    float _1621 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1623 = (*spvDescriptorSet0.vp_c9)._m0[108].y;
    if (_1553)
    {
        float _1625 = _1557 ? _1573 : _1533;
        _1599 = _1625;
    }
    float _1627 = _1599;
    float _1629 = _1621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1631 = 0.0;
    if (!_1537)
    {
        _1631 = _1555;
    }
    float _1633 = _1631;
    float _1635 = _1619 * _1593;
    float _1637 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1639 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1637;
    float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1643 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1641;
    out.m_59.x = _1629;
    out.m_59.y = _1563;
    out.m_59.z = _1609;
    out.m_59.w = _1561;
    float _1645 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1647 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1645;
    bool _1649 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1651 = isnan(_608);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = fma(_1639, _1635, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1663 = fma(_1643, _1635, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _1665 = _882 != 0.0;
    bool _1667 = isnan(_882);
    bool _1669 = _1665 || _1667;
    bool _1671 = isnan(0.0);
    bool _1673 = _1669 || _1671;
    float _1675 = in.m_61.x;
    float _1677 = in.m_61.y;
    float _1679 = in.m_61.z;
    float _1681 = _1633;
    int _1683 = as_type<int>(_1663);
    if (!_1537)
    {
        _1623 = _1633;
    }
    float _1685 = _1623;
    float _1687 = fma(_1647, _1635, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1689 = _1685;
    if (_1537)
    {
        _1681 = _1555;
    }
    float _1691 = _1681;
    float _1693 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1695 = _880 == 0.0;
    bool _1697 = !_1673;
    bool _1699 = _1695 && _1697;
    float _1701 = 0.0;
    float _1703 = _1693;
    if (!_1531)
    {
        _1701 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1705 = _1701;
    float _1707 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1709 = -_1659;
    float _1711 = _1709 + 1.0;
    bool _1713 = _884 == 0.0;
    bool _1715 = _1713 && _1699;
    float _1717 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1707);
    float _1719 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1721 = _1585 * _1711;
    int _1723 = as_type<int>(_1721);
    float _1725 = _1705;
    if (!_1549)
    {
        _1068 = _1691;
    }
    float _1727 = _1068;
    float _1729 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1717);
    float _1731 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1719);
    float _1733 = _1663 * _1721;
    float _1735 = _1727;
    if (_1549)
    {
        float _1737 = -_1691;
        float _1739 = _1737 + 1.0;
        _1683 = as_type<int>(_1739);
    }
    int _1741 = _1683;
    float _1743 = _1729 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1745 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1731);
    float _1747 = _1661 * _1721;
    float _1749 = _1687 * _1721;
    float _1751 = 1.0 / _1743;
    float _1753 = _1743;
    float _1755 = _1745;
    if (_1537)
    {
        float _1757 = -_1691;
        float _1759 = _1757 + 1.0;
        _1723 = as_type<int>(_1759);
    }
    int _1761 = _1723;
    if (_1549)
    {
        float _1763 = _1613 ? as_type<float>(_1741) : _1691;
        _1735 = _1763;
    }
    float _1765 = _1735;
    float _1767 = _1745 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1769 = -_1585;
    float _1771 = _1769 + 1.0;
    float _1773 = _1771;
    if (_1715)
    {
        _1070 = _1675;
    }
    float _1775 = _1070;
    float _1777 = _1775;
    if (!_1715)
    {
        float _1779 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1675);
        _1777 = _1779;
    }
    float _1781 = _1777;
    if (_1537)
    {
        float _1783 = _1603 ? as_type<float>(_1761) : _1691;
        _1689 = _1783;
    }
    float _1785 = _1689;
    float _1787 = _1767 + _1743;
    float _1789 = fma(_1771, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1747);
    float _1791 = fma(_1771, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1733);
    float _1793 = fma(_1771, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1749);
    float _1795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1797 = _1791;
    float _1799 = _1793;
    if (_1715)
    {
        _1773 = _1679;
    }
    float _1801 = _1773;
    float _1803 = in.m_63.x;
    float _1805 = in.m_63.y;
    float _1807 = in.m_63.z;
    float _1809 = in.m_63.w;
    float _1811 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1789);
    float _1813 = _1787 * _1751;
    float _1815 = _1813 * 0.5;
    float _1817 = _1801;
    if (_1715)
    {
        _1753 = _1801;
    }
    float _1819 = _1753;
    float _1821 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1823 = _1819;
    if (!_1715)
    {
        _1817 = _1679;
    }
    float _1825 = _1817;
    if (!_1531)
    {
        float _1827 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1829 = fma(_1815, _1705, _1827);
        _1725 = _1829;
    }
    float _1831 = _1725;
    float _1833 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1791);
    if (!_1531)
    {
        _1797 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1835 = _1797;
    float _1837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1839 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1793);
    float _1841 = _1835;
    if (_1715)
    {
        _1755 = _1677;
    }
    float _1843 = _1755;
    float _1845 = _1843;
    if (!_1715)
    {
        float _1847 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1677);
        _1845 = _1847;
    }
    float _1849 = _1845;
    if (!_1531)
    {
        float _1851 = -_1835;
        float _1853 = _1851 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1799 = _1853;
    }
    float _1855 = _1799;
    float _1857 = _1615 * _1795;
    if (!_1715)
    {
        float _1859 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1825);
        _1823 = _1859;
    }
    float _1861 = _1823;
    float _1863 = _1765 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1865 = _1831;
    if (!_1531)
    {
        float _1867 = 1.0 / _1831;
        _1865 = _1867;
    }
    float _1869 = _1865;
    float _1871 = _1803 * _1677;
    float _1873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1875 = _1821 * _1837;
    float _1877 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1879 = _1805 * _1825;
    float _1881 = _1807 * _1675;
    float _1883 = -_1871;
    float _1885 = fma(_1805, _1675, _1883);
    float _1887 = _1877 * _1693;
    if (_1531)
    {
        _1703 = 1.0;
    }
    float _1889 = _1703;
    float _1891 = _1615;
    float _1893 = _1889;
    if (!_1531)
    {
        float _1895 = 1.0 / _1855;
        _1891 = _1895;
    }
    float _1897 = _1891;
    if (!_1531)
    {
        float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1901 = -_1835;
        float _1903 = fma(_1869, _1899, _1901);
        _1841 = _1903;
    }
    float _1905 = _1841;
    float _1907 = -_1879;
    float _1909 = fma(_1807, _1677, _1907);
    float _1911 = _1833 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1913 = -_1881;
    float _1915 = fma(_1803, _1825, _1913);
    float _1917 = _1811 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1919 = _1839 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1921 = _1863 * _1873;
    float _1923 = _948 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1925 = _1917 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1927 = _1911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1929 = _1919 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _1887;
    out.m_65.y = _1875;
    out.m_65.z = _1921;
    out.m_65.w = _1857;
    float _1931 = _1915 * _1809;
    float _1933 = -_942;
    float _1935 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1923);
    if (!_1531)
    {
        float _1937 = _1905 * _1897;
        float _1939 = precise::clamp(_1937, 0.0, 1.0);
        _1893 = _1939;
    }
    float _1941 = _1893;
    float _1943 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1945 = _958 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1947 = _1941 > 0.0;
    bool _1949 = isnan(_1941);
    bool _1951 = _1947 || _1949;
    bool _1953 = isnan(0.0);
    bool _1955 = _1951 || _1953;
    out.m_67.x = _1925;
    out.m_67.y = _1927;
    out.m_67.z = _1929;
    out.m_67.w = _1943;
    float _1957 = _1941 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1959 = _948 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1961 = _958 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1963 = _1909 * _1809;
    float _1965 = _360 * _1957;
    float _1967 = _948 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1969 = _958 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1971 = _1885 * _1809;
    float _1973 = -_942;
    float _1975 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1959);
    float _1977 = -_942;
    float _1979 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1967);
    float _1981 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1961);
    float _1983 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1969);
    float _1985 = _966 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1987 = _966 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1989 = _966 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1991 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1979);
    float _1993 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1975);
    float _1995 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1945);
    float _1997 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1935);
    float _1999 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1985);
    float _2001 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1987);
    float _2003 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1989);
    float _2005 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1981);
    float _2007 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1983);
    float _2009 = _1991 * _1805;
    float _2011 = _1993 * _1805;
    float _2013 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1995);
    float _2015 = _1997 * _1805;
    float _2017 = _1993 * _1849;
    float _2019 = _1931 * _1993;
    float _2021 = _1991 * _1849;
    float _2023 = _1931 * _1991;
    float _2025 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1999);
    float _2027 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2001);
    float _2029 = fma(_2005, _1803, _2009);
    float _2031 = fma(_2007, _1803, _2011);
    float _2033 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2003);
    float _2035 = fma(_2013, _1803, _2015);
    float _2037 = fma(_1963, _2005, _2023);
    float _2039 = fma(_2025, _1807, _2029);
    float _2041 = fma(_2027, _1807, _2031);
    float _2043 = fma(_2033, _1807, _2035);
    float _2045 = fma(_2005, _1781, _2021);
    float _2047 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1539);
    float _2049 = fma(_2007, _1781, _2017);
    float _2051 = _1931 * _1997;
    float _2053 = fma(_2025, _1861, _2045);
    out.m_69.x = _2039;
    out.m_69.y = _2041;
    out.m_69.z = _2043;
    float _2055 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2047);
    float _2057 = fma(_2027, _1861, _2049);
    float _2059 = fma(_1963, _2007, _2019);
    float _2061 = fma(_1963, _2013, _2051);
    float _2063 = _1997 * _1849;
    float _2065 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2055);
    float _2067 = fma(_1971, _2025, _2037);
    float _2069 = fma(_1971, _2027, _2059);
    float _2071 = fma(_1971, _2033, _2061);
    float _2073 = fma(_2013, _1781, _2063);
    float _2075 = _2065 + _1432;
    float _2077 = _1569 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1462;
    out.gl_Position.y = _1464;
    out.gl_Position.z = _2065;
    out.gl_Position.w = _1432;
    float _2079 = fma(_2033, _1861, _2073);
    float _2081 = -_2077;
    float _2083 = _2081 + 1.0;
    out.m_71.x = _2067;
    out.m_71.y = _2069;
    out.m_71.z = _2071;
    float _2085 = _2075 * 0.5;
    float _2087 = _1965 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = _2053;
    out.m_73.y = _2057;
    out.m_73.z = _2079;
    out.m_75.z = _2085;
    out.m_75.w = _1432;
    out.m_45.x = _2087;
    float _2089 = _2077 * _1492;
    float _2091 = _1507 * _2089;
    float _2093 = _1507 * _2083;
    float _2095 = _1517 * _2089;
    float _2097 = fma(_1513, _2091, _1501);
    float _2099 = fma(_1515, _2091, _1503);
    float _2101 = fma(_1507, _2095, _1505);
    out.m_77.x = _2097;
    out.m_77.y = _2099;
    out.m_77.z = _2101;
    out.m_77.w = _2093;
    if (_1955)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2103 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2103;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _600 = false;
    bool _380 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2160 = as_type<float>(_112);
        out.gl_Position.z = _2160;
    }
    if (!_100)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _116 = in.m_47.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = _130;
    if (_126)
    {
        float _134 = float(_96);
        _106 = _134;
    }
    float _136 = _106;
    bool _138 = _130 >= _136;
    bool _140 = !_126;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_45.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _114 = as_type<int>(_148);
    }
    int _150 = _114;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2230 = as_type<float>(_150);
        out.gl_Position.z = _2230;
    }
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_49.x;
    float _154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _156 = _130 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _158 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    int _170 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _172 = _170 != 0;
    float _174 = _156 * _154;
    float _176 = 0.0;
    float _178 = _158;
    if (!_168)
    {
        float _180 = _158 * _158;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[20].x, _174);
    float _188 = _184;
    if (!_168)
    {
        float _190 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    float _194 = in.m_47.x;
    float _196 = in.m_47.y;
    float _198 = in.m_47.z;
    float _200 = _186 * 6.283185482025146484375;
    float _202 = floor(_186);
    float _204 = _200 * 0.15915493667125701904296875;
    float _206 = _204 * 6.283185482025146484375;
    float _208 = cos(_206);
    float _210 = -_202;
    float _212 = _186 + _210;
    bool _214 = !_168;
    float _216 = _192;
    if (!_214)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _158 * _220;
        float _230 = 1.0 / _224;
        float _232 = _226 * 0.693147182464599609375;
        float _234 = exp2(_228);
        float _236 = 1.0 / _232;
        float _238 = _234 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _236, _158);
        float _244 = _242 * _230;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _246;
    }
    float _248 = _216;
    bool _250 = !_168;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _158 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _178 = _270;
    }
    float _272 = _178;
    float _274 = in.m_51.w;
    int _276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _278 = _276 != 0;
    int _280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _282 = _280 != 0;
    float _284 = in.m_42.x;
    float _286 = in.m_42.y;
    float _288 = in.m_42.z;
    float _290 = -_212;
    float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _294 = _212 < 0.5;
    float _296 = float(_294);
    bool _298 = !_278;
    int _300 = _298 ? 0 : 1;
    float _302 = fma(_208, 0.5, 0.5);
    bool _304 = !_172;
    int _306 = _304 ? 0 : 1;
    float _308 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _310 = abs(_300);
    float _312 = -_296;
    float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _316 = -_302;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _320 = fma(_272, _194, _308);
    int _322 = abs(_306);
    float _324 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _326 = !_282;
    int _328 = _326 ? 0 : 1;
    float _330 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _334 = abs(_328);
    float _336 = fma(_272, _196, _324);
    float _338 = float(_310);
    float _340 = fma(_272, _198, _330);
    float _342 = float(_322);
    float _344 = abs(_292);
    float _346 = _338 * _344;
    float _348 = float(_334);
    float _350 = fma(_342, _318, _346);
    float _352 = fma(_320, _274, _284);
    float _354 = fma(_336, _274, _286);
    float _356 = fma(_340, _274, _288);
    float _358 = abs(_314);
    float _360 = fma(_348, _358, _350);
    bool _362 = !_332;
    float _378;
    if (!_362)
    {
        float _364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _366 = _152 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _368 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _370 = _368 * _364;
        float _372 = floor(_370);
        float _374 = -_372;
        float _376 = _370 + _374;
        _378 = _376;
        _380 = true;
    }
    else
    {
        float _382 = float(_96);
        float _384 = 1.0 / _382;
        float _386 = _130 * _384;
        _378 = _386;
    }
    _380 = false;
    float _388 = _378;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _392 = _388 + _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _396 = _388 + _394;
    bool _398 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _400 = isnan(_388);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _416 = _388 + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _426 = 1.0 / _412;
    bool _428 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _430 = 1.0 / _420;
    float _432 = 1.0 / _424;
    float _434 = _392 * _426;
    bool _436 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _438 = isnan(_388);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _444 = _440 || _442;
    float _446 = float(_444);
    float _448 = -_408;
    float _450 = _448 + 1.0;
    float _452 = _446 * _450;
    float _454 = _396 * _430;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _460;
    bool _464 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _466 = isnan(_388);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = -_446;
    float _478 = _476 + 1.0;
    float _480 = fma(_458, _454, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _482 = fma(_462, _454, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _488 = _416 * _432;
    bool _490 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _492 = isnan(_388);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _510 = fma(_486, _488, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _512 = fma(_504, _454, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _514 = -_500;
    float _516 = _514 + 1.0;
    float _518 = _500 * _478;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _524 = fma(_508, _488, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _526 = _474 * _516;
    float _528 = -_474;
    float _530 = _528 + 1.0;
    float _532 = fma(_522, _488, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _534 = _480 * _526;
    float _536 = _482 * _526;
    float _538 = _512 * _526;
    float _540 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[143].x, _534);
    float _542 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[143].y, _536);
    float _544 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[143].z, _538);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _546;
    float _550 = fma(_524, _518, _540);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _556;
    float _560 = fma(_548, _434, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _562 = fma(_532, _518, _542);
    float _564 = fma(_554, _434, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _566 = fma(_558, _434, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _568 = fma(_510, _518, _544);
    float _570 = fma(_560, _452, _550);
    float _572 = fma(_564, _452, _562);
    float _574 = fma(_566, _452, _568);
    float _576 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[146].x, _570);
    float _578 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[146].y, _572);
    float _580 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[146].z, _574);
    bool _582 = !_428;
    float _598;
    if (!_582)
    {
        float _584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _586 = _152 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _588 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _590 = _588 * _584;
        float _592 = floor(_590);
        float _594 = -_592;
        float _596 = _590 + _594;
        _598 = _596;
        _600 = true;
    }
    else
    {
        float _602 = float(_96);
        float _604 = 1.0 / _602;
        float _606 = _130 * _604;
        _598 = _606;
    }
    _600 = false;
    float _608 = _598;
    float _610 = in.m_49.z;
    float _612 = _152 * 2.0;
    float _614 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _616 = log2(_614);
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _620 = _618 != 0;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _624 = _622 != 0;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _628 = _626 != 0;
    float _630 = in.m_49.y;
    float _632 = floor(_612);
    bool _634 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _636 = isnan(0.0);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _642 = _638 || _640;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _646 = 1.0 + _644;
    float _648 = _616 * _130;
    float _650 = 1.0 / _646;
    float _652 = _610 * 2.0;
    bool _654 = _632 > 0.0;
    float _656 = exp2(_648);
    float _658 = _152 + _630;
    bool _660 = _632 >= 0.0;
    bool _662 = isnan(_632);
    bool _664 = _660 || _662;
    bool _666 = isnan(0.0);
    bool _668 = _664 || _666;
    float _670 = _630 * 2.0;
    float _672 = _658 + (-1.0);
    float _674 = _630 + _610;
    float _676 = floor(_652);
    float _678 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _680 = _674 + (-1.0);
    int _682 = _668 ? 0 : 1;
    float _684 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _686 = !_624;
    int _688 = _686 ? 0 : 1;
    float _690 = floor(_670);
    int _692 = ~_682;
    int _694 = _692 + 1;
    int _696 = _694 + 1;
    float _698 = -_656;
    float _700 = _698 + 1.0;
    int _702 = _696;
    if (!_654)
    {
        int _704 = ~_682;
        int _706 = _704 + 1;
        _702 = _706;
    }
    int _708 = _702;
    bool _710 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _712 = isnan(1.0);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _718 = _714 || _716;
    bool _720 = !_620;
    int _722 = _720 ? 0 : 1;
    bool _724 = _676 > 0.0;
    bool _726 = _676 >= 0.0;
    bool _728 = isnan(_676);
    bool _730 = _726 || _728;
    bool _732 = isnan(0.0);
    bool _734 = _730 || _732;
    int _736 = abs(_688);
    float _738 = in.m_53.x;
    float _740 = in.m_53.y;
    float _742 = in.m_53.z;
    float _744 = _642 ? _700 : 0.0;
    float _746 = float(_736);
    float _748 = float(_708);
    if (_718)
    {
        float _750 = _744 * _650;
        _132 = _750;
    }
    float _752 = _132;
    int _754 = _734 ? 0 : 1;
    float _756 = _630 + (-0.5);
    int _758 = abs(_722);
    float _760 = _746 * _748;
    int _762 = ~_754;
    int _764 = _762 + 1;
    int _766 = _764 + 1;
    int _768 = _766;
    if (!_724)
    {
        int _770 = ~_754;
        int _772 = _770 + 1;
        _768 = _772;
    }
    int _774 = _768;
    float _776 = _760 * (-2.0);
    bool _778 = _690 > 0.0;
    bool _780 = !_628;
    int _782 = _780 ? 0 : 1;
    float _784 = float(_758);
    float _786 = float(_774);
    float _788 = fma(_776, _740, _740);
    bool _790 = _690 >= 0.0;
    bool _792 = isnan(_690);
    bool _794 = _790 || _792;
    bool _796 = isnan(0.0);
    bool _798 = _794 || _796;
    float _800 = fma(_684, _776, _684);
    int _802 = abs(_782);
    float _804 = _784 * _786;
    int _806 = _798 ? 0 : 1;
    float _808 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[196].y, _788);
    float _810 = _804 * (-2.0);
    int _812 = ~_806;
    int _814 = _812 + 1;
    int _816 = _814 + 1;
    float _818 = _152 + (-0.5);
    int _820 = _816;
    float _822 = _690;
    if (!_778)
    {
        int _824 = ~_806;
        int _826 = _824 + 1;
        _820 = _826;
    }
    int _828 = _820;
    float _830 = fma(_810, _738, _738);
    float _832 = fma(_800, _752, _808);
    float _834 = float(_802);
    float _836 = fma(_678, _810, _678);
    float _838 = float(_828);
    float _840 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[196].x, _830);
    float _842 = _152 + _610;
    float _844 = _832 * 0.15915493667125701904296875;
    bool _846 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _848 = isnan(0.5);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _854 = _850 || _852;
    float _856 = _834 * _838;
    float _858 = fma(_836, _752, _840);
    float _860 = _842 + (-1.0);
    float _862 = _856 * (-2.0);
    float _864 = in.m_51.x;
    float _866 = in.m_51.y;
    float _868 = in.m_51.z;
    float _870 = _844 * 6.283185482025146484375;
    float _872 = sin(_870);
    float _874 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _876 = fma(_862, _742, _742);
    float _878 = _610 + (-0.5);
    float _880 = in.m_55.x;
    float _882 = in.m_55.y;
    float _884 = in.m_55.z;
    float _886 = fma(_874, _862, _874);
    float _888 = _858 * 0.15915493667125701904296875;
    float _890 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[196].z, _876);
    float _892 = _844 * 6.283185482025146484375;
    float _894 = cos(_892);
    float _896 = fma(_886, _752, _890);
    float _898 = _888 * 6.283185482025146484375;
    float _900 = cos(_898);
    float _902 = _896 * 0.15915493667125701904296875;
    float _904 = _576 * _864;
    float _906 = _888 * 6.283185482025146484375;
    float _908 = sin(_906);
    float _910 = _578 * _866;
    float _912 = _580 * _868;
    float _914 = _904 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _916 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _880);
    float _918 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _882);
    float _920 = _910 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _884);
    float _924 = _902 * 6.283185482025146484375;
    float _926 = cos(_924);
    float _928 = _916 * _914;
    float _930 = _912 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _932 = _918 * _920;
    float _934 = _900 * _894;
    float _936 = _900 * _872;
    float _938 = _922 * _930;
    float _940 = _902 * 6.283185482025146484375;
    float _942 = sin(_940);
    float _944 = _908 * _872;
    float _946 = _908 * _894;
    float _948 = _900 * _926;
    float _950 = _908 * _926;
    float _952 = _894 * _926;
    float _954 = _872 * _926;
    float _956 = _948 * _932;
    float _958 = fma(_942, _934, _944);
    float _960 = -_936;
    float _962 = fma(_942, _946, _960);
    float _964 = -_946;
    float _966 = fma(_942, _936, _964);
    float _968 = -_932;
    float _970 = _942 * _968;
    float _972 = _950 * _932;
    float _974 = fma(_958, _928, _956);
    float _976 = fma(_942, _944, _934);
    float _978 = fma(_952, _928, _970);
    float _980 = fma(_962, _928, _972);
    float _982 = fma(_966, _938, _974);
    float _984 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _986 = fma(_954, _938, _978);
    float _988 = fma(_976, _938, _980);
    float _990 = _982 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _992 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[6].x, _984);
    float _994 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _996 = _982 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _998 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[26].x, _990);
    float _1000 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[6].z, _992);
    float _1002 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[4].x, _994);
    float _1004 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[24].x, _996);
    float _1006 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[26].z, _998);
    float _1008 = _1000 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1010 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1002);
    float _1012 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1004);
    float _1014 = _1006 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1016 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1018 = _1010 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1020 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1022 = _1008 + _1014;
    float _1024 = _982 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1026 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1016);
    float _1028 = _1018 + _1020;
    float _1030 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1032 = _1022 + _1030;
    float _1034 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1024);
    float _1036 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1026);
    float _1038 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1040 = _1028 + _1038;
    float _1042 = _1032 * _1032;
    float _1044 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1034);
    float _1046 = _1036 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1048 = fma(_1040, _1040, _1042);
    float _1050 = _1044 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1052 = sqrt(_1048);
    float _1054 = _1046 + _1050;
    bool _1056 = _1052 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1058 = _1050;
    float _1060 = _1036;
    float _1062 = _1028;
    float _1064 = _1040;
    float _1066 = _988;
    float _1068 = _1046;
    float _1070 = _1008;
    if (!_1056)
    {
        _1058 = _1028;
    }
    float _1072 = _1058;
    float _1074 = _1072;
    if (!_1056)
    {
        _1060 = _1022;
    }
    float _1076 = _1060;
    float _1078 = _1076;
    if (!_1056)
    {
        _1062 = _1054;
    }
    float _1080 = _1062;
    bool _1082 = !_1056;
    float _1084 = _1080;
    if (!_1082)
    {
        float _1086 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1090 = _1052 + _1088;
        float _1092 = _1054 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1094 = rsqrt(_1048);
        float _1096 = _1090 * _1086;
        float _1098 = _1096 * 0.15915493667125701904296875;
        float _1100 = _1098 * 6.283185482025146484375;
        float _1102 = sin(_1100);
        float _1104 = _1098 * 6.283185482025146484375;
        float _1106 = cos(_1104);
        float _1108 = fma(_1102, _1092, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1110 = _1094 * _1108;
        float _1112 = _1106 + (-1.0);
        float _1114 = fma(_1040, _1110, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1116 = fma(_1032, _1110, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1118 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1120 = fma(_1054, _1106, _1118);
        _1074 = _1114;
        _1078 = _1116;
        _1084 = _1120;
    }
    float _1122 = _1074;
    float _1124 = _1078;
    float _1126 = _1084;
    float _1128 = _1126;
    float _1130 = _1122;
    float _1132 = _1124;
    if (!_854)
    {
        float _1134 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1136 = _1046 + _1134;
        float _1138 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1140 = _1018 + _1138;
        float _1142 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1144 = -_1018;
        float _1146 = _1144 + _1122;
        float _1148 = _1136 * _1136;
        float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1152 = _1008 + _1150;
        float _1154 = -_1008;
        float _1156 = _1154 + _1124;
        float _1158 = fma(_1140, _1140, _1148);
        float _1160 = fma(_1152, _1152, _1158);
        float _1162 = sqrt(_1160);
        float _1164 = precise::min(_1162, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1166 = _1164 * _1142;
        float _1168 = -_1046;
        float _1170 = _1168 + _1126;
        float _1172 = fma(_1146, _1166, _1018);
        float _1174 = fma(_1170, _1166, _1046);
        float _1176 = fma(_1156, _1166, _1008);
        _1128 = _1174;
        _1130 = _1172;
        _1132 = _1176;
    }
    float _1178 = _1128;
    float _1180 = _1130;
    float _1182 = _1132;
    float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1186 = _1178 + _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1190 = _1180 + _1188;
    float _1192 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1194 = _1182 + _1192;
    float _1196 = _1186 * _1186;
    float _1198 = fma(_1190, _1190, _1196);
    float _1200 = fma(_1194, _1194, _1198);
    float _1202 = rsqrt(_1200);
    float _1204 = sqrt(_1200);
    float _1206 = _1202 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1208 = _1190 * _1206;
    float _1210 = _1194 * _1206;
    float _1212 = _1208 * _1208;
    float _1214 = _1210 * _1210;
    float _1216 = _1212 + _1214;
    float _1218 = sqrt(_1216);
    bool _1220 = _1218 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1224 = _1218 + _1222;
    float _1226 = _1194;
    float _1228 = _1224;
    float _1230 = _1186;
    if (_1220)
    {
        float _1232 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1226 = _1232;
    }
    float _1234 = _1226;
    if (_1220)
    {
        float _1236 = rsqrt(_1216);
        _1064 = _1236;
    }
    float _1238 = _1064;
    float _1240 = _1238;
    if (_1220)
    {
        float _1242 = _1224 * _1234;
        _1228 = _1242;
    }
    float _1244 = _1228;
    if (_1220)
    {
        float _1246 = _1244 * 0.15915493667125701904296875;
        _1066 = _1246;
    }
    float _1248 = _1066;
    float _1250 = _1196;
    if (_1220)
    {
        float _1252 = _1248 * 6.283185482025146484375;
        float _1254 = sin(_1252);
        _1250 = _1254;
    }
    float _1256 = _1250;
    float _1258 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1260 = precise::max(0.0, _1258);
    float _1262 = _1202;
    float _1264 = _1260;
    float _1266 = _1258;
    if (_1220)
    {
        float _1268 = _1248 * 6.283185482025146484375;
        float _1270 = cos(_1268);
        _1262 = _1270;
    }
    float _1272 = _1262;
    float _1274 = -_1206;
    float _1276 = -_1260;
    float _1278 = fma(_1186, _1274, _1276);
    if (!_1220)
    {
        _1264 = _1208;
    }
    float _1280 = _1264;
    float _1282 = _1280;
    if (_1220)
    {
        float _1284 = _1278 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1266 = _1284;
    }
    float _1286 = _1266;
    float _1288 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1290 = _1256;
    float _1292 = _1286;
    if (_1220)
    {
        float _1294 = fma(_1256, _1286, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1230 = _1294;
    }
    float _1296 = _1230;
    float _1298 = _1296;
    if (!_1220)
    {
        _1290 = _1212;
    }
    float _1300 = _1290;
    float _1302 = _1300;
    float _1304 = _1272;
    if (_1220)
    {
        float _1306 = _1272 + (-1.0);
        _1292 = _1306;
    }
    float _1308 = _1292;
    float _1310 = _1308;
    if (_1220)
    {
        float _1312 = _1238 * _1296;
        _822 = _1312;
    }
    float _1314 = _822;
    if (!_1220)
    {
        _1298 = _1278;
    }
    float _1316 = _1298;
    float _1318 = _1316;
    if (_1220)
    {
        float _1320 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1240 = _1320;
    }
    float _1322 = _1240;
    if (_1220)
    {
        float _1324 = _1208 * _1314;
        _1282 = _1324;
    }
    float _1326 = _1282;
    if (!_1220)
    {
        _1310 = _1210;
    }
    float _1328 = _1310;
    float _1330 = _1328;
    if (_1220)
    {
        float _1332 = _1210 * _1314;
        _1330 = _1332;
    }
    float _1334 = _1330;
    if (_1220)
    {
        float _1336 = fma(_1278, _1272, _1322);
        _1318 = _1336;
    }
    float _1338 = _1318;
    if (_1220)
    {
        float _1340 = _1326 * _1326;
        _1302 = _1340;
    }
    float _1342 = _1302;
    if (!_1220)
    {
        _1304 = _1214;
    }
    float _1344 = _1304;
    float _1346 = _1344;
    if (_1220)
    {
        float _1348 = _1334 * _1334;
        _1346 = _1348;
    }
    float _1350 = _1346;
    float _1352 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1354 = fma(_1204, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1352);
    float _1356 = precise::clamp(_1354, 0.0, 1.0);
    float _1358 = fma(_1338, _1338, _1342);
    float _1360 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1362 = -_1356;
    float _1364 = _1362 + 1.0;
    float _1366 = _1358 + _1350;
    float _1368 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1360);
    float _1370 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1372 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1374 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1376 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1368);
    float _1378 = rsqrt(_1366);
    float _1380 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1370);
    float _1382 = _1376 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1384 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1372);
    float _1386 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1380);
    float _1388 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1374);
    float _1390 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1392 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1384);
    float _1394 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1396 = abs(_1364);
    float _1398 = log2(_1396);
    float _1400 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1388);
    float _1402 = _1392 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1404 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1406 = -_1390;
    float _1408 = fma(_1406, _1288, 1.0);
    float _1410 = _1400 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1412 = _1378 * _1326;
    float _1414 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1404);
    float _1416 = _1378 * _1338;
    float _1418 = _1378 * _1334;
    float _1420 = _1412 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1422 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1414);
    float _1424 = log2(_1408);
    float _1426 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1428 = -_1420;
    float _1430 = fma(_1416, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1428);
    float _1432 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1422);
    float _1434 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1436 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1438 = -_1418;
    float _1440 = fma(_1438, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1430);
    float _1442 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1426);
    float _1444 = exp2(_1434);
    float _1446 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1436);
    float _1448 = fma(_1440, -0.5, 0.5);
    float _1450 = fma(_1440, 0.5, 0.5);
    float _1452 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1442);
    float _1454 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1446);
    float _1456 = _1416 + 1.0;
    float _1458 = 1.0 / _1432;
    float _1460 = fma(_1450, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1462 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1454);
    float _1464 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1452);
    float _1466 = _1424 * 0.693147182464599609375;
    float _1468 = fma(_1450, _1460, -0.212114393711090087890625);
    float _1470 = sqrt(_1448);
    float _1472 = -_1416;
    float _1474 = fma(_1444, _1456, _1472);
    float _1476 = fma(_1450, _1468, 1.570728778839111328125);
    float _1478 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1480 = fma(_1474, 0.5, 0.5);
    float _1482 = _1462 * _1458;
    float _1484 = _1464 * _1458;
    float _1486 = fma(_1482, 0.5, 0.5);
    float _1488 = fma(_1484, -0.5, 0.5);
    float _1490 = _1470 * 0.636619746685028076171875;
    float3 _4298 = float3(_1486, _1488, _1478);
    float _1492 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4298, float3(0.0), isnan(_4298)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4298, float3(0.0), isnan(_4298)), level(0.0)).x;
    float _1494 = -_1476;
    float _1496 = fma(_1490, _1494, 1.0);
    float3 _4314 = float3(_1486, _1488, _1478);
    float4 _1499 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4314, float3(0.0), isnan(_4314)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4314, float3(0.0), isnan(_4314)), level(0.0)).xyzw;
    float _1501 = _1499.x;
    float _1503 = _1499.y;
    float _1505 = _1499.z;
    float _1507 = _1499.w;
    float2 _4331 = float2(_1496, _1480);
    float3 _1511 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4331, float2(0.0), isnan(_4331)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4331, float2(0.0), isnan(_4331)), level(0.0)).xyz;
    float _1513 = _1511.x;
    float _1515 = _1511.y;
    float _1517 = _1511.z;
    float _1519 = in.m_49.w;
    float _1521 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1523 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1525 = isnan(0.5);
    bool _1527 = _1523 || _1525;
    bool _1529 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1531 = _1527 || _1529;
    float _1533 = in.m_57.y;
    int _1535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1537 = _1535 != 0;
    float _1539 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1543 = _1541 != 0;
    float _1545 = exp2(_1521);
    int _1547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1549 = _1547 != 0;
    int _1551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1553 = _1551 != 0;
    float _1555 = in.m_57.x;
    bool _1557 = _630 > 0.5;
    float _1559 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1561 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1563 = _1559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1565 = _1519 > 0.5;
    float _1567 = -_1545;
    float _1569 = _1567 + 1.0;
    float _1571 = -_1533;
    float _1573 = _1571 + 1.0;
    bool _1575 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1577 = isnan(_608);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1583 = _1579 || _1581;
    float _1585 = float(_1583);
    float _1587 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1589 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1587;
    int _1591 = _1565 ? as_type<int>(_1573) : as_type<int>(_1533);
    float _1593 = 1.0 / _1589;
    bool _1595 = _1565;
    bool _1597 = _1543;
    float _1599 = _1533;
    if (_1537)
    {
        bool _1601 = _152 > 0.5;
        _1595 = _1601;
    }
    bool _1603 = _1595;
    float _1605 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1607 = _1543 ? as_type<float>(_1591) : _1533;
    float _1609 = _1605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1549)
    {
        bool _1611 = _610 > 0.5;
        _1597 = _1611;
    }
    bool _1613 = _1597;
    float _1615 = _1607 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1617 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1619 = _608 + _1617;
    float _1621 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1623 = (*spvDescriptorSet0.vp_c9)._m0[108].y;
    if (_1553)
    {
        float _1625 = _1557 ? _1573 : _1533;
        _1599 = _1625;
    }
    float _1627 = _1599;
    float _1629 = _1621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1631 = 0.0;
    if (!_1537)
    {
        _1631 = _1555;
    }
    float _1633 = _1631;
    float _1635 = _1619 * _1593;
    float _1637 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1639 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1637;
    float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1643 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1641;
    out.m_59.x = _1629;
    out.m_59.y = _1563;
    out.m_59.z = _1609;
    out.m_59.w = _1561;
    float _1645 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1647 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1645;
    bool _1649 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1651 = isnan(_608);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = fma(_1639, _1635, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1663 = fma(_1643, _1635, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _1665 = _882 != 0.0;
    bool _1667 = isnan(_882);
    bool _1669 = _1665 || _1667;
    bool _1671 = isnan(0.0);
    bool _1673 = _1669 || _1671;
    float _1675 = in.m_61.x;
    float _1677 = in.m_61.y;
    float _1679 = in.m_61.z;
    float _1681 = _1633;
    int _1683 = as_type<int>(_1663);
    if (!_1537)
    {
        _1623 = _1633;
    }
    float _1685 = _1623;
    float _1687 = fma(_1647, _1635, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1689 = _1685;
    if (_1537)
    {
        _1681 = _1555;
    }
    float _1691 = _1681;
    float _1693 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1695 = _880 == 0.0;
    bool _1697 = !_1673;
    bool _1699 = _1695 && _1697;
    float _1701 = 0.0;
    float _1703 = _1693;
    if (!_1531)
    {
        _1701 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1705 = _1701;
    float _1707 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1709 = -_1659;
    float _1711 = _1709 + 1.0;
    bool _1713 = _884 == 0.0;
    bool _1715 = _1713 && _1699;
    float _1717 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1707);
    float _1719 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1721 = _1585 * _1711;
    int _1723 = as_type<int>(_1721);
    float _1725 = _1705;
    if (!_1549)
    {
        _1068 = _1691;
    }
    float _1727 = _1068;
    float _1729 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1717);
    float _1731 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1719);
    float _1733 = _1663 * _1721;
    float _1735 = _1727;
    if (_1549)
    {
        float _1737 = -_1691;
        float _1739 = _1737 + 1.0;
        _1683 = as_type<int>(_1739);
    }
    int _1741 = _1683;
    float _1743 = _1729 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1745 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1731);
    float _1747 = _1661 * _1721;
    float _1749 = _1687 * _1721;
    float _1751 = 1.0 / _1743;
    float _1753 = _1743;
    float _1755 = _1745;
    if (_1537)
    {
        float _1757 = -_1691;
        float _1759 = _1757 + 1.0;
        _1723 = as_type<int>(_1759);
    }
    int _1761 = _1723;
    if (_1549)
    {
        float _1763 = _1613 ? as_type<float>(_1741) : _1691;
        _1735 = _1763;
    }
    float _1765 = _1735;
    float _1767 = _1745 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1769 = -_1585;
    float _1771 = _1769 + 1.0;
    float _1773 = _1771;
    if (_1715)
    {
        _1070 = _1675;
    }
    float _1775 = _1070;
    float _1777 = _1775;
    if (!_1715)
    {
        float _1779 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1675);
        _1777 = _1779;
    }
    float _1781 = _1777;
    if (_1537)
    {
        float _1783 = _1603 ? as_type<float>(_1761) : _1691;
        _1689 = _1783;
    }
    float _1785 = _1689;
    float _1787 = _1767 + _1743;
    float _1789 = fma(_1771, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1747);
    float _1791 = fma(_1771, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1733);
    float _1793 = fma(_1771, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1749);
    float _1795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1797 = _1791;
    float _1799 = _1793;
    if (_1715)
    {
        _1773 = _1679;
    }
    float _1801 = _1773;
    float _1803 = in.m_63.x;
    float _1805 = in.m_63.y;
    float _1807 = in.m_63.z;
    float _1809 = in.m_63.w;
    float _1811 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1789);
    float _1813 = _1787 * _1751;
    float _1815 = _1813 * 0.5;
    float _1817 = _1801;
    if (_1715)
    {
        _1753 = _1801;
    }
    float _1819 = _1753;
    float _1821 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1823 = _1819;
    if (!_1715)
    {
        _1817 = _1679;
    }
    float _1825 = _1817;
    if (!_1531)
    {
        float _1827 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1829 = fma(_1815, _1705, _1827);
        _1725 = _1829;
    }
    float _1831 = _1725;
    float _1833 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1791);
    if (!_1531)
    {
        _1797 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1835 = _1797;
    float _1837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1839 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1793);
    float _1841 = _1835;
    if (_1715)
    {
        _1755 = _1677;
    }
    float _1843 = _1755;
    float _1845 = _1843;
    if (!_1715)
    {
        float _1847 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1677);
        _1845 = _1847;
    }
    float _1849 = _1845;
    if (!_1531)
    {
        float _1851 = -_1835;
        float _1853 = _1851 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1799 = _1853;
    }
    float _1855 = _1799;
    float _1857 = _1615 * _1795;
    if (!_1715)
    {
        float _1859 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1825);
        _1823 = _1859;
    }
    float _1861 = _1823;
    float _1863 = _1765 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1865 = _1831;
    if (!_1531)
    {
        float _1867 = 1.0 / _1831;
        _1865 = _1867;
    }
    float _1869 = _1865;
    float _1871 = _1803 * _1677;
    float _1873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1875 = _1821 * _1837;
    float _1877 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1879 = _1805 * _1825;
    float _1881 = _1807 * _1675;
    float _1883 = -_1871;
    float _1885 = fma(_1805, _1675, _1883);
    float _1887 = _1877 * _1693;
    if (_1531)
    {
        _1703 = 1.0;
    }
    float _1889 = _1703;
    float _1891 = _1615;
    float _1893 = _1889;
    if (!_1531)
    {
        float _1895 = 1.0 / _1855;
        _1891 = _1895;
    }
    float _1897 = _1891;
    if (!_1531)
    {
        float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1901 = -_1835;
        float _1903 = fma(_1869, _1899, _1901);
        _1841 = _1903;
    }
    float _1905 = _1841;
    float _1907 = -_1879;
    float _1909 = fma(_1807, _1677, _1907);
    float _1911 = _1833 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1913 = -_1881;
    float _1915 = fma(_1803, _1825, _1913);
    float _1917 = _1811 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1919 = _1839 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1921 = _1863 * _1873;
    float _1923 = _948 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1925 = _1917 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1927 = _1911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1929 = _1919 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _1887;
    out.m_65.y = _1875;
    out.m_65.z = _1921;
    out.m_65.w = _1857;
    float _1931 = _1915 * _1809;
    float _1933 = -_942;
    float _1935 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1923);
    if (!_1531)
    {
        float _1937 = _1905 * _1897;
        float _1939 = precise::clamp(_1937, 0.0, 1.0);
        _1893 = _1939;
    }
    float _1941 = _1893;
    float _1943 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1945 = _958 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1947 = _1941 > 0.0;
    bool _1949 = isnan(_1941);
    bool _1951 = _1947 || _1949;
    bool _1953 = isnan(0.0);
    bool _1955 = _1951 || _1953;
    out.m_67.x = _1925;
    out.m_67.y = _1927;
    out.m_67.z = _1929;
    out.m_67.w = _1943;
    float _1957 = _1941 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1959 = _948 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1961 = _958 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1963 = _1909 * _1809;
    float _1965 = _360 * _1957;
    float _1967 = _948 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1969 = _958 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1971 = _1885 * _1809;
    float _1973 = -_942;
    float _1975 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1959);
    float _1977 = -_942;
    float _1979 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1967);
    float _1981 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1961);
    float _1983 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1969);
    float _1985 = _966 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1987 = _966 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1989 = _966 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1991 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1979);
    float _1993 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1975);
    float _1995 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1945);
    float _1997 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1935);
    float _1999 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1985);
    float _2001 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1987);
    float _2003 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1989);
    float _2005 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1981);
    float _2007 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1983);
    float _2009 = _1991 * _1805;
    float _2011 = _1993 * _1805;
    float _2013 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1995);
    float _2015 = _1997 * _1805;
    float _2017 = _1993 * _1849;
    float _2019 = _1931 * _1993;
    float _2021 = _1991 * _1849;
    float _2023 = _1931 * _1991;
    float _2025 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1999);
    float _2027 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2001);
    float _2029 = fma(_2005, _1803, _2009);
    float _2031 = fma(_2007, _1803, _2011);
    float _2033 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2003);
    float _2035 = fma(_2013, _1803, _2015);
    float _2037 = fma(_1963, _2005, _2023);
    float _2039 = fma(_2025, _1807, _2029);
    float _2041 = fma(_2027, _1807, _2031);
    float _2043 = fma(_2033, _1807, _2035);
    float _2045 = fma(_2005, _1781, _2021);
    float _2047 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1539);
    float _2049 = fma(_2007, _1781, _2017);
    float _2051 = _1931 * _1997;
    float _2053 = fma(_2025, _1861, _2045);
    out.m_69.x = _2039;
    out.m_69.y = _2041;
    out.m_69.z = _2043;
    float _2055 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2047);
    float _2057 = fma(_2027, _1861, _2049);
    float _2059 = fma(_1963, _2007, _2019);
    float _2061 = fma(_1963, _2013, _2051);
    float _2063 = _1997 * _1849;
    float _2065 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2055);
    float _2067 = fma(_1971, _2025, _2037);
    float _2069 = fma(_1971, _2027, _2059);
    float _2071 = fma(_1971, _2033, _2061);
    float _2073 = fma(_2013, _1781, _2063);
    float _2075 = _2065 + _1432;
    float _2077 = _1569 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1462;
    out.gl_Position.y = _1464;
    out.gl_Position.z = _2065;
    out.gl_Position.w = _1432;
    float _2079 = fma(_2033, _1861, _2073);
    float _2081 = -_2077;
    float _2083 = _2081 + 1.0;
    out.m_71.x = _2067;
    out.m_71.y = _2069;
    out.m_71.z = _2071;
    float _2085 = _2075 * 0.5;
    float _2087 = _1965 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = _2053;
    out.m_73.y = _2057;
    out.m_73.z = _2079;
    out.m_75.z = _2085;
    out.m_75.w = _1432;
    out.m_45.x = _2087;
    float _2089 = _2077 * _1492;
    float _2091 = _1507 * _2089;
    float _2093 = _1507 * _2083;
    float _2095 = _1517 * _2089;
    float _2097 = fma(_1513, _2091, _1501);
    float _2099 = fma(_1515, _2091, _1503);
    float _2101 = fma(_1507, _2095, _1505);
    out.m_77.x = _2097;
    out.m_77.y = _2099;
    out.m_77.z = _2101;
    out.m_77.w = _2093;
    if (_1955)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2103 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2103;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

