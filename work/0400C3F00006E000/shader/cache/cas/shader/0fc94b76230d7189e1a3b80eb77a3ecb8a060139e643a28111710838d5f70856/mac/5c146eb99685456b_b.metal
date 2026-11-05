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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
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
    float4 m_57 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_69 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_67 [[user(locn8)]];
    float4 m_61 [[user(locn9)]];
    float4 m_63 [[user(locn10)]];
    float4 m_79 [[user(locn11)]];
    float4 m_77 [[user(locn12)]];
    float4 m_71 [[user(locn13)]];
    float4 m_83 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_75 [[attribute(4)]];
    float4 m_65 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1832 = false;
    bool _1516 = false;
    bool _1206 = false;
    bool _1110 = false;
    bool _896 = false;
    bool _670 = false;
    bool _390 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_42.w;
    float _99 = in.m_44.w;
    float _101 = trunc(_97);
    int _104 = int(_101);
    float _106 = -_99;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _108;
    bool _112 = _104 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_104);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2793 = as_type<float>(_124);
        out.gl_Position.z = _2793;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _128 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_99);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = in.m_51.z;
    float _140 = float(_104);
    float _142 = in.m_51.y;
    bool _144 = _108 >= _140;
    bool _146 = !_136;
    bool _148 = _144 || _146;
    float _150 = in.m_51.w;
    float _152 = in.m_51.x;
    if (_148)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _116;
    if (_148)
    {
        out.m_49.x = 0.0;
    }
    if (_148)
    {
        float _156 = _154 * 5.0;
        _126 = as_type<int>(_156);
    }
    int _158 = _126;
    out.m_53.z = _138;
    out.m_53.y = _142;
    out.m_53.w = _150;
    float _160 = _150;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2863 = as_type<float>(_158);
        out.gl_Position.z = _2863;
    }
    out.m_53.x = _152;
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _108 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _166 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    int _178 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _180 = _178 != 0;
    float _182 = _164 * _162;
    float _184 = _166;
    if (!_176)
    {
        float _186 = _166 * _166;
        float _188 = _186 * 0.5;
        _160 = _188;
    }
    float _190 = _160;
    float _192 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[20].x, _182);
    float _194 = in.m_44.x;
    float _196 = in.m_44.y;
    float _198 = in.m_44.z;
    float _200 = _190;
    if (!_176)
    {
        float _202 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _202;
    }
    float _204 = _200;
    float _206 = _192 * 6.283185482025146484375;
    float _208 = floor(_192);
    float _210 = _206 * 0.15915493667125701904296875;
    float _212 = _210 * 6.283185482025146484375;
    float _214 = cos(_212);
    float _216 = -_208;
    float _218 = _192 + _216;
    bool _220 = !_176;
    float _222 = _204;
    if (!_220)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = _166 * _226;
        float _236 = 1.0 / _230;
        float _238 = _232 * 0.693147182464599609375;
        float _240 = exp2(_234);
        float _242 = 1.0 / _238;
        float _244 = _240 + (-1.0);
        float _246 = -_244;
        float _248 = fma(_246, _242, _166);
        float _250 = _248 * _236;
        float _252 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _222 = _252;
    }
    float _254 = _222;
    bool _256 = !_176;
    if (!_256)
    {
        float _258 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _260 = log2(_258);
        float _262 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _264 = _262 + 1.0;
        float _266 = 1.0 / _264;
        float _268 = _166 * _260;
        float _270 = exp2(_268);
        float _272 = -_270;
        float _274 = _272 + 1.0;
        float _276 = _274 * _266;
        _184 = _276;
    }
    float _278 = _184;
    float _280 = in.m_55.w;
    float _282 = 1.0 / _140;
    bool _284 = _218 < 0.5;
    float _286 = float(_284);
    float _288 = in.m_42.x;
    float _290 = in.m_42.y;
    float _292 = in.m_42.z;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _296 = _294 != 0;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _300 = _298 != 0;
    float _302 = fma(_214, 0.5, 0.5);
    float _304 = -_218;
    float _306 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _308 = -_286;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _312 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _314 = !_296;
    int _316 = _314 ? 0 : 1;
    float _318 = -_302;
    float _320 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _322 = !_180;
    int _324 = _322 ? 0 : 1;
    float _326 = fma(_278, _194, _312);
    bool _328 = !_300;
    int _330 = _328 ? 0 : 1;
    float _332 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _334 = abs(_316);
    float _336 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _338 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _340 = fma(_278, _196, _332);
    int _342 = abs(_324);
    float _344 = fma(_278, _198, _336);
    int _346 = abs(_330);
    float _348 = float(_334);
    float _350 = float(_342);
    float _352 = abs(_306);
    float _354 = _348 * _352;
    float _356 = fma(_326, _280, _288);
    float _358 = fma(_344, _280, _292);
    float _360 = float(_346);
    float _362 = fma(_350, _320, _354);
    float _364 = fma(_340, _280, _290);
    float _366 = _108 * _282;
    float _368 = abs(_310);
    float _370 = fma(_360, _368, _362);
    bool _372 = !_338;
    float _388;
    if (!_372)
    {
        float _374 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _376 = _152 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _378 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[12].x, _108);
        float _380 = _378 * _374;
        float _382 = floor(_380);
        float _384 = -_382;
        float _386 = _380 + _384;
        _388 = _386;
        _390 = true;
    }
    else
    {
        _388 = _366;
    }
    _390 = false;
    float _392 = _388;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _396 = _392 + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _400 = _392 + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _404 = _392 + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _422 = 1.0 / _408;
    bool _424 = _392 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _426 = isnan(_392);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    bool _436 = _392 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _438 = isnan(_392);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _444 = _440 || _442;
    float _446 = float(_444);
    float _448 = 1.0 / _412;
    bool _450 = _392 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _452 = isnan(_392);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = 1.0 / _416;
    float _464 = _396 * _422;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _468 = _392 + _466;
    bool _470 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _472 = 1.0 / _420;
    float _474 = _400 * _448;
    bool _476 = _392 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _478 = isnan(_392);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = -_486;
    float _490 = _488 + 1.0;
    float _492 = _404 * _462;
    float _494 = _468 * _472;
    bool _496 = _392 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _498 = isnan(_392);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _516 = _506 * _490;
    float _518 = -_506;
    float _520 = _518 + 1.0;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _522;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _526;
    float _530 = fma(_510, _464, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _532 = _446 * _520;
    float _534 = fma(_524, _464, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _536 = fma(_528, _464, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _538 = -_434;
    float _540 = _538 + 1.0;
    float _542 = -_446;
    float _544 = _542 + 1.0;
    float _546 = _460 * _540;
    float _548 = _434 * _544;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _554 = -_460;
    float _556 = _554 + 1.0;
    float _558 = _534 * _546;
    float _560 = _536 * _546;
    float _562 = fma(_514, _474, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _568 = _530 * _546;
    float _570 = in.m_55.x;
    float _572 = in.m_55.y;
    float _574 = in.m_55.z;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _576;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _580;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _584;
    float _588 = fma(_552, _474, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _590 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[143].x, _558);
    float _592 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[143].y, _560);
    float _594 = fma(_566, _474, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _596 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[143].z, _568);
    float _598 = fma(_578, _492, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _600 = fma(_582, _492, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _602 = fma(_586, _492, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _604 = fma(_562, _548, _590);
    float _606 = fma(_588, _548, _592);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _620 = fma(_594, _548, _596);
    float _622 = fma(_610, _494, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _624 = fma(_614, _494, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _626 = fma(_618, _494, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _628 = fma(_598, _532, _604);
    float _630 = fma(_600, _532, _606);
    float _632 = fma(_602, _532, _620);
    float _634 = fma(_622, _516, _628);
    float _636 = fma(_624, _516, _630);
    float _638 = fma(_626, _516, _632);
    float _640 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[147].x, _634);
    float _642 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[147].y, _636);
    float _644 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[147].z, _638);
    float _646 = _640 * _570;
    float _648 = _642 * _572;
    float _650 = _644 * _574;
    bool _652 = !_470;
    float _668;
    if (!_652)
    {
        float _654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _656 = _152 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _658 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[11].x, _108);
        float _660 = _658 * _654;
        float _662 = floor(_660);
        float _664 = -_662;
        float _666 = _660 + _664;
        _668 = _666;
        _670 = true;
    }
    else
    {
        _668 = _366;
    }
    _670 = false;
    float _672 = _668;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _676 = _672 + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _680 = _672 + _678;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _684 = _672 + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _686;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _690;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _698 = 1.0 / _688;
    bool _700 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _702 = 1.0 / _692;
    bool _704 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _706 = isnan(_672);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = -_714;
    float _718 = _716 + 1.0;
    float _720 = 1.0 / _696;
    float _722 = _676 * _698;
    bool _724 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _726 = isnan(_672);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = _680 * _702;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _742;
    float _746 = -_734;
    float _748 = _746 + 1.0;
    float _750 = fma(_740, _736, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _752 = fma(_744, _736, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _754 = _714 * _748;
    float _756 = _684 * _720;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _758;
    bool _762 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _764 = isnan(_672);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _770 = _766 || _768;
    float _772 = float(_770);
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _778 = fma(_760, _736, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _780 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _782 = isnan(_672);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = _772 * _718;
    float _794 = -_772;
    float _796 = _794 + 1.0;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _806 = fma(_776, _756, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _808 = _790 * _796;
    float _810 = fma(_800, _756, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _812 = fma(_804, _756, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _814 = _750 * _808;
    float _816 = _752 * _808;
    float _818 = -_790;
    float _820 = _818 + 1.0;
    float _822 = _778 * _808;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _824;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _828;
    float _832 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[107].x, _814);
    float _834 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[107].y, _816);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _836;
    float _840 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[107].z, _822);
    float _842 = fma(_826, _722, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _844 = fma(_810, _792, _832);
    float _846 = fma(_830, _722, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _848 = fma(_838, _722, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _850 = fma(_806, _792, _834);
    float _852 = fma(_812, _792, _840);
    float _854 = fma(_842, _754, _844);
    float _856 = fma(_846, _754, _850);
    float _858 = fma(_848, _754, _852);
    float _860 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[110].x, _854);
    float _862 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[110].y, _856);
    float _864 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[110].z, _858);
    float _866 = _860 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _868 = _862 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _870 = _864 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _872 = _866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _874 = _868 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _876 = _870 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _872;
    out.m_57.y = _874;
    out.m_57.z = _876;
    bool _878 = !_700;
    float _894;
    if (!_878)
    {
        float _880 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _882 = _152 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _884 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[11].z, _108);
        float _886 = _884 * _880;
        float _888 = floor(_886);
        float _890 = -_888;
        float _892 = _886 + _890;
        _894 = _892;
        _896 = true;
    }
    else
    {
        _894 = _366;
    }
    _896 = false;
    float _898 = _894;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _902 = _898 + _900;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _906 = _898 + _904;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _910 = _898 + _908;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _912;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _916;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _922 = _920 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _924 = 1.0 / _914;
    bool _926 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _928 = 1.0 / _918;
    bool _930 = _898 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _932 = isnan(_898);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _938 = _934 || _936;
    float _940 = float(_938);
    float _942 = -_940;
    float _944 = _942 + 1.0;
    float _946 = 1.0 / _922;
    bool _948 = _898 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _950 = isnan(_898);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _956 = _952 || _954;
    float _958 = float(_956);
    float _960 = _902 * _924;
    bool _962 = _898 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _964 = isnan(_898);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = _906 * _928;
    float _976 = -_958;
    float _978 = _976 + 1.0;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _980;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _984;
    float _988 = _972 * _978;
    bool _990 = _898 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _992 = isnan(_898);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _998 = _994 || _996;
    float _1000 = float(_998);
    float _1002 = fma(_982, _974, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1004 = _910 * _946;
    float _1006 = -_972;
    float _1008 = _1006 + 1.0;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1010;
    float _1014 = fma(_986, _974, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1020 = _940 * _1008;
    float _1022 = _1000 * _944;
    float _1024 = fma(_1012, _974, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1034 = _1002 * _1022;
    float _1036 = _1014 * _1022;
    float _1038 = -_1000;
    float _1040 = _1038 + 1.0;
    float _1042 = _1024 * _1022;
    float _1044 = fma(_1018, _1004, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1046 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1034);
    float _1048 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1036);
    float _1050 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1042);
    float _1052 = fma(_1028, _1004, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1054 = fma(_1032, _1004, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1064;
    float _1068 = fma(_1044, _1020, _1046);
    float _1070 = fma(_1058, _960, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1072 = fma(_1062, _960, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1074 = fma(_1066, _960, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1076 = fma(_1052, _1020, _1048);
    float _1078 = fma(_1054, _1020, _1050);
    float _1080 = fma(_1070, _988, _1068);
    float _1082 = fma(_1072, _988, _1076);
    float _1084 = fma(_1074, _988, _1078);
    float _1086 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1080);
    float _1088 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1082);
    float _1090 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1084);
    bool _1092 = !_926;
    float _1108;
    if (!_1092)
    {
        float _1094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1096 = _152 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1098 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[11].w, _108);
        float _1100 = _1098 * _1094;
        float _1102 = floor(_1100);
        float _1104 = -_1102;
        float _1106 = _1100 + _1104;
        _1108 = _1106;
        _1110 = true;
    }
    else
    {
        _1108 = _366;
    }
    _1110 = false;
    float _1112 = _1108;
    bool _1114 = _1112 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1116 = isnan(_1112);
    bool _1118 = _1114 || _1116;
    bool _1120 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1122 = _1118 || _1120;
    float _1124 = float(_1122);
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1128 = _1126 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1130 = _1112 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1132 = isnan(_1112);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1138 = _1134 || _1136;
    float _1140 = float(_1138);
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1148 = _1112 + _1146;
    float _1150 = -_1124;
    float _1152 = _1150 + 1.0;
    bool _1154 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1156 = 1.0 / _1128;
    float _1158 = _1140 * _1152;
    float _1160 = -_1140;
    float _1162 = _1160 + 1.0;
    float _1164 = _1144 * _1156;
    float _1166 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1168 = fma(_1164, _1148, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1170 = _1088 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1172 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1174 = _1168 * _1158;
    float _1176 = _1086 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1178 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1180 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1174);
    float _1182 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1184 = fma(_1124, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1180);
    float _1186 = _1184 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = _1182;
    out.m_59.y = _1178;
    out.m_59.z = _1172;
    out.m_59.w = _1186;
    bool _1188 = !_1154;
    float _1204;
    if (!_1188)
    {
        float _1190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1192 = _152 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[14].x, _108);
        float _1196 = _1194 * _1190;
        float _1198 = floor(_1196);
        float _1200 = -_1198;
        float _1202 = _1196 + _1200;
        _1204 = _1202;
        _1206 = true;
    }
    else
    {
        _1204 = _366;
    }
    _1206 = false;
    float _1208 = _1204;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1212 = _1208 + _1210;
    bool _1214 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1216 = isnan(_1208);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1222 = _1218 || _1220;
    float _1224 = float(_1222);
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1228 = _1226 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1230 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1232 = isnan(_1208);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1238 = _1234 || _1236;
    float _1240 = float(_1238);
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1242;
    bool _1246 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1248 = isnan(_1208);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = -_1224;
    float _1260 = _1258 + 1.0;
    float _1262 = 1.0 / _1228;
    float _1264 = -_1256;
    float _1266 = _1264 + 1.0;
    bool _1268 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1270 = isnan(_1208);
    bool _1272 = _1268 || _1270;
    bool _1274 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1276 = _1272 || _1274;
    float _1278 = float(_1276);
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1282 = _1280 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1284 = 1.0 / _1282;
    bool _1286 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1288 = _1244 * _1262;
    float _1290 = _1240 * _1260;
    float _1292 = -_1240;
    float _1294 = _1292 + 1.0;
    bool _1296 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1298 = isnan(_1208);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1304 = _1300 || _1302;
    float _1306 = float(_1304);
    float _1308 = fma(_1288, _1212, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1312 = _1310 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1314 = _1256 * _1294;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1318 = _1316 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1320 = _1306 * _1266;
    float _1322 = -_1306;
    float _1324 = _1322 + 1.0;
    bool _1326 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1328 = isnan(_1208);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = -_1278;
    float _1340 = _1338 + 1.0;
    float _1342 = 1.0 / _1318;
    float _1344 = _1278 * _1324;
    bool _1346 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1348 = isnan(_1208);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1354 = _1350 || _1352;
    float _1356 = float(_1354);
    float _1358 = _1336 * _1340;
    float _1360 = -_1336;
    float _1362 = _1360 + 1.0;
    float _1364 = _1356 * _1362;
    float _1366 = 1.0 / _1312;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1370 = _1368 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1374 = _1372 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1376 = _1308 * _1364;
    float _1378 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1380 = _1378 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1382 = -_1356;
    float _1384 = _1382 + 1.0;
    float _1386 = _1374 * _1284;
    float _1388 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1388;
    float _1392 = 1.0 / _1370;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1396 = _1208 + _1394;
    float _1398 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1376);
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1402 = _1400 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1404 = _1390 * _1342;
    float _1406 = fma(_1386, _1396, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1410 = _1208 + _1408;
    float _1412 = 1.0 / _1380;
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1416 = _1414 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1418 = fma(_1404, _1410, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1420 = fma(_1406, _1358, _1398);
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1422;
    float _1426 = _1416 * _1366;
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1430 = _1208 + _1428;
    float _1432 = fma(_1418, _1344, _1420);
    float _1434 = 1.0 / _1402;
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1438 = _1436 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1440 = _1424 * _1392;
    float _1442 = fma(_1426, _1430, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1446 = _1208 + _1444;
    float _1448 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1448;
    float _1452 = _1438 * _1412;
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1456 = _1208 + _1454;
    bool _1458 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1460 = isnan(_1208);
    bool _1462 = _1458 || _1460;
    bool _1464 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1466 = _1462 || _1464;
    float _1468 = float(_1466);
    float _1470 = fma(_1440, _1446, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1472 = fma(_1442, _1320, _1432);
    float _1474 = fma(_1452, _1456, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1478 = _1208 + _1476;
    float _1480 = -_1468;
    float _1482 = _1480 + 1.0;
    float _1484 = _1450 * _1434;
    float _1486 = fma(_1470, _1314, _1472);
    float _1488 = _1224 * _1482;
    float _1490 = fma(_1484, _1478, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1492 = fma(_1474, _1290, _1486);
    float _1494 = fma(_1490, _1488, _1492);
    float _1496 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1494);
    out.m_61.z = _1496;
    bool _1498 = !_1286;
    float _1514;
    if (!_1498)
    {
        float _1500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1502 = _152 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1504 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[14].y, _108);
        float _1506 = _1504 * _1500;
        float _1508 = floor(_1506);
        float _1510 = -_1508;
        float _1512 = _1506 + _1510;
        _1514 = _1512;
        _1516 = true;
    }
    else
    {
        _1514 = _366;
    }
    _1516 = false;
    float _1518 = _1514;
    float _1520 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1522 = _1518 + _1520;
    bool _1524 = _1518 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1526 = isnan(_1518);
    bool _1528 = _1524 || _1526;
    bool _1530 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1532 = _1528 || _1530;
    float _1534 = float(_1532);
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1538 = _1536 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1540 = _1518 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1542 = isnan(_1518);
    bool _1544 = _1540 || _1542;
    bool _1546 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1548 = _1544 || _1546;
    float _1550 = float(_1548);
    float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1552;
    bool _1556 = _1518 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1558 = isnan(_1518);
    bool _1560 = _1556 || _1558;
    bool _1562 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1564 = _1560 || _1562;
    float _1566 = float(_1564);
    float _1568 = -_1534;
    float _1570 = _1568 + 1.0;
    float _1572 = 1.0 / _1538;
    float _1574 = -_1566;
    float _1576 = _1574 + 1.0;
    bool _1578 = _1518 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1580 = isnan(_1518);
    bool _1582 = _1578 || _1580;
    bool _1584 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1586 = _1582 || _1584;
    float _1588 = float(_1586);
    float _1590 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1592 = _1590 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1594 = 1.0 / _1592;
    bool _1596 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1598 = _1554 * _1572;
    float _1600 = _1550 * _1570;
    float _1602 = -_1550;
    float _1604 = _1602 + 1.0;
    bool _1606 = _1518 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1608 = isnan(_1518);
    bool _1610 = _1606 || _1608;
    bool _1612 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1614 = _1610 || _1612;
    float _1616 = float(_1614);
    float _1618 = fma(_1598, _1522, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1622 = _1620 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1624 = _1566 * _1604;
    float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1628 = _1626 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1630 = _1616 * _1576;
    float _1632 = -_1616;
    float _1634 = _1632 + 1.0;
    bool _1636 = _1518 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1638 = isnan(_1518);
    bool _1640 = _1636 || _1638;
    bool _1642 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1644 = _1640 || _1642;
    float _1646 = float(_1644);
    float _1648 = -_1588;
    float _1650 = _1648 + 1.0;
    float _1652 = 1.0 / _1628;
    float _1654 = _1588 * _1634;
    bool _1656 = _1518 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1658 = isnan(_1518);
    bool _1660 = _1656 || _1658;
    bool _1662 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1664 = _1660 || _1662;
    float _1666 = float(_1664);
    float _1668 = _1646 * _1650;
    float _1670 = -_1646;
    float _1672 = _1670 + 1.0;
    float _1674 = _1666 * _1672;
    float _1676 = 1.0 / _1622;
    float _1678 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1680 = _1678 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1684 = _1682 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1686 = _1618 * _1674;
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1690 = _1688 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1692 = -_1666;
    float _1694 = _1692 + 1.0;
    float _1696 = _1684 * _1594;
    float _1698 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1698;
    float _1702 = 1.0 / _1680;
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1706 = _1518 + _1704;
    float _1708 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1686);
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1712 = _1710 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1714 = _1700 * _1652;
    float _1716 = fma(_1696, _1706, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1720 = _1518 + _1718;
    float _1722 = 1.0 / _1690;
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1728 = fma(_1714, _1720, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1730 = fma(_1716, _1668, _1708);
    float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1732;
    float _1736 = _1726 * _1676;
    float _1738 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1740 = _1518 + _1738;
    float _1742 = fma(_1728, _1654, _1730);
    float _1744 = 1.0 / _1712;
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1748 = _1746 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1750 = _1734 * _1702;
    float _1752 = fma(_1736, _1740, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1754 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1756 = _1518 + _1754;
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1760 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1758;
    float _1762 = _1748 * _1722;
    float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1766 = _1518 + _1764;
    bool _1768 = _1518 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1770 = isnan(_1518);
    bool _1772 = _1768 || _1770;
    bool _1774 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1776 = _1772 || _1774;
    float _1778 = float(_1776);
    float _1780 = fma(_1750, _1756, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1782 = fma(_1752, _1630, _1742);
    float _1784 = fma(_1762, _1766, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1788 = _1518 + _1786;
    float _1790 = -_1778;
    float _1792 = _1790 + 1.0;
    float _1794 = _1760 * _1744;
    float _1796 = fma(_1780, _1624, _1782);
    float _1798 = _1534 * _1792;
    float _1800 = fma(_1794, _1788, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1802 = fma(_1784, _1600, _1796);
    float _1804 = fma(_1800, _1798, _1802);
    float _1806 = fma(_1778, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1804);
    out.m_63.x = _1806;
    bool _1808 = !_1596;
    float _1810 = _1798;
    float _1812 = _1702;
    float _1814 = _1778;
    float _1830;
    if (!_1808)
    {
        float _1816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1818 = _152 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1820 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[14].z, _108);
        float _1822 = _1820 * _1816;
        float _1824 = floor(_1822);
        float _1826 = -_1824;
        float _1828 = _1822 + _1826;
        _1830 = _1828;
        _1832 = true;
    }
    else
    {
        _1830 = _366;
    }
    _1832 = false;
    float _1834 = _1830;
    float _1836 = in.m_65.x;
    float _1838 = in.m_65.y;
    float _1840 = in.m_65.z;
    float _1842 = _370 * _648;
    float _1844 = _370 * _646;
    float _1846 = _370 * _650;
    float _1848 = _364 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1850 = _1842 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1852 = _1844 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1854 = _1846 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1856 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1838);
    float _1858 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1836);
    float _1860 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1840);
    float _1862 = _1850 * _1856;
    float _1864 = _1852 * _1858;
    float _1866 = _1854 * _1860;
    float _1868 = _364 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1870 = _1862 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1872 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1848);
    float _1874 = _1862 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1876 = _364 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1878 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1870);
    float _1880 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1868);
    float _1882 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1872);
    float _1884 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1874);
    float _1886 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1878);
    float _1888 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1880);
    float _1890 = _1882 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1892 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1884);
    float _1894 = _1886 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1896 = _1888 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1898 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1876);
    float _1900 = _1892 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1902 = _1890 + _1894;
    float _1904 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1898);
    float _1906 = _1896 + _1900;
    float _1908 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1910 = _1902 + _1908;
    float _1912 = _1904 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1914 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1916 = _1906 + _1914;
    float _1918 = _1910 * _1910;
    float _1920 = fma(_1916, _1916, _1918);
    float _1922 = _1862 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1924 = sqrt(_1920);
    float _1926 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1922);
    float _1928 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1926);
    float _1930 = _1928 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1932 = _1912 + _1930;
    bool _1934 = _1924 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1936 = _1862;
    float _1938 = _1902;
    float _1940 = _1906;
    float _1942 = _1866;
    if (!_1934)
    {
        _1936 = _1902;
    }
    float _1944 = _1936;
    float _1946 = _1944;
    if (!_1934)
    {
        _1938 = _1932;
    }
    float _1948 = _1938;
    bool _1950 = !_1934;
    float _1952 = _1948;
    if (!_1950)
    {
        float _1954 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1956 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1958 = _1924 + _1956;
        float _1960 = _1932 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1962 = _1958 * _1954;
        float _1964 = rsqrt(_1920);
        float _1966 = _1962 * 0.15915493667125701904296875;
        float _1968 = _1966 * 6.283185482025146484375;
        float _1970 = cos(_1968);
        float _1972 = _1966 * 6.283185482025146484375;
        float _1974 = sin(_1972);
        float _1976 = _1970 + (-1.0);
        float _1978 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1980 = fma(_1974, _1960, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1982 = fma(_1932, _1970, _1978);
        float _1984 = _1964 * _1980;
        float _1986 = fma(_1916, _1984, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1988 = fma(_1910, _1984, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1952 = _1982;
        _1940 = _1986;
        _1946 = _1988;
        _1942 = _1966;
    }
    float _1990 = _1952;
    float _1992 = _1940;
    float _1994 = _1946;
    float _1996 = _1942;
    float _1998 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2000 = _1990 + _1998;
    float _2002 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2004 = _1992 + _2002;
    float _2006 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2008 = _1994 + _2006;
    float _2010 = _2000 * _2000;
    float _2012 = fma(_2004, _2004, _2010);
    float _2014 = fma(_2008, _2008, _2012);
    float _2016 = rsqrt(_2014);
    float _2018 = _2016 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2020 = _2004 * _2018;
    float _2022 = _2008 * _2018;
    float _2024 = _2020 * _2020;
    float _2026 = _2022 * _2022;
    float _2028 = _2024 + _2026;
    float _2030 = sqrt(_2028);
    bool _2032 = _2030 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2034 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2036 = _2030 + _2034;
    float _2038 = _1910;
    float _2040 = _2028;
    float _2042 = _2036;
    float _2044 = _2020;
    if (_2032)
    {
        float _2046 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2038 = _2046;
    }
    float _2048 = _2038;
    if (_2032)
    {
        float _2050 = rsqrt(_2028);
        _2040 = _2050;
    }
    float _2052 = _2040;
    float _2054 = _2052;
    if (_2032)
    {
        float _2056 = _2036 * _2048;
        _2042 = _2056;
    }
    float _2058 = _2042;
    if (_2032)
    {
        float _2060 = _2058 * 0.15915493667125701904296875;
        _1810 = _2060;
    }
    float _2062 = _1810;
    float _2064 = _1932;
    if (_2032)
    {
        float _2066 = _2062 * 6.283185482025146484375;
        float _2068 = sin(_2066);
        _2064 = _2068;
    }
    float _2070 = _2064;
    float _2072 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2074 = precise::max(0.0, _2072);
    float _2076 = _1996;
    float _2078 = _2074;
    float _2080 = _2072;
    if (_2032)
    {
        float _2082 = _2062 * 6.283185482025146484375;
        float _2084 = cos(_2082);
        _2076 = _2084;
    }
    float _2086 = _2076;
    float _2088 = -_2018;
    float _2090 = -_2074;
    float _2092 = fma(_2000, _2088, _2090);
    if (_2032)
    {
        float _2094 = _2092 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2078 = _2094;
    }
    float _2096 = _2078;
    float _2098 = sqrt(_2014);
    float _2100 = _2070;
    float _2102 = _2096;
    if (_2032)
    {
        float _2104 = fma(_2070, _2096, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2100 = _2104;
    }
    float _2106 = _2100;
    float _2108 = _2106;
    if (!_2032)
    {
        _2102 = _2022;
    }
    float _2110 = _2102;
    float _2112 = _2110;
    if (_2032)
    {
        float _2114 = _2086 + (-1.0);
        _2080 = _2114;
    }
    float _2116 = _2080;
    float _2118 = _2116;
    if (_2032)
    {
        float _2120 = _2052 * _2106;
        _1812 = _2120;
    }
    float _2122 = _1812;
    if (!_2032)
    {
        _2108 = _2092;
    }
    float _2124 = _2108;
    float _2126 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2128 = _2124;
    if (_2032)
    {
        float _2130 = _2116 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1814 = _2130;
    }
    float _2132 = _1814;
    if (_2032)
    {
        float _2134 = _2020 * _2122;
        _2044 = _2134;
    }
    float _2136 = _2044;
    if (!_2032)
    {
        _2054 = _2024;
    }
    float _2138 = _2054;
    float _2140 = _2138;
    if (_2032)
    {
        float _2142 = _2022 * _2122;
        _2112 = _2142;
    }
    float _2144 = _2112;
    if (_2032)
    {
        float _2146 = fma(_2092, _2086, _2132);
        _2128 = _2146;
    }
    float _2148 = _2128;
    if (_2032)
    {
        float _2150 = _2136 * _2136;
        _2140 = _2150;
    }
    float _2152 = _2140;
    if (!_2032)
    {
        _2118 = _2026;
    }
    float _2154 = _2118;
    float _2156 = _2154;
    if (_2032)
    {
        float _2158 = _2144 * _2144;
        _2156 = _2158;
    }
    float _2160 = _2156;
    float _2162 = fma(_2148, _2148, _2152);
    float _2164 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2166 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2126);
    float _2168 = _2162 + _2160;
    float _2170 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2172 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2174 = fma(_2098, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2172);
    float _2176 = precise::clamp(_2174, 0.0, 1.0);
    float _2178 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2180 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2166);
    float _2182 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2170);
    float _2184 = rsqrt(_2168);
    float _2186 = -_2176;
    float _2188 = _2186 + 1.0;
    float _2190 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2164);
    float _2192 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2182);
    float _2194 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2196 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2190);
    float _2198 = _2192 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2200 = abs(_2188);
    float _2202 = log2(_2200);
    float _2204 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2194);
    float _2206 = _2196 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2208 = _2198 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2210 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2204);
    float _2212 = -_2208;
    float _2214 = fma(_2212, _2178, 1.0);
    float _2216 = _2184 * _2136;
    float _2218 = _2210 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2220 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2222 = _2184 * _2148;
    float _2224 = _2216 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2226 = _2184 * _2144;
    float _2228 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2220);
    float _2230 = _2180 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2232 = -_2224;
    float _2234 = fma(_2222, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2232);
    float _2236 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2238 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2228);
    float _2240 = log2(_2214);
    float _2242 = -_2226;
    float _2244 = fma(_2242, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2234);
    float _2246 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2248 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2238);
    float _2250 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2252 = fma(_2244, -0.5, 0.5);
    float _2254 = fma(_2244, 0.5, 0.5);
    float _2256 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2246);
    float _2258 = exp2(_2236);
    float _2260 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2250);
    float _2262 = _2222 + 1.0;
    float _2264 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2256);
    float _2266 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2260);
    float _2268 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2264);
    float _2270 = 1.0 / _2248;
    float _2272 = fma(_2254, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2274 = _2240 * 0.693147182464599609375;
    float _2276 = fma(_2254, _2272, -0.212114393711090087890625);
    float _2278 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2280 = sqrt(_2252);
    float _2282 = -_2222;
    float _2284 = fma(_2258, _2262, _2282);
    float _2286 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2266);
    float _2288 = fma(_2254, _2276, 1.570728778839111328125);
    float _2290 = _2268 * _2270;
    float _2292 = _2286 * _2270;
    float _2294 = fma(_2284, 0.5, 0.5);
    float _2296 = fma(_2290, 0.5, 0.5);
    float _2298 = fma(_2292, -0.5, 0.5);
    float _2300 = _2280 * 0.636619746685028076171875;
    float3 _6337 = float3(_2296, _2298, _2278);
    float _2302 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6337, float3(0.0), isnan(_6337)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6337, float3(0.0), isnan(_6337)), level(0.0)).x;
    float _2304 = -_2288;
    float _2306 = fma(_2300, _2304, 1.0);
    float3 _6353 = float3(_2296, _2298, _2278);
    float4 _2309 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6353, float3(0.0), isnan(_6353)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6353, float3(0.0), isnan(_6353)), level(0.0)).xyzw;
    float _2311 = _2309.x;
    float _2313 = _2309.y;
    float _2315 = _2309.z;
    float _2317 = _2309.w;
    float2 _6370 = float2(_2306, _2294);
    float3 _2321 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6370, float2(0.0), isnan(_6370)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6370, float2(0.0), isnan(_6370)), level(0.0)).xyz;
    float _2323 = _2321.x;
    float _2325 = _2321.y;
    float _2327 = _2321.z;
    float _2329 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_67.x = _1896;
    out.m_67.y = _1912;
    out.m_67.z = _1890;
    float _2331 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2333 = _2331 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _2335 = _1834 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _2337 = isnan(_1834);
    bool _2339 = _2335 || _2337;
    bool _2341 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _2343 = _2339 || _2341;
    float _2345 = float(_2343);
    float _2347 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2349 = _2347 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2351 = -(*spvDescriptorSet0.vp_c9)._m0[175].y;
    float _2353 = (*spvDescriptorSet0.vp_c9)._m0[176].y + _2351;
    float _2355 = -(*spvDescriptorSet0.vp_c9)._m0[176].y;
    float _2357 = _2355 + (*spvDescriptorSet0.vp_c9)._m0[177].y;
    float _2359 = 1.0 / _2349;
    bool _2361 = _1834 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _2363 = isnan(_1834);
    bool _2365 = _2361 || _2363;
    bool _2367 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _2369 = _2365 || _2367;
    float _2371 = float(_2369);
    float _2373 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2375 = _2373 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    out.m_69.y = _1850;
    bool _2377 = _1834 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _2379 = isnan(_1834);
    bool _2381 = _2377 || _2379;
    bool _2383 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _2385 = _2381 || _2383;
    float _2387 = float(_2385);
    float _2389 = 1.0 / _2333;
    bool _2391 = _1834 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _2393 = isnan(_1834);
    bool _2395 = _2391 || _2393;
    bool _2397 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _2399 = _2395 || _2397;
    float _2401 = float(_2399);
    out.m_71.x = _1992;
    out.m_71.y = _1990;
    out.m_71.z = _1994;
    bool _2403 = _1834 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _2405 = isnan(_1834);
    bool _2407 = _2403 || _2405;
    bool _2409 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _2411 = _2407 || _2409;
    float _2413 = float(_2411);
    out.m_73.x = _2004;
    out.m_73.y = _2000;
    out.m_73.z = _2008;
    bool _2415 = _1838 != 0.0;
    bool _2417 = isnan(_1838);
    bool _2419 = _2415 || _2417;
    bool _2421 = isnan(0.0);
    bool _2423 = _2419 || _2421;
    float _2425 = _2357 * _2359;
    float _2427 = -_2345;
    float _2429 = _2427 + 1.0;
    float _2431 = 1.0 / _2375;
    float _2433 = -(*spvDescriptorSet0.vp_c9)._m0[177].y;
    float _2435 = (*spvDescriptorSet0.vp_c9)._m0[178].y + _2433;
    float _2437 = -(*spvDescriptorSet0.vp_c9)._m0[178].y;
    float _2439 = _2437 + (*spvDescriptorSet0.vp_c9)._m0[179].y;
    float _2441 = _2401 * _2429;
    float _2443 = -_2401;
    float _2445 = _2443 + 1.0;
    bool _2447 = _1834 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _2449 = isnan(_1834);
    bool _2451 = _2447 || _2449;
    bool _2453 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _2455 = _2451 || _2453;
    float _2457 = float(_2455);
    float _2459 = _2353 * _2389;
    float _2461 = -_2387;
    float _2463 = _2461 + 1.0;
    float _2465 = _2371 * _2445;
    float _2467 = -_2371;
    float _2469 = _2467 + 1.0;
    bool _2471 = _1836 == 0.0;
    bool _2473 = !_2423;
    bool _2475 = _2471 && _2473;
    float _2477 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2479 = _2477 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2481 = _2413 * _2463;
    float _2483 = _2457 * _2469;
    float _2485 = -_2457;
    float _2487 = _2485 + 1.0;
    float _2489 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2491 = _2489 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2493 = _2435 * _2431;
    float _2495 = 1.0 / _2479;
    bool _2497 = _1834 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _2499 = isnan(_1834);
    bool _2501 = _2497 || _2499;
    bool _2503 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _2505 = _2501 || _2503;
    float _2507 = float(_2505);
    float _2509 = -_2413;
    float _2511 = _2509 + 1.0;
    bool _2513 = _1834 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _2515 = isnan(_1834);
    bool _2517 = _2513 || _2515;
    bool _2519 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _2521 = _2517 || _2519;
    float _2523 = float(_2521);
    bool _2525 = _1840 == 0.0;
    bool _2527 = _2525 && _2475;
    float _2529 = _2507 * _2487;
    float _2531 = -_2507;
    float _2533 = _2531 + 1.0;
    float _2535 = 1.0 / _2491;
    float _2537 = -_2523;
    float _2539 = _2537 + 1.0;
    float _2541 = _2523 * _2533;
    float _2543 = _2387 * _2539;
    float _2545 = -(*spvDescriptorSet0.vp_c9)._m0[179].y;
    float _2547 = (*spvDescriptorSet0.vp_c9)._m0[180].y + _2545;
    float _2549 = _2439 * _2495;
    float _2551 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2553 = _1834 + _2551;
    float _2555 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2557 = _2555 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2559 = -(*spvDescriptorSet0.vp_c9)._m0[180].y;
    float _2561 = _2559 + (*spvDescriptorSet0.vp_c9)._m0[181].y;
    float _2563 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2565 = _2563 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _2567 = fma(_2459, _2553, (*spvDescriptorSet0.vp_c9)._m0[175].y);
    float _2569 = _2547 * _2535;
    float _2571 = _2567 * _2481;
    float _2573 = 1.0 / _2565;
    float _2575 = in.m_75.x;
    float _2577 = in.m_75.y;
    float _2579 = in.m_75.z;
    float _2581 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2583 = _1834 + _2581;
    float _2585 = fma(_2511, (*spvDescriptorSet0.vp_c9)._m0[175].y, _2571);
    float _2587 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2589 = _1834 + _2587;
    float _2591 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2593 = fma(_2425, _2583, (*spvDescriptorSet0.vp_c9)._m0[176].y);
    float _2595 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2597 = _1834 + _2595;
    float _2599 = fma(_2493, _2589, (*spvDescriptorSet0.vp_c9)._m0[177].y);
    float _2601 = 1.0 / _2557;
    float _2603 = fma(_2593, _2543, _2585);
    float _2605 = fma(_2549, _2597, (*spvDescriptorSet0.vp_c9)._m0[178].y);
    float _2607 = -(*spvDescriptorSet0.vp_c9)._m0[181].y;
    float _2609 = (*spvDescriptorSet0.vp_c9)._m0[182].y + _2607;
    float _2611 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2613 = _1834 + _2611;
    float _2615 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2617 = _1834 + _2615;
    float _2619 = fma(_2599, _2541, _2603);
    float _2621 = _2609 * _2573;
    float _2623 = fma(_2569, _2613, (*spvDescriptorSet0.vp_c9)._m0[179].y);
    out.m_49.x = _2591;
    float _2625 = fma(_2605, _2529, _2619);
    float _2627 = fma(_2623, _2483, _2625);
    float _2629 = _2577;
    float _2631 = _2575;
    float _2633 = _2579;
    if (!_2527)
    {
        float _2635 = fma(_1838, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2577);
        _2629 = _2635;
    }
    float _2637 = _2629;
    if (!_2527)
    {
        float _2639 = fma(_1836, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2575);
        _2631 = _2639;
    }
    float _2641 = _2631;
    float _2643 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2645 = _1834 + _2643;
    if (!_2527)
    {
        float _2647 = fma(_1840, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2579);
        _2633 = _2647;
    }
    float _2649 = _2633;
    float _2651 = _2637 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2653 = _2637 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2655 = _2637 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2657 = fma(_2621, _2645, (*spvDescriptorSet0.vp_c9)._m0[181].y);
    float _2659 = fma(_2641, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2651);
    float _2661 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2663 = fma(_2641, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2653);
    float _2665 = fma(_2641, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2655);
    float _2667 = fma(_2649, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2659);
    float _2669 = _2561 * _2601;
    float _2671 = exp2(_2329);
    float _2673 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2661);
    float _2675 = fma(_2649, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2663);
    float _2677 = fma(_2669, _2617, (*spvDescriptorSet0.vp_c9)._m0[180].y);
    float _2679 = fma(_2649, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2665);
    float _2681 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2673);
    float _2683 = fma(_2677, _2465, _2627);
    float _2685 = _2248 * 0.5;
    out.m_77.x = _2667;
    out.m_77.y = _2675;
    out.m_77.z = _2679;
    float _2687 = fma(_2657, _2441, _2683);
    float _2689 = fma(_2345, (*spvDescriptorSet0.vp_c9)._m0[182].y, _2687);
    float _2691 = -_2671;
    float _2693 = _2691 + 1.0;
    float _2695 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2681);
    float _2697 = _2268 + _2248;
    float _2699 = fma(_2286, -0.5, _2685);
    float _2701 = _2693 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2703 = _2695 + _2248;
    float _2705 = _2697 * 0.5;
    out.m_79.y = _2689;
    float _2707 = _2703 * 0.5;
    out.gl_Position.x = _2268;
    out.gl_Position.y = _2286;
    out.gl_Position.z = _2695;
    out.gl_Position.w = _2248;
    out.m_81.x = _2705;
    out.m_81.y = _2699;
    out.m_81.z = _2707;
    out.m_81.w = _2248;
    float _2709 = _2701 * _2302;
    float _2711 = -_2701;
    float _2713 = _2711 + 1.0;
    float _2715 = _2317 * _2709;
    float _2717 = _2317 * _2713;
    float _2719 = _2327 * _2709;
    float _2721 = fma(_2323, _2715, _2311);
    float _2723 = fma(_2325, _2715, _2313);
    float _2725 = fma(_2317, _2719, _2315);
    out.m_83.x = _2721;
    out.m_83.y = _2723;
    out.m_83.z = _2725;
    out.m_83.w = _2717;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1832 = false;
    bool _1516 = false;
    bool _1206 = false;
    bool _1110 = false;
    bool _896 = false;
    bool _670 = false;
    bool _390 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_42.w;
    float _99 = in.m_44.w;
    float _101 = trunc(_97);
    int _104 = int(_101);
    float _106 = -_99;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _108;
    bool _112 = _104 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_104);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2793 = as_type<float>(_124);
        out.gl_Position.z = _2793;
    }
    if (!_112)
    {
        return out;
    }
    bool _128 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_99);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = in.m_51.z;
    float _140 = float(_104);
    float _142 = in.m_51.y;
    bool _144 = _108 >= _140;
    bool _146 = !_136;
    bool _148 = _144 || _146;
    float _150 = in.m_51.w;
    float _152 = in.m_51.x;
    if (_148)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _116;
    if (_148)
    {
        out.m_49.x = 0.0;
    }
    if (_148)
    {
        float _156 = _154 * 5.0;
        _126 = as_type<int>(_156);
    }
    int _158 = _126;
    out.m_53.z = _138;
    out.m_53.y = _142;
    out.m_53.w = _150;
    float _160 = _150;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2863 = as_type<float>(_158);
        out.gl_Position.z = _2863;
    }
    out.m_53.x = _152;
    if (_148)
    {
        return out;
    }
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _108 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _166 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    int _178 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _180 = _178 != 0;
    float _182 = _164 * _162;
    float _184 = _166;
    if (!_176)
    {
        float _186 = _166 * _166;
        float _188 = _186 * 0.5;
        _160 = _188;
    }
    float _190 = _160;
    float _192 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[20].x, _182);
    float _194 = in.m_44.x;
    float _196 = in.m_44.y;
    float _198 = in.m_44.z;
    float _200 = _190;
    if (!_176)
    {
        float _202 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _202;
    }
    float _204 = _200;
    float _206 = _192 * 6.283185482025146484375;
    float _208 = floor(_192);
    float _210 = _206 * 0.15915493667125701904296875;
    float _212 = _210 * 6.283185482025146484375;
    float _214 = cos(_212);
    float _216 = -_208;
    float _218 = _192 + _216;
    bool _220 = !_176;
    float _222 = _204;
    if (!_220)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = _166 * _226;
        float _236 = 1.0 / _230;
        float _238 = _232 * 0.693147182464599609375;
        float _240 = exp2(_234);
        float _242 = 1.0 / _238;
        float _244 = _240 + (-1.0);
        float _246 = -_244;
        float _248 = fma(_246, _242, _166);
        float _250 = _248 * _236;
        float _252 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _222 = _252;
    }
    float _254 = _222;
    bool _256 = !_176;
    if (!_256)
    {
        float _258 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _260 = log2(_258);
        float _262 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _264 = _262 + 1.0;
        float _266 = 1.0 / _264;
        float _268 = _166 * _260;
        float _270 = exp2(_268);
        float _272 = -_270;
        float _274 = _272 + 1.0;
        float _276 = _274 * _266;
        _184 = _276;
    }
    float _278 = _184;
    float _280 = in.m_55.w;
    float _282 = 1.0 / _140;
    bool _284 = _218 < 0.5;
    float _286 = float(_284);
    float _288 = in.m_42.x;
    float _290 = in.m_42.y;
    float _292 = in.m_42.z;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _296 = _294 != 0;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _300 = _298 != 0;
    float _302 = fma(_214, 0.5, 0.5);
    float _304 = -_218;
    float _306 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _308 = -_286;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _312 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _314 = !_296;
    int _316 = _314 ? 0 : 1;
    float _318 = -_302;
    float _320 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _322 = !_180;
    int _324 = _322 ? 0 : 1;
    float _326 = fma(_278, _194, _312);
    bool _328 = !_300;
    int _330 = _328 ? 0 : 1;
    float _332 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _334 = abs(_316);
    float _336 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _338 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _340 = fma(_278, _196, _332);
    int _342 = abs(_324);
    float _344 = fma(_278, _198, _336);
    int _346 = abs(_330);
    float _348 = float(_334);
    float _350 = float(_342);
    float _352 = abs(_306);
    float _354 = _348 * _352;
    float _356 = fma(_326, _280, _288);
    float _358 = fma(_344, _280, _292);
    float _360 = float(_346);
    float _362 = fma(_350, _320, _354);
    float _364 = fma(_340, _280, _290);
    float _366 = _108 * _282;
    float _368 = abs(_310);
    float _370 = fma(_360, _368, _362);
    bool _372 = !_338;
    float _388;
    if (!_372)
    {
        float _374 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _376 = _152 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _378 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[12].x, _108);
        float _380 = _378 * _374;
        float _382 = floor(_380);
        float _384 = -_382;
        float _386 = _380 + _384;
        _388 = _386;
        _390 = true;
    }
    else
    {
        _388 = _366;
    }
    _390 = false;
    float _392 = _388;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _396 = _392 + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _400 = _392 + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _404 = _392 + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _422 = 1.0 / _408;
    bool _424 = _392 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _426 = isnan(_392);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    bool _436 = _392 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _438 = isnan(_392);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _444 = _440 || _442;
    float _446 = float(_444);
    float _448 = 1.0 / _412;
    bool _450 = _392 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _452 = isnan(_392);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = 1.0 / _416;
    float _464 = _396 * _422;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _468 = _392 + _466;
    bool _470 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _472 = 1.0 / _420;
    float _474 = _400 * _448;
    bool _476 = _392 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _478 = isnan(_392);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = -_486;
    float _490 = _488 + 1.0;
    float _492 = _404 * _462;
    float _494 = _468 * _472;
    bool _496 = _392 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _498 = isnan(_392);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _516 = _506 * _490;
    float _518 = -_506;
    float _520 = _518 + 1.0;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _522;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _526;
    float _530 = fma(_510, _464, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _532 = _446 * _520;
    float _534 = fma(_524, _464, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _536 = fma(_528, _464, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _538 = -_434;
    float _540 = _538 + 1.0;
    float _542 = -_446;
    float _544 = _542 + 1.0;
    float _546 = _460 * _540;
    float _548 = _434 * _544;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _554 = -_460;
    float _556 = _554 + 1.0;
    float _558 = _534 * _546;
    float _560 = _536 * _546;
    float _562 = fma(_514, _474, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _568 = _530 * _546;
    float _570 = in.m_55.x;
    float _572 = in.m_55.y;
    float _574 = in.m_55.z;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _576;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _580;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _584;
    float _588 = fma(_552, _474, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _590 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[143].x, _558);
    float _592 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[143].y, _560);
    float _594 = fma(_566, _474, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _596 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[143].z, _568);
    float _598 = fma(_578, _492, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _600 = fma(_582, _492, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _602 = fma(_586, _492, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _604 = fma(_562, _548, _590);
    float _606 = fma(_588, _548, _592);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _620 = fma(_594, _548, _596);
    float _622 = fma(_610, _494, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _624 = fma(_614, _494, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _626 = fma(_618, _494, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _628 = fma(_598, _532, _604);
    float _630 = fma(_600, _532, _606);
    float _632 = fma(_602, _532, _620);
    float _634 = fma(_622, _516, _628);
    float _636 = fma(_624, _516, _630);
    float _638 = fma(_626, _516, _632);
    float _640 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[147].x, _634);
    float _642 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[147].y, _636);
    float _644 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[147].z, _638);
    float _646 = _640 * _570;
    float _648 = _642 * _572;
    float _650 = _644 * _574;
    bool _652 = !_470;
    float _668;
    if (!_652)
    {
        float _654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _656 = _152 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _658 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[11].x, _108);
        float _660 = _658 * _654;
        float _662 = floor(_660);
        float _664 = -_662;
        float _666 = _660 + _664;
        _668 = _666;
        _670 = true;
    }
    else
    {
        _668 = _366;
    }
    _670 = false;
    float _672 = _668;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _676 = _672 + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _680 = _672 + _678;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _684 = _672 + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _686;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _690;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _698 = 1.0 / _688;
    bool _700 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _702 = 1.0 / _692;
    bool _704 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _706 = isnan(_672);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = -_714;
    float _718 = _716 + 1.0;
    float _720 = 1.0 / _696;
    float _722 = _676 * _698;
    bool _724 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _726 = isnan(_672);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = _680 * _702;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _742;
    float _746 = -_734;
    float _748 = _746 + 1.0;
    float _750 = fma(_740, _736, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _752 = fma(_744, _736, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _754 = _714 * _748;
    float _756 = _684 * _720;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _758;
    bool _762 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _764 = isnan(_672);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _770 = _766 || _768;
    float _772 = float(_770);
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _778 = fma(_760, _736, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _780 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _782 = isnan(_672);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = _772 * _718;
    float _794 = -_772;
    float _796 = _794 + 1.0;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _806 = fma(_776, _756, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _808 = _790 * _796;
    float _810 = fma(_800, _756, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _812 = fma(_804, _756, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _814 = _750 * _808;
    float _816 = _752 * _808;
    float _818 = -_790;
    float _820 = _818 + 1.0;
    float _822 = _778 * _808;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _824;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _828;
    float _832 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[107].x, _814);
    float _834 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[107].y, _816);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _836;
    float _840 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[107].z, _822);
    float _842 = fma(_826, _722, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _844 = fma(_810, _792, _832);
    float _846 = fma(_830, _722, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _848 = fma(_838, _722, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _850 = fma(_806, _792, _834);
    float _852 = fma(_812, _792, _840);
    float _854 = fma(_842, _754, _844);
    float _856 = fma(_846, _754, _850);
    float _858 = fma(_848, _754, _852);
    float _860 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[110].x, _854);
    float _862 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[110].y, _856);
    float _864 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[110].z, _858);
    float _866 = _860 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _868 = _862 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _870 = _864 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _872 = _866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _874 = _868 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _876 = _870 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _872;
    out.m_57.y = _874;
    out.m_57.z = _876;
    bool _878 = !_700;
    float _894;
    if (!_878)
    {
        float _880 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _882 = _152 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _884 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[11].z, _108);
        float _886 = _884 * _880;
        float _888 = floor(_886);
        float _890 = -_888;
        float _892 = _886 + _890;
        _894 = _892;
        _896 = true;
    }
    else
    {
        _894 = _366;
    }
    _896 = false;
    float _898 = _894;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _902 = _898 + _900;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _906 = _898 + _904;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _910 = _898 + _908;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _912;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _916;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _922 = _920 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _924 = 1.0 / _914;
    bool _926 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _928 = 1.0 / _918;
    bool _930 = _898 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _932 = isnan(_898);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _938 = _934 || _936;
    float _940 = float(_938);
    float _942 = -_940;
    float _944 = _942 + 1.0;
    float _946 = 1.0 / _922;
    bool _948 = _898 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _950 = isnan(_898);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _956 = _952 || _954;
    float _958 = float(_956);
    float _960 = _902 * _924;
    bool _962 = _898 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _964 = isnan(_898);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = _906 * _928;
    float _976 = -_958;
    float _978 = _976 + 1.0;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _980;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _984;
    float _988 = _972 * _978;
    bool _990 = _898 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _992 = isnan(_898);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _998 = _994 || _996;
    float _1000 = float(_998);
    float _1002 = fma(_982, _974, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1004 = _910 * _946;
    float _1006 = -_972;
    float _1008 = _1006 + 1.0;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1010;
    float _1014 = fma(_986, _974, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1020 = _940 * _1008;
    float _1022 = _1000 * _944;
    float _1024 = fma(_1012, _974, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1034 = _1002 * _1022;
    float _1036 = _1014 * _1022;
    float _1038 = -_1000;
    float _1040 = _1038 + 1.0;
    float _1042 = _1024 * _1022;
    float _1044 = fma(_1018, _1004, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1046 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1034);
    float _1048 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1036);
    float _1050 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1042);
    float _1052 = fma(_1028, _1004, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1054 = fma(_1032, _1004, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1064;
    float _1068 = fma(_1044, _1020, _1046);
    float _1070 = fma(_1058, _960, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1072 = fma(_1062, _960, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1074 = fma(_1066, _960, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1076 = fma(_1052, _1020, _1048);
    float _1078 = fma(_1054, _1020, _1050);
    float _1080 = fma(_1070, _988, _1068);
    float _1082 = fma(_1072, _988, _1076);
    float _1084 = fma(_1074, _988, _1078);
    float _1086 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1080);
    float _1088 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1082);
    float _1090 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1084);
    bool _1092 = !_926;
    float _1108;
    if (!_1092)
    {
        float _1094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1096 = _152 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1098 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[11].w, _108);
        float _1100 = _1098 * _1094;
        float _1102 = floor(_1100);
        float _1104 = -_1102;
        float _1106 = _1100 + _1104;
        _1108 = _1106;
        _1110 = true;
    }
    else
    {
        _1108 = _366;
    }
    _1110 = false;
    float _1112 = _1108;
    bool _1114 = _1112 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1116 = isnan(_1112);
    bool _1118 = _1114 || _1116;
    bool _1120 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1122 = _1118 || _1120;
    float _1124 = float(_1122);
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1128 = _1126 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1130 = _1112 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1132 = isnan(_1112);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1138 = _1134 || _1136;
    float _1140 = float(_1138);
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1148 = _1112 + _1146;
    float _1150 = -_1124;
    float _1152 = _1150 + 1.0;
    bool _1154 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1156 = 1.0 / _1128;
    float _1158 = _1140 * _1152;
    float _1160 = -_1140;
    float _1162 = _1160 + 1.0;
    float _1164 = _1144 * _1156;
    float _1166 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1168 = fma(_1164, _1148, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1170 = _1088 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1172 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1174 = _1168 * _1158;
    float _1176 = _1086 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1178 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1180 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1174);
    float _1182 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1184 = fma(_1124, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1180);
    float _1186 = _1184 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = _1182;
    out.m_59.y = _1178;
    out.m_59.z = _1172;
    out.m_59.w = _1186;
    bool _1188 = !_1154;
    float _1204;
    if (!_1188)
    {
        float _1190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1192 = _152 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[14].x, _108);
        float _1196 = _1194 * _1190;
        float _1198 = floor(_1196);
        float _1200 = -_1198;
        float _1202 = _1196 + _1200;
        _1204 = _1202;
        _1206 = true;
    }
    else
    {
        _1204 = _366;
    }
    _1206 = false;
    float _1208 = _1204;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1212 = _1208 + _1210;
    bool _1214 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1216 = isnan(_1208);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1222 = _1218 || _1220;
    float _1224 = float(_1222);
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1228 = _1226 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1230 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1232 = isnan(_1208);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1238 = _1234 || _1236;
    float _1240 = float(_1238);
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1242;
    bool _1246 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1248 = isnan(_1208);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = -_1224;
    float _1260 = _1258 + 1.0;
    float _1262 = 1.0 / _1228;
    float _1264 = -_1256;
    float _1266 = _1264 + 1.0;
    bool _1268 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1270 = isnan(_1208);
    bool _1272 = _1268 || _1270;
    bool _1274 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1276 = _1272 || _1274;
    float _1278 = float(_1276);
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1282 = _1280 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1284 = 1.0 / _1282;
    bool _1286 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1288 = _1244 * _1262;
    float _1290 = _1240 * _1260;
    float _1292 = -_1240;
    float _1294 = _1292 + 1.0;
    bool _1296 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1298 = isnan(_1208);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1304 = _1300 || _1302;
    float _1306 = float(_1304);
    float _1308 = fma(_1288, _1212, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1312 = _1310 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1314 = _1256 * _1294;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1318 = _1316 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1320 = _1306 * _1266;
    float _1322 = -_1306;
    float _1324 = _1322 + 1.0;
    bool _1326 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1328 = isnan(_1208);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = -_1278;
    float _1340 = _1338 + 1.0;
    float _1342 = 1.0 / _1318;
    float _1344 = _1278 * _1324;
    bool _1346 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1348 = isnan(_1208);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1354 = _1350 || _1352;
    float _1356 = float(_1354);
    float _1358 = _1336 * _1340;
    float _1360 = -_1336;
    float _1362 = _1360 + 1.0;
    float _1364 = _1356 * _1362;
    float _1366 = 1.0 / _1312;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1370 = _1368 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1374 = _1372 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1376 = _1308 * _1364;
    float _1378 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1380 = _1378 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1382 = -_1356;
    float _1384 = _1382 + 1.0;
    float _1386 = _1374 * _1284;
    float _1388 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1388;
    float _1392 = 1.0 / _1370;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1396 = _1208 + _1394;
    float _1398 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1376);
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1402 = _1400 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1404 = _1390 * _1342;
    float _1406 = fma(_1386, _1396, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1410 = _1208 + _1408;
    float _1412 = 1.0 / _1380;
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1416 = _1414 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1418 = fma(_1404, _1410, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1420 = fma(_1406, _1358, _1398);
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1422;
    float _1426 = _1416 * _1366;
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1430 = _1208 + _1428;
    float _1432 = fma(_1418, _1344, _1420);
    float _1434 = 1.0 / _1402;
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1438 = _1436 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1440 = _1424 * _1392;
    float _1442 = fma(_1426, _1430, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1446 = _1208 + _1444;
    float _1448 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1448;
    float _1452 = _1438 * _1412;
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1456 = _1208 + _1454;
    bool _1458 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1460 = isnan(_1208);
    bool _1462 = _1458 || _1460;
    bool _1464 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1466 = _1462 || _1464;
    float _1468 = float(_1466);
    float _1470 = fma(_1440, _1446, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1472 = fma(_1442, _1320, _1432);
    float _1474 = fma(_1452, _1456, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1478 = _1208 + _1476;
    float _1480 = -_1468;
    float _1482 = _1480 + 1.0;
    float _1484 = _1450 * _1434;
    float _1486 = fma(_1470, _1314, _1472);
    float _1488 = _1224 * _1482;
    float _1490 = fma(_1484, _1478, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1492 = fma(_1474, _1290, _1486);
    float _1494 = fma(_1490, _1488, _1492);
    float _1496 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1494);
    out.m_61.z = _1496;
    bool _1498 = !_1286;
    float _1514;
    if (!_1498)
    {
        float _1500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1502 = _152 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1504 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[14].y, _108);
        float _1506 = _1504 * _1500;
        float _1508 = floor(_1506);
        float _1510 = -_1508;
        float _1512 = _1506 + _1510;
        _1514 = _1512;
        _1516 = true;
    }
    else
    {
        _1514 = _366;
    }
    _1516 = false;
    float _1518 = _1514;
    float _1520 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1522 = _1518 + _1520;
    bool _1524 = _1518 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1526 = isnan(_1518);
    bool _1528 = _1524 || _1526;
    bool _1530 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1532 = _1528 || _1530;
    float _1534 = float(_1532);
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1538 = _1536 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1540 = _1518 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1542 = isnan(_1518);
    bool _1544 = _1540 || _1542;
    bool _1546 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1548 = _1544 || _1546;
    float _1550 = float(_1548);
    float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1552;
    bool _1556 = _1518 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1558 = isnan(_1518);
    bool _1560 = _1556 || _1558;
    bool _1562 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1564 = _1560 || _1562;
    float _1566 = float(_1564);
    float _1568 = -_1534;
    float _1570 = _1568 + 1.0;
    float _1572 = 1.0 / _1538;
    float _1574 = -_1566;
    float _1576 = _1574 + 1.0;
    bool _1578 = _1518 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1580 = isnan(_1518);
    bool _1582 = _1578 || _1580;
    bool _1584 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1586 = _1582 || _1584;
    float _1588 = float(_1586);
    float _1590 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1592 = _1590 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1594 = 1.0 / _1592;
    bool _1596 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1598 = _1554 * _1572;
    float _1600 = _1550 * _1570;
    float _1602 = -_1550;
    float _1604 = _1602 + 1.0;
    bool _1606 = _1518 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1608 = isnan(_1518);
    bool _1610 = _1606 || _1608;
    bool _1612 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1614 = _1610 || _1612;
    float _1616 = float(_1614);
    float _1618 = fma(_1598, _1522, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1622 = _1620 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1624 = _1566 * _1604;
    float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1628 = _1626 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1630 = _1616 * _1576;
    float _1632 = -_1616;
    float _1634 = _1632 + 1.0;
    bool _1636 = _1518 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1638 = isnan(_1518);
    bool _1640 = _1636 || _1638;
    bool _1642 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1644 = _1640 || _1642;
    float _1646 = float(_1644);
    float _1648 = -_1588;
    float _1650 = _1648 + 1.0;
    float _1652 = 1.0 / _1628;
    float _1654 = _1588 * _1634;
    bool _1656 = _1518 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1658 = isnan(_1518);
    bool _1660 = _1656 || _1658;
    bool _1662 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1664 = _1660 || _1662;
    float _1666 = float(_1664);
    float _1668 = _1646 * _1650;
    float _1670 = -_1646;
    float _1672 = _1670 + 1.0;
    float _1674 = _1666 * _1672;
    float _1676 = 1.0 / _1622;
    float _1678 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1680 = _1678 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1684 = _1682 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1686 = _1618 * _1674;
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1690 = _1688 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1692 = -_1666;
    float _1694 = _1692 + 1.0;
    float _1696 = _1684 * _1594;
    float _1698 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1698;
    float _1702 = 1.0 / _1680;
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1706 = _1518 + _1704;
    float _1708 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1686);
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1712 = _1710 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1714 = _1700 * _1652;
    float _1716 = fma(_1696, _1706, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1720 = _1518 + _1718;
    float _1722 = 1.0 / _1690;
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1728 = fma(_1714, _1720, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1730 = fma(_1716, _1668, _1708);
    float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1732;
    float _1736 = _1726 * _1676;
    float _1738 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1740 = _1518 + _1738;
    float _1742 = fma(_1728, _1654, _1730);
    float _1744 = 1.0 / _1712;
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1748 = _1746 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1750 = _1734 * _1702;
    float _1752 = fma(_1736, _1740, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1754 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1756 = _1518 + _1754;
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1760 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1758;
    float _1762 = _1748 * _1722;
    float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1766 = _1518 + _1764;
    bool _1768 = _1518 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1770 = isnan(_1518);
    bool _1772 = _1768 || _1770;
    bool _1774 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1776 = _1772 || _1774;
    float _1778 = float(_1776);
    float _1780 = fma(_1750, _1756, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1782 = fma(_1752, _1630, _1742);
    float _1784 = fma(_1762, _1766, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1788 = _1518 + _1786;
    float _1790 = -_1778;
    float _1792 = _1790 + 1.0;
    float _1794 = _1760 * _1744;
    float _1796 = fma(_1780, _1624, _1782);
    float _1798 = _1534 * _1792;
    float _1800 = fma(_1794, _1788, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1802 = fma(_1784, _1600, _1796);
    float _1804 = fma(_1800, _1798, _1802);
    float _1806 = fma(_1778, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1804);
    out.m_63.x = _1806;
    bool _1808 = !_1596;
    float _1810 = _1798;
    float _1812 = _1702;
    float _1814 = _1778;
    float _1830;
    if (!_1808)
    {
        float _1816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1818 = _152 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1820 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[14].z, _108);
        float _1822 = _1820 * _1816;
        float _1824 = floor(_1822);
        float _1826 = -_1824;
        float _1828 = _1822 + _1826;
        _1830 = _1828;
        _1832 = true;
    }
    else
    {
        _1830 = _366;
    }
    _1832 = false;
    float _1834 = _1830;
    float _1836 = in.m_65.x;
    float _1838 = in.m_65.y;
    float _1840 = in.m_65.z;
    float _1842 = _370 * _648;
    float _1844 = _370 * _646;
    float _1846 = _370 * _650;
    float _1848 = _364 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1850 = _1842 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1852 = _1844 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1854 = _1846 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1856 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1838);
    float _1858 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1836);
    float _1860 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1840);
    float _1862 = _1850 * _1856;
    float _1864 = _1852 * _1858;
    float _1866 = _1854 * _1860;
    float _1868 = _364 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1870 = _1862 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1872 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1848);
    float _1874 = _1862 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1876 = _364 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1878 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1870);
    float _1880 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1868);
    float _1882 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1872);
    float _1884 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1874);
    float _1886 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1878);
    float _1888 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1880);
    float _1890 = _1882 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1892 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1884);
    float _1894 = _1886 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1896 = _1888 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1898 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1876);
    float _1900 = _1892 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1902 = _1890 + _1894;
    float _1904 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1898);
    float _1906 = _1896 + _1900;
    float _1908 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1910 = _1902 + _1908;
    float _1912 = _1904 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1914 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1916 = _1906 + _1914;
    float _1918 = _1910 * _1910;
    float _1920 = fma(_1916, _1916, _1918);
    float _1922 = _1862 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1924 = sqrt(_1920);
    float _1926 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1922);
    float _1928 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1926);
    float _1930 = _1928 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1932 = _1912 + _1930;
    bool _1934 = _1924 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1936 = _1862;
    float _1938 = _1902;
    float _1940 = _1906;
    float _1942 = _1866;
    if (!_1934)
    {
        _1936 = _1902;
    }
    float _1944 = _1936;
    float _1946 = _1944;
    if (!_1934)
    {
        _1938 = _1932;
    }
    float _1948 = _1938;
    bool _1950 = !_1934;
    float _1952 = _1948;
    if (!_1950)
    {
        float _1954 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1956 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1958 = _1924 + _1956;
        float _1960 = _1932 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1962 = _1958 * _1954;
        float _1964 = rsqrt(_1920);
        float _1966 = _1962 * 0.15915493667125701904296875;
        float _1968 = _1966 * 6.283185482025146484375;
        float _1970 = cos(_1968);
        float _1972 = _1966 * 6.283185482025146484375;
        float _1974 = sin(_1972);
        float _1976 = _1970 + (-1.0);
        float _1978 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1980 = fma(_1974, _1960, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1982 = fma(_1932, _1970, _1978);
        float _1984 = _1964 * _1980;
        float _1986 = fma(_1916, _1984, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1988 = fma(_1910, _1984, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1952 = _1982;
        _1940 = _1986;
        _1946 = _1988;
        _1942 = _1966;
    }
    float _1990 = _1952;
    float _1992 = _1940;
    float _1994 = _1946;
    float _1996 = _1942;
    float _1998 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2000 = _1990 + _1998;
    float _2002 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2004 = _1992 + _2002;
    float _2006 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2008 = _1994 + _2006;
    float _2010 = _2000 * _2000;
    float _2012 = fma(_2004, _2004, _2010);
    float _2014 = fma(_2008, _2008, _2012);
    float _2016 = rsqrt(_2014);
    float _2018 = _2016 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2020 = _2004 * _2018;
    float _2022 = _2008 * _2018;
    float _2024 = _2020 * _2020;
    float _2026 = _2022 * _2022;
    float _2028 = _2024 + _2026;
    float _2030 = sqrt(_2028);
    bool _2032 = _2030 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2034 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2036 = _2030 + _2034;
    float _2038 = _1910;
    float _2040 = _2028;
    float _2042 = _2036;
    float _2044 = _2020;
    if (_2032)
    {
        float _2046 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2038 = _2046;
    }
    float _2048 = _2038;
    if (_2032)
    {
        float _2050 = rsqrt(_2028);
        _2040 = _2050;
    }
    float _2052 = _2040;
    float _2054 = _2052;
    if (_2032)
    {
        float _2056 = _2036 * _2048;
        _2042 = _2056;
    }
    float _2058 = _2042;
    if (_2032)
    {
        float _2060 = _2058 * 0.15915493667125701904296875;
        _1810 = _2060;
    }
    float _2062 = _1810;
    float _2064 = _1932;
    if (_2032)
    {
        float _2066 = _2062 * 6.283185482025146484375;
        float _2068 = sin(_2066);
        _2064 = _2068;
    }
    float _2070 = _2064;
    float _2072 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2074 = precise::max(0.0, _2072);
    float _2076 = _1996;
    float _2078 = _2074;
    float _2080 = _2072;
    if (_2032)
    {
        float _2082 = _2062 * 6.283185482025146484375;
        float _2084 = cos(_2082);
        _2076 = _2084;
    }
    float _2086 = _2076;
    float _2088 = -_2018;
    float _2090 = -_2074;
    float _2092 = fma(_2000, _2088, _2090);
    if (_2032)
    {
        float _2094 = _2092 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2078 = _2094;
    }
    float _2096 = _2078;
    float _2098 = sqrt(_2014);
    float _2100 = _2070;
    float _2102 = _2096;
    if (_2032)
    {
        float _2104 = fma(_2070, _2096, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2100 = _2104;
    }
    float _2106 = _2100;
    float _2108 = _2106;
    if (!_2032)
    {
        _2102 = _2022;
    }
    float _2110 = _2102;
    float _2112 = _2110;
    if (_2032)
    {
        float _2114 = _2086 + (-1.0);
        _2080 = _2114;
    }
    float _2116 = _2080;
    float _2118 = _2116;
    if (_2032)
    {
        float _2120 = _2052 * _2106;
        _1812 = _2120;
    }
    float _2122 = _1812;
    if (!_2032)
    {
        _2108 = _2092;
    }
    float _2124 = _2108;
    float _2126 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2128 = _2124;
    if (_2032)
    {
        float _2130 = _2116 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1814 = _2130;
    }
    float _2132 = _1814;
    if (_2032)
    {
        float _2134 = _2020 * _2122;
        _2044 = _2134;
    }
    float _2136 = _2044;
    if (!_2032)
    {
        _2054 = _2024;
    }
    float _2138 = _2054;
    float _2140 = _2138;
    if (_2032)
    {
        float _2142 = _2022 * _2122;
        _2112 = _2142;
    }
    float _2144 = _2112;
    if (_2032)
    {
        float _2146 = fma(_2092, _2086, _2132);
        _2128 = _2146;
    }
    float _2148 = _2128;
    if (_2032)
    {
        float _2150 = _2136 * _2136;
        _2140 = _2150;
    }
    float _2152 = _2140;
    if (!_2032)
    {
        _2118 = _2026;
    }
    float _2154 = _2118;
    float _2156 = _2154;
    if (_2032)
    {
        float _2158 = _2144 * _2144;
        _2156 = _2158;
    }
    float _2160 = _2156;
    float _2162 = fma(_2148, _2148, _2152);
    float _2164 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2166 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2126);
    float _2168 = _2162 + _2160;
    float _2170 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2172 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2174 = fma(_2098, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2172);
    float _2176 = precise::clamp(_2174, 0.0, 1.0);
    float _2178 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2180 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2166);
    float _2182 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2170);
    float _2184 = rsqrt(_2168);
    float _2186 = -_2176;
    float _2188 = _2186 + 1.0;
    float _2190 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2164);
    float _2192 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2182);
    float _2194 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2196 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2190);
    float _2198 = _2192 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2200 = abs(_2188);
    float _2202 = log2(_2200);
    float _2204 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2194);
    float _2206 = _2196 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2208 = _2198 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2210 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2204);
    float _2212 = -_2208;
    float _2214 = fma(_2212, _2178, 1.0);
    float _2216 = _2184 * _2136;
    float _2218 = _2210 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2220 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2222 = _2184 * _2148;
    float _2224 = _2216 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2226 = _2184 * _2144;
    float _2228 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2220);
    float _2230 = _2180 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2232 = -_2224;
    float _2234 = fma(_2222, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2232);
    float _2236 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2238 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2228);
    float _2240 = log2(_2214);
    float _2242 = -_2226;
    float _2244 = fma(_2242, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2234);
    float _2246 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2248 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2238);
    float _2250 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2252 = fma(_2244, -0.5, 0.5);
    float _2254 = fma(_2244, 0.5, 0.5);
    float _2256 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2246);
    float _2258 = exp2(_2236);
    float _2260 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2250);
    float _2262 = _2222 + 1.0;
    float _2264 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2256);
    float _2266 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2260);
    float _2268 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2264);
    float _2270 = 1.0 / _2248;
    float _2272 = fma(_2254, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2274 = _2240 * 0.693147182464599609375;
    float _2276 = fma(_2254, _2272, -0.212114393711090087890625);
    float _2278 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2280 = sqrt(_2252);
    float _2282 = -_2222;
    float _2284 = fma(_2258, _2262, _2282);
    float _2286 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2266);
    float _2288 = fma(_2254, _2276, 1.570728778839111328125);
    float _2290 = _2268 * _2270;
    float _2292 = _2286 * _2270;
    float _2294 = fma(_2284, 0.5, 0.5);
    float _2296 = fma(_2290, 0.5, 0.5);
    float _2298 = fma(_2292, -0.5, 0.5);
    float _2300 = _2280 * 0.636619746685028076171875;
    float3 _6337 = float3(_2296, _2298, _2278);
    float _2302 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6337, float3(0.0), isnan(_6337)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6337, float3(0.0), isnan(_6337)), level(0.0)).x;
    float _2304 = -_2288;
    float _2306 = fma(_2300, _2304, 1.0);
    float3 _6353 = float3(_2296, _2298, _2278);
    float4 _2309 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6353, float3(0.0), isnan(_6353)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6353, float3(0.0), isnan(_6353)), level(0.0)).xyzw;
    float _2311 = _2309.x;
    float _2313 = _2309.y;
    float _2315 = _2309.z;
    float _2317 = _2309.w;
    float2 _6370 = float2(_2306, _2294);
    float3 _2321 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6370, float2(0.0), isnan(_6370)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6370, float2(0.0), isnan(_6370)), level(0.0)).xyz;
    float _2323 = _2321.x;
    float _2325 = _2321.y;
    float _2327 = _2321.z;
    float _2329 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_67.x = _1896;
    out.m_67.y = _1912;
    out.m_67.z = _1890;
    float _2331 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2333 = _2331 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _2335 = _1834 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _2337 = isnan(_1834);
    bool _2339 = _2335 || _2337;
    bool _2341 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _2343 = _2339 || _2341;
    float _2345 = float(_2343);
    float _2347 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2349 = _2347 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2351 = -(*spvDescriptorSet0.vp_c9)._m0[175].y;
    float _2353 = (*spvDescriptorSet0.vp_c9)._m0[176].y + _2351;
    float _2355 = -(*spvDescriptorSet0.vp_c9)._m0[176].y;
    float _2357 = _2355 + (*spvDescriptorSet0.vp_c9)._m0[177].y;
    float _2359 = 1.0 / _2349;
    bool _2361 = _1834 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _2363 = isnan(_1834);
    bool _2365 = _2361 || _2363;
    bool _2367 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _2369 = _2365 || _2367;
    float _2371 = float(_2369);
    float _2373 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2375 = _2373 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    out.m_69.y = _1850;
    bool _2377 = _1834 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _2379 = isnan(_1834);
    bool _2381 = _2377 || _2379;
    bool _2383 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _2385 = _2381 || _2383;
    float _2387 = float(_2385);
    float _2389 = 1.0 / _2333;
    bool _2391 = _1834 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _2393 = isnan(_1834);
    bool _2395 = _2391 || _2393;
    bool _2397 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _2399 = _2395 || _2397;
    float _2401 = float(_2399);
    out.m_71.x = _1992;
    out.m_71.y = _1990;
    out.m_71.z = _1994;
    bool _2403 = _1834 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _2405 = isnan(_1834);
    bool _2407 = _2403 || _2405;
    bool _2409 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _2411 = _2407 || _2409;
    float _2413 = float(_2411);
    out.m_73.x = _2004;
    out.m_73.y = _2000;
    out.m_73.z = _2008;
    bool _2415 = _1838 != 0.0;
    bool _2417 = isnan(_1838);
    bool _2419 = _2415 || _2417;
    bool _2421 = isnan(0.0);
    bool _2423 = _2419 || _2421;
    float _2425 = _2357 * _2359;
    float _2427 = -_2345;
    float _2429 = _2427 + 1.0;
    float _2431 = 1.0 / _2375;
    float _2433 = -(*spvDescriptorSet0.vp_c9)._m0[177].y;
    float _2435 = (*spvDescriptorSet0.vp_c9)._m0[178].y + _2433;
    float _2437 = -(*spvDescriptorSet0.vp_c9)._m0[178].y;
    float _2439 = _2437 + (*spvDescriptorSet0.vp_c9)._m0[179].y;
    float _2441 = _2401 * _2429;
    float _2443 = -_2401;
    float _2445 = _2443 + 1.0;
    bool _2447 = _1834 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _2449 = isnan(_1834);
    bool _2451 = _2447 || _2449;
    bool _2453 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _2455 = _2451 || _2453;
    float _2457 = float(_2455);
    float _2459 = _2353 * _2389;
    float _2461 = -_2387;
    float _2463 = _2461 + 1.0;
    float _2465 = _2371 * _2445;
    float _2467 = -_2371;
    float _2469 = _2467 + 1.0;
    bool _2471 = _1836 == 0.0;
    bool _2473 = !_2423;
    bool _2475 = _2471 && _2473;
    float _2477 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2479 = _2477 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2481 = _2413 * _2463;
    float _2483 = _2457 * _2469;
    float _2485 = -_2457;
    float _2487 = _2485 + 1.0;
    float _2489 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2491 = _2489 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2493 = _2435 * _2431;
    float _2495 = 1.0 / _2479;
    bool _2497 = _1834 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _2499 = isnan(_1834);
    bool _2501 = _2497 || _2499;
    bool _2503 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _2505 = _2501 || _2503;
    float _2507 = float(_2505);
    float _2509 = -_2413;
    float _2511 = _2509 + 1.0;
    bool _2513 = _1834 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _2515 = isnan(_1834);
    bool _2517 = _2513 || _2515;
    bool _2519 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _2521 = _2517 || _2519;
    float _2523 = float(_2521);
    bool _2525 = _1840 == 0.0;
    bool _2527 = _2525 && _2475;
    float _2529 = _2507 * _2487;
    float _2531 = -_2507;
    float _2533 = _2531 + 1.0;
    float _2535 = 1.0 / _2491;
    float _2537 = -_2523;
    float _2539 = _2537 + 1.0;
    float _2541 = _2523 * _2533;
    float _2543 = _2387 * _2539;
    float _2545 = -(*spvDescriptorSet0.vp_c9)._m0[179].y;
    float _2547 = (*spvDescriptorSet0.vp_c9)._m0[180].y + _2545;
    float _2549 = _2439 * _2495;
    float _2551 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2553 = _1834 + _2551;
    float _2555 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2557 = _2555 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2559 = -(*spvDescriptorSet0.vp_c9)._m0[180].y;
    float _2561 = _2559 + (*spvDescriptorSet0.vp_c9)._m0[181].y;
    float _2563 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2565 = _2563 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _2567 = fma(_2459, _2553, (*spvDescriptorSet0.vp_c9)._m0[175].y);
    float _2569 = _2547 * _2535;
    float _2571 = _2567 * _2481;
    float _2573 = 1.0 / _2565;
    float _2575 = in.m_75.x;
    float _2577 = in.m_75.y;
    float _2579 = in.m_75.z;
    float _2581 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2583 = _1834 + _2581;
    float _2585 = fma(_2511, (*spvDescriptorSet0.vp_c9)._m0[175].y, _2571);
    float _2587 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2589 = _1834 + _2587;
    float _2591 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2593 = fma(_2425, _2583, (*spvDescriptorSet0.vp_c9)._m0[176].y);
    float _2595 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2597 = _1834 + _2595;
    float _2599 = fma(_2493, _2589, (*spvDescriptorSet0.vp_c9)._m0[177].y);
    float _2601 = 1.0 / _2557;
    float _2603 = fma(_2593, _2543, _2585);
    float _2605 = fma(_2549, _2597, (*spvDescriptorSet0.vp_c9)._m0[178].y);
    float _2607 = -(*spvDescriptorSet0.vp_c9)._m0[181].y;
    float _2609 = (*spvDescriptorSet0.vp_c9)._m0[182].y + _2607;
    float _2611 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2613 = _1834 + _2611;
    float _2615 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2617 = _1834 + _2615;
    float _2619 = fma(_2599, _2541, _2603);
    float _2621 = _2609 * _2573;
    float _2623 = fma(_2569, _2613, (*spvDescriptorSet0.vp_c9)._m0[179].y);
    out.m_49.x = _2591;
    float _2625 = fma(_2605, _2529, _2619);
    float _2627 = fma(_2623, _2483, _2625);
    float _2629 = _2577;
    float _2631 = _2575;
    float _2633 = _2579;
    if (!_2527)
    {
        float _2635 = fma(_1838, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2577);
        _2629 = _2635;
    }
    float _2637 = _2629;
    if (!_2527)
    {
        float _2639 = fma(_1836, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2575);
        _2631 = _2639;
    }
    float _2641 = _2631;
    float _2643 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2645 = _1834 + _2643;
    if (!_2527)
    {
        float _2647 = fma(_1840, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2579);
        _2633 = _2647;
    }
    float _2649 = _2633;
    float _2651 = _2637 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2653 = _2637 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2655 = _2637 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2657 = fma(_2621, _2645, (*spvDescriptorSet0.vp_c9)._m0[181].y);
    float _2659 = fma(_2641, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2651);
    float _2661 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2663 = fma(_2641, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2653);
    float _2665 = fma(_2641, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2655);
    float _2667 = fma(_2649, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2659);
    float _2669 = _2561 * _2601;
    float _2671 = exp2(_2329);
    float _2673 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2661);
    float _2675 = fma(_2649, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2663);
    float _2677 = fma(_2669, _2617, (*spvDescriptorSet0.vp_c9)._m0[180].y);
    float _2679 = fma(_2649, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2665);
    float _2681 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2673);
    float _2683 = fma(_2677, _2465, _2627);
    float _2685 = _2248 * 0.5;
    out.m_77.x = _2667;
    out.m_77.y = _2675;
    out.m_77.z = _2679;
    float _2687 = fma(_2657, _2441, _2683);
    float _2689 = fma(_2345, (*spvDescriptorSet0.vp_c9)._m0[182].y, _2687);
    float _2691 = -_2671;
    float _2693 = _2691 + 1.0;
    float _2695 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2681);
    float _2697 = _2268 + _2248;
    float _2699 = fma(_2286, -0.5, _2685);
    float _2701 = _2693 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2703 = _2695 + _2248;
    float _2705 = _2697 * 0.5;
    out.m_79.y = _2689;
    float _2707 = _2703 * 0.5;
    out.gl_Position.x = _2268;
    out.gl_Position.y = _2286;
    out.gl_Position.z = _2695;
    out.gl_Position.w = _2248;
    out.m_81.x = _2705;
    out.m_81.y = _2699;
    out.m_81.z = _2707;
    out.m_81.w = _2248;
    float _2709 = _2701 * _2302;
    float _2711 = -_2701;
    float _2713 = _2711 + 1.0;
    float _2715 = _2317 * _2709;
    float _2717 = _2317 * _2713;
    float _2719 = _2327 * _2709;
    float _2721 = fma(_2323, _2715, _2311);
    float _2723 = fma(_2325, _2715, _2313);
    float _2725 = fma(_2317, _2719, _2315);
    out.m_83.x = _2721;
    out.m_83.y = _2723;
    out.m_83.z = _2725;
    out.m_83.w = _2717;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1832 = false;
    bool _1516 = false;
    bool _1206 = false;
    bool _1110 = false;
    bool _896 = false;
    bool _670 = false;
    bool _390 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_42.w;
    float _99 = in.m_44.w;
    float _101 = trunc(_97);
    int _104 = int(_101);
    float _106 = -_99;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _108;
    bool _112 = _104 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_104);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2793 = as_type<float>(_124);
        out.gl_Position.z = _2793;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _128 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_99);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = in.m_51.z;
    float _140 = float(_104);
    float _142 = in.m_51.y;
    bool _144 = _108 >= _140;
    bool _146 = !_136;
    bool _148 = _144 || _146;
    float _150 = in.m_51.w;
    float _152 = in.m_51.x;
    if (_148)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _116;
    if (_148)
    {
        out.m_49.x = 0.0;
    }
    if (_148)
    {
        float _156 = _154 * 5.0;
        _126 = as_type<int>(_156);
    }
    int _158 = _126;
    out.m_53.z = _138;
    out.m_53.y = _142;
    out.m_53.w = _150;
    float _160 = _150;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2863 = as_type<float>(_158);
        out.gl_Position.z = _2863;
    }
    out.m_53.x = _152;
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _108 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _166 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    int _178 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _180 = _178 != 0;
    float _182 = _164 * _162;
    float _184 = _166;
    if (!_176)
    {
        float _186 = _166 * _166;
        float _188 = _186 * 0.5;
        _160 = _188;
    }
    float _190 = _160;
    float _192 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[20].x, _182);
    float _194 = in.m_44.x;
    float _196 = in.m_44.y;
    float _198 = in.m_44.z;
    float _200 = _190;
    if (!_176)
    {
        float _202 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _202;
    }
    float _204 = _200;
    float _206 = _192 * 6.283185482025146484375;
    float _208 = floor(_192);
    float _210 = _206 * 0.15915493667125701904296875;
    float _212 = _210 * 6.283185482025146484375;
    float _214 = cos(_212);
    float _216 = -_208;
    float _218 = _192 + _216;
    bool _220 = !_176;
    float _222 = _204;
    if (!_220)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = _166 * _226;
        float _236 = 1.0 / _230;
        float _238 = _232 * 0.693147182464599609375;
        float _240 = exp2(_234);
        float _242 = 1.0 / _238;
        float _244 = _240 + (-1.0);
        float _246 = -_244;
        float _248 = fma(_246, _242, _166);
        float _250 = _248 * _236;
        float _252 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _222 = _252;
    }
    float _254 = _222;
    bool _256 = !_176;
    if (!_256)
    {
        float _258 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _260 = log2(_258);
        float _262 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _264 = _262 + 1.0;
        float _266 = 1.0 / _264;
        float _268 = _166 * _260;
        float _270 = exp2(_268);
        float _272 = -_270;
        float _274 = _272 + 1.0;
        float _276 = _274 * _266;
        _184 = _276;
    }
    float _278 = _184;
    float _280 = in.m_55.w;
    float _282 = 1.0 / _140;
    bool _284 = _218 < 0.5;
    float _286 = float(_284);
    float _288 = in.m_42.x;
    float _290 = in.m_42.y;
    float _292 = in.m_42.z;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _296 = _294 != 0;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _300 = _298 != 0;
    float _302 = fma(_214, 0.5, 0.5);
    float _304 = -_218;
    float _306 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _308 = -_286;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _312 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _314 = !_296;
    int _316 = _314 ? 0 : 1;
    float _318 = -_302;
    float _320 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _322 = !_180;
    int _324 = _322 ? 0 : 1;
    float _326 = fma(_278, _194, _312);
    bool _328 = !_300;
    int _330 = _328 ? 0 : 1;
    float _332 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _334 = abs(_316);
    float _336 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _338 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _340 = fma(_278, _196, _332);
    int _342 = abs(_324);
    float _344 = fma(_278, _198, _336);
    int _346 = abs(_330);
    float _348 = float(_334);
    float _350 = float(_342);
    float _352 = abs(_306);
    float _354 = _348 * _352;
    float _356 = fma(_326, _280, _288);
    float _358 = fma(_344, _280, _292);
    float _360 = float(_346);
    float _362 = fma(_350, _320, _354);
    float _364 = fma(_340, _280, _290);
    float _366 = _108 * _282;
    float _368 = abs(_310);
    float _370 = fma(_360, _368, _362);
    bool _372 = !_338;
    float _388;
    if (!_372)
    {
        float _374 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _376 = _152 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _378 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[12].x, _108);
        float _380 = _378 * _374;
        float _382 = floor(_380);
        float _384 = -_382;
        float _386 = _380 + _384;
        _388 = _386;
        _390 = true;
    }
    else
    {
        _388 = _366;
    }
    _390 = false;
    float _392 = _388;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _396 = _392 + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _400 = _392 + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _404 = _392 + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _422 = 1.0 / _408;
    bool _424 = _392 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _426 = isnan(_392);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    bool _436 = _392 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _438 = isnan(_392);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _444 = _440 || _442;
    float _446 = float(_444);
    float _448 = 1.0 / _412;
    bool _450 = _392 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _452 = isnan(_392);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = 1.0 / _416;
    float _464 = _396 * _422;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _468 = _392 + _466;
    bool _470 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _472 = 1.0 / _420;
    float _474 = _400 * _448;
    bool _476 = _392 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _478 = isnan(_392);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = -_486;
    float _490 = _488 + 1.0;
    float _492 = _404 * _462;
    float _494 = _468 * _472;
    bool _496 = _392 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _498 = isnan(_392);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _516 = _506 * _490;
    float _518 = -_506;
    float _520 = _518 + 1.0;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _522;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _526;
    float _530 = fma(_510, _464, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _532 = _446 * _520;
    float _534 = fma(_524, _464, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _536 = fma(_528, _464, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _538 = -_434;
    float _540 = _538 + 1.0;
    float _542 = -_446;
    float _544 = _542 + 1.0;
    float _546 = _460 * _540;
    float _548 = _434 * _544;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _554 = -_460;
    float _556 = _554 + 1.0;
    float _558 = _534 * _546;
    float _560 = _536 * _546;
    float _562 = fma(_514, _474, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _568 = _530 * _546;
    float _570 = in.m_55.x;
    float _572 = in.m_55.y;
    float _574 = in.m_55.z;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _576;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _580;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _584;
    float _588 = fma(_552, _474, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _590 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[143].x, _558);
    float _592 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[143].y, _560);
    float _594 = fma(_566, _474, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _596 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[143].z, _568);
    float _598 = fma(_578, _492, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _600 = fma(_582, _492, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _602 = fma(_586, _492, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _604 = fma(_562, _548, _590);
    float _606 = fma(_588, _548, _592);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _620 = fma(_594, _548, _596);
    float _622 = fma(_610, _494, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _624 = fma(_614, _494, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _626 = fma(_618, _494, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _628 = fma(_598, _532, _604);
    float _630 = fma(_600, _532, _606);
    float _632 = fma(_602, _532, _620);
    float _634 = fma(_622, _516, _628);
    float _636 = fma(_624, _516, _630);
    float _638 = fma(_626, _516, _632);
    float _640 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[147].x, _634);
    float _642 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[147].y, _636);
    float _644 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[147].z, _638);
    float _646 = _640 * _570;
    float _648 = _642 * _572;
    float _650 = _644 * _574;
    bool _652 = !_470;
    float _668;
    if (!_652)
    {
        float _654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _656 = _152 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _658 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[11].x, _108);
        float _660 = _658 * _654;
        float _662 = floor(_660);
        float _664 = -_662;
        float _666 = _660 + _664;
        _668 = _666;
        _670 = true;
    }
    else
    {
        _668 = _366;
    }
    _670 = false;
    float _672 = _668;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _676 = _672 + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _680 = _672 + _678;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _684 = _672 + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _686;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _690;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _698 = 1.0 / _688;
    bool _700 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _702 = 1.0 / _692;
    bool _704 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _706 = isnan(_672);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = -_714;
    float _718 = _716 + 1.0;
    float _720 = 1.0 / _696;
    float _722 = _676 * _698;
    bool _724 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _726 = isnan(_672);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = _680 * _702;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _742;
    float _746 = -_734;
    float _748 = _746 + 1.0;
    float _750 = fma(_740, _736, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _752 = fma(_744, _736, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _754 = _714 * _748;
    float _756 = _684 * _720;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _758;
    bool _762 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _764 = isnan(_672);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _770 = _766 || _768;
    float _772 = float(_770);
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _778 = fma(_760, _736, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _780 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _782 = isnan(_672);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = _772 * _718;
    float _794 = -_772;
    float _796 = _794 + 1.0;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _806 = fma(_776, _756, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _808 = _790 * _796;
    float _810 = fma(_800, _756, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _812 = fma(_804, _756, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _814 = _750 * _808;
    float _816 = _752 * _808;
    float _818 = -_790;
    float _820 = _818 + 1.0;
    float _822 = _778 * _808;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _824;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _828;
    float _832 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[107].x, _814);
    float _834 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[107].y, _816);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _836;
    float _840 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[107].z, _822);
    float _842 = fma(_826, _722, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _844 = fma(_810, _792, _832);
    float _846 = fma(_830, _722, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _848 = fma(_838, _722, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _850 = fma(_806, _792, _834);
    float _852 = fma(_812, _792, _840);
    float _854 = fma(_842, _754, _844);
    float _856 = fma(_846, _754, _850);
    float _858 = fma(_848, _754, _852);
    float _860 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[110].x, _854);
    float _862 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[110].y, _856);
    float _864 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[110].z, _858);
    float _866 = _860 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _868 = _862 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _870 = _864 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _872 = _866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _874 = _868 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _876 = _870 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _872;
    out.m_57.y = _874;
    out.m_57.z = _876;
    bool _878 = !_700;
    float _894;
    if (!_878)
    {
        float _880 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _882 = _152 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _884 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[11].z, _108);
        float _886 = _884 * _880;
        float _888 = floor(_886);
        float _890 = -_888;
        float _892 = _886 + _890;
        _894 = _892;
        _896 = true;
    }
    else
    {
        _894 = _366;
    }
    _896 = false;
    float _898 = _894;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _902 = _898 + _900;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _906 = _898 + _904;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _910 = _898 + _908;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _912;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _916;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _922 = _920 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _924 = 1.0 / _914;
    bool _926 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _928 = 1.0 / _918;
    bool _930 = _898 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _932 = isnan(_898);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _938 = _934 || _936;
    float _940 = float(_938);
    float _942 = -_940;
    float _944 = _942 + 1.0;
    float _946 = 1.0 / _922;
    bool _948 = _898 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _950 = isnan(_898);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _956 = _952 || _954;
    float _958 = float(_956);
    float _960 = _902 * _924;
    bool _962 = _898 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _964 = isnan(_898);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = _906 * _928;
    float _976 = -_958;
    float _978 = _976 + 1.0;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _980;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _984;
    float _988 = _972 * _978;
    bool _990 = _898 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _992 = isnan(_898);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _998 = _994 || _996;
    float _1000 = float(_998);
    float _1002 = fma(_982, _974, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1004 = _910 * _946;
    float _1006 = -_972;
    float _1008 = _1006 + 1.0;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1010;
    float _1014 = fma(_986, _974, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1020 = _940 * _1008;
    float _1022 = _1000 * _944;
    float _1024 = fma(_1012, _974, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1034 = _1002 * _1022;
    float _1036 = _1014 * _1022;
    float _1038 = -_1000;
    float _1040 = _1038 + 1.0;
    float _1042 = _1024 * _1022;
    float _1044 = fma(_1018, _1004, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1046 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1034);
    float _1048 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1036);
    float _1050 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1042);
    float _1052 = fma(_1028, _1004, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1054 = fma(_1032, _1004, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1064;
    float _1068 = fma(_1044, _1020, _1046);
    float _1070 = fma(_1058, _960, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1072 = fma(_1062, _960, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1074 = fma(_1066, _960, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1076 = fma(_1052, _1020, _1048);
    float _1078 = fma(_1054, _1020, _1050);
    float _1080 = fma(_1070, _988, _1068);
    float _1082 = fma(_1072, _988, _1076);
    float _1084 = fma(_1074, _988, _1078);
    float _1086 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1080);
    float _1088 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1082);
    float _1090 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1084);
    bool _1092 = !_926;
    float _1108;
    if (!_1092)
    {
        float _1094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1096 = _152 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1098 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[11].w, _108);
        float _1100 = _1098 * _1094;
        float _1102 = floor(_1100);
        float _1104 = -_1102;
        float _1106 = _1100 + _1104;
        _1108 = _1106;
        _1110 = true;
    }
    else
    {
        _1108 = _366;
    }
    _1110 = false;
    float _1112 = _1108;
    bool _1114 = _1112 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1116 = isnan(_1112);
    bool _1118 = _1114 || _1116;
    bool _1120 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1122 = _1118 || _1120;
    float _1124 = float(_1122);
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1128 = _1126 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1130 = _1112 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1132 = isnan(_1112);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1138 = _1134 || _1136;
    float _1140 = float(_1138);
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1148 = _1112 + _1146;
    float _1150 = -_1124;
    float _1152 = _1150 + 1.0;
    bool _1154 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1156 = 1.0 / _1128;
    float _1158 = _1140 * _1152;
    float _1160 = -_1140;
    float _1162 = _1160 + 1.0;
    float _1164 = _1144 * _1156;
    float _1166 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1168 = fma(_1164, _1148, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1170 = _1088 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1172 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1174 = _1168 * _1158;
    float _1176 = _1086 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1178 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1180 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1174);
    float _1182 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1184 = fma(_1124, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1180);
    float _1186 = _1184 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = _1182;
    out.m_59.y = _1178;
    out.m_59.z = _1172;
    out.m_59.w = _1186;
    bool _1188 = !_1154;
    float _1204;
    if (!_1188)
    {
        float _1190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1192 = _152 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[14].x, _108);
        float _1196 = _1194 * _1190;
        float _1198 = floor(_1196);
        float _1200 = -_1198;
        float _1202 = _1196 + _1200;
        _1204 = _1202;
        _1206 = true;
    }
    else
    {
        _1204 = _366;
    }
    _1206 = false;
    float _1208 = _1204;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1212 = _1208 + _1210;
    bool _1214 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1216 = isnan(_1208);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1222 = _1218 || _1220;
    float _1224 = float(_1222);
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1228 = _1226 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1230 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1232 = isnan(_1208);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1238 = _1234 || _1236;
    float _1240 = float(_1238);
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1242;
    bool _1246 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1248 = isnan(_1208);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = -_1224;
    float _1260 = _1258 + 1.0;
    float _1262 = 1.0 / _1228;
    float _1264 = -_1256;
    float _1266 = _1264 + 1.0;
    bool _1268 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1270 = isnan(_1208);
    bool _1272 = _1268 || _1270;
    bool _1274 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1276 = _1272 || _1274;
    float _1278 = float(_1276);
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1282 = _1280 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1284 = 1.0 / _1282;
    bool _1286 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1288 = _1244 * _1262;
    float _1290 = _1240 * _1260;
    float _1292 = -_1240;
    float _1294 = _1292 + 1.0;
    bool _1296 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1298 = isnan(_1208);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1304 = _1300 || _1302;
    float _1306 = float(_1304);
    float _1308 = fma(_1288, _1212, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1312 = _1310 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1314 = _1256 * _1294;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1318 = _1316 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1320 = _1306 * _1266;
    float _1322 = -_1306;
    float _1324 = _1322 + 1.0;
    bool _1326 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1328 = isnan(_1208);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = -_1278;
    float _1340 = _1338 + 1.0;
    float _1342 = 1.0 / _1318;
    float _1344 = _1278 * _1324;
    bool _1346 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1348 = isnan(_1208);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1354 = _1350 || _1352;
    float _1356 = float(_1354);
    float _1358 = _1336 * _1340;
    float _1360 = -_1336;
    float _1362 = _1360 + 1.0;
    float _1364 = _1356 * _1362;
    float _1366 = 1.0 / _1312;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1370 = _1368 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1374 = _1372 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1376 = _1308 * _1364;
    float _1378 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1380 = _1378 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1382 = -_1356;
    float _1384 = _1382 + 1.0;
    float _1386 = _1374 * _1284;
    float _1388 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1388;
    float _1392 = 1.0 / _1370;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1396 = _1208 + _1394;
    float _1398 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1376);
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1402 = _1400 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1404 = _1390 * _1342;
    float _1406 = fma(_1386, _1396, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1410 = _1208 + _1408;
    float _1412 = 1.0 / _1380;
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1416 = _1414 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1418 = fma(_1404, _1410, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1420 = fma(_1406, _1358, _1398);
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1422;
    float _1426 = _1416 * _1366;
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1430 = _1208 + _1428;
    float _1432 = fma(_1418, _1344, _1420);
    float _1434 = 1.0 / _1402;
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1438 = _1436 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1440 = _1424 * _1392;
    float _1442 = fma(_1426, _1430, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1446 = _1208 + _1444;
    float _1448 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1448;
    float _1452 = _1438 * _1412;
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1456 = _1208 + _1454;
    bool _1458 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1460 = isnan(_1208);
    bool _1462 = _1458 || _1460;
    bool _1464 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1466 = _1462 || _1464;
    float _1468 = float(_1466);
    float _1470 = fma(_1440, _1446, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1472 = fma(_1442, _1320, _1432);
    float _1474 = fma(_1452, _1456, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1478 = _1208 + _1476;
    float _1480 = -_1468;
    float _1482 = _1480 + 1.0;
    float _1484 = _1450 * _1434;
    float _1486 = fma(_1470, _1314, _1472);
    float _1488 = _1224 * _1482;
    float _1490 = fma(_1484, _1478, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1492 = fma(_1474, _1290, _1486);
    float _1494 = fma(_1490, _1488, _1492);
    float _1496 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1494);
    out.m_61.z = _1496;
    bool _1498 = !_1286;
    float _1514;
    if (!_1498)
    {
        float _1500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1502 = _152 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1504 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[14].y, _108);
        float _1506 = _1504 * _1500;
        float _1508 = floor(_1506);
        float _1510 = -_1508;
        float _1512 = _1506 + _1510;
        _1514 = _1512;
        _1516 = true;
    }
    else
    {
        _1514 = _366;
    }
    _1516 = false;
    float _1518 = _1514;
    float _1520 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1522 = _1518 + _1520;
    bool _1524 = _1518 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1526 = isnan(_1518);
    bool _1528 = _1524 || _1526;
    bool _1530 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1532 = _1528 || _1530;
    float _1534 = float(_1532);
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1538 = _1536 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1540 = _1518 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1542 = isnan(_1518);
    bool _1544 = _1540 || _1542;
    bool _1546 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1548 = _1544 || _1546;
    float _1550 = float(_1548);
    float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1552;
    bool _1556 = _1518 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1558 = isnan(_1518);
    bool _1560 = _1556 || _1558;
    bool _1562 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1564 = _1560 || _1562;
    float _1566 = float(_1564);
    float _1568 = -_1534;
    float _1570 = _1568 + 1.0;
    float _1572 = 1.0 / _1538;
    float _1574 = -_1566;
    float _1576 = _1574 + 1.0;
    bool _1578 = _1518 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1580 = isnan(_1518);
    bool _1582 = _1578 || _1580;
    bool _1584 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1586 = _1582 || _1584;
    float _1588 = float(_1586);
    float _1590 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1592 = _1590 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1594 = 1.0 / _1592;
    bool _1596 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1598 = _1554 * _1572;
    float _1600 = _1550 * _1570;
    float _1602 = -_1550;
    float _1604 = _1602 + 1.0;
    bool _1606 = _1518 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1608 = isnan(_1518);
    bool _1610 = _1606 || _1608;
    bool _1612 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1614 = _1610 || _1612;
    float _1616 = float(_1614);
    float _1618 = fma(_1598, _1522, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1622 = _1620 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1624 = _1566 * _1604;
    float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1628 = _1626 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1630 = _1616 * _1576;
    float _1632 = -_1616;
    float _1634 = _1632 + 1.0;
    bool _1636 = _1518 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1638 = isnan(_1518);
    bool _1640 = _1636 || _1638;
    bool _1642 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1644 = _1640 || _1642;
    float _1646 = float(_1644);
    float _1648 = -_1588;
    float _1650 = _1648 + 1.0;
    float _1652 = 1.0 / _1628;
    float _1654 = _1588 * _1634;
    bool _1656 = _1518 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1658 = isnan(_1518);
    bool _1660 = _1656 || _1658;
    bool _1662 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1664 = _1660 || _1662;
    float _1666 = float(_1664);
    float _1668 = _1646 * _1650;
    float _1670 = -_1646;
    float _1672 = _1670 + 1.0;
    float _1674 = _1666 * _1672;
    float _1676 = 1.0 / _1622;
    float _1678 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1680 = _1678 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1684 = _1682 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1686 = _1618 * _1674;
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1690 = _1688 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1692 = -_1666;
    float _1694 = _1692 + 1.0;
    float _1696 = _1684 * _1594;
    float _1698 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1698;
    float _1702 = 1.0 / _1680;
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1706 = _1518 + _1704;
    float _1708 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1686);
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1712 = _1710 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1714 = _1700 * _1652;
    float _1716 = fma(_1696, _1706, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1720 = _1518 + _1718;
    float _1722 = 1.0 / _1690;
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1728 = fma(_1714, _1720, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1730 = fma(_1716, _1668, _1708);
    float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1732;
    float _1736 = _1726 * _1676;
    float _1738 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1740 = _1518 + _1738;
    float _1742 = fma(_1728, _1654, _1730);
    float _1744 = 1.0 / _1712;
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1748 = _1746 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1750 = _1734 * _1702;
    float _1752 = fma(_1736, _1740, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1754 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1756 = _1518 + _1754;
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1760 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1758;
    float _1762 = _1748 * _1722;
    float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1766 = _1518 + _1764;
    bool _1768 = _1518 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1770 = isnan(_1518);
    bool _1772 = _1768 || _1770;
    bool _1774 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1776 = _1772 || _1774;
    float _1778 = float(_1776);
    float _1780 = fma(_1750, _1756, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1782 = fma(_1752, _1630, _1742);
    float _1784 = fma(_1762, _1766, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1788 = _1518 + _1786;
    float _1790 = -_1778;
    float _1792 = _1790 + 1.0;
    float _1794 = _1760 * _1744;
    float _1796 = fma(_1780, _1624, _1782);
    float _1798 = _1534 * _1792;
    float _1800 = fma(_1794, _1788, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1802 = fma(_1784, _1600, _1796);
    float _1804 = fma(_1800, _1798, _1802);
    float _1806 = fma(_1778, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1804);
    out.m_63.x = _1806;
    bool _1808 = !_1596;
    float _1810 = _1798;
    float _1812 = _1702;
    float _1814 = _1778;
    float _1830;
    if (!_1808)
    {
        float _1816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1818 = _152 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1820 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[14].z, _108);
        float _1822 = _1820 * _1816;
        float _1824 = floor(_1822);
        float _1826 = -_1824;
        float _1828 = _1822 + _1826;
        _1830 = _1828;
        _1832 = true;
    }
    else
    {
        _1830 = _366;
    }
    _1832 = false;
    float _1834 = _1830;
    float _1836 = in.m_65.x;
    float _1838 = in.m_65.y;
    float _1840 = in.m_65.z;
    float _1842 = _370 * _648;
    float _1844 = _370 * _646;
    float _1846 = _370 * _650;
    float _1848 = _364 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1850 = _1842 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1852 = _1844 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1854 = _1846 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1856 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1838);
    float _1858 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1836);
    float _1860 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1840);
    float _1862 = _1850 * _1856;
    float _1864 = _1852 * _1858;
    float _1866 = _1854 * _1860;
    float _1868 = _364 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1870 = _1862 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1872 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1848);
    float _1874 = _1862 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1876 = _364 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1878 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1870);
    float _1880 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1868);
    float _1882 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1872);
    float _1884 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1874);
    float _1886 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1878);
    float _1888 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1880);
    float _1890 = _1882 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1892 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1884);
    float _1894 = _1886 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1896 = _1888 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1898 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1876);
    float _1900 = _1892 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1902 = _1890 + _1894;
    float _1904 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1898);
    float _1906 = _1896 + _1900;
    float _1908 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1910 = _1902 + _1908;
    float _1912 = _1904 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1914 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1916 = _1906 + _1914;
    float _1918 = _1910 * _1910;
    float _1920 = fma(_1916, _1916, _1918);
    float _1922 = _1862 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1924 = sqrt(_1920);
    float _1926 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1922);
    float _1928 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1926);
    float _1930 = _1928 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1932 = _1912 + _1930;
    bool _1934 = _1924 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1936 = _1862;
    float _1938 = _1902;
    float _1940 = _1906;
    float _1942 = _1866;
    if (!_1934)
    {
        _1936 = _1902;
    }
    float _1944 = _1936;
    float _1946 = _1944;
    if (!_1934)
    {
        _1938 = _1932;
    }
    float _1948 = _1938;
    bool _1950 = !_1934;
    float _1952 = _1948;
    if (!_1950)
    {
        float _1954 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1956 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1958 = _1924 + _1956;
        float _1960 = _1932 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1962 = _1958 * _1954;
        float _1964 = rsqrt(_1920);
        float _1966 = _1962 * 0.15915493667125701904296875;
        float _1968 = _1966 * 6.283185482025146484375;
        float _1970 = cos(_1968);
        float _1972 = _1966 * 6.283185482025146484375;
        float _1974 = sin(_1972);
        float _1976 = _1970 + (-1.0);
        float _1978 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1980 = fma(_1974, _1960, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1982 = fma(_1932, _1970, _1978);
        float _1984 = _1964 * _1980;
        float _1986 = fma(_1916, _1984, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1988 = fma(_1910, _1984, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1952 = _1982;
        _1940 = _1986;
        _1946 = _1988;
        _1942 = _1966;
    }
    float _1990 = _1952;
    float _1992 = _1940;
    float _1994 = _1946;
    float _1996 = _1942;
    float _1998 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2000 = _1990 + _1998;
    float _2002 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2004 = _1992 + _2002;
    float _2006 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2008 = _1994 + _2006;
    float _2010 = _2000 * _2000;
    float _2012 = fma(_2004, _2004, _2010);
    float _2014 = fma(_2008, _2008, _2012);
    float _2016 = rsqrt(_2014);
    float _2018 = _2016 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2020 = _2004 * _2018;
    float _2022 = _2008 * _2018;
    float _2024 = _2020 * _2020;
    float _2026 = _2022 * _2022;
    float _2028 = _2024 + _2026;
    float _2030 = sqrt(_2028);
    bool _2032 = _2030 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2034 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2036 = _2030 + _2034;
    float _2038 = _1910;
    float _2040 = _2028;
    float _2042 = _2036;
    float _2044 = _2020;
    if (_2032)
    {
        float _2046 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2038 = _2046;
    }
    float _2048 = _2038;
    if (_2032)
    {
        float _2050 = rsqrt(_2028);
        _2040 = _2050;
    }
    float _2052 = _2040;
    float _2054 = _2052;
    if (_2032)
    {
        float _2056 = _2036 * _2048;
        _2042 = _2056;
    }
    float _2058 = _2042;
    if (_2032)
    {
        float _2060 = _2058 * 0.15915493667125701904296875;
        _1810 = _2060;
    }
    float _2062 = _1810;
    float _2064 = _1932;
    if (_2032)
    {
        float _2066 = _2062 * 6.283185482025146484375;
        float _2068 = sin(_2066);
        _2064 = _2068;
    }
    float _2070 = _2064;
    float _2072 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2074 = precise::max(0.0, _2072);
    float _2076 = _1996;
    float _2078 = _2074;
    float _2080 = _2072;
    if (_2032)
    {
        float _2082 = _2062 * 6.283185482025146484375;
        float _2084 = cos(_2082);
        _2076 = _2084;
    }
    float _2086 = _2076;
    float _2088 = -_2018;
    float _2090 = -_2074;
    float _2092 = fma(_2000, _2088, _2090);
    if (_2032)
    {
        float _2094 = _2092 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2078 = _2094;
    }
    float _2096 = _2078;
    float _2098 = sqrt(_2014);
    float _2100 = _2070;
    float _2102 = _2096;
    if (_2032)
    {
        float _2104 = fma(_2070, _2096, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2100 = _2104;
    }
    float _2106 = _2100;
    float _2108 = _2106;
    if (!_2032)
    {
        _2102 = _2022;
    }
    float _2110 = _2102;
    float _2112 = _2110;
    if (_2032)
    {
        float _2114 = _2086 + (-1.0);
        _2080 = _2114;
    }
    float _2116 = _2080;
    float _2118 = _2116;
    if (_2032)
    {
        float _2120 = _2052 * _2106;
        _1812 = _2120;
    }
    float _2122 = _1812;
    if (!_2032)
    {
        _2108 = _2092;
    }
    float _2124 = _2108;
    float _2126 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2128 = _2124;
    if (_2032)
    {
        float _2130 = _2116 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1814 = _2130;
    }
    float _2132 = _1814;
    if (_2032)
    {
        float _2134 = _2020 * _2122;
        _2044 = _2134;
    }
    float _2136 = _2044;
    if (!_2032)
    {
        _2054 = _2024;
    }
    float _2138 = _2054;
    float _2140 = _2138;
    if (_2032)
    {
        float _2142 = _2022 * _2122;
        _2112 = _2142;
    }
    float _2144 = _2112;
    if (_2032)
    {
        float _2146 = fma(_2092, _2086, _2132);
        _2128 = _2146;
    }
    float _2148 = _2128;
    if (_2032)
    {
        float _2150 = _2136 * _2136;
        _2140 = _2150;
    }
    float _2152 = _2140;
    if (!_2032)
    {
        _2118 = _2026;
    }
    float _2154 = _2118;
    float _2156 = _2154;
    if (_2032)
    {
        float _2158 = _2144 * _2144;
        _2156 = _2158;
    }
    float _2160 = _2156;
    float _2162 = fma(_2148, _2148, _2152);
    float _2164 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2166 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2126);
    float _2168 = _2162 + _2160;
    float _2170 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2172 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2174 = fma(_2098, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2172);
    float _2176 = precise::clamp(_2174, 0.0, 1.0);
    float _2178 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2180 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2166);
    float _2182 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2170);
    float _2184 = rsqrt(_2168);
    float _2186 = -_2176;
    float _2188 = _2186 + 1.0;
    float _2190 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2164);
    float _2192 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2182);
    float _2194 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2196 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2190);
    float _2198 = _2192 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2200 = abs(_2188);
    float _2202 = log2(_2200);
    float _2204 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2194);
    float _2206 = _2196 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2208 = _2198 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2210 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2204);
    float _2212 = -_2208;
    float _2214 = fma(_2212, _2178, 1.0);
    float _2216 = _2184 * _2136;
    float _2218 = _2210 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2220 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2222 = _2184 * _2148;
    float _2224 = _2216 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2226 = _2184 * _2144;
    float _2228 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2220);
    float _2230 = _2180 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2232 = -_2224;
    float _2234 = fma(_2222, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2232);
    float _2236 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2238 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2228);
    float _2240 = log2(_2214);
    float _2242 = -_2226;
    float _2244 = fma(_2242, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2234);
    float _2246 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2248 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2238);
    float _2250 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2252 = fma(_2244, -0.5, 0.5);
    float _2254 = fma(_2244, 0.5, 0.5);
    float _2256 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2246);
    float _2258 = exp2(_2236);
    float _2260 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2250);
    float _2262 = _2222 + 1.0;
    float _2264 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2256);
    float _2266 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2260);
    float _2268 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2264);
    float _2270 = 1.0 / _2248;
    float _2272 = fma(_2254, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2274 = _2240 * 0.693147182464599609375;
    float _2276 = fma(_2254, _2272, -0.212114393711090087890625);
    float _2278 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2280 = sqrt(_2252);
    float _2282 = -_2222;
    float _2284 = fma(_2258, _2262, _2282);
    float _2286 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2266);
    float _2288 = fma(_2254, _2276, 1.570728778839111328125);
    float _2290 = _2268 * _2270;
    float _2292 = _2286 * _2270;
    float _2294 = fma(_2284, 0.5, 0.5);
    float _2296 = fma(_2290, 0.5, 0.5);
    float _2298 = fma(_2292, -0.5, 0.5);
    float _2300 = _2280 * 0.636619746685028076171875;
    float3 _6337 = float3(_2296, _2298, _2278);
    float _2302 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6337, float3(0.0), isnan(_6337)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6337, float3(0.0), isnan(_6337)), level(0.0)).x;
    float _2304 = -_2288;
    float _2306 = fma(_2300, _2304, 1.0);
    float3 _6353 = float3(_2296, _2298, _2278);
    float4 _2309 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6353, float3(0.0), isnan(_6353)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6353, float3(0.0), isnan(_6353)), level(0.0)).xyzw;
    float _2311 = _2309.x;
    float _2313 = _2309.y;
    float _2315 = _2309.z;
    float _2317 = _2309.w;
    float2 _6370 = float2(_2306, _2294);
    float3 _2321 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6370, float2(0.0), isnan(_6370)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6370, float2(0.0), isnan(_6370)), level(0.0)).xyz;
    float _2323 = _2321.x;
    float _2325 = _2321.y;
    float _2327 = _2321.z;
    float _2329 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_67.x = _1896;
    out.m_67.y = _1912;
    out.m_67.z = _1890;
    float _2331 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2333 = _2331 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _2335 = _1834 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _2337 = isnan(_1834);
    bool _2339 = _2335 || _2337;
    bool _2341 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _2343 = _2339 || _2341;
    float _2345 = float(_2343);
    float _2347 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2349 = _2347 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2351 = -(*spvDescriptorSet0.vp_c9)._m0[175].y;
    float _2353 = (*spvDescriptorSet0.vp_c9)._m0[176].y + _2351;
    float _2355 = -(*spvDescriptorSet0.vp_c9)._m0[176].y;
    float _2357 = _2355 + (*spvDescriptorSet0.vp_c9)._m0[177].y;
    float _2359 = 1.0 / _2349;
    bool _2361 = _1834 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _2363 = isnan(_1834);
    bool _2365 = _2361 || _2363;
    bool _2367 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _2369 = _2365 || _2367;
    float _2371 = float(_2369);
    float _2373 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2375 = _2373 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    out.m_69.y = _1850;
    bool _2377 = _1834 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _2379 = isnan(_1834);
    bool _2381 = _2377 || _2379;
    bool _2383 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _2385 = _2381 || _2383;
    float _2387 = float(_2385);
    float _2389 = 1.0 / _2333;
    bool _2391 = _1834 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _2393 = isnan(_1834);
    bool _2395 = _2391 || _2393;
    bool _2397 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _2399 = _2395 || _2397;
    float _2401 = float(_2399);
    out.m_71.x = _1992;
    out.m_71.y = _1990;
    out.m_71.z = _1994;
    bool _2403 = _1834 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _2405 = isnan(_1834);
    bool _2407 = _2403 || _2405;
    bool _2409 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _2411 = _2407 || _2409;
    float _2413 = float(_2411);
    out.m_73.x = _2004;
    out.m_73.y = _2000;
    out.m_73.z = _2008;
    bool _2415 = _1838 != 0.0;
    bool _2417 = isnan(_1838);
    bool _2419 = _2415 || _2417;
    bool _2421 = isnan(0.0);
    bool _2423 = _2419 || _2421;
    float _2425 = _2357 * _2359;
    float _2427 = -_2345;
    float _2429 = _2427 + 1.0;
    float _2431 = 1.0 / _2375;
    float _2433 = -(*spvDescriptorSet0.vp_c9)._m0[177].y;
    float _2435 = (*spvDescriptorSet0.vp_c9)._m0[178].y + _2433;
    float _2437 = -(*spvDescriptorSet0.vp_c9)._m0[178].y;
    float _2439 = _2437 + (*spvDescriptorSet0.vp_c9)._m0[179].y;
    float _2441 = _2401 * _2429;
    float _2443 = -_2401;
    float _2445 = _2443 + 1.0;
    bool _2447 = _1834 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _2449 = isnan(_1834);
    bool _2451 = _2447 || _2449;
    bool _2453 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _2455 = _2451 || _2453;
    float _2457 = float(_2455);
    float _2459 = _2353 * _2389;
    float _2461 = -_2387;
    float _2463 = _2461 + 1.0;
    float _2465 = _2371 * _2445;
    float _2467 = -_2371;
    float _2469 = _2467 + 1.0;
    bool _2471 = _1836 == 0.0;
    bool _2473 = !_2423;
    bool _2475 = _2471 && _2473;
    float _2477 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2479 = _2477 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2481 = _2413 * _2463;
    float _2483 = _2457 * _2469;
    float _2485 = -_2457;
    float _2487 = _2485 + 1.0;
    float _2489 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2491 = _2489 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2493 = _2435 * _2431;
    float _2495 = 1.0 / _2479;
    bool _2497 = _1834 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _2499 = isnan(_1834);
    bool _2501 = _2497 || _2499;
    bool _2503 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _2505 = _2501 || _2503;
    float _2507 = float(_2505);
    float _2509 = -_2413;
    float _2511 = _2509 + 1.0;
    bool _2513 = _1834 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _2515 = isnan(_1834);
    bool _2517 = _2513 || _2515;
    bool _2519 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _2521 = _2517 || _2519;
    float _2523 = float(_2521);
    bool _2525 = _1840 == 0.0;
    bool _2527 = _2525 && _2475;
    float _2529 = _2507 * _2487;
    float _2531 = -_2507;
    float _2533 = _2531 + 1.0;
    float _2535 = 1.0 / _2491;
    float _2537 = -_2523;
    float _2539 = _2537 + 1.0;
    float _2541 = _2523 * _2533;
    float _2543 = _2387 * _2539;
    float _2545 = -(*spvDescriptorSet0.vp_c9)._m0[179].y;
    float _2547 = (*spvDescriptorSet0.vp_c9)._m0[180].y + _2545;
    float _2549 = _2439 * _2495;
    float _2551 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2553 = _1834 + _2551;
    float _2555 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2557 = _2555 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2559 = -(*spvDescriptorSet0.vp_c9)._m0[180].y;
    float _2561 = _2559 + (*spvDescriptorSet0.vp_c9)._m0[181].y;
    float _2563 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2565 = _2563 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _2567 = fma(_2459, _2553, (*spvDescriptorSet0.vp_c9)._m0[175].y);
    float _2569 = _2547 * _2535;
    float _2571 = _2567 * _2481;
    float _2573 = 1.0 / _2565;
    float _2575 = in.m_75.x;
    float _2577 = in.m_75.y;
    float _2579 = in.m_75.z;
    float _2581 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2583 = _1834 + _2581;
    float _2585 = fma(_2511, (*spvDescriptorSet0.vp_c9)._m0[175].y, _2571);
    float _2587 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2589 = _1834 + _2587;
    float _2591 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2593 = fma(_2425, _2583, (*spvDescriptorSet0.vp_c9)._m0[176].y);
    float _2595 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2597 = _1834 + _2595;
    float _2599 = fma(_2493, _2589, (*spvDescriptorSet0.vp_c9)._m0[177].y);
    float _2601 = 1.0 / _2557;
    float _2603 = fma(_2593, _2543, _2585);
    float _2605 = fma(_2549, _2597, (*spvDescriptorSet0.vp_c9)._m0[178].y);
    float _2607 = -(*spvDescriptorSet0.vp_c9)._m0[181].y;
    float _2609 = (*spvDescriptorSet0.vp_c9)._m0[182].y + _2607;
    float _2611 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2613 = _1834 + _2611;
    float _2615 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2617 = _1834 + _2615;
    float _2619 = fma(_2599, _2541, _2603);
    float _2621 = _2609 * _2573;
    float _2623 = fma(_2569, _2613, (*spvDescriptorSet0.vp_c9)._m0[179].y);
    out.m_49.x = _2591;
    float _2625 = fma(_2605, _2529, _2619);
    float _2627 = fma(_2623, _2483, _2625);
    float _2629 = _2577;
    float _2631 = _2575;
    float _2633 = _2579;
    if (!_2527)
    {
        float _2635 = fma(_1838, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2577);
        _2629 = _2635;
    }
    float _2637 = _2629;
    if (!_2527)
    {
        float _2639 = fma(_1836, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2575);
        _2631 = _2639;
    }
    float _2641 = _2631;
    float _2643 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2645 = _1834 + _2643;
    if (!_2527)
    {
        float _2647 = fma(_1840, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2579);
        _2633 = _2647;
    }
    float _2649 = _2633;
    float _2651 = _2637 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2653 = _2637 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2655 = _2637 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2657 = fma(_2621, _2645, (*spvDescriptorSet0.vp_c9)._m0[181].y);
    float _2659 = fma(_2641, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2651);
    float _2661 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2663 = fma(_2641, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2653);
    float _2665 = fma(_2641, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2655);
    float _2667 = fma(_2649, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2659);
    float _2669 = _2561 * _2601;
    float _2671 = exp2(_2329);
    float _2673 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2661);
    float _2675 = fma(_2649, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2663);
    float _2677 = fma(_2669, _2617, (*spvDescriptorSet0.vp_c9)._m0[180].y);
    float _2679 = fma(_2649, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2665);
    float _2681 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2673);
    float _2683 = fma(_2677, _2465, _2627);
    float _2685 = _2248 * 0.5;
    out.m_77.x = _2667;
    out.m_77.y = _2675;
    out.m_77.z = _2679;
    float _2687 = fma(_2657, _2441, _2683);
    float _2689 = fma(_2345, (*spvDescriptorSet0.vp_c9)._m0[182].y, _2687);
    float _2691 = -_2671;
    float _2693 = _2691 + 1.0;
    float _2695 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2681);
    float _2697 = _2268 + _2248;
    float _2699 = fma(_2286, -0.5, _2685);
    float _2701 = _2693 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2703 = _2695 + _2248;
    float _2705 = _2697 * 0.5;
    out.m_79.y = _2689;
    float _2707 = _2703 * 0.5;
    out.gl_Position.x = _2268;
    out.gl_Position.y = _2286;
    out.gl_Position.z = _2695;
    out.gl_Position.w = _2248;
    out.m_81.x = _2705;
    out.m_81.y = _2699;
    out.m_81.z = _2707;
    out.m_81.w = _2248;
    float _2709 = _2701 * _2302;
    float _2711 = -_2701;
    float _2713 = _2711 + 1.0;
    float _2715 = _2317 * _2709;
    float _2717 = _2317 * _2713;
    float _2719 = _2327 * _2709;
    float _2721 = fma(_2323, _2715, _2311);
    float _2723 = fma(_2325, _2715, _2313);
    float _2725 = fma(_2317, _2719, _2315);
    out.m_83.x = _2721;
    out.m_83.y = _2723;
    out.m_83.z = _2725;
    out.m_83.w = _2717;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

