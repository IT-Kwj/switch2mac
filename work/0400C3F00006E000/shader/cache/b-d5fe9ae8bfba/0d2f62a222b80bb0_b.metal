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
    float4 m_53 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_71 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_75 [[user(locn6)]];
    float4 m_45 [[user(locn7)]];
    float4 m_65 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _444 = false;
    bool _292 = false;
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
        float _1936 = as_type<float>(_112);
        out.gl_Position.z = _1936;
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
    float _132 = 0.0;
    if (_126)
    {
        float _134 = float(_96);
        _132 = _134;
    }
    float _136 = _132;
    bool _138 = _130 >= _136;
    bool _140 = !_126;
    bool _142 = _138 || _140;
    if (_142)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _106;
    if (_142)
    {
        out.m_45.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _114 = as_type<int>(_146);
    }
    int _148 = _114;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2004 = as_type<float>(_148);
        out.gl_Position.z = _2004;
    }
    if (_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_49.w;
    float _152 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_47.x;
    float _166 = in.m_47.y;
    float _168 = in.m_47.z;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
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
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
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
        float _274 = in.m_51.x;
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _278 = _274 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _282 = _280 * _276;
        float _284 = floor(_282);
        float _286 = -_284;
        float _288 = _282 + _286;
        _290 = _288;
        _292 = true;
    }
    else
    {
        float _294 = float(_96);
        float _296 = 1.0 / _294;
        float _298 = _130 * _296;
        _290 = _298;
    }
    _292 = false;
    float _300 = _290;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _304 = _300 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _310 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _312 = isnan(_300);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _326 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _328 = isnan(_300);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _338;
    bool _342 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _344 = isnan(_300);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = 1.0 / _308;
    float _356 = -_320;
    float _358 = _356 + 1.0;
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _362 = _336 * _358;
    float _364 = -_336;
    float _366 = _364 + 1.0;
    float _368 = 1.0 / _324;
    float _370 = _340 * _354;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _376 = fma(_370, _304, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _378 = _374 * _368;
    float _380 = _376 * _362;
    float _382 = -_352;
    float _384 = _382 + 1.0;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _388 = _300 + _386;
    float _390 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[115].x, _380);
    float _392 = _320 * _384;
    float _394 = fma(_378, _388, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _398 = fma(_394, _392, _390);
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _404 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[117].x, _398);
    float _406 = _396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _408 = _400 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _410 = _402 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _412 = _404 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _406;
    out.m_53.y = _408;
    out.m_53.z = _410;
    out.m_53.w = _412;
    bool _414 = !_360;
    float _416 = _412;
    float _440;
    float _442;
    if (!_414)
    {
        float _418 = in.m_51.x;
        float _420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _422 = float(_96);
        float _424 = 1.0 / _422;
        float _426 = _418 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _428 = _130 * _424;
        float _430 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[11].w, _130);
        float _432 = _430 * _420;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = _428;
        _444 = true;
    }
    else
    {
        float _446 = float(_96);
        float _448 = 1.0 / _446;
        float _450 = _130 * _448;
        _440 = _450;
        _442 = _450;
    }
    _444 = false;
    float _452 = _440;
    float _454 = _442;
    float _456 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _458 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _460 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _462 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _456);
    float _464 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _458);
    float _466 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _460);
    float _468 = in.m_55.x;
    float _470 = in.m_55.y;
    float _472 = in.m_55.z;
    float _474 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].z, _462);
    float _476 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].z, _464);
    float _478 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].z, _466);
    float _480 = _474 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _482 = _476 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _484 = _478 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _486 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _488 = _480 + _486;
    float _490 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _492 = _482 + _490;
    float _494 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _496 = _484 + _494;
    float _498 = _488 * _488;
    float _500 = fma(_492, _492, _498);
    float _502 = fma(_496, _496, _500);
    float _504 = rsqrt(_502);
    float _506 = _488 * _504;
    float _508 = _492 * _504;
    float _510 = _496 * _504;
    float _512 = -_506;
    float _514 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[18].w, _488);
    float _516 = -_508;
    float _518 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[18].w, _492);
    float _520 = -_510;
    float _522 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _496);
    float _524 = _514 * _514;
    float _526 = in.m_49.x;
    float _528 = in.m_49.y;
    float _530 = in.m_49.z;
    float _532 = fma(_518, _518, _524);
    float _534 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _468);
    float _536 = fma(_522, _522, _532);
    float _538 = sqrt(_536);
    float _540 = _528 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _542 = _526 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _544 = _504 * _538;
    float _546 = _530 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _548 = _540 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _550 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _470);
    float _552 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _554 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _556 = _548 * _544;
    float _558 = _552 * _544;
    float _560 = _554 * _544;
    float _562 = _556 * _550;
    float _564 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _472);
    float _566 = _558 * _534;
    float _568 = _562 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _570 = _560 * _564;
    float _572 = _562 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _574 = fma(_566, (*spvDescriptorSet0.vp_c10)._m0[10].x, _568);
    float _576 = fma(_566, (*spvDescriptorSet0.vp_c10)._m0[8].x, _572);
    float _578 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[10].z, _574);
    float _580 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[8].z, _576);
    float _582 = _484 + _578;
    float _584 = _482 + _580;
    float _586 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _588 = _582 + _586;
    float _590 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _592 = _584 + _590;
    float _594 = _588 * _588;
    float _596 = fma(_592, _592, _594);
    float _598 = _562 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _600 = sqrt(_596);
    float _602 = fma(_566, (*spvDescriptorSet0.vp_c10)._m0[9].x, _598);
    float _604 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[9].z, _602);
    float _606 = _480 + _604;
    bool _608 = _600 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _610 = _604;
    float _612 = _584;
    float _614 = _582;
    if (!_608)
    {
        _610 = _584;
    }
    float _616 = _610;
    float _618 = _616;
    if (!_608)
    {
        _612 = _606;
    }
    float _620 = _612;
    bool _622 = !_608;
    float _624 = _620;
    if (!_622)
    {
        float _626 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _628 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _630 = _600 + _628;
        float _632 = _606 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _634 = rsqrt(_596);
        float _636 = _630 * _626;
        float _638 = _636 * 0.15915493667125701904296875;
        float _640 = _638 * 6.283185482025146484375;
        float _642 = sin(_640);
        float _644 = _638 * 6.283185482025146484375;
        float _646 = cos(_644);
        float _648 = fma(_642, _632, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _650 = _634 * _648;
        float _652 = _646 + (-1.0);
        float _654 = fma(_592, _650, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _656 = fma(_588, _650, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _658 = _652 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _660 = fma(_606, _646, _658);
        _624 = _660;
        _618 = _654;
        _614 = _656;
    }
    float _662 = _624;
    float _664 = _618;
    float _666 = _614;
    float _668 = -_506;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[18].w, _662);
    float _672 = -_508;
    float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[18].w, _664);
    float _676 = -_510;
    float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[18].w, _666);
    float _680 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _682 = _670 + _680;
    float _684 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _686 = _674 + _684;
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _690 = _678 + _688;
    float _692 = _682 * _682;
    float _694 = fma(_686, _686, _692);
    float _696 = fma(_690, _690, _694);
    float _698 = rsqrt(_696);
    float _700 = sqrt(_696);
    float _702 = _698 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _704 = _686 * _702;
    float _706 = _690 * _702;
    float _708 = _704 * _704;
    float _710 = _706 * _706;
    float _712 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _714 = fma(_700, (*spvDescriptorSet0.vp_c15)._m0[23].w, _712);
    float _716 = precise::clamp(_714, 0.0, 1.0);
    float _718 = _708 + _710;
    float _720 = sqrt(_718);
    bool _722 = _720 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _724 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _726 = _720 + _724;
    float _728 = _694;
    float _730 = _718;
    float _732 = _726;
    float _734 = _704;
    if (_722)
    {
        float _736 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _728 = _736;
    }
    float _738 = _728;
    if (_722)
    {
        float _740 = rsqrt(_718);
        _730 = _740;
    }
    float _742 = _730;
    float _744 = _742;
    if (_722)
    {
        float _746 = _726 * _738;
        _732 = _746;
    }
    float _748 = _732;
    if (_722)
    {
        float _750 = _748 * 0.15915493667125701904296875;
        _416 = _750;
    }
    float _752 = _416;
    float _754 = _738;
    float _756 = _752;
    if (_722)
    {
        float _758 = _752 * 6.283185482025146484375;
        float _760 = sin(_758);
        _754 = _760;
    }
    float _762 = _754;
    float _764 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _766 = precise::max(0.0, _764);
    float _768 = _588;
    float _770 = _766;
    if (_722)
    {
        float _772 = _752 * 6.283185482025146484375;
        float _774 = cos(_772);
        _768 = _774;
    }
    float _776 = _768;
    float _778 = -_702;
    float _780 = -_766;
    float _782 = fma(_682, _778, _780);
    if (_722)
    {
        float _784 = _782 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _770 = _784;
    }
    float _786 = _770;
    float _788 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _790 = _762;
    float _792 = _786;
    if (_722)
    {
        float _794 = fma(_762, _786, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _790 = _794;
    }
    float _796 = _790;
    float _798 = _796;
    float _800 = _776;
    if (_722)
    {
        float _802 = _776 + (-1.0);
        _792 = _802;
    }
    float _804 = _792;
    float _806 = 0.0;
    float _808 = _804;
    if (_722)
    {
        float _810 = _742 * _796;
        _806 = _810;
    }
    float _812 = _806;
    if (!_722)
    {
        _798 = _782;
    }
    float _814 = _798;
    float _816 = _814;
    if (_722)
    {
        float _818 = _804 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _756 = _818;
    }
    float _820 = _756;
    if (_722)
    {
        float _822 = _704 * _812;
        _734 = _822;
    }
    float _824 = _734;
    if (!_722)
    {
        _808 = _706;
    }
    float _826 = _808;
    float _828 = _826;
    if (_722)
    {
        float _830 = _706 * _812;
        _828 = _830;
    }
    float _832 = _828;
    if (_722)
    {
        float _834 = fma(_782, _776, _820);
        _816 = _834;
    }
    float _836 = _816;
    if (!_722)
    {
        _800 = _708;
    }
    float _838 = _800;
    float _840 = _838;
    if (_722)
    {
        float _842 = _824 * _824;
        _840 = _842;
    }
    float _844 = _840;
    float _846 = _670 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_722)
    {
        _744 = _710;
    }
    float _848 = _744;
    float _850 = _848;
    if (_722)
    {
        float _852 = _832 * _832;
        _850 = _852;
    }
    float _854 = _850;
    float _856 = fma(_836, _836, _844);
    float _858 = _670 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _860 = _670 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _862 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[1].x, _846);
    float _864 = _856 + _854;
    float _866 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[2].x, _858);
    float _868 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[0].x, _860);
    float _870 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[1].z, _862);
    float _872 = rsqrt(_864);
    float _874 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[2].z, _866);
    float _876 = _670 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _878 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[0].z, _868);
    float _880 = _870 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _882 = _874 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _884 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[3].x, _876);
    float _886 = _878 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _888 = _880 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _890 = _882 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _892 = -_716;
    float _894 = _892 + 1.0;
    float _896 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[3].z, _884);
    float _898 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[7].x, _888);
    float _900 = -_890;
    float _902 = fma(_900, _788, 1.0);
    float _904 = _896 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _906 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[7].z, _898);
    float _908 = _872 * _824;
    float _910 = abs(_894);
    float _912 = log2(_910);
    float _914 = _872 * _836;
    float _916 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[7].w, _906);
    float _918 = _908 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _920 = _872 * _832;
    float _922 = _880 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _924 = -_918;
    float _926 = fma(_914, (*spvDescriptorSet0.vp_c15)._m0[21].y, _924);
    float _928 = log2(_902);
    float _930 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[5].x, _922);
    float _932 = -_920;
    float _934 = fma(_932, (*spvDescriptorSet0.vp_c15)._m0[21].z, _926);
    float _936 = _880 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _938 = fma(_934, -0.5, 0.5);
    float _940 = _912 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _942 = 1.0 / _916;
    float _944 = fma(_934, 0.5, 0.5);
    float _946 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[4].x, _936);
    float _948 = _914 + 1.0;
    float _950 = fma(_944, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _952 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[4].z, _946);
    float _954 = _928 * 0.693147182464599609375;
    float _956 = exp2(_940);
    float _958 = fma(_944, _950, -0.212114393711090087890625);
    float _960 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[4].w, _952);
    float _962 = _954 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _964 = fma(_944, _958, 1.570728778839111328125);
    float _966 = sqrt(_938);
    float _968 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[5].z, _930);
    float _970 = _960 * _942;
    float _972 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[5].w, _968);
    float _974 = fma(_970, 0.5, 0.5);
    float _976 = -_914;
    float _978 = fma(_956, _948, _976);
    float _980 = _972 * _942;
    float _982 = fma(_978, 0.5, 0.5);
    float _984 = fma(_980, -0.5, 0.5);
    float _986 = _966 * 0.636619746685028076171875;
    float _988 = -_964;
    float _990 = fma(_986, _988, 1.0);
    float3 _3387 = float3(_974, _984, _962);
    float _992 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3387, float3(0.0), isnan(_3387)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3387, float3(0.0), isnan(_3387)), level(0.0)).x;
    float3 _3398 = float3(_974, _984, _962);
    float4 _995 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3398, float3(0.0), isnan(_3398)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3398, float3(0.0), isnan(_3398)), level(0.0)).xyzw;
    float _997 = _995.x;
    float _999 = _995.y;
    float _1001 = _995.z;
    float _1003 = _995.w;
    float2 _3415 = float2(_990, _982);
    float3 _1007 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3415, float2(0.0), isnan(_3415)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3415, float2(0.0), isnan(_3415)), level(0.0)).xyz;
    float _1009 = _1007.x;
    float _1011 = _1007.y;
    float _1013 = _1007.z;
    float _1015 = in.m_57.y;
    float _1017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1019 = in.m_51.x;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1023 = _1021 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1025 = in.m_57.z;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1029 = _1027 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1031 = 1.0 / _1023;
    float _1033 = in.m_51.w;
    int _1035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1037 = _1035 != 0;
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1043 = in.m_51.y;
    float _1045 = 1.0 / _1029;
    float _1047 = in.m_57.x;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1051 = _1049 != 0;
    float _1053 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1055 = _1053 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _1057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1059 = _1057 != 0;
    out.m_59.y = _1015;
    int _1061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1063 = _1061 != 0;
    float _1065 = 1.0 / _1041;
    float _1067 = in.m_61.y;
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1071 = _1069 != 0;
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1073;
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1079 = _1077 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1081 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    out.m_59.z = _1025;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1087 = _1085 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1089 = _1033 > 0.5;
    float _1091 = 1.0 / _1055;
    float _1093 = -_1083;
    float _1095 = fma(_1081, 2.0, _1093);
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1099 = _1043 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1101 = _1081;
    bool _1103 = _1089;
    if (_1037)
    {
        float _1105 = in.m_51.z;
        _1101 = _1105;
    }
    float _1107 = _1101;
    float _1109 = _1075 * _1031;
    float _1111 = fma(_1099, -2.0, _1097);
    float _1113 = in.m_57.w;
    float _1115 = 1.0 / _1087;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    out.m_59.x = _1047;
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1123 = _1121 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1125 = -_1067;
    float _1127 = _1125 + 1.0;
    float _1129 = 0.0;
    float _1131 = _1067;
    if (!_1071)
    {
        float _1133 = in.m_51.z;
        _1129 = _1133;
    }
    float _1135 = _1129;
    float _1137 = 1.0 / _1079;
    float _1139 = _1123 * _1045;
    float _1141 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1141;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1147 = _1145 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    int _1149 = _1089 ? as_type<int>(_1127) : as_type<int>(_1067);
    float _1151 = _1143 * _1065;
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1153;
    float _1157 = 1.0 / _1119;
    float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1161 = _1159 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1163 = _1147 * _1091;
    float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1167 = _1165 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1169 = _1155 * _1115;
    bool _1171 = false;
    if (_1037)
    {
        bool _1173 = _1107 > 0.5;
        _1171 = _1173;
    }
    bool _1175 = _1171;
    float _1177 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1179 = _452 + _1177;
    out.m_59.w = _1113;
    float _1181 = 1.0 / _1161;
    float _1183 = _1167 * _1137;
    float _1185 = fma(_1109, _1179, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1187 = _1059 ? as_type<float>(_1149) : _1067;
    float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1191 = _454 + _1189;
    float _1193 = 0.0;
    float _1195 = _1135;
    if (!_1071)
    {
        _1193 = _1043;
    }
    float _1197 = _1193;
    float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1201 = _454 + _1199;
    float _1203 = fma(_1163, _1191, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1207 = _454 + _1205;
    bool _1209 = _1043 > 0.5;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1213 = _1211 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1215 = _1197;
    float _1217 = _1201;
    if (_1051)
    {
        bool _1219 = _1019 > 0.5;
        _1103 = _1219;
    }
    bool _1221 = _1103;
    float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1223;
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1229 = _1227 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    if (_1071)
    {
        _1215 = _1019;
    }
    float _1231 = _1215;
    float _1233 = fma(_1151, _1201, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    if (_1063)
    {
        float _1235 = _1209 ? _1127 : _1067;
        _1131 = _1235;
    }
    float _1237 = _1131;
    float _1239 = _1229 * _1157;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1243 = _470 != 0.0;
    bool _1245 = isnan(_470);
    bool _1247 = _1243 || _1245;
    bool _1249 = isnan(0.0);
    bool _1251 = _1247 || _1249;
    float _1253 = 1.0 / _1213;
    float _1255 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1241);
    bool _1257 = _468 == 0.0;
    bool _1259 = !_1251;
    bool _1261 = _1257 && _1259;
    float _1263 = in.m_63.x;
    float _1265 = in.m_63.y;
    float _1267 = in.m_63.z;
    float _1269 = _1225 * _1181;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1273 = _472 == 0.0;
    bool _1275 = _1273 && _1261;
    float _1277 = fma(_1269, _1207, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1279 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1281;
    if (!_1071)
    {
        _1217 = _1135;
    }
    float _1285 = _1217;
    float _1287 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1271);
    float _1289 = _1285;
    if (_1071)
    {
        _1289 = _1043;
    }
    float _1291 = _1289;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1295 = _454 + _1293;
    if (_1071)
    {
        _1195 = _1043;
    }
    float _1297 = _1195;
    float _1299 = fma(_1187, _1279, -0.5);
    float _1301 = _1283 * _1253;
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1305 = _454 + _1303;
    bool _1307 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1309 = isnan(_454);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1315 = _1311 || _1313;
    float _1317 = float(_1315);
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1321 = _452 + _1319;
    bool _1323 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1325 = isnan(_452);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1331 = _1327 || _1329;
    float _1333 = float(_1331);
    float _1335 = in.m_61.x;
    bool _1337 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1339 = isnan(_454);
    bool _1341 = _1337 || _1339;
    bool _1343 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1345 = _1341 || _1343;
    float _1347 = float(_1345);
    float _1349 = -_1317;
    float _1351 = _1349 + 1.0;
    float _1353 = fma(_1183, _1295, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1355 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1357 = isnan(_454);
    bool _1359 = _1355 || _1357;
    bool _1361 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1363 = _1359 || _1361;
    float _1365 = float(_1363);
    float _1367 = _1263;
    float _1369 = _1265;
    float _1371 = _1267;
    if (!_1275)
    {
        float _1373 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1263);
        _1367 = _1373;
    }
    float _1375 = _1367;
    bool _1377 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1379 = isnan(_454);
    bool _1381 = _1377 || _1379;
    bool _1383 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1385 = _1381 || _1383;
    float _1387 = float(_1385);
    if (!_1275)
    {
        float _1389 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1265);
        _1369 = _1389;
    }
    float _1391 = _1369;
    float _1393 = fma(_1301, _1305, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    if (!_1275)
    {
        float _1395 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1267);
        _1371 = _1395;
    }
    float _1397 = _1371;
    bool _1399 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1401 = isnan(_454);
    bool _1403 = _1399 || _1401;
    bool _1405 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1407 = _1403 || _1405;
    float _1409 = float(_1407);
    float _1411 = -_1387;
    float _1413 = _1411 + 1.0;
    bool _1415 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1417 = isnan(_452);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1423 = _1419 || _1421;
    float _1425 = float(_1423);
    float _1427 = -_1347;
    float _1429 = _1427 + 1.0;
    bool _1431 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1433 = isnan(_452);
    bool _1435 = _1431 || _1433;
    bool _1437 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1439 = _1435 || _1437;
    float _1441 = float(_1439);
    float _1443 = _1409 * _1413;
    float _1445 = -_1409;
    float _1447 = _1445 + 1.0;
    float _1449 = -_1425;
    float _1451 = _1449 + 1.0;
    float _1453 = fma(_1139, _1321, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1457 = _454 + _1455;
    float _1459 = _1317 * _1447;
    float _1461 = _1441 * _1451;
    float _1463 = -_1441;
    float _1465 = _1463 + 1.0;
    float _1467 = _1347 * _1351;
    bool _1469 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1471 = isnan(_454);
    bool _1473 = _1469 || _1471;
    bool _1475 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1477 = _1473 || _1475;
    float _1479 = float(_1477);
    float _1481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1483 = _1333 * _1465;
    float _1485 = _1365 * _1429;
    float _1487 = -_1365;
    float _1489 = _1487 + 1.0;
    float _1491 = fma(_1169, _1457, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1493 = _1185 * _1483;
    float _1495 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1497 = _454 + _1495;
    bool _1499 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1501 = isnan(_454);
    bool _1503 = _1499 || _1501;
    bool _1505 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1507 = _1503 || _1505;
    float _1509 = float(_1507);
    float _1511 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1513 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1515 = isnan(_454);
    bool _1517 = _1513 || _1515;
    bool _1519 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1521 = _1517 || _1519;
    float _1523 = float(_1521);
    float _1525 = _1479 * _1489;
    float _1527 = -_1479;
    float _1529 = _1527 + 1.0;
    float _1531 = fma(_1239, _1497, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1533 = _1481 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1535 = _1523 * _1529;
    float _1537 = -_1523;
    float _1539 = _1537 + 1.0;
    float _1541 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1511);
    float _1543 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1545 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1547 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1549 = _1497;
    int _1551 = as_type<int>(_1543);
    float _1553 = _1335;
    if (!_1051)
    {
        _1549 = _1335;
    }
    float _1555 = _1549;
    float _1557 = fma(_1533, _1237, -0.5);
    float _1559 = -_1543;
    float _1561 = fma(_1545, 2.0, _1559);
    float _1563 = _1555;
    if (_1051)
    {
        float _1565 = -_1335;
        float _1567 = _1565 + 1.0;
        _1551 = as_type<int>(_1567);
    }
    int _1569 = _1551;
    float _1571 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1547);
    float _1573 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1287);
    float _1575 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1111);
    float _1577 = _1509 * _1539;
    int _1579 = as_type<int>(_1577);
    if (_1051)
    {
        float _1581 = _1221 ? as_type<float>(_1569) : _1335;
        _1563 = _1581;
    }
    float _1583 = _1563;
    float _1585 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1587 = -_1575;
    float _1589 = fma(_1573, _1557, _1587);
    float _1591 = _1233 * _1577;
    float _1593 = -_1509;
    float _1595 = _1593 + 1.0;
    if (_1037)
    {
        float _1597 = -_1335;
        float _1599 = _1597 + 1.0;
        _1579 = as_type<int>(_1599);
    }
    int _1601 = _1579;
    float _1603 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1605 = _1291 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1607 = fma(_1595, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1591);
    float _1609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1037)
    {
        float _1611 = _1175 ? as_type<float>(_1601) : _1335;
        _1553 = _1611;
    }
    float _1613 = _1553;
    float _1615 = fma(_1605, -2.0, _1603);
    float _1617 = _1391 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1619 = _1391 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1621 = fma(_1203, _1535, _1607);
    float _1623 = _1391 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1625 = fma(_1375, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1617);
    float _1627 = fma(_1375, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1619);
    float _1629 = fma(_1491, _1525, _1621);
    float _1631 = fma(_1375, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1623);
    float _1633 = -_1333;
    float _1635 = _1633 + 1.0;
    float _1637 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1625);
    float _1639 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1627);
    float _1641 = fma(_1353, _1485, _1629);
    float _1643 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1631);
    float _1645 = fma(_1635, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1493);
    float _1647 = _1585 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1649 = _1609 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1651 = fma(_1277, _1467, _1641);
    float _1653 = -_506;
    float _1655 = fma(_1653, (*spvDescriptorSet0.vp_c9)._m0[18].w, _480);
    out.m_65.x = _1637;
    out.m_65.y = _1639;
    out.m_65.z = _1643;
    float _1657 = -_508;
    float _1659 = fma(_1657, (*spvDescriptorSet0.vp_c9)._m0[18].w, _482);
    float _1661 = fma(_1453, _1461, _1645);
    float _1663 = fma(_1647, _1583, -0.5);
    float _1665 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1255);
    float _1667 = -_130;
    float _1669 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1095);
    float _1671 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1541);
    float _1673 = -_130;
    float _1675 = fma(_1673, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1561);
    float _1677 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1571);
    float _1679 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1615);
    float _1681 = fma(_1649, _1613, -0.5);
    float _1683 = fma(_1531, _1459, _1651);
    float _1685 = _1655 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1687 = -_510;
    float _1689 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[18].w, _484);
    float _1691 = fma(_1665, _1663, _1669);
    float _1693 = fma(_1671, _1681, _1675);
    float _1695 = -_1679;
    float _1697 = fma(_1677, _1299, _1695);
    float _1699 = fma(_1425, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1661);
    float _1701 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1703 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1705 = fma(_1393, _1443, _1683);
    float _1707 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1709 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1685);
    float _1711 = _1701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1713 = _1703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1715 = _1707 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1717 = _1589 + 0.5;
    float _1719 = _1699 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1721 = _1691 + 0.5;
    float _1723 = _1693 + 0.5;
    float _1725 = _1697 + 0.5;
    float _1727 = fma(_1387, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1705);
    float _1729 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1709);
    float _1731 = _1655 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_67.x = _1711;
    out.m_67.y = _1713;
    out.m_67.z = _1715;
    out.m_67.w = _1719;
    bool _1733 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1735 = isnan(0.5);
    bool _1737 = _1733 || _1735;
    bool _1739 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1741 = _1737 || _1739;
    float _1743 = _1729 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1745 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1731);
    out.m_69.x = _1721;
    out.m_69.y = _1717;
    out.m_69.z = _1723;
    out.m_69.w = _1725;
    float _1747 = _912 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1749 = 1.0 / _1743;
    float _1751 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1745);
    out.m_71.x = _1727;
    float _1753 = _880 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1755 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1757 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1753);
    float _1759 = exp2(_1747);
    float _1761 = _1755 + _1743;
    float _1763 = _1689;
    if (_1741)
    {
        _1763 = 1.0;
    }
    float _1765 = _1763;
    float _1767 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1757);
    float _1769 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1767);
    float _1771 = _1761 * _1749;
    float _1773 = _1771 * 0.5;
    float _1775 = _1765;
    if (!_1741)
    {
        float _1777 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1779 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1781 = _1777 * 0.15915493667125701904296875;
        float _1783 = _1779 * 0.15915493667125701904296875;
        float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1787 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1785);
        float _1789 = _1781 * 6.283185482025146484375;
        float _1791 = cos(_1789);
        float _1793 = _1781 * 6.283185482025146484375;
        float _1795 = sin(_1793);
        float _1797 = 1.0 / _1791;
        float _1799 = _1783 * 6.283185482025146484375;
        float _1801 = cos(_1799);
        float _1803 = _1795 * _1797;
        float _1805 = _1783 * 6.283185482025146484375;
        float _1807 = sin(_1805);
        float _1809 = _1801 * _1803;
        float _1811 = 1.0 / _1787;
        float _1813 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1815 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1813;
        float _1817 = 1.0 / _1809;
        float _1819 = 1.0 / _1815;
        float _1821 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1823 = _1811 * _1821;
        float _1825 = _1807 * _1817;
        float _1827 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1829 = fma(_1825, _1823, _1827);
        float _1831 = _1829 * _1819;
        float _1833 = precise::clamp(_1831, 0.0, 1.0);
        _1775 = _1833;
    }
    float _1835 = _1775;
    float _1837 = -_1759;
    float _1839 = _1837 + 1.0;
    float _1841 = _1769 + _916;
    float _1843 = _1835 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1845 = _1835 > 0.0;
    bool _1847 = isnan(_1835);
    bool _1849 = _1845 || _1847;
    bool _1851 = isnan(0.0);
    bool _1853 = _1849 || _1851;
    float _1855 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1857 = _1841 * 0.5;
    float _1859 = _1843 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = _686;
    out.m_73.y = _682;
    out.m_73.z = _690;
    float _1861 = _1855 * _992;
    float _1863 = -_1855;
    float _1865 = _1863 + 1.0;
    out.gl_Position.x = _960;
    out.gl_Position.y = _972;
    out.gl_Position.z = _1769;
    out.gl_Position.w = _916;
    float _1867 = _1003 * _1861;
    float _1869 = _1013 * _1861;
    float _1871 = _1003 * _1865;
    out.m_75.z = _1857;
    out.m_75.w = _916;
    float _1873 = fma(_1009, _1867, _997);
    float _1875 = fma(_1011, _1867, _999);
    float _1877 = fma(_1003, _1869, _1001);
    out.m_45.x = _1859;
    out.m_77.x = _1873;
    out.m_77.y = _1875;
    out.m_77.z = _1877;
    out.m_77.w = _1871;
    if (_1853)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1879 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1879;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _444 = false;
    bool _292 = false;
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
        float _1936 = as_type<float>(_112);
        out.gl_Position.z = _1936;
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
    float _132 = 0.0;
    if (_126)
    {
        float _134 = float(_96);
        _132 = _134;
    }
    float _136 = _132;
    bool _138 = _130 >= _136;
    bool _140 = !_126;
    bool _142 = _138 || _140;
    if (_142)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _106;
    if (_142)
    {
        out.m_45.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _114 = as_type<int>(_146);
    }
    int _148 = _114;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2004 = as_type<float>(_148);
        out.gl_Position.z = _2004;
    }
    if (_142)
    {
        return out;
    }
    float _150 = in.m_49.w;
    float _152 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_47.x;
    float _166 = in.m_47.y;
    float _168 = in.m_47.z;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
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
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
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
        float _274 = in.m_51.x;
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _278 = _274 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _282 = _280 * _276;
        float _284 = floor(_282);
        float _286 = -_284;
        float _288 = _282 + _286;
        _290 = _288;
        _292 = true;
    }
    else
    {
        float _294 = float(_96);
        float _296 = 1.0 / _294;
        float _298 = _130 * _296;
        _290 = _298;
    }
    _292 = false;
    float _300 = _290;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _304 = _300 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _310 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _312 = isnan(_300);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _326 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _328 = isnan(_300);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _338;
    bool _342 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _344 = isnan(_300);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = 1.0 / _308;
    float _356 = -_320;
    float _358 = _356 + 1.0;
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _362 = _336 * _358;
    float _364 = -_336;
    float _366 = _364 + 1.0;
    float _368 = 1.0 / _324;
    float _370 = _340 * _354;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _376 = fma(_370, _304, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _378 = _374 * _368;
    float _380 = _376 * _362;
    float _382 = -_352;
    float _384 = _382 + 1.0;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _388 = _300 + _386;
    float _390 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[115].x, _380);
    float _392 = _320 * _384;
    float _394 = fma(_378, _388, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _398 = fma(_394, _392, _390);
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _404 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[117].x, _398);
    float _406 = _396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _408 = _400 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _410 = _402 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _412 = _404 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _406;
    out.m_53.y = _408;
    out.m_53.z = _410;
    out.m_53.w = _412;
    bool _414 = !_360;
    float _416 = _412;
    float _440;
    float _442;
    if (!_414)
    {
        float _418 = in.m_51.x;
        float _420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _422 = float(_96);
        float _424 = 1.0 / _422;
        float _426 = _418 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _428 = _130 * _424;
        float _430 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[11].w, _130);
        float _432 = _430 * _420;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = _428;
        _444 = true;
    }
    else
    {
        float _446 = float(_96);
        float _448 = 1.0 / _446;
        float _450 = _130 * _448;
        _440 = _450;
        _442 = _450;
    }
    _444 = false;
    float _452 = _440;
    float _454 = _442;
    float _456 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _458 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _460 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _462 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _456);
    float _464 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _458);
    float _466 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _460);
    float _468 = in.m_55.x;
    float _470 = in.m_55.y;
    float _472 = in.m_55.z;
    float _474 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].z, _462);
    float _476 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].z, _464);
    float _478 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].z, _466);
    float _480 = _474 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _482 = _476 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _484 = _478 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _486 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _488 = _480 + _486;
    float _490 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _492 = _482 + _490;
    float _494 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _496 = _484 + _494;
    float _498 = _488 * _488;
    float _500 = fma(_492, _492, _498);
    float _502 = fma(_496, _496, _500);
    float _504 = rsqrt(_502);
    float _506 = _488 * _504;
    float _508 = _492 * _504;
    float _510 = _496 * _504;
    float _512 = -_506;
    float _514 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[18].w, _488);
    float _516 = -_508;
    float _518 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[18].w, _492);
    float _520 = -_510;
    float _522 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _496);
    float _524 = _514 * _514;
    float _526 = in.m_49.x;
    float _528 = in.m_49.y;
    float _530 = in.m_49.z;
    float _532 = fma(_518, _518, _524);
    float _534 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _468);
    float _536 = fma(_522, _522, _532);
    float _538 = sqrt(_536);
    float _540 = _528 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _542 = _526 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _544 = _504 * _538;
    float _546 = _530 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _548 = _540 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _550 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _470);
    float _552 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _554 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _556 = _548 * _544;
    float _558 = _552 * _544;
    float _560 = _554 * _544;
    float _562 = _556 * _550;
    float _564 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _472);
    float _566 = _558 * _534;
    float _568 = _562 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _570 = _560 * _564;
    float _572 = _562 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _574 = fma(_566, (*spvDescriptorSet0.vp_c10)._m0[10].x, _568);
    float _576 = fma(_566, (*spvDescriptorSet0.vp_c10)._m0[8].x, _572);
    float _578 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[10].z, _574);
    float _580 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[8].z, _576);
    float _582 = _484 + _578;
    float _584 = _482 + _580;
    float _586 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _588 = _582 + _586;
    float _590 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _592 = _584 + _590;
    float _594 = _588 * _588;
    float _596 = fma(_592, _592, _594);
    float _598 = _562 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _600 = sqrt(_596);
    float _602 = fma(_566, (*spvDescriptorSet0.vp_c10)._m0[9].x, _598);
    float _604 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[9].z, _602);
    float _606 = _480 + _604;
    bool _608 = _600 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _610 = _604;
    float _612 = _584;
    float _614 = _582;
    if (!_608)
    {
        _610 = _584;
    }
    float _616 = _610;
    float _618 = _616;
    if (!_608)
    {
        _612 = _606;
    }
    float _620 = _612;
    bool _622 = !_608;
    float _624 = _620;
    if (!_622)
    {
        float _626 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _628 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _630 = _600 + _628;
        float _632 = _606 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _634 = rsqrt(_596);
        float _636 = _630 * _626;
        float _638 = _636 * 0.15915493667125701904296875;
        float _640 = _638 * 6.283185482025146484375;
        float _642 = sin(_640);
        float _644 = _638 * 6.283185482025146484375;
        float _646 = cos(_644);
        float _648 = fma(_642, _632, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _650 = _634 * _648;
        float _652 = _646 + (-1.0);
        float _654 = fma(_592, _650, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _656 = fma(_588, _650, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _658 = _652 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _660 = fma(_606, _646, _658);
        _624 = _660;
        _618 = _654;
        _614 = _656;
    }
    float _662 = _624;
    float _664 = _618;
    float _666 = _614;
    float _668 = -_506;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[18].w, _662);
    float _672 = -_508;
    float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[18].w, _664);
    float _676 = -_510;
    float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[18].w, _666);
    float _680 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _682 = _670 + _680;
    float _684 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _686 = _674 + _684;
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _690 = _678 + _688;
    float _692 = _682 * _682;
    float _694 = fma(_686, _686, _692);
    float _696 = fma(_690, _690, _694);
    float _698 = rsqrt(_696);
    float _700 = sqrt(_696);
    float _702 = _698 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _704 = _686 * _702;
    float _706 = _690 * _702;
    float _708 = _704 * _704;
    float _710 = _706 * _706;
    float _712 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _714 = fma(_700, (*spvDescriptorSet0.vp_c15)._m0[23].w, _712);
    float _716 = precise::clamp(_714, 0.0, 1.0);
    float _718 = _708 + _710;
    float _720 = sqrt(_718);
    bool _722 = _720 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _724 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _726 = _720 + _724;
    float _728 = _694;
    float _730 = _718;
    float _732 = _726;
    float _734 = _704;
    if (_722)
    {
        float _736 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _728 = _736;
    }
    float _738 = _728;
    if (_722)
    {
        float _740 = rsqrt(_718);
        _730 = _740;
    }
    float _742 = _730;
    float _744 = _742;
    if (_722)
    {
        float _746 = _726 * _738;
        _732 = _746;
    }
    float _748 = _732;
    if (_722)
    {
        float _750 = _748 * 0.15915493667125701904296875;
        _416 = _750;
    }
    float _752 = _416;
    float _754 = _738;
    float _756 = _752;
    if (_722)
    {
        float _758 = _752 * 6.283185482025146484375;
        float _760 = sin(_758);
        _754 = _760;
    }
    float _762 = _754;
    float _764 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _766 = precise::max(0.0, _764);
    float _768 = _588;
    float _770 = _766;
    if (_722)
    {
        float _772 = _752 * 6.283185482025146484375;
        float _774 = cos(_772);
        _768 = _774;
    }
    float _776 = _768;
    float _778 = -_702;
    float _780 = -_766;
    float _782 = fma(_682, _778, _780);
    if (_722)
    {
        float _784 = _782 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _770 = _784;
    }
    float _786 = _770;
    float _788 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _790 = _762;
    float _792 = _786;
    if (_722)
    {
        float _794 = fma(_762, _786, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _790 = _794;
    }
    float _796 = _790;
    float _798 = _796;
    float _800 = _776;
    if (_722)
    {
        float _802 = _776 + (-1.0);
        _792 = _802;
    }
    float _804 = _792;
    float _806 = 0.0;
    float _808 = _804;
    if (_722)
    {
        float _810 = _742 * _796;
        _806 = _810;
    }
    float _812 = _806;
    if (!_722)
    {
        _798 = _782;
    }
    float _814 = _798;
    float _816 = _814;
    if (_722)
    {
        float _818 = _804 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _756 = _818;
    }
    float _820 = _756;
    if (_722)
    {
        float _822 = _704 * _812;
        _734 = _822;
    }
    float _824 = _734;
    if (!_722)
    {
        _808 = _706;
    }
    float _826 = _808;
    float _828 = _826;
    if (_722)
    {
        float _830 = _706 * _812;
        _828 = _830;
    }
    float _832 = _828;
    if (_722)
    {
        float _834 = fma(_782, _776, _820);
        _816 = _834;
    }
    float _836 = _816;
    if (!_722)
    {
        _800 = _708;
    }
    float _838 = _800;
    float _840 = _838;
    if (_722)
    {
        float _842 = _824 * _824;
        _840 = _842;
    }
    float _844 = _840;
    float _846 = _670 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_722)
    {
        _744 = _710;
    }
    float _848 = _744;
    float _850 = _848;
    if (_722)
    {
        float _852 = _832 * _832;
        _850 = _852;
    }
    float _854 = _850;
    float _856 = fma(_836, _836, _844);
    float _858 = _670 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _860 = _670 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _862 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[1].x, _846);
    float _864 = _856 + _854;
    float _866 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[2].x, _858);
    float _868 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[0].x, _860);
    float _870 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[1].z, _862);
    float _872 = rsqrt(_864);
    float _874 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[2].z, _866);
    float _876 = _670 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _878 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[0].z, _868);
    float _880 = _870 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _882 = _874 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _884 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[3].x, _876);
    float _886 = _878 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _888 = _880 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _890 = _882 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _892 = -_716;
    float _894 = _892 + 1.0;
    float _896 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[3].z, _884);
    float _898 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[7].x, _888);
    float _900 = -_890;
    float _902 = fma(_900, _788, 1.0);
    float _904 = _896 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _906 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[7].z, _898);
    float _908 = _872 * _824;
    float _910 = abs(_894);
    float _912 = log2(_910);
    float _914 = _872 * _836;
    float _916 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[7].w, _906);
    float _918 = _908 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _920 = _872 * _832;
    float _922 = _880 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _924 = -_918;
    float _926 = fma(_914, (*spvDescriptorSet0.vp_c15)._m0[21].y, _924);
    float _928 = log2(_902);
    float _930 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[5].x, _922);
    float _932 = -_920;
    float _934 = fma(_932, (*spvDescriptorSet0.vp_c15)._m0[21].z, _926);
    float _936 = _880 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _938 = fma(_934, -0.5, 0.5);
    float _940 = _912 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _942 = 1.0 / _916;
    float _944 = fma(_934, 0.5, 0.5);
    float _946 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[4].x, _936);
    float _948 = _914 + 1.0;
    float _950 = fma(_944, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _952 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[4].z, _946);
    float _954 = _928 * 0.693147182464599609375;
    float _956 = exp2(_940);
    float _958 = fma(_944, _950, -0.212114393711090087890625);
    float _960 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[4].w, _952);
    float _962 = _954 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _964 = fma(_944, _958, 1.570728778839111328125);
    float _966 = sqrt(_938);
    float _968 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[5].z, _930);
    float _970 = _960 * _942;
    float _972 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[5].w, _968);
    float _974 = fma(_970, 0.5, 0.5);
    float _976 = -_914;
    float _978 = fma(_956, _948, _976);
    float _980 = _972 * _942;
    float _982 = fma(_978, 0.5, 0.5);
    float _984 = fma(_980, -0.5, 0.5);
    float _986 = _966 * 0.636619746685028076171875;
    float _988 = -_964;
    float _990 = fma(_986, _988, 1.0);
    float3 _3387 = float3(_974, _984, _962);
    float _992 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3387, float3(0.0), isnan(_3387)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3387, float3(0.0), isnan(_3387)), level(0.0)).x;
    float3 _3398 = float3(_974, _984, _962);
    float4 _995 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3398, float3(0.0), isnan(_3398)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3398, float3(0.0), isnan(_3398)), level(0.0)).xyzw;
    float _997 = _995.x;
    float _999 = _995.y;
    float _1001 = _995.z;
    float _1003 = _995.w;
    float2 _3415 = float2(_990, _982);
    float3 _1007 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3415, float2(0.0), isnan(_3415)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3415, float2(0.0), isnan(_3415)), level(0.0)).xyz;
    float _1009 = _1007.x;
    float _1011 = _1007.y;
    float _1013 = _1007.z;
    float _1015 = in.m_57.y;
    float _1017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1019 = in.m_51.x;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1023 = _1021 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1025 = in.m_57.z;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1029 = _1027 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1031 = 1.0 / _1023;
    float _1033 = in.m_51.w;
    int _1035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1037 = _1035 != 0;
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1043 = in.m_51.y;
    float _1045 = 1.0 / _1029;
    float _1047 = in.m_57.x;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1051 = _1049 != 0;
    float _1053 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1055 = _1053 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _1057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1059 = _1057 != 0;
    out.m_59.y = _1015;
    int _1061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1063 = _1061 != 0;
    float _1065 = 1.0 / _1041;
    float _1067 = in.m_61.y;
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1071 = _1069 != 0;
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1073;
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1079 = _1077 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1081 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    out.m_59.z = _1025;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1087 = _1085 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1089 = _1033 > 0.5;
    float _1091 = 1.0 / _1055;
    float _1093 = -_1083;
    float _1095 = fma(_1081, 2.0, _1093);
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1099 = _1043 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1101 = _1081;
    bool _1103 = _1089;
    if (_1037)
    {
        float _1105 = in.m_51.z;
        _1101 = _1105;
    }
    float _1107 = _1101;
    float _1109 = _1075 * _1031;
    float _1111 = fma(_1099, -2.0, _1097);
    float _1113 = in.m_57.w;
    float _1115 = 1.0 / _1087;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    out.m_59.x = _1047;
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1123 = _1121 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1125 = -_1067;
    float _1127 = _1125 + 1.0;
    float _1129 = 0.0;
    float _1131 = _1067;
    if (!_1071)
    {
        float _1133 = in.m_51.z;
        _1129 = _1133;
    }
    float _1135 = _1129;
    float _1137 = 1.0 / _1079;
    float _1139 = _1123 * _1045;
    float _1141 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1141;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1147 = _1145 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    int _1149 = _1089 ? as_type<int>(_1127) : as_type<int>(_1067);
    float _1151 = _1143 * _1065;
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1153;
    float _1157 = 1.0 / _1119;
    float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1161 = _1159 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1163 = _1147 * _1091;
    float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1167 = _1165 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1169 = _1155 * _1115;
    bool _1171 = false;
    if (_1037)
    {
        bool _1173 = _1107 > 0.5;
        _1171 = _1173;
    }
    bool _1175 = _1171;
    float _1177 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1179 = _452 + _1177;
    out.m_59.w = _1113;
    float _1181 = 1.0 / _1161;
    float _1183 = _1167 * _1137;
    float _1185 = fma(_1109, _1179, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1187 = _1059 ? as_type<float>(_1149) : _1067;
    float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1191 = _454 + _1189;
    float _1193 = 0.0;
    float _1195 = _1135;
    if (!_1071)
    {
        _1193 = _1043;
    }
    float _1197 = _1193;
    float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1201 = _454 + _1199;
    float _1203 = fma(_1163, _1191, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1207 = _454 + _1205;
    bool _1209 = _1043 > 0.5;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1213 = _1211 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1215 = _1197;
    float _1217 = _1201;
    if (_1051)
    {
        bool _1219 = _1019 > 0.5;
        _1103 = _1219;
    }
    bool _1221 = _1103;
    float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1223;
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1229 = _1227 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    if (_1071)
    {
        _1215 = _1019;
    }
    float _1231 = _1215;
    float _1233 = fma(_1151, _1201, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    if (_1063)
    {
        float _1235 = _1209 ? _1127 : _1067;
        _1131 = _1235;
    }
    float _1237 = _1131;
    float _1239 = _1229 * _1157;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1243 = _470 != 0.0;
    bool _1245 = isnan(_470);
    bool _1247 = _1243 || _1245;
    bool _1249 = isnan(0.0);
    bool _1251 = _1247 || _1249;
    float _1253 = 1.0 / _1213;
    float _1255 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1241);
    bool _1257 = _468 == 0.0;
    bool _1259 = !_1251;
    bool _1261 = _1257 && _1259;
    float _1263 = in.m_63.x;
    float _1265 = in.m_63.y;
    float _1267 = in.m_63.z;
    float _1269 = _1225 * _1181;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1273 = _472 == 0.0;
    bool _1275 = _1273 && _1261;
    float _1277 = fma(_1269, _1207, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1279 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1281;
    if (!_1071)
    {
        _1217 = _1135;
    }
    float _1285 = _1217;
    float _1287 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1271);
    float _1289 = _1285;
    if (_1071)
    {
        _1289 = _1043;
    }
    float _1291 = _1289;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1295 = _454 + _1293;
    if (_1071)
    {
        _1195 = _1043;
    }
    float _1297 = _1195;
    float _1299 = fma(_1187, _1279, -0.5);
    float _1301 = _1283 * _1253;
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1305 = _454 + _1303;
    bool _1307 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1309 = isnan(_454);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1315 = _1311 || _1313;
    float _1317 = float(_1315);
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1321 = _452 + _1319;
    bool _1323 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1325 = isnan(_452);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1331 = _1327 || _1329;
    float _1333 = float(_1331);
    float _1335 = in.m_61.x;
    bool _1337 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1339 = isnan(_454);
    bool _1341 = _1337 || _1339;
    bool _1343 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1345 = _1341 || _1343;
    float _1347 = float(_1345);
    float _1349 = -_1317;
    float _1351 = _1349 + 1.0;
    float _1353 = fma(_1183, _1295, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1355 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1357 = isnan(_454);
    bool _1359 = _1355 || _1357;
    bool _1361 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1363 = _1359 || _1361;
    float _1365 = float(_1363);
    float _1367 = _1263;
    float _1369 = _1265;
    float _1371 = _1267;
    if (!_1275)
    {
        float _1373 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1263);
        _1367 = _1373;
    }
    float _1375 = _1367;
    bool _1377 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1379 = isnan(_454);
    bool _1381 = _1377 || _1379;
    bool _1383 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1385 = _1381 || _1383;
    float _1387 = float(_1385);
    if (!_1275)
    {
        float _1389 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1265);
        _1369 = _1389;
    }
    float _1391 = _1369;
    float _1393 = fma(_1301, _1305, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    if (!_1275)
    {
        float _1395 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1267);
        _1371 = _1395;
    }
    float _1397 = _1371;
    bool _1399 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1401 = isnan(_454);
    bool _1403 = _1399 || _1401;
    bool _1405 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1407 = _1403 || _1405;
    float _1409 = float(_1407);
    float _1411 = -_1387;
    float _1413 = _1411 + 1.0;
    bool _1415 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1417 = isnan(_452);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1423 = _1419 || _1421;
    float _1425 = float(_1423);
    float _1427 = -_1347;
    float _1429 = _1427 + 1.0;
    bool _1431 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1433 = isnan(_452);
    bool _1435 = _1431 || _1433;
    bool _1437 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1439 = _1435 || _1437;
    float _1441 = float(_1439);
    float _1443 = _1409 * _1413;
    float _1445 = -_1409;
    float _1447 = _1445 + 1.0;
    float _1449 = -_1425;
    float _1451 = _1449 + 1.0;
    float _1453 = fma(_1139, _1321, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1457 = _454 + _1455;
    float _1459 = _1317 * _1447;
    float _1461 = _1441 * _1451;
    float _1463 = -_1441;
    float _1465 = _1463 + 1.0;
    float _1467 = _1347 * _1351;
    bool _1469 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1471 = isnan(_454);
    bool _1473 = _1469 || _1471;
    bool _1475 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1477 = _1473 || _1475;
    float _1479 = float(_1477);
    float _1481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1483 = _1333 * _1465;
    float _1485 = _1365 * _1429;
    float _1487 = -_1365;
    float _1489 = _1487 + 1.0;
    float _1491 = fma(_1169, _1457, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1493 = _1185 * _1483;
    float _1495 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1497 = _454 + _1495;
    bool _1499 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1501 = isnan(_454);
    bool _1503 = _1499 || _1501;
    bool _1505 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1507 = _1503 || _1505;
    float _1509 = float(_1507);
    float _1511 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1513 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1515 = isnan(_454);
    bool _1517 = _1513 || _1515;
    bool _1519 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1521 = _1517 || _1519;
    float _1523 = float(_1521);
    float _1525 = _1479 * _1489;
    float _1527 = -_1479;
    float _1529 = _1527 + 1.0;
    float _1531 = fma(_1239, _1497, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1533 = _1481 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1535 = _1523 * _1529;
    float _1537 = -_1523;
    float _1539 = _1537 + 1.0;
    float _1541 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1511);
    float _1543 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1545 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1547 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1549 = _1497;
    int _1551 = as_type<int>(_1543);
    float _1553 = _1335;
    if (!_1051)
    {
        _1549 = _1335;
    }
    float _1555 = _1549;
    float _1557 = fma(_1533, _1237, -0.5);
    float _1559 = -_1543;
    float _1561 = fma(_1545, 2.0, _1559);
    float _1563 = _1555;
    if (_1051)
    {
        float _1565 = -_1335;
        float _1567 = _1565 + 1.0;
        _1551 = as_type<int>(_1567);
    }
    int _1569 = _1551;
    float _1571 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1547);
    float _1573 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1287);
    float _1575 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1111);
    float _1577 = _1509 * _1539;
    int _1579 = as_type<int>(_1577);
    if (_1051)
    {
        float _1581 = _1221 ? as_type<float>(_1569) : _1335;
        _1563 = _1581;
    }
    float _1583 = _1563;
    float _1585 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1587 = -_1575;
    float _1589 = fma(_1573, _1557, _1587);
    float _1591 = _1233 * _1577;
    float _1593 = -_1509;
    float _1595 = _1593 + 1.0;
    if (_1037)
    {
        float _1597 = -_1335;
        float _1599 = _1597 + 1.0;
        _1579 = as_type<int>(_1599);
    }
    int _1601 = _1579;
    float _1603 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1605 = _1291 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1607 = fma(_1595, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1591);
    float _1609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1037)
    {
        float _1611 = _1175 ? as_type<float>(_1601) : _1335;
        _1553 = _1611;
    }
    float _1613 = _1553;
    float _1615 = fma(_1605, -2.0, _1603);
    float _1617 = _1391 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1619 = _1391 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1621 = fma(_1203, _1535, _1607);
    float _1623 = _1391 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1625 = fma(_1375, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1617);
    float _1627 = fma(_1375, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1619);
    float _1629 = fma(_1491, _1525, _1621);
    float _1631 = fma(_1375, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1623);
    float _1633 = -_1333;
    float _1635 = _1633 + 1.0;
    float _1637 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1625);
    float _1639 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1627);
    float _1641 = fma(_1353, _1485, _1629);
    float _1643 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1631);
    float _1645 = fma(_1635, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1493);
    float _1647 = _1585 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1649 = _1609 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1651 = fma(_1277, _1467, _1641);
    float _1653 = -_506;
    float _1655 = fma(_1653, (*spvDescriptorSet0.vp_c9)._m0[18].w, _480);
    out.m_65.x = _1637;
    out.m_65.y = _1639;
    out.m_65.z = _1643;
    float _1657 = -_508;
    float _1659 = fma(_1657, (*spvDescriptorSet0.vp_c9)._m0[18].w, _482);
    float _1661 = fma(_1453, _1461, _1645);
    float _1663 = fma(_1647, _1583, -0.5);
    float _1665 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1255);
    float _1667 = -_130;
    float _1669 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1095);
    float _1671 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1541);
    float _1673 = -_130;
    float _1675 = fma(_1673, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1561);
    float _1677 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1571);
    float _1679 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1615);
    float _1681 = fma(_1649, _1613, -0.5);
    float _1683 = fma(_1531, _1459, _1651);
    float _1685 = _1655 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1687 = -_510;
    float _1689 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[18].w, _484);
    float _1691 = fma(_1665, _1663, _1669);
    float _1693 = fma(_1671, _1681, _1675);
    float _1695 = -_1679;
    float _1697 = fma(_1677, _1299, _1695);
    float _1699 = fma(_1425, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1661);
    float _1701 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1703 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1705 = fma(_1393, _1443, _1683);
    float _1707 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1709 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1685);
    float _1711 = _1701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1713 = _1703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1715 = _1707 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1717 = _1589 + 0.5;
    float _1719 = _1699 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1721 = _1691 + 0.5;
    float _1723 = _1693 + 0.5;
    float _1725 = _1697 + 0.5;
    float _1727 = fma(_1387, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1705);
    float _1729 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1709);
    float _1731 = _1655 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_67.x = _1711;
    out.m_67.y = _1713;
    out.m_67.z = _1715;
    out.m_67.w = _1719;
    bool _1733 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1735 = isnan(0.5);
    bool _1737 = _1733 || _1735;
    bool _1739 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1741 = _1737 || _1739;
    float _1743 = _1729 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1745 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1731);
    out.m_69.x = _1721;
    out.m_69.y = _1717;
    out.m_69.z = _1723;
    out.m_69.w = _1725;
    float _1747 = _912 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1749 = 1.0 / _1743;
    float _1751 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1745);
    out.m_71.x = _1727;
    float _1753 = _880 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1755 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1757 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1753);
    float _1759 = exp2(_1747);
    float _1761 = _1755 + _1743;
    float _1763 = _1689;
    if (_1741)
    {
        _1763 = 1.0;
    }
    float _1765 = _1763;
    float _1767 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1757);
    float _1769 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1767);
    float _1771 = _1761 * _1749;
    float _1773 = _1771 * 0.5;
    float _1775 = _1765;
    if (!_1741)
    {
        float _1777 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1779 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1781 = _1777 * 0.15915493667125701904296875;
        float _1783 = _1779 * 0.15915493667125701904296875;
        float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1787 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1785);
        float _1789 = _1781 * 6.283185482025146484375;
        float _1791 = cos(_1789);
        float _1793 = _1781 * 6.283185482025146484375;
        float _1795 = sin(_1793);
        float _1797 = 1.0 / _1791;
        float _1799 = _1783 * 6.283185482025146484375;
        float _1801 = cos(_1799);
        float _1803 = _1795 * _1797;
        float _1805 = _1783 * 6.283185482025146484375;
        float _1807 = sin(_1805);
        float _1809 = _1801 * _1803;
        float _1811 = 1.0 / _1787;
        float _1813 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1815 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1813;
        float _1817 = 1.0 / _1809;
        float _1819 = 1.0 / _1815;
        float _1821 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1823 = _1811 * _1821;
        float _1825 = _1807 * _1817;
        float _1827 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1829 = fma(_1825, _1823, _1827);
        float _1831 = _1829 * _1819;
        float _1833 = precise::clamp(_1831, 0.0, 1.0);
        _1775 = _1833;
    }
    float _1835 = _1775;
    float _1837 = -_1759;
    float _1839 = _1837 + 1.0;
    float _1841 = _1769 + _916;
    float _1843 = _1835 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1845 = _1835 > 0.0;
    bool _1847 = isnan(_1835);
    bool _1849 = _1845 || _1847;
    bool _1851 = isnan(0.0);
    bool _1853 = _1849 || _1851;
    float _1855 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1857 = _1841 * 0.5;
    float _1859 = _1843 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = _686;
    out.m_73.y = _682;
    out.m_73.z = _690;
    float _1861 = _1855 * _992;
    float _1863 = -_1855;
    float _1865 = _1863 + 1.0;
    out.gl_Position.x = _960;
    out.gl_Position.y = _972;
    out.gl_Position.z = _1769;
    out.gl_Position.w = _916;
    float _1867 = _1003 * _1861;
    float _1869 = _1013 * _1861;
    float _1871 = _1003 * _1865;
    out.m_75.z = _1857;
    out.m_75.w = _916;
    float _1873 = fma(_1009, _1867, _997);
    float _1875 = fma(_1011, _1867, _999);
    float _1877 = fma(_1003, _1869, _1001);
    out.m_45.x = _1859;
    out.m_77.x = _1873;
    out.m_77.y = _1875;
    out.m_77.z = _1877;
    out.m_77.w = _1871;
    if (_1853)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1879 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1879;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _444 = false;
    bool _292 = false;
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
        float _1936 = as_type<float>(_112);
        out.gl_Position.z = _1936;
    }
    if (!_100)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _116 = in.m_47.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = 0.0;
    if (_126)
    {
        float _134 = float(_96);
        _132 = _134;
    }
    float _136 = _132;
    bool _138 = _130 >= _136;
    bool _140 = !_126;
    bool _142 = _138 || _140;
    if (_142)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _106;
    if (_142)
    {
        out.m_45.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _114 = as_type<int>(_146);
    }
    int _148 = _114;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2004 = as_type<float>(_148);
        out.gl_Position.z = _2004;
    }
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_49.w;
    float _152 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_47.x;
    float _166 = in.m_47.y;
    float _168 = in.m_47.z;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
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
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
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
        float _274 = in.m_51.x;
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _278 = _274 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _282 = _280 * _276;
        float _284 = floor(_282);
        float _286 = -_284;
        float _288 = _282 + _286;
        _290 = _288;
        _292 = true;
    }
    else
    {
        float _294 = float(_96);
        float _296 = 1.0 / _294;
        float _298 = _130 * _296;
        _290 = _298;
    }
    _292 = false;
    float _300 = _290;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _304 = _300 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _310 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _312 = isnan(_300);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _326 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _328 = isnan(_300);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _338;
    bool _342 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _344 = isnan(_300);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = 1.0 / _308;
    float _356 = -_320;
    float _358 = _356 + 1.0;
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _362 = _336 * _358;
    float _364 = -_336;
    float _366 = _364 + 1.0;
    float _368 = 1.0 / _324;
    float _370 = _340 * _354;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _376 = fma(_370, _304, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _378 = _374 * _368;
    float _380 = _376 * _362;
    float _382 = -_352;
    float _384 = _382 + 1.0;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _388 = _300 + _386;
    float _390 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[115].x, _380);
    float _392 = _320 * _384;
    float _394 = fma(_378, _388, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _398 = fma(_394, _392, _390);
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _404 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[117].x, _398);
    float _406 = _396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _408 = _400 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _410 = _402 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _412 = _404 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _406;
    out.m_53.y = _408;
    out.m_53.z = _410;
    out.m_53.w = _412;
    bool _414 = !_360;
    float _416 = _412;
    float _440;
    float _442;
    if (!_414)
    {
        float _418 = in.m_51.x;
        float _420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _422 = float(_96);
        float _424 = 1.0 / _422;
        float _426 = _418 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _428 = _130 * _424;
        float _430 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[11].w, _130);
        float _432 = _430 * _420;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = _428;
        _444 = true;
    }
    else
    {
        float _446 = float(_96);
        float _448 = 1.0 / _446;
        float _450 = _130 * _448;
        _440 = _450;
        _442 = _450;
    }
    _444 = false;
    float _452 = _440;
    float _454 = _442;
    float _456 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _458 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _460 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _462 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _456);
    float _464 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _458);
    float _466 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _460);
    float _468 = in.m_55.x;
    float _470 = in.m_55.y;
    float _472 = in.m_55.z;
    float _474 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].z, _462);
    float _476 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].z, _464);
    float _478 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].z, _466);
    float _480 = _474 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _482 = _476 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _484 = _478 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _486 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _488 = _480 + _486;
    float _490 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _492 = _482 + _490;
    float _494 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _496 = _484 + _494;
    float _498 = _488 * _488;
    float _500 = fma(_492, _492, _498);
    float _502 = fma(_496, _496, _500);
    float _504 = rsqrt(_502);
    float _506 = _488 * _504;
    float _508 = _492 * _504;
    float _510 = _496 * _504;
    float _512 = -_506;
    float _514 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[18].w, _488);
    float _516 = -_508;
    float _518 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[18].w, _492);
    float _520 = -_510;
    float _522 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _496);
    float _524 = _514 * _514;
    float _526 = in.m_49.x;
    float _528 = in.m_49.y;
    float _530 = in.m_49.z;
    float _532 = fma(_518, _518, _524);
    float _534 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _468);
    float _536 = fma(_522, _522, _532);
    float _538 = sqrt(_536);
    float _540 = _528 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _542 = _526 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _544 = _504 * _538;
    float _546 = _530 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _548 = _540 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _550 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _470);
    float _552 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _554 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _556 = _548 * _544;
    float _558 = _552 * _544;
    float _560 = _554 * _544;
    float _562 = _556 * _550;
    float _564 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _472);
    float _566 = _558 * _534;
    float _568 = _562 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _570 = _560 * _564;
    float _572 = _562 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _574 = fma(_566, (*spvDescriptorSet0.vp_c10)._m0[10].x, _568);
    float _576 = fma(_566, (*spvDescriptorSet0.vp_c10)._m0[8].x, _572);
    float _578 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[10].z, _574);
    float _580 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[8].z, _576);
    float _582 = _484 + _578;
    float _584 = _482 + _580;
    float _586 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _588 = _582 + _586;
    float _590 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _592 = _584 + _590;
    float _594 = _588 * _588;
    float _596 = fma(_592, _592, _594);
    float _598 = _562 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _600 = sqrt(_596);
    float _602 = fma(_566, (*spvDescriptorSet0.vp_c10)._m0[9].x, _598);
    float _604 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[9].z, _602);
    float _606 = _480 + _604;
    bool _608 = _600 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _610 = _604;
    float _612 = _584;
    float _614 = _582;
    if (!_608)
    {
        _610 = _584;
    }
    float _616 = _610;
    float _618 = _616;
    if (!_608)
    {
        _612 = _606;
    }
    float _620 = _612;
    bool _622 = !_608;
    float _624 = _620;
    if (!_622)
    {
        float _626 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _628 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _630 = _600 + _628;
        float _632 = _606 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _634 = rsqrt(_596);
        float _636 = _630 * _626;
        float _638 = _636 * 0.15915493667125701904296875;
        float _640 = _638 * 6.283185482025146484375;
        float _642 = sin(_640);
        float _644 = _638 * 6.283185482025146484375;
        float _646 = cos(_644);
        float _648 = fma(_642, _632, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _650 = _634 * _648;
        float _652 = _646 + (-1.0);
        float _654 = fma(_592, _650, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _656 = fma(_588, _650, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _658 = _652 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _660 = fma(_606, _646, _658);
        _624 = _660;
        _618 = _654;
        _614 = _656;
    }
    float _662 = _624;
    float _664 = _618;
    float _666 = _614;
    float _668 = -_506;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[18].w, _662);
    float _672 = -_508;
    float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[18].w, _664);
    float _676 = -_510;
    float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[18].w, _666);
    float _680 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _682 = _670 + _680;
    float _684 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _686 = _674 + _684;
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _690 = _678 + _688;
    float _692 = _682 * _682;
    float _694 = fma(_686, _686, _692);
    float _696 = fma(_690, _690, _694);
    float _698 = rsqrt(_696);
    float _700 = sqrt(_696);
    float _702 = _698 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _704 = _686 * _702;
    float _706 = _690 * _702;
    float _708 = _704 * _704;
    float _710 = _706 * _706;
    float _712 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _714 = fma(_700, (*spvDescriptorSet0.vp_c15)._m0[23].w, _712);
    float _716 = precise::clamp(_714, 0.0, 1.0);
    float _718 = _708 + _710;
    float _720 = sqrt(_718);
    bool _722 = _720 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _724 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _726 = _720 + _724;
    float _728 = _694;
    float _730 = _718;
    float _732 = _726;
    float _734 = _704;
    if (_722)
    {
        float _736 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _728 = _736;
    }
    float _738 = _728;
    if (_722)
    {
        float _740 = rsqrt(_718);
        _730 = _740;
    }
    float _742 = _730;
    float _744 = _742;
    if (_722)
    {
        float _746 = _726 * _738;
        _732 = _746;
    }
    float _748 = _732;
    if (_722)
    {
        float _750 = _748 * 0.15915493667125701904296875;
        _416 = _750;
    }
    float _752 = _416;
    float _754 = _738;
    float _756 = _752;
    if (_722)
    {
        float _758 = _752 * 6.283185482025146484375;
        float _760 = sin(_758);
        _754 = _760;
    }
    float _762 = _754;
    float _764 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _766 = precise::max(0.0, _764);
    float _768 = _588;
    float _770 = _766;
    if (_722)
    {
        float _772 = _752 * 6.283185482025146484375;
        float _774 = cos(_772);
        _768 = _774;
    }
    float _776 = _768;
    float _778 = -_702;
    float _780 = -_766;
    float _782 = fma(_682, _778, _780);
    if (_722)
    {
        float _784 = _782 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _770 = _784;
    }
    float _786 = _770;
    float _788 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _790 = _762;
    float _792 = _786;
    if (_722)
    {
        float _794 = fma(_762, _786, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _790 = _794;
    }
    float _796 = _790;
    float _798 = _796;
    float _800 = _776;
    if (_722)
    {
        float _802 = _776 + (-1.0);
        _792 = _802;
    }
    float _804 = _792;
    float _806 = 0.0;
    float _808 = _804;
    if (_722)
    {
        float _810 = _742 * _796;
        _806 = _810;
    }
    float _812 = _806;
    if (!_722)
    {
        _798 = _782;
    }
    float _814 = _798;
    float _816 = _814;
    if (_722)
    {
        float _818 = _804 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _756 = _818;
    }
    float _820 = _756;
    if (_722)
    {
        float _822 = _704 * _812;
        _734 = _822;
    }
    float _824 = _734;
    if (!_722)
    {
        _808 = _706;
    }
    float _826 = _808;
    float _828 = _826;
    if (_722)
    {
        float _830 = _706 * _812;
        _828 = _830;
    }
    float _832 = _828;
    if (_722)
    {
        float _834 = fma(_782, _776, _820);
        _816 = _834;
    }
    float _836 = _816;
    if (!_722)
    {
        _800 = _708;
    }
    float _838 = _800;
    float _840 = _838;
    if (_722)
    {
        float _842 = _824 * _824;
        _840 = _842;
    }
    float _844 = _840;
    float _846 = _670 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_722)
    {
        _744 = _710;
    }
    float _848 = _744;
    float _850 = _848;
    if (_722)
    {
        float _852 = _832 * _832;
        _850 = _852;
    }
    float _854 = _850;
    float _856 = fma(_836, _836, _844);
    float _858 = _670 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _860 = _670 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _862 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[1].x, _846);
    float _864 = _856 + _854;
    float _866 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[2].x, _858);
    float _868 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[0].x, _860);
    float _870 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[1].z, _862);
    float _872 = rsqrt(_864);
    float _874 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[2].z, _866);
    float _876 = _670 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _878 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[0].z, _868);
    float _880 = _870 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _882 = _874 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _884 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[3].x, _876);
    float _886 = _878 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _888 = _880 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _890 = _882 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _892 = -_716;
    float _894 = _892 + 1.0;
    float _896 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[3].z, _884);
    float _898 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[7].x, _888);
    float _900 = -_890;
    float _902 = fma(_900, _788, 1.0);
    float _904 = _896 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _906 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[7].z, _898);
    float _908 = _872 * _824;
    float _910 = abs(_894);
    float _912 = log2(_910);
    float _914 = _872 * _836;
    float _916 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[7].w, _906);
    float _918 = _908 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _920 = _872 * _832;
    float _922 = _880 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _924 = -_918;
    float _926 = fma(_914, (*spvDescriptorSet0.vp_c15)._m0[21].y, _924);
    float _928 = log2(_902);
    float _930 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[5].x, _922);
    float _932 = -_920;
    float _934 = fma(_932, (*spvDescriptorSet0.vp_c15)._m0[21].z, _926);
    float _936 = _880 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _938 = fma(_934, -0.5, 0.5);
    float _940 = _912 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _942 = 1.0 / _916;
    float _944 = fma(_934, 0.5, 0.5);
    float _946 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[4].x, _936);
    float _948 = _914 + 1.0;
    float _950 = fma(_944, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _952 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[4].z, _946);
    float _954 = _928 * 0.693147182464599609375;
    float _956 = exp2(_940);
    float _958 = fma(_944, _950, -0.212114393711090087890625);
    float _960 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[4].w, _952);
    float _962 = _954 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _964 = fma(_944, _958, 1.570728778839111328125);
    float _966 = sqrt(_938);
    float _968 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[5].z, _930);
    float _970 = _960 * _942;
    float _972 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[5].w, _968);
    float _974 = fma(_970, 0.5, 0.5);
    float _976 = -_914;
    float _978 = fma(_956, _948, _976);
    float _980 = _972 * _942;
    float _982 = fma(_978, 0.5, 0.5);
    float _984 = fma(_980, -0.5, 0.5);
    float _986 = _966 * 0.636619746685028076171875;
    float _988 = -_964;
    float _990 = fma(_986, _988, 1.0);
    float3 _3387 = float3(_974, _984, _962);
    float _992 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3387, float3(0.0), isnan(_3387)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3387, float3(0.0), isnan(_3387)), level(0.0)).x;
    float3 _3398 = float3(_974, _984, _962);
    float4 _995 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3398, float3(0.0), isnan(_3398)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3398, float3(0.0), isnan(_3398)), level(0.0)).xyzw;
    float _997 = _995.x;
    float _999 = _995.y;
    float _1001 = _995.z;
    float _1003 = _995.w;
    float2 _3415 = float2(_990, _982);
    float3 _1007 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3415, float2(0.0), isnan(_3415)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3415, float2(0.0), isnan(_3415)), level(0.0)).xyz;
    float _1009 = _1007.x;
    float _1011 = _1007.y;
    float _1013 = _1007.z;
    float _1015 = in.m_57.y;
    float _1017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1019 = in.m_51.x;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1023 = _1021 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1025 = in.m_57.z;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1029 = _1027 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1031 = 1.0 / _1023;
    float _1033 = in.m_51.w;
    int _1035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1037 = _1035 != 0;
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1043 = in.m_51.y;
    float _1045 = 1.0 / _1029;
    float _1047 = in.m_57.x;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1051 = _1049 != 0;
    float _1053 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1055 = _1053 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _1057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1059 = _1057 != 0;
    out.m_59.y = _1015;
    int _1061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1063 = _1061 != 0;
    float _1065 = 1.0 / _1041;
    float _1067 = in.m_61.y;
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1071 = _1069 != 0;
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1073;
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1079 = _1077 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1081 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    out.m_59.z = _1025;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1087 = _1085 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1089 = _1033 > 0.5;
    float _1091 = 1.0 / _1055;
    float _1093 = -_1083;
    float _1095 = fma(_1081, 2.0, _1093);
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1099 = _1043 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1101 = _1081;
    bool _1103 = _1089;
    if (_1037)
    {
        float _1105 = in.m_51.z;
        _1101 = _1105;
    }
    float _1107 = _1101;
    float _1109 = _1075 * _1031;
    float _1111 = fma(_1099, -2.0, _1097);
    float _1113 = in.m_57.w;
    float _1115 = 1.0 / _1087;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    out.m_59.x = _1047;
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1123 = _1121 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1125 = -_1067;
    float _1127 = _1125 + 1.0;
    float _1129 = 0.0;
    float _1131 = _1067;
    if (!_1071)
    {
        float _1133 = in.m_51.z;
        _1129 = _1133;
    }
    float _1135 = _1129;
    float _1137 = 1.0 / _1079;
    float _1139 = _1123 * _1045;
    float _1141 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1141;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1147 = _1145 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    int _1149 = _1089 ? as_type<int>(_1127) : as_type<int>(_1067);
    float _1151 = _1143 * _1065;
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1153;
    float _1157 = 1.0 / _1119;
    float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1161 = _1159 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1163 = _1147 * _1091;
    float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1167 = _1165 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1169 = _1155 * _1115;
    bool _1171 = false;
    if (_1037)
    {
        bool _1173 = _1107 > 0.5;
        _1171 = _1173;
    }
    bool _1175 = _1171;
    float _1177 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1179 = _452 + _1177;
    out.m_59.w = _1113;
    float _1181 = 1.0 / _1161;
    float _1183 = _1167 * _1137;
    float _1185 = fma(_1109, _1179, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1187 = _1059 ? as_type<float>(_1149) : _1067;
    float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1191 = _454 + _1189;
    float _1193 = 0.0;
    float _1195 = _1135;
    if (!_1071)
    {
        _1193 = _1043;
    }
    float _1197 = _1193;
    float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1201 = _454 + _1199;
    float _1203 = fma(_1163, _1191, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1207 = _454 + _1205;
    bool _1209 = _1043 > 0.5;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1213 = _1211 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1215 = _1197;
    float _1217 = _1201;
    if (_1051)
    {
        bool _1219 = _1019 > 0.5;
        _1103 = _1219;
    }
    bool _1221 = _1103;
    float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1223;
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1229 = _1227 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    if (_1071)
    {
        _1215 = _1019;
    }
    float _1231 = _1215;
    float _1233 = fma(_1151, _1201, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    if (_1063)
    {
        float _1235 = _1209 ? _1127 : _1067;
        _1131 = _1235;
    }
    float _1237 = _1131;
    float _1239 = _1229 * _1157;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1243 = _470 != 0.0;
    bool _1245 = isnan(_470);
    bool _1247 = _1243 || _1245;
    bool _1249 = isnan(0.0);
    bool _1251 = _1247 || _1249;
    float _1253 = 1.0 / _1213;
    float _1255 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1241);
    bool _1257 = _468 == 0.0;
    bool _1259 = !_1251;
    bool _1261 = _1257 && _1259;
    float _1263 = in.m_63.x;
    float _1265 = in.m_63.y;
    float _1267 = in.m_63.z;
    float _1269 = _1225 * _1181;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1273 = _472 == 0.0;
    bool _1275 = _1273 && _1261;
    float _1277 = fma(_1269, _1207, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1279 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1281;
    if (!_1071)
    {
        _1217 = _1135;
    }
    float _1285 = _1217;
    float _1287 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1271);
    float _1289 = _1285;
    if (_1071)
    {
        _1289 = _1043;
    }
    float _1291 = _1289;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1295 = _454 + _1293;
    if (_1071)
    {
        _1195 = _1043;
    }
    float _1297 = _1195;
    float _1299 = fma(_1187, _1279, -0.5);
    float _1301 = _1283 * _1253;
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1305 = _454 + _1303;
    bool _1307 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1309 = isnan(_454);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1315 = _1311 || _1313;
    float _1317 = float(_1315);
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1321 = _452 + _1319;
    bool _1323 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1325 = isnan(_452);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1331 = _1327 || _1329;
    float _1333 = float(_1331);
    float _1335 = in.m_61.x;
    bool _1337 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1339 = isnan(_454);
    bool _1341 = _1337 || _1339;
    bool _1343 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1345 = _1341 || _1343;
    float _1347 = float(_1345);
    float _1349 = -_1317;
    float _1351 = _1349 + 1.0;
    float _1353 = fma(_1183, _1295, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1355 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1357 = isnan(_454);
    bool _1359 = _1355 || _1357;
    bool _1361 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1363 = _1359 || _1361;
    float _1365 = float(_1363);
    float _1367 = _1263;
    float _1369 = _1265;
    float _1371 = _1267;
    if (!_1275)
    {
        float _1373 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1263);
        _1367 = _1373;
    }
    float _1375 = _1367;
    bool _1377 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1379 = isnan(_454);
    bool _1381 = _1377 || _1379;
    bool _1383 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1385 = _1381 || _1383;
    float _1387 = float(_1385);
    if (!_1275)
    {
        float _1389 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1265);
        _1369 = _1389;
    }
    float _1391 = _1369;
    float _1393 = fma(_1301, _1305, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    if (!_1275)
    {
        float _1395 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1267);
        _1371 = _1395;
    }
    float _1397 = _1371;
    bool _1399 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1401 = isnan(_454);
    bool _1403 = _1399 || _1401;
    bool _1405 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1407 = _1403 || _1405;
    float _1409 = float(_1407);
    float _1411 = -_1387;
    float _1413 = _1411 + 1.0;
    bool _1415 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1417 = isnan(_452);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1423 = _1419 || _1421;
    float _1425 = float(_1423);
    float _1427 = -_1347;
    float _1429 = _1427 + 1.0;
    bool _1431 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1433 = isnan(_452);
    bool _1435 = _1431 || _1433;
    bool _1437 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1439 = _1435 || _1437;
    float _1441 = float(_1439);
    float _1443 = _1409 * _1413;
    float _1445 = -_1409;
    float _1447 = _1445 + 1.0;
    float _1449 = -_1425;
    float _1451 = _1449 + 1.0;
    float _1453 = fma(_1139, _1321, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1457 = _454 + _1455;
    float _1459 = _1317 * _1447;
    float _1461 = _1441 * _1451;
    float _1463 = -_1441;
    float _1465 = _1463 + 1.0;
    float _1467 = _1347 * _1351;
    bool _1469 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1471 = isnan(_454);
    bool _1473 = _1469 || _1471;
    bool _1475 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1477 = _1473 || _1475;
    float _1479 = float(_1477);
    float _1481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1483 = _1333 * _1465;
    float _1485 = _1365 * _1429;
    float _1487 = -_1365;
    float _1489 = _1487 + 1.0;
    float _1491 = fma(_1169, _1457, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1493 = _1185 * _1483;
    float _1495 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1497 = _454 + _1495;
    bool _1499 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1501 = isnan(_454);
    bool _1503 = _1499 || _1501;
    bool _1505 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1507 = _1503 || _1505;
    float _1509 = float(_1507);
    float _1511 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1513 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1515 = isnan(_454);
    bool _1517 = _1513 || _1515;
    bool _1519 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1521 = _1517 || _1519;
    float _1523 = float(_1521);
    float _1525 = _1479 * _1489;
    float _1527 = -_1479;
    float _1529 = _1527 + 1.0;
    float _1531 = fma(_1239, _1497, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1533 = _1481 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1535 = _1523 * _1529;
    float _1537 = -_1523;
    float _1539 = _1537 + 1.0;
    float _1541 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1511);
    float _1543 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1545 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1547 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1549 = _1497;
    int _1551 = as_type<int>(_1543);
    float _1553 = _1335;
    if (!_1051)
    {
        _1549 = _1335;
    }
    float _1555 = _1549;
    float _1557 = fma(_1533, _1237, -0.5);
    float _1559 = -_1543;
    float _1561 = fma(_1545, 2.0, _1559);
    float _1563 = _1555;
    if (_1051)
    {
        float _1565 = -_1335;
        float _1567 = _1565 + 1.0;
        _1551 = as_type<int>(_1567);
    }
    int _1569 = _1551;
    float _1571 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1547);
    float _1573 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1287);
    float _1575 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1111);
    float _1577 = _1509 * _1539;
    int _1579 = as_type<int>(_1577);
    if (_1051)
    {
        float _1581 = _1221 ? as_type<float>(_1569) : _1335;
        _1563 = _1581;
    }
    float _1583 = _1563;
    float _1585 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1587 = -_1575;
    float _1589 = fma(_1573, _1557, _1587);
    float _1591 = _1233 * _1577;
    float _1593 = -_1509;
    float _1595 = _1593 + 1.0;
    if (_1037)
    {
        float _1597 = -_1335;
        float _1599 = _1597 + 1.0;
        _1579 = as_type<int>(_1599);
    }
    int _1601 = _1579;
    float _1603 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1605 = _1291 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1607 = fma(_1595, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1591);
    float _1609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1037)
    {
        float _1611 = _1175 ? as_type<float>(_1601) : _1335;
        _1553 = _1611;
    }
    float _1613 = _1553;
    float _1615 = fma(_1605, -2.0, _1603);
    float _1617 = _1391 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1619 = _1391 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1621 = fma(_1203, _1535, _1607);
    float _1623 = _1391 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1625 = fma(_1375, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1617);
    float _1627 = fma(_1375, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1619);
    float _1629 = fma(_1491, _1525, _1621);
    float _1631 = fma(_1375, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1623);
    float _1633 = -_1333;
    float _1635 = _1633 + 1.0;
    float _1637 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1625);
    float _1639 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1627);
    float _1641 = fma(_1353, _1485, _1629);
    float _1643 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1631);
    float _1645 = fma(_1635, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1493);
    float _1647 = _1585 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1649 = _1609 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1651 = fma(_1277, _1467, _1641);
    float _1653 = -_506;
    float _1655 = fma(_1653, (*spvDescriptorSet0.vp_c9)._m0[18].w, _480);
    out.m_65.x = _1637;
    out.m_65.y = _1639;
    out.m_65.z = _1643;
    float _1657 = -_508;
    float _1659 = fma(_1657, (*spvDescriptorSet0.vp_c9)._m0[18].w, _482);
    float _1661 = fma(_1453, _1461, _1645);
    float _1663 = fma(_1647, _1583, -0.5);
    float _1665 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1255);
    float _1667 = -_130;
    float _1669 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1095);
    float _1671 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1541);
    float _1673 = -_130;
    float _1675 = fma(_1673, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1561);
    float _1677 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1571);
    float _1679 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1615);
    float _1681 = fma(_1649, _1613, -0.5);
    float _1683 = fma(_1531, _1459, _1651);
    float _1685 = _1655 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1687 = -_510;
    float _1689 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[18].w, _484);
    float _1691 = fma(_1665, _1663, _1669);
    float _1693 = fma(_1671, _1681, _1675);
    float _1695 = -_1679;
    float _1697 = fma(_1677, _1299, _1695);
    float _1699 = fma(_1425, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1661);
    float _1701 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1703 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1705 = fma(_1393, _1443, _1683);
    float _1707 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1709 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1685);
    float _1711 = _1701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1713 = _1703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1715 = _1707 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1717 = _1589 + 0.5;
    float _1719 = _1699 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1721 = _1691 + 0.5;
    float _1723 = _1693 + 0.5;
    float _1725 = _1697 + 0.5;
    float _1727 = fma(_1387, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1705);
    float _1729 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1709);
    float _1731 = _1655 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_67.x = _1711;
    out.m_67.y = _1713;
    out.m_67.z = _1715;
    out.m_67.w = _1719;
    bool _1733 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1735 = isnan(0.5);
    bool _1737 = _1733 || _1735;
    bool _1739 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1741 = _1737 || _1739;
    float _1743 = _1729 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1745 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1731);
    out.m_69.x = _1721;
    out.m_69.y = _1717;
    out.m_69.z = _1723;
    out.m_69.w = _1725;
    float _1747 = _912 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1749 = 1.0 / _1743;
    float _1751 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1745);
    out.m_71.x = _1727;
    float _1753 = _880 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1755 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1757 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1753);
    float _1759 = exp2(_1747);
    float _1761 = _1755 + _1743;
    float _1763 = _1689;
    if (_1741)
    {
        _1763 = 1.0;
    }
    float _1765 = _1763;
    float _1767 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1757);
    float _1769 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1767);
    float _1771 = _1761 * _1749;
    float _1773 = _1771 * 0.5;
    float _1775 = _1765;
    if (!_1741)
    {
        float _1777 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1779 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1781 = _1777 * 0.15915493667125701904296875;
        float _1783 = _1779 * 0.15915493667125701904296875;
        float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1787 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1785);
        float _1789 = _1781 * 6.283185482025146484375;
        float _1791 = cos(_1789);
        float _1793 = _1781 * 6.283185482025146484375;
        float _1795 = sin(_1793);
        float _1797 = 1.0 / _1791;
        float _1799 = _1783 * 6.283185482025146484375;
        float _1801 = cos(_1799);
        float _1803 = _1795 * _1797;
        float _1805 = _1783 * 6.283185482025146484375;
        float _1807 = sin(_1805);
        float _1809 = _1801 * _1803;
        float _1811 = 1.0 / _1787;
        float _1813 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1815 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1813;
        float _1817 = 1.0 / _1809;
        float _1819 = 1.0 / _1815;
        float _1821 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1823 = _1811 * _1821;
        float _1825 = _1807 * _1817;
        float _1827 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1829 = fma(_1825, _1823, _1827);
        float _1831 = _1829 * _1819;
        float _1833 = precise::clamp(_1831, 0.0, 1.0);
        _1775 = _1833;
    }
    float _1835 = _1775;
    float _1837 = -_1759;
    float _1839 = _1837 + 1.0;
    float _1841 = _1769 + _916;
    float _1843 = _1835 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1845 = _1835 > 0.0;
    bool _1847 = isnan(_1835);
    bool _1849 = _1845 || _1847;
    bool _1851 = isnan(0.0);
    bool _1853 = _1849 || _1851;
    float _1855 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1857 = _1841 * 0.5;
    float _1859 = _1843 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = _686;
    out.m_73.y = _682;
    out.m_73.z = _690;
    float _1861 = _1855 * _992;
    float _1863 = -_1855;
    float _1865 = _1863 + 1.0;
    out.gl_Position.x = _960;
    out.gl_Position.y = _972;
    out.gl_Position.z = _1769;
    out.gl_Position.w = _916;
    float _1867 = _1003 * _1861;
    float _1869 = _1013 * _1861;
    float _1871 = _1003 * _1865;
    out.m_75.z = _1857;
    out.m_75.w = _916;
    float _1873 = fma(_1009, _1867, _997);
    float _1875 = fma(_1011, _1867, _999);
    float _1877 = fma(_1003, _1869, _1001);
    out.m_45.x = _1859;
    out.m_77.x = _1873;
    out.m_77.y = _1875;
    out.m_77.z = _1877;
    out.m_77.w = _1871;
    if (_1853)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1879 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1879;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

