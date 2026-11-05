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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
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
    float4 m_65 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_71 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_57 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_63 [[attribute(9)]];
    float4 m_59 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1296 = false;
    bool _858 = false;
    bool _678 = false;
    bool _498 = false;
    bool _168 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3591 = as_type<float>(_106);
        out.gl_Position.z = _3591;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    float _128 = _124;
    if (_120)
    {
        float _130 = float(_90);
        _126 = _130;
    }
    float _132 = _126;
    bool _134 = _124 >= _132;
    bool _136 = !_120;
    bool _138 = _134 || _136;
    if (_138)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _100;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3660 = as_type<float>(_144);
        out.gl_Position.z = _3660;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _146 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _148 = !_146;
    float _166;
    if (!_148)
    {
        float _150 = in.m_49.x;
        float _152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _154 = _150 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _156 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _158 = _156 * _152;
        float _160 = floor(_158);
        float _162 = -_160;
        float _164 = _158 + _162;
        _166 = _164;
        _168 = true;
    }
    else
    {
        float _170 = float(_90);
        float _172 = 1.0 / _170;
        float _174 = _124 * _172;
        _166 = _174;
    }
    _168 = false;
    float _176 = _166;
    float _178 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _180 = _176 + _178;
    float _182 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _184 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _182;
    float _186 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _188 = _186 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _192 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _190;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _196 = _194 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _198 = 1.0 / _184;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _200;
    float _204 = 1.0 / _188;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = _176 + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _210;
    bool _214 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _216 = 1.0 / _192;
    float _218 = _208 * _198;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = _176 + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _226 = _176 + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _228;
    float _232 = fma(_212, _218, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _234 = 1.0 / _202;
    float _236 = _180 * _204;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _240 = _176 + _238;
    bool _242 = _176 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _244 = isnan(_176);
    bool _246 = _242 || _244;
    bool _248 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _250 = _246 || _248;
    float _252 = float(_250);
    float _254 = fma(_230, _218, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _256 = 1.0 / _196;
    float _258 = _222 * _216;
    bool _260 = _176 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _262 = isnan(_176);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = -_252;
    float _274 = _272 + 1.0;
    bool _276 = _176 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _278 = isnan(_176);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -_270;
    float _290 = _288 + 1.0;
    float _292 = _240 * _234;
    bool _294 = _176 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _296 = isnan(_176);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = -_286;
    float _308 = _306 + 1.0;
    float _310 = -_304;
    float _312 = _310 + 1.0;
    float _314 = _226 * _256;
    float _316 = _286 * _290;
    float _318 = _304 * _308;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _320;
    bool _324 = _176 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _326 = isnan(_176);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _340 = _252 * _312;
    float _342 = fma(_322, _218, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _344 = _176 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _346 = isnan(_176);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = _334 * _274;
    float _358 = -_334;
    float _360 = _358 + 1.0;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _370 = _354 * _360;
    float _372 = -_354;
    float _374 = _372 + 1.0;
    float _376 = fma(_364, _236, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _378 = fma(_368, _236, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _380 = _342 * _370;
    float _382 = _254 * _370;
    float _384 = _232 * _370;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _386;
    float _390 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].x, _380);
    float _392 = fma(_338, _236, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _394 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].y, _382);
    float _396 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].z, _384);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _402 = fma(_388, _258, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _404 = fma(_376, _356, _390);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _410;
    float _414 = fma(_400, _314, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _420 = fma(_402, _340, _404);
    float _422 = fma(_408, _258, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _424 = fma(_378, _356, _394);
    float _426 = fma(_412, _258, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _432 = fma(_392, _356, _396);
    float _434 = fma(_418, _314, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _436 = fma(_422, _340, _424);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _442;
    float _446 = fma(_430, _314, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _448 = fma(_426, _340, _432);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _450;
    float _454 = fma(_414, _318, _420);
    float _456 = fma(_440, _292, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _458 = fma(_444, _292, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _460 = fma(_434, _318, _436);
    float _462 = fma(_452, _292, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _464 = fma(_446, _318, _448);
    float _466 = fma(_456, _316, _454);
    float _468 = fma(_458, _316, _460);
    float _470 = fma(_462, _316, _464);
    float _472 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[148].x, _466);
    float _474 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[148].y, _468);
    float _476 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[148].z, _470);
    bool _478 = !_214;
    float _496;
    if (!_478)
    {
        float _480 = in.m_49.x;
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _484 = _480 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _488 = _486 * _482;
        float _490 = floor(_488);
        float _492 = -_490;
        float _494 = _488 + _492;
        _496 = _494;
        _498 = true;
    }
    else
    {
        float _500 = float(_90);
        float _502 = 1.0 / _500;
        float _504 = _124 * _502;
        _496 = _504;
    }
    _498 = false;
    float _506 = _496;
    float _508 = in.m_51.x;
    float _510 = in.m_51.y;
    float _512 = in.m_51.z;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _516 = _506 + _514;
    bool _518 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _520 = isnan(_506);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _538 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _540 = isnan(_506);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = 1.0 / _536;
    bool _552 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _554 = 1.0 / _532;
    float _556 = _474 * _510;
    float _558 = -_528;
    float _560 = _558 + 1.0;
    float _562 = _476 * _512;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _564;
    float _568 = _472 * _508;
    float _570 = _516 * _554;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _574 = _506 + _572;
    bool _576 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _578 = isnan(_506);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _584 = _580 || _582;
    float _586 = float(_584);
    float _588 = fma(_566, _570, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _590 = _574 * _550;
    float _592 = _586 * _560;
    float _594 = -_586;
    float _596 = _594 + 1.0;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _602;
    float _606 = _548 * _596;
    float _608 = fma(_600, _570, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _610 = fma(_604, _570, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _612 = -_548;
    float _614 = _612 + 1.0;
    float _616 = _588 * _606;
    float _618 = _608 * _606;
    float _620 = _610 * _606;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _634 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[107].x, _618);
    float _636 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[107].y, _616);
    float _638 = fma(_624, _590, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _640 = fma(_628, _590, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _642 = fma(_632, _590, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _644 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[107].z, _620);
    float _646 = fma(_638, _592, _634);
    float _648 = fma(_640, _592, _636);
    float _650 = fma(_642, _592, _644);
    float _652 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[109].x, _646);
    float _654 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[109].y, _648);
    float _656 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[109].z, _650);
    bool _658 = !_552;
    float _676;
    if (!_658)
    {
        float _660 = in.m_49.x;
        float _662 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _664 = _660 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _666 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _668 = _666 * _662;
        float _670 = floor(_668);
        float _672 = -_670;
        float _674 = _668 + _672;
        _676 = _674;
        _678 = true;
    }
    else
    {
        float _680 = float(_90);
        float _682 = 1.0 / _680;
        float _684 = _124 * _682;
        _676 = _684;
    }
    _678 = false;
    float _686 = _676;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _690 = _686 + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _700 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _702 = isnan(_686);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _716 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _718 = isnan(_686);
    bool _720 = _716 || _718;
    bool _722 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _724 = _720 || _722;
    float _726 = float(_724);
    float _728 = 1.0 / _694;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _730;
    float _734 = -_710;
    float _736 = _734 + 1.0;
    bool _738 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _740 = isnan(_686);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    bool _750 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _752 = 1.0 / _698;
    float _754 = 1.0 / _714;
    float _756 = _732 * _728;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _762 = _726 * _736;
    float _764 = -_726;
    float _766 = _764 + 1.0;
    float _768 = fma(_756, _690, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _770;
    float _774 = _748 * _766;
    float _776 = _760 * _752;
    bool _778 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _780 = isnan(_686);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _792 = _686 + _790;
    float _794 = _768 * _774;
    float _796 = -_748;
    float _798 = _796 + 1.0;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _802 = _686 + _800;
    float _804 = fma(_776, _792, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _806 = _772 * _754;
    float _808 = -_788;
    float _810 = _808 + 1.0;
    float _812 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[115].x, _794);
    float _814 = _652 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _816 = fma(_806, _802, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _818 = _710 * _810;
    float _820 = fma(_804, _762, _812);
    float _822 = _656 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _824 = _814 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _826 = fma(_816, _818, _820);
    float _828 = _654 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _830 = _822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _832 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[118].x, _826);
    float _834 = _828 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _836 = _832 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _824;
    out.m_53.y = _834;
    out.m_53.z = _830;
    out.m_53.w = _836;
    bool _838 = !_750;
    float _856;
    if (!_838)
    {
        float _840 = in.m_49.x;
        float _842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _844 = _840 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _846 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _848 = _846 * _842;
        float _850 = floor(_848);
        float _852 = -_850;
        float _854 = _848 + _852;
        _856 = _854;
        _858 = true;
    }
    else
    {
        float _860 = float(_90);
        float _862 = 1.0 / _860;
        float _864 = _124 * _862;
        _856 = _864;
    }
    _858 = false;
    float _866 = _856;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _870 = _866 + _868;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _872;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _878 = _876 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _880;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _884;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _890 = _888 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _892 = 1.0 / _882;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _898;
    float _902 = 1.0 / _874;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _906 = _866 + _904;
    bool _908 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _910 = isnan(_866);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = 1.0 / _878;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _924 = _866 + _922;
    float _926 = _870 * _892;
    bool _928 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _930 = isnan(_866);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _936 = _932 || _934;
    float _938 = float(_936);
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _940;
    bool _944 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _946 = 1.0 / _890;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _950 = _866 + _948;
    float _952 = _924 * _902;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _956 = _866 + _954;
    float _958 = -_938;
    float _960 = _958 + 1.0;
    float _962 = 1.0 / _896;
    float _964 = _950 * _920;
    bool _966 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _968 = isnan(_866);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _974 = _970 || _972;
    float _976 = float(_974);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _978;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _982;
    float _986 = _976 * _960;
    float _988 = 1.0 / _900;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _992 = _866 + _990;
    float _994 = fma(_984, _952, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _996 = _992 * _946;
    bool _998 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1000 = isnan(_866);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    float _1010 = 1.0 / _886;
    float _1012 = _956 * _962;
    float _1014 = -_976;
    float _1016 = _1014 + 1.0;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1018;
    float _1022 = _1008 * _1016;
    float _1024 = fma(_1020, _952, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1026 = _906 * _988;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1030 = _866 + _1028;
    bool _1032 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1034 = isnan(_866);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    float _1044 = -_1042;
    float _1046 = _1044 + 1.0;
    float _1048 = _1030 * _1010;
    float _1050 = -_1008;
    float _1052 = _1050 + 1.0;
    float _1054 = fma(_980, _952, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1056 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1058 = isnan(_866);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1064 = _1060 || _1062;
    float _1066 = float(_1064);
    float _1068 = _918 * _1046;
    float _1070 = _1042 * _1052;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1074 = _1072 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1082 = _1080 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1084 = -_918;
    float _1086 = _1084 + 1.0;
    float _1088 = fma(_1074, _964, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1090 = fma(_1078, _964, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1092 = fma(_1082, _964, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1094 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1096 = isnan(_866);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1102 = _1098 || _1100;
    float _1104 = float(_1102);
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1106;
    bool _1110 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1112 = isnan(_866);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1118 = _1114 || _1116;
    float _1120 = float(_1118);
    float _1122 = _1066 * _1086;
    float _1124 = -_1066;
    float _1126 = _1124 + 1.0;
    float _1128 = fma(_1108, _926, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1130 = -_1120;
    float _1132 = _1130 + 1.0;
    float _1134 = _1120 * _1126;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1136;
    float _1140 = _1104 * _1132;
    float _1142 = -_1104;
    float _1144 = _1142 + 1.0;
    float _1146 = fma(_1138, _926, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1148 = fma(_942, _926, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1150 = _1054 * _1140;
    float _1152 = _1024 * _1140;
    float _1154 = _994 * _1140;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1158 = _1156 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1162 = _1160 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1166 = _1164 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1168 = fma(_1158, _1012, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1170 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1150);
    float _1172 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1152);
    float _1174 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1154);
    float _1176 = fma(_1162, _1012, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1178 = fma(_1166, _1012, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1180;
    float _1184 = fma(_1088, _1134, _1170);
    float _1186 = fma(_1090, _1134, _1172);
    float _1188 = fma(_1092, _1134, _1174);
    float _1190 = fma(_1182, _1048, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1192;
    float _1196 = fma(_1146, _1122, _1184);
    float _1198 = fma(_1128, _1122, _1186);
    float _1200 = fma(_1148, _1122, _1188);
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1204 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1202;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1210 = fma(_1194, _1048, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1212 = fma(_1168, _1068, _1196);
    float _1214 = fma(_1176, _1068, _1198);
    float _1216 = fma(_1178, _1068, _1200);
    float _1218 = fma(_1204, _1048, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1220 = fma(_1208, _996, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1224 = _1222 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1228 = _1226 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1230 = fma(_1218, _1070, _1216);
    float _1232 = fma(_1210, _1070, _1212);
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1234;
    float _1238 = fma(_1224, _996, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1240 = fma(_1190, _1070, _1214);
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1242;
    float _1246 = fma(_1228, _996, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1248;
    float _1252 = fma(_1220, _1022, _1232);
    float _1254 = fma(_1236, _1026, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1256 = fma(_1244, _1026, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1258 = fma(_1238, _1022, _1240);
    float _1260 = fma(_1250, _1026, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1262 = fma(_1246, _1022, _1230);
    float _1264 = fma(_1254, _986, _1252);
    float _1266 = fma(_1256, _986, _1258);
    float _1268 = fma(_1260, _986, _1262);
    float _1270 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1264);
    float _1272 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1266);
    float _1274 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1268);
    bool _1276 = !_944;
    float _1294;
    if (!_1276)
    {
        float _1278 = in.m_49.x;
        float _1280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1282 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1284 = fma(_1282, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _1286 = _1284 * _1280;
        float _1288 = floor(_1286);
        float _1290 = -_1288;
        float _1292 = _1286 + _1290;
        _1294 = _1292;
        _1296 = true;
    }
    else
    {
        float _1298 = float(_90);
        float _1300 = 1.0 / _1298;
        float _1302 = _124 * _1300;
        _1294 = _1302;
    }
    _1296 = false;
    float _1304 = _1294;
    float _1306 = in.m_49.z;
    float _1308 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1310 = log2(_1308);
    float _1312 = in.m_49.x;
    float _1314 = in.m_49.y;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1318 = in.m_42.x;
    float _1320 = in.m_42.y;
    float _1322 = in.m_42.z;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1328 = _1326 != 0;
    int _1330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1332 = _1330 != 0;
    int _1334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1336 = _1334 != 0;
    float _1338 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1340 = int(_1338);
    float _1342 = _568 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1344 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1346 = _1310 * _124;
    float _1348 = _1306 * 2.0;
    float _1350 = float(_1340);
    float _1352 = _1312 * 2.0;
    float _1354 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1356 = floor(_1348);
    float _1358 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1360 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1362 = -_1316;
    float _1364 = fma(_1354, 2.0, _1362);
    float _1366 = _1314 + _1312;
    float _1368 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1370 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1372 = fma(_1318, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1360);
    float _1374 = floor(_1352);
    float _1376 = _1366 + (-1.0);
    float _1378 = _1314 * 2.0;
    float _1380 = fma(_1358, -2.0, _1324);
    float _1382 = fma(_1318, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1370);
    float _1384 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1386 = !_1332;
    int _1388 = _1386 ? 0 : 1;
    float _1390 = fma(_1318, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1368);
    bool _1392 = _1356 > 0.0;
    float _1394 = floor(_1378);
    bool _1396 = _1356 >= 0.0;
    bool _1398 = isnan(_1356);
    bool _1400 = _1396 || _1398;
    bool _1402 = isnan(0.0);
    bool _1404 = _1400 || _1402;
    float _1406 = _1314 + _1306;
    bool _1408 = !_1328;
    int _1410 = _1408 ? 0 : 1;
    float _1412 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1390);
    bool _1414 = !_1336;
    int _1416 = _1414 ? 0 : 1;
    float _1418 = _1406 + (-1.0);
    bool _1420 = _1374 > 0.0;
    float _1422 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1424 = int(_1422);
    int _1426 = _1404 ? 0 : 1;
    float _1428 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1372);
    int _1430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1432 = _1430 != 0;
    int _1434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1436 = _1434 != 0;
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1440 = _1438 != 0;
    float _1442 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1382);
    bool _1444 = _1374 >= 0.0;
    bool _1446 = isnan(_1374);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan(0.0);
    bool _1452 = _1448 || _1450;
    float _1454 = -_124;
    float _1456 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1364);
    int _1458 = ~_1426;
    int _1460 = _1458 + 1;
    int _1462 = _1460 + 1;
    float _1464 = 1.0 / _1350;
    bool _1466 = !_1432;
    int _1468 = _1466 ? 0 : 1;
    float _1470 = _1412 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1472 = _1462;
    if (!_1392)
    {
        int _1474 = ~_1426;
        int _1476 = _1474 + 1;
        _1472 = _1476;
    }
    int _1478 = _1472;
    int _1480 = abs(_1468);
    float _1482 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1484 = _1394 > 0.0;
    bool _1486 = _1394 >= 0.0;
    bool _1488 = isnan(_1394);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan(0.0);
    bool _1494 = _1490 || _1492;
    float _1496 = exp2(_1346);
    float _1498 = float(_1480);
    float _1500 = float(_1478);
    float _1502 = _1464 * _124;
    float _1504 = _1498 * _1500;
    float _1506 = in.m_55.x;
    float _1508 = in.m_55.y;
    float _1510 = in.m_55.z;
    int _1512 = _1452 ? 0 : 1;
    float _1514 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1516 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1518 = isnan(1.0);
    bool _1520 = _1516 || _1518;
    bool _1522 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1524 = _1520 || _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1528 = 1.0 + _1526;
    bool _1530 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1532 = isnan(0.0);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1538 = _1534 || _1536;
    float _1540 = -_1496;
    float _1542 = _1540 + 1.0;
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1546 = 1.0 / _1528;
    float _1548 = float(_1424);
    float _1550 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1514);
    float _1552 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1544);
    float _1554 = _1538 ? _1542 : 0.0;
    float _1556 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1380);
    float _1558 = _1548 * _124;
    float _1560 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1550);
    float _1562 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1552);
    int _1564 = _1494 ? 0 : 1;
    float _1566 = _1428 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1568 = ~_1512;
    int _1570 = _1568 + 1;
    int _1572 = _1570 + 1;
    float _1574 = _1504 * (-2.0);
    int _1576 = _1572;
    float _1578 = _1566;
    if (!_1420)
    {
        int _1580 = ~_1512;
        int _1582 = _1580 + 1;
        _1576 = _1582;
    }
    int _1584 = _1576;
    float _1586 = -_1566;
    float _1588 = _1586 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _1590 = ~_1564;
    int _1592 = _1590 + 1;
    int _1594 = _1592 + 1;
    int _1596 = _1594;
    if (_1524)
    {
        float _1598 = _1554 * _1546;
        _128 = _1598;
    }
    float _1600 = _128;
    bool _1602 = !_1436;
    int _1604 = _1602 ? 0 : 1;
    float _1606 = fma(_1574, _1506, _1506);
    if (!_1484)
    {
        int _1608 = ~_1564;
        int _1610 = _1608 + 1;
        _1596 = _1610;
    }
    int _1612 = _1596;
    float _1614 = fma(_1384, _1574, _1384);
    int _1616 = abs(_1604);
    float _1618 = _1312 + (-0.5);
    float _1620 = _1442 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1622 = float(_1584);
    float _1624 = -_1470;
    float _1626 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1628 = _1588 * _1588;
    float _1630 = float(_1616);
    float _1632 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1606);
    float _1634 = -_1620;
    float _1636 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1638 = fma(_1626, _1626, _1628);
    bool _1640 = !_1440;
    int _1642 = _1640 ? 0 : 1;
    float _1644 = _1630 * _1622;
    float _1646 = fma(_1614, _1600, _1632);
    float _1648 = fma(_1636, _1636, _1638);
    int _1650 = abs(_1642);
    float _1652 = _1644 * (-2.0);
    float _1654 = _1314 + (-0.5);
    float _1656 = float(_1612);
    float _1658 = _1646 * 0.15915493667125701904296875;
    float _1660 = fma(_1652, _1508, _1508);
    float _1662 = float(_1650);
    float _1664 = fma(_1482, _1652, _1482);
    float _1666 = rsqrt(_1648);
    float _1668 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1660);
    float _1670 = _1662 * _1656;
    float _1672 = _1306 + _1312;
    float _1674 = fma(_1664, _1600, _1668);
    float _1676 = in.m_57.x;
    float _1678 = in.m_57.y;
    float _1680 = in.m_57.z;
    float _1682 = _1670 * (-2.0);
    float _1684 = _1672 + (-1.0);
    float _1686 = _1674 * 0.15915493667125701904296875;
    float _1688 = _1658 * 6.283185482025146484375;
    float _1690 = sin(_1688);
    float _1692 = fma(_1682, _1510, _1510);
    float _1694 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1696 = _1306 + (-0.5);
    float _1698 = _1636 * _1666;
    float _1700 = fma(_1694, _1682, _1694);
    float _1702 = fma(_1696, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1692);
    float _1704 = _1588 * _1666;
    float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1708 = _1698 * _1706;
    float _1710 = _1658 * 6.283185482025146484375;
    float _1712 = cos(_1710);
    float _1714 = fma(_1700, _1600, _1702);
    float _1716 = _1626 * _1666;
    float _1718 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1720 = _1704 * _1718;
    float _1722 = _1714 * 0.15915493667125701904296875;
    float _1724 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1726 = _1716 * _1724;
    bool _1728 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1730 = isnan(0.5);
    bool _1732 = _1728 || _1730;
    bool _1734 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1736 = _1732 || _1734;
    float _1738 = _1686 * 6.283185482025146484375;
    float _1740 = sin(_1738);
    bool _1742 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1744 = isnan(0.5);
    bool _1746 = _1742 || _1744;
    bool _1748 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1750 = _1746 || _1748;
    float _1752 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1754 = -_1726;
    float _1756 = fma(_1698, _1752, _1754);
    float _1758 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1676);
    float _1760 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1762 = -_1708;
    float _1764 = fma(_1704, _1760, _1762);
    float _1766 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1678);
    float _1768 = _1756 * _1756;
    float _1770 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1772 = -_1720;
    float _1774 = fma(_1716, _1770, _1772);
    float _1776 = _1686 * 6.283185482025146484375;
    float _1778 = cos(_1776);
    float _1780 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1680);
    float _1782 = fma(_1764, _1764, _1768);
    float _1784 = _562 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1786 = _1342 * _1758;
    float _1788 = fma(_1774, _1774, _1782);
    float _1790 = _1722 * 6.283185482025146484375;
    float _1792 = cos(_1790);
    float _1794 = _1712 * _1740;
    float _1796 = _1690 * _1740;
    float _1798 = _1722 * 6.283185482025146484375;
    float _1800 = sin(_1798);
    float _1802 = _1690 * _1778;
    float _1804 = rsqrt(_1788);
    float _1806 = _1344 * _1766;
    float _1808 = _1740 * _1792;
    float _1810 = _1712 * _1778;
    float _1812 = _1778 * _1792;
    float _1814 = _1784 * _1780;
    float _1816 = _1792 * _1806;
    float _1818 = -_1794;
    float _1820 = fma(_1800, _1802, _1818);
    float _1822 = -_1802;
    float _1824 = fma(_1800, _1794, _1822);
    float _1826 = fma(_1800, _1810, _1796);
    float _1828 = fma(_1800, _1796, _1810);
    float _1830 = _1712 * _1816;
    float _1832 = _1690 * _1816;
    float _1834 = -_1806;
    float _1836 = _1800 * _1834;
    float _1838 = _1764 * _1804;
    float _1840 = fma(_1826, _1786, _1830);
    float _1842 = _1756 * _1804;
    float _1844 = fma(_1812, _1786, _1836);
    float _1846 = _1704 * _1838;
    float _1848 = _1774 * _1804;
    float _1850 = fma(_1824, _1814, _1840);
    float _1852 = _1698 * _1842;
    float _1854 = -_1846;
    float _1856 = fma(_1716, _1842, _1854);
    float _1858 = fma(_1820, _1786, _1832);
    float _1860 = fma(_1808, _1814, _1844);
    float _1862 = -_1852;
    float _1864 = fma(_1704, _1848, _1862);
    float _1866 = _1856 * _1850;
    float _1868 = fma(_1828, _1814, _1858);
    float _1870 = _1566 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1872 = _1864 * _1850;
    float _1874 = fma(_1848, _1860, _1866);
    float _1876 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1870);
    float _1878 = fma(_1838, _1860, _1872);
    float _1880 = fma(_1698, _1868, _1874);
    float _1882 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1876);
    float _1884 = fma(_1716, _1868, _1878);
    float _1886 = _1620 + _1880;
    float _1888 = _1716 * _1848;
    float _1890 = _1882 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1892 = _1470 + _1884;
    float _1894 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1896 = _1886 + _1894;
    float _1898 = _1566 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1900 = 1.0 / _1890;
    float _1902 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1904 = _1892 + _1902;
    float _1906 = _1896 * _1896;
    float _1908 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1898);
    float _1910 = -_1888;
    float _1912 = fma(_1698, _1838, _1910);
    float _1914 = fma(_1904, _1904, _1906);
    float _1916 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1908);
    float _1918 = _1912 * _1850;
    float _1920 = sqrt(_1914);
    float _1922 = _1916 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1924 = fma(_1842, _1860, _1918);
    float _1926 = _1922 + _1890;
    float _1928 = fma(_1704, _1868, _1924);
    float _1930 = _1926 * _1900;
    float _1932 = _1930 * 0.5;
    float _1934 = _1566 + _1928;
    float _1936 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1938 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1936);
    bool _1940 = _1920 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1942 = 1.0 / _1938;
    float _1944 = _1848;
    float _1946 = _1850;
    float _1948 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1950 = _1868;
    float _1952 = _1914;
    float _1954 = _1920;
    float _1956 = _1904;
    float _1958 = _1886;
    if (!_1940)
    {
        _1944 = _1892;
    }
    float _1960 = _1944;
    float _1962 = _1960;
    if (!_1940)
    {
        _1946 = _1886;
    }
    float _1964 = _1946;
    float _1966 = _1964;
    if (!_1940)
    {
        _1948 = _1934;
    }
    float _1968 = _1948;
    bool _1970 = !_1940;
    float _1972 = _1968;
    if (!_1970)
    {
        float _1974 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1976 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1978 = _1920 + _1976;
        float _1980 = _1934 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1982 = rsqrt(_1914);
        float _1984 = _1978 * _1974;
        float _1986 = _1984 * 0.15915493667125701904296875;
        float _1988 = _1986 * 6.283185482025146484375;
        float _1990 = cos(_1988);
        float _1992 = _1986 * 6.283185482025146484375;
        float _1994 = sin(_1992);
        float _1996 = _1990 + (-1.0);
        float _1998 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2000 = fma(_1994, _1980, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2002 = fma(_1934, _1990, _1998);
        float _2004 = _1982 * _2000;
        float _2006 = fma(_1904, _2004, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2008 = fma(_1896, _2004, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1962 = _2006;
        _1972 = _2002;
        _1950 = _1986;
        _1966 = _2008;
        _1952 = _1982;
        _1954 = _1978;
    }
    float _2010 = _1962;
    float _2012 = _1972;
    float _2014 = _1950;
    float _2016 = _1966;
    float _2018 = _1952;
    float _2020 = _1954;
    float _2022 = _2020;
    float _2024 = _2016;
    float _2026 = _2014;
    float _2028 = _2012;
    float _2030 = _2016;
    float _2032 = _2018;
    if (_1750)
    {
        _2022 = 1.0;
    }
    float _2034 = _2022;
    float _2036 = _2034;
    if (_1736)
    {
        _1956 = _2010;
    }
    float _2038 = _1956;
    float _2040 = _2038;
    if (!_1736)
    {
        float _2042 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2044 = _1566 + _2042;
        float _2046 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2048 = _1470 + _2046;
        float _2050 = -_1470;
        float _2052 = _2050 + _2010;
        float _2054 = -_1566;
        float _2056 = _2054 + _2012;
        float _2058 = _2044 * _2044;
        float _2060 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2062 = _1620 + _2060;
        float _2064 = fma(_2048, _2048, _2058);
        float _2066 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2068 = fma(_2062, _2062, _2064);
        float _2070 = sqrt(_2068);
        float _2072 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _2074 = _2070 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _2076 = isnan(_2070);
        bool _2078 = _2074 || _2076;
        bool _2080 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _2082 = _2078 || _2080;
        float _2084 = precise::min(_2070, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2086 = _2084 * _2066;
        float _2088 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2090 = _2088 * _2086;
        float _2092 = _2014;
        float _2094 = _2066;
        float _2096 = _2088;
        if (_2082)
        {
            float _2098 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _2092 = _2098;
        }
        float _2100 = _2092;
        if (_2082)
        {
            float _2102 = precise::max(_2070, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _2094 = _2102;
        }
        float _2104 = _2094;
        float _2106 = -_1620;
        float _2108 = _2106 + _2016;
        float _2110 = fma(_2052, _2090, _1470);
        float _2112 = fma(_2056, _2090, _1566);
        float _2114 = _2110;
        float _2116 = _2112;
        _2026 = _2100;
        if (_2082)
        {
            float _2118 = _2104 * _2100;
            _2024 = _2118;
        }
        float _2120 = _2024;
        float _2122 = fma(_2108, _2090, _1620);
        float _2124 = _2120;
        _2032 = _2122;
        if (_2082)
        {
            float _2126 = _2088 * _2120;
            _2096 = _2126;
        }
        float _2128 = _2096;
        if (!_2082)
        {
            _2124 = _2122;
        }
        float _2130 = _2124;
        _2030 = _2130;
        if (_2082)
        {
            float _2132 = fma(_2052, _2128, _1470);
            _2114 = _2132;
        }
        float _2134 = _2114;
        _2040 = _2134;
        if (_2082)
        {
            float _2136 = fma(_2056, _2128, _1566);
            _2116 = _2136;
        }
        float _2138 = _2116;
        _2028 = _2138;
        if (_2082)
        {
            float _2140 = fma(_2108, _2128, _1620);
            _2030 = _2140;
        }
    }
    float _2142 = _2026;
    float _2144 = _2028;
    float _2146 = _2040;
    float _2148 = _2030;
    float _2150 = _2032;
    float _2152 = _2142;
    float _2154 = _2150;
    if (_1750)
    {
        _1578 = 1.0;
    }
    float _2156 = _1578;
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2160 = _1942 * _2158;
    float _2162 = _2156;
    if (!_1750)
    {
        float _2164 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2166 = _2164 * 0.15915493667125701904296875;
        float _2168 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2170 = _2166 * 6.283185482025146484375;
        float _2172 = cos(_2170);
        float _2174 = _2168 * 0.15915493667125701904296875;
        float _2176 = _2166 * 6.283185482025146484375;
        float _2178 = sin(_2176);
        float _2180 = 1.0 / _2172;
        float _2182 = _2174 * 6.283185482025146484375;
        float _2184 = cos(_2182);
        float _2186 = _2178 * _2180;
        float _2188 = _2174 * 6.283185482025146484375;
        float _2190 = sin(_2188);
        float _2192 = _2184 * _2186;
        float _2194 = 1.0 / _2192;
        float _2196 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2198 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2196;
        float _2200 = 1.0 / _2198;
        float _2202 = _2190 * _2194;
        float _2204 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2206 = fma(_2160, _2202, _2204);
        float _2208 = _2206 * _2200;
        float _2210 = precise::clamp(_2208, 0.0, 1.0);
        _2152 = _2206;
        _2154 = _2174;
        _2036 = _2210;
    }
    float _2212 = _2152;
    float _2214 = _2154;
    float _2216 = _2036;
    float _2218 = _2212;
    float _2220 = _2214;
    if (!_1750)
    {
        float _2222 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2224 = _2222 * 0.15915493667125701904296875;
        float _2226 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2228 = _2224 * 6.283185482025146484375;
        float _2230 = cos(_2228);
        float _2232 = _2226 * 0.15915493667125701904296875;
        float _2234 = _2224 * 6.283185482025146484375;
        float _2236 = sin(_2234);
        float _2238 = 1.0 / _2230;
        float _2240 = _2232 * 6.283185482025146484375;
        float _2242 = cos(_2240);
        float _2244 = _2236 * _2238;
        float _2246 = _2232 * 6.283185482025146484375;
        float _2248 = sin(_2246);
        float _2250 = _2242 * _2244;
        float _2252 = 1.0 / _2250;
        float _2254 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2256 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2254;
        float _2258 = 1.0 / _2256;
        float _2260 = _2248 * _2252;
        float _2262 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2264 = fma(_2160, _2260, _2262);
        float _2266 = _2264 * _2258;
        float _2268 = precise::clamp(_2266, 0.0, 1.0);
        float _2270 = -_2268;
        float _2272 = _2270 + 1.0;
        _2218 = _2238;
        _2220 = _2252;
        _2162 = _2272;
    }
    float _2274 = _2218;
    float _2276 = _2220;
    float _2278 = _2162;
    float _2280 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2282 = _2144 + _2280;
    float _2284 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2286 = _2146 + _2284;
    float _2288 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2290 = _2148 + _2288;
    float _2292 = _2282 * _2282;
    float _2294 = fma(_2286, _2286, _2292);
    float _2296 = fma(_2290, _2290, _2294);
    float _2298 = rsqrt(_2296);
    float _2300 = sqrt(_2296);
    float _2302 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2304 = _2286 * _2302;
    float _2306 = _2290 * _2302;
    float _2308 = _2304 * _2304;
    float _2310 = _2306 * _2306;
    float _2312 = _2308 + _2310;
    float _2314 = sqrt(_2312);
    bool _2316 = _2314 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2320 = _2314 + _2318;
    float _2322 = _2290;
    float _2324 = _2292;
    float _2326 = _2320;
    float _2328 = _2274;
    float _2330 = _2302;
    if (_2316)
    {
        float _2332 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2322 = _2332;
    }
    float _2334 = _2322;
    if (_2316)
    {
        float _2336 = rsqrt(_2312);
        _2324 = _2336;
    }
    float _2338 = _2324;
    float _2340 = _2338;
    if (_2316)
    {
        float _2342 = _2320 * _2334;
        _2326 = _2342;
    }
    float _2344 = _2326;
    if (_2316)
    {
        float _2346 = _2344 * 0.15915493667125701904296875;
        _2328 = _2346;
    }
    float _2348 = _2328;
    float _2350 = _2298;
    float _2352 = _2348;
    if (_2316)
    {
        float _2354 = _2348 * 6.283185482025146484375;
        float _2356 = sin(_2354);
        _2350 = _2356;
    }
    float _2358 = _2350;
    float _2360 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2362 = precise::max(0.0, _2360);
    float _2364 = _2276;
    float _2366 = _2362;
    float _2368 = _2360;
    if (_2316)
    {
        float _2370 = _2348 * 6.283185482025146484375;
        float _2372 = cos(_2370);
        _2364 = _2372;
    }
    float _2374 = _2364;
    float _2376 = -_2302;
    float _2378 = -_2362;
    float _2380 = fma(_2282, _2376, _2378);
    if (_2316)
    {
        float _2382 = _2380 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2366 = _2382;
    }
    float _2384 = _2366;
    float _2386 = _2384;
    if (!_2316)
    {
        _2352 = _2308;
    }
    float _2388 = _2352;
    float _2390 = _2358;
    float _2392 = _2388;
    if (_2316)
    {
        float _2394 = fma(_2358, _2384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2390 = _2394;
    }
    float _2396 = _2390;
    float _2398 = _2396;
    if (!_2316)
    {
        _2386 = _2306;
    }
    float _2400 = _2386;
    float _2402 = _2400;
    if (_2316)
    {
        float _2404 = _2374 + (-1.0);
        _2368 = _2404;
    }
    float _2406 = _2368;
    float _2408 = _2406;
    if (_2316)
    {
        float _2410 = _2338 * _2396;
        _1958 = _2410;
    }
    float _2412 = _1958;
    if (!_2316)
    {
        _2340 = _2304;
    }
    float _2414 = _2340;
    float _2416 = _2414;
    if (_2316)
    {
        float _2418 = _2406 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2330 = _2418;
    }
    float _2420 = _2330;
    if (_2316)
    {
        float _2422 = _2304 * _2412;
        _2416 = _2422;
    }
    float _2424 = _2416;
    if (!_2316)
    {
        _2398 = _2380;
    }
    float _2426 = _2398;
    float _2428 = _2426;
    if (_2316)
    {
        float _2430 = _2306 * _2412;
        _2402 = _2430;
    }
    float _2432 = _2402;
    if (_2316)
    {
        float _2434 = fma(_2380, _2374, _2420);
        _2428 = _2434;
    }
    float _2436 = _2428;
    if (_2316)
    {
        float _2438 = _2424 * _2424;
        _2392 = _2438;
    }
    float _2440 = _2392;
    if (!_2316)
    {
        _2408 = _2310;
    }
    float _2442 = _2408;
    float _2444 = _2442;
    if (_2316)
    {
        float _2446 = _2432 * _2432;
        _2444 = _2446;
    }
    float _2448 = _2444;
    float _2450 = fma(_2436, _2436, _2440);
    float _2452 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2454 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2456 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2458 = _2450 + _2448;
    float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2462 = fma(_2300, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2460);
    float _2464 = precise::clamp(_2462, 0.0, 1.0);
    float _2466 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2468 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2470 = rsqrt(_2458);
    float _2472 = -_2464;
    float _2474 = _2472 + 1.0;
    float _2476 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2466);
    float _2478 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2454);
    float _2480 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2456);
    float _2482 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2468);
    float _2484 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2476);
    float _2486 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2478);
    float _2488 = abs(_2474);
    float _2490 = log2(_2488);
    float _2492 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2480);
    float _2494 = _2484 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2496 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2482);
    float _2498 = _2486 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2500 = _2492 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2502 = _2494 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2504 = _2470 * _2424;
    float _2506 = _2470 * _2436;
    float _2508 = _2470 * _2432;
    float _2510 = fma(_2498, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2502);
    float _2512 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2514 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2516 = _2496 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2518 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2510);
    float _2520 = -_2512;
    float _2522 = fma(_2506, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2520);
    float _2524 = -_2514;
    float _2526 = fma(_2524, _2452, 1.0);
    float _2528 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2530 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2518);
    float _2532 = -_2508;
    float _2534 = fma(_2532, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2522);
    float _2536 = _2494 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2538 = exp2(_2528);
    float _2540 = _2494 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2542 = fma(_2534, -0.5, 0.5);
    float _2544 = fma(_2534, 0.5, 0.5);
    float _2546 = fma(_2498, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2536);
    float _2548 = fma(_2498, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2540);
    float _2550 = _2506 + 1.0;
    float _2552 = fma(_2544, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2554 = log2(_2526);
    float _2556 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2546);
    float _2558 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2548);
    float _2560 = fma(_2544, _2552, -0.212114393711090087890625);
    float _2562 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2556);
    float _2564 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2558);
    float _2566 = fma(_2544, _2560, 1.570728778839111328125);
    float _2568 = 1.0 / _2530;
    float _2570 = -_2506;
    float _2572 = fma(_2538, _2550, _2570);
    float _2574 = fma(_2572, 0.5, 0.5);
    float _2576 = sqrt(_2542);
    float _2578 = _2554 * 0.693147182464599609375;
    float _2580 = _2578 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2582 = _2562 * _2568;
    float _2584 = _2564 * _2568;
    float _2586 = fma(_2582, 0.5, 0.5);
    float _2588 = fma(_2584, -0.5, 0.5);
    float _2590 = _2576 * 0.636619746685028076171875;
    float _2592 = -_2566;
    float _2594 = fma(_2590, _2592, 1.0);
    float3 _7527 = float3(_2586, _2588, _2580);
    float _2596 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7527, float3(0.0), isnan(_7527)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7527, float3(0.0), isnan(_7527)), level(0.0)).x;
    float3 _7538 = float3(_2586, _2588, _2580);
    float4 _2599 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7538, float3(0.0), isnan(_7538)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7538, float3(0.0), isnan(_7538)), level(0.0)).xyzw;
    float _2601 = _2599.x;
    float _2603 = _2599.y;
    float _2605 = _2599.z;
    float _2607 = _2599.w;
    float2 _7555 = float2(_2594, _2574);
    float3 _2611 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7555, float2(0.0), isnan(_7555)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7555, float2(0.0), isnan(_7555)), level(0.0)).xyz;
    float _2613 = _2611.x;
    float _2615 = _2611.y;
    float _2617 = _2611.z;
    float _2619 = float(uint(_1424));
    float _2621 = trunc(_1502);
    int _2623 = int(_2621);
    int _2625 = ~_1424;
    int _2627 = _2625 + 1;
    float _2629 = _2494 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2631 = abs(_1416);
    float _2633 = fma(_2498, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2629);
    float _2635 = 1.0 / _2619;
    float _2637 = float(uint(_2623));
    int _2639 = ~_1424;
    int _2641 = _2639 + 1;
    int _2643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2645 = _2643 != 0;
    int _2647 = as_type<int>(_2635) + (-2);
    float _2649 = as_type<float>(_2647) * _2637;
    bool _2651 = !_2645;
    float _2653 = _2651 ? 7.345489978790283203125 : 1.0;
    float _2655 = trunc(_2649);
    float _2657 = precise::max(_2655, 0.0);
    uint _2660 = uint(_2657);
    float _2662 = _2653 * _1312;
    float _2664 = floor(_2662);
    float _2666 = float(_90);
    float _2668 = float(_2623);
    bool _2670 = _2668 >= _1548;
    bool _2672 = isnan(_2668);
    bool _2674 = _2670 || _2672;
    bool _2676 = isnan(_1548);
    bool _2678 = _2674 || _2676;
    float _2680 = float(_2678);
    int _2682 = _2627 * int(_2660);
    int _2684 = _2682 + _2623;
    float _2686 = 1.0 / _2666;
    float _2688 = float(uint(_2684));
    float _2690 = -_2664;
    float _2692 = _2662 + _2690;
    float _2694 = trunc(_2680);
    int _2696 = int(_2694);
    float _2698 = as_type<float>(_2647) * _2688;
    float _2700 = _2692 * _1548;
    float _2702 = trunc(_2698);
    float _2704 = precise::max(_2702, 0.0);
    uint _2706 = uint(_2704);
    float _2708 = _1558 * _2686;
    int _2710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2712 = _2710 != 0;
    float _2714 = trunc(_2700);
    int _2716 = int(_2714);
    int _2718 = ~_2696;
    int _2720 = _2718 + 1;
    int _2722 = _2720 + 1;
    int _2724 = int(_2660) + int(_2706);
    float _2726 = trunc(_2708);
    int _2728 = int(_2726);
    int _2730 = _2641 * _2724;
    int _2732 = _2730 + _2623;
    bool _2734 = uint(_2732) >= uint(_1424);
    int _2736 = ~_1424;
    int _2738 = _2736 + 1;
    bool _2740 = !_2734;
    int _2742 = _2740 ? 0 : (-1);
    bool _2744 = _1424 == 0;
    int _2746 = ~_2724;
    int _2748 = _2746 + _2742;
    int _2750 = _2748 + 1;
    int _2752 = _1424 + (-1);
    int _2754 = _1424 * _2750;
    int _2756 = _2754 + _2623;
    bool _2758 = !_2712;
    int _2760 = _2758 ? 0 : 1;
    int _2762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2764 = _2762 != 0;
    bool _2766 = !_2744;
    int _2768 = _2766 ? _2756 : (-1);
    int _2770 = abs(_2760);
    int _2772 = abs(_1388);
    int _2774 = _2768 * _2722;
    int _2776 = abs(_1410);
    int _2778 = ~_1424;
    int _2780 = _2778 + 1;
    int _2782 = _2696 * _2752;
    int _2784 = _2782 + _2774;
    bool _2786 = !_2764;
    int _2788 = _2786 ? 0 : 1;
    int _2790 = _2784 * _2772;
    int _2792 = ~_1424;
    int _2794 = _2792 + 1;
    int _2796 = _2716 * _2770;
    int _2798 = _2796 + _2623;
    int _2800 = abs(_2788);
    int _2802 = _2728 * _2776;
    int _2804 = _2802 + _2790;
    int _2806 = _2798 * _2631;
    int _2808 = _2806 + _2804;
    int _2810 = _2716 * _2800;
    int _2812 = _2810 + _2808;
    float _2814 = float(uint(_2812));
    float _2816 = as_type<float>(_2647) * _2814;
    float _2818 = trunc(_2816);
    float _2820 = precise::max(_2818, 0.0);
    uint _2822 = uint(_2820);
    int _2824 = _2794 * int(_2822);
    int _2826 = _2824 + _2812;
    float _2828 = float(uint(_2826));
    float _2830 = as_type<float>(_2647) * _2828;
    float _2832 = trunc(_2830);
    float _2834 = precise::max(_2832, 0.0);
    uint _2836 = uint(_2834);
    int _2838 = int(_2822) + int(_2836);
    int _2840 = ~_1424;
    int _2842 = _2840 + 1;
    int _2844 = _2780 * _2838;
    int _2846 = _2844 + _2812;
    bool _2848 = uint(_2846) >= uint(_1424);
    float _2850 = float(uint(_2798));
    bool _2852 = !_2848;
    int _2854 = _2852 ? 0 : (-1);
    float _2856 = as_type<float>(_2647) * _2850;
    int _2858 = ~_2838;
    int _2860 = _2858 + _2854;
    int _2862 = _2860 + 1;
    float _2864 = trunc(_2856);
    float _2866 = precise::max(_2864, 0.0);
    uint _2868 = uint(_2866);
    int _2870 = _1424 * _2862;
    int _2872 = _2870 + _2812;
    bool _2874 = !_2744;
    int _2876 = _2874 ? _2872 : (-1);
    int _2878 = _2876 >> 31;
    int _2880 = _2876 & 3;
    bool _2882 = _2880 != 0;
    int _2884 = _2878 & 3;
    int _2886 = _2842 * int(_2868);
    int _2888 = _2886 + _2798;
    int _2890 = _2876 + _2884;
    float _2892 = float(uint(_2888));
    int _2894 = _2890 >> 2;
    float _2896 = as_type<float>(_2647) * _2892;
    int _2898 = _2894 << 4;
    int _2900 = _2898 + 368;
    int _2902 = _2876 & 3;
    bool _2904 = _2902 != 0;
    uint _2906 = uint(int(uint(_2900) >> uint(2)));
    uint _2908 = uint(int(uint(int(_2906)) >> uint(2)));
    int _2910 = int(_2906) & 3;
    float _2912 = (*spvDescriptorSet0.vp_c9)._m0[int(_2908)][_2910];
    int _2914 = int(_2906) + 1;
    uint _2916 = uint(int(uint(_2914) >> uint(2)));
    int _2918 = _2914 & 3;
    float _2920 = (*spvDescriptorSet0.vp_c9)._m0[int(_2916)][_2918];
    float _2922 = trunc(_2896);
    float _2924 = precise::max(_2922, 0.0);
    uint _2926 = uint(_2924);
    bool _2928 = uint(_2902) > 1u;
    int _2930 = _2882 ? 0 : 1;
    int _2932 = _2900 + 8;
    uint _2934 = uint(int(uint(_2932) >> uint(2)));
    uint _2936 = uint(int(uint(int(_2934)) >> uint(2)));
    int _2938 = int(_2934) & 3;
    float _2940 = (*spvDescriptorSet0.vp_c9)._m0[int(_2936)][_2938];
    int _2942 = int(_2934) + 1;
    uint _2944 = uint(int(uint(_2942) >> uint(2)));
    int _2946 = _2942 & 3;
    float _2948 = (*spvDescriptorSet0.vp_c9)._m0[int(_2944)][_2946];
    int _2950 = ~_2930;
    int _2952 = _2950 + 1;
    int _2954 = _2952 + 1;
    int _2956 = _2954;
    if (!_2928)
    {
        int _2958 = ~_2930;
        int _2960 = _2958 + 1;
        _2956 = _2960;
    }
    int _2962 = _2956;
    bool _2964 = !_2904;
    int _2966 = _2964 ? 0 : 1;
    int _2968 = int(_2868) + int(_2926);
    bool _2970 = _2902 != 3;
    int _2972 = abs(_2962);
    int _2974 = _2738 * _2968;
    int _2976 = _2974 + _2798;
    int _2978 = abs(_2966);
    float _2980 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2982 = int(_2980);
    bool _2984 = uint(_2902) >= 2u;
    int _2986 = ~_2972;
    int _2988 = _2986 + 1;
    int _2990 = _2988 + 1;
    int _2992 = _2984 ? 0 : 1;
    bool _2994 = uint(_2976) >= uint(_1424);
    int _2996 = ~_2992;
    int _2998 = _2996 + 1;
    int _3000 = _2998 + 1;
    int _3002 = _3000;
    if (_2970)
    {
        int _3004 = ~_2992;
        int _3006 = _3004 + 1;
        _3002 = _3006;
    }
    int _3008 = _3002;
    int _3010 = ~_2978;
    int _3012 = _3010 + 1;
    int _3014 = _3012 + 1;
    int _3016 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3018 = _3016 != 0;
    bool _3020 = _2902 != 3;
    bool _3022 = !_2994;
    int _3024 = _3022 ? 0 : (-1);
    int _3026 = _2990 * as_type<int>(_2920);
    bool _3028 = !_3018;
    int _3030 = _3028 ? 0 : 1;
    int _3032 = abs(_2982);
    int _3034 = _3014 * as_type<int>(_2912);
    int _3036 = _3034 + _3026;
    bool _3038 = !_3020;
    int _3040 = _3038 ? 0 : (-1);
    int _3042 = abs(_3008);
    int _3044 = ~_2968;
    int _3046 = _3044 + _3024;
    int _3048 = _3046 + 1;
    float _3050 = in.m_59.z;
    int _3052 = abs(_3030);
    int _3054 = _1424 * _3048;
    int _3056 = _3054 + _2798;
    int _3058 = abs(_3040);
    float _3060 = in.m_59.w;
    int _3062 = ~_3042;
    int _3064 = _3062 + 1;
    int _3066 = _3064 + 1;
    float _3068 = float(uint(_2982));
    float _3070 = in.m_59.y;
    float _3072 = float(uint(_3032));
    int _3074 = _3066 * as_type<int>(_2940);
    int _3076 = _3074 + _3036;
    int _3078 = ~_3058;
    int _3080 = _3078 + 1;
    int _3082 = _3080 + 1;
    int _3084 = ~_3052;
    int _3086 = _3084 + 1;
    int _3088 = _3086 + 1;
    float _3090 = 1.0 / _3068;
    bool _3092 = !_2744;
    int _3094 = _3092 ? _3056 : (-1);
    int _3096 = _3082 * as_type<int>(_2948);
    int _3098 = _3096 + _3076;
    int _3100 = ~_3032;
    int _3102 = _3100 + 1;
    int _3104 = _3098 * _3088;
    int _3106 = ~_2982;
    int _3108 = _3106 + 1;
    float _3110 = 1.0 / _3072;
    int _3112 = _3094 * _3052;
    int _3114 = _3112 + _3104;
    int _3116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _3118 = _3116 != 0;
    float _3120 = in.m_59.x;
    int _3122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3124 = _3122 != 0;
    int _3126 = abs(_3114);
    out.m_61.w = _3060;
    int _3128 = as_type<int>(_3090) + (-2);
    float _3130 = float(uint(_3114));
    out.m_61.z = _3050;
    bool _3132 = _1314 > 0.5;
    float _3134 = as_type<float>(_3128) * _3130;
    int _3136 = as_type<int>(_3110) + (-2);
    out.m_61.y = _3070;
    float _3138 = float(uint(_3126));
    float _3140 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3142 = _3140 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _3144 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _3146 = _3144 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3148 = trunc(_3134);
    float _3150 = precise::max(_3148, 0.0);
    uint _3152 = uint(_3150);
    float _3154 = as_type<float>(_3136) * _3138;
    float _3156 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _3158 = _3156 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    out.m_61.x = _3120;
    float _3160 = trunc(_3154);
    float _3162 = precise::max(_3160, 0.0);
    uint _3164 = uint(_3162);
    float _3166 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _3168 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _3166;
    float _3170 = 1.0 / _3158;
    int _3172 = _3108 * int(_3152);
    int _3174 = _3172 + _3114;
    float _3176 = float(uint(_3174));
    int _3178 = _3102 * int(_3164);
    int _3180 = _3178 + _3126;
    float _3182 = 1.0 / _3146;
    float _3184 = as_type<float>(_3128) * _3176;
    float _3186 = float(uint(_3180));
    float _3188 = _3168 * _3170;
    float _3190 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _3192 = _1304 + _3190;
    float _3194 = 1.0 / _3142;
    float _3196 = as_type<float>(_3136) * _3186;
    bool _3198 = _1304 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _3200 = isnan(_1304);
    bool _3202 = _3198 || _3200;
    bool _3204 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _3206 = _3202 || _3204;
    float _3208 = float(_3206);
    float _3210 = fma(_3188, _3192, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _3212 = _1304 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _3214 = isnan(_1304);
    bool _3216 = _3212 || _3214;
    bool _3218 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _3220 = _3216 || _3218;
    float _3222 = float(_3220);
    float _3224 = in.m_63.y;
    bool _3226 = _1304 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3228 = isnan(_1304);
    bool _3230 = _3226 || _3228;
    bool _3232 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3234 = _3230 || _3232;
    float _3236 = float(_3234);
    float _3238 = -_3208;
    float _3240 = _3238 + 1.0;
    float _3242 = trunc(_3184);
    float _3244 = precise::max(_3242, 0.0);
    uint _3246 = uint(_3244);
    float _3248 = -_3222;
    float _3250 = _3248 + 1.0;
    float _3252 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _3254 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _3252;
    float _3256 = _3236 * _3240;
    float _3258 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _3260 = _3258 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _3262 = _3208 * _3250;
    bool _3264 = _1304 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _3266 = isnan(_1304);
    bool _3268 = _3264 || _3266;
    bool _3270 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _3272 = _3268 || _3270;
    float _3274 = float(_3272);
    float _3276 = _3210 * _3256;
    float _3278 = trunc(_3196);
    float _3280 = precise::max(_3278, 0.0);
    uint _3282 = uint(_3280);
    float _3284 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _3286 = _1304 + _3284;
    float _3288 = _3254 * _3194;
    float _3290 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3292 = _1304 + _3290;
    float _3294 = -_3274;
    float _3296 = _3294 + 1.0;
    float _3298 = (*spvDescriptorSet0.vp_c9)._m0[132].x;
    if (_3118)
    {
        float _3300 = in.m_49.x;
        _3298 = _3300;
    }
    float _3302 = _3298;
    float _3304 = _3260 * _3182;
    float _3306 = -_3236;
    float _3308 = _3306 + 1.0;
    float _3310 = fma(_3288, _3292, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _3312 = ~_2982;
    int _3314 = _3312 + 1;
    float _3316 = _3222 * _3296;
    float _3318 = fma(_3304, _3286, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _3320 = int(_3152) + int(_3246);
    float _3322 = fma(_3308, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3276);
    int _3324 = ~_3032;
    int _3326 = _3324 + 1;
    float _3328 = -_3224;
    float _3330 = _3328 + 1.0;
    int _3332 = int(_3164) + int(_3282);
    float _3334 = fma(_3318, _3262, _3322);
    float _3336 = in.m_63.x;
    int _3338 = _3326 * _3332;
    int _3340 = _3338 + _3126;
    float _3342 = _3224;
    float _3344 = as_type<float>(_3320);
    if (_3124)
    {
        float _3346 = _3132 ? _3330 : _3224;
        _3342 = _3346;
    }
    float _3348 = _3342;
    int _3350 = _3314 * _3320;
    int _3352 = _3350 + _3114;
    float _3354 = fma(_3310, _3316, _3334);
    float _3356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3358 = uint(_3340) >= uint(_3032);
    bool _3360 = uint(_3352) >= uint(_2982);
    float _3362 = fma(_3274, (*spvDescriptorSet0.vp_c9)._m0[134].x, _3354);
    bool _3364 = !_3358;
    int _3366 = _3364 ? 0 : (-1);
    bool _3368 = _3302 > 0.5;
    bool _3370 = _3368 && _3118;
    float _3372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3374 = ~_3366;
    int _3376 = _3332 + _3374;
    int _3378 = _3376 + 1;
    float _3380 = _1270 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3382 = _1272 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3384 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _3386 = !_3360;
    int _3388 = _3386 ? 0 : (-1);
    float _3390 = _3380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3392 = _3114 ^ _2982;
    float _3394 = _3382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3396 = ~_3320;
    int _3398 = _3396 + _3388;
    int _3400 = _3398 + 1;
    float _3402 = _3384 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _3404 = uint(int(uint(_3392) >> uint(31)));
    float _3406 = _3336;
    if (_3118)
    {
        _3344 = _3336;
    }
    float _3408 = _3344;
    int _3410 = _2982 * _3400;
    int _3412 = _3410 + _3114;
    int _3414 = ~int(_3404);
    int _3416 = _3414 + 1;
    float _3418 = _3362 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _3420 = _2982 == 0;
    float _3422 = _3408;
    if (_3370)
    {
        float _3424 = -_3408;
        float _3426 = _3424 + 1.0;
        _3422 = _3426;
    }
    float _3428 = _3422;
    bool _3430 = _2982 == 0;
    int _3432 = _3378 ^ _3416;
    float _3434 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2633);
    bool _3436 = !_3420;
    int _3438 = _3436 ? _3412 : (-1);
    float _3440 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _3442 = ~_3416;
    int _3444 = _3442 + _3432;
    int _3446 = _3444 + 1;
    float _3448 = _3356 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3450 = float(_3438);
    float _3452 = _3372 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3454 = !_3430;
    int _3456 = _3454 ? _3446 : (-1);
    float _3458 = exp2(_3440);
    if (_3118)
    {
        _3406 = _3428;
    }
    float _3460 = _3406;
    out.m_65.x = _3390;
    out.m_65.y = _3394;
    out.m_65.z = _3402;
    out.m_65.w = _3418;
    float _3462 = float(_3456);
    float _3464 = _2216 * _2278;
    bool _3466 = _2216 > 0.0;
    bool _3468 = isnan(_2216);
    bool _3470 = _3466 || _3468;
    bool _3472 = isnan(0.0);
    bool _3474 = _3470 || _3472;
    float _3476 = fma(_3452, _3348, -0.5);
    float _3478 = fma(_3448, _3460, -0.5);
    float _3480 = _3464 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3482 = -_1556;
    float _3484 = fma(_3452, _3462, _3482);
    float _3486 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3434);
    float _3488 = fma(_3448, _3450, _1456);
    bool _3490 = _2278 <= 0.0;
    bool _3492 = !_3474;
    bool _3494 = _3490 || _3492;
    float _3496 = fma(_1562, _3476, _3484);
    float _3498 = _3486 + _2530;
    float _3500 = fma(_1560, _3478, _3488);
    float _3502 = -_3458;
    float _3504 = _3502 + 1.0;
    float _3506 = _3480 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3508 = _3498 * 0.5;
    float _3510 = _3504 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3512 = _3500 + 0.5;
    out.gl_Position.x = _2562;
    out.gl_Position.y = _2564;
    out.gl_Position.z = _3486;
    out.gl_Position.w = _2530;
    float _3514 = _3510 * _2596;
    float _3516 = -_3510;
    float _3518 = _3516 + 1.0;
    float _3520 = _3496 + 0.5;
    out.m_45.x = _3506;
    float _3522 = _2607 * _3514;
    float _3524 = _2617 * _3514;
    float _3526 = _2607 * _3518;
    out.m_67.z = _3508;
    out.m_67.w = _2530;
    float _3528 = fma(_2613, _3522, _2601);
    float _3530 = fma(_2615, _3522, _2603);
    float _3532 = fma(_2607, _3524, _2605);
    out.m_69.x = _3512;
    out.m_69.y = _3520;
    out.m_71.x = _3528;
    out.m_71.y = _3530;
    out.m_71.z = _3532;
    out.m_71.w = _3526;
    if (!_3494)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3534 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3534;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1296 = false;
    bool _858 = false;
    bool _678 = false;
    bool _498 = false;
    bool _168 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3591 = as_type<float>(_106);
        out.gl_Position.z = _3591;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    float _128 = _124;
    if (_120)
    {
        float _130 = float(_90);
        _126 = _130;
    }
    float _132 = _126;
    bool _134 = _124 >= _132;
    bool _136 = !_120;
    bool _138 = _134 || _136;
    if (_138)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _100;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3660 = as_type<float>(_144);
        out.gl_Position.z = _3660;
    }
    if (_138)
    {
        return out;
    }
    bool _146 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _148 = !_146;
    float _166;
    if (!_148)
    {
        float _150 = in.m_49.x;
        float _152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _154 = _150 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _156 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _158 = _156 * _152;
        float _160 = floor(_158);
        float _162 = -_160;
        float _164 = _158 + _162;
        _166 = _164;
        _168 = true;
    }
    else
    {
        float _170 = float(_90);
        float _172 = 1.0 / _170;
        float _174 = _124 * _172;
        _166 = _174;
    }
    _168 = false;
    float _176 = _166;
    float _178 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _180 = _176 + _178;
    float _182 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _184 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _182;
    float _186 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _188 = _186 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _192 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _190;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _196 = _194 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _198 = 1.0 / _184;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _200;
    float _204 = 1.0 / _188;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = _176 + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _210;
    bool _214 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _216 = 1.0 / _192;
    float _218 = _208 * _198;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = _176 + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _226 = _176 + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _228;
    float _232 = fma(_212, _218, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _234 = 1.0 / _202;
    float _236 = _180 * _204;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _240 = _176 + _238;
    bool _242 = _176 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _244 = isnan(_176);
    bool _246 = _242 || _244;
    bool _248 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _250 = _246 || _248;
    float _252 = float(_250);
    float _254 = fma(_230, _218, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _256 = 1.0 / _196;
    float _258 = _222 * _216;
    bool _260 = _176 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _262 = isnan(_176);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = -_252;
    float _274 = _272 + 1.0;
    bool _276 = _176 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _278 = isnan(_176);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -_270;
    float _290 = _288 + 1.0;
    float _292 = _240 * _234;
    bool _294 = _176 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _296 = isnan(_176);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = -_286;
    float _308 = _306 + 1.0;
    float _310 = -_304;
    float _312 = _310 + 1.0;
    float _314 = _226 * _256;
    float _316 = _286 * _290;
    float _318 = _304 * _308;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _320;
    bool _324 = _176 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _326 = isnan(_176);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _340 = _252 * _312;
    float _342 = fma(_322, _218, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _344 = _176 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _346 = isnan(_176);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = _334 * _274;
    float _358 = -_334;
    float _360 = _358 + 1.0;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _370 = _354 * _360;
    float _372 = -_354;
    float _374 = _372 + 1.0;
    float _376 = fma(_364, _236, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _378 = fma(_368, _236, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _380 = _342 * _370;
    float _382 = _254 * _370;
    float _384 = _232 * _370;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _386;
    float _390 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].x, _380);
    float _392 = fma(_338, _236, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _394 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].y, _382);
    float _396 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].z, _384);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _402 = fma(_388, _258, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _404 = fma(_376, _356, _390);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _410;
    float _414 = fma(_400, _314, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _420 = fma(_402, _340, _404);
    float _422 = fma(_408, _258, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _424 = fma(_378, _356, _394);
    float _426 = fma(_412, _258, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _432 = fma(_392, _356, _396);
    float _434 = fma(_418, _314, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _436 = fma(_422, _340, _424);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _442;
    float _446 = fma(_430, _314, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _448 = fma(_426, _340, _432);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _450;
    float _454 = fma(_414, _318, _420);
    float _456 = fma(_440, _292, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _458 = fma(_444, _292, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _460 = fma(_434, _318, _436);
    float _462 = fma(_452, _292, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _464 = fma(_446, _318, _448);
    float _466 = fma(_456, _316, _454);
    float _468 = fma(_458, _316, _460);
    float _470 = fma(_462, _316, _464);
    float _472 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[148].x, _466);
    float _474 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[148].y, _468);
    float _476 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[148].z, _470);
    bool _478 = !_214;
    float _496;
    if (!_478)
    {
        float _480 = in.m_49.x;
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _484 = _480 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _488 = _486 * _482;
        float _490 = floor(_488);
        float _492 = -_490;
        float _494 = _488 + _492;
        _496 = _494;
        _498 = true;
    }
    else
    {
        float _500 = float(_90);
        float _502 = 1.0 / _500;
        float _504 = _124 * _502;
        _496 = _504;
    }
    _498 = false;
    float _506 = _496;
    float _508 = in.m_51.x;
    float _510 = in.m_51.y;
    float _512 = in.m_51.z;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _516 = _506 + _514;
    bool _518 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _520 = isnan(_506);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _538 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _540 = isnan(_506);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = 1.0 / _536;
    bool _552 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _554 = 1.0 / _532;
    float _556 = _474 * _510;
    float _558 = -_528;
    float _560 = _558 + 1.0;
    float _562 = _476 * _512;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _564;
    float _568 = _472 * _508;
    float _570 = _516 * _554;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _574 = _506 + _572;
    bool _576 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _578 = isnan(_506);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _584 = _580 || _582;
    float _586 = float(_584);
    float _588 = fma(_566, _570, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _590 = _574 * _550;
    float _592 = _586 * _560;
    float _594 = -_586;
    float _596 = _594 + 1.0;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _602;
    float _606 = _548 * _596;
    float _608 = fma(_600, _570, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _610 = fma(_604, _570, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _612 = -_548;
    float _614 = _612 + 1.0;
    float _616 = _588 * _606;
    float _618 = _608 * _606;
    float _620 = _610 * _606;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _634 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[107].x, _618);
    float _636 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[107].y, _616);
    float _638 = fma(_624, _590, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _640 = fma(_628, _590, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _642 = fma(_632, _590, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _644 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[107].z, _620);
    float _646 = fma(_638, _592, _634);
    float _648 = fma(_640, _592, _636);
    float _650 = fma(_642, _592, _644);
    float _652 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[109].x, _646);
    float _654 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[109].y, _648);
    float _656 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[109].z, _650);
    bool _658 = !_552;
    float _676;
    if (!_658)
    {
        float _660 = in.m_49.x;
        float _662 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _664 = _660 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _666 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _668 = _666 * _662;
        float _670 = floor(_668);
        float _672 = -_670;
        float _674 = _668 + _672;
        _676 = _674;
        _678 = true;
    }
    else
    {
        float _680 = float(_90);
        float _682 = 1.0 / _680;
        float _684 = _124 * _682;
        _676 = _684;
    }
    _678 = false;
    float _686 = _676;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _690 = _686 + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _700 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _702 = isnan(_686);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _716 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _718 = isnan(_686);
    bool _720 = _716 || _718;
    bool _722 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _724 = _720 || _722;
    float _726 = float(_724);
    float _728 = 1.0 / _694;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _730;
    float _734 = -_710;
    float _736 = _734 + 1.0;
    bool _738 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _740 = isnan(_686);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    bool _750 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _752 = 1.0 / _698;
    float _754 = 1.0 / _714;
    float _756 = _732 * _728;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _762 = _726 * _736;
    float _764 = -_726;
    float _766 = _764 + 1.0;
    float _768 = fma(_756, _690, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _770;
    float _774 = _748 * _766;
    float _776 = _760 * _752;
    bool _778 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _780 = isnan(_686);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _792 = _686 + _790;
    float _794 = _768 * _774;
    float _796 = -_748;
    float _798 = _796 + 1.0;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _802 = _686 + _800;
    float _804 = fma(_776, _792, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _806 = _772 * _754;
    float _808 = -_788;
    float _810 = _808 + 1.0;
    float _812 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[115].x, _794);
    float _814 = _652 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _816 = fma(_806, _802, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _818 = _710 * _810;
    float _820 = fma(_804, _762, _812);
    float _822 = _656 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _824 = _814 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _826 = fma(_816, _818, _820);
    float _828 = _654 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _830 = _822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _832 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[118].x, _826);
    float _834 = _828 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _836 = _832 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _824;
    out.m_53.y = _834;
    out.m_53.z = _830;
    out.m_53.w = _836;
    bool _838 = !_750;
    float _856;
    if (!_838)
    {
        float _840 = in.m_49.x;
        float _842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _844 = _840 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _846 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _848 = _846 * _842;
        float _850 = floor(_848);
        float _852 = -_850;
        float _854 = _848 + _852;
        _856 = _854;
        _858 = true;
    }
    else
    {
        float _860 = float(_90);
        float _862 = 1.0 / _860;
        float _864 = _124 * _862;
        _856 = _864;
    }
    _858 = false;
    float _866 = _856;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _870 = _866 + _868;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _872;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _878 = _876 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _880;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _884;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _890 = _888 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _892 = 1.0 / _882;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _898;
    float _902 = 1.0 / _874;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _906 = _866 + _904;
    bool _908 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _910 = isnan(_866);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = 1.0 / _878;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _924 = _866 + _922;
    float _926 = _870 * _892;
    bool _928 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _930 = isnan(_866);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _936 = _932 || _934;
    float _938 = float(_936);
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _940;
    bool _944 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _946 = 1.0 / _890;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _950 = _866 + _948;
    float _952 = _924 * _902;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _956 = _866 + _954;
    float _958 = -_938;
    float _960 = _958 + 1.0;
    float _962 = 1.0 / _896;
    float _964 = _950 * _920;
    bool _966 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _968 = isnan(_866);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _974 = _970 || _972;
    float _976 = float(_974);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _978;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _982;
    float _986 = _976 * _960;
    float _988 = 1.0 / _900;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _992 = _866 + _990;
    float _994 = fma(_984, _952, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _996 = _992 * _946;
    bool _998 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1000 = isnan(_866);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    float _1010 = 1.0 / _886;
    float _1012 = _956 * _962;
    float _1014 = -_976;
    float _1016 = _1014 + 1.0;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1018;
    float _1022 = _1008 * _1016;
    float _1024 = fma(_1020, _952, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1026 = _906 * _988;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1030 = _866 + _1028;
    bool _1032 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1034 = isnan(_866);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    float _1044 = -_1042;
    float _1046 = _1044 + 1.0;
    float _1048 = _1030 * _1010;
    float _1050 = -_1008;
    float _1052 = _1050 + 1.0;
    float _1054 = fma(_980, _952, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1056 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1058 = isnan(_866);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1064 = _1060 || _1062;
    float _1066 = float(_1064);
    float _1068 = _918 * _1046;
    float _1070 = _1042 * _1052;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1074 = _1072 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1082 = _1080 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1084 = -_918;
    float _1086 = _1084 + 1.0;
    float _1088 = fma(_1074, _964, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1090 = fma(_1078, _964, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1092 = fma(_1082, _964, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1094 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1096 = isnan(_866);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1102 = _1098 || _1100;
    float _1104 = float(_1102);
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1106;
    bool _1110 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1112 = isnan(_866);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1118 = _1114 || _1116;
    float _1120 = float(_1118);
    float _1122 = _1066 * _1086;
    float _1124 = -_1066;
    float _1126 = _1124 + 1.0;
    float _1128 = fma(_1108, _926, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1130 = -_1120;
    float _1132 = _1130 + 1.0;
    float _1134 = _1120 * _1126;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1136;
    float _1140 = _1104 * _1132;
    float _1142 = -_1104;
    float _1144 = _1142 + 1.0;
    float _1146 = fma(_1138, _926, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1148 = fma(_942, _926, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1150 = _1054 * _1140;
    float _1152 = _1024 * _1140;
    float _1154 = _994 * _1140;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1158 = _1156 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1162 = _1160 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1166 = _1164 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1168 = fma(_1158, _1012, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1170 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1150);
    float _1172 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1152);
    float _1174 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1154);
    float _1176 = fma(_1162, _1012, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1178 = fma(_1166, _1012, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1180;
    float _1184 = fma(_1088, _1134, _1170);
    float _1186 = fma(_1090, _1134, _1172);
    float _1188 = fma(_1092, _1134, _1174);
    float _1190 = fma(_1182, _1048, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1192;
    float _1196 = fma(_1146, _1122, _1184);
    float _1198 = fma(_1128, _1122, _1186);
    float _1200 = fma(_1148, _1122, _1188);
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1204 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1202;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1210 = fma(_1194, _1048, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1212 = fma(_1168, _1068, _1196);
    float _1214 = fma(_1176, _1068, _1198);
    float _1216 = fma(_1178, _1068, _1200);
    float _1218 = fma(_1204, _1048, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1220 = fma(_1208, _996, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1224 = _1222 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1228 = _1226 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1230 = fma(_1218, _1070, _1216);
    float _1232 = fma(_1210, _1070, _1212);
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1234;
    float _1238 = fma(_1224, _996, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1240 = fma(_1190, _1070, _1214);
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1242;
    float _1246 = fma(_1228, _996, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1248;
    float _1252 = fma(_1220, _1022, _1232);
    float _1254 = fma(_1236, _1026, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1256 = fma(_1244, _1026, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1258 = fma(_1238, _1022, _1240);
    float _1260 = fma(_1250, _1026, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1262 = fma(_1246, _1022, _1230);
    float _1264 = fma(_1254, _986, _1252);
    float _1266 = fma(_1256, _986, _1258);
    float _1268 = fma(_1260, _986, _1262);
    float _1270 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1264);
    float _1272 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1266);
    float _1274 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1268);
    bool _1276 = !_944;
    float _1294;
    if (!_1276)
    {
        float _1278 = in.m_49.x;
        float _1280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1282 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1284 = fma(_1282, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _1286 = _1284 * _1280;
        float _1288 = floor(_1286);
        float _1290 = -_1288;
        float _1292 = _1286 + _1290;
        _1294 = _1292;
        _1296 = true;
    }
    else
    {
        float _1298 = float(_90);
        float _1300 = 1.0 / _1298;
        float _1302 = _124 * _1300;
        _1294 = _1302;
    }
    _1296 = false;
    float _1304 = _1294;
    float _1306 = in.m_49.z;
    float _1308 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1310 = log2(_1308);
    float _1312 = in.m_49.x;
    float _1314 = in.m_49.y;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1318 = in.m_42.x;
    float _1320 = in.m_42.y;
    float _1322 = in.m_42.z;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1328 = _1326 != 0;
    int _1330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1332 = _1330 != 0;
    int _1334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1336 = _1334 != 0;
    float _1338 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1340 = int(_1338);
    float _1342 = _568 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1344 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1346 = _1310 * _124;
    float _1348 = _1306 * 2.0;
    float _1350 = float(_1340);
    float _1352 = _1312 * 2.0;
    float _1354 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1356 = floor(_1348);
    float _1358 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1360 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1362 = -_1316;
    float _1364 = fma(_1354, 2.0, _1362);
    float _1366 = _1314 + _1312;
    float _1368 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1370 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1372 = fma(_1318, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1360);
    float _1374 = floor(_1352);
    float _1376 = _1366 + (-1.0);
    float _1378 = _1314 * 2.0;
    float _1380 = fma(_1358, -2.0, _1324);
    float _1382 = fma(_1318, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1370);
    float _1384 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1386 = !_1332;
    int _1388 = _1386 ? 0 : 1;
    float _1390 = fma(_1318, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1368);
    bool _1392 = _1356 > 0.0;
    float _1394 = floor(_1378);
    bool _1396 = _1356 >= 0.0;
    bool _1398 = isnan(_1356);
    bool _1400 = _1396 || _1398;
    bool _1402 = isnan(0.0);
    bool _1404 = _1400 || _1402;
    float _1406 = _1314 + _1306;
    bool _1408 = !_1328;
    int _1410 = _1408 ? 0 : 1;
    float _1412 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1390);
    bool _1414 = !_1336;
    int _1416 = _1414 ? 0 : 1;
    float _1418 = _1406 + (-1.0);
    bool _1420 = _1374 > 0.0;
    float _1422 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1424 = int(_1422);
    int _1426 = _1404 ? 0 : 1;
    float _1428 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1372);
    int _1430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1432 = _1430 != 0;
    int _1434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1436 = _1434 != 0;
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1440 = _1438 != 0;
    float _1442 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1382);
    bool _1444 = _1374 >= 0.0;
    bool _1446 = isnan(_1374);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan(0.0);
    bool _1452 = _1448 || _1450;
    float _1454 = -_124;
    float _1456 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1364);
    int _1458 = ~_1426;
    int _1460 = _1458 + 1;
    int _1462 = _1460 + 1;
    float _1464 = 1.0 / _1350;
    bool _1466 = !_1432;
    int _1468 = _1466 ? 0 : 1;
    float _1470 = _1412 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1472 = _1462;
    if (!_1392)
    {
        int _1474 = ~_1426;
        int _1476 = _1474 + 1;
        _1472 = _1476;
    }
    int _1478 = _1472;
    int _1480 = abs(_1468);
    float _1482 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1484 = _1394 > 0.0;
    bool _1486 = _1394 >= 0.0;
    bool _1488 = isnan(_1394);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan(0.0);
    bool _1494 = _1490 || _1492;
    float _1496 = exp2(_1346);
    float _1498 = float(_1480);
    float _1500 = float(_1478);
    float _1502 = _1464 * _124;
    float _1504 = _1498 * _1500;
    float _1506 = in.m_55.x;
    float _1508 = in.m_55.y;
    float _1510 = in.m_55.z;
    int _1512 = _1452 ? 0 : 1;
    float _1514 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1516 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1518 = isnan(1.0);
    bool _1520 = _1516 || _1518;
    bool _1522 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1524 = _1520 || _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1528 = 1.0 + _1526;
    bool _1530 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1532 = isnan(0.0);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1538 = _1534 || _1536;
    float _1540 = -_1496;
    float _1542 = _1540 + 1.0;
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1546 = 1.0 / _1528;
    float _1548 = float(_1424);
    float _1550 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1514);
    float _1552 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1544);
    float _1554 = _1538 ? _1542 : 0.0;
    float _1556 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1380);
    float _1558 = _1548 * _124;
    float _1560 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1550);
    float _1562 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1552);
    int _1564 = _1494 ? 0 : 1;
    float _1566 = _1428 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1568 = ~_1512;
    int _1570 = _1568 + 1;
    int _1572 = _1570 + 1;
    float _1574 = _1504 * (-2.0);
    int _1576 = _1572;
    float _1578 = _1566;
    if (!_1420)
    {
        int _1580 = ~_1512;
        int _1582 = _1580 + 1;
        _1576 = _1582;
    }
    int _1584 = _1576;
    float _1586 = -_1566;
    float _1588 = _1586 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _1590 = ~_1564;
    int _1592 = _1590 + 1;
    int _1594 = _1592 + 1;
    int _1596 = _1594;
    if (_1524)
    {
        float _1598 = _1554 * _1546;
        _128 = _1598;
    }
    float _1600 = _128;
    bool _1602 = !_1436;
    int _1604 = _1602 ? 0 : 1;
    float _1606 = fma(_1574, _1506, _1506);
    if (!_1484)
    {
        int _1608 = ~_1564;
        int _1610 = _1608 + 1;
        _1596 = _1610;
    }
    int _1612 = _1596;
    float _1614 = fma(_1384, _1574, _1384);
    int _1616 = abs(_1604);
    float _1618 = _1312 + (-0.5);
    float _1620 = _1442 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1622 = float(_1584);
    float _1624 = -_1470;
    float _1626 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1628 = _1588 * _1588;
    float _1630 = float(_1616);
    float _1632 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1606);
    float _1634 = -_1620;
    float _1636 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1638 = fma(_1626, _1626, _1628);
    bool _1640 = !_1440;
    int _1642 = _1640 ? 0 : 1;
    float _1644 = _1630 * _1622;
    float _1646 = fma(_1614, _1600, _1632);
    float _1648 = fma(_1636, _1636, _1638);
    int _1650 = abs(_1642);
    float _1652 = _1644 * (-2.0);
    float _1654 = _1314 + (-0.5);
    float _1656 = float(_1612);
    float _1658 = _1646 * 0.15915493667125701904296875;
    float _1660 = fma(_1652, _1508, _1508);
    float _1662 = float(_1650);
    float _1664 = fma(_1482, _1652, _1482);
    float _1666 = rsqrt(_1648);
    float _1668 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1660);
    float _1670 = _1662 * _1656;
    float _1672 = _1306 + _1312;
    float _1674 = fma(_1664, _1600, _1668);
    float _1676 = in.m_57.x;
    float _1678 = in.m_57.y;
    float _1680 = in.m_57.z;
    float _1682 = _1670 * (-2.0);
    float _1684 = _1672 + (-1.0);
    float _1686 = _1674 * 0.15915493667125701904296875;
    float _1688 = _1658 * 6.283185482025146484375;
    float _1690 = sin(_1688);
    float _1692 = fma(_1682, _1510, _1510);
    float _1694 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1696 = _1306 + (-0.5);
    float _1698 = _1636 * _1666;
    float _1700 = fma(_1694, _1682, _1694);
    float _1702 = fma(_1696, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1692);
    float _1704 = _1588 * _1666;
    float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1708 = _1698 * _1706;
    float _1710 = _1658 * 6.283185482025146484375;
    float _1712 = cos(_1710);
    float _1714 = fma(_1700, _1600, _1702);
    float _1716 = _1626 * _1666;
    float _1718 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1720 = _1704 * _1718;
    float _1722 = _1714 * 0.15915493667125701904296875;
    float _1724 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1726 = _1716 * _1724;
    bool _1728 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1730 = isnan(0.5);
    bool _1732 = _1728 || _1730;
    bool _1734 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1736 = _1732 || _1734;
    float _1738 = _1686 * 6.283185482025146484375;
    float _1740 = sin(_1738);
    bool _1742 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1744 = isnan(0.5);
    bool _1746 = _1742 || _1744;
    bool _1748 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1750 = _1746 || _1748;
    float _1752 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1754 = -_1726;
    float _1756 = fma(_1698, _1752, _1754);
    float _1758 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1676);
    float _1760 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1762 = -_1708;
    float _1764 = fma(_1704, _1760, _1762);
    float _1766 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1678);
    float _1768 = _1756 * _1756;
    float _1770 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1772 = -_1720;
    float _1774 = fma(_1716, _1770, _1772);
    float _1776 = _1686 * 6.283185482025146484375;
    float _1778 = cos(_1776);
    float _1780 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1680);
    float _1782 = fma(_1764, _1764, _1768);
    float _1784 = _562 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1786 = _1342 * _1758;
    float _1788 = fma(_1774, _1774, _1782);
    float _1790 = _1722 * 6.283185482025146484375;
    float _1792 = cos(_1790);
    float _1794 = _1712 * _1740;
    float _1796 = _1690 * _1740;
    float _1798 = _1722 * 6.283185482025146484375;
    float _1800 = sin(_1798);
    float _1802 = _1690 * _1778;
    float _1804 = rsqrt(_1788);
    float _1806 = _1344 * _1766;
    float _1808 = _1740 * _1792;
    float _1810 = _1712 * _1778;
    float _1812 = _1778 * _1792;
    float _1814 = _1784 * _1780;
    float _1816 = _1792 * _1806;
    float _1818 = -_1794;
    float _1820 = fma(_1800, _1802, _1818);
    float _1822 = -_1802;
    float _1824 = fma(_1800, _1794, _1822);
    float _1826 = fma(_1800, _1810, _1796);
    float _1828 = fma(_1800, _1796, _1810);
    float _1830 = _1712 * _1816;
    float _1832 = _1690 * _1816;
    float _1834 = -_1806;
    float _1836 = _1800 * _1834;
    float _1838 = _1764 * _1804;
    float _1840 = fma(_1826, _1786, _1830);
    float _1842 = _1756 * _1804;
    float _1844 = fma(_1812, _1786, _1836);
    float _1846 = _1704 * _1838;
    float _1848 = _1774 * _1804;
    float _1850 = fma(_1824, _1814, _1840);
    float _1852 = _1698 * _1842;
    float _1854 = -_1846;
    float _1856 = fma(_1716, _1842, _1854);
    float _1858 = fma(_1820, _1786, _1832);
    float _1860 = fma(_1808, _1814, _1844);
    float _1862 = -_1852;
    float _1864 = fma(_1704, _1848, _1862);
    float _1866 = _1856 * _1850;
    float _1868 = fma(_1828, _1814, _1858);
    float _1870 = _1566 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1872 = _1864 * _1850;
    float _1874 = fma(_1848, _1860, _1866);
    float _1876 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1870);
    float _1878 = fma(_1838, _1860, _1872);
    float _1880 = fma(_1698, _1868, _1874);
    float _1882 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1876);
    float _1884 = fma(_1716, _1868, _1878);
    float _1886 = _1620 + _1880;
    float _1888 = _1716 * _1848;
    float _1890 = _1882 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1892 = _1470 + _1884;
    float _1894 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1896 = _1886 + _1894;
    float _1898 = _1566 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1900 = 1.0 / _1890;
    float _1902 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1904 = _1892 + _1902;
    float _1906 = _1896 * _1896;
    float _1908 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1898);
    float _1910 = -_1888;
    float _1912 = fma(_1698, _1838, _1910);
    float _1914 = fma(_1904, _1904, _1906);
    float _1916 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1908);
    float _1918 = _1912 * _1850;
    float _1920 = sqrt(_1914);
    float _1922 = _1916 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1924 = fma(_1842, _1860, _1918);
    float _1926 = _1922 + _1890;
    float _1928 = fma(_1704, _1868, _1924);
    float _1930 = _1926 * _1900;
    float _1932 = _1930 * 0.5;
    float _1934 = _1566 + _1928;
    float _1936 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1938 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1936);
    bool _1940 = _1920 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1942 = 1.0 / _1938;
    float _1944 = _1848;
    float _1946 = _1850;
    float _1948 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1950 = _1868;
    float _1952 = _1914;
    float _1954 = _1920;
    float _1956 = _1904;
    float _1958 = _1886;
    if (!_1940)
    {
        _1944 = _1892;
    }
    float _1960 = _1944;
    float _1962 = _1960;
    if (!_1940)
    {
        _1946 = _1886;
    }
    float _1964 = _1946;
    float _1966 = _1964;
    if (!_1940)
    {
        _1948 = _1934;
    }
    float _1968 = _1948;
    bool _1970 = !_1940;
    float _1972 = _1968;
    if (!_1970)
    {
        float _1974 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1976 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1978 = _1920 + _1976;
        float _1980 = _1934 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1982 = rsqrt(_1914);
        float _1984 = _1978 * _1974;
        float _1986 = _1984 * 0.15915493667125701904296875;
        float _1988 = _1986 * 6.283185482025146484375;
        float _1990 = cos(_1988);
        float _1992 = _1986 * 6.283185482025146484375;
        float _1994 = sin(_1992);
        float _1996 = _1990 + (-1.0);
        float _1998 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2000 = fma(_1994, _1980, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2002 = fma(_1934, _1990, _1998);
        float _2004 = _1982 * _2000;
        float _2006 = fma(_1904, _2004, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2008 = fma(_1896, _2004, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1962 = _2006;
        _1972 = _2002;
        _1950 = _1986;
        _1966 = _2008;
        _1952 = _1982;
        _1954 = _1978;
    }
    float _2010 = _1962;
    float _2012 = _1972;
    float _2014 = _1950;
    float _2016 = _1966;
    float _2018 = _1952;
    float _2020 = _1954;
    float _2022 = _2020;
    float _2024 = _2016;
    float _2026 = _2014;
    float _2028 = _2012;
    float _2030 = _2016;
    float _2032 = _2018;
    if (_1750)
    {
        _2022 = 1.0;
    }
    float _2034 = _2022;
    float _2036 = _2034;
    if (_1736)
    {
        _1956 = _2010;
    }
    float _2038 = _1956;
    float _2040 = _2038;
    if (!_1736)
    {
        float _2042 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2044 = _1566 + _2042;
        float _2046 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2048 = _1470 + _2046;
        float _2050 = -_1470;
        float _2052 = _2050 + _2010;
        float _2054 = -_1566;
        float _2056 = _2054 + _2012;
        float _2058 = _2044 * _2044;
        float _2060 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2062 = _1620 + _2060;
        float _2064 = fma(_2048, _2048, _2058);
        float _2066 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2068 = fma(_2062, _2062, _2064);
        float _2070 = sqrt(_2068);
        float _2072 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _2074 = _2070 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _2076 = isnan(_2070);
        bool _2078 = _2074 || _2076;
        bool _2080 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _2082 = _2078 || _2080;
        float _2084 = precise::min(_2070, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2086 = _2084 * _2066;
        float _2088 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2090 = _2088 * _2086;
        float _2092 = _2014;
        float _2094 = _2066;
        float _2096 = _2088;
        if (_2082)
        {
            float _2098 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _2092 = _2098;
        }
        float _2100 = _2092;
        if (_2082)
        {
            float _2102 = precise::max(_2070, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _2094 = _2102;
        }
        float _2104 = _2094;
        float _2106 = -_1620;
        float _2108 = _2106 + _2016;
        float _2110 = fma(_2052, _2090, _1470);
        float _2112 = fma(_2056, _2090, _1566);
        float _2114 = _2110;
        float _2116 = _2112;
        _2026 = _2100;
        if (_2082)
        {
            float _2118 = _2104 * _2100;
            _2024 = _2118;
        }
        float _2120 = _2024;
        float _2122 = fma(_2108, _2090, _1620);
        float _2124 = _2120;
        _2032 = _2122;
        if (_2082)
        {
            float _2126 = _2088 * _2120;
            _2096 = _2126;
        }
        float _2128 = _2096;
        if (!_2082)
        {
            _2124 = _2122;
        }
        float _2130 = _2124;
        _2030 = _2130;
        if (_2082)
        {
            float _2132 = fma(_2052, _2128, _1470);
            _2114 = _2132;
        }
        float _2134 = _2114;
        _2040 = _2134;
        if (_2082)
        {
            float _2136 = fma(_2056, _2128, _1566);
            _2116 = _2136;
        }
        float _2138 = _2116;
        _2028 = _2138;
        if (_2082)
        {
            float _2140 = fma(_2108, _2128, _1620);
            _2030 = _2140;
        }
    }
    float _2142 = _2026;
    float _2144 = _2028;
    float _2146 = _2040;
    float _2148 = _2030;
    float _2150 = _2032;
    float _2152 = _2142;
    float _2154 = _2150;
    if (_1750)
    {
        _1578 = 1.0;
    }
    float _2156 = _1578;
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2160 = _1942 * _2158;
    float _2162 = _2156;
    if (!_1750)
    {
        float _2164 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2166 = _2164 * 0.15915493667125701904296875;
        float _2168 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2170 = _2166 * 6.283185482025146484375;
        float _2172 = cos(_2170);
        float _2174 = _2168 * 0.15915493667125701904296875;
        float _2176 = _2166 * 6.283185482025146484375;
        float _2178 = sin(_2176);
        float _2180 = 1.0 / _2172;
        float _2182 = _2174 * 6.283185482025146484375;
        float _2184 = cos(_2182);
        float _2186 = _2178 * _2180;
        float _2188 = _2174 * 6.283185482025146484375;
        float _2190 = sin(_2188);
        float _2192 = _2184 * _2186;
        float _2194 = 1.0 / _2192;
        float _2196 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2198 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2196;
        float _2200 = 1.0 / _2198;
        float _2202 = _2190 * _2194;
        float _2204 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2206 = fma(_2160, _2202, _2204);
        float _2208 = _2206 * _2200;
        float _2210 = precise::clamp(_2208, 0.0, 1.0);
        _2152 = _2206;
        _2154 = _2174;
        _2036 = _2210;
    }
    float _2212 = _2152;
    float _2214 = _2154;
    float _2216 = _2036;
    float _2218 = _2212;
    float _2220 = _2214;
    if (!_1750)
    {
        float _2222 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2224 = _2222 * 0.15915493667125701904296875;
        float _2226 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2228 = _2224 * 6.283185482025146484375;
        float _2230 = cos(_2228);
        float _2232 = _2226 * 0.15915493667125701904296875;
        float _2234 = _2224 * 6.283185482025146484375;
        float _2236 = sin(_2234);
        float _2238 = 1.0 / _2230;
        float _2240 = _2232 * 6.283185482025146484375;
        float _2242 = cos(_2240);
        float _2244 = _2236 * _2238;
        float _2246 = _2232 * 6.283185482025146484375;
        float _2248 = sin(_2246);
        float _2250 = _2242 * _2244;
        float _2252 = 1.0 / _2250;
        float _2254 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2256 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2254;
        float _2258 = 1.0 / _2256;
        float _2260 = _2248 * _2252;
        float _2262 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2264 = fma(_2160, _2260, _2262);
        float _2266 = _2264 * _2258;
        float _2268 = precise::clamp(_2266, 0.0, 1.0);
        float _2270 = -_2268;
        float _2272 = _2270 + 1.0;
        _2218 = _2238;
        _2220 = _2252;
        _2162 = _2272;
    }
    float _2274 = _2218;
    float _2276 = _2220;
    float _2278 = _2162;
    float _2280 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2282 = _2144 + _2280;
    float _2284 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2286 = _2146 + _2284;
    float _2288 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2290 = _2148 + _2288;
    float _2292 = _2282 * _2282;
    float _2294 = fma(_2286, _2286, _2292);
    float _2296 = fma(_2290, _2290, _2294);
    float _2298 = rsqrt(_2296);
    float _2300 = sqrt(_2296);
    float _2302 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2304 = _2286 * _2302;
    float _2306 = _2290 * _2302;
    float _2308 = _2304 * _2304;
    float _2310 = _2306 * _2306;
    float _2312 = _2308 + _2310;
    float _2314 = sqrt(_2312);
    bool _2316 = _2314 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2320 = _2314 + _2318;
    float _2322 = _2290;
    float _2324 = _2292;
    float _2326 = _2320;
    float _2328 = _2274;
    float _2330 = _2302;
    if (_2316)
    {
        float _2332 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2322 = _2332;
    }
    float _2334 = _2322;
    if (_2316)
    {
        float _2336 = rsqrt(_2312);
        _2324 = _2336;
    }
    float _2338 = _2324;
    float _2340 = _2338;
    if (_2316)
    {
        float _2342 = _2320 * _2334;
        _2326 = _2342;
    }
    float _2344 = _2326;
    if (_2316)
    {
        float _2346 = _2344 * 0.15915493667125701904296875;
        _2328 = _2346;
    }
    float _2348 = _2328;
    float _2350 = _2298;
    float _2352 = _2348;
    if (_2316)
    {
        float _2354 = _2348 * 6.283185482025146484375;
        float _2356 = sin(_2354);
        _2350 = _2356;
    }
    float _2358 = _2350;
    float _2360 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2362 = precise::max(0.0, _2360);
    float _2364 = _2276;
    float _2366 = _2362;
    float _2368 = _2360;
    if (_2316)
    {
        float _2370 = _2348 * 6.283185482025146484375;
        float _2372 = cos(_2370);
        _2364 = _2372;
    }
    float _2374 = _2364;
    float _2376 = -_2302;
    float _2378 = -_2362;
    float _2380 = fma(_2282, _2376, _2378);
    if (_2316)
    {
        float _2382 = _2380 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2366 = _2382;
    }
    float _2384 = _2366;
    float _2386 = _2384;
    if (!_2316)
    {
        _2352 = _2308;
    }
    float _2388 = _2352;
    float _2390 = _2358;
    float _2392 = _2388;
    if (_2316)
    {
        float _2394 = fma(_2358, _2384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2390 = _2394;
    }
    float _2396 = _2390;
    float _2398 = _2396;
    if (!_2316)
    {
        _2386 = _2306;
    }
    float _2400 = _2386;
    float _2402 = _2400;
    if (_2316)
    {
        float _2404 = _2374 + (-1.0);
        _2368 = _2404;
    }
    float _2406 = _2368;
    float _2408 = _2406;
    if (_2316)
    {
        float _2410 = _2338 * _2396;
        _1958 = _2410;
    }
    float _2412 = _1958;
    if (!_2316)
    {
        _2340 = _2304;
    }
    float _2414 = _2340;
    float _2416 = _2414;
    if (_2316)
    {
        float _2418 = _2406 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2330 = _2418;
    }
    float _2420 = _2330;
    if (_2316)
    {
        float _2422 = _2304 * _2412;
        _2416 = _2422;
    }
    float _2424 = _2416;
    if (!_2316)
    {
        _2398 = _2380;
    }
    float _2426 = _2398;
    float _2428 = _2426;
    if (_2316)
    {
        float _2430 = _2306 * _2412;
        _2402 = _2430;
    }
    float _2432 = _2402;
    if (_2316)
    {
        float _2434 = fma(_2380, _2374, _2420);
        _2428 = _2434;
    }
    float _2436 = _2428;
    if (_2316)
    {
        float _2438 = _2424 * _2424;
        _2392 = _2438;
    }
    float _2440 = _2392;
    if (!_2316)
    {
        _2408 = _2310;
    }
    float _2442 = _2408;
    float _2444 = _2442;
    if (_2316)
    {
        float _2446 = _2432 * _2432;
        _2444 = _2446;
    }
    float _2448 = _2444;
    float _2450 = fma(_2436, _2436, _2440);
    float _2452 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2454 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2456 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2458 = _2450 + _2448;
    float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2462 = fma(_2300, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2460);
    float _2464 = precise::clamp(_2462, 0.0, 1.0);
    float _2466 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2468 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2470 = rsqrt(_2458);
    float _2472 = -_2464;
    float _2474 = _2472 + 1.0;
    float _2476 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2466);
    float _2478 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2454);
    float _2480 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2456);
    float _2482 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2468);
    float _2484 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2476);
    float _2486 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2478);
    float _2488 = abs(_2474);
    float _2490 = log2(_2488);
    float _2492 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2480);
    float _2494 = _2484 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2496 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2482);
    float _2498 = _2486 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2500 = _2492 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2502 = _2494 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2504 = _2470 * _2424;
    float _2506 = _2470 * _2436;
    float _2508 = _2470 * _2432;
    float _2510 = fma(_2498, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2502);
    float _2512 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2514 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2516 = _2496 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2518 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2510);
    float _2520 = -_2512;
    float _2522 = fma(_2506, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2520);
    float _2524 = -_2514;
    float _2526 = fma(_2524, _2452, 1.0);
    float _2528 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2530 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2518);
    float _2532 = -_2508;
    float _2534 = fma(_2532, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2522);
    float _2536 = _2494 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2538 = exp2(_2528);
    float _2540 = _2494 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2542 = fma(_2534, -0.5, 0.5);
    float _2544 = fma(_2534, 0.5, 0.5);
    float _2546 = fma(_2498, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2536);
    float _2548 = fma(_2498, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2540);
    float _2550 = _2506 + 1.0;
    float _2552 = fma(_2544, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2554 = log2(_2526);
    float _2556 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2546);
    float _2558 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2548);
    float _2560 = fma(_2544, _2552, -0.212114393711090087890625);
    float _2562 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2556);
    float _2564 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2558);
    float _2566 = fma(_2544, _2560, 1.570728778839111328125);
    float _2568 = 1.0 / _2530;
    float _2570 = -_2506;
    float _2572 = fma(_2538, _2550, _2570);
    float _2574 = fma(_2572, 0.5, 0.5);
    float _2576 = sqrt(_2542);
    float _2578 = _2554 * 0.693147182464599609375;
    float _2580 = _2578 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2582 = _2562 * _2568;
    float _2584 = _2564 * _2568;
    float _2586 = fma(_2582, 0.5, 0.5);
    float _2588 = fma(_2584, -0.5, 0.5);
    float _2590 = _2576 * 0.636619746685028076171875;
    float _2592 = -_2566;
    float _2594 = fma(_2590, _2592, 1.0);
    float3 _7527 = float3(_2586, _2588, _2580);
    float _2596 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7527, float3(0.0), isnan(_7527)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7527, float3(0.0), isnan(_7527)), level(0.0)).x;
    float3 _7538 = float3(_2586, _2588, _2580);
    float4 _2599 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7538, float3(0.0), isnan(_7538)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7538, float3(0.0), isnan(_7538)), level(0.0)).xyzw;
    float _2601 = _2599.x;
    float _2603 = _2599.y;
    float _2605 = _2599.z;
    float _2607 = _2599.w;
    float2 _7555 = float2(_2594, _2574);
    float3 _2611 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7555, float2(0.0), isnan(_7555)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7555, float2(0.0), isnan(_7555)), level(0.0)).xyz;
    float _2613 = _2611.x;
    float _2615 = _2611.y;
    float _2617 = _2611.z;
    float _2619 = float(uint(_1424));
    float _2621 = trunc(_1502);
    int _2623 = int(_2621);
    int _2625 = ~_1424;
    int _2627 = _2625 + 1;
    float _2629 = _2494 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2631 = abs(_1416);
    float _2633 = fma(_2498, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2629);
    float _2635 = 1.0 / _2619;
    float _2637 = float(uint(_2623));
    int _2639 = ~_1424;
    int _2641 = _2639 + 1;
    int _2643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2645 = _2643 != 0;
    int _2647 = as_type<int>(_2635) + (-2);
    float _2649 = as_type<float>(_2647) * _2637;
    bool _2651 = !_2645;
    float _2653 = _2651 ? 7.345489978790283203125 : 1.0;
    float _2655 = trunc(_2649);
    float _2657 = precise::max(_2655, 0.0);
    uint _2660 = uint(_2657);
    float _2662 = _2653 * _1312;
    float _2664 = floor(_2662);
    float _2666 = float(_90);
    float _2668 = float(_2623);
    bool _2670 = _2668 >= _1548;
    bool _2672 = isnan(_2668);
    bool _2674 = _2670 || _2672;
    bool _2676 = isnan(_1548);
    bool _2678 = _2674 || _2676;
    float _2680 = float(_2678);
    int _2682 = _2627 * int(_2660);
    int _2684 = _2682 + _2623;
    float _2686 = 1.0 / _2666;
    float _2688 = float(uint(_2684));
    float _2690 = -_2664;
    float _2692 = _2662 + _2690;
    float _2694 = trunc(_2680);
    int _2696 = int(_2694);
    float _2698 = as_type<float>(_2647) * _2688;
    float _2700 = _2692 * _1548;
    float _2702 = trunc(_2698);
    float _2704 = precise::max(_2702, 0.0);
    uint _2706 = uint(_2704);
    float _2708 = _1558 * _2686;
    int _2710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2712 = _2710 != 0;
    float _2714 = trunc(_2700);
    int _2716 = int(_2714);
    int _2718 = ~_2696;
    int _2720 = _2718 + 1;
    int _2722 = _2720 + 1;
    int _2724 = int(_2660) + int(_2706);
    float _2726 = trunc(_2708);
    int _2728 = int(_2726);
    int _2730 = _2641 * _2724;
    int _2732 = _2730 + _2623;
    bool _2734 = uint(_2732) >= uint(_1424);
    int _2736 = ~_1424;
    int _2738 = _2736 + 1;
    bool _2740 = !_2734;
    int _2742 = _2740 ? 0 : (-1);
    bool _2744 = _1424 == 0;
    int _2746 = ~_2724;
    int _2748 = _2746 + _2742;
    int _2750 = _2748 + 1;
    int _2752 = _1424 + (-1);
    int _2754 = _1424 * _2750;
    int _2756 = _2754 + _2623;
    bool _2758 = !_2712;
    int _2760 = _2758 ? 0 : 1;
    int _2762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2764 = _2762 != 0;
    bool _2766 = !_2744;
    int _2768 = _2766 ? _2756 : (-1);
    int _2770 = abs(_2760);
    int _2772 = abs(_1388);
    int _2774 = _2768 * _2722;
    int _2776 = abs(_1410);
    int _2778 = ~_1424;
    int _2780 = _2778 + 1;
    int _2782 = _2696 * _2752;
    int _2784 = _2782 + _2774;
    bool _2786 = !_2764;
    int _2788 = _2786 ? 0 : 1;
    int _2790 = _2784 * _2772;
    int _2792 = ~_1424;
    int _2794 = _2792 + 1;
    int _2796 = _2716 * _2770;
    int _2798 = _2796 + _2623;
    int _2800 = abs(_2788);
    int _2802 = _2728 * _2776;
    int _2804 = _2802 + _2790;
    int _2806 = _2798 * _2631;
    int _2808 = _2806 + _2804;
    int _2810 = _2716 * _2800;
    int _2812 = _2810 + _2808;
    float _2814 = float(uint(_2812));
    float _2816 = as_type<float>(_2647) * _2814;
    float _2818 = trunc(_2816);
    float _2820 = precise::max(_2818, 0.0);
    uint _2822 = uint(_2820);
    int _2824 = _2794 * int(_2822);
    int _2826 = _2824 + _2812;
    float _2828 = float(uint(_2826));
    float _2830 = as_type<float>(_2647) * _2828;
    float _2832 = trunc(_2830);
    float _2834 = precise::max(_2832, 0.0);
    uint _2836 = uint(_2834);
    int _2838 = int(_2822) + int(_2836);
    int _2840 = ~_1424;
    int _2842 = _2840 + 1;
    int _2844 = _2780 * _2838;
    int _2846 = _2844 + _2812;
    bool _2848 = uint(_2846) >= uint(_1424);
    float _2850 = float(uint(_2798));
    bool _2852 = !_2848;
    int _2854 = _2852 ? 0 : (-1);
    float _2856 = as_type<float>(_2647) * _2850;
    int _2858 = ~_2838;
    int _2860 = _2858 + _2854;
    int _2862 = _2860 + 1;
    float _2864 = trunc(_2856);
    float _2866 = precise::max(_2864, 0.0);
    uint _2868 = uint(_2866);
    int _2870 = _1424 * _2862;
    int _2872 = _2870 + _2812;
    bool _2874 = !_2744;
    int _2876 = _2874 ? _2872 : (-1);
    int _2878 = _2876 >> 31;
    int _2880 = _2876 & 3;
    bool _2882 = _2880 != 0;
    int _2884 = _2878 & 3;
    int _2886 = _2842 * int(_2868);
    int _2888 = _2886 + _2798;
    int _2890 = _2876 + _2884;
    float _2892 = float(uint(_2888));
    int _2894 = _2890 >> 2;
    float _2896 = as_type<float>(_2647) * _2892;
    int _2898 = _2894 << 4;
    int _2900 = _2898 + 368;
    int _2902 = _2876 & 3;
    bool _2904 = _2902 != 0;
    uint _2906 = uint(int(uint(_2900) >> uint(2)));
    uint _2908 = uint(int(uint(int(_2906)) >> uint(2)));
    int _2910 = int(_2906) & 3;
    float _2912 = (*spvDescriptorSet0.vp_c9)._m0[int(_2908)][_2910];
    int _2914 = int(_2906) + 1;
    uint _2916 = uint(int(uint(_2914) >> uint(2)));
    int _2918 = _2914 & 3;
    float _2920 = (*spvDescriptorSet0.vp_c9)._m0[int(_2916)][_2918];
    float _2922 = trunc(_2896);
    float _2924 = precise::max(_2922, 0.0);
    uint _2926 = uint(_2924);
    bool _2928 = uint(_2902) > 1u;
    int _2930 = _2882 ? 0 : 1;
    int _2932 = _2900 + 8;
    uint _2934 = uint(int(uint(_2932) >> uint(2)));
    uint _2936 = uint(int(uint(int(_2934)) >> uint(2)));
    int _2938 = int(_2934) & 3;
    float _2940 = (*spvDescriptorSet0.vp_c9)._m0[int(_2936)][_2938];
    int _2942 = int(_2934) + 1;
    uint _2944 = uint(int(uint(_2942) >> uint(2)));
    int _2946 = _2942 & 3;
    float _2948 = (*spvDescriptorSet0.vp_c9)._m0[int(_2944)][_2946];
    int _2950 = ~_2930;
    int _2952 = _2950 + 1;
    int _2954 = _2952 + 1;
    int _2956 = _2954;
    if (!_2928)
    {
        int _2958 = ~_2930;
        int _2960 = _2958 + 1;
        _2956 = _2960;
    }
    int _2962 = _2956;
    bool _2964 = !_2904;
    int _2966 = _2964 ? 0 : 1;
    int _2968 = int(_2868) + int(_2926);
    bool _2970 = _2902 != 3;
    int _2972 = abs(_2962);
    int _2974 = _2738 * _2968;
    int _2976 = _2974 + _2798;
    int _2978 = abs(_2966);
    float _2980 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2982 = int(_2980);
    bool _2984 = uint(_2902) >= 2u;
    int _2986 = ~_2972;
    int _2988 = _2986 + 1;
    int _2990 = _2988 + 1;
    int _2992 = _2984 ? 0 : 1;
    bool _2994 = uint(_2976) >= uint(_1424);
    int _2996 = ~_2992;
    int _2998 = _2996 + 1;
    int _3000 = _2998 + 1;
    int _3002 = _3000;
    if (_2970)
    {
        int _3004 = ~_2992;
        int _3006 = _3004 + 1;
        _3002 = _3006;
    }
    int _3008 = _3002;
    int _3010 = ~_2978;
    int _3012 = _3010 + 1;
    int _3014 = _3012 + 1;
    int _3016 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3018 = _3016 != 0;
    bool _3020 = _2902 != 3;
    bool _3022 = !_2994;
    int _3024 = _3022 ? 0 : (-1);
    int _3026 = _2990 * as_type<int>(_2920);
    bool _3028 = !_3018;
    int _3030 = _3028 ? 0 : 1;
    int _3032 = abs(_2982);
    int _3034 = _3014 * as_type<int>(_2912);
    int _3036 = _3034 + _3026;
    bool _3038 = !_3020;
    int _3040 = _3038 ? 0 : (-1);
    int _3042 = abs(_3008);
    int _3044 = ~_2968;
    int _3046 = _3044 + _3024;
    int _3048 = _3046 + 1;
    float _3050 = in.m_59.z;
    int _3052 = abs(_3030);
    int _3054 = _1424 * _3048;
    int _3056 = _3054 + _2798;
    int _3058 = abs(_3040);
    float _3060 = in.m_59.w;
    int _3062 = ~_3042;
    int _3064 = _3062 + 1;
    int _3066 = _3064 + 1;
    float _3068 = float(uint(_2982));
    float _3070 = in.m_59.y;
    float _3072 = float(uint(_3032));
    int _3074 = _3066 * as_type<int>(_2940);
    int _3076 = _3074 + _3036;
    int _3078 = ~_3058;
    int _3080 = _3078 + 1;
    int _3082 = _3080 + 1;
    int _3084 = ~_3052;
    int _3086 = _3084 + 1;
    int _3088 = _3086 + 1;
    float _3090 = 1.0 / _3068;
    bool _3092 = !_2744;
    int _3094 = _3092 ? _3056 : (-1);
    int _3096 = _3082 * as_type<int>(_2948);
    int _3098 = _3096 + _3076;
    int _3100 = ~_3032;
    int _3102 = _3100 + 1;
    int _3104 = _3098 * _3088;
    int _3106 = ~_2982;
    int _3108 = _3106 + 1;
    float _3110 = 1.0 / _3072;
    int _3112 = _3094 * _3052;
    int _3114 = _3112 + _3104;
    int _3116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _3118 = _3116 != 0;
    float _3120 = in.m_59.x;
    int _3122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3124 = _3122 != 0;
    int _3126 = abs(_3114);
    out.m_61.w = _3060;
    int _3128 = as_type<int>(_3090) + (-2);
    float _3130 = float(uint(_3114));
    out.m_61.z = _3050;
    bool _3132 = _1314 > 0.5;
    float _3134 = as_type<float>(_3128) * _3130;
    int _3136 = as_type<int>(_3110) + (-2);
    out.m_61.y = _3070;
    float _3138 = float(uint(_3126));
    float _3140 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3142 = _3140 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _3144 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _3146 = _3144 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3148 = trunc(_3134);
    float _3150 = precise::max(_3148, 0.0);
    uint _3152 = uint(_3150);
    float _3154 = as_type<float>(_3136) * _3138;
    float _3156 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _3158 = _3156 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    out.m_61.x = _3120;
    float _3160 = trunc(_3154);
    float _3162 = precise::max(_3160, 0.0);
    uint _3164 = uint(_3162);
    float _3166 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _3168 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _3166;
    float _3170 = 1.0 / _3158;
    int _3172 = _3108 * int(_3152);
    int _3174 = _3172 + _3114;
    float _3176 = float(uint(_3174));
    int _3178 = _3102 * int(_3164);
    int _3180 = _3178 + _3126;
    float _3182 = 1.0 / _3146;
    float _3184 = as_type<float>(_3128) * _3176;
    float _3186 = float(uint(_3180));
    float _3188 = _3168 * _3170;
    float _3190 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _3192 = _1304 + _3190;
    float _3194 = 1.0 / _3142;
    float _3196 = as_type<float>(_3136) * _3186;
    bool _3198 = _1304 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _3200 = isnan(_1304);
    bool _3202 = _3198 || _3200;
    bool _3204 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _3206 = _3202 || _3204;
    float _3208 = float(_3206);
    float _3210 = fma(_3188, _3192, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _3212 = _1304 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _3214 = isnan(_1304);
    bool _3216 = _3212 || _3214;
    bool _3218 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _3220 = _3216 || _3218;
    float _3222 = float(_3220);
    float _3224 = in.m_63.y;
    bool _3226 = _1304 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3228 = isnan(_1304);
    bool _3230 = _3226 || _3228;
    bool _3232 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3234 = _3230 || _3232;
    float _3236 = float(_3234);
    float _3238 = -_3208;
    float _3240 = _3238 + 1.0;
    float _3242 = trunc(_3184);
    float _3244 = precise::max(_3242, 0.0);
    uint _3246 = uint(_3244);
    float _3248 = -_3222;
    float _3250 = _3248 + 1.0;
    float _3252 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _3254 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _3252;
    float _3256 = _3236 * _3240;
    float _3258 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _3260 = _3258 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _3262 = _3208 * _3250;
    bool _3264 = _1304 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _3266 = isnan(_1304);
    bool _3268 = _3264 || _3266;
    bool _3270 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _3272 = _3268 || _3270;
    float _3274 = float(_3272);
    float _3276 = _3210 * _3256;
    float _3278 = trunc(_3196);
    float _3280 = precise::max(_3278, 0.0);
    uint _3282 = uint(_3280);
    float _3284 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _3286 = _1304 + _3284;
    float _3288 = _3254 * _3194;
    float _3290 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3292 = _1304 + _3290;
    float _3294 = -_3274;
    float _3296 = _3294 + 1.0;
    float _3298 = (*spvDescriptorSet0.vp_c9)._m0[132].x;
    if (_3118)
    {
        float _3300 = in.m_49.x;
        _3298 = _3300;
    }
    float _3302 = _3298;
    float _3304 = _3260 * _3182;
    float _3306 = -_3236;
    float _3308 = _3306 + 1.0;
    float _3310 = fma(_3288, _3292, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _3312 = ~_2982;
    int _3314 = _3312 + 1;
    float _3316 = _3222 * _3296;
    float _3318 = fma(_3304, _3286, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _3320 = int(_3152) + int(_3246);
    float _3322 = fma(_3308, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3276);
    int _3324 = ~_3032;
    int _3326 = _3324 + 1;
    float _3328 = -_3224;
    float _3330 = _3328 + 1.0;
    int _3332 = int(_3164) + int(_3282);
    float _3334 = fma(_3318, _3262, _3322);
    float _3336 = in.m_63.x;
    int _3338 = _3326 * _3332;
    int _3340 = _3338 + _3126;
    float _3342 = _3224;
    float _3344 = as_type<float>(_3320);
    if (_3124)
    {
        float _3346 = _3132 ? _3330 : _3224;
        _3342 = _3346;
    }
    float _3348 = _3342;
    int _3350 = _3314 * _3320;
    int _3352 = _3350 + _3114;
    float _3354 = fma(_3310, _3316, _3334);
    float _3356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3358 = uint(_3340) >= uint(_3032);
    bool _3360 = uint(_3352) >= uint(_2982);
    float _3362 = fma(_3274, (*spvDescriptorSet0.vp_c9)._m0[134].x, _3354);
    bool _3364 = !_3358;
    int _3366 = _3364 ? 0 : (-1);
    bool _3368 = _3302 > 0.5;
    bool _3370 = _3368 && _3118;
    float _3372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3374 = ~_3366;
    int _3376 = _3332 + _3374;
    int _3378 = _3376 + 1;
    float _3380 = _1270 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3382 = _1272 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3384 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _3386 = !_3360;
    int _3388 = _3386 ? 0 : (-1);
    float _3390 = _3380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3392 = _3114 ^ _2982;
    float _3394 = _3382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3396 = ~_3320;
    int _3398 = _3396 + _3388;
    int _3400 = _3398 + 1;
    float _3402 = _3384 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _3404 = uint(int(uint(_3392) >> uint(31)));
    float _3406 = _3336;
    if (_3118)
    {
        _3344 = _3336;
    }
    float _3408 = _3344;
    int _3410 = _2982 * _3400;
    int _3412 = _3410 + _3114;
    int _3414 = ~int(_3404);
    int _3416 = _3414 + 1;
    float _3418 = _3362 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _3420 = _2982 == 0;
    float _3422 = _3408;
    if (_3370)
    {
        float _3424 = -_3408;
        float _3426 = _3424 + 1.0;
        _3422 = _3426;
    }
    float _3428 = _3422;
    bool _3430 = _2982 == 0;
    int _3432 = _3378 ^ _3416;
    float _3434 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2633);
    bool _3436 = !_3420;
    int _3438 = _3436 ? _3412 : (-1);
    float _3440 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _3442 = ~_3416;
    int _3444 = _3442 + _3432;
    int _3446 = _3444 + 1;
    float _3448 = _3356 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3450 = float(_3438);
    float _3452 = _3372 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3454 = !_3430;
    int _3456 = _3454 ? _3446 : (-1);
    float _3458 = exp2(_3440);
    if (_3118)
    {
        _3406 = _3428;
    }
    float _3460 = _3406;
    out.m_65.x = _3390;
    out.m_65.y = _3394;
    out.m_65.z = _3402;
    out.m_65.w = _3418;
    float _3462 = float(_3456);
    float _3464 = _2216 * _2278;
    bool _3466 = _2216 > 0.0;
    bool _3468 = isnan(_2216);
    bool _3470 = _3466 || _3468;
    bool _3472 = isnan(0.0);
    bool _3474 = _3470 || _3472;
    float _3476 = fma(_3452, _3348, -0.5);
    float _3478 = fma(_3448, _3460, -0.5);
    float _3480 = _3464 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3482 = -_1556;
    float _3484 = fma(_3452, _3462, _3482);
    float _3486 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3434);
    float _3488 = fma(_3448, _3450, _1456);
    bool _3490 = _2278 <= 0.0;
    bool _3492 = !_3474;
    bool _3494 = _3490 || _3492;
    float _3496 = fma(_1562, _3476, _3484);
    float _3498 = _3486 + _2530;
    float _3500 = fma(_1560, _3478, _3488);
    float _3502 = -_3458;
    float _3504 = _3502 + 1.0;
    float _3506 = _3480 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3508 = _3498 * 0.5;
    float _3510 = _3504 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3512 = _3500 + 0.5;
    out.gl_Position.x = _2562;
    out.gl_Position.y = _2564;
    out.gl_Position.z = _3486;
    out.gl_Position.w = _2530;
    float _3514 = _3510 * _2596;
    float _3516 = -_3510;
    float _3518 = _3516 + 1.0;
    float _3520 = _3496 + 0.5;
    out.m_45.x = _3506;
    float _3522 = _2607 * _3514;
    float _3524 = _2617 * _3514;
    float _3526 = _2607 * _3518;
    out.m_67.z = _3508;
    out.m_67.w = _2530;
    float _3528 = fma(_2613, _3522, _2601);
    float _3530 = fma(_2615, _3522, _2603);
    float _3532 = fma(_2607, _3524, _2605);
    out.m_69.x = _3512;
    out.m_69.y = _3520;
    out.m_71.x = _3528;
    out.m_71.y = _3530;
    out.m_71.z = _3532;
    out.m_71.w = _3526;
    if (!_3494)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3534 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3534;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1296 = false;
    bool _858 = false;
    bool _678 = false;
    bool _498 = false;
    bool _168 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3591 = as_type<float>(_106);
        out.gl_Position.z = _3591;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    float _128 = _124;
    if (_120)
    {
        float _130 = float(_90);
        _126 = _130;
    }
    float _132 = _126;
    bool _134 = _124 >= _132;
    bool _136 = !_120;
    bool _138 = _134 || _136;
    if (_138)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _100;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3660 = as_type<float>(_144);
        out.gl_Position.z = _3660;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _146 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _148 = !_146;
    float _166;
    if (!_148)
    {
        float _150 = in.m_49.x;
        float _152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _154 = _150 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _156 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _158 = _156 * _152;
        float _160 = floor(_158);
        float _162 = -_160;
        float _164 = _158 + _162;
        _166 = _164;
        _168 = true;
    }
    else
    {
        float _170 = float(_90);
        float _172 = 1.0 / _170;
        float _174 = _124 * _172;
        _166 = _174;
    }
    _168 = false;
    float _176 = _166;
    float _178 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _180 = _176 + _178;
    float _182 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _184 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _182;
    float _186 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _188 = _186 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _192 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _190;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _196 = _194 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _198 = 1.0 / _184;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _200;
    float _204 = 1.0 / _188;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = _176 + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _210;
    bool _214 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _216 = 1.0 / _192;
    float _218 = _208 * _198;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = _176 + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _226 = _176 + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _228;
    float _232 = fma(_212, _218, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _234 = 1.0 / _202;
    float _236 = _180 * _204;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _240 = _176 + _238;
    bool _242 = _176 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _244 = isnan(_176);
    bool _246 = _242 || _244;
    bool _248 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _250 = _246 || _248;
    float _252 = float(_250);
    float _254 = fma(_230, _218, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _256 = 1.0 / _196;
    float _258 = _222 * _216;
    bool _260 = _176 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _262 = isnan(_176);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = -_252;
    float _274 = _272 + 1.0;
    bool _276 = _176 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _278 = isnan(_176);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -_270;
    float _290 = _288 + 1.0;
    float _292 = _240 * _234;
    bool _294 = _176 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _296 = isnan(_176);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = -_286;
    float _308 = _306 + 1.0;
    float _310 = -_304;
    float _312 = _310 + 1.0;
    float _314 = _226 * _256;
    float _316 = _286 * _290;
    float _318 = _304 * _308;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _320;
    bool _324 = _176 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _326 = isnan(_176);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _340 = _252 * _312;
    float _342 = fma(_322, _218, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _344 = _176 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _346 = isnan(_176);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = _334 * _274;
    float _358 = -_334;
    float _360 = _358 + 1.0;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _370 = _354 * _360;
    float _372 = -_354;
    float _374 = _372 + 1.0;
    float _376 = fma(_364, _236, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _378 = fma(_368, _236, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _380 = _342 * _370;
    float _382 = _254 * _370;
    float _384 = _232 * _370;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _386;
    float _390 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].x, _380);
    float _392 = fma(_338, _236, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _394 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].y, _382);
    float _396 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].z, _384);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _402 = fma(_388, _258, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _404 = fma(_376, _356, _390);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _410;
    float _414 = fma(_400, _314, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _420 = fma(_402, _340, _404);
    float _422 = fma(_408, _258, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _424 = fma(_378, _356, _394);
    float _426 = fma(_412, _258, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _432 = fma(_392, _356, _396);
    float _434 = fma(_418, _314, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _436 = fma(_422, _340, _424);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _442;
    float _446 = fma(_430, _314, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _448 = fma(_426, _340, _432);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _450;
    float _454 = fma(_414, _318, _420);
    float _456 = fma(_440, _292, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _458 = fma(_444, _292, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _460 = fma(_434, _318, _436);
    float _462 = fma(_452, _292, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _464 = fma(_446, _318, _448);
    float _466 = fma(_456, _316, _454);
    float _468 = fma(_458, _316, _460);
    float _470 = fma(_462, _316, _464);
    float _472 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[148].x, _466);
    float _474 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[148].y, _468);
    float _476 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[148].z, _470);
    bool _478 = !_214;
    float _496;
    if (!_478)
    {
        float _480 = in.m_49.x;
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _484 = _480 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _488 = _486 * _482;
        float _490 = floor(_488);
        float _492 = -_490;
        float _494 = _488 + _492;
        _496 = _494;
        _498 = true;
    }
    else
    {
        float _500 = float(_90);
        float _502 = 1.0 / _500;
        float _504 = _124 * _502;
        _496 = _504;
    }
    _498 = false;
    float _506 = _496;
    float _508 = in.m_51.x;
    float _510 = in.m_51.y;
    float _512 = in.m_51.z;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _516 = _506 + _514;
    bool _518 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _520 = isnan(_506);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _538 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _540 = isnan(_506);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = 1.0 / _536;
    bool _552 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _554 = 1.0 / _532;
    float _556 = _474 * _510;
    float _558 = -_528;
    float _560 = _558 + 1.0;
    float _562 = _476 * _512;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _564;
    float _568 = _472 * _508;
    float _570 = _516 * _554;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _574 = _506 + _572;
    bool _576 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _578 = isnan(_506);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _584 = _580 || _582;
    float _586 = float(_584);
    float _588 = fma(_566, _570, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _590 = _574 * _550;
    float _592 = _586 * _560;
    float _594 = -_586;
    float _596 = _594 + 1.0;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _602;
    float _606 = _548 * _596;
    float _608 = fma(_600, _570, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _610 = fma(_604, _570, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _612 = -_548;
    float _614 = _612 + 1.0;
    float _616 = _588 * _606;
    float _618 = _608 * _606;
    float _620 = _610 * _606;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _634 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[107].x, _618);
    float _636 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[107].y, _616);
    float _638 = fma(_624, _590, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _640 = fma(_628, _590, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _642 = fma(_632, _590, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _644 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[107].z, _620);
    float _646 = fma(_638, _592, _634);
    float _648 = fma(_640, _592, _636);
    float _650 = fma(_642, _592, _644);
    float _652 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[109].x, _646);
    float _654 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[109].y, _648);
    float _656 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[109].z, _650);
    bool _658 = !_552;
    float _676;
    if (!_658)
    {
        float _660 = in.m_49.x;
        float _662 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _664 = _660 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _666 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _668 = _666 * _662;
        float _670 = floor(_668);
        float _672 = -_670;
        float _674 = _668 + _672;
        _676 = _674;
        _678 = true;
    }
    else
    {
        float _680 = float(_90);
        float _682 = 1.0 / _680;
        float _684 = _124 * _682;
        _676 = _684;
    }
    _678 = false;
    float _686 = _676;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _690 = _686 + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _700 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _702 = isnan(_686);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _716 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _718 = isnan(_686);
    bool _720 = _716 || _718;
    bool _722 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _724 = _720 || _722;
    float _726 = float(_724);
    float _728 = 1.0 / _694;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _730;
    float _734 = -_710;
    float _736 = _734 + 1.0;
    bool _738 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _740 = isnan(_686);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    bool _750 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _752 = 1.0 / _698;
    float _754 = 1.0 / _714;
    float _756 = _732 * _728;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _762 = _726 * _736;
    float _764 = -_726;
    float _766 = _764 + 1.0;
    float _768 = fma(_756, _690, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _770;
    float _774 = _748 * _766;
    float _776 = _760 * _752;
    bool _778 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _780 = isnan(_686);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _792 = _686 + _790;
    float _794 = _768 * _774;
    float _796 = -_748;
    float _798 = _796 + 1.0;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _802 = _686 + _800;
    float _804 = fma(_776, _792, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _806 = _772 * _754;
    float _808 = -_788;
    float _810 = _808 + 1.0;
    float _812 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[115].x, _794);
    float _814 = _652 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _816 = fma(_806, _802, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _818 = _710 * _810;
    float _820 = fma(_804, _762, _812);
    float _822 = _656 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _824 = _814 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _826 = fma(_816, _818, _820);
    float _828 = _654 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _830 = _822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _832 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[118].x, _826);
    float _834 = _828 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _836 = _832 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _824;
    out.m_53.y = _834;
    out.m_53.z = _830;
    out.m_53.w = _836;
    bool _838 = !_750;
    float _856;
    if (!_838)
    {
        float _840 = in.m_49.x;
        float _842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _844 = _840 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _846 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _848 = _846 * _842;
        float _850 = floor(_848);
        float _852 = -_850;
        float _854 = _848 + _852;
        _856 = _854;
        _858 = true;
    }
    else
    {
        float _860 = float(_90);
        float _862 = 1.0 / _860;
        float _864 = _124 * _862;
        _856 = _864;
    }
    _858 = false;
    float _866 = _856;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _870 = _866 + _868;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _872;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _878 = _876 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _880;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _884;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _890 = _888 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _892 = 1.0 / _882;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _898;
    float _902 = 1.0 / _874;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _906 = _866 + _904;
    bool _908 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _910 = isnan(_866);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = 1.0 / _878;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _924 = _866 + _922;
    float _926 = _870 * _892;
    bool _928 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _930 = isnan(_866);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _936 = _932 || _934;
    float _938 = float(_936);
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _940;
    bool _944 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _946 = 1.0 / _890;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _950 = _866 + _948;
    float _952 = _924 * _902;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _956 = _866 + _954;
    float _958 = -_938;
    float _960 = _958 + 1.0;
    float _962 = 1.0 / _896;
    float _964 = _950 * _920;
    bool _966 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _968 = isnan(_866);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _974 = _970 || _972;
    float _976 = float(_974);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _978;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _982;
    float _986 = _976 * _960;
    float _988 = 1.0 / _900;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _992 = _866 + _990;
    float _994 = fma(_984, _952, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _996 = _992 * _946;
    bool _998 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1000 = isnan(_866);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    float _1010 = 1.0 / _886;
    float _1012 = _956 * _962;
    float _1014 = -_976;
    float _1016 = _1014 + 1.0;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1018;
    float _1022 = _1008 * _1016;
    float _1024 = fma(_1020, _952, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1026 = _906 * _988;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1030 = _866 + _1028;
    bool _1032 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1034 = isnan(_866);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    float _1044 = -_1042;
    float _1046 = _1044 + 1.0;
    float _1048 = _1030 * _1010;
    float _1050 = -_1008;
    float _1052 = _1050 + 1.0;
    float _1054 = fma(_980, _952, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1056 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1058 = isnan(_866);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1064 = _1060 || _1062;
    float _1066 = float(_1064);
    float _1068 = _918 * _1046;
    float _1070 = _1042 * _1052;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1074 = _1072 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1082 = _1080 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1084 = -_918;
    float _1086 = _1084 + 1.0;
    float _1088 = fma(_1074, _964, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1090 = fma(_1078, _964, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1092 = fma(_1082, _964, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1094 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1096 = isnan(_866);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1102 = _1098 || _1100;
    float _1104 = float(_1102);
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1106;
    bool _1110 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1112 = isnan(_866);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1118 = _1114 || _1116;
    float _1120 = float(_1118);
    float _1122 = _1066 * _1086;
    float _1124 = -_1066;
    float _1126 = _1124 + 1.0;
    float _1128 = fma(_1108, _926, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1130 = -_1120;
    float _1132 = _1130 + 1.0;
    float _1134 = _1120 * _1126;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1136;
    float _1140 = _1104 * _1132;
    float _1142 = -_1104;
    float _1144 = _1142 + 1.0;
    float _1146 = fma(_1138, _926, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1148 = fma(_942, _926, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1150 = _1054 * _1140;
    float _1152 = _1024 * _1140;
    float _1154 = _994 * _1140;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1158 = _1156 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1162 = _1160 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1166 = _1164 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1168 = fma(_1158, _1012, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1170 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1150);
    float _1172 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1152);
    float _1174 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1154);
    float _1176 = fma(_1162, _1012, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1178 = fma(_1166, _1012, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1180;
    float _1184 = fma(_1088, _1134, _1170);
    float _1186 = fma(_1090, _1134, _1172);
    float _1188 = fma(_1092, _1134, _1174);
    float _1190 = fma(_1182, _1048, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1192;
    float _1196 = fma(_1146, _1122, _1184);
    float _1198 = fma(_1128, _1122, _1186);
    float _1200 = fma(_1148, _1122, _1188);
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1204 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1202;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1210 = fma(_1194, _1048, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1212 = fma(_1168, _1068, _1196);
    float _1214 = fma(_1176, _1068, _1198);
    float _1216 = fma(_1178, _1068, _1200);
    float _1218 = fma(_1204, _1048, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1220 = fma(_1208, _996, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1224 = _1222 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1228 = _1226 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1230 = fma(_1218, _1070, _1216);
    float _1232 = fma(_1210, _1070, _1212);
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1234;
    float _1238 = fma(_1224, _996, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1240 = fma(_1190, _1070, _1214);
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1242;
    float _1246 = fma(_1228, _996, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1248;
    float _1252 = fma(_1220, _1022, _1232);
    float _1254 = fma(_1236, _1026, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1256 = fma(_1244, _1026, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1258 = fma(_1238, _1022, _1240);
    float _1260 = fma(_1250, _1026, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1262 = fma(_1246, _1022, _1230);
    float _1264 = fma(_1254, _986, _1252);
    float _1266 = fma(_1256, _986, _1258);
    float _1268 = fma(_1260, _986, _1262);
    float _1270 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1264);
    float _1272 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1266);
    float _1274 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1268);
    bool _1276 = !_944;
    float _1294;
    if (!_1276)
    {
        float _1278 = in.m_49.x;
        float _1280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1282 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1284 = fma(_1282, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _1286 = _1284 * _1280;
        float _1288 = floor(_1286);
        float _1290 = -_1288;
        float _1292 = _1286 + _1290;
        _1294 = _1292;
        _1296 = true;
    }
    else
    {
        float _1298 = float(_90);
        float _1300 = 1.0 / _1298;
        float _1302 = _124 * _1300;
        _1294 = _1302;
    }
    _1296 = false;
    float _1304 = _1294;
    float _1306 = in.m_49.z;
    float _1308 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1310 = log2(_1308);
    float _1312 = in.m_49.x;
    float _1314 = in.m_49.y;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1318 = in.m_42.x;
    float _1320 = in.m_42.y;
    float _1322 = in.m_42.z;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1328 = _1326 != 0;
    int _1330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1332 = _1330 != 0;
    int _1334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1336 = _1334 != 0;
    float _1338 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1340 = int(_1338);
    float _1342 = _568 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1344 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1346 = _1310 * _124;
    float _1348 = _1306 * 2.0;
    float _1350 = float(_1340);
    float _1352 = _1312 * 2.0;
    float _1354 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1356 = floor(_1348);
    float _1358 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1360 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1362 = -_1316;
    float _1364 = fma(_1354, 2.0, _1362);
    float _1366 = _1314 + _1312;
    float _1368 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1370 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1372 = fma(_1318, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1360);
    float _1374 = floor(_1352);
    float _1376 = _1366 + (-1.0);
    float _1378 = _1314 * 2.0;
    float _1380 = fma(_1358, -2.0, _1324);
    float _1382 = fma(_1318, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1370);
    float _1384 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1386 = !_1332;
    int _1388 = _1386 ? 0 : 1;
    float _1390 = fma(_1318, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1368);
    bool _1392 = _1356 > 0.0;
    float _1394 = floor(_1378);
    bool _1396 = _1356 >= 0.0;
    bool _1398 = isnan(_1356);
    bool _1400 = _1396 || _1398;
    bool _1402 = isnan(0.0);
    bool _1404 = _1400 || _1402;
    float _1406 = _1314 + _1306;
    bool _1408 = !_1328;
    int _1410 = _1408 ? 0 : 1;
    float _1412 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1390);
    bool _1414 = !_1336;
    int _1416 = _1414 ? 0 : 1;
    float _1418 = _1406 + (-1.0);
    bool _1420 = _1374 > 0.0;
    float _1422 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1424 = int(_1422);
    int _1426 = _1404 ? 0 : 1;
    float _1428 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1372);
    int _1430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1432 = _1430 != 0;
    int _1434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1436 = _1434 != 0;
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1440 = _1438 != 0;
    float _1442 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1382);
    bool _1444 = _1374 >= 0.0;
    bool _1446 = isnan(_1374);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan(0.0);
    bool _1452 = _1448 || _1450;
    float _1454 = -_124;
    float _1456 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1364);
    int _1458 = ~_1426;
    int _1460 = _1458 + 1;
    int _1462 = _1460 + 1;
    float _1464 = 1.0 / _1350;
    bool _1466 = !_1432;
    int _1468 = _1466 ? 0 : 1;
    float _1470 = _1412 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1472 = _1462;
    if (!_1392)
    {
        int _1474 = ~_1426;
        int _1476 = _1474 + 1;
        _1472 = _1476;
    }
    int _1478 = _1472;
    int _1480 = abs(_1468);
    float _1482 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1484 = _1394 > 0.0;
    bool _1486 = _1394 >= 0.0;
    bool _1488 = isnan(_1394);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan(0.0);
    bool _1494 = _1490 || _1492;
    float _1496 = exp2(_1346);
    float _1498 = float(_1480);
    float _1500 = float(_1478);
    float _1502 = _1464 * _124;
    float _1504 = _1498 * _1500;
    float _1506 = in.m_55.x;
    float _1508 = in.m_55.y;
    float _1510 = in.m_55.z;
    int _1512 = _1452 ? 0 : 1;
    float _1514 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1516 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1518 = isnan(1.0);
    bool _1520 = _1516 || _1518;
    bool _1522 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1524 = _1520 || _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1528 = 1.0 + _1526;
    bool _1530 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1532 = isnan(0.0);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1538 = _1534 || _1536;
    float _1540 = -_1496;
    float _1542 = _1540 + 1.0;
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1546 = 1.0 / _1528;
    float _1548 = float(_1424);
    float _1550 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1514);
    float _1552 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1544);
    float _1554 = _1538 ? _1542 : 0.0;
    float _1556 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1380);
    float _1558 = _1548 * _124;
    float _1560 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1550);
    float _1562 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1552);
    int _1564 = _1494 ? 0 : 1;
    float _1566 = _1428 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1568 = ~_1512;
    int _1570 = _1568 + 1;
    int _1572 = _1570 + 1;
    float _1574 = _1504 * (-2.0);
    int _1576 = _1572;
    float _1578 = _1566;
    if (!_1420)
    {
        int _1580 = ~_1512;
        int _1582 = _1580 + 1;
        _1576 = _1582;
    }
    int _1584 = _1576;
    float _1586 = -_1566;
    float _1588 = _1586 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _1590 = ~_1564;
    int _1592 = _1590 + 1;
    int _1594 = _1592 + 1;
    int _1596 = _1594;
    if (_1524)
    {
        float _1598 = _1554 * _1546;
        _128 = _1598;
    }
    float _1600 = _128;
    bool _1602 = !_1436;
    int _1604 = _1602 ? 0 : 1;
    float _1606 = fma(_1574, _1506, _1506);
    if (!_1484)
    {
        int _1608 = ~_1564;
        int _1610 = _1608 + 1;
        _1596 = _1610;
    }
    int _1612 = _1596;
    float _1614 = fma(_1384, _1574, _1384);
    int _1616 = abs(_1604);
    float _1618 = _1312 + (-0.5);
    float _1620 = _1442 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1622 = float(_1584);
    float _1624 = -_1470;
    float _1626 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1628 = _1588 * _1588;
    float _1630 = float(_1616);
    float _1632 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1606);
    float _1634 = -_1620;
    float _1636 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1638 = fma(_1626, _1626, _1628);
    bool _1640 = !_1440;
    int _1642 = _1640 ? 0 : 1;
    float _1644 = _1630 * _1622;
    float _1646 = fma(_1614, _1600, _1632);
    float _1648 = fma(_1636, _1636, _1638);
    int _1650 = abs(_1642);
    float _1652 = _1644 * (-2.0);
    float _1654 = _1314 + (-0.5);
    float _1656 = float(_1612);
    float _1658 = _1646 * 0.15915493667125701904296875;
    float _1660 = fma(_1652, _1508, _1508);
    float _1662 = float(_1650);
    float _1664 = fma(_1482, _1652, _1482);
    float _1666 = rsqrt(_1648);
    float _1668 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1660);
    float _1670 = _1662 * _1656;
    float _1672 = _1306 + _1312;
    float _1674 = fma(_1664, _1600, _1668);
    float _1676 = in.m_57.x;
    float _1678 = in.m_57.y;
    float _1680 = in.m_57.z;
    float _1682 = _1670 * (-2.0);
    float _1684 = _1672 + (-1.0);
    float _1686 = _1674 * 0.15915493667125701904296875;
    float _1688 = _1658 * 6.283185482025146484375;
    float _1690 = sin(_1688);
    float _1692 = fma(_1682, _1510, _1510);
    float _1694 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1696 = _1306 + (-0.5);
    float _1698 = _1636 * _1666;
    float _1700 = fma(_1694, _1682, _1694);
    float _1702 = fma(_1696, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1692);
    float _1704 = _1588 * _1666;
    float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1708 = _1698 * _1706;
    float _1710 = _1658 * 6.283185482025146484375;
    float _1712 = cos(_1710);
    float _1714 = fma(_1700, _1600, _1702);
    float _1716 = _1626 * _1666;
    float _1718 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1720 = _1704 * _1718;
    float _1722 = _1714 * 0.15915493667125701904296875;
    float _1724 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1726 = _1716 * _1724;
    bool _1728 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1730 = isnan(0.5);
    bool _1732 = _1728 || _1730;
    bool _1734 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1736 = _1732 || _1734;
    float _1738 = _1686 * 6.283185482025146484375;
    float _1740 = sin(_1738);
    bool _1742 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1744 = isnan(0.5);
    bool _1746 = _1742 || _1744;
    bool _1748 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1750 = _1746 || _1748;
    float _1752 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1754 = -_1726;
    float _1756 = fma(_1698, _1752, _1754);
    float _1758 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1676);
    float _1760 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1762 = -_1708;
    float _1764 = fma(_1704, _1760, _1762);
    float _1766 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1678);
    float _1768 = _1756 * _1756;
    float _1770 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1772 = -_1720;
    float _1774 = fma(_1716, _1770, _1772);
    float _1776 = _1686 * 6.283185482025146484375;
    float _1778 = cos(_1776);
    float _1780 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1680);
    float _1782 = fma(_1764, _1764, _1768);
    float _1784 = _562 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1786 = _1342 * _1758;
    float _1788 = fma(_1774, _1774, _1782);
    float _1790 = _1722 * 6.283185482025146484375;
    float _1792 = cos(_1790);
    float _1794 = _1712 * _1740;
    float _1796 = _1690 * _1740;
    float _1798 = _1722 * 6.283185482025146484375;
    float _1800 = sin(_1798);
    float _1802 = _1690 * _1778;
    float _1804 = rsqrt(_1788);
    float _1806 = _1344 * _1766;
    float _1808 = _1740 * _1792;
    float _1810 = _1712 * _1778;
    float _1812 = _1778 * _1792;
    float _1814 = _1784 * _1780;
    float _1816 = _1792 * _1806;
    float _1818 = -_1794;
    float _1820 = fma(_1800, _1802, _1818);
    float _1822 = -_1802;
    float _1824 = fma(_1800, _1794, _1822);
    float _1826 = fma(_1800, _1810, _1796);
    float _1828 = fma(_1800, _1796, _1810);
    float _1830 = _1712 * _1816;
    float _1832 = _1690 * _1816;
    float _1834 = -_1806;
    float _1836 = _1800 * _1834;
    float _1838 = _1764 * _1804;
    float _1840 = fma(_1826, _1786, _1830);
    float _1842 = _1756 * _1804;
    float _1844 = fma(_1812, _1786, _1836);
    float _1846 = _1704 * _1838;
    float _1848 = _1774 * _1804;
    float _1850 = fma(_1824, _1814, _1840);
    float _1852 = _1698 * _1842;
    float _1854 = -_1846;
    float _1856 = fma(_1716, _1842, _1854);
    float _1858 = fma(_1820, _1786, _1832);
    float _1860 = fma(_1808, _1814, _1844);
    float _1862 = -_1852;
    float _1864 = fma(_1704, _1848, _1862);
    float _1866 = _1856 * _1850;
    float _1868 = fma(_1828, _1814, _1858);
    float _1870 = _1566 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1872 = _1864 * _1850;
    float _1874 = fma(_1848, _1860, _1866);
    float _1876 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1870);
    float _1878 = fma(_1838, _1860, _1872);
    float _1880 = fma(_1698, _1868, _1874);
    float _1882 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1876);
    float _1884 = fma(_1716, _1868, _1878);
    float _1886 = _1620 + _1880;
    float _1888 = _1716 * _1848;
    float _1890 = _1882 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1892 = _1470 + _1884;
    float _1894 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1896 = _1886 + _1894;
    float _1898 = _1566 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1900 = 1.0 / _1890;
    float _1902 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1904 = _1892 + _1902;
    float _1906 = _1896 * _1896;
    float _1908 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1898);
    float _1910 = -_1888;
    float _1912 = fma(_1698, _1838, _1910);
    float _1914 = fma(_1904, _1904, _1906);
    float _1916 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1908);
    float _1918 = _1912 * _1850;
    float _1920 = sqrt(_1914);
    float _1922 = _1916 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1924 = fma(_1842, _1860, _1918);
    float _1926 = _1922 + _1890;
    float _1928 = fma(_1704, _1868, _1924);
    float _1930 = _1926 * _1900;
    float _1932 = _1930 * 0.5;
    float _1934 = _1566 + _1928;
    float _1936 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1938 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1936);
    bool _1940 = _1920 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1942 = 1.0 / _1938;
    float _1944 = _1848;
    float _1946 = _1850;
    float _1948 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1950 = _1868;
    float _1952 = _1914;
    float _1954 = _1920;
    float _1956 = _1904;
    float _1958 = _1886;
    if (!_1940)
    {
        _1944 = _1892;
    }
    float _1960 = _1944;
    float _1962 = _1960;
    if (!_1940)
    {
        _1946 = _1886;
    }
    float _1964 = _1946;
    float _1966 = _1964;
    if (!_1940)
    {
        _1948 = _1934;
    }
    float _1968 = _1948;
    bool _1970 = !_1940;
    float _1972 = _1968;
    if (!_1970)
    {
        float _1974 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1976 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1978 = _1920 + _1976;
        float _1980 = _1934 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1982 = rsqrt(_1914);
        float _1984 = _1978 * _1974;
        float _1986 = _1984 * 0.15915493667125701904296875;
        float _1988 = _1986 * 6.283185482025146484375;
        float _1990 = cos(_1988);
        float _1992 = _1986 * 6.283185482025146484375;
        float _1994 = sin(_1992);
        float _1996 = _1990 + (-1.0);
        float _1998 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2000 = fma(_1994, _1980, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2002 = fma(_1934, _1990, _1998);
        float _2004 = _1982 * _2000;
        float _2006 = fma(_1904, _2004, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2008 = fma(_1896, _2004, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1962 = _2006;
        _1972 = _2002;
        _1950 = _1986;
        _1966 = _2008;
        _1952 = _1982;
        _1954 = _1978;
    }
    float _2010 = _1962;
    float _2012 = _1972;
    float _2014 = _1950;
    float _2016 = _1966;
    float _2018 = _1952;
    float _2020 = _1954;
    float _2022 = _2020;
    float _2024 = _2016;
    float _2026 = _2014;
    float _2028 = _2012;
    float _2030 = _2016;
    float _2032 = _2018;
    if (_1750)
    {
        _2022 = 1.0;
    }
    float _2034 = _2022;
    float _2036 = _2034;
    if (_1736)
    {
        _1956 = _2010;
    }
    float _2038 = _1956;
    float _2040 = _2038;
    if (!_1736)
    {
        float _2042 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2044 = _1566 + _2042;
        float _2046 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2048 = _1470 + _2046;
        float _2050 = -_1470;
        float _2052 = _2050 + _2010;
        float _2054 = -_1566;
        float _2056 = _2054 + _2012;
        float _2058 = _2044 * _2044;
        float _2060 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2062 = _1620 + _2060;
        float _2064 = fma(_2048, _2048, _2058);
        float _2066 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2068 = fma(_2062, _2062, _2064);
        float _2070 = sqrt(_2068);
        float _2072 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _2074 = _2070 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _2076 = isnan(_2070);
        bool _2078 = _2074 || _2076;
        bool _2080 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _2082 = _2078 || _2080;
        float _2084 = precise::min(_2070, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2086 = _2084 * _2066;
        float _2088 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2090 = _2088 * _2086;
        float _2092 = _2014;
        float _2094 = _2066;
        float _2096 = _2088;
        if (_2082)
        {
            float _2098 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _2092 = _2098;
        }
        float _2100 = _2092;
        if (_2082)
        {
            float _2102 = precise::max(_2070, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _2094 = _2102;
        }
        float _2104 = _2094;
        float _2106 = -_1620;
        float _2108 = _2106 + _2016;
        float _2110 = fma(_2052, _2090, _1470);
        float _2112 = fma(_2056, _2090, _1566);
        float _2114 = _2110;
        float _2116 = _2112;
        _2026 = _2100;
        if (_2082)
        {
            float _2118 = _2104 * _2100;
            _2024 = _2118;
        }
        float _2120 = _2024;
        float _2122 = fma(_2108, _2090, _1620);
        float _2124 = _2120;
        _2032 = _2122;
        if (_2082)
        {
            float _2126 = _2088 * _2120;
            _2096 = _2126;
        }
        float _2128 = _2096;
        if (!_2082)
        {
            _2124 = _2122;
        }
        float _2130 = _2124;
        _2030 = _2130;
        if (_2082)
        {
            float _2132 = fma(_2052, _2128, _1470);
            _2114 = _2132;
        }
        float _2134 = _2114;
        _2040 = _2134;
        if (_2082)
        {
            float _2136 = fma(_2056, _2128, _1566);
            _2116 = _2136;
        }
        float _2138 = _2116;
        _2028 = _2138;
        if (_2082)
        {
            float _2140 = fma(_2108, _2128, _1620);
            _2030 = _2140;
        }
    }
    float _2142 = _2026;
    float _2144 = _2028;
    float _2146 = _2040;
    float _2148 = _2030;
    float _2150 = _2032;
    float _2152 = _2142;
    float _2154 = _2150;
    if (_1750)
    {
        _1578 = 1.0;
    }
    float _2156 = _1578;
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2160 = _1942 * _2158;
    float _2162 = _2156;
    if (!_1750)
    {
        float _2164 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2166 = _2164 * 0.15915493667125701904296875;
        float _2168 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2170 = _2166 * 6.283185482025146484375;
        float _2172 = cos(_2170);
        float _2174 = _2168 * 0.15915493667125701904296875;
        float _2176 = _2166 * 6.283185482025146484375;
        float _2178 = sin(_2176);
        float _2180 = 1.0 / _2172;
        float _2182 = _2174 * 6.283185482025146484375;
        float _2184 = cos(_2182);
        float _2186 = _2178 * _2180;
        float _2188 = _2174 * 6.283185482025146484375;
        float _2190 = sin(_2188);
        float _2192 = _2184 * _2186;
        float _2194 = 1.0 / _2192;
        float _2196 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2198 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2196;
        float _2200 = 1.0 / _2198;
        float _2202 = _2190 * _2194;
        float _2204 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2206 = fma(_2160, _2202, _2204);
        float _2208 = _2206 * _2200;
        float _2210 = precise::clamp(_2208, 0.0, 1.0);
        _2152 = _2206;
        _2154 = _2174;
        _2036 = _2210;
    }
    float _2212 = _2152;
    float _2214 = _2154;
    float _2216 = _2036;
    float _2218 = _2212;
    float _2220 = _2214;
    if (!_1750)
    {
        float _2222 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2224 = _2222 * 0.15915493667125701904296875;
        float _2226 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2228 = _2224 * 6.283185482025146484375;
        float _2230 = cos(_2228);
        float _2232 = _2226 * 0.15915493667125701904296875;
        float _2234 = _2224 * 6.283185482025146484375;
        float _2236 = sin(_2234);
        float _2238 = 1.0 / _2230;
        float _2240 = _2232 * 6.283185482025146484375;
        float _2242 = cos(_2240);
        float _2244 = _2236 * _2238;
        float _2246 = _2232 * 6.283185482025146484375;
        float _2248 = sin(_2246);
        float _2250 = _2242 * _2244;
        float _2252 = 1.0 / _2250;
        float _2254 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2256 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2254;
        float _2258 = 1.0 / _2256;
        float _2260 = _2248 * _2252;
        float _2262 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2264 = fma(_2160, _2260, _2262);
        float _2266 = _2264 * _2258;
        float _2268 = precise::clamp(_2266, 0.0, 1.0);
        float _2270 = -_2268;
        float _2272 = _2270 + 1.0;
        _2218 = _2238;
        _2220 = _2252;
        _2162 = _2272;
    }
    float _2274 = _2218;
    float _2276 = _2220;
    float _2278 = _2162;
    float _2280 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2282 = _2144 + _2280;
    float _2284 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2286 = _2146 + _2284;
    float _2288 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2290 = _2148 + _2288;
    float _2292 = _2282 * _2282;
    float _2294 = fma(_2286, _2286, _2292);
    float _2296 = fma(_2290, _2290, _2294);
    float _2298 = rsqrt(_2296);
    float _2300 = sqrt(_2296);
    float _2302 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2304 = _2286 * _2302;
    float _2306 = _2290 * _2302;
    float _2308 = _2304 * _2304;
    float _2310 = _2306 * _2306;
    float _2312 = _2308 + _2310;
    float _2314 = sqrt(_2312);
    bool _2316 = _2314 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2320 = _2314 + _2318;
    float _2322 = _2290;
    float _2324 = _2292;
    float _2326 = _2320;
    float _2328 = _2274;
    float _2330 = _2302;
    if (_2316)
    {
        float _2332 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2322 = _2332;
    }
    float _2334 = _2322;
    if (_2316)
    {
        float _2336 = rsqrt(_2312);
        _2324 = _2336;
    }
    float _2338 = _2324;
    float _2340 = _2338;
    if (_2316)
    {
        float _2342 = _2320 * _2334;
        _2326 = _2342;
    }
    float _2344 = _2326;
    if (_2316)
    {
        float _2346 = _2344 * 0.15915493667125701904296875;
        _2328 = _2346;
    }
    float _2348 = _2328;
    float _2350 = _2298;
    float _2352 = _2348;
    if (_2316)
    {
        float _2354 = _2348 * 6.283185482025146484375;
        float _2356 = sin(_2354);
        _2350 = _2356;
    }
    float _2358 = _2350;
    float _2360 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2362 = precise::max(0.0, _2360);
    float _2364 = _2276;
    float _2366 = _2362;
    float _2368 = _2360;
    if (_2316)
    {
        float _2370 = _2348 * 6.283185482025146484375;
        float _2372 = cos(_2370);
        _2364 = _2372;
    }
    float _2374 = _2364;
    float _2376 = -_2302;
    float _2378 = -_2362;
    float _2380 = fma(_2282, _2376, _2378);
    if (_2316)
    {
        float _2382 = _2380 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2366 = _2382;
    }
    float _2384 = _2366;
    float _2386 = _2384;
    if (!_2316)
    {
        _2352 = _2308;
    }
    float _2388 = _2352;
    float _2390 = _2358;
    float _2392 = _2388;
    if (_2316)
    {
        float _2394 = fma(_2358, _2384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2390 = _2394;
    }
    float _2396 = _2390;
    float _2398 = _2396;
    if (!_2316)
    {
        _2386 = _2306;
    }
    float _2400 = _2386;
    float _2402 = _2400;
    if (_2316)
    {
        float _2404 = _2374 + (-1.0);
        _2368 = _2404;
    }
    float _2406 = _2368;
    float _2408 = _2406;
    if (_2316)
    {
        float _2410 = _2338 * _2396;
        _1958 = _2410;
    }
    float _2412 = _1958;
    if (!_2316)
    {
        _2340 = _2304;
    }
    float _2414 = _2340;
    float _2416 = _2414;
    if (_2316)
    {
        float _2418 = _2406 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2330 = _2418;
    }
    float _2420 = _2330;
    if (_2316)
    {
        float _2422 = _2304 * _2412;
        _2416 = _2422;
    }
    float _2424 = _2416;
    if (!_2316)
    {
        _2398 = _2380;
    }
    float _2426 = _2398;
    float _2428 = _2426;
    if (_2316)
    {
        float _2430 = _2306 * _2412;
        _2402 = _2430;
    }
    float _2432 = _2402;
    if (_2316)
    {
        float _2434 = fma(_2380, _2374, _2420);
        _2428 = _2434;
    }
    float _2436 = _2428;
    if (_2316)
    {
        float _2438 = _2424 * _2424;
        _2392 = _2438;
    }
    float _2440 = _2392;
    if (!_2316)
    {
        _2408 = _2310;
    }
    float _2442 = _2408;
    float _2444 = _2442;
    if (_2316)
    {
        float _2446 = _2432 * _2432;
        _2444 = _2446;
    }
    float _2448 = _2444;
    float _2450 = fma(_2436, _2436, _2440);
    float _2452 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2454 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2456 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2458 = _2450 + _2448;
    float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2462 = fma(_2300, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2460);
    float _2464 = precise::clamp(_2462, 0.0, 1.0);
    float _2466 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2468 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2470 = rsqrt(_2458);
    float _2472 = -_2464;
    float _2474 = _2472 + 1.0;
    float _2476 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2466);
    float _2478 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2454);
    float _2480 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2456);
    float _2482 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2468);
    float _2484 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2476);
    float _2486 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2478);
    float _2488 = abs(_2474);
    float _2490 = log2(_2488);
    float _2492 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2480);
    float _2494 = _2484 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2496 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2482);
    float _2498 = _2486 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2500 = _2492 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2502 = _2494 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2504 = _2470 * _2424;
    float _2506 = _2470 * _2436;
    float _2508 = _2470 * _2432;
    float _2510 = fma(_2498, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2502);
    float _2512 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2514 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2516 = _2496 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2518 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2510);
    float _2520 = -_2512;
    float _2522 = fma(_2506, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2520);
    float _2524 = -_2514;
    float _2526 = fma(_2524, _2452, 1.0);
    float _2528 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2530 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2518);
    float _2532 = -_2508;
    float _2534 = fma(_2532, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2522);
    float _2536 = _2494 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2538 = exp2(_2528);
    float _2540 = _2494 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2542 = fma(_2534, -0.5, 0.5);
    float _2544 = fma(_2534, 0.5, 0.5);
    float _2546 = fma(_2498, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2536);
    float _2548 = fma(_2498, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2540);
    float _2550 = _2506 + 1.0;
    float _2552 = fma(_2544, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2554 = log2(_2526);
    float _2556 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2546);
    float _2558 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2548);
    float _2560 = fma(_2544, _2552, -0.212114393711090087890625);
    float _2562 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2556);
    float _2564 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2558);
    float _2566 = fma(_2544, _2560, 1.570728778839111328125);
    float _2568 = 1.0 / _2530;
    float _2570 = -_2506;
    float _2572 = fma(_2538, _2550, _2570);
    float _2574 = fma(_2572, 0.5, 0.5);
    float _2576 = sqrt(_2542);
    float _2578 = _2554 * 0.693147182464599609375;
    float _2580 = _2578 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2582 = _2562 * _2568;
    float _2584 = _2564 * _2568;
    float _2586 = fma(_2582, 0.5, 0.5);
    float _2588 = fma(_2584, -0.5, 0.5);
    float _2590 = _2576 * 0.636619746685028076171875;
    float _2592 = -_2566;
    float _2594 = fma(_2590, _2592, 1.0);
    float3 _7527 = float3(_2586, _2588, _2580);
    float _2596 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7527, float3(0.0), isnan(_7527)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7527, float3(0.0), isnan(_7527)), level(0.0)).x;
    float3 _7538 = float3(_2586, _2588, _2580);
    float4 _2599 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7538, float3(0.0), isnan(_7538)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7538, float3(0.0), isnan(_7538)), level(0.0)).xyzw;
    float _2601 = _2599.x;
    float _2603 = _2599.y;
    float _2605 = _2599.z;
    float _2607 = _2599.w;
    float2 _7555 = float2(_2594, _2574);
    float3 _2611 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7555, float2(0.0), isnan(_7555)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7555, float2(0.0), isnan(_7555)), level(0.0)).xyz;
    float _2613 = _2611.x;
    float _2615 = _2611.y;
    float _2617 = _2611.z;
    float _2619 = float(uint(_1424));
    float _2621 = trunc(_1502);
    int _2623 = int(_2621);
    int _2625 = ~_1424;
    int _2627 = _2625 + 1;
    float _2629 = _2494 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2631 = abs(_1416);
    float _2633 = fma(_2498, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2629);
    float _2635 = 1.0 / _2619;
    float _2637 = float(uint(_2623));
    int _2639 = ~_1424;
    int _2641 = _2639 + 1;
    int _2643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2645 = _2643 != 0;
    int _2647 = as_type<int>(_2635) + (-2);
    float _2649 = as_type<float>(_2647) * _2637;
    bool _2651 = !_2645;
    float _2653 = _2651 ? 7.345489978790283203125 : 1.0;
    float _2655 = trunc(_2649);
    float _2657 = precise::max(_2655, 0.0);
    uint _2660 = uint(_2657);
    float _2662 = _2653 * _1312;
    float _2664 = floor(_2662);
    float _2666 = float(_90);
    float _2668 = float(_2623);
    bool _2670 = _2668 >= _1548;
    bool _2672 = isnan(_2668);
    bool _2674 = _2670 || _2672;
    bool _2676 = isnan(_1548);
    bool _2678 = _2674 || _2676;
    float _2680 = float(_2678);
    int _2682 = _2627 * int(_2660);
    int _2684 = _2682 + _2623;
    float _2686 = 1.0 / _2666;
    float _2688 = float(uint(_2684));
    float _2690 = -_2664;
    float _2692 = _2662 + _2690;
    float _2694 = trunc(_2680);
    int _2696 = int(_2694);
    float _2698 = as_type<float>(_2647) * _2688;
    float _2700 = _2692 * _1548;
    float _2702 = trunc(_2698);
    float _2704 = precise::max(_2702, 0.0);
    uint _2706 = uint(_2704);
    float _2708 = _1558 * _2686;
    int _2710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2712 = _2710 != 0;
    float _2714 = trunc(_2700);
    int _2716 = int(_2714);
    int _2718 = ~_2696;
    int _2720 = _2718 + 1;
    int _2722 = _2720 + 1;
    int _2724 = int(_2660) + int(_2706);
    float _2726 = trunc(_2708);
    int _2728 = int(_2726);
    int _2730 = _2641 * _2724;
    int _2732 = _2730 + _2623;
    bool _2734 = uint(_2732) >= uint(_1424);
    int _2736 = ~_1424;
    int _2738 = _2736 + 1;
    bool _2740 = !_2734;
    int _2742 = _2740 ? 0 : (-1);
    bool _2744 = _1424 == 0;
    int _2746 = ~_2724;
    int _2748 = _2746 + _2742;
    int _2750 = _2748 + 1;
    int _2752 = _1424 + (-1);
    int _2754 = _1424 * _2750;
    int _2756 = _2754 + _2623;
    bool _2758 = !_2712;
    int _2760 = _2758 ? 0 : 1;
    int _2762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2764 = _2762 != 0;
    bool _2766 = !_2744;
    int _2768 = _2766 ? _2756 : (-1);
    int _2770 = abs(_2760);
    int _2772 = abs(_1388);
    int _2774 = _2768 * _2722;
    int _2776 = abs(_1410);
    int _2778 = ~_1424;
    int _2780 = _2778 + 1;
    int _2782 = _2696 * _2752;
    int _2784 = _2782 + _2774;
    bool _2786 = !_2764;
    int _2788 = _2786 ? 0 : 1;
    int _2790 = _2784 * _2772;
    int _2792 = ~_1424;
    int _2794 = _2792 + 1;
    int _2796 = _2716 * _2770;
    int _2798 = _2796 + _2623;
    int _2800 = abs(_2788);
    int _2802 = _2728 * _2776;
    int _2804 = _2802 + _2790;
    int _2806 = _2798 * _2631;
    int _2808 = _2806 + _2804;
    int _2810 = _2716 * _2800;
    int _2812 = _2810 + _2808;
    float _2814 = float(uint(_2812));
    float _2816 = as_type<float>(_2647) * _2814;
    float _2818 = trunc(_2816);
    float _2820 = precise::max(_2818, 0.0);
    uint _2822 = uint(_2820);
    int _2824 = _2794 * int(_2822);
    int _2826 = _2824 + _2812;
    float _2828 = float(uint(_2826));
    float _2830 = as_type<float>(_2647) * _2828;
    float _2832 = trunc(_2830);
    float _2834 = precise::max(_2832, 0.0);
    uint _2836 = uint(_2834);
    int _2838 = int(_2822) + int(_2836);
    int _2840 = ~_1424;
    int _2842 = _2840 + 1;
    int _2844 = _2780 * _2838;
    int _2846 = _2844 + _2812;
    bool _2848 = uint(_2846) >= uint(_1424);
    float _2850 = float(uint(_2798));
    bool _2852 = !_2848;
    int _2854 = _2852 ? 0 : (-1);
    float _2856 = as_type<float>(_2647) * _2850;
    int _2858 = ~_2838;
    int _2860 = _2858 + _2854;
    int _2862 = _2860 + 1;
    float _2864 = trunc(_2856);
    float _2866 = precise::max(_2864, 0.0);
    uint _2868 = uint(_2866);
    int _2870 = _1424 * _2862;
    int _2872 = _2870 + _2812;
    bool _2874 = !_2744;
    int _2876 = _2874 ? _2872 : (-1);
    int _2878 = _2876 >> 31;
    int _2880 = _2876 & 3;
    bool _2882 = _2880 != 0;
    int _2884 = _2878 & 3;
    int _2886 = _2842 * int(_2868);
    int _2888 = _2886 + _2798;
    int _2890 = _2876 + _2884;
    float _2892 = float(uint(_2888));
    int _2894 = _2890 >> 2;
    float _2896 = as_type<float>(_2647) * _2892;
    int _2898 = _2894 << 4;
    int _2900 = _2898 + 368;
    int _2902 = _2876 & 3;
    bool _2904 = _2902 != 0;
    uint _2906 = uint(int(uint(_2900) >> uint(2)));
    uint _2908 = uint(int(uint(int(_2906)) >> uint(2)));
    int _2910 = int(_2906) & 3;
    float _2912 = (*spvDescriptorSet0.vp_c9)._m0[int(_2908)][_2910];
    int _2914 = int(_2906) + 1;
    uint _2916 = uint(int(uint(_2914) >> uint(2)));
    int _2918 = _2914 & 3;
    float _2920 = (*spvDescriptorSet0.vp_c9)._m0[int(_2916)][_2918];
    float _2922 = trunc(_2896);
    float _2924 = precise::max(_2922, 0.0);
    uint _2926 = uint(_2924);
    bool _2928 = uint(_2902) > 1u;
    int _2930 = _2882 ? 0 : 1;
    int _2932 = _2900 + 8;
    uint _2934 = uint(int(uint(_2932) >> uint(2)));
    uint _2936 = uint(int(uint(int(_2934)) >> uint(2)));
    int _2938 = int(_2934) & 3;
    float _2940 = (*spvDescriptorSet0.vp_c9)._m0[int(_2936)][_2938];
    int _2942 = int(_2934) + 1;
    uint _2944 = uint(int(uint(_2942) >> uint(2)));
    int _2946 = _2942 & 3;
    float _2948 = (*spvDescriptorSet0.vp_c9)._m0[int(_2944)][_2946];
    int _2950 = ~_2930;
    int _2952 = _2950 + 1;
    int _2954 = _2952 + 1;
    int _2956 = _2954;
    if (!_2928)
    {
        int _2958 = ~_2930;
        int _2960 = _2958 + 1;
        _2956 = _2960;
    }
    int _2962 = _2956;
    bool _2964 = !_2904;
    int _2966 = _2964 ? 0 : 1;
    int _2968 = int(_2868) + int(_2926);
    bool _2970 = _2902 != 3;
    int _2972 = abs(_2962);
    int _2974 = _2738 * _2968;
    int _2976 = _2974 + _2798;
    int _2978 = abs(_2966);
    float _2980 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2982 = int(_2980);
    bool _2984 = uint(_2902) >= 2u;
    int _2986 = ~_2972;
    int _2988 = _2986 + 1;
    int _2990 = _2988 + 1;
    int _2992 = _2984 ? 0 : 1;
    bool _2994 = uint(_2976) >= uint(_1424);
    int _2996 = ~_2992;
    int _2998 = _2996 + 1;
    int _3000 = _2998 + 1;
    int _3002 = _3000;
    if (_2970)
    {
        int _3004 = ~_2992;
        int _3006 = _3004 + 1;
        _3002 = _3006;
    }
    int _3008 = _3002;
    int _3010 = ~_2978;
    int _3012 = _3010 + 1;
    int _3014 = _3012 + 1;
    int _3016 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3018 = _3016 != 0;
    bool _3020 = _2902 != 3;
    bool _3022 = !_2994;
    int _3024 = _3022 ? 0 : (-1);
    int _3026 = _2990 * as_type<int>(_2920);
    bool _3028 = !_3018;
    int _3030 = _3028 ? 0 : 1;
    int _3032 = abs(_2982);
    int _3034 = _3014 * as_type<int>(_2912);
    int _3036 = _3034 + _3026;
    bool _3038 = !_3020;
    int _3040 = _3038 ? 0 : (-1);
    int _3042 = abs(_3008);
    int _3044 = ~_2968;
    int _3046 = _3044 + _3024;
    int _3048 = _3046 + 1;
    float _3050 = in.m_59.z;
    int _3052 = abs(_3030);
    int _3054 = _1424 * _3048;
    int _3056 = _3054 + _2798;
    int _3058 = abs(_3040);
    float _3060 = in.m_59.w;
    int _3062 = ~_3042;
    int _3064 = _3062 + 1;
    int _3066 = _3064 + 1;
    float _3068 = float(uint(_2982));
    float _3070 = in.m_59.y;
    float _3072 = float(uint(_3032));
    int _3074 = _3066 * as_type<int>(_2940);
    int _3076 = _3074 + _3036;
    int _3078 = ~_3058;
    int _3080 = _3078 + 1;
    int _3082 = _3080 + 1;
    int _3084 = ~_3052;
    int _3086 = _3084 + 1;
    int _3088 = _3086 + 1;
    float _3090 = 1.0 / _3068;
    bool _3092 = !_2744;
    int _3094 = _3092 ? _3056 : (-1);
    int _3096 = _3082 * as_type<int>(_2948);
    int _3098 = _3096 + _3076;
    int _3100 = ~_3032;
    int _3102 = _3100 + 1;
    int _3104 = _3098 * _3088;
    int _3106 = ~_2982;
    int _3108 = _3106 + 1;
    float _3110 = 1.0 / _3072;
    int _3112 = _3094 * _3052;
    int _3114 = _3112 + _3104;
    int _3116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _3118 = _3116 != 0;
    float _3120 = in.m_59.x;
    int _3122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3124 = _3122 != 0;
    int _3126 = abs(_3114);
    out.m_61.w = _3060;
    int _3128 = as_type<int>(_3090) + (-2);
    float _3130 = float(uint(_3114));
    out.m_61.z = _3050;
    bool _3132 = _1314 > 0.5;
    float _3134 = as_type<float>(_3128) * _3130;
    int _3136 = as_type<int>(_3110) + (-2);
    out.m_61.y = _3070;
    float _3138 = float(uint(_3126));
    float _3140 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3142 = _3140 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _3144 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _3146 = _3144 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3148 = trunc(_3134);
    float _3150 = precise::max(_3148, 0.0);
    uint _3152 = uint(_3150);
    float _3154 = as_type<float>(_3136) * _3138;
    float _3156 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _3158 = _3156 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    out.m_61.x = _3120;
    float _3160 = trunc(_3154);
    float _3162 = precise::max(_3160, 0.0);
    uint _3164 = uint(_3162);
    float _3166 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _3168 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _3166;
    float _3170 = 1.0 / _3158;
    int _3172 = _3108 * int(_3152);
    int _3174 = _3172 + _3114;
    float _3176 = float(uint(_3174));
    int _3178 = _3102 * int(_3164);
    int _3180 = _3178 + _3126;
    float _3182 = 1.0 / _3146;
    float _3184 = as_type<float>(_3128) * _3176;
    float _3186 = float(uint(_3180));
    float _3188 = _3168 * _3170;
    float _3190 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _3192 = _1304 + _3190;
    float _3194 = 1.0 / _3142;
    float _3196 = as_type<float>(_3136) * _3186;
    bool _3198 = _1304 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _3200 = isnan(_1304);
    bool _3202 = _3198 || _3200;
    bool _3204 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _3206 = _3202 || _3204;
    float _3208 = float(_3206);
    float _3210 = fma(_3188, _3192, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _3212 = _1304 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _3214 = isnan(_1304);
    bool _3216 = _3212 || _3214;
    bool _3218 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _3220 = _3216 || _3218;
    float _3222 = float(_3220);
    float _3224 = in.m_63.y;
    bool _3226 = _1304 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3228 = isnan(_1304);
    bool _3230 = _3226 || _3228;
    bool _3232 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3234 = _3230 || _3232;
    float _3236 = float(_3234);
    float _3238 = -_3208;
    float _3240 = _3238 + 1.0;
    float _3242 = trunc(_3184);
    float _3244 = precise::max(_3242, 0.0);
    uint _3246 = uint(_3244);
    float _3248 = -_3222;
    float _3250 = _3248 + 1.0;
    float _3252 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _3254 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _3252;
    float _3256 = _3236 * _3240;
    float _3258 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _3260 = _3258 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _3262 = _3208 * _3250;
    bool _3264 = _1304 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _3266 = isnan(_1304);
    bool _3268 = _3264 || _3266;
    bool _3270 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _3272 = _3268 || _3270;
    float _3274 = float(_3272);
    float _3276 = _3210 * _3256;
    float _3278 = trunc(_3196);
    float _3280 = precise::max(_3278, 0.0);
    uint _3282 = uint(_3280);
    float _3284 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _3286 = _1304 + _3284;
    float _3288 = _3254 * _3194;
    float _3290 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3292 = _1304 + _3290;
    float _3294 = -_3274;
    float _3296 = _3294 + 1.0;
    float _3298 = (*spvDescriptorSet0.vp_c9)._m0[132].x;
    if (_3118)
    {
        float _3300 = in.m_49.x;
        _3298 = _3300;
    }
    float _3302 = _3298;
    float _3304 = _3260 * _3182;
    float _3306 = -_3236;
    float _3308 = _3306 + 1.0;
    float _3310 = fma(_3288, _3292, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _3312 = ~_2982;
    int _3314 = _3312 + 1;
    float _3316 = _3222 * _3296;
    float _3318 = fma(_3304, _3286, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _3320 = int(_3152) + int(_3246);
    float _3322 = fma(_3308, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3276);
    int _3324 = ~_3032;
    int _3326 = _3324 + 1;
    float _3328 = -_3224;
    float _3330 = _3328 + 1.0;
    int _3332 = int(_3164) + int(_3282);
    float _3334 = fma(_3318, _3262, _3322);
    float _3336 = in.m_63.x;
    int _3338 = _3326 * _3332;
    int _3340 = _3338 + _3126;
    float _3342 = _3224;
    float _3344 = as_type<float>(_3320);
    if (_3124)
    {
        float _3346 = _3132 ? _3330 : _3224;
        _3342 = _3346;
    }
    float _3348 = _3342;
    int _3350 = _3314 * _3320;
    int _3352 = _3350 + _3114;
    float _3354 = fma(_3310, _3316, _3334);
    float _3356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3358 = uint(_3340) >= uint(_3032);
    bool _3360 = uint(_3352) >= uint(_2982);
    float _3362 = fma(_3274, (*spvDescriptorSet0.vp_c9)._m0[134].x, _3354);
    bool _3364 = !_3358;
    int _3366 = _3364 ? 0 : (-1);
    bool _3368 = _3302 > 0.5;
    bool _3370 = _3368 && _3118;
    float _3372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3374 = ~_3366;
    int _3376 = _3332 + _3374;
    int _3378 = _3376 + 1;
    float _3380 = _1270 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3382 = _1272 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3384 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _3386 = !_3360;
    int _3388 = _3386 ? 0 : (-1);
    float _3390 = _3380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3392 = _3114 ^ _2982;
    float _3394 = _3382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3396 = ~_3320;
    int _3398 = _3396 + _3388;
    int _3400 = _3398 + 1;
    float _3402 = _3384 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _3404 = uint(int(uint(_3392) >> uint(31)));
    float _3406 = _3336;
    if (_3118)
    {
        _3344 = _3336;
    }
    float _3408 = _3344;
    int _3410 = _2982 * _3400;
    int _3412 = _3410 + _3114;
    int _3414 = ~int(_3404);
    int _3416 = _3414 + 1;
    float _3418 = _3362 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _3420 = _2982 == 0;
    float _3422 = _3408;
    if (_3370)
    {
        float _3424 = -_3408;
        float _3426 = _3424 + 1.0;
        _3422 = _3426;
    }
    float _3428 = _3422;
    bool _3430 = _2982 == 0;
    int _3432 = _3378 ^ _3416;
    float _3434 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2633);
    bool _3436 = !_3420;
    int _3438 = _3436 ? _3412 : (-1);
    float _3440 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _3442 = ~_3416;
    int _3444 = _3442 + _3432;
    int _3446 = _3444 + 1;
    float _3448 = _3356 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3450 = float(_3438);
    float _3452 = _3372 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3454 = !_3430;
    int _3456 = _3454 ? _3446 : (-1);
    float _3458 = exp2(_3440);
    if (_3118)
    {
        _3406 = _3428;
    }
    float _3460 = _3406;
    out.m_65.x = _3390;
    out.m_65.y = _3394;
    out.m_65.z = _3402;
    out.m_65.w = _3418;
    float _3462 = float(_3456);
    float _3464 = _2216 * _2278;
    bool _3466 = _2216 > 0.0;
    bool _3468 = isnan(_2216);
    bool _3470 = _3466 || _3468;
    bool _3472 = isnan(0.0);
    bool _3474 = _3470 || _3472;
    float _3476 = fma(_3452, _3348, -0.5);
    float _3478 = fma(_3448, _3460, -0.5);
    float _3480 = _3464 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3482 = -_1556;
    float _3484 = fma(_3452, _3462, _3482);
    float _3486 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3434);
    float _3488 = fma(_3448, _3450, _1456);
    bool _3490 = _2278 <= 0.0;
    bool _3492 = !_3474;
    bool _3494 = _3490 || _3492;
    float _3496 = fma(_1562, _3476, _3484);
    float _3498 = _3486 + _2530;
    float _3500 = fma(_1560, _3478, _3488);
    float _3502 = -_3458;
    float _3504 = _3502 + 1.0;
    float _3506 = _3480 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3508 = _3498 * 0.5;
    float _3510 = _3504 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3512 = _3500 + 0.5;
    out.gl_Position.x = _2562;
    out.gl_Position.y = _2564;
    out.gl_Position.z = _3486;
    out.gl_Position.w = _2530;
    float _3514 = _3510 * _2596;
    float _3516 = -_3510;
    float _3518 = _3516 + 1.0;
    float _3520 = _3496 + 0.5;
    out.m_45.x = _3506;
    float _3522 = _2607 * _3514;
    float _3524 = _2617 * _3514;
    float _3526 = _2607 * _3518;
    out.m_67.z = _3508;
    out.m_67.w = _2530;
    float _3528 = fma(_2613, _3522, _2601);
    float _3530 = fma(_2615, _3522, _2603);
    float _3532 = fma(_2607, _3524, _2605);
    out.m_69.x = _3512;
    out.m_69.y = _3520;
    out.m_71.x = _3528;
    out.m_71.y = _3530;
    out.m_71.z = _3532;
    out.m_71.w = _3526;
    if (!_3494)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3534 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3534;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

