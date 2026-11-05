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
    float4 m_57 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_51 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_63 [[user(locn7)]];
    float4 m_67 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_61 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_42.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _92;
    if (!_90)
    {
        out.m_45.x = 0.0;
    }
    int _96 = 0;
    if (!_90)
    {
        float _98 = _94 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1499 = as_type<float>(_100);
        out.gl_Position.z = _1499;
    }
    if (!_90)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _104 = in.m_47.w;
    float _106 = float(_86);
    float _108 = in.m_49.y;
    float _110 = 1.0 / _106;
    float _112 = in.m_49.x;
    float _114 = -_104;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_104);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = _116 * _110;
    bool _130 = _116 >= _106;
    bool _132 = !_126;
    bool _134 = _130 || _132;
    out.m_51.y = _108;
    out.m_51.x = _112;
    out.m_53.x = _128;
    float _136 = _104;
    float _138 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _136;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _142 = _140 * 5.0;
        _102 = as_type<int>(_142);
    }
    int _144 = _102;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1579 = as_type<float>(_144);
        out.gl_Position.z = _1579;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_55.w;
    float _148 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
    float _172 = 0.0;
    float _174 = _148;
    if (!_158)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _180;
    if (!_158)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_158;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _148 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _148);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_158;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _148 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _174 = _244;
    }
    float _246 = _174;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = fma(_246, _160, _250);
    float _258 = fma(_246, _162, _252);
    float _260 = fma(_246, _164, _254);
    float _262 = fma(_256, _146, _166);
    float _264 = fma(_258, _146, _168);
    float _266 = fma(_260, _146, _170);
    bool _268 = !_248;
    float _284;
    if (!_268)
    {
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _112 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        _284 = _128;
    }
    _286 = false;
    float _288 = _284;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = _288 + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _296 = _288 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = _288 + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _318 = 1.0 / _304;
    bool _320 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _322 = isnan(_288);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = 1.0 / _308;
    bool _334 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _336 = 1.0 / _312;
    float _338 = _292 * _318;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _342 = _288 + _340;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _344;
    float _348 = fma(_346, _338, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _350 = 1.0 / _316;
    float _352 = _296 * _332;
    bool _354 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _356 = isnan(_288);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = -_364;
    float _368 = _366 + 1.0;
    float _370 = _300 * _336;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _372;
    float _376 = fma(_374, _338, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _378 = _342 * _350;
    bool _380 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _382 = isnan(_288);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    bool _392 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _394 = isnan(_288);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = _390 * _368;
    float _406 = -_390;
    float _408 = _406 + 1.0;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _410;
    float _414 = -_402;
    float _416 = _414 + 1.0;
    float _418 = _330 * _408;
    float _420 = -_330;
    float _422 = _420 + 1.0;
    float _424 = fma(_412, _338, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _426 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _428 = isnan(_288);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _442 = _402 * _422;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _452 = _436 * _416;
    float _454 = fma(_440, _352, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _456 = fma(_446, _352, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _458 = fma(_450, _352, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _460 = _424 * _452;
    float _462 = _348 * _452;
    float _464 = _376 * _452;
    float _466 = -_436;
    float _468 = _466 + 1.0;
    float _470 = in.m_55.x;
    float _472 = in.m_55.y;
    float _474 = in.m_55.z;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _484;
    float _488 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[143].x, _460);
    float _490 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[143].y, _462);
    float _492 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[143].z, _464);
    float _494 = fma(_478, _370, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _496 = fma(_482, _370, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _498 = fma(_486, _370, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _500 = fma(_454, _442, _488);
    float _502 = fma(_456, _442, _490);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _516 = fma(_458, _442, _492);
    float _518 = fma(_506, _378, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _520 = fma(_510, _378, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _522 = fma(_494, _418, _500);
    float _524 = fma(_496, _418, _502);
    float _526 = fma(_514, _378, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _528 = fma(_498, _418, _516);
    float _530 = fma(_518, _404, _522);
    float _532 = fma(_520, _404, _524);
    float _534 = fma(_526, _404, _528);
    float _536 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[147].x, _530);
    float _538 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[147].y, _532);
    float _540 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[147].z, _534);
    float _542 = _536 * _470;
    float _544 = _538 * _472;
    float _546 = _540 * _474;
    bool _548 = !_334;
    if (!_548)
    {
        float _550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _552 = _112 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _554 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _556 = _554 * _550;
        float _558 = floor(_556);
        float _560 = -_558;
        float _562 = _556 + _560;
        _138 = _562;
    }
    float _564 = _138;
    float _566 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _568 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _570 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _572 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _566);
    float _574 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _568);
    float _576 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _570);
    float _578 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _572);
    float _580 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _574);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _586 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _576);
    float _588 = _578 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _590 = _580 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _592 = 1.0 / _584;
    float _594 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _596 = _588 + _594;
    float _598 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _600 = _590 + _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _606 = _596 * _596;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _612 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _614 = isnan(_564);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _620 = _616 || _618;
    int _622 = _620 ? 1065353216 : 0;
    float _624 = 1.0 / _604;
    float _626 = _586 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _628 = fma(_600, _600, _606);
    float _630 = _596 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _632 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _634 = _626 + _632;
    float _636 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _638 = 1.0 / _610;
    float _640 = fma(_634, _634, _628);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _650 = fma(_600, (*spvDescriptorSet0.vp_c8)._m0[28].x, _630);
    float _652 = _644 * _592;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _654;
    float _658 = rsqrt(_640);
    float _660 = _648 * _624;
    bool _662 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _664 = isnan(_564);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _670 = _666 || _668;
    float _672 = float(_670);
    float _674 = -as_type<float>(_622);
    float _676 = _674 + 1.0;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _680 = _564 + _678;
    float _682 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[28].z, _650);
    float _684 = _672 * _676;
    float _686 = _656 * _638;
    bool _688 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _690 = isnan(_564);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = -_672;
    float _702 = _700 + 1.0;
    float _704 = fma(_652, _680, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _706 = _682 >= 0.0;
    float _708 = _698 * _702;
    float _710 = -_698;
    float _712 = _710 + 1.0;
    float _714 = _596 * _658;
    float _716 = _600 * _658;
    float _718 = -_714;
    float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[18].w, _596);
    float _722 = -_716;
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[18].w, _600);
    float _726 = _720 * _720;
    float _728 = _704 * _708;
    float _730 = _634 * _658;
    bool _732 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _734 = isnan(_564);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = fma(_724, _724, _726);
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _748 = _564 + _746;
    float _750 = -_730;
    float _752 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[18].w, _634);
    float _754 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[115].x, _728);
    float _756 = -_742;
    float _758 = _756 + 1.0;
    float _760 = fma(_660, _748, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _762 = fma(_752, _752, _744);
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _766 = _564 + _764;
    float _768 = as_type<float>(_622) * _758;
    float _770 = fma(_760, _684, _754);
    float _772 = _770;
    int _774 = _622;
    float _776 = _588;
    float _778 = _716;
    if (_706)
    {
        out.m_45.x = 0.0;
    }
    float _780 = fma(_686, _766, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _782 = sqrt(_762);
    float _784 = fma(_780, _768, _770);
    if (_706)
    {
        _772 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _786 = _772;
    float _788 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[118].x, _784);
    if (_706)
    {
        float _790 = _786 * 5.0;
        _774 = as_type<int>(_790);
    }
    int _792 = _774;
    float _794 = _788 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _796 = _792;
    if (_706)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2657 = as_type<float>(_792);
        out.gl_Position.z = _2657;
    }
    float _798 = _658 * _782;
    out.m_57.w = _794;
    float _800 = _636 * _798;
    out.m_59.x = _800;
    if (_706)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _802 = -_714;
    float _804 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[18].w, _588);
    float _806 = -_716;
    float _808 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[18].w, _590);
    float _810 = -_730;
    float _812 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[18].w, _626);
    float _814 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _816 = _804 + _814;
    float _818 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _820 = _808 + _818;
    float _822 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _824 = _812 + _822;
    float _826 = _816 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _828 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[28].x, _826);
    float _830 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[28].z, _828);
    bool _832 = _830 >= 0.0;
    float _834 = _820;
    if (_832)
    {
        _834 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _836 = _834;
    if (_832)
    {
        out.m_45.x = 0.0;
    }
    if (_832)
    {
        float _838 = _836 * 5.0;
        _796 = as_type<int>(_838);
    }
    int _840 = _796;
    if (_832)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2752 = as_type<float>(_840);
        out.gl_Position.z = _2752;
    }
    if (_832)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _842 = -_588;
    float _844 = _842 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _846 = -_590;
    float _848 = _846 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _850 = -_626;
    float _852 = _850 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _854 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _856 = _844 * _844;
    float _858 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _860 = _854 * _798;
    float _862 = fma(_848, _848, _856);
    float _864 = _858 * _798;
    float _866 = fma(_852, _852, _862);
    float _868 = rsqrt(_866);
    float _870 = _848 * _868;
    float _872 = _852 * _868;
    float _874 = _844 * _868;
    float _876 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _878 = _870 * _876;
    float _880 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _882 = _872 * _880;
    float _884 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _886 = _874 * _884;
    float _888 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _890 = -_878;
    float _892 = fma(_872, _888, _890);
    float _894 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _896 = -_882;
    float _898 = fma(_874, _894, _896);
    float _900 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _902 = -_886;
    float _904 = fma(_870, _900, _902);
    float _906 = in.m_61.x;
    float _908 = in.m_61.y;
    float _910 = in.m_61.z;
    float _912 = _892 * _892;
    float _914 = fma(_898, _898, _912);
    float _916 = fma(_904, _904, _914);
    float _918 = rsqrt(_916);
    float _920 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _908);
    float _922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _906);
    float _924 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _910);
    float _926 = _860 * _920;
    float _928 = _800 * _922;
    float _930 = _864 * _924;
    float _932 = _898 * _918;
    float _934 = _892 * _918;
    float _936 = _904 * _918;
    float _938 = _874 * _932;
    float _940 = _872 * _934;
    float _942 = -_938;
    float _944 = fma(_870, _934, _942);
    float _946 = -_940;
    float _948 = fma(_874, _936, _946);
    float _950 = _926 * _944;
    float _952 = _926 * _948;
    float _954 = fma(_928, _936, _950);
    float _956 = fma(_928, _932, _952);
    float _958 = _870 * _936;
    float _960 = fma(_930, _872, _954);
    float _962 = fma(_930, _870, _956);
    float _964 = -_958;
    float _966 = fma(_872, _932, _964);
    float _968 = _626 + _960;
    float _970 = _590 + _962;
    float _972 = _926 * _966;
    float _974 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _976 = _968 + _974;
    float _978 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _980 = _970 + _978;
    float _982 = fma(_928, _934, _972);
    float _984 = _976 * _976;
    float _986 = fma(_930, _874, _982);
    float _988 = fma(_980, _980, _984);
    float _990 = _588 + _986;
    float _992 = sqrt(_988);
    bool _994 = _992 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _996 = _984;
    float _998 = _982;
    float _1000 = _932;
    float _1002 = _870;
    if (!_994)
    {
        _996 = _970;
    }
    float _1004 = _996;
    float _1006 = _1004;
    if (!_994)
    {
        _776 = _968;
    }
    float _1008 = _776;
    float _1010 = _1008;
    if (!_994)
    {
        _998 = _990;
    }
    float _1012 = _998;
    bool _1014 = !_994;
    float _1016 = _1012;
    if (!_1014)
    {
        float _1018 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1020 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1022 = _992 + _1020;
        float _1024 = _990 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1026 = rsqrt(_988);
        float _1028 = _1022 * _1018;
        float _1030 = _1028 * 0.15915493667125701904296875;
        float _1032 = _1030 * 6.283185482025146484375;
        float _1034 = sin(_1032);
        float _1036 = _1030 * 6.283185482025146484375;
        float _1038 = cos(_1036);
        float _1040 = fma(_1034, _1024, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1042 = _1026 * _1040;
        float _1044 = _1038 + (-1.0);
        float _1046 = fma(_980, _1042, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1048 = fma(_976, _1042, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1050 = _1044 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1052 = fma(_990, _1038, _1050);
        _1016 = _1052;
        _1006 = _1046;
        _1010 = _1048;
    }
    float _1054 = _1016;
    float _1056 = _1006;
    float _1058 = _1010;
    float _1060 = -_714;
    float _1062 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1054);
    float _1064 = -_716;
    float _1066 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1056);
    float _1068 = -_730;
    float _1070 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1058);
    float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1074 = _1062 + _1072;
    float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1078 = _1066 + _1076;
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1082 = _1070 + _1080;
    float _1084 = _1074 * _1074;
    float _1086 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1088 = fma(_1078, _1078, _1084);
    float _1090 = fma(_1082, _1082, _1088);
    float _1092 = rsqrt(_1090);
    float _1094 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1096 = _1078 * _1094;
    float _1098 = _1082 * _1094;
    float _1100 = _1096 * _1096;
    float _1102 = _1098 * _1098;
    float _1104 = _1100 + _1102;
    float _1106 = sqrt(_1104);
    bool _1108 = _1106 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1112 = _1106 + _1110;
    float _1114 = _1092;
    float _1116 = _1112;
    float _1118 = _1074;
    float _1120 = _1096;
    if (_1108)
    {
        float _1122 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1114 = _1122;
    }
    float _1124 = _1114;
    if (_1108)
    {
        float _1126 = rsqrt(_1104);
        _778 = _1126;
    }
    float _1128 = _778;
    float _1130 = _1128;
    if (_1108)
    {
        float _1132 = _1112 * _1124;
        _1116 = _1132;
    }
    float _1134 = _1116;
    if (_1108)
    {
        float _1136 = _1134 * 0.15915493667125701904296875;
        _1000 = _1136;
    }
    float _1138 = _1000;
    float _1140 = _1082;
    if (_1108)
    {
        float _1142 = _1138 * 6.283185482025146484375;
        float _1144 = sin(_1142);
        _1140 = _1144;
    }
    float _1146 = _1140;
    float _1148 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1150 = precise::max(0.0, _1148);
    float _1152 = _1124;
    float _1154 = _1150;
    if (_1108)
    {
        float _1156 = _1138 * 6.283185482025146484375;
        float _1158 = cos(_1156);
        _1152 = _1158;
    }
    float _1160 = _1152;
    float _1162 = -_1094;
    float _1164 = -_1150;
    float _1166 = fma(_1074, _1162, _1164);
    if (_1108)
    {
        float _1168 = _1166 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1118 = _1168;
    }
    float _1170 = _1118;
    float _1172 = sqrt(_1090);
    float _1174 = _1170;
    float _1176 = _1146;
    if (_1108)
    {
        float _1178 = fma(_1146, _1170, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1174 = _1178;
    }
    float _1180 = _1174;
    float _1182 = _1180;
    if (!_1108)
    {
        _1176 = _1098;
    }
    float _1184 = _1176;
    float _1186 = _1184;
    if (_1108)
    {
        float _1188 = _1160 + (-1.0);
        _1154 = _1188;
    }
    float _1190 = _1154;
    float _1192 = _1190;
    if (_1108)
    {
        float _1194 = _1128 * _1180;
        _1002 = _1194;
    }
    float _1196 = _1002;
    if (!_1108)
    {
        _1130 = _1166;
    }
    float _1198 = _1130;
    float _1200 = _1198;
    if (_1108)
    {
        float _1202 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1192 = _1202;
    }
    float _1204 = _1192;
    float _1206 = _1204;
    if (_1108)
    {
        float _1208 = _1096 * _1196;
        _1120 = _1208;
    }
    float _1210 = _1120;
    if (!_1108)
    {
        _1182 = _1100;
    }
    float _1212 = _1182;
    float _1214 = _1212;
    if (_1108)
    {
        float _1216 = _1098 * _1196;
        _1186 = _1216;
    }
    float _1218 = _1186;
    if (_1108)
    {
        float _1220 = fma(_1166, _1160, _1204);
        _1200 = _1220;
    }
    float _1222 = _1200;
    if (_1108)
    {
        float _1224 = _1210 * _1210;
        _1214 = _1224;
    }
    float _1226 = _1214;
    if (!_1108)
    {
        _1206 = _1102;
    }
    float _1228 = _1206;
    float _1230 = _1228;
    if (_1108)
    {
        float _1232 = _1218 * _1218;
        _1230 = _1232;
    }
    float _1234 = _1230;
    float _1236 = fma(_1222, _1222, _1226);
    float _1238 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1240 = _1236 + _1234;
    float _1242 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1244 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1246 = fma(_1172, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1244);
    float _1248 = precise::clamp(_1246, 0.0, 1.0);
    float _1250 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1238);
    float _1252 = rsqrt(_1240);
    float _1254 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1242);
    float _1256 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1258 = -_1248;
    float _1260 = _1258 + 1.0;
    float _1262 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1254);
    float _1264 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1266 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1256);
    float _1268 = _1262 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1270 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1264);
    float _1272 = abs(_1260);
    float _1274 = log2(_1272);
    float _1276 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1266);
    float _1278 = _1268 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1280 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1270);
    float _1282 = _1276 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1284 = _1252 * _1210;
    float _1286 = _1280 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1288 = _1252 * _1222;
    float _1290 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1292 = _1284 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1294 = -_1278;
    float _1296 = fma(_1294, _1086, 1.0);
    float _1298 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1250);
    float _1300 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1290);
    float _1302 = _1252 * _1218;
    float _1304 = -_1292;
    float _1306 = fma(_1288, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1304);
    float _1308 = _1274 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1310 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1312 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1300);
    float _1314 = -_1302;
    float _1316 = fma(_1314, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1306);
    float _1318 = exp2(_1308);
    float _1320 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1322 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1312);
    float _1324 = fma(_1316, -0.5, 0.5);
    float _1326 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1328 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1320);
    float _1330 = fma(_1316, 0.5, 0.5);
    float _1332 = log2(_1296);
    float _1334 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1326);
    float _1336 = _1288 + 1.0;
    float _1338 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1328);
    float _1340 = fma(_1330, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1342 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1334);
    float _1344 = 1.0 / _1322;
    float _1346 = -_1288;
    float _1348 = fma(_1318, _1336, _1346);
    float _1350 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1338);
    float _1352 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1342);
    float _1354 = fma(_1330, _1340, -0.212114393711090087890625);
    float _1356 = fma(_1348, 0.5, 0.5);
    float _1358 = sqrt(_1324);
    float _1360 = _1332 * 0.693147182464599609375;
    float _1362 = fma(_1330, _1354, 1.570728778839111328125);
    float _1364 = _1350 * _1344;
    float _1366 = _1352 * _1344;
    float _1368 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1370 = fma(_1364, 0.5, 0.5);
    float _1372 = fma(_1366, -0.5, 0.5);
    float _1374 = _1358 * 0.636619746685028076171875;
    float3 _3629 = float3(_1370, _1372, _1368);
    float _1376 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3629, float3(0.0), isnan(_3629)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3629, float3(0.0), isnan(_3629)), level(0.0)).x;
    float3 _3640 = float3(_1370, _1372, _1368);
    float4 _1379 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3640, float3(0.0), isnan(_3640)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3640, float3(0.0), isnan(_3640)), level(0.0)).xyzw;
    float _1381 = _1379.x;
    float _1383 = _1379.y;
    float _1385 = _1379.z;
    float _1387 = _1379.w;
    float _1389 = -_1362;
    float _1391 = fma(_1374, _1389, 1.0);
    float2 _3662 = float2(_1391, _1356);
    float3 _1395 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3662, float2(0.0), isnan(_3662)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3662, float2(0.0), isnan(_3662)), level(0.0)).xyz;
    float _1397 = _1395.x;
    float _1399 = _1395.y;
    float _1401 = _1395.z;
    float _1403 = _1274 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1405 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_63.x = _1066;
    out.m_63.y = _1062;
    out.m_63.z = _1070;
    float _1407 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1405);
    float _1409 = exp2(_1403);
    float _1411 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1407);
    float _1413 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1411);
    float _1415 = _1413 + _1322;
    out.gl_Position.x = _1350;
    out.gl_Position.y = _1352;
    out.gl_Position.z = _1413;
    out.gl_Position.w = _1322;
    float _1417 = _1415 * 0.5;
    float _1419 = -_1409;
    float _1421 = _1419 + 1.0;
    float _1423 = _1421 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1425 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.z = _1417;
    out.m_65.w = _1322;
    out.m_45.x = _1425;
    float _1427 = _1423 * _1376;
    float _1429 = -_1423;
    float _1431 = _1429 + 1.0;
    float _1433 = _1387 * _1427;
    float _1435 = _1387 * _1431;
    float _1437 = _1401 * _1427;
    float _1439 = fma(_1397, _1433, _1381);
    float _1441 = fma(_1399, _1433, _1383);
    float _1443 = fma(_1387, _1437, _1385);
    out.m_67.x = _1439;
    out.m_67.y = _1441;
    out.m_67.z = _1443;
    out.m_67.w = _1435;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_42.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _92;
    if (!_90)
    {
        out.m_45.x = 0.0;
    }
    int _96 = 0;
    if (!_90)
    {
        float _98 = _94 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1499 = as_type<float>(_100);
        out.gl_Position.z = _1499;
    }
    if (!_90)
    {
        return out;
    }
    float _104 = in.m_47.w;
    float _106 = float(_86);
    float _108 = in.m_49.y;
    float _110 = 1.0 / _106;
    float _112 = in.m_49.x;
    float _114 = -_104;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_104);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = _116 * _110;
    bool _130 = _116 >= _106;
    bool _132 = !_126;
    bool _134 = _130 || _132;
    out.m_51.y = _108;
    out.m_51.x = _112;
    out.m_53.x = _128;
    float _136 = _104;
    float _138 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _136;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _142 = _140 * 5.0;
        _102 = as_type<int>(_142);
    }
    int _144 = _102;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1579 = as_type<float>(_144);
        out.gl_Position.z = _1579;
    }
    if (_134)
    {
        return out;
    }
    float _146 = in.m_55.w;
    float _148 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
    float _172 = 0.0;
    float _174 = _148;
    if (!_158)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _180;
    if (!_158)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_158;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _148 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _148);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_158;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _148 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _174 = _244;
    }
    float _246 = _174;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = fma(_246, _160, _250);
    float _258 = fma(_246, _162, _252);
    float _260 = fma(_246, _164, _254);
    float _262 = fma(_256, _146, _166);
    float _264 = fma(_258, _146, _168);
    float _266 = fma(_260, _146, _170);
    bool _268 = !_248;
    float _284;
    if (!_268)
    {
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _112 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        _284 = _128;
    }
    _286 = false;
    float _288 = _284;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = _288 + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _296 = _288 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = _288 + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _318 = 1.0 / _304;
    bool _320 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _322 = isnan(_288);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = 1.0 / _308;
    bool _334 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _336 = 1.0 / _312;
    float _338 = _292 * _318;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _342 = _288 + _340;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _344;
    float _348 = fma(_346, _338, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _350 = 1.0 / _316;
    float _352 = _296 * _332;
    bool _354 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _356 = isnan(_288);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = -_364;
    float _368 = _366 + 1.0;
    float _370 = _300 * _336;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _372;
    float _376 = fma(_374, _338, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _378 = _342 * _350;
    bool _380 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _382 = isnan(_288);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    bool _392 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _394 = isnan(_288);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = _390 * _368;
    float _406 = -_390;
    float _408 = _406 + 1.0;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _410;
    float _414 = -_402;
    float _416 = _414 + 1.0;
    float _418 = _330 * _408;
    float _420 = -_330;
    float _422 = _420 + 1.0;
    float _424 = fma(_412, _338, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _426 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _428 = isnan(_288);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _442 = _402 * _422;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _452 = _436 * _416;
    float _454 = fma(_440, _352, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _456 = fma(_446, _352, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _458 = fma(_450, _352, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _460 = _424 * _452;
    float _462 = _348 * _452;
    float _464 = _376 * _452;
    float _466 = -_436;
    float _468 = _466 + 1.0;
    float _470 = in.m_55.x;
    float _472 = in.m_55.y;
    float _474 = in.m_55.z;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _484;
    float _488 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[143].x, _460);
    float _490 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[143].y, _462);
    float _492 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[143].z, _464);
    float _494 = fma(_478, _370, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _496 = fma(_482, _370, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _498 = fma(_486, _370, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _500 = fma(_454, _442, _488);
    float _502 = fma(_456, _442, _490);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _516 = fma(_458, _442, _492);
    float _518 = fma(_506, _378, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _520 = fma(_510, _378, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _522 = fma(_494, _418, _500);
    float _524 = fma(_496, _418, _502);
    float _526 = fma(_514, _378, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _528 = fma(_498, _418, _516);
    float _530 = fma(_518, _404, _522);
    float _532 = fma(_520, _404, _524);
    float _534 = fma(_526, _404, _528);
    float _536 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[147].x, _530);
    float _538 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[147].y, _532);
    float _540 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[147].z, _534);
    float _542 = _536 * _470;
    float _544 = _538 * _472;
    float _546 = _540 * _474;
    bool _548 = !_334;
    if (!_548)
    {
        float _550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _552 = _112 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _554 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _556 = _554 * _550;
        float _558 = floor(_556);
        float _560 = -_558;
        float _562 = _556 + _560;
        _138 = _562;
    }
    float _564 = _138;
    float _566 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _568 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _570 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _572 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _566);
    float _574 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _568);
    float _576 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _570);
    float _578 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _572);
    float _580 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _574);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _586 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _576);
    float _588 = _578 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _590 = _580 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _592 = 1.0 / _584;
    float _594 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _596 = _588 + _594;
    float _598 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _600 = _590 + _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _606 = _596 * _596;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _612 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _614 = isnan(_564);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _620 = _616 || _618;
    int _622 = _620 ? 1065353216 : 0;
    float _624 = 1.0 / _604;
    float _626 = _586 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _628 = fma(_600, _600, _606);
    float _630 = _596 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _632 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _634 = _626 + _632;
    float _636 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _638 = 1.0 / _610;
    float _640 = fma(_634, _634, _628);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _650 = fma(_600, (*spvDescriptorSet0.vp_c8)._m0[28].x, _630);
    float _652 = _644 * _592;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _654;
    float _658 = rsqrt(_640);
    float _660 = _648 * _624;
    bool _662 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _664 = isnan(_564);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _670 = _666 || _668;
    float _672 = float(_670);
    float _674 = -as_type<float>(_622);
    float _676 = _674 + 1.0;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _680 = _564 + _678;
    float _682 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[28].z, _650);
    float _684 = _672 * _676;
    float _686 = _656 * _638;
    bool _688 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _690 = isnan(_564);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = -_672;
    float _702 = _700 + 1.0;
    float _704 = fma(_652, _680, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _706 = _682 >= 0.0;
    float _708 = _698 * _702;
    float _710 = -_698;
    float _712 = _710 + 1.0;
    float _714 = _596 * _658;
    float _716 = _600 * _658;
    float _718 = -_714;
    float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[18].w, _596);
    float _722 = -_716;
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[18].w, _600);
    float _726 = _720 * _720;
    float _728 = _704 * _708;
    float _730 = _634 * _658;
    bool _732 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _734 = isnan(_564);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = fma(_724, _724, _726);
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _748 = _564 + _746;
    float _750 = -_730;
    float _752 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[18].w, _634);
    float _754 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[115].x, _728);
    float _756 = -_742;
    float _758 = _756 + 1.0;
    float _760 = fma(_660, _748, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _762 = fma(_752, _752, _744);
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _766 = _564 + _764;
    float _768 = as_type<float>(_622) * _758;
    float _770 = fma(_760, _684, _754);
    float _772 = _770;
    int _774 = _622;
    float _776 = _588;
    float _778 = _716;
    if (_706)
    {
        out.m_45.x = 0.0;
    }
    float _780 = fma(_686, _766, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _782 = sqrt(_762);
    float _784 = fma(_780, _768, _770);
    if (_706)
    {
        _772 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _786 = _772;
    float _788 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[118].x, _784);
    if (_706)
    {
        float _790 = _786 * 5.0;
        _774 = as_type<int>(_790);
    }
    int _792 = _774;
    float _794 = _788 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _796 = _792;
    if (_706)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2657 = as_type<float>(_792);
        out.gl_Position.z = _2657;
    }
    float _798 = _658 * _782;
    out.m_57.w = _794;
    float _800 = _636 * _798;
    out.m_59.x = _800;
    if (_706)
    {
        return out;
    }
    float _802 = -_714;
    float _804 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[18].w, _588);
    float _806 = -_716;
    float _808 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[18].w, _590);
    float _810 = -_730;
    float _812 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[18].w, _626);
    float _814 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _816 = _804 + _814;
    float _818 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _820 = _808 + _818;
    float _822 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _824 = _812 + _822;
    float _826 = _816 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _828 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[28].x, _826);
    float _830 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[28].z, _828);
    bool _832 = _830 >= 0.0;
    float _834 = _820;
    if (_832)
    {
        _834 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _836 = _834;
    if (_832)
    {
        out.m_45.x = 0.0;
    }
    if (_832)
    {
        float _838 = _836 * 5.0;
        _796 = as_type<int>(_838);
    }
    int _840 = _796;
    if (_832)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2752 = as_type<float>(_840);
        out.gl_Position.z = _2752;
    }
    if (_832)
    {
        return out;
    }
    float _842 = -_588;
    float _844 = _842 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _846 = -_590;
    float _848 = _846 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _850 = -_626;
    float _852 = _850 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _854 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _856 = _844 * _844;
    float _858 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _860 = _854 * _798;
    float _862 = fma(_848, _848, _856);
    float _864 = _858 * _798;
    float _866 = fma(_852, _852, _862);
    float _868 = rsqrt(_866);
    float _870 = _848 * _868;
    float _872 = _852 * _868;
    float _874 = _844 * _868;
    float _876 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _878 = _870 * _876;
    float _880 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _882 = _872 * _880;
    float _884 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _886 = _874 * _884;
    float _888 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _890 = -_878;
    float _892 = fma(_872, _888, _890);
    float _894 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _896 = -_882;
    float _898 = fma(_874, _894, _896);
    float _900 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _902 = -_886;
    float _904 = fma(_870, _900, _902);
    float _906 = in.m_61.x;
    float _908 = in.m_61.y;
    float _910 = in.m_61.z;
    float _912 = _892 * _892;
    float _914 = fma(_898, _898, _912);
    float _916 = fma(_904, _904, _914);
    float _918 = rsqrt(_916);
    float _920 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _908);
    float _922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _906);
    float _924 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _910);
    float _926 = _860 * _920;
    float _928 = _800 * _922;
    float _930 = _864 * _924;
    float _932 = _898 * _918;
    float _934 = _892 * _918;
    float _936 = _904 * _918;
    float _938 = _874 * _932;
    float _940 = _872 * _934;
    float _942 = -_938;
    float _944 = fma(_870, _934, _942);
    float _946 = -_940;
    float _948 = fma(_874, _936, _946);
    float _950 = _926 * _944;
    float _952 = _926 * _948;
    float _954 = fma(_928, _936, _950);
    float _956 = fma(_928, _932, _952);
    float _958 = _870 * _936;
    float _960 = fma(_930, _872, _954);
    float _962 = fma(_930, _870, _956);
    float _964 = -_958;
    float _966 = fma(_872, _932, _964);
    float _968 = _626 + _960;
    float _970 = _590 + _962;
    float _972 = _926 * _966;
    float _974 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _976 = _968 + _974;
    float _978 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _980 = _970 + _978;
    float _982 = fma(_928, _934, _972);
    float _984 = _976 * _976;
    float _986 = fma(_930, _874, _982);
    float _988 = fma(_980, _980, _984);
    float _990 = _588 + _986;
    float _992 = sqrt(_988);
    bool _994 = _992 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _996 = _984;
    float _998 = _982;
    float _1000 = _932;
    float _1002 = _870;
    if (!_994)
    {
        _996 = _970;
    }
    float _1004 = _996;
    float _1006 = _1004;
    if (!_994)
    {
        _776 = _968;
    }
    float _1008 = _776;
    float _1010 = _1008;
    if (!_994)
    {
        _998 = _990;
    }
    float _1012 = _998;
    bool _1014 = !_994;
    float _1016 = _1012;
    if (!_1014)
    {
        float _1018 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1020 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1022 = _992 + _1020;
        float _1024 = _990 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1026 = rsqrt(_988);
        float _1028 = _1022 * _1018;
        float _1030 = _1028 * 0.15915493667125701904296875;
        float _1032 = _1030 * 6.283185482025146484375;
        float _1034 = sin(_1032);
        float _1036 = _1030 * 6.283185482025146484375;
        float _1038 = cos(_1036);
        float _1040 = fma(_1034, _1024, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1042 = _1026 * _1040;
        float _1044 = _1038 + (-1.0);
        float _1046 = fma(_980, _1042, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1048 = fma(_976, _1042, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1050 = _1044 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1052 = fma(_990, _1038, _1050);
        _1016 = _1052;
        _1006 = _1046;
        _1010 = _1048;
    }
    float _1054 = _1016;
    float _1056 = _1006;
    float _1058 = _1010;
    float _1060 = -_714;
    float _1062 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1054);
    float _1064 = -_716;
    float _1066 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1056);
    float _1068 = -_730;
    float _1070 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1058);
    float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1074 = _1062 + _1072;
    float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1078 = _1066 + _1076;
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1082 = _1070 + _1080;
    float _1084 = _1074 * _1074;
    float _1086 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1088 = fma(_1078, _1078, _1084);
    float _1090 = fma(_1082, _1082, _1088);
    float _1092 = rsqrt(_1090);
    float _1094 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1096 = _1078 * _1094;
    float _1098 = _1082 * _1094;
    float _1100 = _1096 * _1096;
    float _1102 = _1098 * _1098;
    float _1104 = _1100 + _1102;
    float _1106 = sqrt(_1104);
    bool _1108 = _1106 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1112 = _1106 + _1110;
    float _1114 = _1092;
    float _1116 = _1112;
    float _1118 = _1074;
    float _1120 = _1096;
    if (_1108)
    {
        float _1122 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1114 = _1122;
    }
    float _1124 = _1114;
    if (_1108)
    {
        float _1126 = rsqrt(_1104);
        _778 = _1126;
    }
    float _1128 = _778;
    float _1130 = _1128;
    if (_1108)
    {
        float _1132 = _1112 * _1124;
        _1116 = _1132;
    }
    float _1134 = _1116;
    if (_1108)
    {
        float _1136 = _1134 * 0.15915493667125701904296875;
        _1000 = _1136;
    }
    float _1138 = _1000;
    float _1140 = _1082;
    if (_1108)
    {
        float _1142 = _1138 * 6.283185482025146484375;
        float _1144 = sin(_1142);
        _1140 = _1144;
    }
    float _1146 = _1140;
    float _1148 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1150 = precise::max(0.0, _1148);
    float _1152 = _1124;
    float _1154 = _1150;
    if (_1108)
    {
        float _1156 = _1138 * 6.283185482025146484375;
        float _1158 = cos(_1156);
        _1152 = _1158;
    }
    float _1160 = _1152;
    float _1162 = -_1094;
    float _1164 = -_1150;
    float _1166 = fma(_1074, _1162, _1164);
    if (_1108)
    {
        float _1168 = _1166 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1118 = _1168;
    }
    float _1170 = _1118;
    float _1172 = sqrt(_1090);
    float _1174 = _1170;
    float _1176 = _1146;
    if (_1108)
    {
        float _1178 = fma(_1146, _1170, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1174 = _1178;
    }
    float _1180 = _1174;
    float _1182 = _1180;
    if (!_1108)
    {
        _1176 = _1098;
    }
    float _1184 = _1176;
    float _1186 = _1184;
    if (_1108)
    {
        float _1188 = _1160 + (-1.0);
        _1154 = _1188;
    }
    float _1190 = _1154;
    float _1192 = _1190;
    if (_1108)
    {
        float _1194 = _1128 * _1180;
        _1002 = _1194;
    }
    float _1196 = _1002;
    if (!_1108)
    {
        _1130 = _1166;
    }
    float _1198 = _1130;
    float _1200 = _1198;
    if (_1108)
    {
        float _1202 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1192 = _1202;
    }
    float _1204 = _1192;
    float _1206 = _1204;
    if (_1108)
    {
        float _1208 = _1096 * _1196;
        _1120 = _1208;
    }
    float _1210 = _1120;
    if (!_1108)
    {
        _1182 = _1100;
    }
    float _1212 = _1182;
    float _1214 = _1212;
    if (_1108)
    {
        float _1216 = _1098 * _1196;
        _1186 = _1216;
    }
    float _1218 = _1186;
    if (_1108)
    {
        float _1220 = fma(_1166, _1160, _1204);
        _1200 = _1220;
    }
    float _1222 = _1200;
    if (_1108)
    {
        float _1224 = _1210 * _1210;
        _1214 = _1224;
    }
    float _1226 = _1214;
    if (!_1108)
    {
        _1206 = _1102;
    }
    float _1228 = _1206;
    float _1230 = _1228;
    if (_1108)
    {
        float _1232 = _1218 * _1218;
        _1230 = _1232;
    }
    float _1234 = _1230;
    float _1236 = fma(_1222, _1222, _1226);
    float _1238 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1240 = _1236 + _1234;
    float _1242 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1244 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1246 = fma(_1172, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1244);
    float _1248 = precise::clamp(_1246, 0.0, 1.0);
    float _1250 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1238);
    float _1252 = rsqrt(_1240);
    float _1254 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1242);
    float _1256 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1258 = -_1248;
    float _1260 = _1258 + 1.0;
    float _1262 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1254);
    float _1264 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1266 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1256);
    float _1268 = _1262 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1270 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1264);
    float _1272 = abs(_1260);
    float _1274 = log2(_1272);
    float _1276 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1266);
    float _1278 = _1268 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1280 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1270);
    float _1282 = _1276 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1284 = _1252 * _1210;
    float _1286 = _1280 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1288 = _1252 * _1222;
    float _1290 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1292 = _1284 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1294 = -_1278;
    float _1296 = fma(_1294, _1086, 1.0);
    float _1298 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1250);
    float _1300 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1290);
    float _1302 = _1252 * _1218;
    float _1304 = -_1292;
    float _1306 = fma(_1288, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1304);
    float _1308 = _1274 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1310 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1312 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1300);
    float _1314 = -_1302;
    float _1316 = fma(_1314, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1306);
    float _1318 = exp2(_1308);
    float _1320 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1322 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1312);
    float _1324 = fma(_1316, -0.5, 0.5);
    float _1326 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1328 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1320);
    float _1330 = fma(_1316, 0.5, 0.5);
    float _1332 = log2(_1296);
    float _1334 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1326);
    float _1336 = _1288 + 1.0;
    float _1338 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1328);
    float _1340 = fma(_1330, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1342 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1334);
    float _1344 = 1.0 / _1322;
    float _1346 = -_1288;
    float _1348 = fma(_1318, _1336, _1346);
    float _1350 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1338);
    float _1352 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1342);
    float _1354 = fma(_1330, _1340, -0.212114393711090087890625);
    float _1356 = fma(_1348, 0.5, 0.5);
    float _1358 = sqrt(_1324);
    float _1360 = _1332 * 0.693147182464599609375;
    float _1362 = fma(_1330, _1354, 1.570728778839111328125);
    float _1364 = _1350 * _1344;
    float _1366 = _1352 * _1344;
    float _1368 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1370 = fma(_1364, 0.5, 0.5);
    float _1372 = fma(_1366, -0.5, 0.5);
    float _1374 = _1358 * 0.636619746685028076171875;
    float3 _3629 = float3(_1370, _1372, _1368);
    float _1376 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3629, float3(0.0), isnan(_3629)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3629, float3(0.0), isnan(_3629)), level(0.0)).x;
    float3 _3640 = float3(_1370, _1372, _1368);
    float4 _1379 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3640, float3(0.0), isnan(_3640)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3640, float3(0.0), isnan(_3640)), level(0.0)).xyzw;
    float _1381 = _1379.x;
    float _1383 = _1379.y;
    float _1385 = _1379.z;
    float _1387 = _1379.w;
    float _1389 = -_1362;
    float _1391 = fma(_1374, _1389, 1.0);
    float2 _3662 = float2(_1391, _1356);
    float3 _1395 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3662, float2(0.0), isnan(_3662)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3662, float2(0.0), isnan(_3662)), level(0.0)).xyz;
    float _1397 = _1395.x;
    float _1399 = _1395.y;
    float _1401 = _1395.z;
    float _1403 = _1274 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1405 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_63.x = _1066;
    out.m_63.y = _1062;
    out.m_63.z = _1070;
    float _1407 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1405);
    float _1409 = exp2(_1403);
    float _1411 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1407);
    float _1413 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1411);
    float _1415 = _1413 + _1322;
    out.gl_Position.x = _1350;
    out.gl_Position.y = _1352;
    out.gl_Position.z = _1413;
    out.gl_Position.w = _1322;
    float _1417 = _1415 * 0.5;
    float _1419 = -_1409;
    float _1421 = _1419 + 1.0;
    float _1423 = _1421 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1425 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.z = _1417;
    out.m_65.w = _1322;
    out.m_45.x = _1425;
    float _1427 = _1423 * _1376;
    float _1429 = -_1423;
    float _1431 = _1429 + 1.0;
    float _1433 = _1387 * _1427;
    float _1435 = _1387 * _1431;
    float _1437 = _1401 * _1427;
    float _1439 = fma(_1397, _1433, _1381);
    float _1441 = fma(_1399, _1433, _1383);
    float _1443 = fma(_1387, _1437, _1385);
    out.m_67.x = _1439;
    out.m_67.y = _1441;
    out.m_67.z = _1443;
    out.m_67.w = _1435;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_42.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _92;
    if (!_90)
    {
        out.m_45.x = 0.0;
    }
    int _96 = 0;
    if (!_90)
    {
        float _98 = _94 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1499 = as_type<float>(_100);
        out.gl_Position.z = _1499;
    }
    if (!_90)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _104 = in.m_47.w;
    float _106 = float(_86);
    float _108 = in.m_49.y;
    float _110 = 1.0 / _106;
    float _112 = in.m_49.x;
    float _114 = -_104;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_104);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = _116 * _110;
    bool _130 = _116 >= _106;
    bool _132 = !_126;
    bool _134 = _130 || _132;
    out.m_51.y = _108;
    out.m_51.x = _112;
    out.m_53.x = _128;
    float _136 = _104;
    float _138 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _136;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _142 = _140 * 5.0;
        _102 = as_type<int>(_142);
    }
    int _144 = _102;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1579 = as_type<float>(_144);
        out.gl_Position.z = _1579;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_55.w;
    float _148 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
    float _172 = 0.0;
    float _174 = _148;
    if (!_158)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _180;
    if (!_158)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_158;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _148 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _148);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_158;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _148 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _174 = _244;
    }
    float _246 = _174;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = fma(_246, _160, _250);
    float _258 = fma(_246, _162, _252);
    float _260 = fma(_246, _164, _254);
    float _262 = fma(_256, _146, _166);
    float _264 = fma(_258, _146, _168);
    float _266 = fma(_260, _146, _170);
    bool _268 = !_248;
    float _284;
    if (!_268)
    {
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _112 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        _284 = _128;
    }
    _286 = false;
    float _288 = _284;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = _288 + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _296 = _288 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = _288 + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _318 = 1.0 / _304;
    bool _320 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _322 = isnan(_288);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = 1.0 / _308;
    bool _334 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _336 = 1.0 / _312;
    float _338 = _292 * _318;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _342 = _288 + _340;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _344;
    float _348 = fma(_346, _338, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _350 = 1.0 / _316;
    float _352 = _296 * _332;
    bool _354 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _356 = isnan(_288);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = -_364;
    float _368 = _366 + 1.0;
    float _370 = _300 * _336;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _372;
    float _376 = fma(_374, _338, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _378 = _342 * _350;
    bool _380 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _382 = isnan(_288);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    bool _392 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _394 = isnan(_288);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = _390 * _368;
    float _406 = -_390;
    float _408 = _406 + 1.0;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _410;
    float _414 = -_402;
    float _416 = _414 + 1.0;
    float _418 = _330 * _408;
    float _420 = -_330;
    float _422 = _420 + 1.0;
    float _424 = fma(_412, _338, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _426 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _428 = isnan(_288);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _442 = _402 * _422;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _452 = _436 * _416;
    float _454 = fma(_440, _352, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _456 = fma(_446, _352, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _458 = fma(_450, _352, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _460 = _424 * _452;
    float _462 = _348 * _452;
    float _464 = _376 * _452;
    float _466 = -_436;
    float _468 = _466 + 1.0;
    float _470 = in.m_55.x;
    float _472 = in.m_55.y;
    float _474 = in.m_55.z;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _484;
    float _488 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[143].x, _460);
    float _490 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[143].y, _462);
    float _492 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[143].z, _464);
    float _494 = fma(_478, _370, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _496 = fma(_482, _370, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _498 = fma(_486, _370, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _500 = fma(_454, _442, _488);
    float _502 = fma(_456, _442, _490);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _516 = fma(_458, _442, _492);
    float _518 = fma(_506, _378, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _520 = fma(_510, _378, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _522 = fma(_494, _418, _500);
    float _524 = fma(_496, _418, _502);
    float _526 = fma(_514, _378, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _528 = fma(_498, _418, _516);
    float _530 = fma(_518, _404, _522);
    float _532 = fma(_520, _404, _524);
    float _534 = fma(_526, _404, _528);
    float _536 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[147].x, _530);
    float _538 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[147].y, _532);
    float _540 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[147].z, _534);
    float _542 = _536 * _470;
    float _544 = _538 * _472;
    float _546 = _540 * _474;
    bool _548 = !_334;
    if (!_548)
    {
        float _550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _552 = _112 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _554 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _556 = _554 * _550;
        float _558 = floor(_556);
        float _560 = -_558;
        float _562 = _556 + _560;
        _138 = _562;
    }
    float _564 = _138;
    float _566 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _568 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _570 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _572 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _566);
    float _574 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _568);
    float _576 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _570);
    float _578 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _572);
    float _580 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _574);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _586 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _576);
    float _588 = _578 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _590 = _580 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _592 = 1.0 / _584;
    float _594 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _596 = _588 + _594;
    float _598 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _600 = _590 + _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _606 = _596 * _596;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _612 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _614 = isnan(_564);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _620 = _616 || _618;
    int _622 = _620 ? 1065353216 : 0;
    float _624 = 1.0 / _604;
    float _626 = _586 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _628 = fma(_600, _600, _606);
    float _630 = _596 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _632 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _634 = _626 + _632;
    float _636 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _638 = 1.0 / _610;
    float _640 = fma(_634, _634, _628);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _650 = fma(_600, (*spvDescriptorSet0.vp_c8)._m0[28].x, _630);
    float _652 = _644 * _592;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _654;
    float _658 = rsqrt(_640);
    float _660 = _648 * _624;
    bool _662 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _664 = isnan(_564);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _670 = _666 || _668;
    float _672 = float(_670);
    float _674 = -as_type<float>(_622);
    float _676 = _674 + 1.0;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _680 = _564 + _678;
    float _682 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[28].z, _650);
    float _684 = _672 * _676;
    float _686 = _656 * _638;
    bool _688 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _690 = isnan(_564);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = -_672;
    float _702 = _700 + 1.0;
    float _704 = fma(_652, _680, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _706 = _682 >= 0.0;
    float _708 = _698 * _702;
    float _710 = -_698;
    float _712 = _710 + 1.0;
    float _714 = _596 * _658;
    float _716 = _600 * _658;
    float _718 = -_714;
    float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[18].w, _596);
    float _722 = -_716;
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[18].w, _600);
    float _726 = _720 * _720;
    float _728 = _704 * _708;
    float _730 = _634 * _658;
    bool _732 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _734 = isnan(_564);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = fma(_724, _724, _726);
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _748 = _564 + _746;
    float _750 = -_730;
    float _752 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[18].w, _634);
    float _754 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[115].x, _728);
    float _756 = -_742;
    float _758 = _756 + 1.0;
    float _760 = fma(_660, _748, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _762 = fma(_752, _752, _744);
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _766 = _564 + _764;
    float _768 = as_type<float>(_622) * _758;
    float _770 = fma(_760, _684, _754);
    float _772 = _770;
    int _774 = _622;
    float _776 = _588;
    float _778 = _716;
    if (_706)
    {
        out.m_45.x = 0.0;
    }
    float _780 = fma(_686, _766, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _782 = sqrt(_762);
    float _784 = fma(_780, _768, _770);
    if (_706)
    {
        _772 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _786 = _772;
    float _788 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[118].x, _784);
    if (_706)
    {
        float _790 = _786 * 5.0;
        _774 = as_type<int>(_790);
    }
    int _792 = _774;
    float _794 = _788 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _796 = _792;
    if (_706)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2657 = as_type<float>(_792);
        out.gl_Position.z = _2657;
    }
    float _798 = _658 * _782;
    out.m_57.w = _794;
    float _800 = _636 * _798;
    out.m_59.x = _800;
    if (_706)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _802 = -_714;
    float _804 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[18].w, _588);
    float _806 = -_716;
    float _808 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[18].w, _590);
    float _810 = -_730;
    float _812 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[18].w, _626);
    float _814 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _816 = _804 + _814;
    float _818 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _820 = _808 + _818;
    float _822 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _824 = _812 + _822;
    float _826 = _816 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _828 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[28].x, _826);
    float _830 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[28].z, _828);
    bool _832 = _830 >= 0.0;
    float _834 = _820;
    if (_832)
    {
        _834 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _836 = _834;
    if (_832)
    {
        out.m_45.x = 0.0;
    }
    if (_832)
    {
        float _838 = _836 * 5.0;
        _796 = as_type<int>(_838);
    }
    int _840 = _796;
    if (_832)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2752 = as_type<float>(_840);
        out.gl_Position.z = _2752;
    }
    if (_832)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _842 = -_588;
    float _844 = _842 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _846 = -_590;
    float _848 = _846 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _850 = -_626;
    float _852 = _850 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _854 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _856 = _844 * _844;
    float _858 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _860 = _854 * _798;
    float _862 = fma(_848, _848, _856);
    float _864 = _858 * _798;
    float _866 = fma(_852, _852, _862);
    float _868 = rsqrt(_866);
    float _870 = _848 * _868;
    float _872 = _852 * _868;
    float _874 = _844 * _868;
    float _876 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _878 = _870 * _876;
    float _880 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _882 = _872 * _880;
    float _884 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _886 = _874 * _884;
    float _888 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _890 = -_878;
    float _892 = fma(_872, _888, _890);
    float _894 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _896 = -_882;
    float _898 = fma(_874, _894, _896);
    float _900 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _902 = -_886;
    float _904 = fma(_870, _900, _902);
    float _906 = in.m_61.x;
    float _908 = in.m_61.y;
    float _910 = in.m_61.z;
    float _912 = _892 * _892;
    float _914 = fma(_898, _898, _912);
    float _916 = fma(_904, _904, _914);
    float _918 = rsqrt(_916);
    float _920 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _908);
    float _922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _906);
    float _924 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _910);
    float _926 = _860 * _920;
    float _928 = _800 * _922;
    float _930 = _864 * _924;
    float _932 = _898 * _918;
    float _934 = _892 * _918;
    float _936 = _904 * _918;
    float _938 = _874 * _932;
    float _940 = _872 * _934;
    float _942 = -_938;
    float _944 = fma(_870, _934, _942);
    float _946 = -_940;
    float _948 = fma(_874, _936, _946);
    float _950 = _926 * _944;
    float _952 = _926 * _948;
    float _954 = fma(_928, _936, _950);
    float _956 = fma(_928, _932, _952);
    float _958 = _870 * _936;
    float _960 = fma(_930, _872, _954);
    float _962 = fma(_930, _870, _956);
    float _964 = -_958;
    float _966 = fma(_872, _932, _964);
    float _968 = _626 + _960;
    float _970 = _590 + _962;
    float _972 = _926 * _966;
    float _974 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _976 = _968 + _974;
    float _978 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _980 = _970 + _978;
    float _982 = fma(_928, _934, _972);
    float _984 = _976 * _976;
    float _986 = fma(_930, _874, _982);
    float _988 = fma(_980, _980, _984);
    float _990 = _588 + _986;
    float _992 = sqrt(_988);
    bool _994 = _992 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _996 = _984;
    float _998 = _982;
    float _1000 = _932;
    float _1002 = _870;
    if (!_994)
    {
        _996 = _970;
    }
    float _1004 = _996;
    float _1006 = _1004;
    if (!_994)
    {
        _776 = _968;
    }
    float _1008 = _776;
    float _1010 = _1008;
    if (!_994)
    {
        _998 = _990;
    }
    float _1012 = _998;
    bool _1014 = !_994;
    float _1016 = _1012;
    if (!_1014)
    {
        float _1018 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1020 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1022 = _992 + _1020;
        float _1024 = _990 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1026 = rsqrt(_988);
        float _1028 = _1022 * _1018;
        float _1030 = _1028 * 0.15915493667125701904296875;
        float _1032 = _1030 * 6.283185482025146484375;
        float _1034 = sin(_1032);
        float _1036 = _1030 * 6.283185482025146484375;
        float _1038 = cos(_1036);
        float _1040 = fma(_1034, _1024, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1042 = _1026 * _1040;
        float _1044 = _1038 + (-1.0);
        float _1046 = fma(_980, _1042, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1048 = fma(_976, _1042, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1050 = _1044 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1052 = fma(_990, _1038, _1050);
        _1016 = _1052;
        _1006 = _1046;
        _1010 = _1048;
    }
    float _1054 = _1016;
    float _1056 = _1006;
    float _1058 = _1010;
    float _1060 = -_714;
    float _1062 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1054);
    float _1064 = -_716;
    float _1066 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1056);
    float _1068 = -_730;
    float _1070 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1058);
    float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1074 = _1062 + _1072;
    float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1078 = _1066 + _1076;
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1082 = _1070 + _1080;
    float _1084 = _1074 * _1074;
    float _1086 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1088 = fma(_1078, _1078, _1084);
    float _1090 = fma(_1082, _1082, _1088);
    float _1092 = rsqrt(_1090);
    float _1094 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1096 = _1078 * _1094;
    float _1098 = _1082 * _1094;
    float _1100 = _1096 * _1096;
    float _1102 = _1098 * _1098;
    float _1104 = _1100 + _1102;
    float _1106 = sqrt(_1104);
    bool _1108 = _1106 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1112 = _1106 + _1110;
    float _1114 = _1092;
    float _1116 = _1112;
    float _1118 = _1074;
    float _1120 = _1096;
    if (_1108)
    {
        float _1122 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1114 = _1122;
    }
    float _1124 = _1114;
    if (_1108)
    {
        float _1126 = rsqrt(_1104);
        _778 = _1126;
    }
    float _1128 = _778;
    float _1130 = _1128;
    if (_1108)
    {
        float _1132 = _1112 * _1124;
        _1116 = _1132;
    }
    float _1134 = _1116;
    if (_1108)
    {
        float _1136 = _1134 * 0.15915493667125701904296875;
        _1000 = _1136;
    }
    float _1138 = _1000;
    float _1140 = _1082;
    if (_1108)
    {
        float _1142 = _1138 * 6.283185482025146484375;
        float _1144 = sin(_1142);
        _1140 = _1144;
    }
    float _1146 = _1140;
    float _1148 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1150 = precise::max(0.0, _1148);
    float _1152 = _1124;
    float _1154 = _1150;
    if (_1108)
    {
        float _1156 = _1138 * 6.283185482025146484375;
        float _1158 = cos(_1156);
        _1152 = _1158;
    }
    float _1160 = _1152;
    float _1162 = -_1094;
    float _1164 = -_1150;
    float _1166 = fma(_1074, _1162, _1164);
    if (_1108)
    {
        float _1168 = _1166 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1118 = _1168;
    }
    float _1170 = _1118;
    float _1172 = sqrt(_1090);
    float _1174 = _1170;
    float _1176 = _1146;
    if (_1108)
    {
        float _1178 = fma(_1146, _1170, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1174 = _1178;
    }
    float _1180 = _1174;
    float _1182 = _1180;
    if (!_1108)
    {
        _1176 = _1098;
    }
    float _1184 = _1176;
    float _1186 = _1184;
    if (_1108)
    {
        float _1188 = _1160 + (-1.0);
        _1154 = _1188;
    }
    float _1190 = _1154;
    float _1192 = _1190;
    if (_1108)
    {
        float _1194 = _1128 * _1180;
        _1002 = _1194;
    }
    float _1196 = _1002;
    if (!_1108)
    {
        _1130 = _1166;
    }
    float _1198 = _1130;
    float _1200 = _1198;
    if (_1108)
    {
        float _1202 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1192 = _1202;
    }
    float _1204 = _1192;
    float _1206 = _1204;
    if (_1108)
    {
        float _1208 = _1096 * _1196;
        _1120 = _1208;
    }
    float _1210 = _1120;
    if (!_1108)
    {
        _1182 = _1100;
    }
    float _1212 = _1182;
    float _1214 = _1212;
    if (_1108)
    {
        float _1216 = _1098 * _1196;
        _1186 = _1216;
    }
    float _1218 = _1186;
    if (_1108)
    {
        float _1220 = fma(_1166, _1160, _1204);
        _1200 = _1220;
    }
    float _1222 = _1200;
    if (_1108)
    {
        float _1224 = _1210 * _1210;
        _1214 = _1224;
    }
    float _1226 = _1214;
    if (!_1108)
    {
        _1206 = _1102;
    }
    float _1228 = _1206;
    float _1230 = _1228;
    if (_1108)
    {
        float _1232 = _1218 * _1218;
        _1230 = _1232;
    }
    float _1234 = _1230;
    float _1236 = fma(_1222, _1222, _1226);
    float _1238 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1240 = _1236 + _1234;
    float _1242 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1244 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1246 = fma(_1172, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1244);
    float _1248 = precise::clamp(_1246, 0.0, 1.0);
    float _1250 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1238);
    float _1252 = rsqrt(_1240);
    float _1254 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1242);
    float _1256 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1258 = -_1248;
    float _1260 = _1258 + 1.0;
    float _1262 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1254);
    float _1264 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1266 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1256);
    float _1268 = _1262 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1270 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1264);
    float _1272 = abs(_1260);
    float _1274 = log2(_1272);
    float _1276 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1266);
    float _1278 = _1268 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1280 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1270);
    float _1282 = _1276 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1284 = _1252 * _1210;
    float _1286 = _1280 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1288 = _1252 * _1222;
    float _1290 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1292 = _1284 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1294 = -_1278;
    float _1296 = fma(_1294, _1086, 1.0);
    float _1298 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1250);
    float _1300 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1290);
    float _1302 = _1252 * _1218;
    float _1304 = -_1292;
    float _1306 = fma(_1288, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1304);
    float _1308 = _1274 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1310 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1312 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1300);
    float _1314 = -_1302;
    float _1316 = fma(_1314, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1306);
    float _1318 = exp2(_1308);
    float _1320 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1322 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1312);
    float _1324 = fma(_1316, -0.5, 0.5);
    float _1326 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1328 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1320);
    float _1330 = fma(_1316, 0.5, 0.5);
    float _1332 = log2(_1296);
    float _1334 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1326);
    float _1336 = _1288 + 1.0;
    float _1338 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1328);
    float _1340 = fma(_1330, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1342 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1334);
    float _1344 = 1.0 / _1322;
    float _1346 = -_1288;
    float _1348 = fma(_1318, _1336, _1346);
    float _1350 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1338);
    float _1352 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1342);
    float _1354 = fma(_1330, _1340, -0.212114393711090087890625);
    float _1356 = fma(_1348, 0.5, 0.5);
    float _1358 = sqrt(_1324);
    float _1360 = _1332 * 0.693147182464599609375;
    float _1362 = fma(_1330, _1354, 1.570728778839111328125);
    float _1364 = _1350 * _1344;
    float _1366 = _1352 * _1344;
    float _1368 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1370 = fma(_1364, 0.5, 0.5);
    float _1372 = fma(_1366, -0.5, 0.5);
    float _1374 = _1358 * 0.636619746685028076171875;
    float3 _3629 = float3(_1370, _1372, _1368);
    float _1376 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3629, float3(0.0), isnan(_3629)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3629, float3(0.0), isnan(_3629)), level(0.0)).x;
    float3 _3640 = float3(_1370, _1372, _1368);
    float4 _1379 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3640, float3(0.0), isnan(_3640)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3640, float3(0.0), isnan(_3640)), level(0.0)).xyzw;
    float _1381 = _1379.x;
    float _1383 = _1379.y;
    float _1385 = _1379.z;
    float _1387 = _1379.w;
    float _1389 = -_1362;
    float _1391 = fma(_1374, _1389, 1.0);
    float2 _3662 = float2(_1391, _1356);
    float3 _1395 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3662, float2(0.0), isnan(_3662)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3662, float2(0.0), isnan(_3662)), level(0.0)).xyz;
    float _1397 = _1395.x;
    float _1399 = _1395.y;
    float _1401 = _1395.z;
    float _1403 = _1274 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1405 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_63.x = _1066;
    out.m_63.y = _1062;
    out.m_63.z = _1070;
    float _1407 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1405);
    float _1409 = exp2(_1403);
    float _1411 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1407);
    float _1413 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1411);
    float _1415 = _1413 + _1322;
    out.gl_Position.x = _1350;
    out.gl_Position.y = _1352;
    out.gl_Position.z = _1413;
    out.gl_Position.w = _1322;
    float _1417 = _1415 * 0.5;
    float _1419 = -_1409;
    float _1421 = _1419 + 1.0;
    float _1423 = _1421 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1425 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.z = _1417;
    out.m_65.w = _1322;
    out.m_45.x = _1425;
    float _1427 = _1423 * _1376;
    float _1429 = -_1423;
    float _1431 = _1429 + 1.0;
    float _1433 = _1387 * _1427;
    float _1435 = _1387 * _1431;
    float _1437 = _1401 * _1427;
    float _1439 = fma(_1397, _1433, _1381);
    float _1441 = fma(_1399, _1433, _1383);
    float _1443 = fma(_1387, _1437, _1385);
    out.m_67.x = _1439;
    out.m_67.y = _1441;
    out.m_67.z = _1443;
    out.m_67.w = _1435;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

