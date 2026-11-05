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
    float4 m_63 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_67 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _512 = false;
    bool _408 = false;
    bool _282 = false;
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
    float _96 = _94;
    if (!_90)
    {
        out.m_45.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1374 = as_type<float>(_102);
        out.gl_Position.z = _1374;
    }
    if (!_90)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _106 = in.m_47.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_116)
    {
        float _122 = float(_86);
        _96 = _122;
    }
    float _124 = _96;
    bool _126 = _120 >= _124;
    bool _128 = !_116;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_45.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _104 = as_type<int>(_136);
    }
    int _138 = _104;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1443 = as_type<float>(_138);
        out.gl_Position.z = _1443;
    }
    if (_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _140 = in.m_49.w;
    float _142 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = in.m_47.x;
    float _156 = in.m_47.y;
    float _158 = in.m_47.z;
    float _160 = in.m_42.x;
    float _162 = in.m_42.y;
    float _164 = in.m_42.z;
    float _166 = 0.0;
    float _168 = _142;
    if (!_152)
    {
        float _170 = _142 * _142;
        float _172 = _170 * 0.5;
        _166 = _172;
    }
    float _174 = _166;
    float _176 = _174;
    if (!_152)
    {
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    bool _182 = !_152;
    float _184 = _180;
    if (!_182)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _142 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _142);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _214;
    }
    float _216 = _184;
    bool _218 = !_152;
    if (!_218)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = 1.0 / _226;
        float _230 = _142 * _222;
        float _232 = exp2(_230);
        float _234 = -_232;
        float _236 = _234 + 1.0;
        float _238 = _236 * _228;
        _168 = _238;
    }
    float _240 = _168;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _244 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _246 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = fma(_240, _154, _244);
    float _252 = fma(_240, _156, _246);
    float _254 = fma(_240, _158, _248);
    float _256 = fma(_250, _140, _160);
    float _258 = fma(_252, _140, _162);
    float _260 = fma(_254, _140, _164);
    bool _262 = !_242;
    float _280;
    if (!_262)
    {
        float _264 = in.m_51.x;
        float _266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _268 = _264 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _270 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _272 = _270 * _266;
        float _274 = floor(_272);
        float _276 = -_274;
        float _278 = _272 + _276;
        _280 = _278;
        _282 = true;
    }
    else
    {
        float _284 = float(_86);
        float _286 = 1.0 / _284;
        float _288 = _120 * _286;
        _280 = _288;
    }
    _282 = false;
    float _290 = _280;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _294 = _290 + _292;
    bool _296 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _298 = isnan(_290);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _308;
    float _312 = -_306;
    float _314 = _312 + 1.0;
    bool _316 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _318 = isnan(_290);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = 1.0 / _310;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _334;
    bool _338 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _340 = _294 * _328;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _342;
    float _346 = in.m_49.x;
    float _348 = in.m_49.y;
    float _350 = in.m_49.z;
    float _352 = _326 * _314;
    float _354 = fma(_332, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _356 = fma(_344, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _358 = fma(_336, _340, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _360 = -_326;
    float _362 = _360 + 1.0;
    float _364 = _354 * _352;
    float _366 = _356 * _352;
    float _368 = _358 * _352;
    float _370 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].x, _364);
    float _372 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].y, _366);
    float _374 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].z, _368);
    float _376 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[144].x, _370);
    float _378 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[144].y, _372);
    float _380 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[144].z, _374);
    float _382 = _376 * _346;
    float _384 = _378 * _348;
    float _386 = _380 * _350;
    bool _388 = !_338;
    float _406;
    if (!_388)
    {
        float _390 = in.m_51.x;
        float _392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _394 = _390 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _396 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _398 = _396 * _392;
        float _400 = floor(_398);
        float _402 = -_400;
        float _404 = _398 + _402;
        _406 = _404;
        _408 = true;
    }
    else
    {
        float _410 = float(_86);
        float _412 = 1.0 / _410;
        float _414 = _120 * _412;
        _406 = _414;
    }
    _408 = false;
    float _416 = _406;
    bool _418 = _416 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _420 = isnan(_416);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _434 = _416 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _436 = isnan(_416);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _452 = _416 + _450;
    float _454 = 1.0 / _432;
    float _456 = -_428;
    float _458 = _456 + 1.0;
    bool _460 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _462 = _444 * _458;
    float _464 = -_444;
    float _466 = _464 + 1.0;
    float _468 = _448 * _454;
    float _470 = fma(_468, _452, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _472 = _470 * _462;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _478 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[115].x, _472);
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _482 = _474 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _484 = _476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _486 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[116].x, _478);
    float _488 = _480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _490 = _486 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _482;
    out.m_53.y = _484;
    out.m_53.z = _488;
    out.m_53.w = _490;
    bool _492 = !_460;
    float _510;
    if (!_492)
    {
        float _494 = in.m_51.x;
        float _496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _498 = _494 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[11].w, _120);
        float _502 = _500 * _496;
        float _504 = floor(_502);
        float _506 = -_504;
        float _508 = _502 + _506;
        _510 = _508;
        _512 = true;
    }
    else
    {
        float _514 = float(_86);
        float _516 = 1.0 / _514;
        float _518 = _120 * _516;
        _510 = _518;
    }
    _512 = false;
    float _520 = _510;
    float _522 = in.m_55.x;
    float _524 = in.m_55.y;
    float _526 = in.m_55.z;
    float _528 = _384 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _530 = _382 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _532 = _386 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _534 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _536 = isnan(0.5);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _542 = _538 || _540;
    float _544 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _524);
    float _546 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _522);
    float _548 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _526);
    float _550 = _528 * _544;
    float _552 = _530 * _546;
    float _554 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _556 = _532 * _548;
    float _558 = _550 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _560 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _562 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _554);
    float _564 = _550 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _566 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[26].x, _558);
    float _568 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _560);
    float _570 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _562);
    float _572 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[24].x, _564);
    float _574 = fma(_556, (*spvDescriptorSet0.vp_c8)._m0[26].z, _566);
    float _576 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _578 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _568);
    float _580 = _570 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _582 = fma(_556, (*spvDescriptorSet0.vp_c8)._m0[24].z, _572);
    float _584 = _574 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _586 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _576);
    float _588 = _578 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _590 = _582 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _592 = _580 + _584;
    float _594 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _586);
    float _596 = _588 + _590;
    float _598 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _600 = _592 + _598;
    float _602 = _594 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _604 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _606 = _596 + _604;
    float _608 = _600 * _600;
    float _610 = _602 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _612 = _602 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _614 = fma(_606, _606, _608);
    float _616 = fma(_588, (*spvDescriptorSet0.vp_c8)._m0[11].x, _610);
    float _618 = fma(_588, (*spvDescriptorSet0.vp_c8)._m0[10].x, _612);
    float _620 = sqrt(_614);
    float _622 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[11].z, _616);
    float _624 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[10].z, _618);
    float _626 = _622 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _628 = _550 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _630 = _624 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _632 = 1.0 / _626;
    float _634 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[25].x, _628);
    float _636 = _630 + _626;
    float _638 = fma(_556, (*spvDescriptorSet0.vp_c8)._m0[25].z, _634);
    bool _640 = _620 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _642 = _638 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _644 = _602 + _642;
    float _646 = _642;
    float _648 = _636;
    float _650 = _592;
    float _652 = _602;
    float _654 = _588;
    float _656 = _600;
    if (_542)
    {
        _646 = 1.0;
    }
    float _658 = _646;
    float _660 = _636 * _632;
    float _662 = _660 * 0.5;
    float _664 = _632;
    float _666 = _658;
    if (!_640)
    {
        _664 = _592;
    }
    float _668 = _664;
    float _670 = _668;
    if (!_640)
    {
        _648 = _596;
    }
    float _672 = _648;
    float _674 = _672;
    if (!_640)
    {
        _650 = _644;
    }
    float _676 = _650;
    bool _678 = !_640;
    float _680 = _676;
    if (!_678)
    {
        float _682 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _684 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _686 = _620 + _684;
        float _688 = rsqrt(_614);
        float _690 = _686 * _682;
        float _692 = _644 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _694 = _690 * 0.15915493667125701904296875;
        float _696 = _694 * 6.283185482025146484375;
        float _698 = cos(_696);
        float _700 = _694 * 6.283185482025146484375;
        float _702 = sin(_700);
        float _704 = _698 + (-1.0);
        float _706 = _704 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _708 = fma(_702, _692, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _710 = fma(_644, _698, _706);
        float _712 = _688 * _708;
        float _714 = fma(_606, _712, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _716 = fma(_600, _712, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _680 = _710;
        _674 = _714;
        _670 = _716;
    }
    float _718 = _680;
    float _720 = _674;
    float _722 = _670;
    if (!_542)
    {
        float _724 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _726 = _724 * 0.15915493667125701904296875;
        float _728 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _730 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _732 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[30].w, _730);
        float _734 = _726 * 6.283185482025146484375;
        float _736 = cos(_734);
        float _738 = _728 * 0.15915493667125701904296875;
        float _740 = _726 * 6.283185482025146484375;
        float _742 = sin(_740);
        float _744 = 1.0 / _736;
        float _746 = _738 * 6.283185482025146484375;
        float _748 = cos(_746);
        float _750 = _742 * _744;
        float _752 = _738 * 6.283185482025146484375;
        float _754 = sin(_752);
        float _756 = _748 * _750;
        float _758 = 1.0 / _732;
        float _760 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _762 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _760;
        float _764 = 1.0 / _756;
        float _766 = 1.0 / _762;
        float _768 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _770 = _758 * _768;
        float _772 = _754 * _764;
        float _774 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _776 = fma(_772, _770, _774);
        float _778 = _776 * _766;
        float _780 = precise::clamp(_778, 0.0, 1.0);
        _652 = _726;
        _654 = _738;
        _666 = _780;
    }
    float _782 = _652;
    float _784 = _654;
    float _786 = _666;
    float _788 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _790 = _718 + _788;
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _794 = _720 + _792;
    float _796 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _798 = _722 + _796;
    float _800 = _790 * _790;
    float _802 = fma(_794, _794, _800);
    float _804 = fma(_798, _798, _802);
    float _806 = rsqrt(_804);
    float _808 = _806 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _810 = _794 * _808;
    float _812 = _798 * _808;
    float _814 = _810 * _810;
    float _816 = _812 * _812;
    float _818 = _814 + _816;
    float _820 = sqrt(_818);
    bool _822 = _820 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _824 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _826 = _820 + _824;
    float _828 = _802;
    float _830 = _784;
    float _832 = _826;
    float _834 = _782;
    float _836 = _808;
    if (_822)
    {
        float _838 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _828 = _838;
    }
    float _840 = _828;
    if (_822)
    {
        float _842 = rsqrt(_818);
        _830 = _842;
    }
    float _844 = _830;
    float _846 = _844;
    if (_822)
    {
        float _848 = _826 * _840;
        _832 = _848;
    }
    float _850 = _832;
    if (_822)
    {
        float _852 = _850 * 0.15915493667125701904296875;
        _834 = _852;
    }
    float _854 = _834;
    float _856 = _806;
    if (_822)
    {
        float _858 = _854 * 6.283185482025146484375;
        float _860 = sin(_858);
        _856 = _860;
    }
    float _862 = _856;
    float _864 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _866 = precise::max(0.0, _864);
    float _868 = _798;
    float _870 = _866;
    float _872 = _864;
    if (_822)
    {
        float _874 = _854 * 6.283185482025146484375;
        float _876 = cos(_874);
        _868 = _876;
    }
    float _878 = _868;
    float _880 = -_808;
    float _882 = -_866;
    float _884 = fma(_790, _880, _882);
    if (_822)
    {
        float _886 = _884 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _870 = _886;
    }
    float _888 = _870;
    float _890 = sqrt(_804);
    float _892 = _888;
    float _894 = _862;
    if (_822)
    {
        float _896 = fma(_862, _888, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _836 = _896;
    }
    float _898 = _836;
    float _900 = _898;
    if (!_822)
    {
        _892 = _810;
    }
    float _902 = _892;
    float _904 = _902;
    if (!_822)
    {
        _894 = _812;
    }
    float _906 = _894;
    float _908 = _906;
    if (_822)
    {
        float _910 = _878 + (-1.0);
        _872 = _910;
    }
    float _912 = _872;
    float _914 = 0.0;
    float _916 = _912;
    if (_822)
    {
        float _918 = _844 * _898;
        _914 = _918;
    }
    float _920 = _914;
    if (!_822)
    {
        _846 = _884;
    }
    float _922 = _846;
    float _924 = _718 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _926 = _922;
    if (_822)
    {
        float _928 = _912 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _656 = _928;
    }
    float _930 = _656;
    if (_822)
    {
        float _932 = _810 * _920;
        _904 = _932;
    }
    float _934 = _904;
    if (!_822)
    {
        _900 = _814;
    }
    float _936 = _900;
    float _938 = _936;
    if (_822)
    {
        float _940 = _812 * _920;
        _908 = _940;
    }
    float _942 = _908;
    if (_822)
    {
        float _944 = fma(_884, _878, _930);
        _926 = _944;
    }
    float _946 = _926;
    if (_822)
    {
        float _948 = _934 * _934;
        _938 = _948;
    }
    float _950 = _938;
    if (!_822)
    {
        _916 = _816;
    }
    float _952 = _916;
    float _954 = _952;
    if (_822)
    {
        float _956 = _942 * _942;
        _954 = _956;
    }
    float _958 = _954;
    float _960 = fma(_946, _946, _950);
    float _962 = _718 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _964 = _960 + _958;
    float _966 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _968 = fma(_890, (*spvDescriptorSet0.vp_c15)._m0[23].w, _966);
    float _970 = precise::clamp(_968, 0.0, 1.0);
    float _972 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[2].x, _962);
    float _974 = _718 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _976 = rsqrt(_964);
    float _978 = -_970;
    float _980 = _978 + 1.0;
    float _982 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[2].z, _972);
    float _984 = _718 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _986 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[1].x, _974);
    float _988 = _982 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _990 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[0].x, _984);
    float _992 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[1].z, _986);
    float _994 = abs(_980);
    float _996 = log2(_994);
    float _998 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[3].x, _924);
    float _1000 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[0].z, _990);
    float _1002 = _992 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1004 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1006 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[3].z, _998);
    float _1008 = _1000 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1010 = _976 * _934;
    float _1012 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1014 = _976 * _946;
    float _1016 = _976 * _942;
    float _1018 = _1010 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1020 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1012);
    float _1022 = _988 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1024 = _1006 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1026 = -_1018;
    float _1028 = fma(_1014, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1026);
    float _1030 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1020);
    float _1032 = -_1022;
    float _1034 = fma(_1032, _1004, 1.0);
    float _1036 = _996 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1038 = -_1016;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1028);
    float _1042 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1030);
    float _1044 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1046 = exp2(_1036);
    float _1048 = fma(_1040, -0.5, 0.5);
    float _1050 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1052 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1044);
    float _1054 = fma(_1040, 0.5, 0.5);
    float _1056 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1050);
    float _1058 = log2(_1034);
    float _1060 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1052);
    float _1062 = fma(_1054, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1064 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1056);
    float _1066 = _1014 + 1.0;
    float _1068 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1060);
    float _1070 = fma(_1054, _1062, -0.212114393711090087890625);
    float _1072 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1064);
    float _1074 = 1.0 / _1042;
    float _1076 = -_1014;
    float _1078 = fma(_1046, _1066, _1076);
    float _1080 = fma(_1054, _1070, 1.570728778839111328125);
    float _1082 = sqrt(_1048);
    float _1084 = _1058 * 0.693147182464599609375;
    float _1086 = _1084 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1088 = fma(_1078, 0.5, 0.5);
    float _1090 = _1068 * _1074;
    float _1092 = _1072 * _1074;
    float _1094 = fma(_1090, 0.5, 0.5);
    float _1096 = fma(_1092, -0.5, 0.5);
    float _1098 = _1082 * 0.636619746685028076171875;
    float _1100 = -_1080;
    float _1102 = fma(_1098, _1100, 1.0);
    float3 _3012 = float3(_1094, _1096, _1086);
    float _1104 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3012, float3(0.0), isnan(_3012)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3012, float3(0.0), isnan(_3012)), level(0.0)).x;
    float3 _3023 = float3(_1094, _1096, _1086);
    float4 _1107 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3023, float3(0.0), isnan(_3023)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3023, float3(0.0), isnan(_3023)), level(0.0)).xyzw;
    float _1109 = _1107.x;
    float _1111 = _1107.y;
    float _1113 = _1107.z;
    float _1115 = _1107.w;
    float2 _3040 = float2(_1102, _1088);
    float3 _1119 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3040, float2(0.0), isnan(_3040)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3040, float2(0.0), isnan(_3040)), level(0.0)).xyz;
    float _1121 = _1119.x;
    float _1123 = _1119.y;
    float _1125 = _1119.z;
    float _1127 = in.m_51.y;
    float _1129 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1137 = _1135 != 0;
    int _1139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1141 = _1139 != 0;
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1143;
    float _1147 = 1.0 / _1133;
    bool _1149 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1151 = isnan(_520);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1157 = _1153 || _1155;
    float _1159 = float(_1157);
    float _1161 = in.m_57.y;
    bool _1163 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1165 = isnan(_520);
    bool _1167 = _1163 || _1165;
    bool _1169 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1171 = _1167 || _1169;
    float _1173 = float(_1171);
    float _1175 = 0.0;
    if (_1137)
    {
        float _1177 = in.m_51.x;
        _1175 = _1177;
    }
    float _1179 = _1175;
    float _1181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1183 = in.m_57.x;
    bool _1185 = _1127 > 0.5;
    float _1187 = _1145 * _1147;
    float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1191 = _520 + _1189;
    float _1193 = -_1159;
    float _1195 = _1193 + 1.0;
    float _1197 = fma(_1187, _1191, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1199 = _1173 * _1195;
    float _1201 = -_1173;
    float _1203 = _1201 + 1.0;
    float _1205 = _1197 * _1199;
    float _1207 = -_1161;
    float _1209 = _1207 + 1.0;
    float _1211 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1205);
    float _1213 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1215 = _1179 > 0.5;
    bool _1217 = _1215 && _1137;
    float _1219 = _1161;
    float _1221 = _1179;
    if (_1141)
    {
        float _1223 = _1185 ? _1209 : _1161;
        _1219 = _1223;
    }
    float _1225 = _1219;
    float _1227 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1213);
    float _1229 = _996 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1231 = _1183;
    if (_1137)
    {
        _1221 = _1183;
    }
    float _1233 = _1221;
    float _1235 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1211);
    float _1237 = _1225 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1239 = exp2(_1229);
    bool _1241 = _786 > 0.0;
    bool _1243 = isnan(_786);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan(0.0);
    bool _1249 = _1245 || _1247;
    float _1251 = _1237 * _1181;
    float _1253 = _1233;
    if (_1217)
    {
        float _1255 = -_1233;
        float _1257 = _1255 + 1.0;
        _1253 = _1257;
    }
    float _1259 = _1253;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1263 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1137)
    {
        _1231 = _1259;
    }
    float _1265 = _1231;
    float _1267 = _1261 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1269 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1271 = -_1239;
    float _1273 = _1271 + 1.0;
    float _1275 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1227);
    float _1277 = _1269 * _1129;
    float _1279 = _1273 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1281 = _786 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1283 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1275);
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1287 = _1281 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1291 = _1283 + _1042;
    float _1293 = -_1279;
    float _1295 = _1293 + 1.0;
    float _1297 = _1285 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1299 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1301 = _1291 * 0.5;
    out.m_61.x = _1277;
    out.m_61.y = _1251;
    out.m_63.x = _1299;
    out.m_63.y = _1297;
    out.m_63.z = _1267;
    out.m_63.w = _1263;
    out.gl_Position.x = _1068;
    out.gl_Position.y = _1072;
    out.gl_Position.z = _1283;
    out.gl_Position.w = _1042;
    out.m_65.z = _1301;
    out.m_65.w = _1042;
    out.m_45.x = _1287;
    float _1303 = _1279 * _1104;
    float _1305 = _1115 * _1295;
    float _1307 = _1115 * _1303;
    float _1309 = _1125 * _1303;
    float _1311 = fma(_1121, _1307, _1109);
    float _1313 = fma(_1123, _1307, _1111);
    float _1315 = fma(_1115, _1309, _1113);
    out.m_67.x = _1311;
    out.m_67.y = _1313;
    out.m_67.z = _1315;
    out.m_67.w = _1305;
    if (_1249)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1317 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1317;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _512 = false;
    bool _408 = false;
    bool _282 = false;
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
    float _96 = _94;
    if (!_90)
    {
        out.m_45.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1374 = as_type<float>(_102);
        out.gl_Position.z = _1374;
    }
    if (!_90)
    {
        return out;
    }
    float _106 = in.m_47.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_116)
    {
        float _122 = float(_86);
        _96 = _122;
    }
    float _124 = _96;
    bool _126 = _120 >= _124;
    bool _128 = !_116;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_45.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _104 = as_type<int>(_136);
    }
    int _138 = _104;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1443 = as_type<float>(_138);
        out.gl_Position.z = _1443;
    }
    if (_130)
    {
        return out;
    }
    float _140 = in.m_49.w;
    float _142 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = in.m_47.x;
    float _156 = in.m_47.y;
    float _158 = in.m_47.z;
    float _160 = in.m_42.x;
    float _162 = in.m_42.y;
    float _164 = in.m_42.z;
    float _166 = 0.0;
    float _168 = _142;
    if (!_152)
    {
        float _170 = _142 * _142;
        float _172 = _170 * 0.5;
        _166 = _172;
    }
    float _174 = _166;
    float _176 = _174;
    if (!_152)
    {
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    bool _182 = !_152;
    float _184 = _180;
    if (!_182)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _142 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _142);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _214;
    }
    float _216 = _184;
    bool _218 = !_152;
    if (!_218)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = 1.0 / _226;
        float _230 = _142 * _222;
        float _232 = exp2(_230);
        float _234 = -_232;
        float _236 = _234 + 1.0;
        float _238 = _236 * _228;
        _168 = _238;
    }
    float _240 = _168;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _244 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _246 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = fma(_240, _154, _244);
    float _252 = fma(_240, _156, _246);
    float _254 = fma(_240, _158, _248);
    float _256 = fma(_250, _140, _160);
    float _258 = fma(_252, _140, _162);
    float _260 = fma(_254, _140, _164);
    bool _262 = !_242;
    float _280;
    if (!_262)
    {
        float _264 = in.m_51.x;
        float _266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _268 = _264 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _270 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _272 = _270 * _266;
        float _274 = floor(_272);
        float _276 = -_274;
        float _278 = _272 + _276;
        _280 = _278;
        _282 = true;
    }
    else
    {
        float _284 = float(_86);
        float _286 = 1.0 / _284;
        float _288 = _120 * _286;
        _280 = _288;
    }
    _282 = false;
    float _290 = _280;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _294 = _290 + _292;
    bool _296 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _298 = isnan(_290);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _308;
    float _312 = -_306;
    float _314 = _312 + 1.0;
    bool _316 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _318 = isnan(_290);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = 1.0 / _310;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _334;
    bool _338 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _340 = _294 * _328;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _342;
    float _346 = in.m_49.x;
    float _348 = in.m_49.y;
    float _350 = in.m_49.z;
    float _352 = _326 * _314;
    float _354 = fma(_332, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _356 = fma(_344, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _358 = fma(_336, _340, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _360 = -_326;
    float _362 = _360 + 1.0;
    float _364 = _354 * _352;
    float _366 = _356 * _352;
    float _368 = _358 * _352;
    float _370 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].x, _364);
    float _372 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].y, _366);
    float _374 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].z, _368);
    float _376 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[144].x, _370);
    float _378 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[144].y, _372);
    float _380 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[144].z, _374);
    float _382 = _376 * _346;
    float _384 = _378 * _348;
    float _386 = _380 * _350;
    bool _388 = !_338;
    float _406;
    if (!_388)
    {
        float _390 = in.m_51.x;
        float _392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _394 = _390 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _396 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _398 = _396 * _392;
        float _400 = floor(_398);
        float _402 = -_400;
        float _404 = _398 + _402;
        _406 = _404;
        _408 = true;
    }
    else
    {
        float _410 = float(_86);
        float _412 = 1.0 / _410;
        float _414 = _120 * _412;
        _406 = _414;
    }
    _408 = false;
    float _416 = _406;
    bool _418 = _416 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _420 = isnan(_416);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _434 = _416 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _436 = isnan(_416);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _452 = _416 + _450;
    float _454 = 1.0 / _432;
    float _456 = -_428;
    float _458 = _456 + 1.0;
    bool _460 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _462 = _444 * _458;
    float _464 = -_444;
    float _466 = _464 + 1.0;
    float _468 = _448 * _454;
    float _470 = fma(_468, _452, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _472 = _470 * _462;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _478 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[115].x, _472);
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _482 = _474 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _484 = _476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _486 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[116].x, _478);
    float _488 = _480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _490 = _486 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _482;
    out.m_53.y = _484;
    out.m_53.z = _488;
    out.m_53.w = _490;
    bool _492 = !_460;
    float _510;
    if (!_492)
    {
        float _494 = in.m_51.x;
        float _496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _498 = _494 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[11].w, _120);
        float _502 = _500 * _496;
        float _504 = floor(_502);
        float _506 = -_504;
        float _508 = _502 + _506;
        _510 = _508;
        _512 = true;
    }
    else
    {
        float _514 = float(_86);
        float _516 = 1.0 / _514;
        float _518 = _120 * _516;
        _510 = _518;
    }
    _512 = false;
    float _520 = _510;
    float _522 = in.m_55.x;
    float _524 = in.m_55.y;
    float _526 = in.m_55.z;
    float _528 = _384 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _530 = _382 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _532 = _386 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _534 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _536 = isnan(0.5);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _542 = _538 || _540;
    float _544 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _524);
    float _546 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _522);
    float _548 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _526);
    float _550 = _528 * _544;
    float _552 = _530 * _546;
    float _554 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _556 = _532 * _548;
    float _558 = _550 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _560 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _562 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _554);
    float _564 = _550 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _566 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[26].x, _558);
    float _568 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _560);
    float _570 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _562);
    float _572 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[24].x, _564);
    float _574 = fma(_556, (*spvDescriptorSet0.vp_c8)._m0[26].z, _566);
    float _576 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _578 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _568);
    float _580 = _570 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _582 = fma(_556, (*spvDescriptorSet0.vp_c8)._m0[24].z, _572);
    float _584 = _574 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _586 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _576);
    float _588 = _578 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _590 = _582 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _592 = _580 + _584;
    float _594 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _586);
    float _596 = _588 + _590;
    float _598 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _600 = _592 + _598;
    float _602 = _594 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _604 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _606 = _596 + _604;
    float _608 = _600 * _600;
    float _610 = _602 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _612 = _602 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _614 = fma(_606, _606, _608);
    float _616 = fma(_588, (*spvDescriptorSet0.vp_c8)._m0[11].x, _610);
    float _618 = fma(_588, (*spvDescriptorSet0.vp_c8)._m0[10].x, _612);
    float _620 = sqrt(_614);
    float _622 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[11].z, _616);
    float _624 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[10].z, _618);
    float _626 = _622 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _628 = _550 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _630 = _624 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _632 = 1.0 / _626;
    float _634 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[25].x, _628);
    float _636 = _630 + _626;
    float _638 = fma(_556, (*spvDescriptorSet0.vp_c8)._m0[25].z, _634);
    bool _640 = _620 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _642 = _638 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _644 = _602 + _642;
    float _646 = _642;
    float _648 = _636;
    float _650 = _592;
    float _652 = _602;
    float _654 = _588;
    float _656 = _600;
    if (_542)
    {
        _646 = 1.0;
    }
    float _658 = _646;
    float _660 = _636 * _632;
    float _662 = _660 * 0.5;
    float _664 = _632;
    float _666 = _658;
    if (!_640)
    {
        _664 = _592;
    }
    float _668 = _664;
    float _670 = _668;
    if (!_640)
    {
        _648 = _596;
    }
    float _672 = _648;
    float _674 = _672;
    if (!_640)
    {
        _650 = _644;
    }
    float _676 = _650;
    bool _678 = !_640;
    float _680 = _676;
    if (!_678)
    {
        float _682 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _684 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _686 = _620 + _684;
        float _688 = rsqrt(_614);
        float _690 = _686 * _682;
        float _692 = _644 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _694 = _690 * 0.15915493667125701904296875;
        float _696 = _694 * 6.283185482025146484375;
        float _698 = cos(_696);
        float _700 = _694 * 6.283185482025146484375;
        float _702 = sin(_700);
        float _704 = _698 + (-1.0);
        float _706 = _704 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _708 = fma(_702, _692, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _710 = fma(_644, _698, _706);
        float _712 = _688 * _708;
        float _714 = fma(_606, _712, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _716 = fma(_600, _712, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _680 = _710;
        _674 = _714;
        _670 = _716;
    }
    float _718 = _680;
    float _720 = _674;
    float _722 = _670;
    if (!_542)
    {
        float _724 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _726 = _724 * 0.15915493667125701904296875;
        float _728 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _730 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _732 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[30].w, _730);
        float _734 = _726 * 6.283185482025146484375;
        float _736 = cos(_734);
        float _738 = _728 * 0.15915493667125701904296875;
        float _740 = _726 * 6.283185482025146484375;
        float _742 = sin(_740);
        float _744 = 1.0 / _736;
        float _746 = _738 * 6.283185482025146484375;
        float _748 = cos(_746);
        float _750 = _742 * _744;
        float _752 = _738 * 6.283185482025146484375;
        float _754 = sin(_752);
        float _756 = _748 * _750;
        float _758 = 1.0 / _732;
        float _760 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _762 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _760;
        float _764 = 1.0 / _756;
        float _766 = 1.0 / _762;
        float _768 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _770 = _758 * _768;
        float _772 = _754 * _764;
        float _774 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _776 = fma(_772, _770, _774);
        float _778 = _776 * _766;
        float _780 = precise::clamp(_778, 0.0, 1.0);
        _652 = _726;
        _654 = _738;
        _666 = _780;
    }
    float _782 = _652;
    float _784 = _654;
    float _786 = _666;
    float _788 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _790 = _718 + _788;
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _794 = _720 + _792;
    float _796 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _798 = _722 + _796;
    float _800 = _790 * _790;
    float _802 = fma(_794, _794, _800);
    float _804 = fma(_798, _798, _802);
    float _806 = rsqrt(_804);
    float _808 = _806 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _810 = _794 * _808;
    float _812 = _798 * _808;
    float _814 = _810 * _810;
    float _816 = _812 * _812;
    float _818 = _814 + _816;
    float _820 = sqrt(_818);
    bool _822 = _820 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _824 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _826 = _820 + _824;
    float _828 = _802;
    float _830 = _784;
    float _832 = _826;
    float _834 = _782;
    float _836 = _808;
    if (_822)
    {
        float _838 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _828 = _838;
    }
    float _840 = _828;
    if (_822)
    {
        float _842 = rsqrt(_818);
        _830 = _842;
    }
    float _844 = _830;
    float _846 = _844;
    if (_822)
    {
        float _848 = _826 * _840;
        _832 = _848;
    }
    float _850 = _832;
    if (_822)
    {
        float _852 = _850 * 0.15915493667125701904296875;
        _834 = _852;
    }
    float _854 = _834;
    float _856 = _806;
    if (_822)
    {
        float _858 = _854 * 6.283185482025146484375;
        float _860 = sin(_858);
        _856 = _860;
    }
    float _862 = _856;
    float _864 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _866 = precise::max(0.0, _864);
    float _868 = _798;
    float _870 = _866;
    float _872 = _864;
    if (_822)
    {
        float _874 = _854 * 6.283185482025146484375;
        float _876 = cos(_874);
        _868 = _876;
    }
    float _878 = _868;
    float _880 = -_808;
    float _882 = -_866;
    float _884 = fma(_790, _880, _882);
    if (_822)
    {
        float _886 = _884 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _870 = _886;
    }
    float _888 = _870;
    float _890 = sqrt(_804);
    float _892 = _888;
    float _894 = _862;
    if (_822)
    {
        float _896 = fma(_862, _888, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _836 = _896;
    }
    float _898 = _836;
    float _900 = _898;
    if (!_822)
    {
        _892 = _810;
    }
    float _902 = _892;
    float _904 = _902;
    if (!_822)
    {
        _894 = _812;
    }
    float _906 = _894;
    float _908 = _906;
    if (_822)
    {
        float _910 = _878 + (-1.0);
        _872 = _910;
    }
    float _912 = _872;
    float _914 = 0.0;
    float _916 = _912;
    if (_822)
    {
        float _918 = _844 * _898;
        _914 = _918;
    }
    float _920 = _914;
    if (!_822)
    {
        _846 = _884;
    }
    float _922 = _846;
    float _924 = _718 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _926 = _922;
    if (_822)
    {
        float _928 = _912 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _656 = _928;
    }
    float _930 = _656;
    if (_822)
    {
        float _932 = _810 * _920;
        _904 = _932;
    }
    float _934 = _904;
    if (!_822)
    {
        _900 = _814;
    }
    float _936 = _900;
    float _938 = _936;
    if (_822)
    {
        float _940 = _812 * _920;
        _908 = _940;
    }
    float _942 = _908;
    if (_822)
    {
        float _944 = fma(_884, _878, _930);
        _926 = _944;
    }
    float _946 = _926;
    if (_822)
    {
        float _948 = _934 * _934;
        _938 = _948;
    }
    float _950 = _938;
    if (!_822)
    {
        _916 = _816;
    }
    float _952 = _916;
    float _954 = _952;
    if (_822)
    {
        float _956 = _942 * _942;
        _954 = _956;
    }
    float _958 = _954;
    float _960 = fma(_946, _946, _950);
    float _962 = _718 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _964 = _960 + _958;
    float _966 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _968 = fma(_890, (*spvDescriptorSet0.vp_c15)._m0[23].w, _966);
    float _970 = precise::clamp(_968, 0.0, 1.0);
    float _972 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[2].x, _962);
    float _974 = _718 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _976 = rsqrt(_964);
    float _978 = -_970;
    float _980 = _978 + 1.0;
    float _982 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[2].z, _972);
    float _984 = _718 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _986 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[1].x, _974);
    float _988 = _982 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _990 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[0].x, _984);
    float _992 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[1].z, _986);
    float _994 = abs(_980);
    float _996 = log2(_994);
    float _998 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[3].x, _924);
    float _1000 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[0].z, _990);
    float _1002 = _992 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1004 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1006 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[3].z, _998);
    float _1008 = _1000 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1010 = _976 * _934;
    float _1012 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1014 = _976 * _946;
    float _1016 = _976 * _942;
    float _1018 = _1010 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1020 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1012);
    float _1022 = _988 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1024 = _1006 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1026 = -_1018;
    float _1028 = fma(_1014, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1026);
    float _1030 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1020);
    float _1032 = -_1022;
    float _1034 = fma(_1032, _1004, 1.0);
    float _1036 = _996 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1038 = -_1016;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1028);
    float _1042 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1030);
    float _1044 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1046 = exp2(_1036);
    float _1048 = fma(_1040, -0.5, 0.5);
    float _1050 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1052 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1044);
    float _1054 = fma(_1040, 0.5, 0.5);
    float _1056 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1050);
    float _1058 = log2(_1034);
    float _1060 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1052);
    float _1062 = fma(_1054, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1064 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1056);
    float _1066 = _1014 + 1.0;
    float _1068 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1060);
    float _1070 = fma(_1054, _1062, -0.212114393711090087890625);
    float _1072 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1064);
    float _1074 = 1.0 / _1042;
    float _1076 = -_1014;
    float _1078 = fma(_1046, _1066, _1076);
    float _1080 = fma(_1054, _1070, 1.570728778839111328125);
    float _1082 = sqrt(_1048);
    float _1084 = _1058 * 0.693147182464599609375;
    float _1086 = _1084 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1088 = fma(_1078, 0.5, 0.5);
    float _1090 = _1068 * _1074;
    float _1092 = _1072 * _1074;
    float _1094 = fma(_1090, 0.5, 0.5);
    float _1096 = fma(_1092, -0.5, 0.5);
    float _1098 = _1082 * 0.636619746685028076171875;
    float _1100 = -_1080;
    float _1102 = fma(_1098, _1100, 1.0);
    float3 _3012 = float3(_1094, _1096, _1086);
    float _1104 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3012, float3(0.0), isnan(_3012)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3012, float3(0.0), isnan(_3012)), level(0.0)).x;
    float3 _3023 = float3(_1094, _1096, _1086);
    float4 _1107 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3023, float3(0.0), isnan(_3023)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3023, float3(0.0), isnan(_3023)), level(0.0)).xyzw;
    float _1109 = _1107.x;
    float _1111 = _1107.y;
    float _1113 = _1107.z;
    float _1115 = _1107.w;
    float2 _3040 = float2(_1102, _1088);
    float3 _1119 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3040, float2(0.0), isnan(_3040)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3040, float2(0.0), isnan(_3040)), level(0.0)).xyz;
    float _1121 = _1119.x;
    float _1123 = _1119.y;
    float _1125 = _1119.z;
    float _1127 = in.m_51.y;
    float _1129 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1137 = _1135 != 0;
    int _1139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1141 = _1139 != 0;
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1143;
    float _1147 = 1.0 / _1133;
    bool _1149 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1151 = isnan(_520);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1157 = _1153 || _1155;
    float _1159 = float(_1157);
    float _1161 = in.m_57.y;
    bool _1163 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1165 = isnan(_520);
    bool _1167 = _1163 || _1165;
    bool _1169 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1171 = _1167 || _1169;
    float _1173 = float(_1171);
    float _1175 = 0.0;
    if (_1137)
    {
        float _1177 = in.m_51.x;
        _1175 = _1177;
    }
    float _1179 = _1175;
    float _1181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1183 = in.m_57.x;
    bool _1185 = _1127 > 0.5;
    float _1187 = _1145 * _1147;
    float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1191 = _520 + _1189;
    float _1193 = -_1159;
    float _1195 = _1193 + 1.0;
    float _1197 = fma(_1187, _1191, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1199 = _1173 * _1195;
    float _1201 = -_1173;
    float _1203 = _1201 + 1.0;
    float _1205 = _1197 * _1199;
    float _1207 = -_1161;
    float _1209 = _1207 + 1.0;
    float _1211 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1205);
    float _1213 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1215 = _1179 > 0.5;
    bool _1217 = _1215 && _1137;
    float _1219 = _1161;
    float _1221 = _1179;
    if (_1141)
    {
        float _1223 = _1185 ? _1209 : _1161;
        _1219 = _1223;
    }
    float _1225 = _1219;
    float _1227 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1213);
    float _1229 = _996 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1231 = _1183;
    if (_1137)
    {
        _1221 = _1183;
    }
    float _1233 = _1221;
    float _1235 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1211);
    float _1237 = _1225 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1239 = exp2(_1229);
    bool _1241 = _786 > 0.0;
    bool _1243 = isnan(_786);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan(0.0);
    bool _1249 = _1245 || _1247;
    float _1251 = _1237 * _1181;
    float _1253 = _1233;
    if (_1217)
    {
        float _1255 = -_1233;
        float _1257 = _1255 + 1.0;
        _1253 = _1257;
    }
    float _1259 = _1253;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1263 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1137)
    {
        _1231 = _1259;
    }
    float _1265 = _1231;
    float _1267 = _1261 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1269 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1271 = -_1239;
    float _1273 = _1271 + 1.0;
    float _1275 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1227);
    float _1277 = _1269 * _1129;
    float _1279 = _1273 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1281 = _786 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1283 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1275);
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1287 = _1281 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1291 = _1283 + _1042;
    float _1293 = -_1279;
    float _1295 = _1293 + 1.0;
    float _1297 = _1285 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1299 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1301 = _1291 * 0.5;
    out.m_61.x = _1277;
    out.m_61.y = _1251;
    out.m_63.x = _1299;
    out.m_63.y = _1297;
    out.m_63.z = _1267;
    out.m_63.w = _1263;
    out.gl_Position.x = _1068;
    out.gl_Position.y = _1072;
    out.gl_Position.z = _1283;
    out.gl_Position.w = _1042;
    out.m_65.z = _1301;
    out.m_65.w = _1042;
    out.m_45.x = _1287;
    float _1303 = _1279 * _1104;
    float _1305 = _1115 * _1295;
    float _1307 = _1115 * _1303;
    float _1309 = _1125 * _1303;
    float _1311 = fma(_1121, _1307, _1109);
    float _1313 = fma(_1123, _1307, _1111);
    float _1315 = fma(_1115, _1309, _1113);
    out.m_67.x = _1311;
    out.m_67.y = _1313;
    out.m_67.z = _1315;
    out.m_67.w = _1305;
    if (_1249)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1317 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1317;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _512 = false;
    bool _408 = false;
    bool _282 = false;
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
    float _96 = _94;
    if (!_90)
    {
        out.m_45.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1374 = as_type<float>(_102);
        out.gl_Position.z = _1374;
    }
    if (!_90)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _106 = in.m_47.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_116)
    {
        float _122 = float(_86);
        _96 = _122;
    }
    float _124 = _96;
    bool _126 = _120 >= _124;
    bool _128 = !_116;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_45.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _104 = as_type<int>(_136);
    }
    int _138 = _104;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1443 = as_type<float>(_138);
        out.gl_Position.z = _1443;
    }
    if (_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _140 = in.m_49.w;
    float _142 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = in.m_47.x;
    float _156 = in.m_47.y;
    float _158 = in.m_47.z;
    float _160 = in.m_42.x;
    float _162 = in.m_42.y;
    float _164 = in.m_42.z;
    float _166 = 0.0;
    float _168 = _142;
    if (!_152)
    {
        float _170 = _142 * _142;
        float _172 = _170 * 0.5;
        _166 = _172;
    }
    float _174 = _166;
    float _176 = _174;
    if (!_152)
    {
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    bool _182 = !_152;
    float _184 = _180;
    if (!_182)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _142 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _142);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _214;
    }
    float _216 = _184;
    bool _218 = !_152;
    if (!_218)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = 1.0 / _226;
        float _230 = _142 * _222;
        float _232 = exp2(_230);
        float _234 = -_232;
        float _236 = _234 + 1.0;
        float _238 = _236 * _228;
        _168 = _238;
    }
    float _240 = _168;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _244 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _246 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = fma(_240, _154, _244);
    float _252 = fma(_240, _156, _246);
    float _254 = fma(_240, _158, _248);
    float _256 = fma(_250, _140, _160);
    float _258 = fma(_252, _140, _162);
    float _260 = fma(_254, _140, _164);
    bool _262 = !_242;
    float _280;
    if (!_262)
    {
        float _264 = in.m_51.x;
        float _266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _268 = _264 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _270 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _272 = _270 * _266;
        float _274 = floor(_272);
        float _276 = -_274;
        float _278 = _272 + _276;
        _280 = _278;
        _282 = true;
    }
    else
    {
        float _284 = float(_86);
        float _286 = 1.0 / _284;
        float _288 = _120 * _286;
        _280 = _288;
    }
    _282 = false;
    float _290 = _280;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _294 = _290 + _292;
    bool _296 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _298 = isnan(_290);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _308;
    float _312 = -_306;
    float _314 = _312 + 1.0;
    bool _316 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _318 = isnan(_290);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = 1.0 / _310;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _334;
    bool _338 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _340 = _294 * _328;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _342;
    float _346 = in.m_49.x;
    float _348 = in.m_49.y;
    float _350 = in.m_49.z;
    float _352 = _326 * _314;
    float _354 = fma(_332, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _356 = fma(_344, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _358 = fma(_336, _340, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _360 = -_326;
    float _362 = _360 + 1.0;
    float _364 = _354 * _352;
    float _366 = _356 * _352;
    float _368 = _358 * _352;
    float _370 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].x, _364);
    float _372 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].y, _366);
    float _374 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].z, _368);
    float _376 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[144].x, _370);
    float _378 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[144].y, _372);
    float _380 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[144].z, _374);
    float _382 = _376 * _346;
    float _384 = _378 * _348;
    float _386 = _380 * _350;
    bool _388 = !_338;
    float _406;
    if (!_388)
    {
        float _390 = in.m_51.x;
        float _392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _394 = _390 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _396 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _398 = _396 * _392;
        float _400 = floor(_398);
        float _402 = -_400;
        float _404 = _398 + _402;
        _406 = _404;
        _408 = true;
    }
    else
    {
        float _410 = float(_86);
        float _412 = 1.0 / _410;
        float _414 = _120 * _412;
        _406 = _414;
    }
    _408 = false;
    float _416 = _406;
    bool _418 = _416 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _420 = isnan(_416);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _434 = _416 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _436 = isnan(_416);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _452 = _416 + _450;
    float _454 = 1.0 / _432;
    float _456 = -_428;
    float _458 = _456 + 1.0;
    bool _460 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _462 = _444 * _458;
    float _464 = -_444;
    float _466 = _464 + 1.0;
    float _468 = _448 * _454;
    float _470 = fma(_468, _452, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _472 = _470 * _462;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _478 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[115].x, _472);
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _482 = _474 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _484 = _476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _486 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[116].x, _478);
    float _488 = _480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _490 = _486 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _482;
    out.m_53.y = _484;
    out.m_53.z = _488;
    out.m_53.w = _490;
    bool _492 = !_460;
    float _510;
    if (!_492)
    {
        float _494 = in.m_51.x;
        float _496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _498 = _494 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[11].w, _120);
        float _502 = _500 * _496;
        float _504 = floor(_502);
        float _506 = -_504;
        float _508 = _502 + _506;
        _510 = _508;
        _512 = true;
    }
    else
    {
        float _514 = float(_86);
        float _516 = 1.0 / _514;
        float _518 = _120 * _516;
        _510 = _518;
    }
    _512 = false;
    float _520 = _510;
    float _522 = in.m_55.x;
    float _524 = in.m_55.y;
    float _526 = in.m_55.z;
    float _528 = _384 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _530 = _382 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _532 = _386 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _534 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _536 = isnan(0.5);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _542 = _538 || _540;
    float _544 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _524);
    float _546 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _522);
    float _548 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _526);
    float _550 = _528 * _544;
    float _552 = _530 * _546;
    float _554 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _556 = _532 * _548;
    float _558 = _550 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _560 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _562 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _554);
    float _564 = _550 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _566 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[26].x, _558);
    float _568 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _560);
    float _570 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _562);
    float _572 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[24].x, _564);
    float _574 = fma(_556, (*spvDescriptorSet0.vp_c8)._m0[26].z, _566);
    float _576 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _578 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _568);
    float _580 = _570 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _582 = fma(_556, (*spvDescriptorSet0.vp_c8)._m0[24].z, _572);
    float _584 = _574 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _586 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _576);
    float _588 = _578 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _590 = _582 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _592 = _580 + _584;
    float _594 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _586);
    float _596 = _588 + _590;
    float _598 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _600 = _592 + _598;
    float _602 = _594 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _604 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _606 = _596 + _604;
    float _608 = _600 * _600;
    float _610 = _602 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _612 = _602 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _614 = fma(_606, _606, _608);
    float _616 = fma(_588, (*spvDescriptorSet0.vp_c8)._m0[11].x, _610);
    float _618 = fma(_588, (*spvDescriptorSet0.vp_c8)._m0[10].x, _612);
    float _620 = sqrt(_614);
    float _622 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[11].z, _616);
    float _624 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[10].z, _618);
    float _626 = _622 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _628 = _550 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _630 = _624 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _632 = 1.0 / _626;
    float _634 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[25].x, _628);
    float _636 = _630 + _626;
    float _638 = fma(_556, (*spvDescriptorSet0.vp_c8)._m0[25].z, _634);
    bool _640 = _620 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _642 = _638 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _644 = _602 + _642;
    float _646 = _642;
    float _648 = _636;
    float _650 = _592;
    float _652 = _602;
    float _654 = _588;
    float _656 = _600;
    if (_542)
    {
        _646 = 1.0;
    }
    float _658 = _646;
    float _660 = _636 * _632;
    float _662 = _660 * 0.5;
    float _664 = _632;
    float _666 = _658;
    if (!_640)
    {
        _664 = _592;
    }
    float _668 = _664;
    float _670 = _668;
    if (!_640)
    {
        _648 = _596;
    }
    float _672 = _648;
    float _674 = _672;
    if (!_640)
    {
        _650 = _644;
    }
    float _676 = _650;
    bool _678 = !_640;
    float _680 = _676;
    if (!_678)
    {
        float _682 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _684 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _686 = _620 + _684;
        float _688 = rsqrt(_614);
        float _690 = _686 * _682;
        float _692 = _644 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _694 = _690 * 0.15915493667125701904296875;
        float _696 = _694 * 6.283185482025146484375;
        float _698 = cos(_696);
        float _700 = _694 * 6.283185482025146484375;
        float _702 = sin(_700);
        float _704 = _698 + (-1.0);
        float _706 = _704 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _708 = fma(_702, _692, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _710 = fma(_644, _698, _706);
        float _712 = _688 * _708;
        float _714 = fma(_606, _712, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _716 = fma(_600, _712, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _680 = _710;
        _674 = _714;
        _670 = _716;
    }
    float _718 = _680;
    float _720 = _674;
    float _722 = _670;
    if (!_542)
    {
        float _724 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _726 = _724 * 0.15915493667125701904296875;
        float _728 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _730 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _732 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[30].w, _730);
        float _734 = _726 * 6.283185482025146484375;
        float _736 = cos(_734);
        float _738 = _728 * 0.15915493667125701904296875;
        float _740 = _726 * 6.283185482025146484375;
        float _742 = sin(_740);
        float _744 = 1.0 / _736;
        float _746 = _738 * 6.283185482025146484375;
        float _748 = cos(_746);
        float _750 = _742 * _744;
        float _752 = _738 * 6.283185482025146484375;
        float _754 = sin(_752);
        float _756 = _748 * _750;
        float _758 = 1.0 / _732;
        float _760 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _762 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _760;
        float _764 = 1.0 / _756;
        float _766 = 1.0 / _762;
        float _768 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _770 = _758 * _768;
        float _772 = _754 * _764;
        float _774 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _776 = fma(_772, _770, _774);
        float _778 = _776 * _766;
        float _780 = precise::clamp(_778, 0.0, 1.0);
        _652 = _726;
        _654 = _738;
        _666 = _780;
    }
    float _782 = _652;
    float _784 = _654;
    float _786 = _666;
    float _788 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _790 = _718 + _788;
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _794 = _720 + _792;
    float _796 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _798 = _722 + _796;
    float _800 = _790 * _790;
    float _802 = fma(_794, _794, _800);
    float _804 = fma(_798, _798, _802);
    float _806 = rsqrt(_804);
    float _808 = _806 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _810 = _794 * _808;
    float _812 = _798 * _808;
    float _814 = _810 * _810;
    float _816 = _812 * _812;
    float _818 = _814 + _816;
    float _820 = sqrt(_818);
    bool _822 = _820 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _824 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _826 = _820 + _824;
    float _828 = _802;
    float _830 = _784;
    float _832 = _826;
    float _834 = _782;
    float _836 = _808;
    if (_822)
    {
        float _838 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _828 = _838;
    }
    float _840 = _828;
    if (_822)
    {
        float _842 = rsqrt(_818);
        _830 = _842;
    }
    float _844 = _830;
    float _846 = _844;
    if (_822)
    {
        float _848 = _826 * _840;
        _832 = _848;
    }
    float _850 = _832;
    if (_822)
    {
        float _852 = _850 * 0.15915493667125701904296875;
        _834 = _852;
    }
    float _854 = _834;
    float _856 = _806;
    if (_822)
    {
        float _858 = _854 * 6.283185482025146484375;
        float _860 = sin(_858);
        _856 = _860;
    }
    float _862 = _856;
    float _864 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _866 = precise::max(0.0, _864);
    float _868 = _798;
    float _870 = _866;
    float _872 = _864;
    if (_822)
    {
        float _874 = _854 * 6.283185482025146484375;
        float _876 = cos(_874);
        _868 = _876;
    }
    float _878 = _868;
    float _880 = -_808;
    float _882 = -_866;
    float _884 = fma(_790, _880, _882);
    if (_822)
    {
        float _886 = _884 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _870 = _886;
    }
    float _888 = _870;
    float _890 = sqrt(_804);
    float _892 = _888;
    float _894 = _862;
    if (_822)
    {
        float _896 = fma(_862, _888, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _836 = _896;
    }
    float _898 = _836;
    float _900 = _898;
    if (!_822)
    {
        _892 = _810;
    }
    float _902 = _892;
    float _904 = _902;
    if (!_822)
    {
        _894 = _812;
    }
    float _906 = _894;
    float _908 = _906;
    if (_822)
    {
        float _910 = _878 + (-1.0);
        _872 = _910;
    }
    float _912 = _872;
    float _914 = 0.0;
    float _916 = _912;
    if (_822)
    {
        float _918 = _844 * _898;
        _914 = _918;
    }
    float _920 = _914;
    if (!_822)
    {
        _846 = _884;
    }
    float _922 = _846;
    float _924 = _718 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _926 = _922;
    if (_822)
    {
        float _928 = _912 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _656 = _928;
    }
    float _930 = _656;
    if (_822)
    {
        float _932 = _810 * _920;
        _904 = _932;
    }
    float _934 = _904;
    if (!_822)
    {
        _900 = _814;
    }
    float _936 = _900;
    float _938 = _936;
    if (_822)
    {
        float _940 = _812 * _920;
        _908 = _940;
    }
    float _942 = _908;
    if (_822)
    {
        float _944 = fma(_884, _878, _930);
        _926 = _944;
    }
    float _946 = _926;
    if (_822)
    {
        float _948 = _934 * _934;
        _938 = _948;
    }
    float _950 = _938;
    if (!_822)
    {
        _916 = _816;
    }
    float _952 = _916;
    float _954 = _952;
    if (_822)
    {
        float _956 = _942 * _942;
        _954 = _956;
    }
    float _958 = _954;
    float _960 = fma(_946, _946, _950);
    float _962 = _718 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _964 = _960 + _958;
    float _966 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _968 = fma(_890, (*spvDescriptorSet0.vp_c15)._m0[23].w, _966);
    float _970 = precise::clamp(_968, 0.0, 1.0);
    float _972 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[2].x, _962);
    float _974 = _718 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _976 = rsqrt(_964);
    float _978 = -_970;
    float _980 = _978 + 1.0;
    float _982 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[2].z, _972);
    float _984 = _718 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _986 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[1].x, _974);
    float _988 = _982 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _990 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[0].x, _984);
    float _992 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[1].z, _986);
    float _994 = abs(_980);
    float _996 = log2(_994);
    float _998 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[3].x, _924);
    float _1000 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[0].z, _990);
    float _1002 = _992 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1004 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1006 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[3].z, _998);
    float _1008 = _1000 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1010 = _976 * _934;
    float _1012 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1014 = _976 * _946;
    float _1016 = _976 * _942;
    float _1018 = _1010 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1020 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1012);
    float _1022 = _988 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1024 = _1006 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1026 = -_1018;
    float _1028 = fma(_1014, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1026);
    float _1030 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1020);
    float _1032 = -_1022;
    float _1034 = fma(_1032, _1004, 1.0);
    float _1036 = _996 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1038 = -_1016;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1028);
    float _1042 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1030);
    float _1044 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1046 = exp2(_1036);
    float _1048 = fma(_1040, -0.5, 0.5);
    float _1050 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1052 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1044);
    float _1054 = fma(_1040, 0.5, 0.5);
    float _1056 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1050);
    float _1058 = log2(_1034);
    float _1060 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1052);
    float _1062 = fma(_1054, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1064 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1056);
    float _1066 = _1014 + 1.0;
    float _1068 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1060);
    float _1070 = fma(_1054, _1062, -0.212114393711090087890625);
    float _1072 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1064);
    float _1074 = 1.0 / _1042;
    float _1076 = -_1014;
    float _1078 = fma(_1046, _1066, _1076);
    float _1080 = fma(_1054, _1070, 1.570728778839111328125);
    float _1082 = sqrt(_1048);
    float _1084 = _1058 * 0.693147182464599609375;
    float _1086 = _1084 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1088 = fma(_1078, 0.5, 0.5);
    float _1090 = _1068 * _1074;
    float _1092 = _1072 * _1074;
    float _1094 = fma(_1090, 0.5, 0.5);
    float _1096 = fma(_1092, -0.5, 0.5);
    float _1098 = _1082 * 0.636619746685028076171875;
    float _1100 = -_1080;
    float _1102 = fma(_1098, _1100, 1.0);
    float3 _3012 = float3(_1094, _1096, _1086);
    float _1104 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3012, float3(0.0), isnan(_3012)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3012, float3(0.0), isnan(_3012)), level(0.0)).x;
    float3 _3023 = float3(_1094, _1096, _1086);
    float4 _1107 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3023, float3(0.0), isnan(_3023)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3023, float3(0.0), isnan(_3023)), level(0.0)).xyzw;
    float _1109 = _1107.x;
    float _1111 = _1107.y;
    float _1113 = _1107.z;
    float _1115 = _1107.w;
    float2 _3040 = float2(_1102, _1088);
    float3 _1119 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3040, float2(0.0), isnan(_3040)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3040, float2(0.0), isnan(_3040)), level(0.0)).xyz;
    float _1121 = _1119.x;
    float _1123 = _1119.y;
    float _1125 = _1119.z;
    float _1127 = in.m_51.y;
    float _1129 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1137 = _1135 != 0;
    int _1139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1141 = _1139 != 0;
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1143;
    float _1147 = 1.0 / _1133;
    bool _1149 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1151 = isnan(_520);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1157 = _1153 || _1155;
    float _1159 = float(_1157);
    float _1161 = in.m_57.y;
    bool _1163 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1165 = isnan(_520);
    bool _1167 = _1163 || _1165;
    bool _1169 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1171 = _1167 || _1169;
    float _1173 = float(_1171);
    float _1175 = 0.0;
    if (_1137)
    {
        float _1177 = in.m_51.x;
        _1175 = _1177;
    }
    float _1179 = _1175;
    float _1181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1183 = in.m_57.x;
    bool _1185 = _1127 > 0.5;
    float _1187 = _1145 * _1147;
    float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1191 = _520 + _1189;
    float _1193 = -_1159;
    float _1195 = _1193 + 1.0;
    float _1197 = fma(_1187, _1191, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1199 = _1173 * _1195;
    float _1201 = -_1173;
    float _1203 = _1201 + 1.0;
    float _1205 = _1197 * _1199;
    float _1207 = -_1161;
    float _1209 = _1207 + 1.0;
    float _1211 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1205);
    float _1213 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1215 = _1179 > 0.5;
    bool _1217 = _1215 && _1137;
    float _1219 = _1161;
    float _1221 = _1179;
    if (_1141)
    {
        float _1223 = _1185 ? _1209 : _1161;
        _1219 = _1223;
    }
    float _1225 = _1219;
    float _1227 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1213);
    float _1229 = _996 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1231 = _1183;
    if (_1137)
    {
        _1221 = _1183;
    }
    float _1233 = _1221;
    float _1235 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1211);
    float _1237 = _1225 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1239 = exp2(_1229);
    bool _1241 = _786 > 0.0;
    bool _1243 = isnan(_786);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan(0.0);
    bool _1249 = _1245 || _1247;
    float _1251 = _1237 * _1181;
    float _1253 = _1233;
    if (_1217)
    {
        float _1255 = -_1233;
        float _1257 = _1255 + 1.0;
        _1253 = _1257;
    }
    float _1259 = _1253;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1263 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1137)
    {
        _1231 = _1259;
    }
    float _1265 = _1231;
    float _1267 = _1261 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1269 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1271 = -_1239;
    float _1273 = _1271 + 1.0;
    float _1275 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1227);
    float _1277 = _1269 * _1129;
    float _1279 = _1273 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1281 = _786 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1283 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1275);
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1287 = _1281 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1291 = _1283 + _1042;
    float _1293 = -_1279;
    float _1295 = _1293 + 1.0;
    float _1297 = _1285 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1299 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1301 = _1291 * 0.5;
    out.m_61.x = _1277;
    out.m_61.y = _1251;
    out.m_63.x = _1299;
    out.m_63.y = _1297;
    out.m_63.z = _1267;
    out.m_63.w = _1263;
    out.gl_Position.x = _1068;
    out.gl_Position.y = _1072;
    out.gl_Position.z = _1283;
    out.gl_Position.w = _1042;
    out.m_65.z = _1301;
    out.m_65.w = _1042;
    out.m_45.x = _1287;
    float _1303 = _1279 * _1104;
    float _1305 = _1115 * _1295;
    float _1307 = _1115 * _1303;
    float _1309 = _1125 * _1303;
    float _1311 = fma(_1121, _1307, _1109);
    float _1313 = fma(_1123, _1307, _1111);
    float _1315 = fma(_1115, _1309, _1113);
    out.m_67.x = _1311;
    out.m_67.y = _1313;
    out.m_67.z = _1315;
    out.m_67.w = _1305;
    if (_1249)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1317 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1317;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

