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
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_55 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
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
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1893 = false;
    bool _560 = false;
    bool _312 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2192 = as_type<float>(_108);
        out.gl_Position.z = _2192;
    }
    if (!_96)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = _126;
    if (_122)
    {
        float _130 = float(_92);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2262 = as_type<float>(_146);
        out.gl_Position.z = _2262;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_51.w;
    float _150 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_49.x;
    float _164 = in.m_49.y;
    float _166 = in.m_49.z;
    float _168 = in.m_44.x;
    float _170 = in.m_44.y;
    float _172 = in.m_44.z;
    float _174 = 0.0;
    if (!_160)
    {
        float _176 = _150 * _150;
        float _178 = _176 * 0.5;
        _174 = _178;
    }
    float _180 = _174;
    float _182 = _180;
    if (!_160)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_160;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _150 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _150);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _226 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _228 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _230 = _224 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _232 = _224 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _234 = _224 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _236 = fma(_226, (*spvDescriptorSet0.vp_c10)._m0[8].x, _230);
    float _238 = fma(_226, (*spvDescriptorSet0.vp_c10)._m0[8].y, _232);
    float _240 = fma(_226, (*spvDescriptorSet0.vp_c10)._m0[8].z, _234);
    float _242 = _226;
    if (!_160)
    {
        _242 = _150;
    }
    float _244 = _242;
    float _246 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[10].x, _236);
    bool _248 = !_160;
    float _250 = _244;
    if (!_248)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _150 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _250 = _270;
    }
    float _272 = _250;
    bool _274 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _276 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[10].y, _238);
    float _278 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[10].z, _240);
    float _280 = fma(_272, _162, _246);
    float _282 = fma(_272, _164, _276);
    float _284 = fma(_272, _166, _278);
    float _286 = fma(_280, _148, _168);
    float _288 = fma(_282, _148, _170);
    float _290 = fma(_284, _148, _172);
    bool _292 = !_274;
    float _310;
    if (!_292)
    {
        float _294 = in.m_53.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        float _314 = float(_92);
        float _316 = 1.0 / _314;
        float _318 = _126 * _316;
        _310 = _318;
    }
    _312 = false;
    float _320 = _310;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _324 = _320 + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _334;
    float _338 = 1.0 / _328;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _346 = _340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _348 = 1.0 / _332;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _352 = _342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _354 = _344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _358 = _320 + _356;
    float _360 = 1.0 / _336;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _364 = _320 + _362;
    float _366 = _358 * _338;
    out.m_55.x = _346;
    out.m_55.y = _352;
    out.m_55.z = _354;
    out.m_55.w = _350;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _368;
    bool _372 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _374 = isnan(_320);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = _364 * _348;
    bool _386 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _388 = isnan(_320);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _398;
    bool _402 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _404 = _324 * _360;
    bool _406 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _408 = isnan(_320);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = -_396;
    float _420 = _418 + 1.0;
    bool _422 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _424 = isnan(_320);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = fma(_370, _366, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _436 = fma(_400, _366, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _438 = _416 * _420;
    float _440 = -_416;
    float _442 = _440 + 1.0;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _456 = -_432;
    float _458 = _456 + 1.0;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _460;
    float _464 = _432 * _442;
    float _466 = fma(_446, _384, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _468 = fma(_450, _384, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _470 = fma(_454, _384, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _472 = _382 * _458;
    float _474 = fma(_462, _366, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _476 = in.m_51.x;
    float _478 = in.m_51.y;
    float _480 = in.m_51.z;
    float _482 = _434 * _472;
    float _484 = _436 * _472;
    float _486 = -_382;
    float _488 = _486 + 1.0;
    float _490 = _474 * _472;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _492;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _496;
    float _500 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[143].x, _482);
    float _502 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[143].y, _484);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _504;
    float _508 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[143].z, _490);
    float _510 = fma(_494, _404, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _512 = fma(_498, _404, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _514 = fma(_506, _404, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _516 = fma(_466, _464, _500);
    float _518 = fma(_468, _464, _502);
    float _520 = fma(_470, _464, _508);
    float _522 = fma(_510, _438, _516);
    float _524 = fma(_512, _438, _518);
    float _526 = fma(_514, _438, _520);
    float _528 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[146].x, _522);
    float _530 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[146].y, _524);
    float _532 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[146].z, _526);
    float _534 = _528 * _476;
    float _536 = _530 * _478;
    float _538 = _532 * _480;
    bool _540 = !_402;
    float _558;
    if (!_540)
    {
        float _542 = in.m_53.x;
        float _544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _546 = _542 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _548 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[11].z, _126);
        float _550 = _548 * _544;
        float _552 = floor(_550);
        float _554 = -_552;
        float _556 = _550 + _554;
        _558 = _556;
        _560 = true;
    }
    else
    {
        float _562 = float(_92);
        float _564 = 1.0 / _562;
        float _566 = _126 * _564;
        _558 = _566;
    }
    _560 = false;
    float _568 = _558;
    float _570 = in.m_53.x;
    float _572 = in.m_53.y;
    float _574 = in.m_53.z;
    float _576 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _578 = log2(_576);
    float _580 = _536 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _582 = _538 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _586 = _584 != 0;
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _590 = _588 != 0;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _594 = _592 != 0;
    float _596 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _598 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _600 = isnan(0.0);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _606 = _602 || _604;
    float _608 = _578 * _126;
    float _610 = exp2(_608);
    float _612 = _570 * 2.0;
    float _614 = _572 * 2.0;
    float _616 = _572 + _574;
    float _618 = _574 + _570;
    float _620 = _574 * 2.0;
    float _622 = floor(_614);
    float _624 = _574 + (-0.5);
    float _626 = _618 + (-1.0);
    float _628 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _630 = floor(_612);
    float _632 = -_610;
    float _634 = _632 + 1.0;
    float _636 = _606 ? _634 : 0.0;
    bool _638 = _622 >= 0.0;
    bool _640 = isnan(_622);
    bool _642 = _638 || _640;
    bool _644 = isnan(0.0);
    bool _646 = _642 || _644;
    float _648 = floor(_620);
    int _650 = _646 ? 0 : 1;
    bool _652 = _630 > 0.0;
    bool _654 = _630 >= 0.0;
    bool _656 = isnan(_630);
    bool _658 = _654 || _656;
    bool _660 = isnan(0.0);
    bool _662 = _658 || _660;
    float _664 = _616 + (-1.0);
    float _666 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _668 = _662 ? 0 : 1;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _672 = 1.0 + _670;
    bool _674 = _622 > 0.0;
    int _676 = ~_668;
    int _678 = _676 + 1;
    int _680 = _678 + 1;
    float _682 = 1.0 / _672;
    int _684 = _680;
    if (!_652)
    {
        int _686 = ~_668;
        int _688 = _686 + 1;
        _684 = _688;
    }
    int _690 = _684;
    float _692 = in.m_57.x;
    float _694 = in.m_57.y;
    float _696 = in.m_57.z;
    bool _698 = !_590;
    int _700 = _698 ? 0 : 1;
    bool _702 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _704 = isnan(1.0);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _710 = _706 || _708;
    int _712 = abs(_700);
    float _714 = float(_690);
    float _716 = float(_712);
    bool _718 = _648 > 0.0;
    bool _720 = _648 >= 0.0;
    bool _722 = isnan(_648);
    bool _724 = _720 || _722;
    bool _726 = isnan(0.0);
    bool _728 = _724 || _726;
    float _730 = _716 * _714;
    int _732 = ~_650;
    int _734 = _732 + 1;
    int _736 = _734 + 1;
    int _738 = _736;
    if (_710)
    {
        float _740 = _636 * _682;
        _128 = _740;
    }
    float _742 = _128;
    if (!_674)
    {
        int _744 = ~_650;
        int _746 = _744 + 1;
        _738 = _746;
    }
    int _748 = _738;
    float _750 = _730 * (-2.0);
    bool _752 = !_594;
    int _754 = _752 ? 0 : 1;
    float _756 = _572 + (-0.5);
    bool _758 = !_586;
    int _760 = _758 ? 0 : 1;
    float _762 = fma(_666, _750, _666);
    int _764 = abs(_754);
    float _766 = fma(_750, _694, _694);
    int _768 = _728 ? 0 : 1;
    float _770 = _572 + _570;
    int _772 = abs(_760);
    float _774 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[196].y, _766);
    float _776 = float(_764);
    float _778 = _770 + (-1.0);
    float _780 = float(_748);
    float _782 = fma(_762, _742, _774);
    int _784 = ~_768;
    int _786 = _784 + 1;
    int _788 = _786 + 1;
    float _790 = _782 * 0.15915493667125701904296875;
    int _792 = _788;
    if (!_718)
    {
        int _794 = ~_768;
        int _796 = _794 + 1;
        _792 = _796;
    }
    int _798 = _792;
    float _800 = _776 * _780;
    float _802 = float(_772);
    float _804 = _790 * 6.283185482025146484375;
    float _806 = sin(_804);
    float _808 = float(_798);
    float _810 = _800 * (-2.0);
    float _812 = _570 + (-0.5);
    float _814 = _802 * _808;
    float _816 = fma(_810, _696, _696);
    float _818 = fma(_628, _810, _628);
    float _820 = _814 * (-2.0);
    float _822 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[196].z, _816);
    float _824 = _790 * 6.283185482025146484375;
    float _826 = cos(_824);
    float _828 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _830 = fma(_820, _692, _692);
    float _832 = fma(_818, _742, _822);
    float _834 = in.m_59.x;
    float _836 = in.m_59.y;
    float _838 = in.m_59.z;
    float _840 = fma(_828, _820, _828);
    float _842 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[196].x, _830);
    float _844 = _832 * 0.15915493667125701904296875;
    float _846 = fma(_840, _742, _842);
    float _848 = _844 * 6.283185482025146484375;
    float _850 = cos(_848);
    float _852 = _846 * 0.15915493667125701904296875;
    bool _854 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _856 = isnan(0.5);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _862 = _858 || _860;
    float _864 = _852 * 6.283185482025146484375;
    float _866 = cos(_864);
    float _868 = _844 * 6.283185482025146484375;
    float _870 = sin(_868);
    float _872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _836);
    float _874 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _838);
    float _876 = _826 * _850;
    float _878 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _834);
    float _880 = _580 * _872;
    float _882 = _806 * _850;
    float _884 = _582 * _874;
    float _886 = _852 * 6.283185482025146484375;
    float _888 = sin(_886);
    float _890 = _866 * _850;
    float _892 = _596 * _878;
    float _894 = _288 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _896 = _866 * _806;
    float _898 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].x, _894);
    float _900 = _806 * _870;
    float _902 = _826 * _870;
    float _904 = _866 * _870;
    float _906 = _866 * _826;
    float _908 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[6].z, _898);
    float _910 = fma(_888, _900, _876);
    float _912 = fma(_888, _876, _900);
    float _914 = -_902;
    float _916 = fma(_888, _882, _914);
    float _918 = _890 * _884;
    float _920 = -_882;
    float _922 = fma(_888, _902, _920);
    float _924 = _912 * _884;
    float _926 = _916 * _884;
    float _928 = fma(_904, _892, _918);
    float _930 = fma(_922, _892, _924);
    float _932 = fma(_910, _892, _926);
    float _934 = fma(_888, _880, _928);
    float _936 = _288 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _938 = -_880;
    float _940 = fma(_906, _938, _930);
    float _942 = -_880;
    float _944 = fma(_896, _942, _932);
    float _946 = _934 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _948 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].x, _936);
    float _950 = _934 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _952 = _288 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _954 = fma(_944, (*spvDescriptorSet0.vp_c10)._m0[10].x, _946);
    float _956 = _908 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _958 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[4].z, _948);
    float _960 = fma(_944, (*spvDescriptorSet0.vp_c10)._m0[8].x, _950);
    float _962 = fma(_940, (*spvDescriptorSet0.vp_c10)._m0[10].z, _954);
    float _964 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].x, _952);
    float _966 = _958 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _968 = fma(_940, (*spvDescriptorSet0.vp_c10)._m0[8].z, _960);
    float _970 = _956 + _962;
    float _972 = _934 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _974 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[5].z, _964);
    float _976 = _966 + _968;
    float _978 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _980 = _970 + _978;
    float _982 = fma(_944, (*spvDescriptorSet0.vp_c10)._m0[9].x, _972);
    float _984 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _986 = _976 + _984;
    float _988 = _980 * _980;
    float _990 = fma(_940, (*spvDescriptorSet0.vp_c10)._m0[9].z, _982);
    float _992 = fma(_986, _986, _988);
    float _994 = _974 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _996 = sqrt(_992);
    float _998 = _994 + _990;
    bool _1000 = _996 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1002 = _934;
    float _1004 = _976;
    float _1006 = _970;
    float _1008 = _996;
    float _1010 = _980;
    float _1012 = _838;
    float _1014 = _890;
    if (!_1000)
    {
        _1002 = _998;
    }
    float _1016 = _1002;
    bool _1018 = !_1000;
    float _1020 = _1016;
    if (!_1018)
    {
        float _1022 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1024 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1026 = _996 + _1024;
        float _1028 = rsqrt(_992);
        float _1030 = _1026 * _1022;
        float _1032 = _998 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1034 = _1030 * 0.15915493667125701904296875;
        float _1036 = _1034 * 6.283185482025146484375;
        float _1038 = sin(_1036);
        float _1040 = _1034 * 6.283185482025146484375;
        float _1042 = cos(_1040);
        float _1044 = fma(_1038, _1032, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1046 = _1028 * _1044;
        float _1048 = _1042 + (-1.0);
        float _1050 = fma(_986, _1046, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1052 = fma(_980, _1046, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1054 = _1048 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1056 = fma(_998, _1042, _1054);
        _1004 = _1050;
        _1020 = _1056;
        _1006 = _1052;
    }
    float _1058 = _1004;
    float _1060 = _1020;
    float _1062 = _1006;
    float _1064 = _1060;
    float _1066 = _1058;
    float _1068 = _1062;
    if (!_862)
    {
        float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1072 = _994 + _1070;
        float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1076 = _966 + _1074;
        float _1078 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1080 = -_966;
        float _1082 = _1080 + _1058;
        float _1084 = _1072 * _1072;
        float _1086 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1088 = _956 + _1086;
        float _1090 = -_994;
        float _1092 = _1090 + _1060;
        float _1094 = -_956;
        float _1096 = _1094 + _1062;
        float _1098 = fma(_1076, _1076, _1084);
        float _1100 = fma(_1088, _1088, _1098);
        float _1102 = sqrt(_1100);
        float _1104 = precise::min(_1102, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1106 = _1104 * _1078;
        float _1108 = fma(_1082, _1106, _966);
        float _1110 = fma(_1092, _1106, _994);
        float _1112 = fma(_1096, _1106, _956);
        _1064 = _1110;
        _1066 = _1108;
        _1068 = _1112;
    }
    float _1114 = _1064;
    float _1116 = _1066;
    float _1118 = _1068;
    float _1120 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1122 = _1114 + _1120;
    float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1126 = _1116 + _1124;
    float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1130 = _1118 + _1128;
    float _1132 = _1122 * _1122;
    float _1134 = fma(_1126, _1126, _1132);
    float _1136 = fma(_1130, _1130, _1134);
    float _1138 = rsqrt(_1136);
    float _1140 = sqrt(_1136);
    float _1142 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1144 = _1126 * _1142;
    float _1146 = _1130 * _1142;
    float _1148 = _1144 * _1144;
    float _1150 = _1146 * _1146;
    float _1152 = _1148 + _1150;
    float _1154 = sqrt(_1152);
    bool _1156 = _1154 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1158 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1160 = _1154 + _1158;
    float _1162 = _1138;
    float _1164 = _1160;
    float _1166 = _1122;
    float _1168 = _1142;
    if (_1156)
    {
        float _1170 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1162 = _1170;
    }
    float _1172 = _1162;
    if (_1156)
    {
        float _1174 = rsqrt(_1152);
        _1008 = _1174;
    }
    float _1176 = _1008;
    float _1178 = _1176;
    if (_1156)
    {
        float _1180 = _1160 * _1172;
        _1164 = _1180;
    }
    float _1182 = _1164;
    if (_1156)
    {
        float _1184 = _1182 * 0.15915493667125701904296875;
        _1010 = _1184;
    }
    float _1186 = _1010;
    float _1188 = _1172;
    if (_1156)
    {
        float _1190 = _1186 * 6.283185482025146484375;
        float _1192 = sin(_1190);
        _1188 = _1192;
    }
    float _1194 = _1188;
    float _1196 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1198 = precise::max(0.0, _1196);
    float _1200 = _1130;
    float _1202 = _1198;
    if (_1156)
    {
        float _1204 = _1186 * 6.283185482025146484375;
        float _1206 = cos(_1204);
        _1200 = _1206;
    }
    float _1208 = _1200;
    float _1210 = -_1142;
    float _1212 = -_1198;
    float _1214 = fma(_1122, _1210, _1212);
    if (!_1156)
    {
        _1166 = _1146;
    }
    float _1216 = _1166;
    float _1218 = _1216;
    if (_1156)
    {
        float _1220 = _1214 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1202 = _1220;
    }
    float _1222 = _1202;
    float _1224 = _1194;
    float _1226 = _1222;
    if (_1156)
    {
        float _1228 = fma(_1194, _1222, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1224 = _1228;
    }
    float _1230 = _1224;
    float _1232 = _1230;
    float _1234 = _1208;
    if (_1156)
    {
        float _1236 = _1208 + (-1.0);
        _1226 = _1236;
    }
    float _1238 = _1226;
    float _1240 = 0.0;
    float _1242 = _1238;
    if (_1156)
    {
        float _1244 = _1176 * _1230;
        _1240 = _1244;
    }
    float _1246 = _1240;
    if (!_1156)
    {
        _1178 = _1144;
    }
    float _1248 = _1178;
    float _1250 = _1248;
    if (_1156)
    {
        float _1252 = _1238 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1168 = _1252;
    }
    float _1254 = _1168;
    if (_1156)
    {
        float _1256 = _1144 * _1246;
        _1250 = _1256;
    }
    float _1258 = _1250;
    if (!_1156)
    {
        _1232 = _1214;
    }
    float _1260 = _1232;
    float _1262 = _1260;
    if (_1156)
    {
        float _1264 = _1146 * _1246;
        _1218 = _1264;
    }
    float _1266 = _1218;
    if (!_1156)
    {
        _1242 = _1148;
    }
    float _1268 = _1242;
    float _1270 = _1268;
    if (_1156)
    {
        float _1272 = fma(_1214, _1208, _1254);
        _1262 = _1272;
    }
    float _1274 = _1262;
    if (_1156)
    {
        float _1276 = _1258 * _1258;
        _1270 = _1276;
    }
    float _1278 = _1270;
    if (!_1156)
    {
        _1234 = _1150;
    }
    float _1280 = _1234;
    float _1282 = _1280;
    if (_1156)
    {
        float _1284 = _1266 * _1266;
        _1282 = _1284;
    }
    float _1286 = _1282;
    float _1288 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1290 = fma(_1274, _1274, _1278);
    float _1292 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1294 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1296 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1288);
    float _1298 = _1290 + _1286;
    float _1300 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1302 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1304 = fma(_1140, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1302);
    float _1306 = precise::clamp(_1304, 0.0, 1.0);
    float _1308 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1296);
    float _1310 = rsqrt(_1298);
    float _1312 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1300);
    float _1314 = -_1306;
    float _1316 = _1314 + 1.0;
    float _1318 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1320 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1294);
    float _1322 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1312);
    float _1324 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1326 = _1318 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1328 = abs(_1316);
    float _1330 = log2(_1328);
    float _1332 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1320);
    float _1334 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1336 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1324);
    float _1338 = -_1326;
    float _1340 = fma(_1338, _1292, 1.0);
    float _1342 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1344 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1346 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1336);
    float _1348 = _1310 * _1258;
    float _1350 = _1310 * _1274;
    float _1352 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1344);
    float _1354 = _1310 * _1266;
    float _1356 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1358 = _1346 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1360 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1352);
    float _1362 = log2(_1340);
    float _1364 = -_1356;
    float _1366 = fma(_1350, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1364);
    float _1368 = _1330 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1370 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1360);
    float _1372 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1374 = -_1354;
    float _1376 = fma(_1374, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1366);
    float _1378 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1380 = exp2(_1368);
    float _1382 = fma(_1376, -0.5, 0.5);
    float _1384 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1378);
    float _1386 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1372);
    float _1388 = fma(_1376, 0.5, 0.5);
    float _1390 = _1350 + 1.0;
    float _1392 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1384);
    float _1394 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1386);
    float _1396 = 1.0 / _1370;
    float _1398 = fma(_1388, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1400 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1392);
    float _1402 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1394);
    float _1404 = _1362 * 0.693147182464599609375;
    float _1406 = fma(_1388, _1398, -0.212114393711090087890625);
    float _1408 = sqrt(_1382);
    float _1410 = -_1350;
    float _1412 = fma(_1380, _1390, _1410);
    float _1414 = fma(_1388, _1406, 1.570728778839111328125);
    float _1416 = _1404 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1418 = fma(_1412, 0.5, 0.5);
    float _1420 = _1400 * _1396;
    float _1422 = _1402 * _1396;
    float _1424 = fma(_1420, 0.5, 0.5);
    float _1426 = fma(_1422, -0.5, 0.5);
    float _1428 = _1408 * 0.636619746685028076171875;
    float3 _4291 = float3(_1424, _1426, _1416);
    float _1430 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4291, float3(0.0), isnan(_4291)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4291, float3(0.0), isnan(_4291)), level(0.0)).x;
    float _1432 = -_1414;
    float _1434 = fma(_1428, _1432, 1.0);
    float3 _4307 = float3(_1424, _1426, _1416);
    float4 _1437 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4307, float3(0.0), isnan(_4307)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4307, float3(0.0), isnan(_4307)), level(0.0)).xyzw;
    float _1439 = _1437.x;
    float _1441 = _1437.y;
    float _1443 = _1437.z;
    float _1445 = _1437.w;
    float2 _4324 = float2(_1434, _1418);
    float3 _1449 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4324, float2(0.0), isnan(_4324)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4324, float2(0.0), isnan(_4324)), level(0.0)).xyz;
    float _1451 = _1449.x;
    float _1453 = _1449.y;
    float _1455 = _1449.z;
    float _1457 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1459 = _568 + _1457;
    float _1461 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1463;
    float _1467 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1461);
    float _1469 = _994 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1471 = _994 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1473 = _836 != 0.0;
    bool _1475 = isnan(_836);
    bool _1477 = _1473 || _1475;
    bool _1479 = isnan(0.0);
    bool _1481 = _1477 || _1479;
    float _1483 = 1.0 / _1465;
    float _1485 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1469);
    bool _1487 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1489 = isnan(0.5);
    bool _1491 = _1487 || _1489;
    bool _1493 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1495 = _1491 || _1493;
    float _1497 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1467);
    bool _1499 = _834 == 0.0;
    bool _1501 = !_1481;
    bool _1503 = _1499 && _1501;
    float _1505 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1485);
    bool _1507 = _568 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1509 = isnan(_568);
    bool _1511 = _1507 || _1509;
    bool _1513 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1515 = _1511 || _1513;
    float _1517 = float(_1515);
    bool _1519 = _838 == 0.0;
    bool _1521 = _1519 && _1503;
    float _1523 = _1505 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1525 = 1.0 / _1523;
    float _1527 = _1459 * _1483;
    float _1529 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1531 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1529;
    float _1533 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1535 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1533;
    float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1539 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1537;
    float _1541 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1471);
    float _1543 = fma(_1531, _1527, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1545 = _568 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1547 = isnan(_568);
    bool _1549 = _1545 || _1547;
    bool _1551 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1553 = _1549 || _1551;
    float _1555 = float(_1553);
    float _1557 = fma(_1535, _1527, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1559 = in.m_61.x;
    float _1561 = in.m_61.y;
    float _1563 = in.m_61.z;
    float _1565 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1541);
    float _1567 = fma(_1539, _1527, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1569 = -_1555;
    float _1571 = _1569 + 1.0;
    float _1573 = _1565 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1575 = _1517 * _1571;
    float _1577 = -_1517;
    float _1579 = _1577 + 1.0;
    float _1581 = _1573 + _1523;
    float _1583 = _1557 * _1575;
    float _1585 = _1543 * _1575;
    float _1587 = _1567 * _1575;
    float _1589 = _1581 * _1525;
    float _1591 = _1589 * 0.5;
    float _1593 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1583);
    float _1595 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1585);
    float _1597 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1587);
    float _1599 = fma(_1555, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1593);
    float _1601 = fma(_1555, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1595);
    float _1603 = fma(_1555, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1597);
    float _1605 = _1599 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1607 = _1563;
    float _1609 = _1559;
    float _1611 = _1561;
    float _1613 = _1370;
    if (!_1521)
    {
        float _1615 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1563);
        _1607 = _1615;
    }
    float _1617 = _1607;
    if (!_1521)
    {
        float _1619 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1559);
        _1609 = _1619;
    }
    float _1621 = _1609;
    if (!_1521)
    {
        float _1623 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1561);
        _1611 = _1623;
    }
    float _1625 = _1611;
    float _1627 = _1330 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1629 = _890 * _1617;
    float _1631 = _1625;
    if (!_1495)
    {
        _1012 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1633 = _1012;
    float _1635 = _1601 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1637 = _1603 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1639 = fma(_904, _1621, _1629);
    float _1641 = _916 * _1617;
    float _1643 = _912 * _1617;
    float _1645 = exp2(_1627);
    float _1647 = fma(_888, _1625, _1639);
    float _1649 = fma(_910, _1621, _1641);
    float _1651 = _1643;
    if (!_1495)
    {
        float _1653 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1655 = fma(_1591, _1633, _1653);
        _1014 = _1655;
    }
    float _1657 = _1014;
    float _1659 = fma(_922, _1621, _1643);
    float _1661 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1497);
    float _1663 = -_1625;
    float _1665 = fma(_896, _1663, _1649);
    float _1667 = _1647 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1669 = _1661;
    if (!_1495)
    {
        _1651 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1671 = _1651;
    float _1673 = _1635 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1675 = _1605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1677 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1679 = _1647 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1681 = _1647 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1683 = _1661 + _1370;
    float _1685 = -_1625;
    float _1687 = fma(_906, _1685, _1659);
    float _1689 = -_1645;
    float _1691 = _1689 + 1.0;
    float _1693 = fma(_1665, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1667);
    float _1695 = fma(_1665, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1679);
    float _1697 = fma(_1665, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1681);
    float _1699 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1400;
    out.gl_Position.y = _1402;
    out.gl_Position.z = _1661;
    out.gl_Position.w = _1370;
    float _1701 = _1697;
    float _1703 = _1671;
    if (!_1495)
    {
        float _1705 = -_1671;
        float _1707 = _1705 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1631 = _1707;
    }
    float _1709 = _1631;
    float _1711 = _1657;
    if (!_1495)
    {
        float _1713 = 1.0 / _1657;
        _1711 = _1713;
    }
    float _1715 = _1711;
    float _1717 = fma(_1687, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1695);
    out.m_63.x = _1673;
    out.m_63.y = _1675;
    out.m_63.z = _1677;
    bool _1719 = _1140 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1721 = isnan(_1140);
    bool _1723 = _1719 || _1721;
    bool _1725 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1727 = _1723 || _1725;
    float _1729 = _1709;
    if (!_1495)
    {
        float _1731 = 1.0 / _1709;
        _1729 = _1731;
    }
    float _1733 = _1729;
    float _1735 = -_1699;
    float _1737 = _1735 + 1.0;
    float _1739 = _1683 * 0.5;
    float _1741 = fma(_1687, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1693);
    float _1743 = fma(_1687, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1697);
    float _1745 = _1737;
    if (!_1495)
    {
        float _1747 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1749 = -_1671;
        float _1751 = fma(_1715, _1747, _1749);
        _1701 = _1751;
    }
    float _1753 = _1701;
    float _1755 = _1753;
    if (!_1727)
    {
        _1703 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1757 = _1703;
    out.m_65.x = _1717;
    out.m_65.y = _1741;
    out.m_65.z = _1743;
    float _1759 = _1757;
    float _1761 = _1757;
    if (!_1727)
    {
        _1613 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1763 = _1613;
    float _1765 = _1733;
    float _1767 = _1763;
    float _1769 = _1763;
    if (!_1495)
    {
        float _1771 = _1753 * _1733;
        float _1773 = precise::clamp(_1771, 0.0, 1.0);
        _1755 = _1773;
    }
    float _1775 = _1755;
    out.m_67.z = _1739;
    out.m_67.w = _1370;
    float _1777 = _1775;
    if (!_1727)
    {
        _1765 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1779 = _1765;
    float _1781 = _1779;
    float _1783 = _1779;
    if (!_1727)
    {
        _1669 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1785 = _1669;
    float _1787 = _1699 * _1430;
    float _1789 = _1445 * _1787;
    float _1791 = _1445 * _1737;
    float _1793 = _1789;
    float _1795 = _1785;
    float _1797 = _1785;
    if (_1495)
    {
        _1745 = 1.0;
    }
    float _1799 = _1745;
    float _1801 = _1799;
    if (!_1495)
    {
        float _1803 = -_1775;
        float _1805 = _1803 + 1.0;
        _1801 = _1805;
    }
    float _1807 = _1801;
    float _1809 = _1455 * _1787;
    float _1811 = fma(_1451, _1789, _1439);
    float _1813 = fma(_1453, _1789, _1441);
    float _1815 = _1807 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1817 = fma(_1445, _1809, _1443);
    if (!_1727)
    {
        _1777 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1819 = _1777;
    float _1821 = _1819;
    float _1823 = _1819;
    if (!_1727)
    {
        _1793 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1825 = _1793;
    out.m_69.x = _1811;
    out.m_69.y = _1813;
    out.m_69.z = _1817;
    out.m_69.w = _1791;
    bool _1827 = !_1727;
    float _1829 = _1825;
    float _1831 = _1825;
    if (!_1827)
    {
        bool _1833 = _1140 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1835 = isnan(_1140);
        bool _1837 = _1833 || _1835;
        bool _1839 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1841 = _1837 || _1839;
        if (!_1841)
        {
            float _1843 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1845 = _1140 + _1843;
            float _1847 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1849 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1847;
            float _1851 = 1.0 / _1849;
            float _1853 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1855 = _1853 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1857 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1859 = _1857 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1863 = _1861 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1865 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1867 = _1865 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1871 = _1869 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1873 = _1845 * _1851;
            float _1875 = precise::clamp(_1873, 0.0, 1.0);
            float _1877 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1879 = _1877 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1881 = fma(_1875, _1855, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1883 = fma(_1875, _1879, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1885 = fma(_1875, _1859, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1887 = fma(_1875, _1863, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1889 = fma(_1875, _1867, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1891 = fma(_1875, _1871, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1783 = _1883;
            _1797 = _1889;
            _1761 = _1881;
            _1769 = _1887;
            _1823 = _1885;
            _1831 = _1891;
            _1893 = true;
        }
        else
        {
            bool _1895 = _1140 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1897 = isnan(_1140);
            bool _1899 = _1895 || _1897;
            bool _1901 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1903 = _1899 || _1901;
            if (!_1903)
            {
                _1759 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1905 = _1759;
            _1761 = _1905;
            if (!_1903)
            {
                _1781 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1907 = _1781;
            _1783 = _1907;
            if (!_1903)
            {
                _1821 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1909 = _1821;
            _1823 = _1909;
            if (!_1903)
            {
                _1767 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1911 = _1767;
            _1769 = _1911;
            if (!_1903)
            {
                _1795 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1913 = _1795;
            _1797 = _1913;
            if (!_1903)
            {
                _1829 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1915 = _1829;
            bool _1917 = !_1903;
            _1831 = _1915;
            if (!_1917)
            {
                bool _1919 = _1140 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1921 = isnan(_1140);
                bool _1923 = _1919 || _1921;
                bool _1925 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1927 = _1923 || _1925;
                if (!_1927)
                {
                    float _1929 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1931 = _1140 + _1929;
                    float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1935 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1933;
                    float _1937 = 1.0 / _1935;
                    float _1939 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1941 = _1939 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1943 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1945 = _1943 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1947 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1949 = _1947 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1951 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1953 = _1951 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1957 = _1955 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1959 = _1931 * _1937;
                    float _1961 = precise::clamp(_1959, 0.0, 1.0);
                    float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1965 = _1963 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1967 = fma(_1961, _1941, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1969 = fma(_1961, _1965, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1971 = fma(_1961, _1945, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1973 = fma(_1961, _1949, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1975 = fma(_1961, _1953, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1977 = fma(_1961, _1957, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1783 = _1969;
                    _1797 = _1975;
                    _1761 = _1967;
                    _1769 = _1973;
                    _1823 = _1971;
                    _1831 = _1977;
                    _1893 = true;
                }
                else
                {
                    _1783 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1797 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1761 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1769 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1823 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1831 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1893 = false;
    float _1979 = _1783;
    float _1981 = _1797;
    float _1983 = _1761;
    float _1985 = _1769;
    float _1987 = _1823;
    float _1989 = _1831;
    float _1991 = _1815 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1993 = fma(_1741, -0.5, 0.5);
    float _1995 = precise::clamp(_1993, 0.0, 1.0);
    float _1997 = -_1979;
    float _1999 = _1997 + _1981;
    float _2001 = -_1983;
    float _2003 = _2001 + _1985;
    out.m_47.x = _1991;
    float _2005 = -_1987;
    float _2007 = _2005 + _1989;
    float _2009 = fma(_1995, _1999, _1979);
    float _2011 = fma(_1995, _2003, _1983);
    bool _2013 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2015 = _2009 * 0.586610972881317138671875;
    float _2017 = fma(_1995, _2007, _1987);
    out.m_71.x = 0.0;
    bool _2019 = _1807 > 0.0;
    bool _2021 = isnan(_1807);
    bool _2023 = _2019 || _2021;
    bool _2025 = isnan(0.0);
    bool _2027 = _2023 || _2025;
    float _2029 = fma(_2011, 0.298911988735198974609375, _2015);
    float _2031 = fma(_2017, 0.114477999508380889892578125, _2029);
    float _2033 = -_2031;
    float _2035 = _2011 + _2033;
    float _2037 = -_2031;
    float _2039 = _2009 + _2037;
    float _2041 = -_2031;
    float _2043 = _2017 + _2041;
    float _2045 = fma(_2035, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2031);
    float _2047 = fma(_2039, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2031);
    float _2049 = fma(_2043, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2031);
    bool _2051 = !_2013;
    if (!_2051)
    {
        float _2053 = -_1114;
        float _2055 = _2053 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2057 = -_1116;
        float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2061 = -_1118;
        float _2063 = _2061 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2065 = _2055 * _2055;
        float _2067 = fma(_2059, _2059, _2065);
        float _2069 = fma(_2063, _2063, _2067);
        float _2071 = sqrt(_2069);
        float _2073 = rsqrt(_2069);
        float _2075 = -_2071;
        float _2077 = _2075 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2079 = _2077 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2081 = precise::clamp(_2079, 0.0, 1.0);
        float _2083 = _2059 * _2073;
        float _2085 = _2055 * _2073;
        float _2087 = abs(_2081);
        float _2089 = log2(_2087);
        float _2091 = _2063 * _2073;
        float _2093 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2095 = _1741 * _2085;
        float _2097 = -_2085;
        float _2099 = -_2093;
        float _2101 = fma(_2097, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2099);
        float _2103 = fma(_1717, _2083, _2095);
        float _2105 = -_2091;
        float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2101);
        float _2109 = fma(_1743, _2091, _2103);
        float _2111 = precise::clamp(_2109, 0.0, 1.0);
        float _2113 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2115 = _2107 + _2113;
        float _2117 = _2089 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2119 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2121 = precise::clamp(_2119, 0.0, 1.0);
        float _2123 = exp2(_2117);
        float _2125 = _2123 * _2121;
        float _2127 = _2111 * _2125;
        float _2129 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2131 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2133 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_71.x = _2129;
        out.m_71.y = _2131;
        out.m_71.z = _2133;
    }
    out.m_73.x = _2045;
    out.m_73.y = _2047;
    out.m_73.z = _2049;
    if (_2027)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2135 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2135;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1893 = false;
    bool _560 = false;
    bool _312 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2192 = as_type<float>(_108);
        out.gl_Position.z = _2192;
    }
    if (!_96)
    {
        return out;
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = _126;
    if (_122)
    {
        float _130 = float(_92);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2262 = as_type<float>(_146);
        out.gl_Position.z = _2262;
    }
    if (_138)
    {
        return out;
    }
    float _148 = in.m_51.w;
    float _150 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_49.x;
    float _164 = in.m_49.y;
    float _166 = in.m_49.z;
    float _168 = in.m_44.x;
    float _170 = in.m_44.y;
    float _172 = in.m_44.z;
    float _174 = 0.0;
    if (!_160)
    {
        float _176 = _150 * _150;
        float _178 = _176 * 0.5;
        _174 = _178;
    }
    float _180 = _174;
    float _182 = _180;
    if (!_160)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_160;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _150 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _150);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _226 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _228 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _230 = _224 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _232 = _224 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _234 = _224 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _236 = fma(_226, (*spvDescriptorSet0.vp_c10)._m0[8].x, _230);
    float _238 = fma(_226, (*spvDescriptorSet0.vp_c10)._m0[8].y, _232);
    float _240 = fma(_226, (*spvDescriptorSet0.vp_c10)._m0[8].z, _234);
    float _242 = _226;
    if (!_160)
    {
        _242 = _150;
    }
    float _244 = _242;
    float _246 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[10].x, _236);
    bool _248 = !_160;
    float _250 = _244;
    if (!_248)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _150 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _250 = _270;
    }
    float _272 = _250;
    bool _274 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _276 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[10].y, _238);
    float _278 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[10].z, _240);
    float _280 = fma(_272, _162, _246);
    float _282 = fma(_272, _164, _276);
    float _284 = fma(_272, _166, _278);
    float _286 = fma(_280, _148, _168);
    float _288 = fma(_282, _148, _170);
    float _290 = fma(_284, _148, _172);
    bool _292 = !_274;
    float _310;
    if (!_292)
    {
        float _294 = in.m_53.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        float _314 = float(_92);
        float _316 = 1.0 / _314;
        float _318 = _126 * _316;
        _310 = _318;
    }
    _312 = false;
    float _320 = _310;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _324 = _320 + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _334;
    float _338 = 1.0 / _328;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _346 = _340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _348 = 1.0 / _332;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _352 = _342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _354 = _344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _358 = _320 + _356;
    float _360 = 1.0 / _336;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _364 = _320 + _362;
    float _366 = _358 * _338;
    out.m_55.x = _346;
    out.m_55.y = _352;
    out.m_55.z = _354;
    out.m_55.w = _350;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _368;
    bool _372 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _374 = isnan(_320);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = _364 * _348;
    bool _386 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _388 = isnan(_320);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _398;
    bool _402 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _404 = _324 * _360;
    bool _406 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _408 = isnan(_320);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = -_396;
    float _420 = _418 + 1.0;
    bool _422 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _424 = isnan(_320);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = fma(_370, _366, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _436 = fma(_400, _366, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _438 = _416 * _420;
    float _440 = -_416;
    float _442 = _440 + 1.0;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _456 = -_432;
    float _458 = _456 + 1.0;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _460;
    float _464 = _432 * _442;
    float _466 = fma(_446, _384, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _468 = fma(_450, _384, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _470 = fma(_454, _384, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _472 = _382 * _458;
    float _474 = fma(_462, _366, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _476 = in.m_51.x;
    float _478 = in.m_51.y;
    float _480 = in.m_51.z;
    float _482 = _434 * _472;
    float _484 = _436 * _472;
    float _486 = -_382;
    float _488 = _486 + 1.0;
    float _490 = _474 * _472;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _492;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _496;
    float _500 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[143].x, _482);
    float _502 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[143].y, _484);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _504;
    float _508 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[143].z, _490);
    float _510 = fma(_494, _404, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _512 = fma(_498, _404, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _514 = fma(_506, _404, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _516 = fma(_466, _464, _500);
    float _518 = fma(_468, _464, _502);
    float _520 = fma(_470, _464, _508);
    float _522 = fma(_510, _438, _516);
    float _524 = fma(_512, _438, _518);
    float _526 = fma(_514, _438, _520);
    float _528 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[146].x, _522);
    float _530 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[146].y, _524);
    float _532 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[146].z, _526);
    float _534 = _528 * _476;
    float _536 = _530 * _478;
    float _538 = _532 * _480;
    bool _540 = !_402;
    float _558;
    if (!_540)
    {
        float _542 = in.m_53.x;
        float _544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _546 = _542 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _548 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[11].z, _126);
        float _550 = _548 * _544;
        float _552 = floor(_550);
        float _554 = -_552;
        float _556 = _550 + _554;
        _558 = _556;
        _560 = true;
    }
    else
    {
        float _562 = float(_92);
        float _564 = 1.0 / _562;
        float _566 = _126 * _564;
        _558 = _566;
    }
    _560 = false;
    float _568 = _558;
    float _570 = in.m_53.x;
    float _572 = in.m_53.y;
    float _574 = in.m_53.z;
    float _576 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _578 = log2(_576);
    float _580 = _536 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _582 = _538 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _586 = _584 != 0;
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _590 = _588 != 0;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _594 = _592 != 0;
    float _596 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _598 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _600 = isnan(0.0);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _606 = _602 || _604;
    float _608 = _578 * _126;
    float _610 = exp2(_608);
    float _612 = _570 * 2.0;
    float _614 = _572 * 2.0;
    float _616 = _572 + _574;
    float _618 = _574 + _570;
    float _620 = _574 * 2.0;
    float _622 = floor(_614);
    float _624 = _574 + (-0.5);
    float _626 = _618 + (-1.0);
    float _628 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _630 = floor(_612);
    float _632 = -_610;
    float _634 = _632 + 1.0;
    float _636 = _606 ? _634 : 0.0;
    bool _638 = _622 >= 0.0;
    bool _640 = isnan(_622);
    bool _642 = _638 || _640;
    bool _644 = isnan(0.0);
    bool _646 = _642 || _644;
    float _648 = floor(_620);
    int _650 = _646 ? 0 : 1;
    bool _652 = _630 > 0.0;
    bool _654 = _630 >= 0.0;
    bool _656 = isnan(_630);
    bool _658 = _654 || _656;
    bool _660 = isnan(0.0);
    bool _662 = _658 || _660;
    float _664 = _616 + (-1.0);
    float _666 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _668 = _662 ? 0 : 1;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _672 = 1.0 + _670;
    bool _674 = _622 > 0.0;
    int _676 = ~_668;
    int _678 = _676 + 1;
    int _680 = _678 + 1;
    float _682 = 1.0 / _672;
    int _684 = _680;
    if (!_652)
    {
        int _686 = ~_668;
        int _688 = _686 + 1;
        _684 = _688;
    }
    int _690 = _684;
    float _692 = in.m_57.x;
    float _694 = in.m_57.y;
    float _696 = in.m_57.z;
    bool _698 = !_590;
    int _700 = _698 ? 0 : 1;
    bool _702 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _704 = isnan(1.0);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _710 = _706 || _708;
    int _712 = abs(_700);
    float _714 = float(_690);
    float _716 = float(_712);
    bool _718 = _648 > 0.0;
    bool _720 = _648 >= 0.0;
    bool _722 = isnan(_648);
    bool _724 = _720 || _722;
    bool _726 = isnan(0.0);
    bool _728 = _724 || _726;
    float _730 = _716 * _714;
    int _732 = ~_650;
    int _734 = _732 + 1;
    int _736 = _734 + 1;
    int _738 = _736;
    if (_710)
    {
        float _740 = _636 * _682;
        _128 = _740;
    }
    float _742 = _128;
    if (!_674)
    {
        int _744 = ~_650;
        int _746 = _744 + 1;
        _738 = _746;
    }
    int _748 = _738;
    float _750 = _730 * (-2.0);
    bool _752 = !_594;
    int _754 = _752 ? 0 : 1;
    float _756 = _572 + (-0.5);
    bool _758 = !_586;
    int _760 = _758 ? 0 : 1;
    float _762 = fma(_666, _750, _666);
    int _764 = abs(_754);
    float _766 = fma(_750, _694, _694);
    int _768 = _728 ? 0 : 1;
    float _770 = _572 + _570;
    int _772 = abs(_760);
    float _774 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[196].y, _766);
    float _776 = float(_764);
    float _778 = _770 + (-1.0);
    float _780 = float(_748);
    float _782 = fma(_762, _742, _774);
    int _784 = ~_768;
    int _786 = _784 + 1;
    int _788 = _786 + 1;
    float _790 = _782 * 0.15915493667125701904296875;
    int _792 = _788;
    if (!_718)
    {
        int _794 = ~_768;
        int _796 = _794 + 1;
        _792 = _796;
    }
    int _798 = _792;
    float _800 = _776 * _780;
    float _802 = float(_772);
    float _804 = _790 * 6.283185482025146484375;
    float _806 = sin(_804);
    float _808 = float(_798);
    float _810 = _800 * (-2.0);
    float _812 = _570 + (-0.5);
    float _814 = _802 * _808;
    float _816 = fma(_810, _696, _696);
    float _818 = fma(_628, _810, _628);
    float _820 = _814 * (-2.0);
    float _822 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[196].z, _816);
    float _824 = _790 * 6.283185482025146484375;
    float _826 = cos(_824);
    float _828 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _830 = fma(_820, _692, _692);
    float _832 = fma(_818, _742, _822);
    float _834 = in.m_59.x;
    float _836 = in.m_59.y;
    float _838 = in.m_59.z;
    float _840 = fma(_828, _820, _828);
    float _842 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[196].x, _830);
    float _844 = _832 * 0.15915493667125701904296875;
    float _846 = fma(_840, _742, _842);
    float _848 = _844 * 6.283185482025146484375;
    float _850 = cos(_848);
    float _852 = _846 * 0.15915493667125701904296875;
    bool _854 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _856 = isnan(0.5);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _862 = _858 || _860;
    float _864 = _852 * 6.283185482025146484375;
    float _866 = cos(_864);
    float _868 = _844 * 6.283185482025146484375;
    float _870 = sin(_868);
    float _872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _836);
    float _874 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _838);
    float _876 = _826 * _850;
    float _878 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _834);
    float _880 = _580 * _872;
    float _882 = _806 * _850;
    float _884 = _582 * _874;
    float _886 = _852 * 6.283185482025146484375;
    float _888 = sin(_886);
    float _890 = _866 * _850;
    float _892 = _596 * _878;
    float _894 = _288 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _896 = _866 * _806;
    float _898 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].x, _894);
    float _900 = _806 * _870;
    float _902 = _826 * _870;
    float _904 = _866 * _870;
    float _906 = _866 * _826;
    float _908 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[6].z, _898);
    float _910 = fma(_888, _900, _876);
    float _912 = fma(_888, _876, _900);
    float _914 = -_902;
    float _916 = fma(_888, _882, _914);
    float _918 = _890 * _884;
    float _920 = -_882;
    float _922 = fma(_888, _902, _920);
    float _924 = _912 * _884;
    float _926 = _916 * _884;
    float _928 = fma(_904, _892, _918);
    float _930 = fma(_922, _892, _924);
    float _932 = fma(_910, _892, _926);
    float _934 = fma(_888, _880, _928);
    float _936 = _288 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _938 = -_880;
    float _940 = fma(_906, _938, _930);
    float _942 = -_880;
    float _944 = fma(_896, _942, _932);
    float _946 = _934 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _948 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].x, _936);
    float _950 = _934 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _952 = _288 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _954 = fma(_944, (*spvDescriptorSet0.vp_c10)._m0[10].x, _946);
    float _956 = _908 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _958 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[4].z, _948);
    float _960 = fma(_944, (*spvDescriptorSet0.vp_c10)._m0[8].x, _950);
    float _962 = fma(_940, (*spvDescriptorSet0.vp_c10)._m0[10].z, _954);
    float _964 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].x, _952);
    float _966 = _958 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _968 = fma(_940, (*spvDescriptorSet0.vp_c10)._m0[8].z, _960);
    float _970 = _956 + _962;
    float _972 = _934 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _974 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[5].z, _964);
    float _976 = _966 + _968;
    float _978 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _980 = _970 + _978;
    float _982 = fma(_944, (*spvDescriptorSet0.vp_c10)._m0[9].x, _972);
    float _984 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _986 = _976 + _984;
    float _988 = _980 * _980;
    float _990 = fma(_940, (*spvDescriptorSet0.vp_c10)._m0[9].z, _982);
    float _992 = fma(_986, _986, _988);
    float _994 = _974 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _996 = sqrt(_992);
    float _998 = _994 + _990;
    bool _1000 = _996 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1002 = _934;
    float _1004 = _976;
    float _1006 = _970;
    float _1008 = _996;
    float _1010 = _980;
    float _1012 = _838;
    float _1014 = _890;
    if (!_1000)
    {
        _1002 = _998;
    }
    float _1016 = _1002;
    bool _1018 = !_1000;
    float _1020 = _1016;
    if (!_1018)
    {
        float _1022 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1024 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1026 = _996 + _1024;
        float _1028 = rsqrt(_992);
        float _1030 = _1026 * _1022;
        float _1032 = _998 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1034 = _1030 * 0.15915493667125701904296875;
        float _1036 = _1034 * 6.283185482025146484375;
        float _1038 = sin(_1036);
        float _1040 = _1034 * 6.283185482025146484375;
        float _1042 = cos(_1040);
        float _1044 = fma(_1038, _1032, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1046 = _1028 * _1044;
        float _1048 = _1042 + (-1.0);
        float _1050 = fma(_986, _1046, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1052 = fma(_980, _1046, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1054 = _1048 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1056 = fma(_998, _1042, _1054);
        _1004 = _1050;
        _1020 = _1056;
        _1006 = _1052;
    }
    float _1058 = _1004;
    float _1060 = _1020;
    float _1062 = _1006;
    float _1064 = _1060;
    float _1066 = _1058;
    float _1068 = _1062;
    if (!_862)
    {
        float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1072 = _994 + _1070;
        float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1076 = _966 + _1074;
        float _1078 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1080 = -_966;
        float _1082 = _1080 + _1058;
        float _1084 = _1072 * _1072;
        float _1086 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1088 = _956 + _1086;
        float _1090 = -_994;
        float _1092 = _1090 + _1060;
        float _1094 = -_956;
        float _1096 = _1094 + _1062;
        float _1098 = fma(_1076, _1076, _1084);
        float _1100 = fma(_1088, _1088, _1098);
        float _1102 = sqrt(_1100);
        float _1104 = precise::min(_1102, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1106 = _1104 * _1078;
        float _1108 = fma(_1082, _1106, _966);
        float _1110 = fma(_1092, _1106, _994);
        float _1112 = fma(_1096, _1106, _956);
        _1064 = _1110;
        _1066 = _1108;
        _1068 = _1112;
    }
    float _1114 = _1064;
    float _1116 = _1066;
    float _1118 = _1068;
    float _1120 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1122 = _1114 + _1120;
    float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1126 = _1116 + _1124;
    float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1130 = _1118 + _1128;
    float _1132 = _1122 * _1122;
    float _1134 = fma(_1126, _1126, _1132);
    float _1136 = fma(_1130, _1130, _1134);
    float _1138 = rsqrt(_1136);
    float _1140 = sqrt(_1136);
    float _1142 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1144 = _1126 * _1142;
    float _1146 = _1130 * _1142;
    float _1148 = _1144 * _1144;
    float _1150 = _1146 * _1146;
    float _1152 = _1148 + _1150;
    float _1154 = sqrt(_1152);
    bool _1156 = _1154 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1158 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1160 = _1154 + _1158;
    float _1162 = _1138;
    float _1164 = _1160;
    float _1166 = _1122;
    float _1168 = _1142;
    if (_1156)
    {
        float _1170 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1162 = _1170;
    }
    float _1172 = _1162;
    if (_1156)
    {
        float _1174 = rsqrt(_1152);
        _1008 = _1174;
    }
    float _1176 = _1008;
    float _1178 = _1176;
    if (_1156)
    {
        float _1180 = _1160 * _1172;
        _1164 = _1180;
    }
    float _1182 = _1164;
    if (_1156)
    {
        float _1184 = _1182 * 0.15915493667125701904296875;
        _1010 = _1184;
    }
    float _1186 = _1010;
    float _1188 = _1172;
    if (_1156)
    {
        float _1190 = _1186 * 6.283185482025146484375;
        float _1192 = sin(_1190);
        _1188 = _1192;
    }
    float _1194 = _1188;
    float _1196 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1198 = precise::max(0.0, _1196);
    float _1200 = _1130;
    float _1202 = _1198;
    if (_1156)
    {
        float _1204 = _1186 * 6.283185482025146484375;
        float _1206 = cos(_1204);
        _1200 = _1206;
    }
    float _1208 = _1200;
    float _1210 = -_1142;
    float _1212 = -_1198;
    float _1214 = fma(_1122, _1210, _1212);
    if (!_1156)
    {
        _1166 = _1146;
    }
    float _1216 = _1166;
    float _1218 = _1216;
    if (_1156)
    {
        float _1220 = _1214 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1202 = _1220;
    }
    float _1222 = _1202;
    float _1224 = _1194;
    float _1226 = _1222;
    if (_1156)
    {
        float _1228 = fma(_1194, _1222, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1224 = _1228;
    }
    float _1230 = _1224;
    float _1232 = _1230;
    float _1234 = _1208;
    if (_1156)
    {
        float _1236 = _1208 + (-1.0);
        _1226 = _1236;
    }
    float _1238 = _1226;
    float _1240 = 0.0;
    float _1242 = _1238;
    if (_1156)
    {
        float _1244 = _1176 * _1230;
        _1240 = _1244;
    }
    float _1246 = _1240;
    if (!_1156)
    {
        _1178 = _1144;
    }
    float _1248 = _1178;
    float _1250 = _1248;
    if (_1156)
    {
        float _1252 = _1238 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1168 = _1252;
    }
    float _1254 = _1168;
    if (_1156)
    {
        float _1256 = _1144 * _1246;
        _1250 = _1256;
    }
    float _1258 = _1250;
    if (!_1156)
    {
        _1232 = _1214;
    }
    float _1260 = _1232;
    float _1262 = _1260;
    if (_1156)
    {
        float _1264 = _1146 * _1246;
        _1218 = _1264;
    }
    float _1266 = _1218;
    if (!_1156)
    {
        _1242 = _1148;
    }
    float _1268 = _1242;
    float _1270 = _1268;
    if (_1156)
    {
        float _1272 = fma(_1214, _1208, _1254);
        _1262 = _1272;
    }
    float _1274 = _1262;
    if (_1156)
    {
        float _1276 = _1258 * _1258;
        _1270 = _1276;
    }
    float _1278 = _1270;
    if (!_1156)
    {
        _1234 = _1150;
    }
    float _1280 = _1234;
    float _1282 = _1280;
    if (_1156)
    {
        float _1284 = _1266 * _1266;
        _1282 = _1284;
    }
    float _1286 = _1282;
    float _1288 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1290 = fma(_1274, _1274, _1278);
    float _1292 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1294 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1296 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1288);
    float _1298 = _1290 + _1286;
    float _1300 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1302 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1304 = fma(_1140, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1302);
    float _1306 = precise::clamp(_1304, 0.0, 1.0);
    float _1308 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1296);
    float _1310 = rsqrt(_1298);
    float _1312 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1300);
    float _1314 = -_1306;
    float _1316 = _1314 + 1.0;
    float _1318 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1320 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1294);
    float _1322 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1312);
    float _1324 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1326 = _1318 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1328 = abs(_1316);
    float _1330 = log2(_1328);
    float _1332 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1320);
    float _1334 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1336 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1324);
    float _1338 = -_1326;
    float _1340 = fma(_1338, _1292, 1.0);
    float _1342 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1344 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1346 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1336);
    float _1348 = _1310 * _1258;
    float _1350 = _1310 * _1274;
    float _1352 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1344);
    float _1354 = _1310 * _1266;
    float _1356 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1358 = _1346 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1360 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1352);
    float _1362 = log2(_1340);
    float _1364 = -_1356;
    float _1366 = fma(_1350, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1364);
    float _1368 = _1330 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1370 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1360);
    float _1372 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1374 = -_1354;
    float _1376 = fma(_1374, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1366);
    float _1378 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1380 = exp2(_1368);
    float _1382 = fma(_1376, -0.5, 0.5);
    float _1384 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1378);
    float _1386 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1372);
    float _1388 = fma(_1376, 0.5, 0.5);
    float _1390 = _1350 + 1.0;
    float _1392 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1384);
    float _1394 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1386);
    float _1396 = 1.0 / _1370;
    float _1398 = fma(_1388, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1400 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1392);
    float _1402 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1394);
    float _1404 = _1362 * 0.693147182464599609375;
    float _1406 = fma(_1388, _1398, -0.212114393711090087890625);
    float _1408 = sqrt(_1382);
    float _1410 = -_1350;
    float _1412 = fma(_1380, _1390, _1410);
    float _1414 = fma(_1388, _1406, 1.570728778839111328125);
    float _1416 = _1404 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1418 = fma(_1412, 0.5, 0.5);
    float _1420 = _1400 * _1396;
    float _1422 = _1402 * _1396;
    float _1424 = fma(_1420, 0.5, 0.5);
    float _1426 = fma(_1422, -0.5, 0.5);
    float _1428 = _1408 * 0.636619746685028076171875;
    float3 _4291 = float3(_1424, _1426, _1416);
    float _1430 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4291, float3(0.0), isnan(_4291)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4291, float3(0.0), isnan(_4291)), level(0.0)).x;
    float _1432 = -_1414;
    float _1434 = fma(_1428, _1432, 1.0);
    float3 _4307 = float3(_1424, _1426, _1416);
    float4 _1437 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4307, float3(0.0), isnan(_4307)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4307, float3(0.0), isnan(_4307)), level(0.0)).xyzw;
    float _1439 = _1437.x;
    float _1441 = _1437.y;
    float _1443 = _1437.z;
    float _1445 = _1437.w;
    float2 _4324 = float2(_1434, _1418);
    float3 _1449 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4324, float2(0.0), isnan(_4324)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4324, float2(0.0), isnan(_4324)), level(0.0)).xyz;
    float _1451 = _1449.x;
    float _1453 = _1449.y;
    float _1455 = _1449.z;
    float _1457 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1459 = _568 + _1457;
    float _1461 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1463;
    float _1467 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1461);
    float _1469 = _994 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1471 = _994 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1473 = _836 != 0.0;
    bool _1475 = isnan(_836);
    bool _1477 = _1473 || _1475;
    bool _1479 = isnan(0.0);
    bool _1481 = _1477 || _1479;
    float _1483 = 1.0 / _1465;
    float _1485 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1469);
    bool _1487 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1489 = isnan(0.5);
    bool _1491 = _1487 || _1489;
    bool _1493 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1495 = _1491 || _1493;
    float _1497 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1467);
    bool _1499 = _834 == 0.0;
    bool _1501 = !_1481;
    bool _1503 = _1499 && _1501;
    float _1505 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1485);
    bool _1507 = _568 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1509 = isnan(_568);
    bool _1511 = _1507 || _1509;
    bool _1513 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1515 = _1511 || _1513;
    float _1517 = float(_1515);
    bool _1519 = _838 == 0.0;
    bool _1521 = _1519 && _1503;
    float _1523 = _1505 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1525 = 1.0 / _1523;
    float _1527 = _1459 * _1483;
    float _1529 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1531 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1529;
    float _1533 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1535 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1533;
    float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1539 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1537;
    float _1541 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1471);
    float _1543 = fma(_1531, _1527, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1545 = _568 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1547 = isnan(_568);
    bool _1549 = _1545 || _1547;
    bool _1551 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1553 = _1549 || _1551;
    float _1555 = float(_1553);
    float _1557 = fma(_1535, _1527, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1559 = in.m_61.x;
    float _1561 = in.m_61.y;
    float _1563 = in.m_61.z;
    float _1565 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1541);
    float _1567 = fma(_1539, _1527, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1569 = -_1555;
    float _1571 = _1569 + 1.0;
    float _1573 = _1565 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1575 = _1517 * _1571;
    float _1577 = -_1517;
    float _1579 = _1577 + 1.0;
    float _1581 = _1573 + _1523;
    float _1583 = _1557 * _1575;
    float _1585 = _1543 * _1575;
    float _1587 = _1567 * _1575;
    float _1589 = _1581 * _1525;
    float _1591 = _1589 * 0.5;
    float _1593 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1583);
    float _1595 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1585);
    float _1597 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1587);
    float _1599 = fma(_1555, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1593);
    float _1601 = fma(_1555, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1595);
    float _1603 = fma(_1555, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1597);
    float _1605 = _1599 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1607 = _1563;
    float _1609 = _1559;
    float _1611 = _1561;
    float _1613 = _1370;
    if (!_1521)
    {
        float _1615 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1563);
        _1607 = _1615;
    }
    float _1617 = _1607;
    if (!_1521)
    {
        float _1619 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1559);
        _1609 = _1619;
    }
    float _1621 = _1609;
    if (!_1521)
    {
        float _1623 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1561);
        _1611 = _1623;
    }
    float _1625 = _1611;
    float _1627 = _1330 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1629 = _890 * _1617;
    float _1631 = _1625;
    if (!_1495)
    {
        _1012 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1633 = _1012;
    float _1635 = _1601 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1637 = _1603 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1639 = fma(_904, _1621, _1629);
    float _1641 = _916 * _1617;
    float _1643 = _912 * _1617;
    float _1645 = exp2(_1627);
    float _1647 = fma(_888, _1625, _1639);
    float _1649 = fma(_910, _1621, _1641);
    float _1651 = _1643;
    if (!_1495)
    {
        float _1653 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1655 = fma(_1591, _1633, _1653);
        _1014 = _1655;
    }
    float _1657 = _1014;
    float _1659 = fma(_922, _1621, _1643);
    float _1661 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1497);
    float _1663 = -_1625;
    float _1665 = fma(_896, _1663, _1649);
    float _1667 = _1647 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1669 = _1661;
    if (!_1495)
    {
        _1651 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1671 = _1651;
    float _1673 = _1635 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1675 = _1605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1677 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1679 = _1647 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1681 = _1647 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1683 = _1661 + _1370;
    float _1685 = -_1625;
    float _1687 = fma(_906, _1685, _1659);
    float _1689 = -_1645;
    float _1691 = _1689 + 1.0;
    float _1693 = fma(_1665, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1667);
    float _1695 = fma(_1665, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1679);
    float _1697 = fma(_1665, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1681);
    float _1699 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1400;
    out.gl_Position.y = _1402;
    out.gl_Position.z = _1661;
    out.gl_Position.w = _1370;
    float _1701 = _1697;
    float _1703 = _1671;
    if (!_1495)
    {
        float _1705 = -_1671;
        float _1707 = _1705 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1631 = _1707;
    }
    float _1709 = _1631;
    float _1711 = _1657;
    if (!_1495)
    {
        float _1713 = 1.0 / _1657;
        _1711 = _1713;
    }
    float _1715 = _1711;
    float _1717 = fma(_1687, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1695);
    out.m_63.x = _1673;
    out.m_63.y = _1675;
    out.m_63.z = _1677;
    bool _1719 = _1140 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1721 = isnan(_1140);
    bool _1723 = _1719 || _1721;
    bool _1725 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1727 = _1723 || _1725;
    float _1729 = _1709;
    if (!_1495)
    {
        float _1731 = 1.0 / _1709;
        _1729 = _1731;
    }
    float _1733 = _1729;
    float _1735 = -_1699;
    float _1737 = _1735 + 1.0;
    float _1739 = _1683 * 0.5;
    float _1741 = fma(_1687, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1693);
    float _1743 = fma(_1687, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1697);
    float _1745 = _1737;
    if (!_1495)
    {
        float _1747 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1749 = -_1671;
        float _1751 = fma(_1715, _1747, _1749);
        _1701 = _1751;
    }
    float _1753 = _1701;
    float _1755 = _1753;
    if (!_1727)
    {
        _1703 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1757 = _1703;
    out.m_65.x = _1717;
    out.m_65.y = _1741;
    out.m_65.z = _1743;
    float _1759 = _1757;
    float _1761 = _1757;
    if (!_1727)
    {
        _1613 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1763 = _1613;
    float _1765 = _1733;
    float _1767 = _1763;
    float _1769 = _1763;
    if (!_1495)
    {
        float _1771 = _1753 * _1733;
        float _1773 = precise::clamp(_1771, 0.0, 1.0);
        _1755 = _1773;
    }
    float _1775 = _1755;
    out.m_67.z = _1739;
    out.m_67.w = _1370;
    float _1777 = _1775;
    if (!_1727)
    {
        _1765 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1779 = _1765;
    float _1781 = _1779;
    float _1783 = _1779;
    if (!_1727)
    {
        _1669 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1785 = _1669;
    float _1787 = _1699 * _1430;
    float _1789 = _1445 * _1787;
    float _1791 = _1445 * _1737;
    float _1793 = _1789;
    float _1795 = _1785;
    float _1797 = _1785;
    if (_1495)
    {
        _1745 = 1.0;
    }
    float _1799 = _1745;
    float _1801 = _1799;
    if (!_1495)
    {
        float _1803 = -_1775;
        float _1805 = _1803 + 1.0;
        _1801 = _1805;
    }
    float _1807 = _1801;
    float _1809 = _1455 * _1787;
    float _1811 = fma(_1451, _1789, _1439);
    float _1813 = fma(_1453, _1789, _1441);
    float _1815 = _1807 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1817 = fma(_1445, _1809, _1443);
    if (!_1727)
    {
        _1777 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1819 = _1777;
    float _1821 = _1819;
    float _1823 = _1819;
    if (!_1727)
    {
        _1793 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1825 = _1793;
    out.m_69.x = _1811;
    out.m_69.y = _1813;
    out.m_69.z = _1817;
    out.m_69.w = _1791;
    bool _1827 = !_1727;
    float _1829 = _1825;
    float _1831 = _1825;
    if (!_1827)
    {
        bool _1833 = _1140 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1835 = isnan(_1140);
        bool _1837 = _1833 || _1835;
        bool _1839 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1841 = _1837 || _1839;
        if (!_1841)
        {
            float _1843 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1845 = _1140 + _1843;
            float _1847 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1849 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1847;
            float _1851 = 1.0 / _1849;
            float _1853 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1855 = _1853 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1857 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1859 = _1857 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1863 = _1861 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1865 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1867 = _1865 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1871 = _1869 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1873 = _1845 * _1851;
            float _1875 = precise::clamp(_1873, 0.0, 1.0);
            float _1877 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1879 = _1877 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1881 = fma(_1875, _1855, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1883 = fma(_1875, _1879, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1885 = fma(_1875, _1859, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1887 = fma(_1875, _1863, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1889 = fma(_1875, _1867, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1891 = fma(_1875, _1871, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1783 = _1883;
            _1797 = _1889;
            _1761 = _1881;
            _1769 = _1887;
            _1823 = _1885;
            _1831 = _1891;
            _1893 = true;
        }
        else
        {
            bool _1895 = _1140 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1897 = isnan(_1140);
            bool _1899 = _1895 || _1897;
            bool _1901 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1903 = _1899 || _1901;
            if (!_1903)
            {
                _1759 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1905 = _1759;
            _1761 = _1905;
            if (!_1903)
            {
                _1781 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1907 = _1781;
            _1783 = _1907;
            if (!_1903)
            {
                _1821 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1909 = _1821;
            _1823 = _1909;
            if (!_1903)
            {
                _1767 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1911 = _1767;
            _1769 = _1911;
            if (!_1903)
            {
                _1795 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1913 = _1795;
            _1797 = _1913;
            if (!_1903)
            {
                _1829 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1915 = _1829;
            bool _1917 = !_1903;
            _1831 = _1915;
            if (!_1917)
            {
                bool _1919 = _1140 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1921 = isnan(_1140);
                bool _1923 = _1919 || _1921;
                bool _1925 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1927 = _1923 || _1925;
                if (!_1927)
                {
                    float _1929 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1931 = _1140 + _1929;
                    float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1935 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1933;
                    float _1937 = 1.0 / _1935;
                    float _1939 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1941 = _1939 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1943 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1945 = _1943 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1947 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1949 = _1947 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1951 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1953 = _1951 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1957 = _1955 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1959 = _1931 * _1937;
                    float _1961 = precise::clamp(_1959, 0.0, 1.0);
                    float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1965 = _1963 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1967 = fma(_1961, _1941, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1969 = fma(_1961, _1965, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1971 = fma(_1961, _1945, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1973 = fma(_1961, _1949, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1975 = fma(_1961, _1953, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1977 = fma(_1961, _1957, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1783 = _1969;
                    _1797 = _1975;
                    _1761 = _1967;
                    _1769 = _1973;
                    _1823 = _1971;
                    _1831 = _1977;
                    _1893 = true;
                }
                else
                {
                    _1783 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1797 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1761 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1769 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1823 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1831 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1893 = false;
    float _1979 = _1783;
    float _1981 = _1797;
    float _1983 = _1761;
    float _1985 = _1769;
    float _1987 = _1823;
    float _1989 = _1831;
    float _1991 = _1815 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1993 = fma(_1741, -0.5, 0.5);
    float _1995 = precise::clamp(_1993, 0.0, 1.0);
    float _1997 = -_1979;
    float _1999 = _1997 + _1981;
    float _2001 = -_1983;
    float _2003 = _2001 + _1985;
    out.m_47.x = _1991;
    float _2005 = -_1987;
    float _2007 = _2005 + _1989;
    float _2009 = fma(_1995, _1999, _1979);
    float _2011 = fma(_1995, _2003, _1983);
    bool _2013 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2015 = _2009 * 0.586610972881317138671875;
    float _2017 = fma(_1995, _2007, _1987);
    out.m_71.x = 0.0;
    bool _2019 = _1807 > 0.0;
    bool _2021 = isnan(_1807);
    bool _2023 = _2019 || _2021;
    bool _2025 = isnan(0.0);
    bool _2027 = _2023 || _2025;
    float _2029 = fma(_2011, 0.298911988735198974609375, _2015);
    float _2031 = fma(_2017, 0.114477999508380889892578125, _2029);
    float _2033 = -_2031;
    float _2035 = _2011 + _2033;
    float _2037 = -_2031;
    float _2039 = _2009 + _2037;
    float _2041 = -_2031;
    float _2043 = _2017 + _2041;
    float _2045 = fma(_2035, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2031);
    float _2047 = fma(_2039, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2031);
    float _2049 = fma(_2043, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2031);
    bool _2051 = !_2013;
    if (!_2051)
    {
        float _2053 = -_1114;
        float _2055 = _2053 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2057 = -_1116;
        float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2061 = -_1118;
        float _2063 = _2061 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2065 = _2055 * _2055;
        float _2067 = fma(_2059, _2059, _2065);
        float _2069 = fma(_2063, _2063, _2067);
        float _2071 = sqrt(_2069);
        float _2073 = rsqrt(_2069);
        float _2075 = -_2071;
        float _2077 = _2075 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2079 = _2077 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2081 = precise::clamp(_2079, 0.0, 1.0);
        float _2083 = _2059 * _2073;
        float _2085 = _2055 * _2073;
        float _2087 = abs(_2081);
        float _2089 = log2(_2087);
        float _2091 = _2063 * _2073;
        float _2093 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2095 = _1741 * _2085;
        float _2097 = -_2085;
        float _2099 = -_2093;
        float _2101 = fma(_2097, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2099);
        float _2103 = fma(_1717, _2083, _2095);
        float _2105 = -_2091;
        float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2101);
        float _2109 = fma(_1743, _2091, _2103);
        float _2111 = precise::clamp(_2109, 0.0, 1.0);
        float _2113 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2115 = _2107 + _2113;
        float _2117 = _2089 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2119 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2121 = precise::clamp(_2119, 0.0, 1.0);
        float _2123 = exp2(_2117);
        float _2125 = _2123 * _2121;
        float _2127 = _2111 * _2125;
        float _2129 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2131 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2133 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_71.x = _2129;
        out.m_71.y = _2131;
        out.m_71.z = _2133;
    }
    out.m_73.x = _2045;
    out.m_73.y = _2047;
    out.m_73.z = _2049;
    if (_2027)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2135 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2135;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1893 = false;
    bool _560 = false;
    bool _312 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2192 = as_type<float>(_108);
        out.gl_Position.z = _2192;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = _126;
    if (_122)
    {
        float _130 = float(_92);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2262 = as_type<float>(_146);
        out.gl_Position.z = _2262;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_51.w;
    float _150 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_49.x;
    float _164 = in.m_49.y;
    float _166 = in.m_49.z;
    float _168 = in.m_44.x;
    float _170 = in.m_44.y;
    float _172 = in.m_44.z;
    float _174 = 0.0;
    if (!_160)
    {
        float _176 = _150 * _150;
        float _178 = _176 * 0.5;
        _174 = _178;
    }
    float _180 = _174;
    float _182 = _180;
    if (!_160)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_160;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _150 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _150);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _226 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _228 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _230 = _224 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _232 = _224 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _234 = _224 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _236 = fma(_226, (*spvDescriptorSet0.vp_c10)._m0[8].x, _230);
    float _238 = fma(_226, (*spvDescriptorSet0.vp_c10)._m0[8].y, _232);
    float _240 = fma(_226, (*spvDescriptorSet0.vp_c10)._m0[8].z, _234);
    float _242 = _226;
    if (!_160)
    {
        _242 = _150;
    }
    float _244 = _242;
    float _246 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[10].x, _236);
    bool _248 = !_160;
    float _250 = _244;
    if (!_248)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _150 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _250 = _270;
    }
    float _272 = _250;
    bool _274 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _276 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[10].y, _238);
    float _278 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[10].z, _240);
    float _280 = fma(_272, _162, _246);
    float _282 = fma(_272, _164, _276);
    float _284 = fma(_272, _166, _278);
    float _286 = fma(_280, _148, _168);
    float _288 = fma(_282, _148, _170);
    float _290 = fma(_284, _148, _172);
    bool _292 = !_274;
    float _310;
    if (!_292)
    {
        float _294 = in.m_53.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        float _314 = float(_92);
        float _316 = 1.0 / _314;
        float _318 = _126 * _316;
        _310 = _318;
    }
    _312 = false;
    float _320 = _310;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _324 = _320 + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _334;
    float _338 = 1.0 / _328;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _346 = _340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _348 = 1.0 / _332;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _352 = _342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _354 = _344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _358 = _320 + _356;
    float _360 = 1.0 / _336;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _364 = _320 + _362;
    float _366 = _358 * _338;
    out.m_55.x = _346;
    out.m_55.y = _352;
    out.m_55.z = _354;
    out.m_55.w = _350;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _368;
    bool _372 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _374 = isnan(_320);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = _364 * _348;
    bool _386 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _388 = isnan(_320);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _398;
    bool _402 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _404 = _324 * _360;
    bool _406 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _408 = isnan(_320);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = -_396;
    float _420 = _418 + 1.0;
    bool _422 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _424 = isnan(_320);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = fma(_370, _366, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _436 = fma(_400, _366, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _438 = _416 * _420;
    float _440 = -_416;
    float _442 = _440 + 1.0;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _456 = -_432;
    float _458 = _456 + 1.0;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _460;
    float _464 = _432 * _442;
    float _466 = fma(_446, _384, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _468 = fma(_450, _384, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _470 = fma(_454, _384, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _472 = _382 * _458;
    float _474 = fma(_462, _366, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _476 = in.m_51.x;
    float _478 = in.m_51.y;
    float _480 = in.m_51.z;
    float _482 = _434 * _472;
    float _484 = _436 * _472;
    float _486 = -_382;
    float _488 = _486 + 1.0;
    float _490 = _474 * _472;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _492;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _496;
    float _500 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[143].x, _482);
    float _502 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[143].y, _484);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _504;
    float _508 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[143].z, _490);
    float _510 = fma(_494, _404, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _512 = fma(_498, _404, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _514 = fma(_506, _404, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _516 = fma(_466, _464, _500);
    float _518 = fma(_468, _464, _502);
    float _520 = fma(_470, _464, _508);
    float _522 = fma(_510, _438, _516);
    float _524 = fma(_512, _438, _518);
    float _526 = fma(_514, _438, _520);
    float _528 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[146].x, _522);
    float _530 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[146].y, _524);
    float _532 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[146].z, _526);
    float _534 = _528 * _476;
    float _536 = _530 * _478;
    float _538 = _532 * _480;
    bool _540 = !_402;
    float _558;
    if (!_540)
    {
        float _542 = in.m_53.x;
        float _544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _546 = _542 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _548 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[11].z, _126);
        float _550 = _548 * _544;
        float _552 = floor(_550);
        float _554 = -_552;
        float _556 = _550 + _554;
        _558 = _556;
        _560 = true;
    }
    else
    {
        float _562 = float(_92);
        float _564 = 1.0 / _562;
        float _566 = _126 * _564;
        _558 = _566;
    }
    _560 = false;
    float _568 = _558;
    float _570 = in.m_53.x;
    float _572 = in.m_53.y;
    float _574 = in.m_53.z;
    float _576 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _578 = log2(_576);
    float _580 = _536 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _582 = _538 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _586 = _584 != 0;
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _590 = _588 != 0;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _594 = _592 != 0;
    float _596 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _598 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _600 = isnan(0.0);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _606 = _602 || _604;
    float _608 = _578 * _126;
    float _610 = exp2(_608);
    float _612 = _570 * 2.0;
    float _614 = _572 * 2.0;
    float _616 = _572 + _574;
    float _618 = _574 + _570;
    float _620 = _574 * 2.0;
    float _622 = floor(_614);
    float _624 = _574 + (-0.5);
    float _626 = _618 + (-1.0);
    float _628 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _630 = floor(_612);
    float _632 = -_610;
    float _634 = _632 + 1.0;
    float _636 = _606 ? _634 : 0.0;
    bool _638 = _622 >= 0.0;
    bool _640 = isnan(_622);
    bool _642 = _638 || _640;
    bool _644 = isnan(0.0);
    bool _646 = _642 || _644;
    float _648 = floor(_620);
    int _650 = _646 ? 0 : 1;
    bool _652 = _630 > 0.0;
    bool _654 = _630 >= 0.0;
    bool _656 = isnan(_630);
    bool _658 = _654 || _656;
    bool _660 = isnan(0.0);
    bool _662 = _658 || _660;
    float _664 = _616 + (-1.0);
    float _666 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _668 = _662 ? 0 : 1;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _672 = 1.0 + _670;
    bool _674 = _622 > 0.0;
    int _676 = ~_668;
    int _678 = _676 + 1;
    int _680 = _678 + 1;
    float _682 = 1.0 / _672;
    int _684 = _680;
    if (!_652)
    {
        int _686 = ~_668;
        int _688 = _686 + 1;
        _684 = _688;
    }
    int _690 = _684;
    float _692 = in.m_57.x;
    float _694 = in.m_57.y;
    float _696 = in.m_57.z;
    bool _698 = !_590;
    int _700 = _698 ? 0 : 1;
    bool _702 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _704 = isnan(1.0);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _710 = _706 || _708;
    int _712 = abs(_700);
    float _714 = float(_690);
    float _716 = float(_712);
    bool _718 = _648 > 0.0;
    bool _720 = _648 >= 0.0;
    bool _722 = isnan(_648);
    bool _724 = _720 || _722;
    bool _726 = isnan(0.0);
    bool _728 = _724 || _726;
    float _730 = _716 * _714;
    int _732 = ~_650;
    int _734 = _732 + 1;
    int _736 = _734 + 1;
    int _738 = _736;
    if (_710)
    {
        float _740 = _636 * _682;
        _128 = _740;
    }
    float _742 = _128;
    if (!_674)
    {
        int _744 = ~_650;
        int _746 = _744 + 1;
        _738 = _746;
    }
    int _748 = _738;
    float _750 = _730 * (-2.0);
    bool _752 = !_594;
    int _754 = _752 ? 0 : 1;
    float _756 = _572 + (-0.5);
    bool _758 = !_586;
    int _760 = _758 ? 0 : 1;
    float _762 = fma(_666, _750, _666);
    int _764 = abs(_754);
    float _766 = fma(_750, _694, _694);
    int _768 = _728 ? 0 : 1;
    float _770 = _572 + _570;
    int _772 = abs(_760);
    float _774 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[196].y, _766);
    float _776 = float(_764);
    float _778 = _770 + (-1.0);
    float _780 = float(_748);
    float _782 = fma(_762, _742, _774);
    int _784 = ~_768;
    int _786 = _784 + 1;
    int _788 = _786 + 1;
    float _790 = _782 * 0.15915493667125701904296875;
    int _792 = _788;
    if (!_718)
    {
        int _794 = ~_768;
        int _796 = _794 + 1;
        _792 = _796;
    }
    int _798 = _792;
    float _800 = _776 * _780;
    float _802 = float(_772);
    float _804 = _790 * 6.283185482025146484375;
    float _806 = sin(_804);
    float _808 = float(_798);
    float _810 = _800 * (-2.0);
    float _812 = _570 + (-0.5);
    float _814 = _802 * _808;
    float _816 = fma(_810, _696, _696);
    float _818 = fma(_628, _810, _628);
    float _820 = _814 * (-2.0);
    float _822 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[196].z, _816);
    float _824 = _790 * 6.283185482025146484375;
    float _826 = cos(_824);
    float _828 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _830 = fma(_820, _692, _692);
    float _832 = fma(_818, _742, _822);
    float _834 = in.m_59.x;
    float _836 = in.m_59.y;
    float _838 = in.m_59.z;
    float _840 = fma(_828, _820, _828);
    float _842 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[196].x, _830);
    float _844 = _832 * 0.15915493667125701904296875;
    float _846 = fma(_840, _742, _842);
    float _848 = _844 * 6.283185482025146484375;
    float _850 = cos(_848);
    float _852 = _846 * 0.15915493667125701904296875;
    bool _854 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _856 = isnan(0.5);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _862 = _858 || _860;
    float _864 = _852 * 6.283185482025146484375;
    float _866 = cos(_864);
    float _868 = _844 * 6.283185482025146484375;
    float _870 = sin(_868);
    float _872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _836);
    float _874 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _838);
    float _876 = _826 * _850;
    float _878 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _834);
    float _880 = _580 * _872;
    float _882 = _806 * _850;
    float _884 = _582 * _874;
    float _886 = _852 * 6.283185482025146484375;
    float _888 = sin(_886);
    float _890 = _866 * _850;
    float _892 = _596 * _878;
    float _894 = _288 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _896 = _866 * _806;
    float _898 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].x, _894);
    float _900 = _806 * _870;
    float _902 = _826 * _870;
    float _904 = _866 * _870;
    float _906 = _866 * _826;
    float _908 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[6].z, _898);
    float _910 = fma(_888, _900, _876);
    float _912 = fma(_888, _876, _900);
    float _914 = -_902;
    float _916 = fma(_888, _882, _914);
    float _918 = _890 * _884;
    float _920 = -_882;
    float _922 = fma(_888, _902, _920);
    float _924 = _912 * _884;
    float _926 = _916 * _884;
    float _928 = fma(_904, _892, _918);
    float _930 = fma(_922, _892, _924);
    float _932 = fma(_910, _892, _926);
    float _934 = fma(_888, _880, _928);
    float _936 = _288 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _938 = -_880;
    float _940 = fma(_906, _938, _930);
    float _942 = -_880;
    float _944 = fma(_896, _942, _932);
    float _946 = _934 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _948 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].x, _936);
    float _950 = _934 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _952 = _288 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _954 = fma(_944, (*spvDescriptorSet0.vp_c10)._m0[10].x, _946);
    float _956 = _908 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _958 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[4].z, _948);
    float _960 = fma(_944, (*spvDescriptorSet0.vp_c10)._m0[8].x, _950);
    float _962 = fma(_940, (*spvDescriptorSet0.vp_c10)._m0[10].z, _954);
    float _964 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].x, _952);
    float _966 = _958 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _968 = fma(_940, (*spvDescriptorSet0.vp_c10)._m0[8].z, _960);
    float _970 = _956 + _962;
    float _972 = _934 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _974 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[5].z, _964);
    float _976 = _966 + _968;
    float _978 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _980 = _970 + _978;
    float _982 = fma(_944, (*spvDescriptorSet0.vp_c10)._m0[9].x, _972);
    float _984 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _986 = _976 + _984;
    float _988 = _980 * _980;
    float _990 = fma(_940, (*spvDescriptorSet0.vp_c10)._m0[9].z, _982);
    float _992 = fma(_986, _986, _988);
    float _994 = _974 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _996 = sqrt(_992);
    float _998 = _994 + _990;
    bool _1000 = _996 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1002 = _934;
    float _1004 = _976;
    float _1006 = _970;
    float _1008 = _996;
    float _1010 = _980;
    float _1012 = _838;
    float _1014 = _890;
    if (!_1000)
    {
        _1002 = _998;
    }
    float _1016 = _1002;
    bool _1018 = !_1000;
    float _1020 = _1016;
    if (!_1018)
    {
        float _1022 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1024 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1026 = _996 + _1024;
        float _1028 = rsqrt(_992);
        float _1030 = _1026 * _1022;
        float _1032 = _998 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1034 = _1030 * 0.15915493667125701904296875;
        float _1036 = _1034 * 6.283185482025146484375;
        float _1038 = sin(_1036);
        float _1040 = _1034 * 6.283185482025146484375;
        float _1042 = cos(_1040);
        float _1044 = fma(_1038, _1032, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1046 = _1028 * _1044;
        float _1048 = _1042 + (-1.0);
        float _1050 = fma(_986, _1046, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1052 = fma(_980, _1046, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1054 = _1048 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1056 = fma(_998, _1042, _1054);
        _1004 = _1050;
        _1020 = _1056;
        _1006 = _1052;
    }
    float _1058 = _1004;
    float _1060 = _1020;
    float _1062 = _1006;
    float _1064 = _1060;
    float _1066 = _1058;
    float _1068 = _1062;
    if (!_862)
    {
        float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1072 = _994 + _1070;
        float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1076 = _966 + _1074;
        float _1078 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1080 = -_966;
        float _1082 = _1080 + _1058;
        float _1084 = _1072 * _1072;
        float _1086 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1088 = _956 + _1086;
        float _1090 = -_994;
        float _1092 = _1090 + _1060;
        float _1094 = -_956;
        float _1096 = _1094 + _1062;
        float _1098 = fma(_1076, _1076, _1084);
        float _1100 = fma(_1088, _1088, _1098);
        float _1102 = sqrt(_1100);
        float _1104 = precise::min(_1102, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1106 = _1104 * _1078;
        float _1108 = fma(_1082, _1106, _966);
        float _1110 = fma(_1092, _1106, _994);
        float _1112 = fma(_1096, _1106, _956);
        _1064 = _1110;
        _1066 = _1108;
        _1068 = _1112;
    }
    float _1114 = _1064;
    float _1116 = _1066;
    float _1118 = _1068;
    float _1120 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1122 = _1114 + _1120;
    float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1126 = _1116 + _1124;
    float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1130 = _1118 + _1128;
    float _1132 = _1122 * _1122;
    float _1134 = fma(_1126, _1126, _1132);
    float _1136 = fma(_1130, _1130, _1134);
    float _1138 = rsqrt(_1136);
    float _1140 = sqrt(_1136);
    float _1142 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1144 = _1126 * _1142;
    float _1146 = _1130 * _1142;
    float _1148 = _1144 * _1144;
    float _1150 = _1146 * _1146;
    float _1152 = _1148 + _1150;
    float _1154 = sqrt(_1152);
    bool _1156 = _1154 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1158 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1160 = _1154 + _1158;
    float _1162 = _1138;
    float _1164 = _1160;
    float _1166 = _1122;
    float _1168 = _1142;
    if (_1156)
    {
        float _1170 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1162 = _1170;
    }
    float _1172 = _1162;
    if (_1156)
    {
        float _1174 = rsqrt(_1152);
        _1008 = _1174;
    }
    float _1176 = _1008;
    float _1178 = _1176;
    if (_1156)
    {
        float _1180 = _1160 * _1172;
        _1164 = _1180;
    }
    float _1182 = _1164;
    if (_1156)
    {
        float _1184 = _1182 * 0.15915493667125701904296875;
        _1010 = _1184;
    }
    float _1186 = _1010;
    float _1188 = _1172;
    if (_1156)
    {
        float _1190 = _1186 * 6.283185482025146484375;
        float _1192 = sin(_1190);
        _1188 = _1192;
    }
    float _1194 = _1188;
    float _1196 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1198 = precise::max(0.0, _1196);
    float _1200 = _1130;
    float _1202 = _1198;
    if (_1156)
    {
        float _1204 = _1186 * 6.283185482025146484375;
        float _1206 = cos(_1204);
        _1200 = _1206;
    }
    float _1208 = _1200;
    float _1210 = -_1142;
    float _1212 = -_1198;
    float _1214 = fma(_1122, _1210, _1212);
    if (!_1156)
    {
        _1166 = _1146;
    }
    float _1216 = _1166;
    float _1218 = _1216;
    if (_1156)
    {
        float _1220 = _1214 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1202 = _1220;
    }
    float _1222 = _1202;
    float _1224 = _1194;
    float _1226 = _1222;
    if (_1156)
    {
        float _1228 = fma(_1194, _1222, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1224 = _1228;
    }
    float _1230 = _1224;
    float _1232 = _1230;
    float _1234 = _1208;
    if (_1156)
    {
        float _1236 = _1208 + (-1.0);
        _1226 = _1236;
    }
    float _1238 = _1226;
    float _1240 = 0.0;
    float _1242 = _1238;
    if (_1156)
    {
        float _1244 = _1176 * _1230;
        _1240 = _1244;
    }
    float _1246 = _1240;
    if (!_1156)
    {
        _1178 = _1144;
    }
    float _1248 = _1178;
    float _1250 = _1248;
    if (_1156)
    {
        float _1252 = _1238 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1168 = _1252;
    }
    float _1254 = _1168;
    if (_1156)
    {
        float _1256 = _1144 * _1246;
        _1250 = _1256;
    }
    float _1258 = _1250;
    if (!_1156)
    {
        _1232 = _1214;
    }
    float _1260 = _1232;
    float _1262 = _1260;
    if (_1156)
    {
        float _1264 = _1146 * _1246;
        _1218 = _1264;
    }
    float _1266 = _1218;
    if (!_1156)
    {
        _1242 = _1148;
    }
    float _1268 = _1242;
    float _1270 = _1268;
    if (_1156)
    {
        float _1272 = fma(_1214, _1208, _1254);
        _1262 = _1272;
    }
    float _1274 = _1262;
    if (_1156)
    {
        float _1276 = _1258 * _1258;
        _1270 = _1276;
    }
    float _1278 = _1270;
    if (!_1156)
    {
        _1234 = _1150;
    }
    float _1280 = _1234;
    float _1282 = _1280;
    if (_1156)
    {
        float _1284 = _1266 * _1266;
        _1282 = _1284;
    }
    float _1286 = _1282;
    float _1288 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1290 = fma(_1274, _1274, _1278);
    float _1292 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1294 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1296 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1288);
    float _1298 = _1290 + _1286;
    float _1300 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1302 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1304 = fma(_1140, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1302);
    float _1306 = precise::clamp(_1304, 0.0, 1.0);
    float _1308 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1296);
    float _1310 = rsqrt(_1298);
    float _1312 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1300);
    float _1314 = -_1306;
    float _1316 = _1314 + 1.0;
    float _1318 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1320 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1294);
    float _1322 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1312);
    float _1324 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1326 = _1318 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1328 = abs(_1316);
    float _1330 = log2(_1328);
    float _1332 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1320);
    float _1334 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1336 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1324);
    float _1338 = -_1326;
    float _1340 = fma(_1338, _1292, 1.0);
    float _1342 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1344 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1346 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1336);
    float _1348 = _1310 * _1258;
    float _1350 = _1310 * _1274;
    float _1352 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1344);
    float _1354 = _1310 * _1266;
    float _1356 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1358 = _1346 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1360 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1352);
    float _1362 = log2(_1340);
    float _1364 = -_1356;
    float _1366 = fma(_1350, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1364);
    float _1368 = _1330 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1370 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1360);
    float _1372 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1374 = -_1354;
    float _1376 = fma(_1374, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1366);
    float _1378 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1380 = exp2(_1368);
    float _1382 = fma(_1376, -0.5, 0.5);
    float _1384 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1378);
    float _1386 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1372);
    float _1388 = fma(_1376, 0.5, 0.5);
    float _1390 = _1350 + 1.0;
    float _1392 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1384);
    float _1394 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1386);
    float _1396 = 1.0 / _1370;
    float _1398 = fma(_1388, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1400 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1392);
    float _1402 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1394);
    float _1404 = _1362 * 0.693147182464599609375;
    float _1406 = fma(_1388, _1398, -0.212114393711090087890625);
    float _1408 = sqrt(_1382);
    float _1410 = -_1350;
    float _1412 = fma(_1380, _1390, _1410);
    float _1414 = fma(_1388, _1406, 1.570728778839111328125);
    float _1416 = _1404 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1418 = fma(_1412, 0.5, 0.5);
    float _1420 = _1400 * _1396;
    float _1422 = _1402 * _1396;
    float _1424 = fma(_1420, 0.5, 0.5);
    float _1426 = fma(_1422, -0.5, 0.5);
    float _1428 = _1408 * 0.636619746685028076171875;
    float3 _4291 = float3(_1424, _1426, _1416);
    float _1430 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4291, float3(0.0), isnan(_4291)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4291, float3(0.0), isnan(_4291)), level(0.0)).x;
    float _1432 = -_1414;
    float _1434 = fma(_1428, _1432, 1.0);
    float3 _4307 = float3(_1424, _1426, _1416);
    float4 _1437 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4307, float3(0.0), isnan(_4307)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4307, float3(0.0), isnan(_4307)), level(0.0)).xyzw;
    float _1439 = _1437.x;
    float _1441 = _1437.y;
    float _1443 = _1437.z;
    float _1445 = _1437.w;
    float2 _4324 = float2(_1434, _1418);
    float3 _1449 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4324, float2(0.0), isnan(_4324)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4324, float2(0.0), isnan(_4324)), level(0.0)).xyz;
    float _1451 = _1449.x;
    float _1453 = _1449.y;
    float _1455 = _1449.z;
    float _1457 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1459 = _568 + _1457;
    float _1461 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1463;
    float _1467 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1461);
    float _1469 = _994 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1471 = _994 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1473 = _836 != 0.0;
    bool _1475 = isnan(_836);
    bool _1477 = _1473 || _1475;
    bool _1479 = isnan(0.0);
    bool _1481 = _1477 || _1479;
    float _1483 = 1.0 / _1465;
    float _1485 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1469);
    bool _1487 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1489 = isnan(0.5);
    bool _1491 = _1487 || _1489;
    bool _1493 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1495 = _1491 || _1493;
    float _1497 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1467);
    bool _1499 = _834 == 0.0;
    bool _1501 = !_1481;
    bool _1503 = _1499 && _1501;
    float _1505 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1485);
    bool _1507 = _568 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1509 = isnan(_568);
    bool _1511 = _1507 || _1509;
    bool _1513 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1515 = _1511 || _1513;
    float _1517 = float(_1515);
    bool _1519 = _838 == 0.0;
    bool _1521 = _1519 && _1503;
    float _1523 = _1505 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1525 = 1.0 / _1523;
    float _1527 = _1459 * _1483;
    float _1529 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1531 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1529;
    float _1533 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1535 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1533;
    float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1539 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1537;
    float _1541 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1471);
    float _1543 = fma(_1531, _1527, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1545 = _568 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1547 = isnan(_568);
    bool _1549 = _1545 || _1547;
    bool _1551 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1553 = _1549 || _1551;
    float _1555 = float(_1553);
    float _1557 = fma(_1535, _1527, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1559 = in.m_61.x;
    float _1561 = in.m_61.y;
    float _1563 = in.m_61.z;
    float _1565 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1541);
    float _1567 = fma(_1539, _1527, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1569 = -_1555;
    float _1571 = _1569 + 1.0;
    float _1573 = _1565 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1575 = _1517 * _1571;
    float _1577 = -_1517;
    float _1579 = _1577 + 1.0;
    float _1581 = _1573 + _1523;
    float _1583 = _1557 * _1575;
    float _1585 = _1543 * _1575;
    float _1587 = _1567 * _1575;
    float _1589 = _1581 * _1525;
    float _1591 = _1589 * 0.5;
    float _1593 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1583);
    float _1595 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1585);
    float _1597 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1587);
    float _1599 = fma(_1555, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1593);
    float _1601 = fma(_1555, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1595);
    float _1603 = fma(_1555, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1597);
    float _1605 = _1599 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1607 = _1563;
    float _1609 = _1559;
    float _1611 = _1561;
    float _1613 = _1370;
    if (!_1521)
    {
        float _1615 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1563);
        _1607 = _1615;
    }
    float _1617 = _1607;
    if (!_1521)
    {
        float _1619 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1559);
        _1609 = _1619;
    }
    float _1621 = _1609;
    if (!_1521)
    {
        float _1623 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1561);
        _1611 = _1623;
    }
    float _1625 = _1611;
    float _1627 = _1330 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1629 = _890 * _1617;
    float _1631 = _1625;
    if (!_1495)
    {
        _1012 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1633 = _1012;
    float _1635 = _1601 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1637 = _1603 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1639 = fma(_904, _1621, _1629);
    float _1641 = _916 * _1617;
    float _1643 = _912 * _1617;
    float _1645 = exp2(_1627);
    float _1647 = fma(_888, _1625, _1639);
    float _1649 = fma(_910, _1621, _1641);
    float _1651 = _1643;
    if (!_1495)
    {
        float _1653 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1655 = fma(_1591, _1633, _1653);
        _1014 = _1655;
    }
    float _1657 = _1014;
    float _1659 = fma(_922, _1621, _1643);
    float _1661 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1497);
    float _1663 = -_1625;
    float _1665 = fma(_896, _1663, _1649);
    float _1667 = _1647 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1669 = _1661;
    if (!_1495)
    {
        _1651 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1671 = _1651;
    float _1673 = _1635 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1675 = _1605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1677 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1679 = _1647 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1681 = _1647 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1683 = _1661 + _1370;
    float _1685 = -_1625;
    float _1687 = fma(_906, _1685, _1659);
    float _1689 = -_1645;
    float _1691 = _1689 + 1.0;
    float _1693 = fma(_1665, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1667);
    float _1695 = fma(_1665, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1679);
    float _1697 = fma(_1665, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1681);
    float _1699 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1400;
    out.gl_Position.y = _1402;
    out.gl_Position.z = _1661;
    out.gl_Position.w = _1370;
    float _1701 = _1697;
    float _1703 = _1671;
    if (!_1495)
    {
        float _1705 = -_1671;
        float _1707 = _1705 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1631 = _1707;
    }
    float _1709 = _1631;
    float _1711 = _1657;
    if (!_1495)
    {
        float _1713 = 1.0 / _1657;
        _1711 = _1713;
    }
    float _1715 = _1711;
    float _1717 = fma(_1687, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1695);
    out.m_63.x = _1673;
    out.m_63.y = _1675;
    out.m_63.z = _1677;
    bool _1719 = _1140 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1721 = isnan(_1140);
    bool _1723 = _1719 || _1721;
    bool _1725 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1727 = _1723 || _1725;
    float _1729 = _1709;
    if (!_1495)
    {
        float _1731 = 1.0 / _1709;
        _1729 = _1731;
    }
    float _1733 = _1729;
    float _1735 = -_1699;
    float _1737 = _1735 + 1.0;
    float _1739 = _1683 * 0.5;
    float _1741 = fma(_1687, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1693);
    float _1743 = fma(_1687, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1697);
    float _1745 = _1737;
    if (!_1495)
    {
        float _1747 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1749 = -_1671;
        float _1751 = fma(_1715, _1747, _1749);
        _1701 = _1751;
    }
    float _1753 = _1701;
    float _1755 = _1753;
    if (!_1727)
    {
        _1703 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1757 = _1703;
    out.m_65.x = _1717;
    out.m_65.y = _1741;
    out.m_65.z = _1743;
    float _1759 = _1757;
    float _1761 = _1757;
    if (!_1727)
    {
        _1613 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1763 = _1613;
    float _1765 = _1733;
    float _1767 = _1763;
    float _1769 = _1763;
    if (!_1495)
    {
        float _1771 = _1753 * _1733;
        float _1773 = precise::clamp(_1771, 0.0, 1.0);
        _1755 = _1773;
    }
    float _1775 = _1755;
    out.m_67.z = _1739;
    out.m_67.w = _1370;
    float _1777 = _1775;
    if (!_1727)
    {
        _1765 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1779 = _1765;
    float _1781 = _1779;
    float _1783 = _1779;
    if (!_1727)
    {
        _1669 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1785 = _1669;
    float _1787 = _1699 * _1430;
    float _1789 = _1445 * _1787;
    float _1791 = _1445 * _1737;
    float _1793 = _1789;
    float _1795 = _1785;
    float _1797 = _1785;
    if (_1495)
    {
        _1745 = 1.0;
    }
    float _1799 = _1745;
    float _1801 = _1799;
    if (!_1495)
    {
        float _1803 = -_1775;
        float _1805 = _1803 + 1.0;
        _1801 = _1805;
    }
    float _1807 = _1801;
    float _1809 = _1455 * _1787;
    float _1811 = fma(_1451, _1789, _1439);
    float _1813 = fma(_1453, _1789, _1441);
    float _1815 = _1807 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1817 = fma(_1445, _1809, _1443);
    if (!_1727)
    {
        _1777 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1819 = _1777;
    float _1821 = _1819;
    float _1823 = _1819;
    if (!_1727)
    {
        _1793 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1825 = _1793;
    out.m_69.x = _1811;
    out.m_69.y = _1813;
    out.m_69.z = _1817;
    out.m_69.w = _1791;
    bool _1827 = !_1727;
    float _1829 = _1825;
    float _1831 = _1825;
    if (!_1827)
    {
        bool _1833 = _1140 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1835 = isnan(_1140);
        bool _1837 = _1833 || _1835;
        bool _1839 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1841 = _1837 || _1839;
        if (!_1841)
        {
            float _1843 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1845 = _1140 + _1843;
            float _1847 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1849 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1847;
            float _1851 = 1.0 / _1849;
            float _1853 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1855 = _1853 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1857 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1859 = _1857 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1863 = _1861 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1865 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1867 = _1865 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1871 = _1869 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1873 = _1845 * _1851;
            float _1875 = precise::clamp(_1873, 0.0, 1.0);
            float _1877 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1879 = _1877 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1881 = fma(_1875, _1855, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1883 = fma(_1875, _1879, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1885 = fma(_1875, _1859, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1887 = fma(_1875, _1863, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1889 = fma(_1875, _1867, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1891 = fma(_1875, _1871, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1783 = _1883;
            _1797 = _1889;
            _1761 = _1881;
            _1769 = _1887;
            _1823 = _1885;
            _1831 = _1891;
            _1893 = true;
        }
        else
        {
            bool _1895 = _1140 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1897 = isnan(_1140);
            bool _1899 = _1895 || _1897;
            bool _1901 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1903 = _1899 || _1901;
            if (!_1903)
            {
                _1759 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1905 = _1759;
            _1761 = _1905;
            if (!_1903)
            {
                _1781 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1907 = _1781;
            _1783 = _1907;
            if (!_1903)
            {
                _1821 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1909 = _1821;
            _1823 = _1909;
            if (!_1903)
            {
                _1767 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1911 = _1767;
            _1769 = _1911;
            if (!_1903)
            {
                _1795 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1913 = _1795;
            _1797 = _1913;
            if (!_1903)
            {
                _1829 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1915 = _1829;
            bool _1917 = !_1903;
            _1831 = _1915;
            if (!_1917)
            {
                bool _1919 = _1140 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1921 = isnan(_1140);
                bool _1923 = _1919 || _1921;
                bool _1925 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1927 = _1923 || _1925;
                if (!_1927)
                {
                    float _1929 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1931 = _1140 + _1929;
                    float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1935 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1933;
                    float _1937 = 1.0 / _1935;
                    float _1939 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1941 = _1939 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1943 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1945 = _1943 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1947 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1949 = _1947 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1951 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1953 = _1951 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1957 = _1955 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1959 = _1931 * _1937;
                    float _1961 = precise::clamp(_1959, 0.0, 1.0);
                    float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1965 = _1963 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1967 = fma(_1961, _1941, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1969 = fma(_1961, _1965, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1971 = fma(_1961, _1945, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1973 = fma(_1961, _1949, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1975 = fma(_1961, _1953, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1977 = fma(_1961, _1957, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1783 = _1969;
                    _1797 = _1975;
                    _1761 = _1967;
                    _1769 = _1973;
                    _1823 = _1971;
                    _1831 = _1977;
                    _1893 = true;
                }
                else
                {
                    _1783 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1797 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1761 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1769 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1823 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1831 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1893 = false;
    float _1979 = _1783;
    float _1981 = _1797;
    float _1983 = _1761;
    float _1985 = _1769;
    float _1987 = _1823;
    float _1989 = _1831;
    float _1991 = _1815 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1993 = fma(_1741, -0.5, 0.5);
    float _1995 = precise::clamp(_1993, 0.0, 1.0);
    float _1997 = -_1979;
    float _1999 = _1997 + _1981;
    float _2001 = -_1983;
    float _2003 = _2001 + _1985;
    out.m_47.x = _1991;
    float _2005 = -_1987;
    float _2007 = _2005 + _1989;
    float _2009 = fma(_1995, _1999, _1979);
    float _2011 = fma(_1995, _2003, _1983);
    bool _2013 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2015 = _2009 * 0.586610972881317138671875;
    float _2017 = fma(_1995, _2007, _1987);
    out.m_71.x = 0.0;
    bool _2019 = _1807 > 0.0;
    bool _2021 = isnan(_1807);
    bool _2023 = _2019 || _2021;
    bool _2025 = isnan(0.0);
    bool _2027 = _2023 || _2025;
    float _2029 = fma(_2011, 0.298911988735198974609375, _2015);
    float _2031 = fma(_2017, 0.114477999508380889892578125, _2029);
    float _2033 = -_2031;
    float _2035 = _2011 + _2033;
    float _2037 = -_2031;
    float _2039 = _2009 + _2037;
    float _2041 = -_2031;
    float _2043 = _2017 + _2041;
    float _2045 = fma(_2035, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2031);
    float _2047 = fma(_2039, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2031);
    float _2049 = fma(_2043, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2031);
    bool _2051 = !_2013;
    if (!_2051)
    {
        float _2053 = -_1114;
        float _2055 = _2053 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2057 = -_1116;
        float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2061 = -_1118;
        float _2063 = _2061 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2065 = _2055 * _2055;
        float _2067 = fma(_2059, _2059, _2065);
        float _2069 = fma(_2063, _2063, _2067);
        float _2071 = sqrt(_2069);
        float _2073 = rsqrt(_2069);
        float _2075 = -_2071;
        float _2077 = _2075 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2079 = _2077 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2081 = precise::clamp(_2079, 0.0, 1.0);
        float _2083 = _2059 * _2073;
        float _2085 = _2055 * _2073;
        float _2087 = abs(_2081);
        float _2089 = log2(_2087);
        float _2091 = _2063 * _2073;
        float _2093 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2095 = _1741 * _2085;
        float _2097 = -_2085;
        float _2099 = -_2093;
        float _2101 = fma(_2097, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2099);
        float _2103 = fma(_1717, _2083, _2095);
        float _2105 = -_2091;
        float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2101);
        float _2109 = fma(_1743, _2091, _2103);
        float _2111 = precise::clamp(_2109, 0.0, 1.0);
        float _2113 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2115 = _2107 + _2113;
        float _2117 = _2089 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2119 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2121 = precise::clamp(_2119, 0.0, 1.0);
        float _2123 = exp2(_2117);
        float _2125 = _2123 * _2121;
        float _2127 = _2111 * _2125;
        float _2129 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2131 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2133 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_71.x = _2129;
        out.m_71.y = _2131;
        out.m_71.z = _2133;
    }
    out.m_73.x = _2045;
    out.m_73.y = _2047;
    out.m_73.z = _2049;
    if (_2027)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2135 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2135;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

