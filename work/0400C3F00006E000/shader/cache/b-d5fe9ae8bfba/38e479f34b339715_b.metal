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
    float4 m_55 [[user(locn1)]];
    float4 m_81 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_75 [[user(locn4)]];
    float4 m_57 [[user(locn5)]];
    float4 m_59 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_63 [[user(locn9)]];
    float4 m_65 [[user(locn10)]];
    float4 m_79 [[user(locn12)]];
    float4 m_83 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_69 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_73 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_61 [[attribute(9)]];
    float4 m_67 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1682 = false;
    bool _1360 = false;
    bool _988 = false;
    bool _864 = false;
    bool _690 = false;
    bool _516 = false;
    bool _300 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_42.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    float _110 = as_type<float>(_102);
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _108;
    if (!_106)
    {
        out.m_45.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3967 = as_type<float>(_118);
        out.gl_Position.z = _3967;
    }
    if (!_106)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _122 = in.m_47.w;
    float _124 = float(_102);
    float _126 = -_122;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_122);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    bool _140 = _128 >= _124;
    bool _142 = !_138;
    bool _144 = _140 || _142;
    float _146 = _128;
    if (_144)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _110;
    if (_144)
    {
        out.m_45.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _120 = as_type<int>(_150);
    }
    int _152 = _120;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4031 = as_type<float>(_152);
        out.gl_Position.z = _4031;
    }
    if (_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_49.w;
    float _156 = 1.0 / _124;
    float _158 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_47.x;
    float _172 = in.m_47.y;
    float _174 = in.m_47.z;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = 0.0;
    float _184 = _158;
    if (!_168)
    {
        float _186 = _158 * _158;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_168)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_168;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _158 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _158);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_168;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _158 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = _128 * _156;
    float _268 = fma(_256, _170, _260);
    float _270 = fma(_256, _172, _262);
    float _272 = fma(_256, _174, _264);
    float _274 = fma(_268, _154, _176);
    float _276 = fma(_270, _154, _178);
    float _278 = fma(_272, _154, _180);
    bool _280 = !_258;
    float _298;
    if (!_280)
    {
        float _282 = in.m_51.x;
        float _284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _286 = _282 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _290 = _288 * _284;
        float _292 = floor(_290);
        float _294 = -_292;
        float _296 = _290 + _294;
        _298 = _296;
        _300 = true;
    }
    else
    {
        _298 = _266;
    }
    _300 = false;
    float _302 = _298;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = _302 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _310 = _302 + _308;
    bool _312 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _314 = isnan(_302);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = _302 + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _340 = 1.0 / _326;
    bool _342 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _344 = 1.0 / _338;
    float _346 = 1.0 / _334;
    float _348 = _306 * _340;
    bool _350 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _352 = isnan(_302);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -_322;
    float _364 = _362 + 1.0;
    float _366 = _360 * _364;
    float _368 = _310 * _344;
    bool _370 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _372 = isnan(_302);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    bool _386 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _388 = isnan(_302);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = -_360;
    float _404 = _402 + 1.0;
    float _406 = -_380;
    float _408 = _406 + 1.0;
    float _410 = _330 * _346;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _416;
    float _420 = _396 * _408;
    float _422 = fma(_384, _410, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _424 = fma(_414, _410, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _426 = fma(_418, _410, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _428 = _380 * _404;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _434 = _424 * _420;
    float _436 = _426 * _420;
    float _438 = _422 * _420;
    float _440 = -_396;
    float _442 = _440 + 1.0;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[143].x, _436);
    float _450 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[143].y, _434);
    float _452 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[143].z, _438);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _454;
    float _458 = fma(_400, _368, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _460 = fma(_446, _368, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _462 = fma(_432, _368, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _468;
    float _472 = fma(_458, _428, _448);
    float _474 = fma(_456, _348, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _476 = fma(_466, _348, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _478 = fma(_470, _348, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _480 = fma(_460, _428, _450);
    float _482 = fma(_462, _428, _452);
    float _484 = fma(_474, _366, _472);
    float _486 = fma(_476, _366, _480);
    float _488 = fma(_478, _366, _482);
    float _490 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[146].x, _484);
    float _492 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[146].y, _486);
    float _494 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[146].z, _488);
    bool _496 = !_342;
    float _514;
    if (!_496)
    {
        float _498 = in.m_51.x;
        float _500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _502 = _498 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _506 = _504 * _500;
        float _508 = floor(_506);
        float _510 = -_508;
        float _512 = _506 + _510;
        _514 = _512;
        _516 = true;
    }
    else
    {
        _514 = _266;
    }
    _516 = false;
    float _518 = _514;
    float _520 = in.m_49.x;
    float _522 = in.m_49.y;
    float _524 = in.m_49.z;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _528 = _518 + _526;
    bool _530 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _532 = isnan(_518);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _542;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _550 = 1.0 / _544;
    bool _552 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _554 = isnan(_518);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    bool _564 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _566 = 1.0 / _548;
    float _568 = _492 * _522;
    float _570 = _494 * _524;
    bool _572 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _574 = isnan(_518);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = -_540;
    float _586 = _584 + 1.0;
    float _588 = _528 * _550;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _592 = _518 + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _594;
    float _598 = _582 * _586;
    float _600 = -_582;
    float _602 = _600 + 1.0;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _608;
    float _612 = fma(_596, _588, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _614 = _562 * _602;
    float _616 = fma(_606, _588, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _618 = fma(_610, _588, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _620 = _592 * _566;
    float _622 = -_562;
    float _624 = _622 + 1.0;
    float _626 = _616 * _614;
    float _628 = _618 * _614;
    float _630 = _612 * _614;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _644 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[107].x, _626);
    float _646 = fma(_634, _620, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _648 = fma(_638, _620, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _650 = fma(_642, _620, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _652 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[107].y, _628);
    float _654 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[107].z, _630);
    float _656 = fma(_646, _598, _644);
    float _658 = _490 * _520;
    float _660 = fma(_648, _598, _652);
    float _662 = fma(_650, _598, _654);
    float _664 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[109].x, _656);
    float _666 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[109].y, _660);
    float _668 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[109].z, _662);
    bool _670 = !_564;
    float _688;
    if (!_670)
    {
        float _672 = in.m_51.x;
        float _674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _676 = _672 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _680 = _678 * _674;
        float _682 = floor(_680);
        float _684 = -_682;
        float _686 = _680 + _684;
        _688 = _686;
        _690 = true;
    }
    else
    {
        _688 = _266;
    }
    _690 = false;
    float _692 = _688;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _696 = _692 + _694;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _706 = _692 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _708 = isnan(_692);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _722 = _692 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _724 = isnan(_692);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = 1.0 / _700;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _736;
    float _740 = -_716;
    float _742 = _740 + 1.0;
    bool _744 = _692 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _746 = isnan(_692);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    bool _756 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _758 = 1.0 / _704;
    float _760 = 1.0 / _720;
    float _762 = _738 * _734;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _768 = _732 * _742;
    float _770 = -_732;
    float _772 = _770 + 1.0;
    float _774 = fma(_762, _696, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _776;
    float _780 = _754 * _772;
    float _782 = _766 * _758;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _786 = _692 + _784;
    bool _788 = _692 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _790 = isnan(_692);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = _774 * _780;
    float _802 = -_754;
    float _804 = _802 + 1.0;
    float _806 = fma(_782, _786, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _810 = _692 + _808;
    float _812 = _778 * _760;
    float _814 = -_798;
    float _816 = _814 + 1.0;
    float _818 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[115].x, _800);
    float _820 = _666 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _822 = fma(_812, _810, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _824 = _716 * _816;
    float _826 = fma(_806, _768, _818);
    float _828 = _664 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _830 = _668 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _832 = fma(_822, _824, _826);
    float _834 = _828 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _836 = _830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _838 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[118].x, _832);
    float _840 = _820 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _842 = _838 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _834;
    out.m_53.y = _840;
    out.m_53.z = _836;
    out.m_53.w = _842;
    bool _844 = !_756;
    float _862;
    if (!_844)
    {
        float _846 = in.m_51.x;
        float _848 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _850 = _846 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _852 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _854 = _852 * _848;
        float _856 = floor(_854);
        float _858 = -_856;
        float _860 = _854 + _858;
        _862 = _860;
        _864 = true;
    }
    else
    {
        _862 = _266;
    }
    _864 = false;
    float _866 = _862;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _870 = _866 + _868;
    bool _872 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _874 = isnan(_866);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _884;
    bool _888 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _890 = isnan(_866);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = -_882;
    float _902 = _900 + 1.0;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _904;
    float _908 = 1.0 / _886;
    bool _910 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _912 = _898 * _902;
    float _914 = -_898;
    float _916 = _914 + 1.0;
    float _918 = _870 * _908;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _920;
    float _924 = fma(_906, _918, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _926;
    float _930 = fma(_922, _918, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _932 = _924 * _912;
    float _934 = fma(_928, _918, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _936 = _930 * _912;
    float _938 = _934 * _912;
    float _940 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[123].x, _932);
    float _942 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[123].y, _938);
    float _944 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[123].z, _936);
    float _946 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[124].x, _940);
    float _948 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[124].y, _942);
    float _950 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[124].z, _944);
    float _952 = _946 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _954 = _948 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _956 = _950 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _960 = _952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _962 = _954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _964 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _960;
    out.m_55.y = _962;
    out.m_55.z = _964;
    out.m_55.w = _958;
    bool _966 = !_910;
    float _968 = _960;
    float _986;
    if (!_966)
    {
        float _970 = in.m_51.x;
        float _972 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _974 = _970 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[14].x, _128);
        float _978 = _976 * _972;
        float _980 = floor(_978);
        float _982 = -_980;
        float _984 = _978 + _982;
        _986 = _984;
        _988 = true;
    }
    else
    {
        _986 = _266;
    }
    _988 = false;
    float _990 = _986;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _994 = _990 + _992;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _996;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1002 = _1000 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1012 = 1.0 / _998;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1014;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1022 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1024 = isnan(_990);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1030 = _1026 || _1028;
    float _1032 = float(_1030);
    float _1034 = 1.0 / _1002;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1038 = _990 + _1036;
    float _1040 = -_1032;
    float _1042 = _1040 + 1.0;
    bool _1044 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1046 = 1.0 / _1006;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1050 = _990 + _1048;
    float _1052 = _1038 * _1012;
    bool _1054 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1056 = isnan(_990);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1062 = _1058 || _1060;
    float _1064 = float(_1062);
    bool _1066 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1068 = isnan(_990);
    bool _1070 = _1066 || _1068;
    bool _1072 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1074 = _1070 || _1072;
    float _1076 = float(_1074);
    float _1078 = 1.0 / _1010;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1080;
    float _1084 = _1050 * _1034;
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1088 = _990 + _1086;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1092 = _990 + _1090;
    float _1094 = 1.0 / _1016;
    float _1096 = _1088 * _1046;
    float _1098 = -_1064;
    float _1100 = _1098 + 1.0;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1104 = _990 + _1102;
    bool _1106 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1108 = isnan(_990);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    float _1118 = _1076 * _1100;
    float _1120 = 1.0 / _1020;
    bool _1122 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1124 = isnan(_990);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    float _1134 = _994 * _1078;
    float _1136 = _1116 * _1042;
    float _1138 = -_1116;
    float _1140 = _1138 + 1.0;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1142;
    float _1146 = 1.0 / _1082;
    float _1148 = _1092 * _1094;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1152 = _990 + _1150;
    float _1154 = fma(_1144, _1096, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1156 = _1152 * _1120;
    float _1158 = -_1076;
    float _1160 = _1158 + 1.0;
    bool _1162 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1164 = isnan(_990);
    bool _1166 = _1162 || _1164;
    bool _1168 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1170 = _1166 || _1168;
    float _1172 = float(_1170);
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1174;
    float _1178 = _1132 * _1160;
    float _1180 = -_1132;
    float _1182 = _1180 + 1.0;
    float _1184 = fma(_1176, _1052, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1186 = _1104 * _1146;
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1188;
    float _1192 = _1172 * _1182;
    float _1194 = -_1172;
    float _1196 = _1194 + 1.0;
    float _1198 = fma(_1190, _1052, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    bool _1200 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1202 = isnan(_990);
    bool _1204 = _1200 || _1202;
    bool _1206 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1208 = _1204 || _1206;
    float _1210 = float(_1208);
    float _1212 = _1032 * _1196;
    bool _1214 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1216 = isnan(_990);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1222 = _1218 || _1220;
    float _1224 = float(_1222);
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1228 = _1226 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1230 = -_1224;
    float _1232 = _1230 + 1.0;
    float _1234 = _1224 * _1140;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1238 = _1236 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1240 = fma(_1228, _1084, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1242 = _1210 * _1232;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1244;
    float _1248 = fma(_1238, _1084, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1250 = -_1210;
    float _1252 = _1250 + 1.0;
    float _1254 = _1184 * _1242;
    float _1256 = _1198 * _1242;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1260 = _1258 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1262 = fma(_1246, _1096, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1266 = _1264 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1268 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1254);
    float _1270 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1256);
    float _1272 = fma(_1260, _1134, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1274 = fma(_1240, _1234, _1268);
    float _1276 = fma(_1248, _1234, _1270);
    float _1278 = fma(_1266, _1134, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1280;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1284;
    float _1288 = fma(_1262, _1136, _1274);
    float _1290 = fma(_1154, _1136, _1276);
    float _1292 = fma(_1282, _1148, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1294 = fma(_1286, _1148, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1298 = _1296 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1302 = _1300 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1304 = fma(_1272, _1212, _1288);
    float _1306 = fma(_1278, _1212, _1290);
    float _1308 = fma(_1298, _1156, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1310 = fma(_1302, _1156, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1312;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1316;
    float _1320 = fma(_1292, _1192, _1304);
    float _1322 = fma(_1294, _1192, _1306);
    float _1324 = fma(_1314, _1186, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1326 = fma(_1318, _1186, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1328 = fma(_1308, _1178, _1320);
    float _1330 = fma(_1310, _1178, _1322);
    float _1332 = fma(_1324, _1118, _1328);
    float _1334 = fma(_1326, _1118, _1330);
    float _1336 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1332);
    float _1338 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1334);
    out.m_57.x = _1336;
    out.m_57.y = _1338;
    bool _1340 = !_1044;
    float _1358;
    if (!_1340)
    {
        float _1342 = in.m_51.x;
        float _1344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1346 = _1342 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1348 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[14].y, _128);
        float _1350 = _1348 * _1344;
        float _1352 = floor(_1350);
        float _1354 = -_1352;
        float _1356 = _1350 + _1354;
        _1358 = _1356;
        _1360 = true;
    }
    else
    {
        _1358 = _266;
    }
    _1360 = false;
    float _1362 = _1358;
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1366 = _1362 + _1364;
    bool _1368 = _1362 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1370 = isnan(_1362);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1376 = _1372 || _1374;
    float _1378 = float(_1376);
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1382 = _1380 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1384 = _1362 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1386 = isnan(_1362);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1392 = _1388 || _1390;
    float _1394 = float(_1392);
    float _1396 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1396;
    bool _1400 = _1362 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1402 = isnan(_1362);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1408 = _1404 || _1406;
    float _1410 = float(_1408);
    float _1412 = 1.0 / _1382;
    float _1414 = -_1378;
    float _1416 = _1414 + 1.0;
    bool _1418 = _1362 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1420 = isnan(_1362);
    bool _1422 = _1418 || _1420;
    bool _1424 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1426 = _1422 || _1424;
    float _1428 = float(_1426);
    float _1430 = -_1410;
    float _1432 = _1430 + 1.0;
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1436 = _1434 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1438 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1440 = 1.0 / _1436;
    float _1442 = _1398 * _1412;
    float _1444 = _1394 * _1416;
    float _1446 = -_1394;
    float _1448 = _1446 + 1.0;
    float _1450 = fma(_1442, _1366, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _1452 = _1362 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1454 = isnan(_1362);
    bool _1456 = _1452 || _1454;
    bool _1458 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1460 = _1456 || _1458;
    float _1462 = float(_1460);
    float _1464 = _1410 * _1448;
    bool _1466 = _1362 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1468 = isnan(_1362);
    bool _1470 = _1466 || _1468;
    bool _1472 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1474 = _1470 || _1472;
    float _1476 = float(_1474);
    float _1478 = _1428 * _1432;
    float _1480 = -_1428;
    float _1482 = _1480 + 1.0;
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1486 = _1484 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1490 = _1488 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1492 = _1476 * _1482;
    float _1494 = -_1476;
    float _1496 = _1494 + 1.0;
    bool _1498 = _1362 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1500 = isnan(_1362);
    bool _1502 = _1498 || _1500;
    bool _1504 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1506 = _1502 || _1504;
    float _1508 = float(_1506);
    float _1510 = 1.0 / _1486;
    float _1512 = _1462 * _1496;
    float _1514 = -_1462;
    float _1516 = _1514 + 1.0;
    float _1518 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1520 = _1518 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1522 = _1508 * _1516;
    float _1524 = 1.0 / _1490;
    float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1528 = _1526 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1530 = _1520 * _1440;
    float _1532 = _1450 * _1522;
    float _1534 = -_1508;
    float _1536 = _1534 + 1.0;
    float _1538 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1540 = _1538 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1544 = _1362 + _1542;
    float _1546 = 1.0 / _1528;
    float _1548 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1548;
    float _1552 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1532);
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1556 = _1554 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1558 = fma(_1530, _1544, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1560 = _1550 * _1510;
    float _1562 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1564 = _1362 + _1562;
    float _1566 = 1.0 / _1540;
    float _1568 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1570 = _1568 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1572 = fma(_1560, _1564, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1574 = fma(_1558, _1512, _1552);
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1576;
    float _1580 = _1570 * _1524;
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1584 = _1362 + _1582;
    float _1586 = fma(_1572, _1492, _1574);
    float _1588 = 1.0 / _1556;
    float _1590 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1592 = _1590 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1594 = _1578 * _1546;
    float _1596 = fma(_1580, _1584, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1600 = _1362 + _1598;
    float _1602 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1604 = _1362 + _1602;
    float _1606 = _1592 * _1566;
    float _1608 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1608;
    bool _1612 = _1362 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1614 = isnan(_1362);
    bool _1616 = _1612 || _1614;
    bool _1618 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1620 = _1616 || _1618;
    float _1622 = float(_1620);
    float _1624 = fma(_1594, _1600, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1626 = fma(_1596, _1478, _1586);
    float _1628 = fma(_1606, _1604, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1632 = _1362 + _1630;
    float _1634 = -_1622;
    float _1636 = _1634 + 1.0;
    float _1638 = _1610 * _1588;
    float _1640 = fma(_1624, _1464, _1626);
    float _1642 = _1378 * _1636;
    float _1644 = fma(_1638, _1632, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1646 = fma(_1628, _1444, _1640);
    float _1648 = fma(_1644, _1642, _1646);
    float _1650 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1648);
    out.m_59.x = _1650;
    bool _1652 = !_1438;
    int _1654 = as_type<int>(_1362);
    float _1656 = _1378;
    int _1658 = as_type<int>(_1604);
    int _1660 = as_type<int>(_1638);
    bool _1662 = _1438;
    float _1680;
    if (!_1652)
    {
        float _1664 = in.m_51.x;
        float _1666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1668 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1670 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[14].z, _128);
        float _1672 = _1670 * _1666;
        float _1674 = floor(_1672);
        float _1676 = -_1674;
        float _1678 = _1672 + _1676;
        _1680 = _1678;
        _1654 = as_type<int>(_1666);
        _1656 = _1672;
        _1682 = true;
    }
    else
    {
        _1680 = _266;
    }
    _1682 = false;
    float _1684 = _1680;
    int _1686 = _1654;
    float _1688 = _1656;
    float _1690 = in.m_61.x;
    float _1692 = _276 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1696 = _1694 != 0;
    float _1698 = in.m_61.y;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1702 = _1700 != 0;
    float _1704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1708 = _1706 != 0;
    float _1710 = in.m_51.w;
    float _1712 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1714 = _1684 + _1712;
    float _1716 = in.m_51.y;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1720 = _1718 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    int _1722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1724 = _1722 != 0;
    int _1726 = _1686;
    float _1728 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1732 = _1714;
    if (_1696)
    {
        float _1734 = in.m_51.x;
        _1726 = as_type<int>(_1734);
    }
    int _1736 = _1726;
    float _1738 = 1.0 / _1720;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1742 = _1688;
    if (_1702)
    {
        float _1744 = in.m_51.z;
        _1742 = _1744;
    }
    float _1746 = _1742;
    float _1748 = _1690;
    if (_1702)
    {
        float _1750 = -_1690;
        float _1752 = _1750 + 1.0;
        _1658 = as_type<int>(_1752);
    }
    int _1754 = _1658;
    float _1756 = 0.0;
    if (!_1696)
    {
        _1756 = _1690;
    }
    float _1758 = _1756;
    float _1760 = _1758;
    if (_1708)
    {
        float _1762 = -_1690;
        float _1764 = _1762 + 1.0;
        _1660 = as_type<int>(_1764);
    }
    int _1766 = _1660;
    if (!_1708)
    {
        _1728 = _1690;
    }
    float _1768 = _1728;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1770;
    bool _1774 = _1684 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1776 = isnan(_1684);
    bool _1778 = _1774 || _1776;
    bool _1780 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1782 = _1778 || _1780;
    float _1784 = float(_1782);
    float _1786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1788 = _1684 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1790 = isnan(_1684);
    bool _1792 = _1788 || _1790;
    bool _1794 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1796 = _1792 || _1794;
    float _1798 = float(_1796);
    bool _1800 = _1710 > 0.5;
    float _1802 = -_1784;
    float _1804 = _1802 + 1.0;
    float _1806 = _1798 * _1804;
    float _1808 = _1704 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1810 = _1736;
    float _1812 = _1768;
    int _1814 = as_type<int>(_1786);
    int _1816 = as_type<int>(_1704);
    if (_1696)
    {
        bool _1818 = as_type<float>(_1736) > 0.5;
        _1662 = _1818;
    }
    bool _1820 = _1662;
    if (_1696)
    {
        float _1822 = -_1690;
        float _1824 = _1822 + 1.0;
        _1810 = as_type<int>(_1824);
    }
    int _1826 = _1810;
    float _1828 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1830 = _1828 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1832 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1834 = false;
    if (_1702)
    {
        bool _1836 = _1746 > 0.5;
        _1834 = _1836;
    }
    bool _1838 = _1834;
    float _1840 = -_1798;
    float _1842 = _1840 + 1.0;
    if (_1696)
    {
        float _1844 = _1820 ? as_type<float>(_1826) : _1690;
        _1760 = _1844;
    }
    float _1846 = _1760;
    float _1848 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1850 = _1848 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    int _1852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1854 = _1852 != 0;
    float _1856 = 1.0 / _1850;
    bool _1858 = _1716 > 0.5;
    if (!_1702)
    {
        _1730 = _1690;
    }
    float _1860 = _1730;
    float _1862 = _1860;
    if (_1702)
    {
        float _1864 = _1838 ? as_type<float>(_1754) : _1690;
        _1862 = _1864;
    }
    float _1866 = _1862;
    int _1868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1870 = _1868 != 0;
    float _1872 = 1.0 / _1830;
    float _1874 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1876 = _1874 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1878 = -_1698;
    float _1880 = _1878 + 1.0;
    if (_1708)
    {
        float _1882 = _1858 ? as_type<float>(_1766) : _1690;
        _1812 = _1882;
    }
    float _1884 = _1812;
    int _1886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1888 = _1886 != 0;
    int _1890 = _1800 ? as_type<int>(_1880) : as_type<int>(_1698);
    float _1892 = 1.0 / _1876;
    int _1894 = _1858 ? as_type<int>(_1880) : as_type<int>(_1698);
    float _1896 = _1854 ? as_type<float>(_1890) : _1698;
    float _1898 = fma(_1808, _1896, -0.5);
    float _1900 = _276 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1902 = _1870 ? as_type<float>(_1894) : _1698;
    float _1904 = _276 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1908 = _1906 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1910 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1900);
    float _1912 = _1716 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1914 = 1.0 / _1908;
    float _1916 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1904);
    float _1918 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1692);
    float _1920 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1922 = _1920 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1924 = fma(_1912, -2.0, _1740);
    float _1926 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1916);
    float _1928 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1910);
    float _1930 = 1.0 / _1922;
    float _1932 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1934 = _1932 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1936 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1918);
    float _1938 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1940 = _1938 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1942 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1942;
    float _1946 = _1934 * _1872;
    float _1948 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1948;
    float _1952 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1952;
    float _1956 = 1.0 / _1940;
    float _1958 = _1944 * _1856;
    float _1960 = _1950 * _1738;
    float _1962 = _1954 * _1914;
    float _1964 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1966 = _1684 + _1964;
    bool _1968 = _1684 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1970 = isnan(_1684);
    bool _1972 = _1968 || _1970;
    bool _1974 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1976 = _1972 || _1974;
    float _1978 = float(_1976);
    float _1980 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1982 = _1684 + _1980;
    float _1984 = _1772 * _1930;
    bool _1986 = _1684 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1988 = isnan(_1684);
    bool _1990 = _1986 || _1988;
    bool _1992 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1994 = _1990 || _1992;
    float _1996 = float(_1994);
    float _1998 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _2000 = _1998 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2002 = fma(_1958, _1966, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _2004 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2006 = _1684 + _2004;
    float _2008 = -_1978;
    float _2010 = _2008 + 1.0;
    float _2012 = fma(_1946, _1982, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _2014 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _2016 = _2014 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _2018 = fma(_1960, _2006, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _2020 = _1996 * _2010;
    bool _2022 = _1684 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _2024 = isnan(_1684);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _2030 = _2026 || _2028;
    float _2032 = float(_2030);
    float _2034 = -_1996;
    float _2036 = _2034 + 1.0;
    float _2038 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2040 = _1684 + _2038;
    float _2042 = _2000 * _1892;
    float _2044 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2046 = _1684 + _2044;
    bool _2048 = _1684 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _2050 = isnan(_1684);
    bool _2052 = _2048 || _2050;
    bool _2054 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _2056 = _2052 || _2054;
    float _2058 = float(_2056);
    float _2060 = _2016 * _1956;
    float _2062 = _2032 * _2036;
    float _2064 = -_2032;
    float _2066 = _2064 + 1.0;
    float _2068 = fma(_1962, _2040, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _2070 = fma(_2042, _2046, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _2072 = _2036;
    float _2074 = _2002;
    if (_1724)
    {
        float _2076 = in.m_51.x;
        _2072 = _2076;
    }
    float _2078 = _2072;
    bool _2080 = _1684 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _2082 = isnan(_1684);
    bool _2084 = _2080 || _2082;
    bool _2086 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _2088 = _2084 || _2086;
    float _2090 = float(_2088);
    float _2092 = -_2058;
    float _2094 = _2092 + 1.0;
    float _2096 = _1716 * 2.0;
    float _2098 = _2040;
    if (_1724)
    {
        float _2100 = in.m_51.z;
        _2098 = _2100;
    }
    float _2102 = _2098;
    float _2104 = _2058 * _2066;
    float _2106 = _2090 * _2094;
    float _2108 = -_2090;
    float _2110 = _2108 + 1.0;
    int _2112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2114 = _2112 != 0;
    float _2116 = floor(_2096);
    float _2118 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2120 = _1684 + _2118;
    float _2122 = _1784 * _2110;
    bool _2124 = _1684 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _2126 = isnan(_1684);
    bool _2128 = _2124 || _2126;
    bool _2130 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _2132 = _2128 || _2130;
    int _2134 = _2132 ? 1065353216 : 0;
    float _2136 = fma(_2060, _1714, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _2138 = fma(_1984, _2120, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _2140 = _1786 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2142 = _2134;
    int _2144 = as_type<int>(_2140);
    float _2146 = _2138;
    if (_1888)
    {
        float _2148 = -_1690;
        float _2150 = _2148 + 1.0;
        _1814 = as_type<int>(_2150);
    }
    int _2152 = _1814;
    float _2154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2156 = as_type<float>(_2134) * _1842;
    int _2158 = as_type<int>(_2156);
    if (!_1888)
    {
        _1732 = _1690;
    }
    float _2160 = _1732;
    float _2162 = fma(_2140, _1902, -0.5);
    float _2164 = _2160;
    float _2166 = _2162;
    if (_1888)
    {
        float _2168 = _1858 ? as_type<float>(_2152) : _1690;
        _2164 = _2168;
    }
    float _2170 = _2164;
    float _2172 = _2002 * _2156;
    float _2174 = -as_type<float>(_2134);
    float _2176 = _2174 + 1.0;
    int _2178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2180 = _2178 != 0;
    float _2182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2186 = _2184 != 0;
    if (_2114)
    {
        float _2188 = -_1690;
        float _2190 = _2188 + 1.0;
        _1816 = as_type<int>(_2190);
    }
    int _2192 = _1816;
    if (_1724)
    {
        _2158 = 0;
    }
    int _2194 = _2158;
    int _2196 = _2194;
    if (_1724)
    {
        _2142 = 0;
    }
    int _2198 = _2142;
    int _2200 = _2198;
    if (_1724)
    {
        _2074 = _1716;
    }
    float _2202 = _2074;
    bool _2204 = _2116 > 0.0;
    float _2206 = 0.0;
    float _2208 = _2202;
    float _2210 = _2078;
    if (_1724)
    {
        _2206 = _2078;
    }
    float _2212 = _2206;
    float _2214 = _2102;
    float _2216 = _2212;
    if (_1724)
    {
        _2144 = as_type<int>(_2102);
    }
    int _2218 = _2144;
    bool _2220 = _2116 >= 0.0;
    bool _2222 = isnan(_2116);
    bool _2224 = _2220 || _2222;
    bool _2226 = isnan(0.0);
    bool _2228 = _2224 || _2226;
    int _2230 = _2218;
    if (!_1724)
    {
        float _2232 = in.m_51.x;
        float _2234 = _1716 * 3.1415927410125732421875;
        float _2236 = in.m_51.z;
        float _2238 = _2234 * 0.15915493667125701904296875;
        float _2240 = _2238 * 6.283185482025146484375;
        float _2242 = sin(_2240);
        float _2244 = _2232 * 3.1415927410125732421875;
        float _2246 = _2244 * 0.15915493667125701904296875;
        float _2248 = _2236 * 3.1415927410125732421875;
        float _2250 = _2248 * 0.15915493667125701904296875;
        float _2252 = _2246 * 6.283185482025146484375;
        float _2254 = sin(_2252);
        float _2256 = _2250 * 6.283185482025146484375;
        float _2258 = sin(_2256);
        _2214 = _2236;
        _2200 = 2;
        _2196 = 1;
        _2208 = _2242;
        _2210 = _2232;
        _2216 = _2254;
        _2230 = as_type<int>(_2258);
    }
    float _2260 = _2214;
    int _2262 = _2200;
    int _2264 = _2196;
    float _2266 = _2208;
    float _2268 = _2210;
    float _2270 = _2216;
    int _2272 = _2230;
    float _2274 = _2260 * 2.0;
    int _2276 = _2228 ? 0 : 1;
    float _2278 = fma(_2176, (*spvDescriptorSet0.vp_c9)._m0[175].x, _2172);
    bool _2280 = _2260 > 0.5;
    float _2282 = floor(_2274);
    if (_2114)
    {
        float _2284 = _1858 ? as_type<float>(_2192) : _1690;
        _1748 = _2284;
    }
    float _2286 = _1748;
    float _2288 = _1832 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2290 = ~_2276;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    float _2296 = _1928 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2298 = _2262 != 2;
    float _2300 = fma(_2288, _1846, -0.5);
    int _2302 = _2294;
    if (!_2204)
    {
        int _2304 = ~_2276;
        int _2306 = _2304 + 1;
        _2302 = _2306;
    }
    int _2308 = _2302;
    float _2310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _2312 = _2280 ? as_type<int>(_1880) : as_type<int>(_1698);
    float _2314 = _1926 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2316 = _2264 != 1;
    float _2318 = _1936 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2322 = _2320 != 0;
    float _2324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2326 = _2182 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2328 = _2180 ? as_type<float>(_2312) : _1698;
    float _2330 = _2266 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2332 = _2186 ? as_type<float>(_2312) : _1698;
    float _2334 = fma(_2326, _1884, -0.5);
    int _2336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2338 = _2336 != 0;
    int _2340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2342 = _2340 != 0;
    int _2344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2346 = _2344 != 0;
    float _2348 = fma(_2012, _1806, _2278);
    float _2350 = _2322 ? as_type<float>(_2312) : _1698;
    float _2352 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2354 = _2268 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2356 = _2154 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2358 = _2282 >= 0.0;
    bool _2360 = isnan(_2282);
    bool _2362 = _2358 || _2360;
    bool _2364 = isnan(0.0);
    bool _2366 = _2362 || _2364;
    float _2368 = _2310 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2370 = -_2352;
    float _2372 = fma(_2354, 2.0, _2370);
    float _2374 = _2268 * 2.0;
    int _2376 = _2366 ? 0 : 1;
    float _2378 = _2324 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    bool _2380 = _2282 > 0.0;
    float _2382 = fma(_2356, _1866, -0.5);
    float _2384 = floor(_2374);
    float _2386 = fma(_2378, _2170, -0.5);
    float _2388 = _2270 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2390 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2392 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    int _2394 = ~_2376;
    int _2396 = _2394 + 1;
    int _2398 = _2396 + 1;
    float _2400 = -_2390;
    float _2402 = fma(_2388, 2.0, _2400);
    float _2404 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2406 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2408 = _2398;
    if (!_2380)
    {
        int _2410 = ~_2376;
        int _2412 = _2410 + 1;
        _2408 = _2412;
    }
    int _2414 = _2408;
    float _2416 = fma(_2330, -2.0, _2392);
    bool _2418 = !_2316;
    float _2420 = _2418 ? _2266 : _2270;
    float _2422 = fma(_2266, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2406);
    bool _2424 = _2384 >= 0.0;
    bool _2426 = isnan(_2384);
    bool _2428 = _2424 || _2426;
    bool _2430 = isnan(0.0);
    bool _2432 = _2428 || _2430;
    float _2434 = fma(_2368, _2286, -0.5);
    bool _2436 = !_2316;
    float _2438 = _2436 ? as_type<float>(_2272) : _2266;
    float _2440 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2442 = _2296 + _2440;
    int _2444 = _2432 ? 0 : 1;
    float _2446 = fma(_2270, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2404);
    bool _2448 = _2384 > 0.0;
    float _2450 = _1716 + _2260;
    float _2452 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2454 = _2314 + _2452;
    float _2456 = _2442 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2458 = _1716 + _2268;
    float _2460 = _2450 + (-1.0);
    float _2462 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2456);
    float _2464 = _2458 + (-1.0);
    float _2466 = fma(_2018, _2122, _2348);
    float _2468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2470 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2446);
    float _2472 = fma(_2464, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2474 = fma(_2070, _2106, _2466);
    float _2476 = -_128;
    float _2478 = fma(_2476, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2402);
    float _2480 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2482 = _2318 + _2480;
    float _2484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2486 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _2488 = fma(_2470, _2386, _2478);
    float _2490 = fma(_2482, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2462);
    float _2492 = fma(_2260, (*spvDescriptorSet0.vp_c9)._m0[79].z, _2486);
    float _2494 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _2496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _2498 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[79].x, _2492);
    int _2500 = ~_2444;
    int _2502 = _2500 + 1;
    int _2504 = _2502 + 1;
    float _2506 = fma(_2460, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2508 = _2468 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2510 = _2498 * (-0.15915493667125701904296875);
    int _2512 = _2504;
    float _2514 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    if (!_2448)
    {
        int _2516 = ~_2444;
        int _2518 = _2516 + 1;
        _2512 = _2518;
    }
    int _2520 = _2512;
    float _2522 = fma(_2420, (*spvDescriptorSet0.vp_c9)._m0[98].z, _2494);
    float _2524 = _2420 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _2526 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2422);
    bool _2528 = _2490 >= 0.0;
    float _2530 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _2532 = _2510 * 6.283185482025146484375;
    float _2534 = sin(_2532);
    float _2536 = _2484 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2538 = fma(_2350, _2508, -0.5);
    float _2540 = -_2530;
    float _2542 = fma(_2524, 2.0, _2540);
    float _2544 = _2496 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _2546 = fma(_2332, _2536, -0.5);
    float _2548 = _2530;
    if (_2298)
    {
        _2548 = _2268;
    }
    float _2550 = _2548;
    float _2552 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2416);
    float _2554 = _2510 * 6.283185482025146484375;
    float _2556 = cos(_2554);
    float _2558 = fma(_2328, _2544, -0.5);
    float _2560 = _2438 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _2562 = _2550;
    if (!_2298)
    {
        _2562 = _2260;
    }
    float _2564 = _2562;
    float _2566 = fma(_2068, _2104, _2474);
    float _2568 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2570 = _2564 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2572 = as_type<int>(_2564);
    if (_2528)
    {
        _2514 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2574 = _2514;
    float _2576 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _2578 = -_2552;
    float _2580 = fma(_2526, _2538, _2578);
    float _2582 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _2584 = -_2568;
    float _2586 = fma(_2570, 2.0, _2584);
    float _2588 = fma(_2560, -2.0, _2576);
    float _2590 = _2534 * _2162;
    float _2592 = fma(_2438, (*spvDescriptorSet0.vp_c9)._m0[98].w, _2582);
    float _2594 = _2556 * _2162;
    float _2596 = 0.0;
    float _2598 = 0.0;
    if (_2528)
    {
        float _2600 = _2574 * 5.0;
        _2572 = as_type<int>(_2600);
    }
    int _2602 = _2572;
    float _2604 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].w, _2592);
    float _2606 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[96].y, _2588);
    float _2608 = -_2590;
    float _2610 = fma(_2556, _2300, _2608);
    float _2612 = fma(_2534, _2300, _2594);
    if (_2528)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7978 = as_type<float>(_2602);
        out.gl_Position.z = _7978;
    }
    float _2614 = fma(_2136, _2062, _2566);
    float _2616 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].z, _2522);
    float _2618 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2620 = -_128;
    float _2622 = fma(_2620, (*spvDescriptorSet0.vp_c9)._m0[96].x, _2542);
    float _2624 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1924);
    float _2626 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2628 = -_128;
    float _2630 = fma(_2628, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2372);
    float _2632 = fma(_2616, _2434, _2622);
    float _2634 = fma(_1716, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2626);
    float _2636 = -_2606;
    float _2638 = fma(_2604, _2558, _2636);
    float _2640 = _2630;
    if (!_2316)
    {
        _2596 = _1716;
    }
    float _2642 = _2596;
    float _2644 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2646 = log2(_2644);
    float _2648 = _2642;
    if (!_2316)
    {
        _2598 = _2260;
    }
    float _2650 = _2598;
    float _2652 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _2654 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2634);
    float _2656 = _2650;
    if (_2316)
    {
        _2656 = _1716;
    }
    float _2658 = _2656;
    float _2660 = fma(_2138, _2020, _2614);
    float _2662 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2664 = _2662;
    if (!_2316)
    {
        _2166 = _2642;
    }
    float _2666 = _2166;
    float _2668 = fma(_2658, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2618);
    float _2670 = _2666;
    if (_2316)
    {
        _2648 = _2268;
    }
    float _2672 = _2648;
    float _2674 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_2316)
    {
        _2670 = _2268;
    }
    float _2676 = _2670;
    float _2678 = -_2624;
    float _2680 = fma(_2654, _2612, _2678);
    if (_2298)
    {
        _2146 = _1716;
    }
    float _2682 = _2146;
    float _2684 = fma(_2672, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2662);
    float _2686 = fma(_2268, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2674);
    float _2688 = _2682;
    if (_2298)
    {
        _2664 = _2260;
    }
    float _2690 = _2664;
    float _2692 = _2488 + 0.5;
    float _2694 = _2690;
    if (!_2298)
    {
        _2694 = _1716;
    }
    float _2696 = _2694;
    float _2698 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2686);
    float _2700 = _2580 + 0.5;
    float _2702 = _2676 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2704 = fma(_2698, _2610, _2630);
    float _2706 = fma(_2696, (*spvDescriptorSet0.vp_c9)._m0[89].z, _2652);
    if (!_2316)
    {
        _2640 = _2260;
    }
    float _2708 = _2640;
    out.m_63.x = _2692;
    out.m_63.y = _2700;
    float _2710 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2712 = _2708;
    if (_2316)
    {
        _2712 = _1716;
    }
    float _2714 = _2712;
    float _2716 = _2646 * _128;
    if (!_2298)
    {
        _2688 = _2268;
    }
    float _2718 = _2688;
    float _2720 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2722 = -_2710;
    float _2724 = fma(_2702, 2.0, _2722);
    float _2726 = _2714 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2728 = float(_2414);
    float _2730 = _2638 + 0.5;
    float _2732 = _2632 + 0.5;
    bool _2734 = !_2338;
    int _2736 = _2734 ? 0 : 1;
    float _2738 = fma(_2726, -2.0, _2720);
    float _2740 = _2718 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2742 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2744 = abs(_2736);
    float _2746 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2660);
    bool _2748 = !_2342;
    int _2750 = _2748 ? 0 : 1;
    float _2752 = fma(_2740, -2.0, _2742);
    out.m_65.x = _2732;
    out.m_65.y = _2730;
    int _2754 = abs(_2750);
    float _2756 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2684);
    float _2758 = -_128;
    float _2760 = fma(_2758, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2724);
    float _2762 = float(_2754);
    float _2764 = exp2(_2716);
    float _2766 = float(_2520);
    float _2768 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[89].x, _2706);
    float _2770 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2668);
    float _2772 = float(_2744);
    float _2774 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2776 = 1.0 + _2774;
    float _2778 = _2762 * _2766;
    float _2780 = fma(_2756, _2382, _2760);
    float _2782 = in.m_67.x;
    float _2784 = in.m_67.y;
    float _2786 = _2772 * _2728;
    float _2788 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2738);
    float _2790 = 1.0 / _2776;
    float _2792 = in.m_69.x;
    float _2794 = in.m_69.y;
    float _2796 = in.m_69.z;
    float _2798 = _2768 * (-0.15915493667125701904296875);
    float _2800 = -_2788;
    float _2802 = fma(_2770, _1898, _2800);
    float _2804 = -_2764;
    float _2806 = _2804 + 1.0;
    out.m_71.x = _2746;
    float _2808 = _2798 * 6.283185482025146484375;
    float _2810 = cos(_2808);
    float _2812 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _2814 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2816 = isnan(1.0);
    bool _2818 = _2814 || _2816;
    bool _2820 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2822 = _2818 || _2820;
    float _2824 = in.m_73.x;
    float _2826 = in.m_73.y;
    float _2828 = in.m_73.z;
    float _2830 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2832 = fma(_1716, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2812);
    bool _2834 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2836 = isnan(0.0);
    bool _2838 = _2834 || _2836;
    bool _2840 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2842 = _2838 || _2840;
    float _2844 = -_128;
    float _2846 = fma(_2844, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2586);
    float _2848 = _2798 * 6.283185482025146484375;
    float _2850 = sin(_2848);
    float _2852 = fma(_2268, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2830);
    float _2854 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2832);
    float _2856 = _2786 * (-2.0);
    float _2858 = _2842 ? _2806 : 0.0;
    float _2860 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2852);
    float _2862 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2752);
    float _2864 = fma(_2472, _2856, _2472);
    float _2866 = _2810 * _2546;
    float _2868 = _2784 * 37.6991119384765625;
    if (_2822)
    {
        float _2870 = _2858 * _2790;
        _146 = _2870;
    }
    float _2872 = _146;
    float _2874 = fma(_2856, _2792, _2792);
    float _2876 = _2268 + (-0.5);
    float _2878 = _2442 * _2442;
    float _2880 = _2868 * 0.15915493667125701904296875;
    if (_2528)
    {
        out.m_45.x = 0.0;
    }
    float _2882 = _2850 * _2546;
    float _2884 = fma(_2850, _2334, _2866);
    float _2886 = fma(_2876, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2874);
    float _2888 = _2826 * _2826;
    float _2890 = -_2882;
    float _2892 = fma(_2810, _2334, _2890);
    float _2894 = fma(_2454, _2454, _2878);
    float _2896 = _2778 * (-2.0);
    float _2898 = fma(_2824, _2824, _2888);
    float _2900 = fma(_2860, _2892, _2846);
    float _2902 = fma(_2482, _2482, _2894);
    float _2904 = fma(_2506, _2896, _2506);
    float _2906 = fma(_2896, _2794, _2794);
    float _2908 = fma(_2828, _2828, _2898);
    float _2910 = rsqrt(_2902);
    float _2912 = -_2862;
    float _2914 = fma(_2854, _2884, _2912);
    float _2916 = _2704 + 0.5;
    float _2918 = _2900 + 0.5;
    float _2920 = _2680 + 0.5;
    float _2922 = _2780 + 0.5;
    float _2924 = _2802 + 0.5;
    float _2926 = _2914 + 0.5;
    float _2928 = _2880 * 6.283185482025146484375;
    float _2930 = sin(_2928);
    bool _2932 = !_2346;
    int _2934 = _2932 ? 0 : 1;
    float _2936 = fma(_2864, _2872, _2886);
    out.m_75.x = _2916;
    out.m_75.y = _2920;
    out.m_75.z = _2922;
    out.m_75.w = _2924;
    float _2938 = float(_2308);
    float _2940 = _1716 + (-0.5);
    int _2942 = abs(_2934);
    out.m_77.x = _2918;
    out.m_77.y = _2926;
    float _2944 = rsqrt(_2908);
    float _2946 = _2442 * _2910;
    float _2948 = _2454 * _2910;
    if (_2528)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2950 = -_2946;
    float _2952 = fma(_2950, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2296);
    float _2954 = _2482 * _2910;
    float _2956 = -_2948;
    float _2958 = fma(_2956, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2314);
    float _2960 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2962 = _2952 + _2960;
    float _2964 = float(_2942);
    float _2966 = fma(_2940, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2906);
    float _2968 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2970 = _2958 + _2968;
    float _2972 = _2962 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2974 = -_2954;
    float _2976 = fma(_2974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2318);
    float _2978 = _2964 * _2938;
    float _2980 = -_2946;
    float _2982 = fma(_2980, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2442);
    float _2984 = fma(_2970, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2972);
    float _2986 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2988 = _2976 + _2986;
    float _2990 = _2936 * 0.15915493667125701904296875;
    float _2992 = _2268 + _2260;
    float _2994 = -_2948;
    float _2996 = fma(_2994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2454);
    float _2998 = fma(_2988, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2984);
    float _3000 = _2982 * _2982;
    float _3002 = _2978 * (-2.0);
    float _3004 = _2992 + (-1.0);
    float _3006 = _2990 * 6.283185482025146484375;
    float _3008 = sin(_3006);
    bool _3010 = _2998 >= 0.0;
    float _3012 = fma(_2904, _2872, _2966);
    float _3014 = fma(_3004, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3016 = _3012 * 0.15915493667125701904296875;
    float _3018 = _2990 * 6.283185482025146484375;
    float _3020 = cos(_3018);
    if (_3010)
    {
        out.m_45.x = 0.0;
    }
    float _3022 = _3016 * 6.283185482025146484375;
    float _3024 = sin(_3022);
    float _3026 = fma(_2996, _2996, _3000);
    float _3028 = fma(_3002, _2796, _2796);
    float _3030 = _2260 + (-0.5);
    float _3032 = fma(_3014, _3002, _3014);
    float _3034 = -_2954;
    float _3036 = fma(_3034, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2482);
    float _3038 = _2930 * 0.20000000298023223876953125;
    float _3040 = fma(_3030, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3028);
    float _3042 = _3016 * 6.283185482025146484375;
    float _3044 = cos(_3042);
    float _3046 = fma(_3036, _3036, _3026);
    float _3048 = _3038 * _2782;
    float _3050 = fma(_3032, _2872, _3040);
    float _3052 = _3038;
    int _3054 = as_type<int>(_3050);
    if (_3010)
    {
        _3052 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3056 = _3052;
    float _3058 = _2944 * _3048;
    float _3060 = _3050 * 0.15915493667125701904296875;
    if (_3010)
    {
        float _3062 = _3056 * 5.0;
        _3054 = as_type<int>(_3062);
    }
    int _3064 = _3054;
    float _3066 = sqrt(_3046);
    float _3068 = fma(_2824, _3058, _2824);
    float _3070 = fma(_2826, _3058, _2826);
    float _3072 = fma(_2828, _3058, _2828);
    if (_3010)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8771 = as_type<float>(_3064);
        out.gl_Position.z = _8771;
    }
    float _3074 = _3008 * _3024;
    float _3076 = _3020 * _3044;
    float _3078 = _3060 * 6.283185482025146484375;
    float _3080 = sin(_3078);
    float _3082 = _568 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_3010)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3084 = _3060 * 6.283185482025146484375;
    float _3086 = cos(_3084);
    float _3088 = _2910 * _3066;
    float _3090 = _570 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3092 = _658 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3094 = fma(_3080, _3076, _3074);
    float _3096 = _3088 * _3082;
    float _3098 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3070);
    float _3100 = _3088 * _3090;
    float _3102 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3072);
    float _3104 = _3088 * _3092;
    float _3106 = _3096 * _3098;
    float _3108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3068);
    float _3110 = fma(_3080, _3074, _3076);
    float _3112 = _3020 * _3024;
    float _3114 = _3008 * _3044;
    float _3116 = _3086 * _3106;
    float _3118 = _3100 * _3102;
    float _3120 = _3104 * _3108;
    float _3122 = -_3112;
    float _3124 = fma(_3080, _3114, _3122);
    float _3126 = _3020 * _3116;
    float _3128 = _3024 * _3086;
    float _3130 = _3044 * _3086;
    float _3132 = -_3114;
    float _3134 = fma(_3080, _3112, _3132);
    float _3136 = -_3106;
    float _3138 = _3080 * _3136;
    float _3140 = fma(_3094, _3120, _3126);
    float _3142 = -_2296;
    float _3144 = _3142 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3146 = _3008 * _3116;
    float _3148 = fma(_3130, _3120, _3138);
    float _3150 = fma(_3134, _3118, _3140);
    float _3152 = -_2314;
    float _3154 = _3152 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3156 = _3144 * _3144;
    float _3158 = fma(_3124, _3120, _3146);
    float _3160 = fma(_3128, _3118, _3148);
    float _3162 = _3150 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3164 = fma(_3154, _3154, _3156);
    float _3166 = -_2318;
    float _3168 = _3166 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3170 = fma(_3110, _3118, _3158);
    float _3172 = _3150 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3174 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3162);
    float _3176 = _3150 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3178 = fma(_3168, _3168, _3164);
    float _3180 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3172);
    float _3182 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3174);
    float _3184 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3176);
    float _3186 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3180);
    float _3188 = _3182 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3190 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3184);
    float _3192 = sqrt(_3178);
    float _3194 = _3186 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3196 = _2296 + _3188;
    float _3198 = _3190 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3200 = _2314 + _3194;
    float _3202 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _3204 = _3196 + _3202;
    float _3206 = _2318 + _3198;
    float _3208 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _3210 = _3200 + _3208;
    float _3212 = _3204 * _3204;
    float _3214 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _3216 = _3206 + _3214;
    float _3218 = fma(_3210, _3210, _3212);
    float _3220 = precise::max(_3192, 5.0);
    float _3222 = fma(_3216, _3216, _3218);
    float _3224 = -_266;
    float _3226 = _3224 + 1.0;
    float _3228 = precise::min(_3220, 20.0);
    float _3230 = rsqrt(_3222);
    float _3232 = fma(_3228, 0.066666670143604278564453125, -0.3333333432674407958984375);
    float _3234 = _3226 * _3232;
    float _3236 = _3234 * 10.0;
    float _3238 = -_2946;
    float _3240 = fma(_3238, _3236, _2442);
    float _3242 = _3204 * _3230;
    float _3244 = _3210 * _3230;
    float _3246 = _3216 * _3230;
    float _3248 = -_2948;
    float _3250 = fma(_3248, _3236, _2454);
    float _3252 = _3242 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _3254 = _3240 * _3240;
    float _3256 = -_2954;
    float _3258 = fma(_3256, _3236, _2482);
    float _3260 = -_2954;
    float _3262 = fma(_3260, _3236, _2318);
    float _3264 = fma(_3244, (*spvDescriptorSet0.vp_c10)._m0[8].y, _3252);
    float _3266 = fma(_3250, _3250, _3254);
    float _3268 = -_2948;
    float _3270 = fma(_3268, _3236, _2314);
    float _3272 = -_2946;
    float _3274 = fma(_3272, _3236, _2296);
    float _3276 = fma(_3246, (*spvDescriptorSet0.vp_c10)._m0[10].y, _3264);
    float _3278 = precise::clamp(_3276, 0.0, 1.0);
    float _3280 = fma(_3258, _3258, _3266);
    float _3282 = _3278 * 3.1415927410125732421875;
    float _3284 = sqrt(_3280);
    float _3286 = _3282 * 0.15915493667125701904296875;
    float _3288 = _266 * _266;
    float _3290 = _3288 * 15.0;
    float _3292 = _3286 * 6.283185482025146484375;
    float _3294 = sin(_3292);
    float _3296 = _2910 * _3284;
    float _3298 = fma(_3198, _3296, _3262);
    float _3300 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[32].x;
    float _3302 = fma(_3194, _3296, _3270);
    float _3304 = fma(_3188, _3296, _3274);
    float _3306 = _3294 * _3288;
    float _3308 = _3306 * 4.0;
    float _3310 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[32].z;
    float _3312 = fma(_3308, (*spvDescriptorSet0.vp_c10)._m0[8].y, _3300);
    float _3314 = fma(_3308, (*spvDescriptorSet0.vp_c10)._m0[10].y, _3310);
    float _3316 = fma(_3312, _2782, _3302);
    float _3318 = fma(_3314, _2782, _3298);
    float _3320 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3322 = _3316 + _3320;
    float _3324 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3326 = _3318 + _3324;
    float _3328 = _3326 * _3326;
    float _3330 = fma(_3322, _3322, _3328);
    float _3332 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[32].y;
    float _3334 = sqrt(_3330);
    float _3336 = fma(_3308, (*spvDescriptorSet0.vp_c10)._m0[9].y, _3332);
    float _3338 = fma(_3336, _2782, _3304);
    bool _3340 = _3334 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3342 = _3290;
    float _3344 = _3336;
    float _3346 = _3316;
    if (!_3340)
    {
        _3342 = _3318;
    }
    float _3348 = _3342;
    float _3350 = _3348;
    if (!_3340)
    {
        _3344 = _3338;
    }
    float _3352 = _3344;
    bool _3354 = !_3340;
    float _3356 = _3352;
    if (!_3354)
    {
        float _3358 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3360 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3362 = _3334 + _3360;
        float _3364 = _3338 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3366 = rsqrt(_3330);
        float _3368 = _3362 * _3358;
        float _3370 = _3368 * 0.15915493667125701904296875;
        float _3372 = _3370 * 6.283185482025146484375;
        float _3374 = cos(_3372);
        float _3376 = _3370 * 6.283185482025146484375;
        float _3378 = sin(_3376);
        float _3380 = _3374 + (-1.0);
        float _3382 = _3380 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3384 = fma(_3378, _3364, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3386 = fma(_3338, _3374, _3382);
        float _3388 = _3366 * _3384;
        float _3390 = fma(_3322, _3388, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3392 = fma(_3326, _3388, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3356 = _3386;
        _3346 = _3390;
        _3350 = _3392;
    }
    float _3394 = _3356;
    float _3396 = _3346;
    float _3398 = _3350;
    float _3400 = -_2946;
    float _3402 = fma(_3400, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3394);
    float _3404 = -_2948;
    float _3406 = fma(_3404, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3396);
    float _3408 = -_2954;
    float _3410 = fma(_3408, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3398);
    float _3412 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3414 = _3402 + _3412;
    float _3416 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3418 = _3406 + _3416;
    float _3420 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3422 = _3410 + _3420;
    float _3424 = _3414 * _3414;
    float _3426 = fma(_3418, _3418, _3424);
    float _3428 = fma(_3422, _3422, _3426);
    float _3430 = rsqrt(_3428);
    float _3432 = sqrt(_3428);
    float _3434 = _3430 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3436 = _3418 * _3434;
    float _3438 = _3422 * _3434;
    float _3440 = _3436 * _3436;
    float _3442 = _3438 * _3438;
    float _3444 = _3440 + _3442;
    float _3446 = sqrt(_3444);
    bool _3448 = _3446 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3450 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3452 = _3446 + _3450;
    float _3454 = _2296;
    float _3456 = _3444;
    float _3458 = _3452;
    float _3460 = _3414;
    float _3462 = _3434;
    float _3464 = _3436;
    if (_3448)
    {
        float _3466 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3454 = _3466;
    }
    float _3468 = _3454;
    if (_3448)
    {
        float _3470 = rsqrt(_3444);
        _3456 = _3470;
    }
    float _3472 = _3456;
    float _3474 = _3468;
    float _3476 = _3472;
    if (_3448)
    {
        float _3478 = _3452 * _3468;
        _3458 = _3478;
    }
    float _3480 = _3458;
    if (_3448)
    {
        float _3482 = _3480 * 0.15915493667125701904296875;
        _3474 = _3482;
    }
    float _3484 = _3474;
    float _3486 = _3422;
    float _3488 = _3484;
    if (_3448)
    {
        float _3490 = _3484 * 6.283185482025146484375;
        float _3492 = sin(_3490);
        _3486 = _3492;
    }
    float _3494 = _3486;
    float _3496 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3498 = precise::max(0.0, _3496);
    float _3500 = _2948;
    float _3502 = _3498;
    if (_3448)
    {
        float _3504 = _3484 * 6.283185482025146484375;
        float _3506 = cos(_3504);
        _3500 = _3506;
    }
    float _3508 = _3500;
    float _3510 = -_3434;
    float _3512 = -_3498;
    float _3514 = fma(_3414, _3510, _3512);
    if (_3448)
    {
        float _3516 = _3514 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3460 = _3516;
    }
    float _3518 = _3460;
    float _3520 = _3494;
    float _3522 = _3518;
    if (_3448)
    {
        float _3524 = fma(_3494, _3518, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3520 = _3524;
    }
    float _3526 = _3520;
    float _3528 = _3526;
    if (!_3448)
    {
        _3522 = _3438;
    }
    float _3530 = _3522;
    float _3532 = _3530;
    if (_3448)
    {
        float _3534 = _3508 + (-1.0);
        _3502 = _3534;
    }
    float _3536 = _3502;
    float _3538 = _3536;
    if (_3448)
    {
        float _3540 = _3472 * _3526;
        _3462 = _3540;
    }
    float _3542 = _3462;
    if (!_3448)
    {
        _3528 = _3514;
    }
    float _3544 = _3528;
    float _3546 = _3544;
    if (_3448)
    {
        float _3548 = _3536 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3488 = _3548;
    }
    float _3550 = _3488;
    if (_3448)
    {
        float _3552 = _3436 * _3542;
        _3464 = _3552;
    }
    float _3554 = _3464;
    if (!_3448)
    {
        _3476 = _3440;
    }
    float _3556 = _3476;
    float _3558 = _3556;
    if (_3448)
    {
        float _3560 = _3438 * _3542;
        _3532 = _3560;
    }
    float _3562 = _3532;
    if (_3448)
    {
        float _3564 = fma(_3514, _3508, _3550);
        _3546 = _3564;
    }
    float _3566 = _3546;
    if (_3448)
    {
        float _3568 = _3554 * _3554;
        _3558 = _3568;
    }
    float _3570 = _3558;
    float _3572 = _3402 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_3448)
    {
        _3538 = _3442;
    }
    float _3574 = _3538;
    float _3576 = _3574;
    if (_3448)
    {
        float _3578 = _3562 * _3562;
        _3576 = _3578;
    }
    float _3580 = _3576;
    float _3582 = fma(_3566, _3566, _3570);
    float _3584 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3586 = fma(_3432, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3584);
    float _3588 = precise::clamp(_3586, 0.0, 1.0);
    float _3590 = _3402 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3592 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3572);
    float _3594 = _3582 + _3580;
    float _3596 = _3402 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3598 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3590);
    float _3600 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3592);
    float _3602 = _3402 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3604 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3596);
    float _3606 = rsqrt(_3594);
    float _3608 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3598);
    float _3610 = _3600 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3612 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3604);
    float _3614 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3602);
    float _3616 = _3608 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3618 = -_3588;
    float _3620 = _3618 + 1.0;
    float _3622 = _3612 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3624 = _3610 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3626 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3614);
    float _3628 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3630 = _3616 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3632 = fma(_3622, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3624);
    float _3634 = _3626 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3636 = abs(_3620);
    float _3638 = log2(_3636);
    float _3640 = -_3630;
    float _3642 = fma(_3640, _3628, 1.0);
    float _3644 = fma(_3616, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3632);
    float _3646 = _3606 * _3554;
    float _3648 = _3606 * _3566;
    float _3650 = _3606 * _3562;
    float _3652 = fma(_3634, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3644);
    float _3654 = _3646 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3656 = log2(_3642);
    float _3658 = _3648 + 1.0;
    float _3660 = -_3654;
    float _3662 = fma(_3648, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3660);
    float _3664 = _3610 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3666 = -_3650;
    float _3668 = fma(_3666, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3662);
    float _3670 = _3638 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3672 = _3610 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3674 = 1.0 / _3652;
    float _3676 = fma(_3668, -0.5, 0.5);
    float _3678 = fma(_3668, 0.5, 0.5);
    float _3680 = fma(_3622, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3672);
    float _3682 = fma(_3622, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3664);
    float _3684 = fma(_3678, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3686 = fma(_3616, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3680);
    float _3688 = exp2(_3670);
    float _3690 = _3656 * 0.693147182464599609375;
    float _3692 = fma(_3678, _3684, -0.212114393711090087890625);
    float _3694 = fma(_3634, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3686);
    float _3696 = _3690 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3698 = fma(_3678, _3692, 1.570728778839111328125);
    float _3700 = sqrt(_3676);
    float _3702 = fma(_3616, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3682);
    float _3704 = fma(_3634, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3702);
    float _3706 = _3694 * _3674;
    float _3708 = -_3648;
    float _3710 = fma(_3688, _3658, _3708);
    float _3712 = _3704 * _3674;
    float _3714 = fma(_3706, 0.5, 0.5);
    float _3716 = fma(_3710, 0.5, 0.5);
    float _3718 = fma(_3712, -0.5, 0.5);
    float _3720 = _3700 * 0.636619746685028076171875;
    float _3722 = -_3698;
    float _3724 = fma(_3720, _3722, 1.0);
    float3 _9852 = float3(_3714, _3718, _3696);
    float _3726 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9852, float3(0.0), isnan(_9852)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9852, float3(0.0), isnan(_9852)), level(0.0)).x;
    float3 _9863 = float3(_3714, _3718, _3696);
    float4 _3729 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9863, float3(0.0), isnan(_9863)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9863, float3(0.0), isnan(_9863)), level(0.0)).xyzw;
    float _3731 = _3729.x;
    float _3733 = _3729.y;
    float _3735 = _3729.z;
    float _3737 = _3729.w;
    float2 _9880 = float2(_3724, _3716);
    float3 _3741 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9880, float2(0.0), isnan(_9880)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9880, float2(0.0), isnan(_9880)), level(0.0)).xyz;
    float _3743 = _3741.x;
    float _3745 = _3741.y;
    float _3747 = _3741.z;
    float _3749 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3751 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3753 = _3638 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3755 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3757 = isnan(0.5);
    bool _3759 = _3755 || _3757;
    bool _3761 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3763 = _3759 || _3761;
    float _3765 = fma(_2958, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3749);
    float _3767 = fma(_2958, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3751);
    float _3769 = _3610 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_53.x = _834;
    out.m_53.y = _840;
    out.m_53.z = _836;
    out.m_53.w = _842;
    float _3771 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3765);
    float _3773 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3767);
    float _3775 = exp2(_3753);
    float _3777 = fma(_3622, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3769);
    float _3779 = _3771 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3781 = _3773 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_55.x = _960;
    out.m_55.y = _962;
    out.m_55.z = _964;
    out.m_55.w = _958;
    float _3783 = fma(_3616, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3777);
    float _3785 = _3781 + _3779;
    float _3787 = 1.0 / _3779;
    float _3789 = fma(_3634, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3783);
    if (_3763)
    {
        _968 = 1.0;
    }
    float _3791 = _968;
    float _3793 = _3785 * _3787;
    float _3795 = _3793 * 0.5;
    float _3797 = _3791;
    if (!_3763)
    {
        float _3799 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3801 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3803 = _3799 * 0.15915493667125701904296875;
        float _3805 = _3801 * 0.15915493667125701904296875;
        float _3807 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3809 = fma(_3795, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3807);
        float _3811 = _3803 * 6.283185482025146484375;
        float _3813 = cos(_3811);
        float _3815 = _3803 * 6.283185482025146484375;
        float _3817 = sin(_3815);
        float _3819 = 1.0 / _3813;
        float _3821 = _3805 * 6.283185482025146484375;
        float _3823 = cos(_3821);
        float _3825 = _3817 * _3819;
        float _3827 = _3805 * 6.283185482025146484375;
        float _3829 = sin(_3827);
        float _3831 = _3823 * _3825;
        float _3833 = 1.0 / _3809;
        float _3835 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3837 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3835;
        float _3839 = 1.0 / _3831;
        float _3841 = 1.0 / _3837;
        float _3843 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3845 = _3833 * _3843;
        float _3847 = _3829 * _3839;
        float _3849 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3851 = fma(_3847, _3845, _3849);
        float _3853 = _3851 * _3841;
        float _3855 = precise::clamp(_3853, 0.0, 1.0);
        _3797 = _3855;
    }
    float _3857 = _3797;
    float _3859 = _3652 * 0.5;
    float _3861 = -_3775;
    float _3863 = _3861 + 1.0;
    float _3865 = _3694 + _3652;
    float _3867 = _3857 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3869 = fma(_3704, -0.5, _3859);
    float _3871 = _3863 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3873 = _3857 > 0.0;
    bool _3875 = isnan(_3857);
    bool _3877 = _3873 || _3875;
    bool _3879 = isnan(0.0);
    bool _3881 = _3877 || _3879;
    float _3883 = _3865 * 0.5;
    float _3885 = _3867 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3887 = _3871 * _3726;
    float _3889 = _3789 + _3652;
    float _3891 = -_3871;
    float _3893 = _3891 + 1.0;
    float _3895 = _3737 * _3887;
    float _3897 = _3747 * _3887;
    float _3899 = _3889 * 0.5;
    float _3901 = fma(_3743, _3895, _3731);
    float _3903 = fma(_3745, _3895, _3733);
    float _3905 = _3737 * _3893;
    float _3907 = fma(_3737, _3897, _3735);
    out.m_79.x = _3406;
    out.m_79.y = _3402;
    out.m_79.z = _3410;
    out.gl_Position.x = _3694;
    out.gl_Position.y = _3704;
    out.gl_Position.z = _3789;
    out.gl_Position.w = _3652;
    out.m_81.x = _3883;
    out.m_81.y = _3869;
    out.m_81.z = _3899;
    out.m_81.w = _3652;
    out.m_45.x = _3885;
    out.m_83.x = _3901;
    out.m_83.y = _3903;
    out.m_83.z = _3907;
    out.m_83.w = _3905;
    if (_3881)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3909 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3909;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1682 = false;
    bool _1360 = false;
    bool _988 = false;
    bool _864 = false;
    bool _690 = false;
    bool _516 = false;
    bool _300 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_42.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    float _110 = as_type<float>(_102);
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _108;
    if (!_106)
    {
        out.m_45.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3967 = as_type<float>(_118);
        out.gl_Position.z = _3967;
    }
    if (!_106)
    {
        return out;
    }
    float _122 = in.m_47.w;
    float _124 = float(_102);
    float _126 = -_122;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_122);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    bool _140 = _128 >= _124;
    bool _142 = !_138;
    bool _144 = _140 || _142;
    float _146 = _128;
    if (_144)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _110;
    if (_144)
    {
        out.m_45.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _120 = as_type<int>(_150);
    }
    int _152 = _120;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4031 = as_type<float>(_152);
        out.gl_Position.z = _4031;
    }
    if (_144)
    {
        return out;
    }
    float _154 = in.m_49.w;
    float _156 = 1.0 / _124;
    float _158 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_47.x;
    float _172 = in.m_47.y;
    float _174 = in.m_47.z;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = 0.0;
    float _184 = _158;
    if (!_168)
    {
        float _186 = _158 * _158;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_168)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_168;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _158 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _158);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_168;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _158 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = _128 * _156;
    float _268 = fma(_256, _170, _260);
    float _270 = fma(_256, _172, _262);
    float _272 = fma(_256, _174, _264);
    float _274 = fma(_268, _154, _176);
    float _276 = fma(_270, _154, _178);
    float _278 = fma(_272, _154, _180);
    bool _280 = !_258;
    float _298;
    if (!_280)
    {
        float _282 = in.m_51.x;
        float _284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _286 = _282 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _290 = _288 * _284;
        float _292 = floor(_290);
        float _294 = -_292;
        float _296 = _290 + _294;
        _298 = _296;
        _300 = true;
    }
    else
    {
        _298 = _266;
    }
    _300 = false;
    float _302 = _298;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = _302 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _310 = _302 + _308;
    bool _312 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _314 = isnan(_302);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = _302 + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _340 = 1.0 / _326;
    bool _342 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _344 = 1.0 / _338;
    float _346 = 1.0 / _334;
    float _348 = _306 * _340;
    bool _350 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _352 = isnan(_302);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -_322;
    float _364 = _362 + 1.0;
    float _366 = _360 * _364;
    float _368 = _310 * _344;
    bool _370 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _372 = isnan(_302);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    bool _386 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _388 = isnan(_302);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = -_360;
    float _404 = _402 + 1.0;
    float _406 = -_380;
    float _408 = _406 + 1.0;
    float _410 = _330 * _346;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _416;
    float _420 = _396 * _408;
    float _422 = fma(_384, _410, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _424 = fma(_414, _410, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _426 = fma(_418, _410, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _428 = _380 * _404;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _434 = _424 * _420;
    float _436 = _426 * _420;
    float _438 = _422 * _420;
    float _440 = -_396;
    float _442 = _440 + 1.0;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[143].x, _436);
    float _450 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[143].y, _434);
    float _452 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[143].z, _438);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _454;
    float _458 = fma(_400, _368, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _460 = fma(_446, _368, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _462 = fma(_432, _368, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _468;
    float _472 = fma(_458, _428, _448);
    float _474 = fma(_456, _348, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _476 = fma(_466, _348, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _478 = fma(_470, _348, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _480 = fma(_460, _428, _450);
    float _482 = fma(_462, _428, _452);
    float _484 = fma(_474, _366, _472);
    float _486 = fma(_476, _366, _480);
    float _488 = fma(_478, _366, _482);
    float _490 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[146].x, _484);
    float _492 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[146].y, _486);
    float _494 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[146].z, _488);
    bool _496 = !_342;
    float _514;
    if (!_496)
    {
        float _498 = in.m_51.x;
        float _500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _502 = _498 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _506 = _504 * _500;
        float _508 = floor(_506);
        float _510 = -_508;
        float _512 = _506 + _510;
        _514 = _512;
        _516 = true;
    }
    else
    {
        _514 = _266;
    }
    _516 = false;
    float _518 = _514;
    float _520 = in.m_49.x;
    float _522 = in.m_49.y;
    float _524 = in.m_49.z;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _528 = _518 + _526;
    bool _530 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _532 = isnan(_518);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _542;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _550 = 1.0 / _544;
    bool _552 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _554 = isnan(_518);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    bool _564 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _566 = 1.0 / _548;
    float _568 = _492 * _522;
    float _570 = _494 * _524;
    bool _572 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _574 = isnan(_518);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = -_540;
    float _586 = _584 + 1.0;
    float _588 = _528 * _550;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _592 = _518 + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _594;
    float _598 = _582 * _586;
    float _600 = -_582;
    float _602 = _600 + 1.0;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _608;
    float _612 = fma(_596, _588, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _614 = _562 * _602;
    float _616 = fma(_606, _588, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _618 = fma(_610, _588, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _620 = _592 * _566;
    float _622 = -_562;
    float _624 = _622 + 1.0;
    float _626 = _616 * _614;
    float _628 = _618 * _614;
    float _630 = _612 * _614;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _644 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[107].x, _626);
    float _646 = fma(_634, _620, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _648 = fma(_638, _620, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _650 = fma(_642, _620, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _652 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[107].y, _628);
    float _654 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[107].z, _630);
    float _656 = fma(_646, _598, _644);
    float _658 = _490 * _520;
    float _660 = fma(_648, _598, _652);
    float _662 = fma(_650, _598, _654);
    float _664 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[109].x, _656);
    float _666 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[109].y, _660);
    float _668 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[109].z, _662);
    bool _670 = !_564;
    float _688;
    if (!_670)
    {
        float _672 = in.m_51.x;
        float _674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _676 = _672 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _680 = _678 * _674;
        float _682 = floor(_680);
        float _684 = -_682;
        float _686 = _680 + _684;
        _688 = _686;
        _690 = true;
    }
    else
    {
        _688 = _266;
    }
    _690 = false;
    float _692 = _688;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _696 = _692 + _694;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _706 = _692 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _708 = isnan(_692);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _722 = _692 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _724 = isnan(_692);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = 1.0 / _700;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _736;
    float _740 = -_716;
    float _742 = _740 + 1.0;
    bool _744 = _692 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _746 = isnan(_692);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    bool _756 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _758 = 1.0 / _704;
    float _760 = 1.0 / _720;
    float _762 = _738 * _734;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _768 = _732 * _742;
    float _770 = -_732;
    float _772 = _770 + 1.0;
    float _774 = fma(_762, _696, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _776;
    float _780 = _754 * _772;
    float _782 = _766 * _758;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _786 = _692 + _784;
    bool _788 = _692 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _790 = isnan(_692);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = _774 * _780;
    float _802 = -_754;
    float _804 = _802 + 1.0;
    float _806 = fma(_782, _786, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _810 = _692 + _808;
    float _812 = _778 * _760;
    float _814 = -_798;
    float _816 = _814 + 1.0;
    float _818 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[115].x, _800);
    float _820 = _666 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _822 = fma(_812, _810, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _824 = _716 * _816;
    float _826 = fma(_806, _768, _818);
    float _828 = _664 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _830 = _668 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _832 = fma(_822, _824, _826);
    float _834 = _828 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _836 = _830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _838 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[118].x, _832);
    float _840 = _820 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _842 = _838 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _834;
    out.m_53.y = _840;
    out.m_53.z = _836;
    out.m_53.w = _842;
    bool _844 = !_756;
    float _862;
    if (!_844)
    {
        float _846 = in.m_51.x;
        float _848 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _850 = _846 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _852 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _854 = _852 * _848;
        float _856 = floor(_854);
        float _858 = -_856;
        float _860 = _854 + _858;
        _862 = _860;
        _864 = true;
    }
    else
    {
        _862 = _266;
    }
    _864 = false;
    float _866 = _862;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _870 = _866 + _868;
    bool _872 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _874 = isnan(_866);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _884;
    bool _888 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _890 = isnan(_866);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = -_882;
    float _902 = _900 + 1.0;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _904;
    float _908 = 1.0 / _886;
    bool _910 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _912 = _898 * _902;
    float _914 = -_898;
    float _916 = _914 + 1.0;
    float _918 = _870 * _908;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _920;
    float _924 = fma(_906, _918, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _926;
    float _930 = fma(_922, _918, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _932 = _924 * _912;
    float _934 = fma(_928, _918, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _936 = _930 * _912;
    float _938 = _934 * _912;
    float _940 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[123].x, _932);
    float _942 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[123].y, _938);
    float _944 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[123].z, _936);
    float _946 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[124].x, _940);
    float _948 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[124].y, _942);
    float _950 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[124].z, _944);
    float _952 = _946 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _954 = _948 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _956 = _950 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _960 = _952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _962 = _954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _964 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _960;
    out.m_55.y = _962;
    out.m_55.z = _964;
    out.m_55.w = _958;
    bool _966 = !_910;
    float _968 = _960;
    float _986;
    if (!_966)
    {
        float _970 = in.m_51.x;
        float _972 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _974 = _970 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[14].x, _128);
        float _978 = _976 * _972;
        float _980 = floor(_978);
        float _982 = -_980;
        float _984 = _978 + _982;
        _986 = _984;
        _988 = true;
    }
    else
    {
        _986 = _266;
    }
    _988 = false;
    float _990 = _986;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _994 = _990 + _992;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _996;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1002 = _1000 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1012 = 1.0 / _998;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1014;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1022 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1024 = isnan(_990);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1030 = _1026 || _1028;
    float _1032 = float(_1030);
    float _1034 = 1.0 / _1002;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1038 = _990 + _1036;
    float _1040 = -_1032;
    float _1042 = _1040 + 1.0;
    bool _1044 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1046 = 1.0 / _1006;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1050 = _990 + _1048;
    float _1052 = _1038 * _1012;
    bool _1054 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1056 = isnan(_990);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1062 = _1058 || _1060;
    float _1064 = float(_1062);
    bool _1066 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1068 = isnan(_990);
    bool _1070 = _1066 || _1068;
    bool _1072 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1074 = _1070 || _1072;
    float _1076 = float(_1074);
    float _1078 = 1.0 / _1010;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1080;
    float _1084 = _1050 * _1034;
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1088 = _990 + _1086;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1092 = _990 + _1090;
    float _1094 = 1.0 / _1016;
    float _1096 = _1088 * _1046;
    float _1098 = -_1064;
    float _1100 = _1098 + 1.0;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1104 = _990 + _1102;
    bool _1106 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1108 = isnan(_990);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    float _1118 = _1076 * _1100;
    float _1120 = 1.0 / _1020;
    bool _1122 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1124 = isnan(_990);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    float _1134 = _994 * _1078;
    float _1136 = _1116 * _1042;
    float _1138 = -_1116;
    float _1140 = _1138 + 1.0;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1142;
    float _1146 = 1.0 / _1082;
    float _1148 = _1092 * _1094;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1152 = _990 + _1150;
    float _1154 = fma(_1144, _1096, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1156 = _1152 * _1120;
    float _1158 = -_1076;
    float _1160 = _1158 + 1.0;
    bool _1162 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1164 = isnan(_990);
    bool _1166 = _1162 || _1164;
    bool _1168 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1170 = _1166 || _1168;
    float _1172 = float(_1170);
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1174;
    float _1178 = _1132 * _1160;
    float _1180 = -_1132;
    float _1182 = _1180 + 1.0;
    float _1184 = fma(_1176, _1052, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1186 = _1104 * _1146;
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1188;
    float _1192 = _1172 * _1182;
    float _1194 = -_1172;
    float _1196 = _1194 + 1.0;
    float _1198 = fma(_1190, _1052, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    bool _1200 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1202 = isnan(_990);
    bool _1204 = _1200 || _1202;
    bool _1206 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1208 = _1204 || _1206;
    float _1210 = float(_1208);
    float _1212 = _1032 * _1196;
    bool _1214 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1216 = isnan(_990);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1222 = _1218 || _1220;
    float _1224 = float(_1222);
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1228 = _1226 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1230 = -_1224;
    float _1232 = _1230 + 1.0;
    float _1234 = _1224 * _1140;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1238 = _1236 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1240 = fma(_1228, _1084, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1242 = _1210 * _1232;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1244;
    float _1248 = fma(_1238, _1084, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1250 = -_1210;
    float _1252 = _1250 + 1.0;
    float _1254 = _1184 * _1242;
    float _1256 = _1198 * _1242;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1260 = _1258 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1262 = fma(_1246, _1096, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1266 = _1264 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1268 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1254);
    float _1270 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1256);
    float _1272 = fma(_1260, _1134, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1274 = fma(_1240, _1234, _1268);
    float _1276 = fma(_1248, _1234, _1270);
    float _1278 = fma(_1266, _1134, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1280;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1284;
    float _1288 = fma(_1262, _1136, _1274);
    float _1290 = fma(_1154, _1136, _1276);
    float _1292 = fma(_1282, _1148, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1294 = fma(_1286, _1148, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1298 = _1296 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1302 = _1300 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1304 = fma(_1272, _1212, _1288);
    float _1306 = fma(_1278, _1212, _1290);
    float _1308 = fma(_1298, _1156, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1310 = fma(_1302, _1156, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1312;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1316;
    float _1320 = fma(_1292, _1192, _1304);
    float _1322 = fma(_1294, _1192, _1306);
    float _1324 = fma(_1314, _1186, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1326 = fma(_1318, _1186, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1328 = fma(_1308, _1178, _1320);
    float _1330 = fma(_1310, _1178, _1322);
    float _1332 = fma(_1324, _1118, _1328);
    float _1334 = fma(_1326, _1118, _1330);
    float _1336 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1332);
    float _1338 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1334);
    out.m_57.x = _1336;
    out.m_57.y = _1338;
    bool _1340 = !_1044;
    float _1358;
    if (!_1340)
    {
        float _1342 = in.m_51.x;
        float _1344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1346 = _1342 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1348 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[14].y, _128);
        float _1350 = _1348 * _1344;
        float _1352 = floor(_1350);
        float _1354 = -_1352;
        float _1356 = _1350 + _1354;
        _1358 = _1356;
        _1360 = true;
    }
    else
    {
        _1358 = _266;
    }
    _1360 = false;
    float _1362 = _1358;
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1366 = _1362 + _1364;
    bool _1368 = _1362 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1370 = isnan(_1362);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1376 = _1372 || _1374;
    float _1378 = float(_1376);
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1382 = _1380 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1384 = _1362 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1386 = isnan(_1362);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1392 = _1388 || _1390;
    float _1394 = float(_1392);
    float _1396 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1396;
    bool _1400 = _1362 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1402 = isnan(_1362);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1408 = _1404 || _1406;
    float _1410 = float(_1408);
    float _1412 = 1.0 / _1382;
    float _1414 = -_1378;
    float _1416 = _1414 + 1.0;
    bool _1418 = _1362 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1420 = isnan(_1362);
    bool _1422 = _1418 || _1420;
    bool _1424 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1426 = _1422 || _1424;
    float _1428 = float(_1426);
    float _1430 = -_1410;
    float _1432 = _1430 + 1.0;
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1436 = _1434 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1438 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1440 = 1.0 / _1436;
    float _1442 = _1398 * _1412;
    float _1444 = _1394 * _1416;
    float _1446 = -_1394;
    float _1448 = _1446 + 1.0;
    float _1450 = fma(_1442, _1366, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _1452 = _1362 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1454 = isnan(_1362);
    bool _1456 = _1452 || _1454;
    bool _1458 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1460 = _1456 || _1458;
    float _1462 = float(_1460);
    float _1464 = _1410 * _1448;
    bool _1466 = _1362 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1468 = isnan(_1362);
    bool _1470 = _1466 || _1468;
    bool _1472 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1474 = _1470 || _1472;
    float _1476 = float(_1474);
    float _1478 = _1428 * _1432;
    float _1480 = -_1428;
    float _1482 = _1480 + 1.0;
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1486 = _1484 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1490 = _1488 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1492 = _1476 * _1482;
    float _1494 = -_1476;
    float _1496 = _1494 + 1.0;
    bool _1498 = _1362 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1500 = isnan(_1362);
    bool _1502 = _1498 || _1500;
    bool _1504 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1506 = _1502 || _1504;
    float _1508 = float(_1506);
    float _1510 = 1.0 / _1486;
    float _1512 = _1462 * _1496;
    float _1514 = -_1462;
    float _1516 = _1514 + 1.0;
    float _1518 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1520 = _1518 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1522 = _1508 * _1516;
    float _1524 = 1.0 / _1490;
    float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1528 = _1526 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1530 = _1520 * _1440;
    float _1532 = _1450 * _1522;
    float _1534 = -_1508;
    float _1536 = _1534 + 1.0;
    float _1538 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1540 = _1538 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1544 = _1362 + _1542;
    float _1546 = 1.0 / _1528;
    float _1548 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1548;
    float _1552 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1532);
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1556 = _1554 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1558 = fma(_1530, _1544, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1560 = _1550 * _1510;
    float _1562 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1564 = _1362 + _1562;
    float _1566 = 1.0 / _1540;
    float _1568 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1570 = _1568 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1572 = fma(_1560, _1564, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1574 = fma(_1558, _1512, _1552);
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1576;
    float _1580 = _1570 * _1524;
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1584 = _1362 + _1582;
    float _1586 = fma(_1572, _1492, _1574);
    float _1588 = 1.0 / _1556;
    float _1590 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1592 = _1590 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1594 = _1578 * _1546;
    float _1596 = fma(_1580, _1584, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1600 = _1362 + _1598;
    float _1602 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1604 = _1362 + _1602;
    float _1606 = _1592 * _1566;
    float _1608 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1608;
    bool _1612 = _1362 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1614 = isnan(_1362);
    bool _1616 = _1612 || _1614;
    bool _1618 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1620 = _1616 || _1618;
    float _1622 = float(_1620);
    float _1624 = fma(_1594, _1600, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1626 = fma(_1596, _1478, _1586);
    float _1628 = fma(_1606, _1604, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1632 = _1362 + _1630;
    float _1634 = -_1622;
    float _1636 = _1634 + 1.0;
    float _1638 = _1610 * _1588;
    float _1640 = fma(_1624, _1464, _1626);
    float _1642 = _1378 * _1636;
    float _1644 = fma(_1638, _1632, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1646 = fma(_1628, _1444, _1640);
    float _1648 = fma(_1644, _1642, _1646);
    float _1650 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1648);
    out.m_59.x = _1650;
    bool _1652 = !_1438;
    int _1654 = as_type<int>(_1362);
    float _1656 = _1378;
    int _1658 = as_type<int>(_1604);
    int _1660 = as_type<int>(_1638);
    bool _1662 = _1438;
    float _1680;
    if (!_1652)
    {
        float _1664 = in.m_51.x;
        float _1666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1668 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1670 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[14].z, _128);
        float _1672 = _1670 * _1666;
        float _1674 = floor(_1672);
        float _1676 = -_1674;
        float _1678 = _1672 + _1676;
        _1680 = _1678;
        _1654 = as_type<int>(_1666);
        _1656 = _1672;
        _1682 = true;
    }
    else
    {
        _1680 = _266;
    }
    _1682 = false;
    float _1684 = _1680;
    int _1686 = _1654;
    float _1688 = _1656;
    float _1690 = in.m_61.x;
    float _1692 = _276 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1696 = _1694 != 0;
    float _1698 = in.m_61.y;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1702 = _1700 != 0;
    float _1704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1708 = _1706 != 0;
    float _1710 = in.m_51.w;
    float _1712 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1714 = _1684 + _1712;
    float _1716 = in.m_51.y;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1720 = _1718 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    int _1722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1724 = _1722 != 0;
    int _1726 = _1686;
    float _1728 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1732 = _1714;
    if (_1696)
    {
        float _1734 = in.m_51.x;
        _1726 = as_type<int>(_1734);
    }
    int _1736 = _1726;
    float _1738 = 1.0 / _1720;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1742 = _1688;
    if (_1702)
    {
        float _1744 = in.m_51.z;
        _1742 = _1744;
    }
    float _1746 = _1742;
    float _1748 = _1690;
    if (_1702)
    {
        float _1750 = -_1690;
        float _1752 = _1750 + 1.0;
        _1658 = as_type<int>(_1752);
    }
    int _1754 = _1658;
    float _1756 = 0.0;
    if (!_1696)
    {
        _1756 = _1690;
    }
    float _1758 = _1756;
    float _1760 = _1758;
    if (_1708)
    {
        float _1762 = -_1690;
        float _1764 = _1762 + 1.0;
        _1660 = as_type<int>(_1764);
    }
    int _1766 = _1660;
    if (!_1708)
    {
        _1728 = _1690;
    }
    float _1768 = _1728;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1770;
    bool _1774 = _1684 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1776 = isnan(_1684);
    bool _1778 = _1774 || _1776;
    bool _1780 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1782 = _1778 || _1780;
    float _1784 = float(_1782);
    float _1786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1788 = _1684 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1790 = isnan(_1684);
    bool _1792 = _1788 || _1790;
    bool _1794 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1796 = _1792 || _1794;
    float _1798 = float(_1796);
    bool _1800 = _1710 > 0.5;
    float _1802 = -_1784;
    float _1804 = _1802 + 1.0;
    float _1806 = _1798 * _1804;
    float _1808 = _1704 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1810 = _1736;
    float _1812 = _1768;
    int _1814 = as_type<int>(_1786);
    int _1816 = as_type<int>(_1704);
    if (_1696)
    {
        bool _1818 = as_type<float>(_1736) > 0.5;
        _1662 = _1818;
    }
    bool _1820 = _1662;
    if (_1696)
    {
        float _1822 = -_1690;
        float _1824 = _1822 + 1.0;
        _1810 = as_type<int>(_1824);
    }
    int _1826 = _1810;
    float _1828 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1830 = _1828 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1832 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1834 = false;
    if (_1702)
    {
        bool _1836 = _1746 > 0.5;
        _1834 = _1836;
    }
    bool _1838 = _1834;
    float _1840 = -_1798;
    float _1842 = _1840 + 1.0;
    if (_1696)
    {
        float _1844 = _1820 ? as_type<float>(_1826) : _1690;
        _1760 = _1844;
    }
    float _1846 = _1760;
    float _1848 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1850 = _1848 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    int _1852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1854 = _1852 != 0;
    float _1856 = 1.0 / _1850;
    bool _1858 = _1716 > 0.5;
    if (!_1702)
    {
        _1730 = _1690;
    }
    float _1860 = _1730;
    float _1862 = _1860;
    if (_1702)
    {
        float _1864 = _1838 ? as_type<float>(_1754) : _1690;
        _1862 = _1864;
    }
    float _1866 = _1862;
    int _1868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1870 = _1868 != 0;
    float _1872 = 1.0 / _1830;
    float _1874 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1876 = _1874 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1878 = -_1698;
    float _1880 = _1878 + 1.0;
    if (_1708)
    {
        float _1882 = _1858 ? as_type<float>(_1766) : _1690;
        _1812 = _1882;
    }
    float _1884 = _1812;
    int _1886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1888 = _1886 != 0;
    int _1890 = _1800 ? as_type<int>(_1880) : as_type<int>(_1698);
    float _1892 = 1.0 / _1876;
    int _1894 = _1858 ? as_type<int>(_1880) : as_type<int>(_1698);
    float _1896 = _1854 ? as_type<float>(_1890) : _1698;
    float _1898 = fma(_1808, _1896, -0.5);
    float _1900 = _276 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1902 = _1870 ? as_type<float>(_1894) : _1698;
    float _1904 = _276 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1908 = _1906 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1910 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1900);
    float _1912 = _1716 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1914 = 1.0 / _1908;
    float _1916 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1904);
    float _1918 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1692);
    float _1920 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1922 = _1920 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1924 = fma(_1912, -2.0, _1740);
    float _1926 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1916);
    float _1928 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1910);
    float _1930 = 1.0 / _1922;
    float _1932 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1934 = _1932 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1936 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1918);
    float _1938 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1940 = _1938 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1942 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1942;
    float _1946 = _1934 * _1872;
    float _1948 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1948;
    float _1952 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1952;
    float _1956 = 1.0 / _1940;
    float _1958 = _1944 * _1856;
    float _1960 = _1950 * _1738;
    float _1962 = _1954 * _1914;
    float _1964 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1966 = _1684 + _1964;
    bool _1968 = _1684 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1970 = isnan(_1684);
    bool _1972 = _1968 || _1970;
    bool _1974 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1976 = _1972 || _1974;
    float _1978 = float(_1976);
    float _1980 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1982 = _1684 + _1980;
    float _1984 = _1772 * _1930;
    bool _1986 = _1684 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1988 = isnan(_1684);
    bool _1990 = _1986 || _1988;
    bool _1992 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1994 = _1990 || _1992;
    float _1996 = float(_1994);
    float _1998 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _2000 = _1998 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2002 = fma(_1958, _1966, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _2004 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2006 = _1684 + _2004;
    float _2008 = -_1978;
    float _2010 = _2008 + 1.0;
    float _2012 = fma(_1946, _1982, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _2014 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _2016 = _2014 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _2018 = fma(_1960, _2006, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _2020 = _1996 * _2010;
    bool _2022 = _1684 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _2024 = isnan(_1684);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _2030 = _2026 || _2028;
    float _2032 = float(_2030);
    float _2034 = -_1996;
    float _2036 = _2034 + 1.0;
    float _2038 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2040 = _1684 + _2038;
    float _2042 = _2000 * _1892;
    float _2044 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2046 = _1684 + _2044;
    bool _2048 = _1684 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _2050 = isnan(_1684);
    bool _2052 = _2048 || _2050;
    bool _2054 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _2056 = _2052 || _2054;
    float _2058 = float(_2056);
    float _2060 = _2016 * _1956;
    float _2062 = _2032 * _2036;
    float _2064 = -_2032;
    float _2066 = _2064 + 1.0;
    float _2068 = fma(_1962, _2040, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _2070 = fma(_2042, _2046, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _2072 = _2036;
    float _2074 = _2002;
    if (_1724)
    {
        float _2076 = in.m_51.x;
        _2072 = _2076;
    }
    float _2078 = _2072;
    bool _2080 = _1684 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _2082 = isnan(_1684);
    bool _2084 = _2080 || _2082;
    bool _2086 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _2088 = _2084 || _2086;
    float _2090 = float(_2088);
    float _2092 = -_2058;
    float _2094 = _2092 + 1.0;
    float _2096 = _1716 * 2.0;
    float _2098 = _2040;
    if (_1724)
    {
        float _2100 = in.m_51.z;
        _2098 = _2100;
    }
    float _2102 = _2098;
    float _2104 = _2058 * _2066;
    float _2106 = _2090 * _2094;
    float _2108 = -_2090;
    float _2110 = _2108 + 1.0;
    int _2112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2114 = _2112 != 0;
    float _2116 = floor(_2096);
    float _2118 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2120 = _1684 + _2118;
    float _2122 = _1784 * _2110;
    bool _2124 = _1684 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _2126 = isnan(_1684);
    bool _2128 = _2124 || _2126;
    bool _2130 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _2132 = _2128 || _2130;
    int _2134 = _2132 ? 1065353216 : 0;
    float _2136 = fma(_2060, _1714, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _2138 = fma(_1984, _2120, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _2140 = _1786 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2142 = _2134;
    int _2144 = as_type<int>(_2140);
    float _2146 = _2138;
    if (_1888)
    {
        float _2148 = -_1690;
        float _2150 = _2148 + 1.0;
        _1814 = as_type<int>(_2150);
    }
    int _2152 = _1814;
    float _2154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2156 = as_type<float>(_2134) * _1842;
    int _2158 = as_type<int>(_2156);
    if (!_1888)
    {
        _1732 = _1690;
    }
    float _2160 = _1732;
    float _2162 = fma(_2140, _1902, -0.5);
    float _2164 = _2160;
    float _2166 = _2162;
    if (_1888)
    {
        float _2168 = _1858 ? as_type<float>(_2152) : _1690;
        _2164 = _2168;
    }
    float _2170 = _2164;
    float _2172 = _2002 * _2156;
    float _2174 = -as_type<float>(_2134);
    float _2176 = _2174 + 1.0;
    int _2178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2180 = _2178 != 0;
    float _2182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2186 = _2184 != 0;
    if (_2114)
    {
        float _2188 = -_1690;
        float _2190 = _2188 + 1.0;
        _1816 = as_type<int>(_2190);
    }
    int _2192 = _1816;
    if (_1724)
    {
        _2158 = 0;
    }
    int _2194 = _2158;
    int _2196 = _2194;
    if (_1724)
    {
        _2142 = 0;
    }
    int _2198 = _2142;
    int _2200 = _2198;
    if (_1724)
    {
        _2074 = _1716;
    }
    float _2202 = _2074;
    bool _2204 = _2116 > 0.0;
    float _2206 = 0.0;
    float _2208 = _2202;
    float _2210 = _2078;
    if (_1724)
    {
        _2206 = _2078;
    }
    float _2212 = _2206;
    float _2214 = _2102;
    float _2216 = _2212;
    if (_1724)
    {
        _2144 = as_type<int>(_2102);
    }
    int _2218 = _2144;
    bool _2220 = _2116 >= 0.0;
    bool _2222 = isnan(_2116);
    bool _2224 = _2220 || _2222;
    bool _2226 = isnan(0.0);
    bool _2228 = _2224 || _2226;
    int _2230 = _2218;
    if (!_1724)
    {
        float _2232 = in.m_51.x;
        float _2234 = _1716 * 3.1415927410125732421875;
        float _2236 = in.m_51.z;
        float _2238 = _2234 * 0.15915493667125701904296875;
        float _2240 = _2238 * 6.283185482025146484375;
        float _2242 = sin(_2240);
        float _2244 = _2232 * 3.1415927410125732421875;
        float _2246 = _2244 * 0.15915493667125701904296875;
        float _2248 = _2236 * 3.1415927410125732421875;
        float _2250 = _2248 * 0.15915493667125701904296875;
        float _2252 = _2246 * 6.283185482025146484375;
        float _2254 = sin(_2252);
        float _2256 = _2250 * 6.283185482025146484375;
        float _2258 = sin(_2256);
        _2214 = _2236;
        _2200 = 2;
        _2196 = 1;
        _2208 = _2242;
        _2210 = _2232;
        _2216 = _2254;
        _2230 = as_type<int>(_2258);
    }
    float _2260 = _2214;
    int _2262 = _2200;
    int _2264 = _2196;
    float _2266 = _2208;
    float _2268 = _2210;
    float _2270 = _2216;
    int _2272 = _2230;
    float _2274 = _2260 * 2.0;
    int _2276 = _2228 ? 0 : 1;
    float _2278 = fma(_2176, (*spvDescriptorSet0.vp_c9)._m0[175].x, _2172);
    bool _2280 = _2260 > 0.5;
    float _2282 = floor(_2274);
    if (_2114)
    {
        float _2284 = _1858 ? as_type<float>(_2192) : _1690;
        _1748 = _2284;
    }
    float _2286 = _1748;
    float _2288 = _1832 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2290 = ~_2276;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    float _2296 = _1928 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2298 = _2262 != 2;
    float _2300 = fma(_2288, _1846, -0.5);
    int _2302 = _2294;
    if (!_2204)
    {
        int _2304 = ~_2276;
        int _2306 = _2304 + 1;
        _2302 = _2306;
    }
    int _2308 = _2302;
    float _2310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _2312 = _2280 ? as_type<int>(_1880) : as_type<int>(_1698);
    float _2314 = _1926 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2316 = _2264 != 1;
    float _2318 = _1936 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2322 = _2320 != 0;
    float _2324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2326 = _2182 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2328 = _2180 ? as_type<float>(_2312) : _1698;
    float _2330 = _2266 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2332 = _2186 ? as_type<float>(_2312) : _1698;
    float _2334 = fma(_2326, _1884, -0.5);
    int _2336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2338 = _2336 != 0;
    int _2340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2342 = _2340 != 0;
    int _2344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2346 = _2344 != 0;
    float _2348 = fma(_2012, _1806, _2278);
    float _2350 = _2322 ? as_type<float>(_2312) : _1698;
    float _2352 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2354 = _2268 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2356 = _2154 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2358 = _2282 >= 0.0;
    bool _2360 = isnan(_2282);
    bool _2362 = _2358 || _2360;
    bool _2364 = isnan(0.0);
    bool _2366 = _2362 || _2364;
    float _2368 = _2310 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2370 = -_2352;
    float _2372 = fma(_2354, 2.0, _2370);
    float _2374 = _2268 * 2.0;
    int _2376 = _2366 ? 0 : 1;
    float _2378 = _2324 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    bool _2380 = _2282 > 0.0;
    float _2382 = fma(_2356, _1866, -0.5);
    float _2384 = floor(_2374);
    float _2386 = fma(_2378, _2170, -0.5);
    float _2388 = _2270 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2390 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2392 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    int _2394 = ~_2376;
    int _2396 = _2394 + 1;
    int _2398 = _2396 + 1;
    float _2400 = -_2390;
    float _2402 = fma(_2388, 2.0, _2400);
    float _2404 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2406 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2408 = _2398;
    if (!_2380)
    {
        int _2410 = ~_2376;
        int _2412 = _2410 + 1;
        _2408 = _2412;
    }
    int _2414 = _2408;
    float _2416 = fma(_2330, -2.0, _2392);
    bool _2418 = !_2316;
    float _2420 = _2418 ? _2266 : _2270;
    float _2422 = fma(_2266, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2406);
    bool _2424 = _2384 >= 0.0;
    bool _2426 = isnan(_2384);
    bool _2428 = _2424 || _2426;
    bool _2430 = isnan(0.0);
    bool _2432 = _2428 || _2430;
    float _2434 = fma(_2368, _2286, -0.5);
    bool _2436 = !_2316;
    float _2438 = _2436 ? as_type<float>(_2272) : _2266;
    float _2440 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2442 = _2296 + _2440;
    int _2444 = _2432 ? 0 : 1;
    float _2446 = fma(_2270, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2404);
    bool _2448 = _2384 > 0.0;
    float _2450 = _1716 + _2260;
    float _2452 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2454 = _2314 + _2452;
    float _2456 = _2442 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2458 = _1716 + _2268;
    float _2460 = _2450 + (-1.0);
    float _2462 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2456);
    float _2464 = _2458 + (-1.0);
    float _2466 = fma(_2018, _2122, _2348);
    float _2468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2470 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2446);
    float _2472 = fma(_2464, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2474 = fma(_2070, _2106, _2466);
    float _2476 = -_128;
    float _2478 = fma(_2476, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2402);
    float _2480 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2482 = _2318 + _2480;
    float _2484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2486 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _2488 = fma(_2470, _2386, _2478);
    float _2490 = fma(_2482, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2462);
    float _2492 = fma(_2260, (*spvDescriptorSet0.vp_c9)._m0[79].z, _2486);
    float _2494 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _2496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _2498 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[79].x, _2492);
    int _2500 = ~_2444;
    int _2502 = _2500 + 1;
    int _2504 = _2502 + 1;
    float _2506 = fma(_2460, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2508 = _2468 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2510 = _2498 * (-0.15915493667125701904296875);
    int _2512 = _2504;
    float _2514 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    if (!_2448)
    {
        int _2516 = ~_2444;
        int _2518 = _2516 + 1;
        _2512 = _2518;
    }
    int _2520 = _2512;
    float _2522 = fma(_2420, (*spvDescriptorSet0.vp_c9)._m0[98].z, _2494);
    float _2524 = _2420 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _2526 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2422);
    bool _2528 = _2490 >= 0.0;
    float _2530 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _2532 = _2510 * 6.283185482025146484375;
    float _2534 = sin(_2532);
    float _2536 = _2484 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2538 = fma(_2350, _2508, -0.5);
    float _2540 = -_2530;
    float _2542 = fma(_2524, 2.0, _2540);
    float _2544 = _2496 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _2546 = fma(_2332, _2536, -0.5);
    float _2548 = _2530;
    if (_2298)
    {
        _2548 = _2268;
    }
    float _2550 = _2548;
    float _2552 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2416);
    float _2554 = _2510 * 6.283185482025146484375;
    float _2556 = cos(_2554);
    float _2558 = fma(_2328, _2544, -0.5);
    float _2560 = _2438 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _2562 = _2550;
    if (!_2298)
    {
        _2562 = _2260;
    }
    float _2564 = _2562;
    float _2566 = fma(_2068, _2104, _2474);
    float _2568 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2570 = _2564 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2572 = as_type<int>(_2564);
    if (_2528)
    {
        _2514 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2574 = _2514;
    float _2576 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _2578 = -_2552;
    float _2580 = fma(_2526, _2538, _2578);
    float _2582 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _2584 = -_2568;
    float _2586 = fma(_2570, 2.0, _2584);
    float _2588 = fma(_2560, -2.0, _2576);
    float _2590 = _2534 * _2162;
    float _2592 = fma(_2438, (*spvDescriptorSet0.vp_c9)._m0[98].w, _2582);
    float _2594 = _2556 * _2162;
    float _2596 = 0.0;
    float _2598 = 0.0;
    if (_2528)
    {
        float _2600 = _2574 * 5.0;
        _2572 = as_type<int>(_2600);
    }
    int _2602 = _2572;
    float _2604 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].w, _2592);
    float _2606 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[96].y, _2588);
    float _2608 = -_2590;
    float _2610 = fma(_2556, _2300, _2608);
    float _2612 = fma(_2534, _2300, _2594);
    if (_2528)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7978 = as_type<float>(_2602);
        out.gl_Position.z = _7978;
    }
    float _2614 = fma(_2136, _2062, _2566);
    float _2616 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].z, _2522);
    float _2618 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2620 = -_128;
    float _2622 = fma(_2620, (*spvDescriptorSet0.vp_c9)._m0[96].x, _2542);
    float _2624 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1924);
    float _2626 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2628 = -_128;
    float _2630 = fma(_2628, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2372);
    float _2632 = fma(_2616, _2434, _2622);
    float _2634 = fma(_1716, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2626);
    float _2636 = -_2606;
    float _2638 = fma(_2604, _2558, _2636);
    float _2640 = _2630;
    if (!_2316)
    {
        _2596 = _1716;
    }
    float _2642 = _2596;
    float _2644 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2646 = log2(_2644);
    float _2648 = _2642;
    if (!_2316)
    {
        _2598 = _2260;
    }
    float _2650 = _2598;
    float _2652 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _2654 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2634);
    float _2656 = _2650;
    if (_2316)
    {
        _2656 = _1716;
    }
    float _2658 = _2656;
    float _2660 = fma(_2138, _2020, _2614);
    float _2662 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2664 = _2662;
    if (!_2316)
    {
        _2166 = _2642;
    }
    float _2666 = _2166;
    float _2668 = fma(_2658, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2618);
    float _2670 = _2666;
    if (_2316)
    {
        _2648 = _2268;
    }
    float _2672 = _2648;
    float _2674 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_2316)
    {
        _2670 = _2268;
    }
    float _2676 = _2670;
    float _2678 = -_2624;
    float _2680 = fma(_2654, _2612, _2678);
    if (_2298)
    {
        _2146 = _1716;
    }
    float _2682 = _2146;
    float _2684 = fma(_2672, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2662);
    float _2686 = fma(_2268, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2674);
    float _2688 = _2682;
    if (_2298)
    {
        _2664 = _2260;
    }
    float _2690 = _2664;
    float _2692 = _2488 + 0.5;
    float _2694 = _2690;
    if (!_2298)
    {
        _2694 = _1716;
    }
    float _2696 = _2694;
    float _2698 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2686);
    float _2700 = _2580 + 0.5;
    float _2702 = _2676 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2704 = fma(_2698, _2610, _2630);
    float _2706 = fma(_2696, (*spvDescriptorSet0.vp_c9)._m0[89].z, _2652);
    if (!_2316)
    {
        _2640 = _2260;
    }
    float _2708 = _2640;
    out.m_63.x = _2692;
    out.m_63.y = _2700;
    float _2710 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2712 = _2708;
    if (_2316)
    {
        _2712 = _1716;
    }
    float _2714 = _2712;
    float _2716 = _2646 * _128;
    if (!_2298)
    {
        _2688 = _2268;
    }
    float _2718 = _2688;
    float _2720 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2722 = -_2710;
    float _2724 = fma(_2702, 2.0, _2722);
    float _2726 = _2714 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2728 = float(_2414);
    float _2730 = _2638 + 0.5;
    float _2732 = _2632 + 0.5;
    bool _2734 = !_2338;
    int _2736 = _2734 ? 0 : 1;
    float _2738 = fma(_2726, -2.0, _2720);
    float _2740 = _2718 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2742 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2744 = abs(_2736);
    float _2746 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2660);
    bool _2748 = !_2342;
    int _2750 = _2748 ? 0 : 1;
    float _2752 = fma(_2740, -2.0, _2742);
    out.m_65.x = _2732;
    out.m_65.y = _2730;
    int _2754 = abs(_2750);
    float _2756 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2684);
    float _2758 = -_128;
    float _2760 = fma(_2758, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2724);
    float _2762 = float(_2754);
    float _2764 = exp2(_2716);
    float _2766 = float(_2520);
    float _2768 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[89].x, _2706);
    float _2770 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2668);
    float _2772 = float(_2744);
    float _2774 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2776 = 1.0 + _2774;
    float _2778 = _2762 * _2766;
    float _2780 = fma(_2756, _2382, _2760);
    float _2782 = in.m_67.x;
    float _2784 = in.m_67.y;
    float _2786 = _2772 * _2728;
    float _2788 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2738);
    float _2790 = 1.0 / _2776;
    float _2792 = in.m_69.x;
    float _2794 = in.m_69.y;
    float _2796 = in.m_69.z;
    float _2798 = _2768 * (-0.15915493667125701904296875);
    float _2800 = -_2788;
    float _2802 = fma(_2770, _1898, _2800);
    float _2804 = -_2764;
    float _2806 = _2804 + 1.0;
    out.m_71.x = _2746;
    float _2808 = _2798 * 6.283185482025146484375;
    float _2810 = cos(_2808);
    float _2812 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _2814 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2816 = isnan(1.0);
    bool _2818 = _2814 || _2816;
    bool _2820 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2822 = _2818 || _2820;
    float _2824 = in.m_73.x;
    float _2826 = in.m_73.y;
    float _2828 = in.m_73.z;
    float _2830 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2832 = fma(_1716, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2812);
    bool _2834 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2836 = isnan(0.0);
    bool _2838 = _2834 || _2836;
    bool _2840 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2842 = _2838 || _2840;
    float _2844 = -_128;
    float _2846 = fma(_2844, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2586);
    float _2848 = _2798 * 6.283185482025146484375;
    float _2850 = sin(_2848);
    float _2852 = fma(_2268, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2830);
    float _2854 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2832);
    float _2856 = _2786 * (-2.0);
    float _2858 = _2842 ? _2806 : 0.0;
    float _2860 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2852);
    float _2862 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2752);
    float _2864 = fma(_2472, _2856, _2472);
    float _2866 = _2810 * _2546;
    float _2868 = _2784 * 37.6991119384765625;
    if (_2822)
    {
        float _2870 = _2858 * _2790;
        _146 = _2870;
    }
    float _2872 = _146;
    float _2874 = fma(_2856, _2792, _2792);
    float _2876 = _2268 + (-0.5);
    float _2878 = _2442 * _2442;
    float _2880 = _2868 * 0.15915493667125701904296875;
    if (_2528)
    {
        out.m_45.x = 0.0;
    }
    float _2882 = _2850 * _2546;
    float _2884 = fma(_2850, _2334, _2866);
    float _2886 = fma(_2876, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2874);
    float _2888 = _2826 * _2826;
    float _2890 = -_2882;
    float _2892 = fma(_2810, _2334, _2890);
    float _2894 = fma(_2454, _2454, _2878);
    float _2896 = _2778 * (-2.0);
    float _2898 = fma(_2824, _2824, _2888);
    float _2900 = fma(_2860, _2892, _2846);
    float _2902 = fma(_2482, _2482, _2894);
    float _2904 = fma(_2506, _2896, _2506);
    float _2906 = fma(_2896, _2794, _2794);
    float _2908 = fma(_2828, _2828, _2898);
    float _2910 = rsqrt(_2902);
    float _2912 = -_2862;
    float _2914 = fma(_2854, _2884, _2912);
    float _2916 = _2704 + 0.5;
    float _2918 = _2900 + 0.5;
    float _2920 = _2680 + 0.5;
    float _2922 = _2780 + 0.5;
    float _2924 = _2802 + 0.5;
    float _2926 = _2914 + 0.5;
    float _2928 = _2880 * 6.283185482025146484375;
    float _2930 = sin(_2928);
    bool _2932 = !_2346;
    int _2934 = _2932 ? 0 : 1;
    float _2936 = fma(_2864, _2872, _2886);
    out.m_75.x = _2916;
    out.m_75.y = _2920;
    out.m_75.z = _2922;
    out.m_75.w = _2924;
    float _2938 = float(_2308);
    float _2940 = _1716 + (-0.5);
    int _2942 = abs(_2934);
    out.m_77.x = _2918;
    out.m_77.y = _2926;
    float _2944 = rsqrt(_2908);
    float _2946 = _2442 * _2910;
    float _2948 = _2454 * _2910;
    if (_2528)
    {
        return out;
    }
    float _2950 = -_2946;
    float _2952 = fma(_2950, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2296);
    float _2954 = _2482 * _2910;
    float _2956 = -_2948;
    float _2958 = fma(_2956, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2314);
    float _2960 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2962 = _2952 + _2960;
    float _2964 = float(_2942);
    float _2966 = fma(_2940, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2906);
    float _2968 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2970 = _2958 + _2968;
    float _2972 = _2962 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2974 = -_2954;
    float _2976 = fma(_2974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2318);
    float _2978 = _2964 * _2938;
    float _2980 = -_2946;
    float _2982 = fma(_2980, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2442);
    float _2984 = fma(_2970, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2972);
    float _2986 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2988 = _2976 + _2986;
    float _2990 = _2936 * 0.15915493667125701904296875;
    float _2992 = _2268 + _2260;
    float _2994 = -_2948;
    float _2996 = fma(_2994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2454);
    float _2998 = fma(_2988, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2984);
    float _3000 = _2982 * _2982;
    float _3002 = _2978 * (-2.0);
    float _3004 = _2992 + (-1.0);
    float _3006 = _2990 * 6.283185482025146484375;
    float _3008 = sin(_3006);
    bool _3010 = _2998 >= 0.0;
    float _3012 = fma(_2904, _2872, _2966);
    float _3014 = fma(_3004, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3016 = _3012 * 0.15915493667125701904296875;
    float _3018 = _2990 * 6.283185482025146484375;
    float _3020 = cos(_3018);
    if (_3010)
    {
        out.m_45.x = 0.0;
    }
    float _3022 = _3016 * 6.283185482025146484375;
    float _3024 = sin(_3022);
    float _3026 = fma(_2996, _2996, _3000);
    float _3028 = fma(_3002, _2796, _2796);
    float _3030 = _2260 + (-0.5);
    float _3032 = fma(_3014, _3002, _3014);
    float _3034 = -_2954;
    float _3036 = fma(_3034, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2482);
    float _3038 = _2930 * 0.20000000298023223876953125;
    float _3040 = fma(_3030, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3028);
    float _3042 = _3016 * 6.283185482025146484375;
    float _3044 = cos(_3042);
    float _3046 = fma(_3036, _3036, _3026);
    float _3048 = _3038 * _2782;
    float _3050 = fma(_3032, _2872, _3040);
    float _3052 = _3038;
    int _3054 = as_type<int>(_3050);
    if (_3010)
    {
        _3052 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3056 = _3052;
    float _3058 = _2944 * _3048;
    float _3060 = _3050 * 0.15915493667125701904296875;
    if (_3010)
    {
        float _3062 = _3056 * 5.0;
        _3054 = as_type<int>(_3062);
    }
    int _3064 = _3054;
    float _3066 = sqrt(_3046);
    float _3068 = fma(_2824, _3058, _2824);
    float _3070 = fma(_2826, _3058, _2826);
    float _3072 = fma(_2828, _3058, _2828);
    if (_3010)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8771 = as_type<float>(_3064);
        out.gl_Position.z = _8771;
    }
    float _3074 = _3008 * _3024;
    float _3076 = _3020 * _3044;
    float _3078 = _3060 * 6.283185482025146484375;
    float _3080 = sin(_3078);
    float _3082 = _568 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_3010)
    {
        return out;
    }
    float _3084 = _3060 * 6.283185482025146484375;
    float _3086 = cos(_3084);
    float _3088 = _2910 * _3066;
    float _3090 = _570 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3092 = _658 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3094 = fma(_3080, _3076, _3074);
    float _3096 = _3088 * _3082;
    float _3098 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3070);
    float _3100 = _3088 * _3090;
    float _3102 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3072);
    float _3104 = _3088 * _3092;
    float _3106 = _3096 * _3098;
    float _3108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3068);
    float _3110 = fma(_3080, _3074, _3076);
    float _3112 = _3020 * _3024;
    float _3114 = _3008 * _3044;
    float _3116 = _3086 * _3106;
    float _3118 = _3100 * _3102;
    float _3120 = _3104 * _3108;
    float _3122 = -_3112;
    float _3124 = fma(_3080, _3114, _3122);
    float _3126 = _3020 * _3116;
    float _3128 = _3024 * _3086;
    float _3130 = _3044 * _3086;
    float _3132 = -_3114;
    float _3134 = fma(_3080, _3112, _3132);
    float _3136 = -_3106;
    float _3138 = _3080 * _3136;
    float _3140 = fma(_3094, _3120, _3126);
    float _3142 = -_2296;
    float _3144 = _3142 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3146 = _3008 * _3116;
    float _3148 = fma(_3130, _3120, _3138);
    float _3150 = fma(_3134, _3118, _3140);
    float _3152 = -_2314;
    float _3154 = _3152 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3156 = _3144 * _3144;
    float _3158 = fma(_3124, _3120, _3146);
    float _3160 = fma(_3128, _3118, _3148);
    float _3162 = _3150 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3164 = fma(_3154, _3154, _3156);
    float _3166 = -_2318;
    float _3168 = _3166 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3170 = fma(_3110, _3118, _3158);
    float _3172 = _3150 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3174 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3162);
    float _3176 = _3150 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3178 = fma(_3168, _3168, _3164);
    float _3180 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3172);
    float _3182 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3174);
    float _3184 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3176);
    float _3186 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3180);
    float _3188 = _3182 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3190 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3184);
    float _3192 = sqrt(_3178);
    float _3194 = _3186 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3196 = _2296 + _3188;
    float _3198 = _3190 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3200 = _2314 + _3194;
    float _3202 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _3204 = _3196 + _3202;
    float _3206 = _2318 + _3198;
    float _3208 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _3210 = _3200 + _3208;
    float _3212 = _3204 * _3204;
    float _3214 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _3216 = _3206 + _3214;
    float _3218 = fma(_3210, _3210, _3212);
    float _3220 = precise::max(_3192, 5.0);
    float _3222 = fma(_3216, _3216, _3218);
    float _3224 = -_266;
    float _3226 = _3224 + 1.0;
    float _3228 = precise::min(_3220, 20.0);
    float _3230 = rsqrt(_3222);
    float _3232 = fma(_3228, 0.066666670143604278564453125, -0.3333333432674407958984375);
    float _3234 = _3226 * _3232;
    float _3236 = _3234 * 10.0;
    float _3238 = -_2946;
    float _3240 = fma(_3238, _3236, _2442);
    float _3242 = _3204 * _3230;
    float _3244 = _3210 * _3230;
    float _3246 = _3216 * _3230;
    float _3248 = -_2948;
    float _3250 = fma(_3248, _3236, _2454);
    float _3252 = _3242 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _3254 = _3240 * _3240;
    float _3256 = -_2954;
    float _3258 = fma(_3256, _3236, _2482);
    float _3260 = -_2954;
    float _3262 = fma(_3260, _3236, _2318);
    float _3264 = fma(_3244, (*spvDescriptorSet0.vp_c10)._m0[8].y, _3252);
    float _3266 = fma(_3250, _3250, _3254);
    float _3268 = -_2948;
    float _3270 = fma(_3268, _3236, _2314);
    float _3272 = -_2946;
    float _3274 = fma(_3272, _3236, _2296);
    float _3276 = fma(_3246, (*spvDescriptorSet0.vp_c10)._m0[10].y, _3264);
    float _3278 = precise::clamp(_3276, 0.0, 1.0);
    float _3280 = fma(_3258, _3258, _3266);
    float _3282 = _3278 * 3.1415927410125732421875;
    float _3284 = sqrt(_3280);
    float _3286 = _3282 * 0.15915493667125701904296875;
    float _3288 = _266 * _266;
    float _3290 = _3288 * 15.0;
    float _3292 = _3286 * 6.283185482025146484375;
    float _3294 = sin(_3292);
    float _3296 = _2910 * _3284;
    float _3298 = fma(_3198, _3296, _3262);
    float _3300 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[32].x;
    float _3302 = fma(_3194, _3296, _3270);
    float _3304 = fma(_3188, _3296, _3274);
    float _3306 = _3294 * _3288;
    float _3308 = _3306 * 4.0;
    float _3310 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[32].z;
    float _3312 = fma(_3308, (*spvDescriptorSet0.vp_c10)._m0[8].y, _3300);
    float _3314 = fma(_3308, (*spvDescriptorSet0.vp_c10)._m0[10].y, _3310);
    float _3316 = fma(_3312, _2782, _3302);
    float _3318 = fma(_3314, _2782, _3298);
    float _3320 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3322 = _3316 + _3320;
    float _3324 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3326 = _3318 + _3324;
    float _3328 = _3326 * _3326;
    float _3330 = fma(_3322, _3322, _3328);
    float _3332 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[32].y;
    float _3334 = sqrt(_3330);
    float _3336 = fma(_3308, (*spvDescriptorSet0.vp_c10)._m0[9].y, _3332);
    float _3338 = fma(_3336, _2782, _3304);
    bool _3340 = _3334 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3342 = _3290;
    float _3344 = _3336;
    float _3346 = _3316;
    if (!_3340)
    {
        _3342 = _3318;
    }
    float _3348 = _3342;
    float _3350 = _3348;
    if (!_3340)
    {
        _3344 = _3338;
    }
    float _3352 = _3344;
    bool _3354 = !_3340;
    float _3356 = _3352;
    if (!_3354)
    {
        float _3358 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3360 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3362 = _3334 + _3360;
        float _3364 = _3338 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3366 = rsqrt(_3330);
        float _3368 = _3362 * _3358;
        float _3370 = _3368 * 0.15915493667125701904296875;
        float _3372 = _3370 * 6.283185482025146484375;
        float _3374 = cos(_3372);
        float _3376 = _3370 * 6.283185482025146484375;
        float _3378 = sin(_3376);
        float _3380 = _3374 + (-1.0);
        float _3382 = _3380 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3384 = fma(_3378, _3364, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3386 = fma(_3338, _3374, _3382);
        float _3388 = _3366 * _3384;
        float _3390 = fma(_3322, _3388, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3392 = fma(_3326, _3388, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3356 = _3386;
        _3346 = _3390;
        _3350 = _3392;
    }
    float _3394 = _3356;
    float _3396 = _3346;
    float _3398 = _3350;
    float _3400 = -_2946;
    float _3402 = fma(_3400, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3394);
    float _3404 = -_2948;
    float _3406 = fma(_3404, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3396);
    float _3408 = -_2954;
    float _3410 = fma(_3408, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3398);
    float _3412 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3414 = _3402 + _3412;
    float _3416 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3418 = _3406 + _3416;
    float _3420 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3422 = _3410 + _3420;
    float _3424 = _3414 * _3414;
    float _3426 = fma(_3418, _3418, _3424);
    float _3428 = fma(_3422, _3422, _3426);
    float _3430 = rsqrt(_3428);
    float _3432 = sqrt(_3428);
    float _3434 = _3430 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3436 = _3418 * _3434;
    float _3438 = _3422 * _3434;
    float _3440 = _3436 * _3436;
    float _3442 = _3438 * _3438;
    float _3444 = _3440 + _3442;
    float _3446 = sqrt(_3444);
    bool _3448 = _3446 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3450 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3452 = _3446 + _3450;
    float _3454 = _2296;
    float _3456 = _3444;
    float _3458 = _3452;
    float _3460 = _3414;
    float _3462 = _3434;
    float _3464 = _3436;
    if (_3448)
    {
        float _3466 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3454 = _3466;
    }
    float _3468 = _3454;
    if (_3448)
    {
        float _3470 = rsqrt(_3444);
        _3456 = _3470;
    }
    float _3472 = _3456;
    float _3474 = _3468;
    float _3476 = _3472;
    if (_3448)
    {
        float _3478 = _3452 * _3468;
        _3458 = _3478;
    }
    float _3480 = _3458;
    if (_3448)
    {
        float _3482 = _3480 * 0.15915493667125701904296875;
        _3474 = _3482;
    }
    float _3484 = _3474;
    float _3486 = _3422;
    float _3488 = _3484;
    if (_3448)
    {
        float _3490 = _3484 * 6.283185482025146484375;
        float _3492 = sin(_3490);
        _3486 = _3492;
    }
    float _3494 = _3486;
    float _3496 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3498 = precise::max(0.0, _3496);
    float _3500 = _2948;
    float _3502 = _3498;
    if (_3448)
    {
        float _3504 = _3484 * 6.283185482025146484375;
        float _3506 = cos(_3504);
        _3500 = _3506;
    }
    float _3508 = _3500;
    float _3510 = -_3434;
    float _3512 = -_3498;
    float _3514 = fma(_3414, _3510, _3512);
    if (_3448)
    {
        float _3516 = _3514 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3460 = _3516;
    }
    float _3518 = _3460;
    float _3520 = _3494;
    float _3522 = _3518;
    if (_3448)
    {
        float _3524 = fma(_3494, _3518, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3520 = _3524;
    }
    float _3526 = _3520;
    float _3528 = _3526;
    if (!_3448)
    {
        _3522 = _3438;
    }
    float _3530 = _3522;
    float _3532 = _3530;
    if (_3448)
    {
        float _3534 = _3508 + (-1.0);
        _3502 = _3534;
    }
    float _3536 = _3502;
    float _3538 = _3536;
    if (_3448)
    {
        float _3540 = _3472 * _3526;
        _3462 = _3540;
    }
    float _3542 = _3462;
    if (!_3448)
    {
        _3528 = _3514;
    }
    float _3544 = _3528;
    float _3546 = _3544;
    if (_3448)
    {
        float _3548 = _3536 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3488 = _3548;
    }
    float _3550 = _3488;
    if (_3448)
    {
        float _3552 = _3436 * _3542;
        _3464 = _3552;
    }
    float _3554 = _3464;
    if (!_3448)
    {
        _3476 = _3440;
    }
    float _3556 = _3476;
    float _3558 = _3556;
    if (_3448)
    {
        float _3560 = _3438 * _3542;
        _3532 = _3560;
    }
    float _3562 = _3532;
    if (_3448)
    {
        float _3564 = fma(_3514, _3508, _3550);
        _3546 = _3564;
    }
    float _3566 = _3546;
    if (_3448)
    {
        float _3568 = _3554 * _3554;
        _3558 = _3568;
    }
    float _3570 = _3558;
    float _3572 = _3402 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_3448)
    {
        _3538 = _3442;
    }
    float _3574 = _3538;
    float _3576 = _3574;
    if (_3448)
    {
        float _3578 = _3562 * _3562;
        _3576 = _3578;
    }
    float _3580 = _3576;
    float _3582 = fma(_3566, _3566, _3570);
    float _3584 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3586 = fma(_3432, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3584);
    float _3588 = precise::clamp(_3586, 0.0, 1.0);
    float _3590 = _3402 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3592 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3572);
    float _3594 = _3582 + _3580;
    float _3596 = _3402 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3598 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3590);
    float _3600 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3592);
    float _3602 = _3402 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3604 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3596);
    float _3606 = rsqrt(_3594);
    float _3608 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3598);
    float _3610 = _3600 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3612 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3604);
    float _3614 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3602);
    float _3616 = _3608 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3618 = -_3588;
    float _3620 = _3618 + 1.0;
    float _3622 = _3612 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3624 = _3610 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3626 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3614);
    float _3628 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3630 = _3616 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3632 = fma(_3622, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3624);
    float _3634 = _3626 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3636 = abs(_3620);
    float _3638 = log2(_3636);
    float _3640 = -_3630;
    float _3642 = fma(_3640, _3628, 1.0);
    float _3644 = fma(_3616, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3632);
    float _3646 = _3606 * _3554;
    float _3648 = _3606 * _3566;
    float _3650 = _3606 * _3562;
    float _3652 = fma(_3634, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3644);
    float _3654 = _3646 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3656 = log2(_3642);
    float _3658 = _3648 + 1.0;
    float _3660 = -_3654;
    float _3662 = fma(_3648, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3660);
    float _3664 = _3610 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3666 = -_3650;
    float _3668 = fma(_3666, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3662);
    float _3670 = _3638 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3672 = _3610 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3674 = 1.0 / _3652;
    float _3676 = fma(_3668, -0.5, 0.5);
    float _3678 = fma(_3668, 0.5, 0.5);
    float _3680 = fma(_3622, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3672);
    float _3682 = fma(_3622, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3664);
    float _3684 = fma(_3678, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3686 = fma(_3616, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3680);
    float _3688 = exp2(_3670);
    float _3690 = _3656 * 0.693147182464599609375;
    float _3692 = fma(_3678, _3684, -0.212114393711090087890625);
    float _3694 = fma(_3634, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3686);
    float _3696 = _3690 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3698 = fma(_3678, _3692, 1.570728778839111328125);
    float _3700 = sqrt(_3676);
    float _3702 = fma(_3616, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3682);
    float _3704 = fma(_3634, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3702);
    float _3706 = _3694 * _3674;
    float _3708 = -_3648;
    float _3710 = fma(_3688, _3658, _3708);
    float _3712 = _3704 * _3674;
    float _3714 = fma(_3706, 0.5, 0.5);
    float _3716 = fma(_3710, 0.5, 0.5);
    float _3718 = fma(_3712, -0.5, 0.5);
    float _3720 = _3700 * 0.636619746685028076171875;
    float _3722 = -_3698;
    float _3724 = fma(_3720, _3722, 1.0);
    float3 _9852 = float3(_3714, _3718, _3696);
    float _3726 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9852, float3(0.0), isnan(_9852)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9852, float3(0.0), isnan(_9852)), level(0.0)).x;
    float3 _9863 = float3(_3714, _3718, _3696);
    float4 _3729 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9863, float3(0.0), isnan(_9863)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9863, float3(0.0), isnan(_9863)), level(0.0)).xyzw;
    float _3731 = _3729.x;
    float _3733 = _3729.y;
    float _3735 = _3729.z;
    float _3737 = _3729.w;
    float2 _9880 = float2(_3724, _3716);
    float3 _3741 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9880, float2(0.0), isnan(_9880)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9880, float2(0.0), isnan(_9880)), level(0.0)).xyz;
    float _3743 = _3741.x;
    float _3745 = _3741.y;
    float _3747 = _3741.z;
    float _3749 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3751 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3753 = _3638 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3755 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3757 = isnan(0.5);
    bool _3759 = _3755 || _3757;
    bool _3761 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3763 = _3759 || _3761;
    float _3765 = fma(_2958, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3749);
    float _3767 = fma(_2958, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3751);
    float _3769 = _3610 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_53.x = _834;
    out.m_53.y = _840;
    out.m_53.z = _836;
    out.m_53.w = _842;
    float _3771 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3765);
    float _3773 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3767);
    float _3775 = exp2(_3753);
    float _3777 = fma(_3622, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3769);
    float _3779 = _3771 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3781 = _3773 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_55.x = _960;
    out.m_55.y = _962;
    out.m_55.z = _964;
    out.m_55.w = _958;
    float _3783 = fma(_3616, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3777);
    float _3785 = _3781 + _3779;
    float _3787 = 1.0 / _3779;
    float _3789 = fma(_3634, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3783);
    if (_3763)
    {
        _968 = 1.0;
    }
    float _3791 = _968;
    float _3793 = _3785 * _3787;
    float _3795 = _3793 * 0.5;
    float _3797 = _3791;
    if (!_3763)
    {
        float _3799 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3801 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3803 = _3799 * 0.15915493667125701904296875;
        float _3805 = _3801 * 0.15915493667125701904296875;
        float _3807 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3809 = fma(_3795, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3807);
        float _3811 = _3803 * 6.283185482025146484375;
        float _3813 = cos(_3811);
        float _3815 = _3803 * 6.283185482025146484375;
        float _3817 = sin(_3815);
        float _3819 = 1.0 / _3813;
        float _3821 = _3805 * 6.283185482025146484375;
        float _3823 = cos(_3821);
        float _3825 = _3817 * _3819;
        float _3827 = _3805 * 6.283185482025146484375;
        float _3829 = sin(_3827);
        float _3831 = _3823 * _3825;
        float _3833 = 1.0 / _3809;
        float _3835 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3837 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3835;
        float _3839 = 1.0 / _3831;
        float _3841 = 1.0 / _3837;
        float _3843 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3845 = _3833 * _3843;
        float _3847 = _3829 * _3839;
        float _3849 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3851 = fma(_3847, _3845, _3849);
        float _3853 = _3851 * _3841;
        float _3855 = precise::clamp(_3853, 0.0, 1.0);
        _3797 = _3855;
    }
    float _3857 = _3797;
    float _3859 = _3652 * 0.5;
    float _3861 = -_3775;
    float _3863 = _3861 + 1.0;
    float _3865 = _3694 + _3652;
    float _3867 = _3857 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3869 = fma(_3704, -0.5, _3859);
    float _3871 = _3863 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3873 = _3857 > 0.0;
    bool _3875 = isnan(_3857);
    bool _3877 = _3873 || _3875;
    bool _3879 = isnan(0.0);
    bool _3881 = _3877 || _3879;
    float _3883 = _3865 * 0.5;
    float _3885 = _3867 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3887 = _3871 * _3726;
    float _3889 = _3789 + _3652;
    float _3891 = -_3871;
    float _3893 = _3891 + 1.0;
    float _3895 = _3737 * _3887;
    float _3897 = _3747 * _3887;
    float _3899 = _3889 * 0.5;
    float _3901 = fma(_3743, _3895, _3731);
    float _3903 = fma(_3745, _3895, _3733);
    float _3905 = _3737 * _3893;
    float _3907 = fma(_3737, _3897, _3735);
    out.m_79.x = _3406;
    out.m_79.y = _3402;
    out.m_79.z = _3410;
    out.gl_Position.x = _3694;
    out.gl_Position.y = _3704;
    out.gl_Position.z = _3789;
    out.gl_Position.w = _3652;
    out.m_81.x = _3883;
    out.m_81.y = _3869;
    out.m_81.z = _3899;
    out.m_81.w = _3652;
    out.m_45.x = _3885;
    out.m_83.x = _3901;
    out.m_83.y = _3903;
    out.m_83.z = _3907;
    out.m_83.w = _3905;
    if (_3881)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3909 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3909;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1682 = false;
    bool _1360 = false;
    bool _988 = false;
    bool _864 = false;
    bool _690 = false;
    bool _516 = false;
    bool _300 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_42.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    float _110 = as_type<float>(_102);
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _108;
    if (!_106)
    {
        out.m_45.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3967 = as_type<float>(_118);
        out.gl_Position.z = _3967;
    }
    if (!_106)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _122 = in.m_47.w;
    float _124 = float(_102);
    float _126 = -_122;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_122);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    bool _140 = _128 >= _124;
    bool _142 = !_138;
    bool _144 = _140 || _142;
    float _146 = _128;
    if (_144)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _110;
    if (_144)
    {
        out.m_45.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _120 = as_type<int>(_150);
    }
    int _152 = _120;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4031 = as_type<float>(_152);
        out.gl_Position.z = _4031;
    }
    if (_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_49.w;
    float _156 = 1.0 / _124;
    float _158 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_47.x;
    float _172 = in.m_47.y;
    float _174 = in.m_47.z;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = 0.0;
    float _184 = _158;
    if (!_168)
    {
        float _186 = _158 * _158;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_168)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_168;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _158 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _158);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_168;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _158 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = _128 * _156;
    float _268 = fma(_256, _170, _260);
    float _270 = fma(_256, _172, _262);
    float _272 = fma(_256, _174, _264);
    float _274 = fma(_268, _154, _176);
    float _276 = fma(_270, _154, _178);
    float _278 = fma(_272, _154, _180);
    bool _280 = !_258;
    float _298;
    if (!_280)
    {
        float _282 = in.m_51.x;
        float _284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _286 = _282 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _290 = _288 * _284;
        float _292 = floor(_290);
        float _294 = -_292;
        float _296 = _290 + _294;
        _298 = _296;
        _300 = true;
    }
    else
    {
        _298 = _266;
    }
    _300 = false;
    float _302 = _298;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = _302 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _310 = _302 + _308;
    bool _312 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _314 = isnan(_302);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = _302 + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _340 = 1.0 / _326;
    bool _342 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _344 = 1.0 / _338;
    float _346 = 1.0 / _334;
    float _348 = _306 * _340;
    bool _350 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _352 = isnan(_302);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -_322;
    float _364 = _362 + 1.0;
    float _366 = _360 * _364;
    float _368 = _310 * _344;
    bool _370 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _372 = isnan(_302);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    bool _386 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _388 = isnan(_302);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = -_360;
    float _404 = _402 + 1.0;
    float _406 = -_380;
    float _408 = _406 + 1.0;
    float _410 = _330 * _346;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _416;
    float _420 = _396 * _408;
    float _422 = fma(_384, _410, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _424 = fma(_414, _410, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _426 = fma(_418, _410, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _428 = _380 * _404;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _434 = _424 * _420;
    float _436 = _426 * _420;
    float _438 = _422 * _420;
    float _440 = -_396;
    float _442 = _440 + 1.0;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[143].x, _436);
    float _450 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[143].y, _434);
    float _452 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[143].z, _438);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _454;
    float _458 = fma(_400, _368, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _460 = fma(_446, _368, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _462 = fma(_432, _368, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _468;
    float _472 = fma(_458, _428, _448);
    float _474 = fma(_456, _348, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _476 = fma(_466, _348, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _478 = fma(_470, _348, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _480 = fma(_460, _428, _450);
    float _482 = fma(_462, _428, _452);
    float _484 = fma(_474, _366, _472);
    float _486 = fma(_476, _366, _480);
    float _488 = fma(_478, _366, _482);
    float _490 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[146].x, _484);
    float _492 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[146].y, _486);
    float _494 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[146].z, _488);
    bool _496 = !_342;
    float _514;
    if (!_496)
    {
        float _498 = in.m_51.x;
        float _500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _502 = _498 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _506 = _504 * _500;
        float _508 = floor(_506);
        float _510 = -_508;
        float _512 = _506 + _510;
        _514 = _512;
        _516 = true;
    }
    else
    {
        _514 = _266;
    }
    _516 = false;
    float _518 = _514;
    float _520 = in.m_49.x;
    float _522 = in.m_49.y;
    float _524 = in.m_49.z;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _528 = _518 + _526;
    bool _530 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _532 = isnan(_518);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _542;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _550 = 1.0 / _544;
    bool _552 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _554 = isnan(_518);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    bool _564 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _566 = 1.0 / _548;
    float _568 = _492 * _522;
    float _570 = _494 * _524;
    bool _572 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _574 = isnan(_518);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = -_540;
    float _586 = _584 + 1.0;
    float _588 = _528 * _550;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _592 = _518 + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _594;
    float _598 = _582 * _586;
    float _600 = -_582;
    float _602 = _600 + 1.0;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _608;
    float _612 = fma(_596, _588, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _614 = _562 * _602;
    float _616 = fma(_606, _588, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _618 = fma(_610, _588, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _620 = _592 * _566;
    float _622 = -_562;
    float _624 = _622 + 1.0;
    float _626 = _616 * _614;
    float _628 = _618 * _614;
    float _630 = _612 * _614;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _644 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[107].x, _626);
    float _646 = fma(_634, _620, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _648 = fma(_638, _620, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _650 = fma(_642, _620, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _652 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[107].y, _628);
    float _654 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[107].z, _630);
    float _656 = fma(_646, _598, _644);
    float _658 = _490 * _520;
    float _660 = fma(_648, _598, _652);
    float _662 = fma(_650, _598, _654);
    float _664 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[109].x, _656);
    float _666 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[109].y, _660);
    float _668 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[109].z, _662);
    bool _670 = !_564;
    float _688;
    if (!_670)
    {
        float _672 = in.m_51.x;
        float _674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _676 = _672 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _680 = _678 * _674;
        float _682 = floor(_680);
        float _684 = -_682;
        float _686 = _680 + _684;
        _688 = _686;
        _690 = true;
    }
    else
    {
        _688 = _266;
    }
    _690 = false;
    float _692 = _688;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _696 = _692 + _694;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _706 = _692 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _708 = isnan(_692);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _722 = _692 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _724 = isnan(_692);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = 1.0 / _700;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _736;
    float _740 = -_716;
    float _742 = _740 + 1.0;
    bool _744 = _692 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _746 = isnan(_692);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    bool _756 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _758 = 1.0 / _704;
    float _760 = 1.0 / _720;
    float _762 = _738 * _734;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _768 = _732 * _742;
    float _770 = -_732;
    float _772 = _770 + 1.0;
    float _774 = fma(_762, _696, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _776;
    float _780 = _754 * _772;
    float _782 = _766 * _758;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _786 = _692 + _784;
    bool _788 = _692 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _790 = isnan(_692);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = _774 * _780;
    float _802 = -_754;
    float _804 = _802 + 1.0;
    float _806 = fma(_782, _786, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _810 = _692 + _808;
    float _812 = _778 * _760;
    float _814 = -_798;
    float _816 = _814 + 1.0;
    float _818 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[115].x, _800);
    float _820 = _666 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _822 = fma(_812, _810, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _824 = _716 * _816;
    float _826 = fma(_806, _768, _818);
    float _828 = _664 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _830 = _668 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _832 = fma(_822, _824, _826);
    float _834 = _828 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _836 = _830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _838 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[118].x, _832);
    float _840 = _820 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _842 = _838 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _834;
    out.m_53.y = _840;
    out.m_53.z = _836;
    out.m_53.w = _842;
    bool _844 = !_756;
    float _862;
    if (!_844)
    {
        float _846 = in.m_51.x;
        float _848 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _850 = _846 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _852 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _854 = _852 * _848;
        float _856 = floor(_854);
        float _858 = -_856;
        float _860 = _854 + _858;
        _862 = _860;
        _864 = true;
    }
    else
    {
        _862 = _266;
    }
    _864 = false;
    float _866 = _862;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _870 = _866 + _868;
    bool _872 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _874 = isnan(_866);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _884;
    bool _888 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _890 = isnan(_866);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = -_882;
    float _902 = _900 + 1.0;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _904;
    float _908 = 1.0 / _886;
    bool _910 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _912 = _898 * _902;
    float _914 = -_898;
    float _916 = _914 + 1.0;
    float _918 = _870 * _908;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _920;
    float _924 = fma(_906, _918, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _926;
    float _930 = fma(_922, _918, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _932 = _924 * _912;
    float _934 = fma(_928, _918, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _936 = _930 * _912;
    float _938 = _934 * _912;
    float _940 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[123].x, _932);
    float _942 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[123].y, _938);
    float _944 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[123].z, _936);
    float _946 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[124].x, _940);
    float _948 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[124].y, _942);
    float _950 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[124].z, _944);
    float _952 = _946 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _954 = _948 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _956 = _950 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _960 = _952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _962 = _954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _964 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _960;
    out.m_55.y = _962;
    out.m_55.z = _964;
    out.m_55.w = _958;
    bool _966 = !_910;
    float _968 = _960;
    float _986;
    if (!_966)
    {
        float _970 = in.m_51.x;
        float _972 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _974 = _970 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[14].x, _128);
        float _978 = _976 * _972;
        float _980 = floor(_978);
        float _982 = -_980;
        float _984 = _978 + _982;
        _986 = _984;
        _988 = true;
    }
    else
    {
        _986 = _266;
    }
    _988 = false;
    float _990 = _986;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _994 = _990 + _992;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _996;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1002 = _1000 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1012 = 1.0 / _998;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1014;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1022 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1024 = isnan(_990);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1030 = _1026 || _1028;
    float _1032 = float(_1030);
    float _1034 = 1.0 / _1002;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1038 = _990 + _1036;
    float _1040 = -_1032;
    float _1042 = _1040 + 1.0;
    bool _1044 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1046 = 1.0 / _1006;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1050 = _990 + _1048;
    float _1052 = _1038 * _1012;
    bool _1054 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1056 = isnan(_990);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1062 = _1058 || _1060;
    float _1064 = float(_1062);
    bool _1066 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1068 = isnan(_990);
    bool _1070 = _1066 || _1068;
    bool _1072 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1074 = _1070 || _1072;
    float _1076 = float(_1074);
    float _1078 = 1.0 / _1010;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1080;
    float _1084 = _1050 * _1034;
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1088 = _990 + _1086;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1092 = _990 + _1090;
    float _1094 = 1.0 / _1016;
    float _1096 = _1088 * _1046;
    float _1098 = -_1064;
    float _1100 = _1098 + 1.0;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1104 = _990 + _1102;
    bool _1106 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1108 = isnan(_990);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    float _1118 = _1076 * _1100;
    float _1120 = 1.0 / _1020;
    bool _1122 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1124 = isnan(_990);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    float _1134 = _994 * _1078;
    float _1136 = _1116 * _1042;
    float _1138 = -_1116;
    float _1140 = _1138 + 1.0;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1142;
    float _1146 = 1.0 / _1082;
    float _1148 = _1092 * _1094;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1152 = _990 + _1150;
    float _1154 = fma(_1144, _1096, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1156 = _1152 * _1120;
    float _1158 = -_1076;
    float _1160 = _1158 + 1.0;
    bool _1162 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1164 = isnan(_990);
    bool _1166 = _1162 || _1164;
    bool _1168 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1170 = _1166 || _1168;
    float _1172 = float(_1170);
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1174;
    float _1178 = _1132 * _1160;
    float _1180 = -_1132;
    float _1182 = _1180 + 1.0;
    float _1184 = fma(_1176, _1052, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1186 = _1104 * _1146;
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1188;
    float _1192 = _1172 * _1182;
    float _1194 = -_1172;
    float _1196 = _1194 + 1.0;
    float _1198 = fma(_1190, _1052, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    bool _1200 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1202 = isnan(_990);
    bool _1204 = _1200 || _1202;
    bool _1206 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1208 = _1204 || _1206;
    float _1210 = float(_1208);
    float _1212 = _1032 * _1196;
    bool _1214 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1216 = isnan(_990);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1222 = _1218 || _1220;
    float _1224 = float(_1222);
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1228 = _1226 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1230 = -_1224;
    float _1232 = _1230 + 1.0;
    float _1234 = _1224 * _1140;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1238 = _1236 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1240 = fma(_1228, _1084, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1242 = _1210 * _1232;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1244;
    float _1248 = fma(_1238, _1084, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1250 = -_1210;
    float _1252 = _1250 + 1.0;
    float _1254 = _1184 * _1242;
    float _1256 = _1198 * _1242;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1260 = _1258 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1262 = fma(_1246, _1096, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1266 = _1264 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1268 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1254);
    float _1270 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1256);
    float _1272 = fma(_1260, _1134, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1274 = fma(_1240, _1234, _1268);
    float _1276 = fma(_1248, _1234, _1270);
    float _1278 = fma(_1266, _1134, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1280;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1284;
    float _1288 = fma(_1262, _1136, _1274);
    float _1290 = fma(_1154, _1136, _1276);
    float _1292 = fma(_1282, _1148, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1294 = fma(_1286, _1148, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1298 = _1296 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1302 = _1300 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1304 = fma(_1272, _1212, _1288);
    float _1306 = fma(_1278, _1212, _1290);
    float _1308 = fma(_1298, _1156, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1310 = fma(_1302, _1156, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1312;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1316;
    float _1320 = fma(_1292, _1192, _1304);
    float _1322 = fma(_1294, _1192, _1306);
    float _1324 = fma(_1314, _1186, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1326 = fma(_1318, _1186, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1328 = fma(_1308, _1178, _1320);
    float _1330 = fma(_1310, _1178, _1322);
    float _1332 = fma(_1324, _1118, _1328);
    float _1334 = fma(_1326, _1118, _1330);
    float _1336 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1332);
    float _1338 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1334);
    out.m_57.x = _1336;
    out.m_57.y = _1338;
    bool _1340 = !_1044;
    float _1358;
    if (!_1340)
    {
        float _1342 = in.m_51.x;
        float _1344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1346 = _1342 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1348 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[14].y, _128);
        float _1350 = _1348 * _1344;
        float _1352 = floor(_1350);
        float _1354 = -_1352;
        float _1356 = _1350 + _1354;
        _1358 = _1356;
        _1360 = true;
    }
    else
    {
        _1358 = _266;
    }
    _1360 = false;
    float _1362 = _1358;
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1366 = _1362 + _1364;
    bool _1368 = _1362 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1370 = isnan(_1362);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1376 = _1372 || _1374;
    float _1378 = float(_1376);
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1382 = _1380 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1384 = _1362 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1386 = isnan(_1362);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1392 = _1388 || _1390;
    float _1394 = float(_1392);
    float _1396 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1396;
    bool _1400 = _1362 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1402 = isnan(_1362);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1408 = _1404 || _1406;
    float _1410 = float(_1408);
    float _1412 = 1.0 / _1382;
    float _1414 = -_1378;
    float _1416 = _1414 + 1.0;
    bool _1418 = _1362 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1420 = isnan(_1362);
    bool _1422 = _1418 || _1420;
    bool _1424 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1426 = _1422 || _1424;
    float _1428 = float(_1426);
    float _1430 = -_1410;
    float _1432 = _1430 + 1.0;
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1436 = _1434 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1438 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1440 = 1.0 / _1436;
    float _1442 = _1398 * _1412;
    float _1444 = _1394 * _1416;
    float _1446 = -_1394;
    float _1448 = _1446 + 1.0;
    float _1450 = fma(_1442, _1366, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _1452 = _1362 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1454 = isnan(_1362);
    bool _1456 = _1452 || _1454;
    bool _1458 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1460 = _1456 || _1458;
    float _1462 = float(_1460);
    float _1464 = _1410 * _1448;
    bool _1466 = _1362 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1468 = isnan(_1362);
    bool _1470 = _1466 || _1468;
    bool _1472 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1474 = _1470 || _1472;
    float _1476 = float(_1474);
    float _1478 = _1428 * _1432;
    float _1480 = -_1428;
    float _1482 = _1480 + 1.0;
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1486 = _1484 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1490 = _1488 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1492 = _1476 * _1482;
    float _1494 = -_1476;
    float _1496 = _1494 + 1.0;
    bool _1498 = _1362 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1500 = isnan(_1362);
    bool _1502 = _1498 || _1500;
    bool _1504 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1506 = _1502 || _1504;
    float _1508 = float(_1506);
    float _1510 = 1.0 / _1486;
    float _1512 = _1462 * _1496;
    float _1514 = -_1462;
    float _1516 = _1514 + 1.0;
    float _1518 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1520 = _1518 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1522 = _1508 * _1516;
    float _1524 = 1.0 / _1490;
    float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1528 = _1526 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1530 = _1520 * _1440;
    float _1532 = _1450 * _1522;
    float _1534 = -_1508;
    float _1536 = _1534 + 1.0;
    float _1538 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1540 = _1538 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1544 = _1362 + _1542;
    float _1546 = 1.0 / _1528;
    float _1548 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1548;
    float _1552 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1532);
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1556 = _1554 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1558 = fma(_1530, _1544, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1560 = _1550 * _1510;
    float _1562 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1564 = _1362 + _1562;
    float _1566 = 1.0 / _1540;
    float _1568 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1570 = _1568 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1572 = fma(_1560, _1564, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1574 = fma(_1558, _1512, _1552);
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1576;
    float _1580 = _1570 * _1524;
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1584 = _1362 + _1582;
    float _1586 = fma(_1572, _1492, _1574);
    float _1588 = 1.0 / _1556;
    float _1590 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1592 = _1590 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1594 = _1578 * _1546;
    float _1596 = fma(_1580, _1584, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1600 = _1362 + _1598;
    float _1602 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1604 = _1362 + _1602;
    float _1606 = _1592 * _1566;
    float _1608 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1608;
    bool _1612 = _1362 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1614 = isnan(_1362);
    bool _1616 = _1612 || _1614;
    bool _1618 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1620 = _1616 || _1618;
    float _1622 = float(_1620);
    float _1624 = fma(_1594, _1600, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1626 = fma(_1596, _1478, _1586);
    float _1628 = fma(_1606, _1604, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1632 = _1362 + _1630;
    float _1634 = -_1622;
    float _1636 = _1634 + 1.0;
    float _1638 = _1610 * _1588;
    float _1640 = fma(_1624, _1464, _1626);
    float _1642 = _1378 * _1636;
    float _1644 = fma(_1638, _1632, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1646 = fma(_1628, _1444, _1640);
    float _1648 = fma(_1644, _1642, _1646);
    float _1650 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1648);
    out.m_59.x = _1650;
    bool _1652 = !_1438;
    int _1654 = as_type<int>(_1362);
    float _1656 = _1378;
    int _1658 = as_type<int>(_1604);
    int _1660 = as_type<int>(_1638);
    bool _1662 = _1438;
    float _1680;
    if (!_1652)
    {
        float _1664 = in.m_51.x;
        float _1666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1668 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1670 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[14].z, _128);
        float _1672 = _1670 * _1666;
        float _1674 = floor(_1672);
        float _1676 = -_1674;
        float _1678 = _1672 + _1676;
        _1680 = _1678;
        _1654 = as_type<int>(_1666);
        _1656 = _1672;
        _1682 = true;
    }
    else
    {
        _1680 = _266;
    }
    _1682 = false;
    float _1684 = _1680;
    int _1686 = _1654;
    float _1688 = _1656;
    float _1690 = in.m_61.x;
    float _1692 = _276 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1696 = _1694 != 0;
    float _1698 = in.m_61.y;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1702 = _1700 != 0;
    float _1704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1708 = _1706 != 0;
    float _1710 = in.m_51.w;
    float _1712 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1714 = _1684 + _1712;
    float _1716 = in.m_51.y;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1720 = _1718 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    int _1722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1724 = _1722 != 0;
    int _1726 = _1686;
    float _1728 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1732 = _1714;
    if (_1696)
    {
        float _1734 = in.m_51.x;
        _1726 = as_type<int>(_1734);
    }
    int _1736 = _1726;
    float _1738 = 1.0 / _1720;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1742 = _1688;
    if (_1702)
    {
        float _1744 = in.m_51.z;
        _1742 = _1744;
    }
    float _1746 = _1742;
    float _1748 = _1690;
    if (_1702)
    {
        float _1750 = -_1690;
        float _1752 = _1750 + 1.0;
        _1658 = as_type<int>(_1752);
    }
    int _1754 = _1658;
    float _1756 = 0.0;
    if (!_1696)
    {
        _1756 = _1690;
    }
    float _1758 = _1756;
    float _1760 = _1758;
    if (_1708)
    {
        float _1762 = -_1690;
        float _1764 = _1762 + 1.0;
        _1660 = as_type<int>(_1764);
    }
    int _1766 = _1660;
    if (!_1708)
    {
        _1728 = _1690;
    }
    float _1768 = _1728;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1770;
    bool _1774 = _1684 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1776 = isnan(_1684);
    bool _1778 = _1774 || _1776;
    bool _1780 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1782 = _1778 || _1780;
    float _1784 = float(_1782);
    float _1786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1788 = _1684 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1790 = isnan(_1684);
    bool _1792 = _1788 || _1790;
    bool _1794 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1796 = _1792 || _1794;
    float _1798 = float(_1796);
    bool _1800 = _1710 > 0.5;
    float _1802 = -_1784;
    float _1804 = _1802 + 1.0;
    float _1806 = _1798 * _1804;
    float _1808 = _1704 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1810 = _1736;
    float _1812 = _1768;
    int _1814 = as_type<int>(_1786);
    int _1816 = as_type<int>(_1704);
    if (_1696)
    {
        bool _1818 = as_type<float>(_1736) > 0.5;
        _1662 = _1818;
    }
    bool _1820 = _1662;
    if (_1696)
    {
        float _1822 = -_1690;
        float _1824 = _1822 + 1.0;
        _1810 = as_type<int>(_1824);
    }
    int _1826 = _1810;
    float _1828 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1830 = _1828 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1832 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1834 = false;
    if (_1702)
    {
        bool _1836 = _1746 > 0.5;
        _1834 = _1836;
    }
    bool _1838 = _1834;
    float _1840 = -_1798;
    float _1842 = _1840 + 1.0;
    if (_1696)
    {
        float _1844 = _1820 ? as_type<float>(_1826) : _1690;
        _1760 = _1844;
    }
    float _1846 = _1760;
    float _1848 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1850 = _1848 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    int _1852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1854 = _1852 != 0;
    float _1856 = 1.0 / _1850;
    bool _1858 = _1716 > 0.5;
    if (!_1702)
    {
        _1730 = _1690;
    }
    float _1860 = _1730;
    float _1862 = _1860;
    if (_1702)
    {
        float _1864 = _1838 ? as_type<float>(_1754) : _1690;
        _1862 = _1864;
    }
    float _1866 = _1862;
    int _1868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1870 = _1868 != 0;
    float _1872 = 1.0 / _1830;
    float _1874 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1876 = _1874 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1878 = -_1698;
    float _1880 = _1878 + 1.0;
    if (_1708)
    {
        float _1882 = _1858 ? as_type<float>(_1766) : _1690;
        _1812 = _1882;
    }
    float _1884 = _1812;
    int _1886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1888 = _1886 != 0;
    int _1890 = _1800 ? as_type<int>(_1880) : as_type<int>(_1698);
    float _1892 = 1.0 / _1876;
    int _1894 = _1858 ? as_type<int>(_1880) : as_type<int>(_1698);
    float _1896 = _1854 ? as_type<float>(_1890) : _1698;
    float _1898 = fma(_1808, _1896, -0.5);
    float _1900 = _276 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1902 = _1870 ? as_type<float>(_1894) : _1698;
    float _1904 = _276 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1908 = _1906 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1910 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1900);
    float _1912 = _1716 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1914 = 1.0 / _1908;
    float _1916 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1904);
    float _1918 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1692);
    float _1920 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1922 = _1920 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1924 = fma(_1912, -2.0, _1740);
    float _1926 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1916);
    float _1928 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1910);
    float _1930 = 1.0 / _1922;
    float _1932 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1934 = _1932 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1936 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1918);
    float _1938 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1940 = _1938 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1942 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1942;
    float _1946 = _1934 * _1872;
    float _1948 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1948;
    float _1952 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1952;
    float _1956 = 1.0 / _1940;
    float _1958 = _1944 * _1856;
    float _1960 = _1950 * _1738;
    float _1962 = _1954 * _1914;
    float _1964 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1966 = _1684 + _1964;
    bool _1968 = _1684 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1970 = isnan(_1684);
    bool _1972 = _1968 || _1970;
    bool _1974 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1976 = _1972 || _1974;
    float _1978 = float(_1976);
    float _1980 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1982 = _1684 + _1980;
    float _1984 = _1772 * _1930;
    bool _1986 = _1684 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1988 = isnan(_1684);
    bool _1990 = _1986 || _1988;
    bool _1992 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1994 = _1990 || _1992;
    float _1996 = float(_1994);
    float _1998 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _2000 = _1998 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2002 = fma(_1958, _1966, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _2004 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2006 = _1684 + _2004;
    float _2008 = -_1978;
    float _2010 = _2008 + 1.0;
    float _2012 = fma(_1946, _1982, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _2014 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _2016 = _2014 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _2018 = fma(_1960, _2006, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _2020 = _1996 * _2010;
    bool _2022 = _1684 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _2024 = isnan(_1684);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _2030 = _2026 || _2028;
    float _2032 = float(_2030);
    float _2034 = -_1996;
    float _2036 = _2034 + 1.0;
    float _2038 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2040 = _1684 + _2038;
    float _2042 = _2000 * _1892;
    float _2044 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2046 = _1684 + _2044;
    bool _2048 = _1684 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _2050 = isnan(_1684);
    bool _2052 = _2048 || _2050;
    bool _2054 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _2056 = _2052 || _2054;
    float _2058 = float(_2056);
    float _2060 = _2016 * _1956;
    float _2062 = _2032 * _2036;
    float _2064 = -_2032;
    float _2066 = _2064 + 1.0;
    float _2068 = fma(_1962, _2040, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _2070 = fma(_2042, _2046, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _2072 = _2036;
    float _2074 = _2002;
    if (_1724)
    {
        float _2076 = in.m_51.x;
        _2072 = _2076;
    }
    float _2078 = _2072;
    bool _2080 = _1684 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _2082 = isnan(_1684);
    bool _2084 = _2080 || _2082;
    bool _2086 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _2088 = _2084 || _2086;
    float _2090 = float(_2088);
    float _2092 = -_2058;
    float _2094 = _2092 + 1.0;
    float _2096 = _1716 * 2.0;
    float _2098 = _2040;
    if (_1724)
    {
        float _2100 = in.m_51.z;
        _2098 = _2100;
    }
    float _2102 = _2098;
    float _2104 = _2058 * _2066;
    float _2106 = _2090 * _2094;
    float _2108 = -_2090;
    float _2110 = _2108 + 1.0;
    int _2112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2114 = _2112 != 0;
    float _2116 = floor(_2096);
    float _2118 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2120 = _1684 + _2118;
    float _2122 = _1784 * _2110;
    bool _2124 = _1684 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _2126 = isnan(_1684);
    bool _2128 = _2124 || _2126;
    bool _2130 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _2132 = _2128 || _2130;
    int _2134 = _2132 ? 1065353216 : 0;
    float _2136 = fma(_2060, _1714, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _2138 = fma(_1984, _2120, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _2140 = _1786 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2142 = _2134;
    int _2144 = as_type<int>(_2140);
    float _2146 = _2138;
    if (_1888)
    {
        float _2148 = -_1690;
        float _2150 = _2148 + 1.0;
        _1814 = as_type<int>(_2150);
    }
    int _2152 = _1814;
    float _2154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2156 = as_type<float>(_2134) * _1842;
    int _2158 = as_type<int>(_2156);
    if (!_1888)
    {
        _1732 = _1690;
    }
    float _2160 = _1732;
    float _2162 = fma(_2140, _1902, -0.5);
    float _2164 = _2160;
    float _2166 = _2162;
    if (_1888)
    {
        float _2168 = _1858 ? as_type<float>(_2152) : _1690;
        _2164 = _2168;
    }
    float _2170 = _2164;
    float _2172 = _2002 * _2156;
    float _2174 = -as_type<float>(_2134);
    float _2176 = _2174 + 1.0;
    int _2178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2180 = _2178 != 0;
    float _2182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2186 = _2184 != 0;
    if (_2114)
    {
        float _2188 = -_1690;
        float _2190 = _2188 + 1.0;
        _1816 = as_type<int>(_2190);
    }
    int _2192 = _1816;
    if (_1724)
    {
        _2158 = 0;
    }
    int _2194 = _2158;
    int _2196 = _2194;
    if (_1724)
    {
        _2142 = 0;
    }
    int _2198 = _2142;
    int _2200 = _2198;
    if (_1724)
    {
        _2074 = _1716;
    }
    float _2202 = _2074;
    bool _2204 = _2116 > 0.0;
    float _2206 = 0.0;
    float _2208 = _2202;
    float _2210 = _2078;
    if (_1724)
    {
        _2206 = _2078;
    }
    float _2212 = _2206;
    float _2214 = _2102;
    float _2216 = _2212;
    if (_1724)
    {
        _2144 = as_type<int>(_2102);
    }
    int _2218 = _2144;
    bool _2220 = _2116 >= 0.0;
    bool _2222 = isnan(_2116);
    bool _2224 = _2220 || _2222;
    bool _2226 = isnan(0.0);
    bool _2228 = _2224 || _2226;
    int _2230 = _2218;
    if (!_1724)
    {
        float _2232 = in.m_51.x;
        float _2234 = _1716 * 3.1415927410125732421875;
        float _2236 = in.m_51.z;
        float _2238 = _2234 * 0.15915493667125701904296875;
        float _2240 = _2238 * 6.283185482025146484375;
        float _2242 = sin(_2240);
        float _2244 = _2232 * 3.1415927410125732421875;
        float _2246 = _2244 * 0.15915493667125701904296875;
        float _2248 = _2236 * 3.1415927410125732421875;
        float _2250 = _2248 * 0.15915493667125701904296875;
        float _2252 = _2246 * 6.283185482025146484375;
        float _2254 = sin(_2252);
        float _2256 = _2250 * 6.283185482025146484375;
        float _2258 = sin(_2256);
        _2214 = _2236;
        _2200 = 2;
        _2196 = 1;
        _2208 = _2242;
        _2210 = _2232;
        _2216 = _2254;
        _2230 = as_type<int>(_2258);
    }
    float _2260 = _2214;
    int _2262 = _2200;
    int _2264 = _2196;
    float _2266 = _2208;
    float _2268 = _2210;
    float _2270 = _2216;
    int _2272 = _2230;
    float _2274 = _2260 * 2.0;
    int _2276 = _2228 ? 0 : 1;
    float _2278 = fma(_2176, (*spvDescriptorSet0.vp_c9)._m0[175].x, _2172);
    bool _2280 = _2260 > 0.5;
    float _2282 = floor(_2274);
    if (_2114)
    {
        float _2284 = _1858 ? as_type<float>(_2192) : _1690;
        _1748 = _2284;
    }
    float _2286 = _1748;
    float _2288 = _1832 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2290 = ~_2276;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    float _2296 = _1928 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2298 = _2262 != 2;
    float _2300 = fma(_2288, _1846, -0.5);
    int _2302 = _2294;
    if (!_2204)
    {
        int _2304 = ~_2276;
        int _2306 = _2304 + 1;
        _2302 = _2306;
    }
    int _2308 = _2302;
    float _2310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _2312 = _2280 ? as_type<int>(_1880) : as_type<int>(_1698);
    float _2314 = _1926 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2316 = _2264 != 1;
    float _2318 = _1936 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2322 = _2320 != 0;
    float _2324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2326 = _2182 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2328 = _2180 ? as_type<float>(_2312) : _1698;
    float _2330 = _2266 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2332 = _2186 ? as_type<float>(_2312) : _1698;
    float _2334 = fma(_2326, _1884, -0.5);
    int _2336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2338 = _2336 != 0;
    int _2340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2342 = _2340 != 0;
    int _2344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2346 = _2344 != 0;
    float _2348 = fma(_2012, _1806, _2278);
    float _2350 = _2322 ? as_type<float>(_2312) : _1698;
    float _2352 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2354 = _2268 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2356 = _2154 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2358 = _2282 >= 0.0;
    bool _2360 = isnan(_2282);
    bool _2362 = _2358 || _2360;
    bool _2364 = isnan(0.0);
    bool _2366 = _2362 || _2364;
    float _2368 = _2310 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2370 = -_2352;
    float _2372 = fma(_2354, 2.0, _2370);
    float _2374 = _2268 * 2.0;
    int _2376 = _2366 ? 0 : 1;
    float _2378 = _2324 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    bool _2380 = _2282 > 0.0;
    float _2382 = fma(_2356, _1866, -0.5);
    float _2384 = floor(_2374);
    float _2386 = fma(_2378, _2170, -0.5);
    float _2388 = _2270 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2390 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2392 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    int _2394 = ~_2376;
    int _2396 = _2394 + 1;
    int _2398 = _2396 + 1;
    float _2400 = -_2390;
    float _2402 = fma(_2388, 2.0, _2400);
    float _2404 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2406 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2408 = _2398;
    if (!_2380)
    {
        int _2410 = ~_2376;
        int _2412 = _2410 + 1;
        _2408 = _2412;
    }
    int _2414 = _2408;
    float _2416 = fma(_2330, -2.0, _2392);
    bool _2418 = !_2316;
    float _2420 = _2418 ? _2266 : _2270;
    float _2422 = fma(_2266, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2406);
    bool _2424 = _2384 >= 0.0;
    bool _2426 = isnan(_2384);
    bool _2428 = _2424 || _2426;
    bool _2430 = isnan(0.0);
    bool _2432 = _2428 || _2430;
    float _2434 = fma(_2368, _2286, -0.5);
    bool _2436 = !_2316;
    float _2438 = _2436 ? as_type<float>(_2272) : _2266;
    float _2440 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2442 = _2296 + _2440;
    int _2444 = _2432 ? 0 : 1;
    float _2446 = fma(_2270, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2404);
    bool _2448 = _2384 > 0.0;
    float _2450 = _1716 + _2260;
    float _2452 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2454 = _2314 + _2452;
    float _2456 = _2442 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2458 = _1716 + _2268;
    float _2460 = _2450 + (-1.0);
    float _2462 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2456);
    float _2464 = _2458 + (-1.0);
    float _2466 = fma(_2018, _2122, _2348);
    float _2468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2470 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2446);
    float _2472 = fma(_2464, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2474 = fma(_2070, _2106, _2466);
    float _2476 = -_128;
    float _2478 = fma(_2476, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2402);
    float _2480 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2482 = _2318 + _2480;
    float _2484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2486 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _2488 = fma(_2470, _2386, _2478);
    float _2490 = fma(_2482, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2462);
    float _2492 = fma(_2260, (*spvDescriptorSet0.vp_c9)._m0[79].z, _2486);
    float _2494 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _2496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _2498 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[79].x, _2492);
    int _2500 = ~_2444;
    int _2502 = _2500 + 1;
    int _2504 = _2502 + 1;
    float _2506 = fma(_2460, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2508 = _2468 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2510 = _2498 * (-0.15915493667125701904296875);
    int _2512 = _2504;
    float _2514 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    if (!_2448)
    {
        int _2516 = ~_2444;
        int _2518 = _2516 + 1;
        _2512 = _2518;
    }
    int _2520 = _2512;
    float _2522 = fma(_2420, (*spvDescriptorSet0.vp_c9)._m0[98].z, _2494);
    float _2524 = _2420 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _2526 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2422);
    bool _2528 = _2490 >= 0.0;
    float _2530 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _2532 = _2510 * 6.283185482025146484375;
    float _2534 = sin(_2532);
    float _2536 = _2484 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2538 = fma(_2350, _2508, -0.5);
    float _2540 = -_2530;
    float _2542 = fma(_2524, 2.0, _2540);
    float _2544 = _2496 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _2546 = fma(_2332, _2536, -0.5);
    float _2548 = _2530;
    if (_2298)
    {
        _2548 = _2268;
    }
    float _2550 = _2548;
    float _2552 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2416);
    float _2554 = _2510 * 6.283185482025146484375;
    float _2556 = cos(_2554);
    float _2558 = fma(_2328, _2544, -0.5);
    float _2560 = _2438 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _2562 = _2550;
    if (!_2298)
    {
        _2562 = _2260;
    }
    float _2564 = _2562;
    float _2566 = fma(_2068, _2104, _2474);
    float _2568 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2570 = _2564 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2572 = as_type<int>(_2564);
    if (_2528)
    {
        _2514 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2574 = _2514;
    float _2576 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _2578 = -_2552;
    float _2580 = fma(_2526, _2538, _2578);
    float _2582 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _2584 = -_2568;
    float _2586 = fma(_2570, 2.0, _2584);
    float _2588 = fma(_2560, -2.0, _2576);
    float _2590 = _2534 * _2162;
    float _2592 = fma(_2438, (*spvDescriptorSet0.vp_c9)._m0[98].w, _2582);
    float _2594 = _2556 * _2162;
    float _2596 = 0.0;
    float _2598 = 0.0;
    if (_2528)
    {
        float _2600 = _2574 * 5.0;
        _2572 = as_type<int>(_2600);
    }
    int _2602 = _2572;
    float _2604 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].w, _2592);
    float _2606 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[96].y, _2588);
    float _2608 = -_2590;
    float _2610 = fma(_2556, _2300, _2608);
    float _2612 = fma(_2534, _2300, _2594);
    if (_2528)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7978 = as_type<float>(_2602);
        out.gl_Position.z = _7978;
    }
    float _2614 = fma(_2136, _2062, _2566);
    float _2616 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].z, _2522);
    float _2618 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2620 = -_128;
    float _2622 = fma(_2620, (*spvDescriptorSet0.vp_c9)._m0[96].x, _2542);
    float _2624 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1924);
    float _2626 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2628 = -_128;
    float _2630 = fma(_2628, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2372);
    float _2632 = fma(_2616, _2434, _2622);
    float _2634 = fma(_1716, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2626);
    float _2636 = -_2606;
    float _2638 = fma(_2604, _2558, _2636);
    float _2640 = _2630;
    if (!_2316)
    {
        _2596 = _1716;
    }
    float _2642 = _2596;
    float _2644 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2646 = log2(_2644);
    float _2648 = _2642;
    if (!_2316)
    {
        _2598 = _2260;
    }
    float _2650 = _2598;
    float _2652 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _2654 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2634);
    float _2656 = _2650;
    if (_2316)
    {
        _2656 = _1716;
    }
    float _2658 = _2656;
    float _2660 = fma(_2138, _2020, _2614);
    float _2662 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2664 = _2662;
    if (!_2316)
    {
        _2166 = _2642;
    }
    float _2666 = _2166;
    float _2668 = fma(_2658, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2618);
    float _2670 = _2666;
    if (_2316)
    {
        _2648 = _2268;
    }
    float _2672 = _2648;
    float _2674 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_2316)
    {
        _2670 = _2268;
    }
    float _2676 = _2670;
    float _2678 = -_2624;
    float _2680 = fma(_2654, _2612, _2678);
    if (_2298)
    {
        _2146 = _1716;
    }
    float _2682 = _2146;
    float _2684 = fma(_2672, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2662);
    float _2686 = fma(_2268, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2674);
    float _2688 = _2682;
    if (_2298)
    {
        _2664 = _2260;
    }
    float _2690 = _2664;
    float _2692 = _2488 + 0.5;
    float _2694 = _2690;
    if (!_2298)
    {
        _2694 = _1716;
    }
    float _2696 = _2694;
    float _2698 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2686);
    float _2700 = _2580 + 0.5;
    float _2702 = _2676 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2704 = fma(_2698, _2610, _2630);
    float _2706 = fma(_2696, (*spvDescriptorSet0.vp_c9)._m0[89].z, _2652);
    if (!_2316)
    {
        _2640 = _2260;
    }
    float _2708 = _2640;
    out.m_63.x = _2692;
    out.m_63.y = _2700;
    float _2710 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2712 = _2708;
    if (_2316)
    {
        _2712 = _1716;
    }
    float _2714 = _2712;
    float _2716 = _2646 * _128;
    if (!_2298)
    {
        _2688 = _2268;
    }
    float _2718 = _2688;
    float _2720 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2722 = -_2710;
    float _2724 = fma(_2702, 2.0, _2722);
    float _2726 = _2714 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2728 = float(_2414);
    float _2730 = _2638 + 0.5;
    float _2732 = _2632 + 0.5;
    bool _2734 = !_2338;
    int _2736 = _2734 ? 0 : 1;
    float _2738 = fma(_2726, -2.0, _2720);
    float _2740 = _2718 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2742 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2744 = abs(_2736);
    float _2746 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2660);
    bool _2748 = !_2342;
    int _2750 = _2748 ? 0 : 1;
    float _2752 = fma(_2740, -2.0, _2742);
    out.m_65.x = _2732;
    out.m_65.y = _2730;
    int _2754 = abs(_2750);
    float _2756 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2684);
    float _2758 = -_128;
    float _2760 = fma(_2758, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2724);
    float _2762 = float(_2754);
    float _2764 = exp2(_2716);
    float _2766 = float(_2520);
    float _2768 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[89].x, _2706);
    float _2770 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2668);
    float _2772 = float(_2744);
    float _2774 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2776 = 1.0 + _2774;
    float _2778 = _2762 * _2766;
    float _2780 = fma(_2756, _2382, _2760);
    float _2782 = in.m_67.x;
    float _2784 = in.m_67.y;
    float _2786 = _2772 * _2728;
    float _2788 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2738);
    float _2790 = 1.0 / _2776;
    float _2792 = in.m_69.x;
    float _2794 = in.m_69.y;
    float _2796 = in.m_69.z;
    float _2798 = _2768 * (-0.15915493667125701904296875);
    float _2800 = -_2788;
    float _2802 = fma(_2770, _1898, _2800);
    float _2804 = -_2764;
    float _2806 = _2804 + 1.0;
    out.m_71.x = _2746;
    float _2808 = _2798 * 6.283185482025146484375;
    float _2810 = cos(_2808);
    float _2812 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _2814 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2816 = isnan(1.0);
    bool _2818 = _2814 || _2816;
    bool _2820 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2822 = _2818 || _2820;
    float _2824 = in.m_73.x;
    float _2826 = in.m_73.y;
    float _2828 = in.m_73.z;
    float _2830 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2832 = fma(_1716, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2812);
    bool _2834 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2836 = isnan(0.0);
    bool _2838 = _2834 || _2836;
    bool _2840 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2842 = _2838 || _2840;
    float _2844 = -_128;
    float _2846 = fma(_2844, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2586);
    float _2848 = _2798 * 6.283185482025146484375;
    float _2850 = sin(_2848);
    float _2852 = fma(_2268, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2830);
    float _2854 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2832);
    float _2856 = _2786 * (-2.0);
    float _2858 = _2842 ? _2806 : 0.0;
    float _2860 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2852);
    float _2862 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2752);
    float _2864 = fma(_2472, _2856, _2472);
    float _2866 = _2810 * _2546;
    float _2868 = _2784 * 37.6991119384765625;
    if (_2822)
    {
        float _2870 = _2858 * _2790;
        _146 = _2870;
    }
    float _2872 = _146;
    float _2874 = fma(_2856, _2792, _2792);
    float _2876 = _2268 + (-0.5);
    float _2878 = _2442 * _2442;
    float _2880 = _2868 * 0.15915493667125701904296875;
    if (_2528)
    {
        out.m_45.x = 0.0;
    }
    float _2882 = _2850 * _2546;
    float _2884 = fma(_2850, _2334, _2866);
    float _2886 = fma(_2876, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2874);
    float _2888 = _2826 * _2826;
    float _2890 = -_2882;
    float _2892 = fma(_2810, _2334, _2890);
    float _2894 = fma(_2454, _2454, _2878);
    float _2896 = _2778 * (-2.0);
    float _2898 = fma(_2824, _2824, _2888);
    float _2900 = fma(_2860, _2892, _2846);
    float _2902 = fma(_2482, _2482, _2894);
    float _2904 = fma(_2506, _2896, _2506);
    float _2906 = fma(_2896, _2794, _2794);
    float _2908 = fma(_2828, _2828, _2898);
    float _2910 = rsqrt(_2902);
    float _2912 = -_2862;
    float _2914 = fma(_2854, _2884, _2912);
    float _2916 = _2704 + 0.5;
    float _2918 = _2900 + 0.5;
    float _2920 = _2680 + 0.5;
    float _2922 = _2780 + 0.5;
    float _2924 = _2802 + 0.5;
    float _2926 = _2914 + 0.5;
    float _2928 = _2880 * 6.283185482025146484375;
    float _2930 = sin(_2928);
    bool _2932 = !_2346;
    int _2934 = _2932 ? 0 : 1;
    float _2936 = fma(_2864, _2872, _2886);
    out.m_75.x = _2916;
    out.m_75.y = _2920;
    out.m_75.z = _2922;
    out.m_75.w = _2924;
    float _2938 = float(_2308);
    float _2940 = _1716 + (-0.5);
    int _2942 = abs(_2934);
    out.m_77.x = _2918;
    out.m_77.y = _2926;
    float _2944 = rsqrt(_2908);
    float _2946 = _2442 * _2910;
    float _2948 = _2454 * _2910;
    if (_2528)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2950 = -_2946;
    float _2952 = fma(_2950, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2296);
    float _2954 = _2482 * _2910;
    float _2956 = -_2948;
    float _2958 = fma(_2956, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2314);
    float _2960 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2962 = _2952 + _2960;
    float _2964 = float(_2942);
    float _2966 = fma(_2940, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2906);
    float _2968 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2970 = _2958 + _2968;
    float _2972 = _2962 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2974 = -_2954;
    float _2976 = fma(_2974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2318);
    float _2978 = _2964 * _2938;
    float _2980 = -_2946;
    float _2982 = fma(_2980, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2442);
    float _2984 = fma(_2970, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2972);
    float _2986 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2988 = _2976 + _2986;
    float _2990 = _2936 * 0.15915493667125701904296875;
    float _2992 = _2268 + _2260;
    float _2994 = -_2948;
    float _2996 = fma(_2994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2454);
    float _2998 = fma(_2988, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2984);
    float _3000 = _2982 * _2982;
    float _3002 = _2978 * (-2.0);
    float _3004 = _2992 + (-1.0);
    float _3006 = _2990 * 6.283185482025146484375;
    float _3008 = sin(_3006);
    bool _3010 = _2998 >= 0.0;
    float _3012 = fma(_2904, _2872, _2966);
    float _3014 = fma(_3004, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3016 = _3012 * 0.15915493667125701904296875;
    float _3018 = _2990 * 6.283185482025146484375;
    float _3020 = cos(_3018);
    if (_3010)
    {
        out.m_45.x = 0.0;
    }
    float _3022 = _3016 * 6.283185482025146484375;
    float _3024 = sin(_3022);
    float _3026 = fma(_2996, _2996, _3000);
    float _3028 = fma(_3002, _2796, _2796);
    float _3030 = _2260 + (-0.5);
    float _3032 = fma(_3014, _3002, _3014);
    float _3034 = -_2954;
    float _3036 = fma(_3034, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2482);
    float _3038 = _2930 * 0.20000000298023223876953125;
    float _3040 = fma(_3030, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3028);
    float _3042 = _3016 * 6.283185482025146484375;
    float _3044 = cos(_3042);
    float _3046 = fma(_3036, _3036, _3026);
    float _3048 = _3038 * _2782;
    float _3050 = fma(_3032, _2872, _3040);
    float _3052 = _3038;
    int _3054 = as_type<int>(_3050);
    if (_3010)
    {
        _3052 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3056 = _3052;
    float _3058 = _2944 * _3048;
    float _3060 = _3050 * 0.15915493667125701904296875;
    if (_3010)
    {
        float _3062 = _3056 * 5.0;
        _3054 = as_type<int>(_3062);
    }
    int _3064 = _3054;
    float _3066 = sqrt(_3046);
    float _3068 = fma(_2824, _3058, _2824);
    float _3070 = fma(_2826, _3058, _2826);
    float _3072 = fma(_2828, _3058, _2828);
    if (_3010)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8771 = as_type<float>(_3064);
        out.gl_Position.z = _8771;
    }
    float _3074 = _3008 * _3024;
    float _3076 = _3020 * _3044;
    float _3078 = _3060 * 6.283185482025146484375;
    float _3080 = sin(_3078);
    float _3082 = _568 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_3010)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3084 = _3060 * 6.283185482025146484375;
    float _3086 = cos(_3084);
    float _3088 = _2910 * _3066;
    float _3090 = _570 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3092 = _658 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3094 = fma(_3080, _3076, _3074);
    float _3096 = _3088 * _3082;
    float _3098 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3070);
    float _3100 = _3088 * _3090;
    float _3102 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3072);
    float _3104 = _3088 * _3092;
    float _3106 = _3096 * _3098;
    float _3108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3068);
    float _3110 = fma(_3080, _3074, _3076);
    float _3112 = _3020 * _3024;
    float _3114 = _3008 * _3044;
    float _3116 = _3086 * _3106;
    float _3118 = _3100 * _3102;
    float _3120 = _3104 * _3108;
    float _3122 = -_3112;
    float _3124 = fma(_3080, _3114, _3122);
    float _3126 = _3020 * _3116;
    float _3128 = _3024 * _3086;
    float _3130 = _3044 * _3086;
    float _3132 = -_3114;
    float _3134 = fma(_3080, _3112, _3132);
    float _3136 = -_3106;
    float _3138 = _3080 * _3136;
    float _3140 = fma(_3094, _3120, _3126);
    float _3142 = -_2296;
    float _3144 = _3142 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3146 = _3008 * _3116;
    float _3148 = fma(_3130, _3120, _3138);
    float _3150 = fma(_3134, _3118, _3140);
    float _3152 = -_2314;
    float _3154 = _3152 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3156 = _3144 * _3144;
    float _3158 = fma(_3124, _3120, _3146);
    float _3160 = fma(_3128, _3118, _3148);
    float _3162 = _3150 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3164 = fma(_3154, _3154, _3156);
    float _3166 = -_2318;
    float _3168 = _3166 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3170 = fma(_3110, _3118, _3158);
    float _3172 = _3150 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3174 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3162);
    float _3176 = _3150 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3178 = fma(_3168, _3168, _3164);
    float _3180 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3172);
    float _3182 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3174);
    float _3184 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3176);
    float _3186 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3180);
    float _3188 = _3182 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3190 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3184);
    float _3192 = sqrt(_3178);
    float _3194 = _3186 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3196 = _2296 + _3188;
    float _3198 = _3190 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3200 = _2314 + _3194;
    float _3202 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _3204 = _3196 + _3202;
    float _3206 = _2318 + _3198;
    float _3208 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _3210 = _3200 + _3208;
    float _3212 = _3204 * _3204;
    float _3214 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _3216 = _3206 + _3214;
    float _3218 = fma(_3210, _3210, _3212);
    float _3220 = precise::max(_3192, 5.0);
    float _3222 = fma(_3216, _3216, _3218);
    float _3224 = -_266;
    float _3226 = _3224 + 1.0;
    float _3228 = precise::min(_3220, 20.0);
    float _3230 = rsqrt(_3222);
    float _3232 = fma(_3228, 0.066666670143604278564453125, -0.3333333432674407958984375);
    float _3234 = _3226 * _3232;
    float _3236 = _3234 * 10.0;
    float _3238 = -_2946;
    float _3240 = fma(_3238, _3236, _2442);
    float _3242 = _3204 * _3230;
    float _3244 = _3210 * _3230;
    float _3246 = _3216 * _3230;
    float _3248 = -_2948;
    float _3250 = fma(_3248, _3236, _2454);
    float _3252 = _3242 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _3254 = _3240 * _3240;
    float _3256 = -_2954;
    float _3258 = fma(_3256, _3236, _2482);
    float _3260 = -_2954;
    float _3262 = fma(_3260, _3236, _2318);
    float _3264 = fma(_3244, (*spvDescriptorSet0.vp_c10)._m0[8].y, _3252);
    float _3266 = fma(_3250, _3250, _3254);
    float _3268 = -_2948;
    float _3270 = fma(_3268, _3236, _2314);
    float _3272 = -_2946;
    float _3274 = fma(_3272, _3236, _2296);
    float _3276 = fma(_3246, (*spvDescriptorSet0.vp_c10)._m0[10].y, _3264);
    float _3278 = precise::clamp(_3276, 0.0, 1.0);
    float _3280 = fma(_3258, _3258, _3266);
    float _3282 = _3278 * 3.1415927410125732421875;
    float _3284 = sqrt(_3280);
    float _3286 = _3282 * 0.15915493667125701904296875;
    float _3288 = _266 * _266;
    float _3290 = _3288 * 15.0;
    float _3292 = _3286 * 6.283185482025146484375;
    float _3294 = sin(_3292);
    float _3296 = _2910 * _3284;
    float _3298 = fma(_3198, _3296, _3262);
    float _3300 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[32].x;
    float _3302 = fma(_3194, _3296, _3270);
    float _3304 = fma(_3188, _3296, _3274);
    float _3306 = _3294 * _3288;
    float _3308 = _3306 * 4.0;
    float _3310 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[32].z;
    float _3312 = fma(_3308, (*spvDescriptorSet0.vp_c10)._m0[8].y, _3300);
    float _3314 = fma(_3308, (*spvDescriptorSet0.vp_c10)._m0[10].y, _3310);
    float _3316 = fma(_3312, _2782, _3302);
    float _3318 = fma(_3314, _2782, _3298);
    float _3320 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3322 = _3316 + _3320;
    float _3324 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3326 = _3318 + _3324;
    float _3328 = _3326 * _3326;
    float _3330 = fma(_3322, _3322, _3328);
    float _3332 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[32].y;
    float _3334 = sqrt(_3330);
    float _3336 = fma(_3308, (*spvDescriptorSet0.vp_c10)._m0[9].y, _3332);
    float _3338 = fma(_3336, _2782, _3304);
    bool _3340 = _3334 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3342 = _3290;
    float _3344 = _3336;
    float _3346 = _3316;
    if (!_3340)
    {
        _3342 = _3318;
    }
    float _3348 = _3342;
    float _3350 = _3348;
    if (!_3340)
    {
        _3344 = _3338;
    }
    float _3352 = _3344;
    bool _3354 = !_3340;
    float _3356 = _3352;
    if (!_3354)
    {
        float _3358 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3360 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3362 = _3334 + _3360;
        float _3364 = _3338 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3366 = rsqrt(_3330);
        float _3368 = _3362 * _3358;
        float _3370 = _3368 * 0.15915493667125701904296875;
        float _3372 = _3370 * 6.283185482025146484375;
        float _3374 = cos(_3372);
        float _3376 = _3370 * 6.283185482025146484375;
        float _3378 = sin(_3376);
        float _3380 = _3374 + (-1.0);
        float _3382 = _3380 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3384 = fma(_3378, _3364, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3386 = fma(_3338, _3374, _3382);
        float _3388 = _3366 * _3384;
        float _3390 = fma(_3322, _3388, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3392 = fma(_3326, _3388, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3356 = _3386;
        _3346 = _3390;
        _3350 = _3392;
    }
    float _3394 = _3356;
    float _3396 = _3346;
    float _3398 = _3350;
    float _3400 = -_2946;
    float _3402 = fma(_3400, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3394);
    float _3404 = -_2948;
    float _3406 = fma(_3404, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3396);
    float _3408 = -_2954;
    float _3410 = fma(_3408, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3398);
    float _3412 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3414 = _3402 + _3412;
    float _3416 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3418 = _3406 + _3416;
    float _3420 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3422 = _3410 + _3420;
    float _3424 = _3414 * _3414;
    float _3426 = fma(_3418, _3418, _3424);
    float _3428 = fma(_3422, _3422, _3426);
    float _3430 = rsqrt(_3428);
    float _3432 = sqrt(_3428);
    float _3434 = _3430 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3436 = _3418 * _3434;
    float _3438 = _3422 * _3434;
    float _3440 = _3436 * _3436;
    float _3442 = _3438 * _3438;
    float _3444 = _3440 + _3442;
    float _3446 = sqrt(_3444);
    bool _3448 = _3446 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3450 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3452 = _3446 + _3450;
    float _3454 = _2296;
    float _3456 = _3444;
    float _3458 = _3452;
    float _3460 = _3414;
    float _3462 = _3434;
    float _3464 = _3436;
    if (_3448)
    {
        float _3466 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3454 = _3466;
    }
    float _3468 = _3454;
    if (_3448)
    {
        float _3470 = rsqrt(_3444);
        _3456 = _3470;
    }
    float _3472 = _3456;
    float _3474 = _3468;
    float _3476 = _3472;
    if (_3448)
    {
        float _3478 = _3452 * _3468;
        _3458 = _3478;
    }
    float _3480 = _3458;
    if (_3448)
    {
        float _3482 = _3480 * 0.15915493667125701904296875;
        _3474 = _3482;
    }
    float _3484 = _3474;
    float _3486 = _3422;
    float _3488 = _3484;
    if (_3448)
    {
        float _3490 = _3484 * 6.283185482025146484375;
        float _3492 = sin(_3490);
        _3486 = _3492;
    }
    float _3494 = _3486;
    float _3496 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3498 = precise::max(0.0, _3496);
    float _3500 = _2948;
    float _3502 = _3498;
    if (_3448)
    {
        float _3504 = _3484 * 6.283185482025146484375;
        float _3506 = cos(_3504);
        _3500 = _3506;
    }
    float _3508 = _3500;
    float _3510 = -_3434;
    float _3512 = -_3498;
    float _3514 = fma(_3414, _3510, _3512);
    if (_3448)
    {
        float _3516 = _3514 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3460 = _3516;
    }
    float _3518 = _3460;
    float _3520 = _3494;
    float _3522 = _3518;
    if (_3448)
    {
        float _3524 = fma(_3494, _3518, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3520 = _3524;
    }
    float _3526 = _3520;
    float _3528 = _3526;
    if (!_3448)
    {
        _3522 = _3438;
    }
    float _3530 = _3522;
    float _3532 = _3530;
    if (_3448)
    {
        float _3534 = _3508 + (-1.0);
        _3502 = _3534;
    }
    float _3536 = _3502;
    float _3538 = _3536;
    if (_3448)
    {
        float _3540 = _3472 * _3526;
        _3462 = _3540;
    }
    float _3542 = _3462;
    if (!_3448)
    {
        _3528 = _3514;
    }
    float _3544 = _3528;
    float _3546 = _3544;
    if (_3448)
    {
        float _3548 = _3536 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3488 = _3548;
    }
    float _3550 = _3488;
    if (_3448)
    {
        float _3552 = _3436 * _3542;
        _3464 = _3552;
    }
    float _3554 = _3464;
    if (!_3448)
    {
        _3476 = _3440;
    }
    float _3556 = _3476;
    float _3558 = _3556;
    if (_3448)
    {
        float _3560 = _3438 * _3542;
        _3532 = _3560;
    }
    float _3562 = _3532;
    if (_3448)
    {
        float _3564 = fma(_3514, _3508, _3550);
        _3546 = _3564;
    }
    float _3566 = _3546;
    if (_3448)
    {
        float _3568 = _3554 * _3554;
        _3558 = _3568;
    }
    float _3570 = _3558;
    float _3572 = _3402 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_3448)
    {
        _3538 = _3442;
    }
    float _3574 = _3538;
    float _3576 = _3574;
    if (_3448)
    {
        float _3578 = _3562 * _3562;
        _3576 = _3578;
    }
    float _3580 = _3576;
    float _3582 = fma(_3566, _3566, _3570);
    float _3584 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3586 = fma(_3432, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3584);
    float _3588 = precise::clamp(_3586, 0.0, 1.0);
    float _3590 = _3402 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3592 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3572);
    float _3594 = _3582 + _3580;
    float _3596 = _3402 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3598 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3590);
    float _3600 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3592);
    float _3602 = _3402 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3604 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3596);
    float _3606 = rsqrt(_3594);
    float _3608 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3598);
    float _3610 = _3600 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3612 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3604);
    float _3614 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3602);
    float _3616 = _3608 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3618 = -_3588;
    float _3620 = _3618 + 1.0;
    float _3622 = _3612 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3624 = _3610 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3626 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3614);
    float _3628 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3630 = _3616 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3632 = fma(_3622, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3624);
    float _3634 = _3626 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3636 = abs(_3620);
    float _3638 = log2(_3636);
    float _3640 = -_3630;
    float _3642 = fma(_3640, _3628, 1.0);
    float _3644 = fma(_3616, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3632);
    float _3646 = _3606 * _3554;
    float _3648 = _3606 * _3566;
    float _3650 = _3606 * _3562;
    float _3652 = fma(_3634, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3644);
    float _3654 = _3646 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3656 = log2(_3642);
    float _3658 = _3648 + 1.0;
    float _3660 = -_3654;
    float _3662 = fma(_3648, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3660);
    float _3664 = _3610 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3666 = -_3650;
    float _3668 = fma(_3666, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3662);
    float _3670 = _3638 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3672 = _3610 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3674 = 1.0 / _3652;
    float _3676 = fma(_3668, -0.5, 0.5);
    float _3678 = fma(_3668, 0.5, 0.5);
    float _3680 = fma(_3622, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3672);
    float _3682 = fma(_3622, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3664);
    float _3684 = fma(_3678, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3686 = fma(_3616, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3680);
    float _3688 = exp2(_3670);
    float _3690 = _3656 * 0.693147182464599609375;
    float _3692 = fma(_3678, _3684, -0.212114393711090087890625);
    float _3694 = fma(_3634, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3686);
    float _3696 = _3690 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3698 = fma(_3678, _3692, 1.570728778839111328125);
    float _3700 = sqrt(_3676);
    float _3702 = fma(_3616, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3682);
    float _3704 = fma(_3634, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3702);
    float _3706 = _3694 * _3674;
    float _3708 = -_3648;
    float _3710 = fma(_3688, _3658, _3708);
    float _3712 = _3704 * _3674;
    float _3714 = fma(_3706, 0.5, 0.5);
    float _3716 = fma(_3710, 0.5, 0.5);
    float _3718 = fma(_3712, -0.5, 0.5);
    float _3720 = _3700 * 0.636619746685028076171875;
    float _3722 = -_3698;
    float _3724 = fma(_3720, _3722, 1.0);
    float3 _9852 = float3(_3714, _3718, _3696);
    float _3726 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9852, float3(0.0), isnan(_9852)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9852, float3(0.0), isnan(_9852)), level(0.0)).x;
    float3 _9863 = float3(_3714, _3718, _3696);
    float4 _3729 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9863, float3(0.0), isnan(_9863)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9863, float3(0.0), isnan(_9863)), level(0.0)).xyzw;
    float _3731 = _3729.x;
    float _3733 = _3729.y;
    float _3735 = _3729.z;
    float _3737 = _3729.w;
    float2 _9880 = float2(_3724, _3716);
    float3 _3741 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9880, float2(0.0), isnan(_9880)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9880, float2(0.0), isnan(_9880)), level(0.0)).xyz;
    float _3743 = _3741.x;
    float _3745 = _3741.y;
    float _3747 = _3741.z;
    float _3749 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3751 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3753 = _3638 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3755 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3757 = isnan(0.5);
    bool _3759 = _3755 || _3757;
    bool _3761 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3763 = _3759 || _3761;
    float _3765 = fma(_2958, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3749);
    float _3767 = fma(_2958, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3751);
    float _3769 = _3610 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_53.x = _834;
    out.m_53.y = _840;
    out.m_53.z = _836;
    out.m_53.w = _842;
    float _3771 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3765);
    float _3773 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3767);
    float _3775 = exp2(_3753);
    float _3777 = fma(_3622, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3769);
    float _3779 = _3771 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3781 = _3773 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_55.x = _960;
    out.m_55.y = _962;
    out.m_55.z = _964;
    out.m_55.w = _958;
    float _3783 = fma(_3616, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3777);
    float _3785 = _3781 + _3779;
    float _3787 = 1.0 / _3779;
    float _3789 = fma(_3634, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3783);
    if (_3763)
    {
        _968 = 1.0;
    }
    float _3791 = _968;
    float _3793 = _3785 * _3787;
    float _3795 = _3793 * 0.5;
    float _3797 = _3791;
    if (!_3763)
    {
        float _3799 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3801 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3803 = _3799 * 0.15915493667125701904296875;
        float _3805 = _3801 * 0.15915493667125701904296875;
        float _3807 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3809 = fma(_3795, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3807);
        float _3811 = _3803 * 6.283185482025146484375;
        float _3813 = cos(_3811);
        float _3815 = _3803 * 6.283185482025146484375;
        float _3817 = sin(_3815);
        float _3819 = 1.0 / _3813;
        float _3821 = _3805 * 6.283185482025146484375;
        float _3823 = cos(_3821);
        float _3825 = _3817 * _3819;
        float _3827 = _3805 * 6.283185482025146484375;
        float _3829 = sin(_3827);
        float _3831 = _3823 * _3825;
        float _3833 = 1.0 / _3809;
        float _3835 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3837 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3835;
        float _3839 = 1.0 / _3831;
        float _3841 = 1.0 / _3837;
        float _3843 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3845 = _3833 * _3843;
        float _3847 = _3829 * _3839;
        float _3849 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3851 = fma(_3847, _3845, _3849);
        float _3853 = _3851 * _3841;
        float _3855 = precise::clamp(_3853, 0.0, 1.0);
        _3797 = _3855;
    }
    float _3857 = _3797;
    float _3859 = _3652 * 0.5;
    float _3861 = -_3775;
    float _3863 = _3861 + 1.0;
    float _3865 = _3694 + _3652;
    float _3867 = _3857 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3869 = fma(_3704, -0.5, _3859);
    float _3871 = _3863 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3873 = _3857 > 0.0;
    bool _3875 = isnan(_3857);
    bool _3877 = _3873 || _3875;
    bool _3879 = isnan(0.0);
    bool _3881 = _3877 || _3879;
    float _3883 = _3865 * 0.5;
    float _3885 = _3867 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3887 = _3871 * _3726;
    float _3889 = _3789 + _3652;
    float _3891 = -_3871;
    float _3893 = _3891 + 1.0;
    float _3895 = _3737 * _3887;
    float _3897 = _3747 * _3887;
    float _3899 = _3889 * 0.5;
    float _3901 = fma(_3743, _3895, _3731);
    float _3903 = fma(_3745, _3895, _3733);
    float _3905 = _3737 * _3893;
    float _3907 = fma(_3737, _3897, _3735);
    out.m_79.x = _3406;
    out.m_79.y = _3402;
    out.m_79.z = _3410;
    out.gl_Position.x = _3694;
    out.gl_Position.y = _3704;
    out.gl_Position.z = _3789;
    out.gl_Position.w = _3652;
    out.m_81.x = _3883;
    out.m_81.y = _3869;
    out.m_81.z = _3899;
    out.m_81.w = _3652;
    out.m_45.x = _3885;
    out.m_83.x = _3901;
    out.m_83.y = _3903;
    out.m_83.z = _3907;
    out.m_83.w = _3905;
    if (_3881)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3909 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3909;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

