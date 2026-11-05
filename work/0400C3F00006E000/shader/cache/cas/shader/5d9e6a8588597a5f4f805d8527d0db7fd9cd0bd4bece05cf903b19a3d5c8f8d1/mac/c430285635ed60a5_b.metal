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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
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
    float4 m_65 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_67 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_61 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_59 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1782 = false;
    bool _892 = false;
    bool _636 = false;
    bool _414 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2446 = as_type<float>(_106);
        out.gl_Position.z = _2446;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_49.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2516 = as_type<float>(_144);
        out.gl_Position.z = _2516;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_51.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
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
    float _286;
    if (!_268)
    {
        float _270 = in.m_53.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_90);
        float _292 = 1.0 / _290;
        float _294 = _124 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _296 + _298;
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    float _318 = -_312;
    float _320 = _318 + 1.0;
    bool _322 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _324 = isnan(_296);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = 1.0 / _316;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _340;
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _346 = _300 * _334;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _348;
    float _352 = in.m_51.x;
    float _354 = in.m_51.y;
    float _356 = in.m_51.z;
    float _358 = _332 * _320;
    float _360 = fma(_338, _346, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _362 = fma(_350, _346, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _364 = fma(_342, _346, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _366 = -_332;
    float _368 = _366 + 1.0;
    float _370 = _360 * _358;
    float _372 = _362 * _358;
    float _374 = _364 * _358;
    float _376 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].x, _370);
    float _378 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].y, _372);
    float _380 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].z, _374);
    float _382 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].x, _376);
    float _384 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].y, _378);
    float _386 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].z, _380);
    float _388 = _382 * _352;
    float _390 = _384 * _354;
    float _392 = _386 * _356;
    bool _394 = !_344;
    float _412;
    if (!_394)
    {
        float _396 = in.m_53.x;
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _400 = _396 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _404 = _402 * _398;
        float _406 = floor(_404);
        float _408 = -_406;
        float _410 = _404 + _408;
        _412 = _410;
        _414 = true;
    }
    else
    {
        float _416 = float(_90);
        float _418 = 1.0 / _416;
        float _420 = _124 * _418;
        _412 = _420;
    }
    _414 = false;
    float _422 = _412;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _426 = _422 + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _430 = _422 + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _434 = _422 + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _448 = 1.0 / _438;
    bool _450 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _452 = 1.0 / _446;
    bool _454 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _456 = isnan(_422);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = 1.0 / _442;
    float _468 = _426 * _448;
    bool _470 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _472 = isnan(_422);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    bool _482 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _484 = isnan(_422);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = -_480;
    float _496 = _494 + 1.0;
    float _498 = _430 * _452;
    bool _500 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _502 = isnan(_422);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _512;
    float _516 = _464 * _496;
    float _518 = -_464;
    float _520 = _518 + 1.0;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _526 = -_510;
    float _528 = _526 + 1.0;
    float _530 = _434 * _466;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _536;
    float _540 = _492 * _528;
    float _542 = fma(_514, _530, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _544 = fma(_534, _530, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _546 = fma(_538, _530, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _548 = _510 * _520;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _554 = _544 * _540;
    float _556 = _546 * _540;
    float _558 = _542 * _540;
    float _560 = -_492;
    float _562 = _560 + 1.0;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _568 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[107].x, _554);
    float _570 = fma(_552, _498, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _572;
    float _576 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[107].y, _556);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _578;
    float _582 = fma(_524, _498, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _584 = fma(_566, _498, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _586 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[107].z, _558);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _588;
    float _592 = fma(_580, _468, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _594 = fma(_570, _548, _576);
    float _596 = fma(_582, _548, _568);
    float _598 = fma(_574, _468, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _600 = fma(_590, _468, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _602 = fma(_584, _548, _586);
    float _604 = fma(_592, _516, _594);
    float _606 = fma(_598, _516, _596);
    float _608 = fma(_600, _516, _602);
    float _610 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[110].y, _604);
    float _612 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[110].x, _606);
    float _614 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[110].z, _608);
    bool _616 = !_450;
    float _634;
    if (!_616)
    {
        float _618 = in.m_53.x;
        float _620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _622 = _618 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _626 = _624 * _620;
        float _628 = floor(_626);
        float _630 = -_628;
        float _632 = _626 + _630;
        _634 = _632;
        _636 = true;
    }
    else
    {
        float _638 = float(_90);
        float _640 = 1.0 / _638;
        float _642 = _124 * _640;
        _634 = _642;
    }
    _636 = false;
    float _644 = _634;
    float _646 = _612 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _648 = _610 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _654 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _656 = isnan(_644);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _666;
    float _670 = 1.0 / _652;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _674 = _672 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _676 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _678 = isnan(_644);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = -_664;
    float _690 = _688 + 1.0;
    bool _692 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _694 = isnan(_644);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _708 = -_686;
    float _710 = _708 + 1.0;
    float _712 = 1.0 / _674;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _716 = _644 + _714;
    float _718 = _702 * _710;
    float _720 = _614 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _722 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _724 = _668 * _670;
    float _726 = _686 * _690;
    bool _728 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _730 = isnan(_644);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = -_702;
    float _742 = _740 + 1.0;
    float _744 = 1.0 / _706;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _750 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _752 = isnan(_644);
    bool _754 = _750 || _752;
    bool _756 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _758 = _754 || _756;
    float _760 = float(_758);
    float _762 = -_738;
    float _764 = _762 + 1.0;
    float _766 = _738 * _742;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _770 = _768 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _772 = fma(_724, _716, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _778 = 1.0 / _748;
    float _780 = _760 * _764;
    float _782 = _776 * _712;
    float _784 = -_760;
    float _786 = _784 + 1.0;
    float _788 = _772 * _780;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _792 = _644 + _790;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _798 = 1.0 / _770;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _800;
    float _804 = fma(_782, _792, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _806 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[115].x, _788);
    float _808 = _802 * _744;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _812 = _644 + _810;
    bool _814 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _816 = isnan(_644);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = _796 * _778;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _828;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _834 = _644 + _832;
    float _836 = fma(_808, _812, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _838 = fma(_804, _766, _806);
    float _840 = -_824;
    float _842 = _840 + 1.0;
    float _844 = fma(_826, _834, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _848 = _644 + _846;
    float _850 = _830 * _798;
    float _852 = fma(_836, _718, _838);
    float _854 = _664 * _842;
    float _856 = _648 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _858 = fma(_850, _848, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _860 = fma(_844, _726, _852);
    float _862 = _720 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _864 = fma(_858, _854, _860);
    float _866 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[120].x, _864);
    float _868 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _870 = _866 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _868;
    out.m_55.y = _856;
    out.m_55.z = _862;
    out.m_55.w = _870;
    bool _872 = !_722;
    float _890;
    if (!_872)
    {
        float _874 = in.m_53.x;
        float _876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _878 = _874 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _880 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _882 = _880 * _876;
        float _884 = floor(_882);
        float _886 = -_884;
        float _888 = _882 + _886;
        _890 = _888;
        _892 = true;
    }
    else
    {
        float _894 = float(_90);
        float _896 = 1.0 / _894;
        float _898 = _124 * _896;
        _890 = _898;
    }
    _892 = false;
    float _900 = _890;
    float _902 = in.m_53.z;
    float _904 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _906 = log2(_904);
    float _908 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _910 = in.m_53.x;
    float _912 = in.m_53.y;
    float _914 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _918 = _916 != 0;
    float _920 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _924 = _922 != 0;
    float _926 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _908);
    float _928 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _914);
    float _930 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _920);
    float _932 = _392 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _934 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _936 = isnan(0.0);
    bool _938 = _934 || _936;
    bool _940 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _942 = _938 || _940;
    float _944 = _388 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _946 = _906 * _124;
    float _948 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _926);
    bool _950 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _952 = isnan(1.0);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _958 = _954 || _956;
    float _960 = exp2(_946);
    float _962 = _390 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _964 = _902 * 2.0;
    float _966 = _912 * 2.0;
    float _968 = floor(_964);
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _974 = 1.0 + _972;
    float _976 = 1.0 / _974;
    float _978 = -_960;
    float _980 = _978 + 1.0;
    float _982 = _910 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _984 = _942 ? _980 : 0.0;
    float _986 = -_970;
    float _988 = fma(_982, 2.0, _986);
    bool _990 = _968 >= 0.0;
    bool _992 = isnan(_968);
    bool _994 = _990 || _992;
    bool _996 = isnan(0.0);
    bool _998 = _994 || _996;
    float _1000 = _912 + _910;
    float _1002 = _912 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1006 = _1004 != 0;
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1010 = _1008 != 0;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1014 = _1012 != 0;
    float _1016 = _910 * 2.0;
    int _1018 = _998 ? 0 : 1;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1022 = _968 > 0.0;
    float _1024 = floor(_1016);
    float _1026 = _1000 + (-1.0);
    float _1028 = fma(_1002, -2.0, _1020);
    int _1030 = ~_1018;
    int _1032 = _1030 + 1;
    int _1034 = _1032 + 1;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1038 = !_1010;
    int _1040 = _1038 ? 0 : 1;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1044 = floor(_966);
    float _1046 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1036);
    float _1048 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1050 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1042);
    float _1052 = -_124;
    float _1054 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[76].x, _988);
    float _1056 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1046);
    float _1058 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1028);
    float _1060 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1050);
    int _1062 = _1034;
    if (_958)
    {
        float _1064 = _984 * _976;
        _126 = _1064;
    }
    float _1066 = _126;
    bool _1068 = !_1006;
    int _1070 = _1068 ? 0 : 1;
    float _1072 = in.m_57.x;
    float _1074 = in.m_57.y;
    float _1076 = in.m_57.z;
    bool _1078 = _1024 > 0.0;
    float _1080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_1022)
    {
        int _1082 = ~_1018;
        int _1084 = _1082 + 1;
        _1062 = _1084;
    }
    int _1086 = _1062;
    bool _1088 = !_1014;
    int _1090 = _1088 ? 0 : 1;
    int _1092 = abs(_1070);
    bool _1094 = _1024 >= 0.0;
    bool _1096 = isnan(_1024);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan(0.0);
    bool _1102 = _1098 || _1100;
    bool _1104 = _1044 > 0.0;
    bool _1106 = _1044 >= 0.0;
    bool _1108 = isnan(_1044);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan(0.0);
    bool _1114 = _1110 || _1112;
    int _1116 = abs(_1040);
    int _1118 = abs(_1090);
    float _1120 = float(_1092);
    float _1122 = float(_1086);
    int _1124 = _1102 ? 0 : 1;
    float _1126 = _1120 * _1122;
    int _1128 = ~_1124;
    int _1130 = _1128 + 1;
    int _1132 = _1130 + 1;
    int _1134 = _1114 ? 0 : 1;
    float _1136 = _1126 * (-2.0);
    int _1138 = _1132;
    if (!_1078)
    {
        int _1140 = ~_1124;
        int _1142 = _1140 + 1;
        _1138 = _1142;
    }
    int _1144 = _1138;
    int _1146 = ~_1134;
    int _1148 = _1146 + 1;
    int _1150 = _1148 + 1;
    float _1152 = fma(_1136, _1072, _1072);
    int _1154 = _1150;
    if (!_1104)
    {
        int _1156 = ~_1134;
        int _1158 = _1156 + 1;
        _1154 = _1158;
    }
    int _1160 = _1154;
    float _1162 = in.m_59.y;
    float _1164 = float(_1144);
    float _1166 = fma(_1048, _1136, _1048);
    float _1168 = float(_1116);
    float _1170 = in.m_61.x;
    float _1172 = in.m_61.y;
    float _1174 = in.m_61.z;
    float _1176 = float(_1118);
    float _1178 = _910 + (-0.5);
    float _1180 = float(_1160);
    float _1182 = _1168 * _1164;
    float _1184 = _902 + _910;
    bool _1186 = _912 > 0.5;
    float _1188 = _1176 * _1180;
    float _1190 = _1182 * (-2.0);
    float _1192 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1152);
    float _1194 = _1188 * (-2.0);
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1196;
    float _1200 = fma(_1166, _1066, _1192);
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1206 = fma(_1194, _1076, _1076);
    float _1208 = _912 + _902;
    float _1210 = fma(_1190, _1074, _1074);
    float _1212 = _912 + (-0.5);
    float _1214 = 1.0 / _1204;
    float _1216 = _1208 + (-1.0);
    float _1218 = _1200 * 0.15915493667125701904296875;
    float _1220 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1210);
    float _1222 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1172);
    float _1224 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1226 = -_1162;
    float _1228 = _1226 + 1.0;
    float _1230 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1170);
    float _1232 = _1184 + (-1.0);
    float _1234 = 1.0 / _1198;
    float _1236 = _1162;
    if (_924)
    {
        float _1238 = _1186 ? _1228 : _1162;
        _1236 = _1238;
    }
    float _1240 = _1236;
    float _1242 = _902 + (-0.5);
    float _1244 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1246 = fma(_1224, _1190, _1224);
    float _1248 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1174);
    float _1250 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1206);
    float _1252 = fma(_1244, _1194, _1244);
    float _1254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1256 = fma(_1246, _1066, _1220);
    float _1258 = _932 * _1248;
    float _1260 = fma(_1252, _1066, _1250);
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1264 = _900 + _1262;
    float _1266 = _1256 * 0.15915493667125701904296875;
    float _1268 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _928);
    float _1270 = _1260 * 0.15915493667125701904296875;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1274 = _900 + _1272;
    float _1276 = _1218 * 6.283185482025146484375;
    float _1278 = sin(_1276);
    float _1280 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _930);
    float _1282 = _944 * _1230;
    float _1284 = _1264 * _1234;
    float _1286 = _1274 * _1214;
    float _1288 = _962 * _1222;
    float _1290 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1292 = _1218 * 6.283185482025146484375;
    float _1294 = cos(_1292);
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1298 = _900 + _1296;
    float _1300 = fma(_1290, _1240, -0.5);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1302;
    float _1306 = _1190;
    float _1308 = _1268;
    if (_918)
    {
        float _1310 = in.m_53.x;
        _1306 = _1310;
    }
    float _1312 = _1306;
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1314;
    float _1318 = -_1058;
    float _1320 = fma(_1060, _1300, _1318);
    float _1322 = _1266 * 6.283185482025146484375;
    float _1324 = sin(_1322);
    float _1326 = _1280 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1328 = fma(_1316, _1284, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1330;
    float _1334 = _1266 * 6.283185482025146484375;
    float _1336 = cos(_1334);
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1338;
    float _1342 = fma(_1332, _1284, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1344 = _1270 * 6.283185482025146484375;
    float _1346 = cos(_1344);
    float _1348 = _1294 * _1324;
    float _1350 = _1278 * _1324;
    bool _1352 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1354 = isnan(_900);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1360 = _1356 || _1358;
    float _1362 = float(_1360);
    bool _1364 = _1312 > 0.5;
    bool _1366 = _1364 && _918;
    float _1368 = _1270 * 6.283185482025146484375;
    float _1370 = sin(_1368);
    float _1372 = _1278 * _1336;
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1374;
    float _1378 = _1324 * _1346;
    float _1380 = _1294 * _1336;
    float _1382 = _1346 * _1288;
    float _1384 = _1336 * _1346;
    float _1386 = 1.0 / _1304;
    float _1388 = _1294 * _1382;
    float _1390 = _1278 * _1382;
    float _1392 = -_1348;
    float _1394 = fma(_1370, _1372, _1392);
    float _1396 = -_1372;
    float _1398 = fma(_1370, _1348, _1396);
    float _1400 = fma(_1370, _1380, _1350);
    float _1402 = -_1288;
    float _1404 = _1370 * _1402;
    float _1406 = fma(_1370, _1350, _1380);
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1410 = _1408 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1412 = fma(_1400, _1282, _1388);
    float _1414 = fma(_1384, _1282, _1404);
    float _1416 = fma(_1394, _1282, _1390);
    float _1418 = _948 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1420 = fma(_1398, _1258, _1412);
    float _1422 = fma(_1378, _1258, _1414);
    float _1424 = fma(_1406, _1258, _1416);
    float _1426 = _1298 * _1386;
    float _1428 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1430 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1432 = in.m_59.x;
    float _1434 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1428);
    float _1436 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1430);
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1440 = _1438 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1442;
    float _1446 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1434);
    float _1448 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1436);
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1452 = _1450 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1454 = fma(_1444, _1284, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1456 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1458 = _1448 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _1460 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1462 = isnan(_900);
    bool _1464 = _1460 || _1462;
    bool _1466 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1468 = _1464 || _1466;
    float _1470 = float(_1468);
    float _1472 = fma(_1452, _1286, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1474 = _1418 + _1456;
    float _1476 = _1326 + _1458;
    float _1478 = fma(_1410, _1286, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1480 = fma(_1440, _1286, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1482 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1484 = _1474 + _1482;
    float _1486 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1488 = _1476 + _1486;
    bool _1490 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1492 = isnan(_900);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1498 = _1494 || _1496;
    float _1500 = float(_1498);
    float _1502 = -_1470;
    float _1504 = _1502 + 1.0;
    float _1506 = _1484 * _1484;
    float _1508 = _1488 * _1488;
    float _1510 = fma(_1340, _1426, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1512 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1514 = isnan(_900);
    bool _1516 = _1512 || _1514;
    bool _1518 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1520 = _1516 || _1518;
    float _1522 = float(_1520);
    float _1524 = _1506 + _1508;
    float _1526 = _1500 * _1504;
    float _1528 = -_1500;
    float _1530 = _1528 + 1.0;
    float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1532;
    float _1536 = sqrt(_1524);
    float _1538 = -_1522;
    float _1540 = _1538 + 1.0;
    float _1542 = _1522 * _1530;
    float _1544 = fma(_1534, _1426, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1546 = fma(_1376, _1426, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1548 = 0.0;
    float _1550 = _1432;
    float _1552 = _1454;
    float _1554 = _1506;
    float _1556 = _1508;
    float _1558 = _1328;
    float _1560 = _1470;
    if (_918)
    {
        _1548 = _1432;
    }
    float _1562 = _1548;
    float _1564 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1566 = _1362 * _1540;
    float _1568 = -_1362;
    float _1570 = _1568 + 1.0;
    float _1572 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1564);
    float _1574 = _1562;
    if (_1366)
    {
        float _1576 = -_1562;
        float _1578 = _1576 + 1.0;
        _1574 = _1578;
    }
    float _1580 = _1574;
    float _1582 = _1454 * _1566;
    float _1584 = _1328 * _1566;
    float _1586 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1572);
    float _1588 = _1268 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1590 = _1536 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1592 = _1342 * _1566;
    float _1594 = _1586 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1596 = _1592;
    if (_918)
    {
        _1550 = _1580;
    }
    float _1598 = _1550;
    float _1600 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1602 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1582);
    float _1604 = _1588 + _1594;
    float _1606 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1584);
    float _1608 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1592);
    float _1610 = fma(_1600, _1598, -0.5);
    float _1612 = fma(_1472, _1542, _1602);
    if (!_1590)
    {
        _1308 = _1474;
    }
    float _1614 = _1308;
    float _1616 = _1614;
    if (!_1590)
    {
        _1552 = _1476;
    }
    float _1618 = _1552;
    float _1620 = _1618;
    if (!_1590)
    {
        _1596 = _1604;
    }
    float _1622 = _1596;
    bool _1624 = !_1590;
    float _1626 = _1622;
    if (!_1624)
    {
        float _1628 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1630 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1632 = _1536 + _1630;
        float _1634 = _1604 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1636 = rsqrt(_1524);
        float _1638 = _1632 * _1628;
        float _1640 = _1638 * 0.15915493667125701904296875;
        float _1642 = _1640 * 6.283185482025146484375;
        float _1644 = sin(_1642);
        float _1646 = _1640 * 6.283185482025146484375;
        float _1648 = cos(_1646);
        float _1650 = fma(_1644, _1634, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1652 = _1636 * _1650;
        float _1654 = fma(_1484, _1652, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1656 = _1648 + (-1.0);
        float _1658 = fma(_1488, _1652, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1660 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1662 = _1654 + _1660;
        float _1664 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1666 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1668 = _1658 + _1666;
        float _1670 = _1662 * _1662;
        float _1672 = fma(_1604, _1648, _1664);
        float _1674 = _1668 * _1668;
        _1626 = _1672;
        _1554 = _1670;
        _1556 = _1674;
        _1616 = _1654;
        _1620 = _1658;
        _1558 = _1664;
    }
    float _1676 = _1626;
    float _1678 = _1554;
    float _1680 = _1556;
    float _1682 = _1616;
    float _1684 = _1620;
    float _1686 = _1558;
    float _1688 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1690 = _1676 + _1688;
    float _1692 = fma(_1478, _1542, _1606);
    float _1694 = fma(_1480, _1542, _1608);
    float _1696 = fma(_1544, _1526, _1612);
    float _1698 = fma(_1690, _1690, _1678);
    float _1700 = fma(_1546, _1526, _1692);
    float _1702 = fma(_1510, _1526, _1694);
    float _1704 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1696);
    float _1706 = _1698 + _1680;
    float _1708 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1700);
    float _1710 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1702);
    float _1712 = _1320 + 0.5;
    float _1714 = fma(_1056, _1610, _1054);
    float _1716 = sqrt(_1706);
    float _1718 = _1704 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1720 = _1708 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1722 = _1710 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1724 = _1714 + 0.5;
    float _1726 = _1718 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1728 = _1720 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1730 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _1724;
    out.m_63.y = _1712;
    out.m_65.x = _1726;
    out.m_65.y = _1728;
    out.m_65.z = _1730;
    bool _1732 = _1716 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1734 = isnan(_1716);
    bool _1736 = _1732 || _1734;
    bool _1738 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1740 = _1736 || _1738;
    float _1742 = _1676;
    float _1744 = _1686;
    float _1746 = _1728;
    if (!_1740)
    {
        _1560 = 1.0;
    }
    float _1748 = _1560;
    bool _1750 = !_1740;
    float _1752 = _1748;
    if (!_1750)
    {
        bool _1754 = _1716 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1756 = isnan(_1716);
        bool _1758 = _1754 || _1756;
        bool _1760 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1762 = _1758 || _1760;
        if (!_1762)
        {
            float _1764 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1766 = _1716 + _1764;
            float _1768 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1770 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1768;
            float _1772 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1774 = _1772 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1776 = 1.0 / _1770;
            float _1778 = _1766 * _1776;
            float _1780 = fma(_1778, _1774, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1752 = _1780;
            _1782 = true;
        }
        else
        {
            bool _1784 = _1716 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1786 = isnan(_1716);
            bool _1788 = _1784 || _1786;
            bool _1790 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1792 = _1788 || _1790;
            if (!_1792)
            {
                float _1794 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1796 = _1716 + _1794;
                float _1798 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1800 = _1798 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1802 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1804 = _1802 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1806 = 1.0 / _1800;
                float _1808 = _1796 * _1806;
                float _1810 = fma(_1808, _1804, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1752 = _1810;
                _1782 = true;
            }
            else
            {
                _1752 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1782 = false;
    float _1812 = _1752;
    float _1814 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1816 = _1676 + _1814;
    float _1818 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1820 = _1682 + _1818;
    float _1822 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1824 = _1684 + _1822;
    float _1826 = fma(_1816, _1812, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1828 = fma(_1820, _1812, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1830 = fma(_1824, _1812, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1832 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1834 = _1826 + _1832;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1838 = _1828 + _1836;
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1842 = _1830 + _1840;
    float _1844 = _1834 * _1834;
    float _1846 = fma(_1838, _1838, _1844);
    float _1848 = fma(_1842, _1842, _1846);
    float _1850 = rsqrt(_1848);
    float _1852 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1854 = _1838 * _1852;
    float _1856 = _1842 * _1852;
    float _1858 = _1854 * _1854;
    float _1860 = _1856 * _1856;
    float _1862 = _1858 + _1860;
    float _1864 = sqrt(_1862);
    bool _1866 = _1864 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1868 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1870 = _1864 + _1868;
    float _1872 = _1842;
    float _1874 = _1870;
    float _1876 = _1834;
    if (_1866)
    {
        float _1878 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1872 = _1878;
    }
    float _1880 = _1872;
    if (_1866)
    {
        float _1882 = rsqrt(_1862);
        _1742 = _1882;
    }
    float _1884 = _1742;
    float _1886 = _1884;
    if (_1866)
    {
        float _1888 = _1870 * _1880;
        _1874 = _1888;
    }
    float _1890 = _1874;
    if (_1866)
    {
        float _1892 = _1890 * 0.15915493667125701904296875;
        _1744 = _1892;
    }
    float _1894 = _1744;
    float _1896 = _1850;
    if (_1866)
    {
        float _1898 = _1894 * 6.283185482025146484375;
        float _1900 = sin(_1898);
        _1896 = _1900;
    }
    float _1902 = _1896;
    float _1904 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1906 = precise::max(0.0, _1904);
    float _1908 = _1846;
    float _1910 = _1906;
    float _1912 = _1904;
    if (_1866)
    {
        float _1914 = _1894 * 6.283185482025146484375;
        float _1916 = cos(_1914);
        _1908 = _1916;
    }
    float _1918 = _1908;
    float _1920 = -_1852;
    float _1922 = -_1906;
    float _1924 = fma(_1834, _1920, _1922);
    if (!_1866)
    {
        _1910 = _1858;
    }
    float _1926 = _1910;
    float _1928 = _1926;
    if (_1866)
    {
        float _1930 = _1924 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1912 = _1930;
    }
    float _1932 = _1912;
    float _1934 = sqrt(_1848);
    float _1936 = _1902;
    float _1938 = _1932;
    if (_1866)
    {
        float _1940 = fma(_1902, _1932, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1876 = _1940;
    }
    float _1942 = _1876;
    float _1944 = _1942;
    if (!_1866)
    {
        _1936 = _1854;
    }
    float _1946 = _1936;
    float _1948 = _1946;
    float _1950 = _1918;
    if (_1866)
    {
        float _1952 = _1918 + (-1.0);
        _1938 = _1952;
    }
    float _1954 = _1938;
    float _1956 = _1954;
    if (_1866)
    {
        float _1958 = _1884 * _1942;
        _1746 = _1958;
    }
    float _1960 = _1746;
    if (!_1866)
    {
        _1944 = _1924;
    }
    float _1962 = _1944;
    float _1964 = _1962;
    if (_1866)
    {
        float _1966 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1886 = _1966;
    }
    float _1968 = _1886;
    if (_1866)
    {
        float _1970 = _1854 * _1960;
        _1948 = _1970;
    }
    float _1972 = _1948;
    if (!_1866)
    {
        _1956 = _1856;
    }
    float _1974 = _1956;
    float _1976 = _1974;
    if (_1866)
    {
        float _1978 = _1856 * _1960;
        _1976 = _1978;
    }
    float _1980 = _1976;
    if (_1866)
    {
        float _1982 = fma(_1924, _1918, _1968);
        _1964 = _1982;
    }
    float _1984 = _1964;
    if (_1866)
    {
        float _1986 = _1972 * _1972;
        _1928 = _1986;
    }
    float _1988 = _1928;
    if (!_1866)
    {
        _1950 = _1860;
    }
    float _1990 = _1950;
    float _1992 = _1990;
    if (_1866)
    {
        float _1994 = _1980 * _1980;
        _1992 = _1994;
    }
    float _1996 = _1992;
    float _1998 = fma(_1984, _1984, _1988);
    float _2000 = _1998 + _1996;
    float _2002 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2004 = fma(_1934, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2002);
    float _2006 = precise::clamp(_2004, 0.0, 1.0);
    float _2008 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2010 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2012 = rsqrt(_2000);
    float _2014 = -_2006;
    float _2016 = _2014 + 1.0;
    float _2018 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2008);
    float _2020 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2010);
    float _2022 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2024 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2026 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2018);
    float _2028 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2030 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2020);
    float _2032 = abs(_2016);
    float _2034 = log2(_2032);
    float _2036 = _2026 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2038 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2028);
    float _2040 = _2030 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2042 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2022);
    float _2044 = _2036 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2046 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2038);
    float _2048 = _2012 * _1972;
    float _2050 = _2012 * _1984;
    float _2052 = _2012 * _1980;
    float _2054 = _2046 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2056 = _2048 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2058 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2060 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2042);
    float _2062 = -_2044;
    float _2064 = fma(_2062, _2024, 1.0);
    float _2066 = -_2056;
    float _2068 = fma(_2050, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2066);
    float _2070 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2058);
    float _2072 = _2060 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2074 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2076 = -_2052;
    float _2078 = fma(_2076, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2068);
    float _2080 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2070);
    float _2082 = log2(_2064);
    float _2084 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2086 = fma(_2078, -0.5, 0.5);
    float _2088 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2080);
    float _2090 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2092 = fma(_2078, 0.5, 0.5);
    float _2094 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2084);
    float _2096 = _2050 + 1.0;
    float _2098 = exp2(_2074);
    float _2100 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2090);
    float _2102 = fma(_2092, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2104 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2094);
    float _2106 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2100);
    float _2108 = fma(_2092, _2102, -0.212114393711090087890625);
    float _2110 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2104);
    float _2112 = 1.0 / _2088;
    float _2114 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2106);
    float _2116 = _2082 * 0.693147182464599609375;
    float _2118 = fma(_2092, _2108, 1.570728778839111328125);
    float _2120 = sqrt(_2086);
    float _2122 = -_2050;
    float _2124 = fma(_2098, _2096, _2122);
    float _2126 = fma(_2124, 0.5, 0.5);
    float _2128 = _2110 * _2112;
    float _2130 = _2114 * _2112;
    float _2132 = _2116 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2134 = fma(_2128, 0.5, 0.5);
    float _2136 = fma(_2130, -0.5, 0.5);
    float _2138 = _2120 * 0.636619746685028076171875;
    float _2140 = -_2118;
    float _2142 = fma(_2138, _2140, 1.0);
    float3 _5710 = float3(_2134, _2136, _2132);
    float _2144 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5710, float3(0.0), isnan(_5710)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5710, float3(0.0), isnan(_5710)), level(0.0)).x;
    float3 _5721 = float3(_2134, _2136, _2132);
    float4 _2147 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5721, float3(0.0), isnan(_5721)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5721, float3(0.0), isnan(_5721)), level(0.0)).xyzw;
    float _2149 = _2147.x;
    float _2151 = _2147.y;
    float _2153 = _2147.z;
    float _2155 = _2147.w;
    float2 _5738 = float2(_2142, _2126);
    float3 _2159 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5738, float2(0.0), isnan(_5738)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5738, float2(0.0), isnan(_5738)), level(0.0)).xyz;
    float _2161 = _2159.x;
    float _2163 = _2159.y;
    float _2165 = _2159.z;
    float _2167 = _1588 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2169 = _1588 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2171 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2167);
    float _2173 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2169);
    float _2175 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2171);
    float _2177 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2173);
    float _2179 = _2175 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2181 = _2177 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2183 = 1.0 / _2179;
    float _2185 = _2181 + _2179;
    float _2187 = _2185 * _2183;
    float _2189 = _2187 * 0.5;
    float _2191 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2193 = fma(_2189, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2191);
    float _2195 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2197 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2199 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2201 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2203 = _2199 || _2201;
    bool _2205 = isnan(0.5);
    bool _2207 = _2203 || _2205;
    float _2209 = 1.0 / _2193;
    float _2211 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2195);
    float _2213 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2211);
    float _2215 = exp2(_2197);
    float _2217 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2213);
    float _2219 = _2211;
    float _2221 = _2036;
    if (_2207)
    {
        _2219 = 1.0;
    }
    float _2223 = _2219;
    float _2225 = _2223;
    if (_2207)
    {
        _2221 = 1.0;
    }
    float _2227 = _2221;
    float _2229 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2231 = _2209 * _2229;
    float _2233 = _2227;
    if (!_2207)
    {
        float _2235 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2237 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2239 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2237;
        float _2241 = _2235 * 0.15915493667125701904296875;
        float _2243 = _2241 * 6.283185482025146484375;
        float _2245 = cos(_2243);
        float _2247 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2249 = _2247 * 0.15915493667125701904296875;
        float _2251 = _2241 * 6.283185482025146484375;
        float _2253 = sin(_2251);
        float _2255 = 1.0 / _2245;
        float _2257 = _2249 * 6.283185482025146484375;
        float _2259 = cos(_2257);
        float _2261 = _2253 * _2255;
        float _2263 = _2249 * 6.283185482025146484375;
        float _2265 = sin(_2263);
        float _2267 = _2259 * _2261;
        float _2269 = 1.0 / _2239;
        float _2271 = 1.0 / _2267;
        float _2273 = _2265 * _2271;
        float _2275 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2277 = fma(_2231, _2273, _2275);
        float _2279 = _2277 * _2269;
        float _2281 = precise::clamp(_2279, 0.0, 1.0);
        _2225 = _2281;
    }
    float _2283 = _2225;
    if (!_2207)
    {
        float _2285 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2287 = _2285 * 0.15915493667125701904296875;
        float _2289 = _2287 * 6.283185482025146484375;
        float _2291 = cos(_2289);
        float _2293 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2295 = _2293 * 0.15915493667125701904296875;
        float _2297 = _2287 * 6.283185482025146484375;
        float _2299 = sin(_2297);
        float _2301 = 1.0 / _2291;
        float _2303 = _2295 * 6.283185482025146484375;
        float _2305 = cos(_2303);
        float _2307 = _2299 * _2301;
        float _2309 = _2295 * 6.283185482025146484375;
        float _2311 = sin(_2309);
        float _2313 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2315 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2313;
        float _2317 = _2305 * _2307;
        float _2319 = 1.0 / _2315;
        float _2321 = 1.0 / _2317;
        float _2323 = _2311 * _2321;
        float _2325 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2327 = fma(_2231, _2323, _2325);
        float _2329 = _2327 * _2319;
        float _2331 = precise::clamp(_2329, 0.0, 1.0);
        float _2333 = -_2331;
        float _2335 = _2333 + 1.0;
        _2233 = _2335;
    }
    float _2337 = _2233;
    float _2339 = _2283 * _2337;
    float _2341 = -_2215;
    float _2343 = _2341 + 1.0;
    bool _2345 = _2283 > 0.0;
    bool _2347 = isnan(_2283);
    bool _2349 = _2345 || _2347;
    bool _2351 = isnan(0.0);
    bool _2353 = _2349 || _2351;
    float _2355 = _2217 + _2088;
    float _2357 = _2339 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2359 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2361 = _2337 <= 0.0;
    bool _2363 = !_2353;
    bool _2365 = _2361 || _2363;
    out.m_67.x = _1828;
    out.m_67.y = _1826;
    out.m_67.z = _1830;
    float _2367 = _2359 * _2144;
    float _2369 = -_2359;
    float _2371 = _2369 + 1.0;
    out.gl_Position.x = _2110;
    out.gl_Position.y = _2114;
    out.gl_Position.z = _2217;
    out.gl_Position.w = _2088;
    float _2373 = _2355 * 0.5;
    float _2375 = _2155 * _2367;
    float _2377 = _2165 * _2367;
    float _2379 = _2357 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.z = _2373;
    out.m_69.w = _2088;
    float _2381 = fma(_2161, _2375, _2149);
    float _2383 = fma(_2163, _2375, _2151);
    float _2385 = _2155 * _2371;
    float _2387 = fma(_2155, _2377, _2153);
    out.m_47.x = _2379;
    out.m_71.x = _2381;
    out.m_71.y = _2383;
    out.m_71.z = _2387;
    out.m_71.w = _2385;
    if (!_2365)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2389 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2389;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1782 = false;
    bool _892 = false;
    bool _636 = false;
    bool _414 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2446 = as_type<float>(_106);
        out.gl_Position.z = _2446;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_49.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2516 = as_type<float>(_144);
        out.gl_Position.z = _2516;
    }
    if (_136)
    {
        return out;
    }
    float _146 = in.m_51.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
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
    float _286;
    if (!_268)
    {
        float _270 = in.m_53.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_90);
        float _292 = 1.0 / _290;
        float _294 = _124 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _296 + _298;
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    float _318 = -_312;
    float _320 = _318 + 1.0;
    bool _322 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _324 = isnan(_296);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = 1.0 / _316;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _340;
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _346 = _300 * _334;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _348;
    float _352 = in.m_51.x;
    float _354 = in.m_51.y;
    float _356 = in.m_51.z;
    float _358 = _332 * _320;
    float _360 = fma(_338, _346, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _362 = fma(_350, _346, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _364 = fma(_342, _346, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _366 = -_332;
    float _368 = _366 + 1.0;
    float _370 = _360 * _358;
    float _372 = _362 * _358;
    float _374 = _364 * _358;
    float _376 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].x, _370);
    float _378 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].y, _372);
    float _380 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].z, _374);
    float _382 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].x, _376);
    float _384 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].y, _378);
    float _386 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].z, _380);
    float _388 = _382 * _352;
    float _390 = _384 * _354;
    float _392 = _386 * _356;
    bool _394 = !_344;
    float _412;
    if (!_394)
    {
        float _396 = in.m_53.x;
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _400 = _396 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _404 = _402 * _398;
        float _406 = floor(_404);
        float _408 = -_406;
        float _410 = _404 + _408;
        _412 = _410;
        _414 = true;
    }
    else
    {
        float _416 = float(_90);
        float _418 = 1.0 / _416;
        float _420 = _124 * _418;
        _412 = _420;
    }
    _414 = false;
    float _422 = _412;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _426 = _422 + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _430 = _422 + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _434 = _422 + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _448 = 1.0 / _438;
    bool _450 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _452 = 1.0 / _446;
    bool _454 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _456 = isnan(_422);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = 1.0 / _442;
    float _468 = _426 * _448;
    bool _470 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _472 = isnan(_422);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    bool _482 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _484 = isnan(_422);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = -_480;
    float _496 = _494 + 1.0;
    float _498 = _430 * _452;
    bool _500 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _502 = isnan(_422);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _512;
    float _516 = _464 * _496;
    float _518 = -_464;
    float _520 = _518 + 1.0;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _526 = -_510;
    float _528 = _526 + 1.0;
    float _530 = _434 * _466;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _536;
    float _540 = _492 * _528;
    float _542 = fma(_514, _530, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _544 = fma(_534, _530, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _546 = fma(_538, _530, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _548 = _510 * _520;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _554 = _544 * _540;
    float _556 = _546 * _540;
    float _558 = _542 * _540;
    float _560 = -_492;
    float _562 = _560 + 1.0;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _568 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[107].x, _554);
    float _570 = fma(_552, _498, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _572;
    float _576 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[107].y, _556);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _578;
    float _582 = fma(_524, _498, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _584 = fma(_566, _498, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _586 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[107].z, _558);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _588;
    float _592 = fma(_580, _468, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _594 = fma(_570, _548, _576);
    float _596 = fma(_582, _548, _568);
    float _598 = fma(_574, _468, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _600 = fma(_590, _468, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _602 = fma(_584, _548, _586);
    float _604 = fma(_592, _516, _594);
    float _606 = fma(_598, _516, _596);
    float _608 = fma(_600, _516, _602);
    float _610 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[110].y, _604);
    float _612 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[110].x, _606);
    float _614 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[110].z, _608);
    bool _616 = !_450;
    float _634;
    if (!_616)
    {
        float _618 = in.m_53.x;
        float _620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _622 = _618 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _626 = _624 * _620;
        float _628 = floor(_626);
        float _630 = -_628;
        float _632 = _626 + _630;
        _634 = _632;
        _636 = true;
    }
    else
    {
        float _638 = float(_90);
        float _640 = 1.0 / _638;
        float _642 = _124 * _640;
        _634 = _642;
    }
    _636 = false;
    float _644 = _634;
    float _646 = _612 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _648 = _610 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _654 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _656 = isnan(_644);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _666;
    float _670 = 1.0 / _652;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _674 = _672 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _676 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _678 = isnan(_644);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = -_664;
    float _690 = _688 + 1.0;
    bool _692 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _694 = isnan(_644);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _708 = -_686;
    float _710 = _708 + 1.0;
    float _712 = 1.0 / _674;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _716 = _644 + _714;
    float _718 = _702 * _710;
    float _720 = _614 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _722 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _724 = _668 * _670;
    float _726 = _686 * _690;
    bool _728 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _730 = isnan(_644);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = -_702;
    float _742 = _740 + 1.0;
    float _744 = 1.0 / _706;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _750 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _752 = isnan(_644);
    bool _754 = _750 || _752;
    bool _756 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _758 = _754 || _756;
    float _760 = float(_758);
    float _762 = -_738;
    float _764 = _762 + 1.0;
    float _766 = _738 * _742;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _770 = _768 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _772 = fma(_724, _716, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _778 = 1.0 / _748;
    float _780 = _760 * _764;
    float _782 = _776 * _712;
    float _784 = -_760;
    float _786 = _784 + 1.0;
    float _788 = _772 * _780;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _792 = _644 + _790;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _798 = 1.0 / _770;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _800;
    float _804 = fma(_782, _792, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _806 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[115].x, _788);
    float _808 = _802 * _744;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _812 = _644 + _810;
    bool _814 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _816 = isnan(_644);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = _796 * _778;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _828;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _834 = _644 + _832;
    float _836 = fma(_808, _812, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _838 = fma(_804, _766, _806);
    float _840 = -_824;
    float _842 = _840 + 1.0;
    float _844 = fma(_826, _834, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _848 = _644 + _846;
    float _850 = _830 * _798;
    float _852 = fma(_836, _718, _838);
    float _854 = _664 * _842;
    float _856 = _648 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _858 = fma(_850, _848, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _860 = fma(_844, _726, _852);
    float _862 = _720 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _864 = fma(_858, _854, _860);
    float _866 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[120].x, _864);
    float _868 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _870 = _866 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _868;
    out.m_55.y = _856;
    out.m_55.z = _862;
    out.m_55.w = _870;
    bool _872 = !_722;
    float _890;
    if (!_872)
    {
        float _874 = in.m_53.x;
        float _876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _878 = _874 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _880 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _882 = _880 * _876;
        float _884 = floor(_882);
        float _886 = -_884;
        float _888 = _882 + _886;
        _890 = _888;
        _892 = true;
    }
    else
    {
        float _894 = float(_90);
        float _896 = 1.0 / _894;
        float _898 = _124 * _896;
        _890 = _898;
    }
    _892 = false;
    float _900 = _890;
    float _902 = in.m_53.z;
    float _904 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _906 = log2(_904);
    float _908 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _910 = in.m_53.x;
    float _912 = in.m_53.y;
    float _914 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _918 = _916 != 0;
    float _920 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _924 = _922 != 0;
    float _926 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _908);
    float _928 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _914);
    float _930 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _920);
    float _932 = _392 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _934 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _936 = isnan(0.0);
    bool _938 = _934 || _936;
    bool _940 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _942 = _938 || _940;
    float _944 = _388 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _946 = _906 * _124;
    float _948 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _926);
    bool _950 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _952 = isnan(1.0);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _958 = _954 || _956;
    float _960 = exp2(_946);
    float _962 = _390 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _964 = _902 * 2.0;
    float _966 = _912 * 2.0;
    float _968 = floor(_964);
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _974 = 1.0 + _972;
    float _976 = 1.0 / _974;
    float _978 = -_960;
    float _980 = _978 + 1.0;
    float _982 = _910 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _984 = _942 ? _980 : 0.0;
    float _986 = -_970;
    float _988 = fma(_982, 2.0, _986);
    bool _990 = _968 >= 0.0;
    bool _992 = isnan(_968);
    bool _994 = _990 || _992;
    bool _996 = isnan(0.0);
    bool _998 = _994 || _996;
    float _1000 = _912 + _910;
    float _1002 = _912 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1006 = _1004 != 0;
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1010 = _1008 != 0;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1014 = _1012 != 0;
    float _1016 = _910 * 2.0;
    int _1018 = _998 ? 0 : 1;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1022 = _968 > 0.0;
    float _1024 = floor(_1016);
    float _1026 = _1000 + (-1.0);
    float _1028 = fma(_1002, -2.0, _1020);
    int _1030 = ~_1018;
    int _1032 = _1030 + 1;
    int _1034 = _1032 + 1;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1038 = !_1010;
    int _1040 = _1038 ? 0 : 1;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1044 = floor(_966);
    float _1046 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1036);
    float _1048 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1050 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1042);
    float _1052 = -_124;
    float _1054 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[76].x, _988);
    float _1056 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1046);
    float _1058 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1028);
    float _1060 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1050);
    int _1062 = _1034;
    if (_958)
    {
        float _1064 = _984 * _976;
        _126 = _1064;
    }
    float _1066 = _126;
    bool _1068 = !_1006;
    int _1070 = _1068 ? 0 : 1;
    float _1072 = in.m_57.x;
    float _1074 = in.m_57.y;
    float _1076 = in.m_57.z;
    bool _1078 = _1024 > 0.0;
    float _1080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_1022)
    {
        int _1082 = ~_1018;
        int _1084 = _1082 + 1;
        _1062 = _1084;
    }
    int _1086 = _1062;
    bool _1088 = !_1014;
    int _1090 = _1088 ? 0 : 1;
    int _1092 = abs(_1070);
    bool _1094 = _1024 >= 0.0;
    bool _1096 = isnan(_1024);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan(0.0);
    bool _1102 = _1098 || _1100;
    bool _1104 = _1044 > 0.0;
    bool _1106 = _1044 >= 0.0;
    bool _1108 = isnan(_1044);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan(0.0);
    bool _1114 = _1110 || _1112;
    int _1116 = abs(_1040);
    int _1118 = abs(_1090);
    float _1120 = float(_1092);
    float _1122 = float(_1086);
    int _1124 = _1102 ? 0 : 1;
    float _1126 = _1120 * _1122;
    int _1128 = ~_1124;
    int _1130 = _1128 + 1;
    int _1132 = _1130 + 1;
    int _1134 = _1114 ? 0 : 1;
    float _1136 = _1126 * (-2.0);
    int _1138 = _1132;
    if (!_1078)
    {
        int _1140 = ~_1124;
        int _1142 = _1140 + 1;
        _1138 = _1142;
    }
    int _1144 = _1138;
    int _1146 = ~_1134;
    int _1148 = _1146 + 1;
    int _1150 = _1148 + 1;
    float _1152 = fma(_1136, _1072, _1072);
    int _1154 = _1150;
    if (!_1104)
    {
        int _1156 = ~_1134;
        int _1158 = _1156 + 1;
        _1154 = _1158;
    }
    int _1160 = _1154;
    float _1162 = in.m_59.y;
    float _1164 = float(_1144);
    float _1166 = fma(_1048, _1136, _1048);
    float _1168 = float(_1116);
    float _1170 = in.m_61.x;
    float _1172 = in.m_61.y;
    float _1174 = in.m_61.z;
    float _1176 = float(_1118);
    float _1178 = _910 + (-0.5);
    float _1180 = float(_1160);
    float _1182 = _1168 * _1164;
    float _1184 = _902 + _910;
    bool _1186 = _912 > 0.5;
    float _1188 = _1176 * _1180;
    float _1190 = _1182 * (-2.0);
    float _1192 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1152);
    float _1194 = _1188 * (-2.0);
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1196;
    float _1200 = fma(_1166, _1066, _1192);
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1206 = fma(_1194, _1076, _1076);
    float _1208 = _912 + _902;
    float _1210 = fma(_1190, _1074, _1074);
    float _1212 = _912 + (-0.5);
    float _1214 = 1.0 / _1204;
    float _1216 = _1208 + (-1.0);
    float _1218 = _1200 * 0.15915493667125701904296875;
    float _1220 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1210);
    float _1222 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1172);
    float _1224 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1226 = -_1162;
    float _1228 = _1226 + 1.0;
    float _1230 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1170);
    float _1232 = _1184 + (-1.0);
    float _1234 = 1.0 / _1198;
    float _1236 = _1162;
    if (_924)
    {
        float _1238 = _1186 ? _1228 : _1162;
        _1236 = _1238;
    }
    float _1240 = _1236;
    float _1242 = _902 + (-0.5);
    float _1244 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1246 = fma(_1224, _1190, _1224);
    float _1248 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1174);
    float _1250 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1206);
    float _1252 = fma(_1244, _1194, _1244);
    float _1254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1256 = fma(_1246, _1066, _1220);
    float _1258 = _932 * _1248;
    float _1260 = fma(_1252, _1066, _1250);
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1264 = _900 + _1262;
    float _1266 = _1256 * 0.15915493667125701904296875;
    float _1268 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _928);
    float _1270 = _1260 * 0.15915493667125701904296875;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1274 = _900 + _1272;
    float _1276 = _1218 * 6.283185482025146484375;
    float _1278 = sin(_1276);
    float _1280 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _930);
    float _1282 = _944 * _1230;
    float _1284 = _1264 * _1234;
    float _1286 = _1274 * _1214;
    float _1288 = _962 * _1222;
    float _1290 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1292 = _1218 * 6.283185482025146484375;
    float _1294 = cos(_1292);
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1298 = _900 + _1296;
    float _1300 = fma(_1290, _1240, -0.5);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1302;
    float _1306 = _1190;
    float _1308 = _1268;
    if (_918)
    {
        float _1310 = in.m_53.x;
        _1306 = _1310;
    }
    float _1312 = _1306;
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1314;
    float _1318 = -_1058;
    float _1320 = fma(_1060, _1300, _1318);
    float _1322 = _1266 * 6.283185482025146484375;
    float _1324 = sin(_1322);
    float _1326 = _1280 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1328 = fma(_1316, _1284, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1330;
    float _1334 = _1266 * 6.283185482025146484375;
    float _1336 = cos(_1334);
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1338;
    float _1342 = fma(_1332, _1284, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1344 = _1270 * 6.283185482025146484375;
    float _1346 = cos(_1344);
    float _1348 = _1294 * _1324;
    float _1350 = _1278 * _1324;
    bool _1352 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1354 = isnan(_900);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1360 = _1356 || _1358;
    float _1362 = float(_1360);
    bool _1364 = _1312 > 0.5;
    bool _1366 = _1364 && _918;
    float _1368 = _1270 * 6.283185482025146484375;
    float _1370 = sin(_1368);
    float _1372 = _1278 * _1336;
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1374;
    float _1378 = _1324 * _1346;
    float _1380 = _1294 * _1336;
    float _1382 = _1346 * _1288;
    float _1384 = _1336 * _1346;
    float _1386 = 1.0 / _1304;
    float _1388 = _1294 * _1382;
    float _1390 = _1278 * _1382;
    float _1392 = -_1348;
    float _1394 = fma(_1370, _1372, _1392);
    float _1396 = -_1372;
    float _1398 = fma(_1370, _1348, _1396);
    float _1400 = fma(_1370, _1380, _1350);
    float _1402 = -_1288;
    float _1404 = _1370 * _1402;
    float _1406 = fma(_1370, _1350, _1380);
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1410 = _1408 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1412 = fma(_1400, _1282, _1388);
    float _1414 = fma(_1384, _1282, _1404);
    float _1416 = fma(_1394, _1282, _1390);
    float _1418 = _948 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1420 = fma(_1398, _1258, _1412);
    float _1422 = fma(_1378, _1258, _1414);
    float _1424 = fma(_1406, _1258, _1416);
    float _1426 = _1298 * _1386;
    float _1428 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1430 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1432 = in.m_59.x;
    float _1434 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1428);
    float _1436 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1430);
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1440 = _1438 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1442;
    float _1446 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1434);
    float _1448 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1436);
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1452 = _1450 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1454 = fma(_1444, _1284, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1456 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1458 = _1448 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _1460 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1462 = isnan(_900);
    bool _1464 = _1460 || _1462;
    bool _1466 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1468 = _1464 || _1466;
    float _1470 = float(_1468);
    float _1472 = fma(_1452, _1286, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1474 = _1418 + _1456;
    float _1476 = _1326 + _1458;
    float _1478 = fma(_1410, _1286, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1480 = fma(_1440, _1286, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1482 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1484 = _1474 + _1482;
    float _1486 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1488 = _1476 + _1486;
    bool _1490 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1492 = isnan(_900);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1498 = _1494 || _1496;
    float _1500 = float(_1498);
    float _1502 = -_1470;
    float _1504 = _1502 + 1.0;
    float _1506 = _1484 * _1484;
    float _1508 = _1488 * _1488;
    float _1510 = fma(_1340, _1426, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1512 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1514 = isnan(_900);
    bool _1516 = _1512 || _1514;
    bool _1518 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1520 = _1516 || _1518;
    float _1522 = float(_1520);
    float _1524 = _1506 + _1508;
    float _1526 = _1500 * _1504;
    float _1528 = -_1500;
    float _1530 = _1528 + 1.0;
    float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1532;
    float _1536 = sqrt(_1524);
    float _1538 = -_1522;
    float _1540 = _1538 + 1.0;
    float _1542 = _1522 * _1530;
    float _1544 = fma(_1534, _1426, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1546 = fma(_1376, _1426, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1548 = 0.0;
    float _1550 = _1432;
    float _1552 = _1454;
    float _1554 = _1506;
    float _1556 = _1508;
    float _1558 = _1328;
    float _1560 = _1470;
    if (_918)
    {
        _1548 = _1432;
    }
    float _1562 = _1548;
    float _1564 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1566 = _1362 * _1540;
    float _1568 = -_1362;
    float _1570 = _1568 + 1.0;
    float _1572 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1564);
    float _1574 = _1562;
    if (_1366)
    {
        float _1576 = -_1562;
        float _1578 = _1576 + 1.0;
        _1574 = _1578;
    }
    float _1580 = _1574;
    float _1582 = _1454 * _1566;
    float _1584 = _1328 * _1566;
    float _1586 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1572);
    float _1588 = _1268 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1590 = _1536 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1592 = _1342 * _1566;
    float _1594 = _1586 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1596 = _1592;
    if (_918)
    {
        _1550 = _1580;
    }
    float _1598 = _1550;
    float _1600 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1602 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1582);
    float _1604 = _1588 + _1594;
    float _1606 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1584);
    float _1608 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1592);
    float _1610 = fma(_1600, _1598, -0.5);
    float _1612 = fma(_1472, _1542, _1602);
    if (!_1590)
    {
        _1308 = _1474;
    }
    float _1614 = _1308;
    float _1616 = _1614;
    if (!_1590)
    {
        _1552 = _1476;
    }
    float _1618 = _1552;
    float _1620 = _1618;
    if (!_1590)
    {
        _1596 = _1604;
    }
    float _1622 = _1596;
    bool _1624 = !_1590;
    float _1626 = _1622;
    if (!_1624)
    {
        float _1628 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1630 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1632 = _1536 + _1630;
        float _1634 = _1604 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1636 = rsqrt(_1524);
        float _1638 = _1632 * _1628;
        float _1640 = _1638 * 0.15915493667125701904296875;
        float _1642 = _1640 * 6.283185482025146484375;
        float _1644 = sin(_1642);
        float _1646 = _1640 * 6.283185482025146484375;
        float _1648 = cos(_1646);
        float _1650 = fma(_1644, _1634, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1652 = _1636 * _1650;
        float _1654 = fma(_1484, _1652, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1656 = _1648 + (-1.0);
        float _1658 = fma(_1488, _1652, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1660 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1662 = _1654 + _1660;
        float _1664 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1666 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1668 = _1658 + _1666;
        float _1670 = _1662 * _1662;
        float _1672 = fma(_1604, _1648, _1664);
        float _1674 = _1668 * _1668;
        _1626 = _1672;
        _1554 = _1670;
        _1556 = _1674;
        _1616 = _1654;
        _1620 = _1658;
        _1558 = _1664;
    }
    float _1676 = _1626;
    float _1678 = _1554;
    float _1680 = _1556;
    float _1682 = _1616;
    float _1684 = _1620;
    float _1686 = _1558;
    float _1688 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1690 = _1676 + _1688;
    float _1692 = fma(_1478, _1542, _1606);
    float _1694 = fma(_1480, _1542, _1608);
    float _1696 = fma(_1544, _1526, _1612);
    float _1698 = fma(_1690, _1690, _1678);
    float _1700 = fma(_1546, _1526, _1692);
    float _1702 = fma(_1510, _1526, _1694);
    float _1704 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1696);
    float _1706 = _1698 + _1680;
    float _1708 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1700);
    float _1710 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1702);
    float _1712 = _1320 + 0.5;
    float _1714 = fma(_1056, _1610, _1054);
    float _1716 = sqrt(_1706);
    float _1718 = _1704 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1720 = _1708 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1722 = _1710 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1724 = _1714 + 0.5;
    float _1726 = _1718 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1728 = _1720 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1730 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _1724;
    out.m_63.y = _1712;
    out.m_65.x = _1726;
    out.m_65.y = _1728;
    out.m_65.z = _1730;
    bool _1732 = _1716 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1734 = isnan(_1716);
    bool _1736 = _1732 || _1734;
    bool _1738 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1740 = _1736 || _1738;
    float _1742 = _1676;
    float _1744 = _1686;
    float _1746 = _1728;
    if (!_1740)
    {
        _1560 = 1.0;
    }
    float _1748 = _1560;
    bool _1750 = !_1740;
    float _1752 = _1748;
    if (!_1750)
    {
        bool _1754 = _1716 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1756 = isnan(_1716);
        bool _1758 = _1754 || _1756;
        bool _1760 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1762 = _1758 || _1760;
        if (!_1762)
        {
            float _1764 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1766 = _1716 + _1764;
            float _1768 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1770 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1768;
            float _1772 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1774 = _1772 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1776 = 1.0 / _1770;
            float _1778 = _1766 * _1776;
            float _1780 = fma(_1778, _1774, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1752 = _1780;
            _1782 = true;
        }
        else
        {
            bool _1784 = _1716 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1786 = isnan(_1716);
            bool _1788 = _1784 || _1786;
            bool _1790 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1792 = _1788 || _1790;
            if (!_1792)
            {
                float _1794 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1796 = _1716 + _1794;
                float _1798 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1800 = _1798 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1802 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1804 = _1802 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1806 = 1.0 / _1800;
                float _1808 = _1796 * _1806;
                float _1810 = fma(_1808, _1804, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1752 = _1810;
                _1782 = true;
            }
            else
            {
                _1752 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1782 = false;
    float _1812 = _1752;
    float _1814 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1816 = _1676 + _1814;
    float _1818 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1820 = _1682 + _1818;
    float _1822 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1824 = _1684 + _1822;
    float _1826 = fma(_1816, _1812, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1828 = fma(_1820, _1812, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1830 = fma(_1824, _1812, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1832 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1834 = _1826 + _1832;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1838 = _1828 + _1836;
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1842 = _1830 + _1840;
    float _1844 = _1834 * _1834;
    float _1846 = fma(_1838, _1838, _1844);
    float _1848 = fma(_1842, _1842, _1846);
    float _1850 = rsqrt(_1848);
    float _1852 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1854 = _1838 * _1852;
    float _1856 = _1842 * _1852;
    float _1858 = _1854 * _1854;
    float _1860 = _1856 * _1856;
    float _1862 = _1858 + _1860;
    float _1864 = sqrt(_1862);
    bool _1866 = _1864 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1868 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1870 = _1864 + _1868;
    float _1872 = _1842;
    float _1874 = _1870;
    float _1876 = _1834;
    if (_1866)
    {
        float _1878 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1872 = _1878;
    }
    float _1880 = _1872;
    if (_1866)
    {
        float _1882 = rsqrt(_1862);
        _1742 = _1882;
    }
    float _1884 = _1742;
    float _1886 = _1884;
    if (_1866)
    {
        float _1888 = _1870 * _1880;
        _1874 = _1888;
    }
    float _1890 = _1874;
    if (_1866)
    {
        float _1892 = _1890 * 0.15915493667125701904296875;
        _1744 = _1892;
    }
    float _1894 = _1744;
    float _1896 = _1850;
    if (_1866)
    {
        float _1898 = _1894 * 6.283185482025146484375;
        float _1900 = sin(_1898);
        _1896 = _1900;
    }
    float _1902 = _1896;
    float _1904 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1906 = precise::max(0.0, _1904);
    float _1908 = _1846;
    float _1910 = _1906;
    float _1912 = _1904;
    if (_1866)
    {
        float _1914 = _1894 * 6.283185482025146484375;
        float _1916 = cos(_1914);
        _1908 = _1916;
    }
    float _1918 = _1908;
    float _1920 = -_1852;
    float _1922 = -_1906;
    float _1924 = fma(_1834, _1920, _1922);
    if (!_1866)
    {
        _1910 = _1858;
    }
    float _1926 = _1910;
    float _1928 = _1926;
    if (_1866)
    {
        float _1930 = _1924 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1912 = _1930;
    }
    float _1932 = _1912;
    float _1934 = sqrt(_1848);
    float _1936 = _1902;
    float _1938 = _1932;
    if (_1866)
    {
        float _1940 = fma(_1902, _1932, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1876 = _1940;
    }
    float _1942 = _1876;
    float _1944 = _1942;
    if (!_1866)
    {
        _1936 = _1854;
    }
    float _1946 = _1936;
    float _1948 = _1946;
    float _1950 = _1918;
    if (_1866)
    {
        float _1952 = _1918 + (-1.0);
        _1938 = _1952;
    }
    float _1954 = _1938;
    float _1956 = _1954;
    if (_1866)
    {
        float _1958 = _1884 * _1942;
        _1746 = _1958;
    }
    float _1960 = _1746;
    if (!_1866)
    {
        _1944 = _1924;
    }
    float _1962 = _1944;
    float _1964 = _1962;
    if (_1866)
    {
        float _1966 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1886 = _1966;
    }
    float _1968 = _1886;
    if (_1866)
    {
        float _1970 = _1854 * _1960;
        _1948 = _1970;
    }
    float _1972 = _1948;
    if (!_1866)
    {
        _1956 = _1856;
    }
    float _1974 = _1956;
    float _1976 = _1974;
    if (_1866)
    {
        float _1978 = _1856 * _1960;
        _1976 = _1978;
    }
    float _1980 = _1976;
    if (_1866)
    {
        float _1982 = fma(_1924, _1918, _1968);
        _1964 = _1982;
    }
    float _1984 = _1964;
    if (_1866)
    {
        float _1986 = _1972 * _1972;
        _1928 = _1986;
    }
    float _1988 = _1928;
    if (!_1866)
    {
        _1950 = _1860;
    }
    float _1990 = _1950;
    float _1992 = _1990;
    if (_1866)
    {
        float _1994 = _1980 * _1980;
        _1992 = _1994;
    }
    float _1996 = _1992;
    float _1998 = fma(_1984, _1984, _1988);
    float _2000 = _1998 + _1996;
    float _2002 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2004 = fma(_1934, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2002);
    float _2006 = precise::clamp(_2004, 0.0, 1.0);
    float _2008 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2010 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2012 = rsqrt(_2000);
    float _2014 = -_2006;
    float _2016 = _2014 + 1.0;
    float _2018 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2008);
    float _2020 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2010);
    float _2022 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2024 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2026 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2018);
    float _2028 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2030 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2020);
    float _2032 = abs(_2016);
    float _2034 = log2(_2032);
    float _2036 = _2026 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2038 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2028);
    float _2040 = _2030 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2042 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2022);
    float _2044 = _2036 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2046 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2038);
    float _2048 = _2012 * _1972;
    float _2050 = _2012 * _1984;
    float _2052 = _2012 * _1980;
    float _2054 = _2046 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2056 = _2048 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2058 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2060 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2042);
    float _2062 = -_2044;
    float _2064 = fma(_2062, _2024, 1.0);
    float _2066 = -_2056;
    float _2068 = fma(_2050, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2066);
    float _2070 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2058);
    float _2072 = _2060 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2074 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2076 = -_2052;
    float _2078 = fma(_2076, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2068);
    float _2080 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2070);
    float _2082 = log2(_2064);
    float _2084 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2086 = fma(_2078, -0.5, 0.5);
    float _2088 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2080);
    float _2090 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2092 = fma(_2078, 0.5, 0.5);
    float _2094 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2084);
    float _2096 = _2050 + 1.0;
    float _2098 = exp2(_2074);
    float _2100 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2090);
    float _2102 = fma(_2092, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2104 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2094);
    float _2106 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2100);
    float _2108 = fma(_2092, _2102, -0.212114393711090087890625);
    float _2110 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2104);
    float _2112 = 1.0 / _2088;
    float _2114 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2106);
    float _2116 = _2082 * 0.693147182464599609375;
    float _2118 = fma(_2092, _2108, 1.570728778839111328125);
    float _2120 = sqrt(_2086);
    float _2122 = -_2050;
    float _2124 = fma(_2098, _2096, _2122);
    float _2126 = fma(_2124, 0.5, 0.5);
    float _2128 = _2110 * _2112;
    float _2130 = _2114 * _2112;
    float _2132 = _2116 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2134 = fma(_2128, 0.5, 0.5);
    float _2136 = fma(_2130, -0.5, 0.5);
    float _2138 = _2120 * 0.636619746685028076171875;
    float _2140 = -_2118;
    float _2142 = fma(_2138, _2140, 1.0);
    float3 _5710 = float3(_2134, _2136, _2132);
    float _2144 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5710, float3(0.0), isnan(_5710)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5710, float3(0.0), isnan(_5710)), level(0.0)).x;
    float3 _5721 = float3(_2134, _2136, _2132);
    float4 _2147 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5721, float3(0.0), isnan(_5721)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5721, float3(0.0), isnan(_5721)), level(0.0)).xyzw;
    float _2149 = _2147.x;
    float _2151 = _2147.y;
    float _2153 = _2147.z;
    float _2155 = _2147.w;
    float2 _5738 = float2(_2142, _2126);
    float3 _2159 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5738, float2(0.0), isnan(_5738)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5738, float2(0.0), isnan(_5738)), level(0.0)).xyz;
    float _2161 = _2159.x;
    float _2163 = _2159.y;
    float _2165 = _2159.z;
    float _2167 = _1588 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2169 = _1588 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2171 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2167);
    float _2173 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2169);
    float _2175 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2171);
    float _2177 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2173);
    float _2179 = _2175 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2181 = _2177 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2183 = 1.0 / _2179;
    float _2185 = _2181 + _2179;
    float _2187 = _2185 * _2183;
    float _2189 = _2187 * 0.5;
    float _2191 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2193 = fma(_2189, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2191);
    float _2195 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2197 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2199 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2201 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2203 = _2199 || _2201;
    bool _2205 = isnan(0.5);
    bool _2207 = _2203 || _2205;
    float _2209 = 1.0 / _2193;
    float _2211 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2195);
    float _2213 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2211);
    float _2215 = exp2(_2197);
    float _2217 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2213);
    float _2219 = _2211;
    float _2221 = _2036;
    if (_2207)
    {
        _2219 = 1.0;
    }
    float _2223 = _2219;
    float _2225 = _2223;
    if (_2207)
    {
        _2221 = 1.0;
    }
    float _2227 = _2221;
    float _2229 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2231 = _2209 * _2229;
    float _2233 = _2227;
    if (!_2207)
    {
        float _2235 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2237 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2239 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2237;
        float _2241 = _2235 * 0.15915493667125701904296875;
        float _2243 = _2241 * 6.283185482025146484375;
        float _2245 = cos(_2243);
        float _2247 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2249 = _2247 * 0.15915493667125701904296875;
        float _2251 = _2241 * 6.283185482025146484375;
        float _2253 = sin(_2251);
        float _2255 = 1.0 / _2245;
        float _2257 = _2249 * 6.283185482025146484375;
        float _2259 = cos(_2257);
        float _2261 = _2253 * _2255;
        float _2263 = _2249 * 6.283185482025146484375;
        float _2265 = sin(_2263);
        float _2267 = _2259 * _2261;
        float _2269 = 1.0 / _2239;
        float _2271 = 1.0 / _2267;
        float _2273 = _2265 * _2271;
        float _2275 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2277 = fma(_2231, _2273, _2275);
        float _2279 = _2277 * _2269;
        float _2281 = precise::clamp(_2279, 0.0, 1.0);
        _2225 = _2281;
    }
    float _2283 = _2225;
    if (!_2207)
    {
        float _2285 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2287 = _2285 * 0.15915493667125701904296875;
        float _2289 = _2287 * 6.283185482025146484375;
        float _2291 = cos(_2289);
        float _2293 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2295 = _2293 * 0.15915493667125701904296875;
        float _2297 = _2287 * 6.283185482025146484375;
        float _2299 = sin(_2297);
        float _2301 = 1.0 / _2291;
        float _2303 = _2295 * 6.283185482025146484375;
        float _2305 = cos(_2303);
        float _2307 = _2299 * _2301;
        float _2309 = _2295 * 6.283185482025146484375;
        float _2311 = sin(_2309);
        float _2313 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2315 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2313;
        float _2317 = _2305 * _2307;
        float _2319 = 1.0 / _2315;
        float _2321 = 1.0 / _2317;
        float _2323 = _2311 * _2321;
        float _2325 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2327 = fma(_2231, _2323, _2325);
        float _2329 = _2327 * _2319;
        float _2331 = precise::clamp(_2329, 0.0, 1.0);
        float _2333 = -_2331;
        float _2335 = _2333 + 1.0;
        _2233 = _2335;
    }
    float _2337 = _2233;
    float _2339 = _2283 * _2337;
    float _2341 = -_2215;
    float _2343 = _2341 + 1.0;
    bool _2345 = _2283 > 0.0;
    bool _2347 = isnan(_2283);
    bool _2349 = _2345 || _2347;
    bool _2351 = isnan(0.0);
    bool _2353 = _2349 || _2351;
    float _2355 = _2217 + _2088;
    float _2357 = _2339 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2359 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2361 = _2337 <= 0.0;
    bool _2363 = !_2353;
    bool _2365 = _2361 || _2363;
    out.m_67.x = _1828;
    out.m_67.y = _1826;
    out.m_67.z = _1830;
    float _2367 = _2359 * _2144;
    float _2369 = -_2359;
    float _2371 = _2369 + 1.0;
    out.gl_Position.x = _2110;
    out.gl_Position.y = _2114;
    out.gl_Position.z = _2217;
    out.gl_Position.w = _2088;
    float _2373 = _2355 * 0.5;
    float _2375 = _2155 * _2367;
    float _2377 = _2165 * _2367;
    float _2379 = _2357 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.z = _2373;
    out.m_69.w = _2088;
    float _2381 = fma(_2161, _2375, _2149);
    float _2383 = fma(_2163, _2375, _2151);
    float _2385 = _2155 * _2371;
    float _2387 = fma(_2155, _2377, _2153);
    out.m_47.x = _2379;
    out.m_71.x = _2381;
    out.m_71.y = _2383;
    out.m_71.z = _2387;
    out.m_71.w = _2385;
    if (!_2365)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2389 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2389;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1782 = false;
    bool _892 = false;
    bool _636 = false;
    bool _414 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2446 = as_type<float>(_106);
        out.gl_Position.z = _2446;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_49.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2516 = as_type<float>(_144);
        out.gl_Position.z = _2516;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_51.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
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
    float _286;
    if (!_268)
    {
        float _270 = in.m_53.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_90);
        float _292 = 1.0 / _290;
        float _294 = _124 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _296 + _298;
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    float _318 = -_312;
    float _320 = _318 + 1.0;
    bool _322 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _324 = isnan(_296);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = 1.0 / _316;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _340;
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _346 = _300 * _334;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _348;
    float _352 = in.m_51.x;
    float _354 = in.m_51.y;
    float _356 = in.m_51.z;
    float _358 = _332 * _320;
    float _360 = fma(_338, _346, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _362 = fma(_350, _346, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _364 = fma(_342, _346, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _366 = -_332;
    float _368 = _366 + 1.0;
    float _370 = _360 * _358;
    float _372 = _362 * _358;
    float _374 = _364 * _358;
    float _376 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].x, _370);
    float _378 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].y, _372);
    float _380 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].z, _374);
    float _382 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].x, _376);
    float _384 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].y, _378);
    float _386 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].z, _380);
    float _388 = _382 * _352;
    float _390 = _384 * _354;
    float _392 = _386 * _356;
    bool _394 = !_344;
    float _412;
    if (!_394)
    {
        float _396 = in.m_53.x;
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _400 = _396 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _404 = _402 * _398;
        float _406 = floor(_404);
        float _408 = -_406;
        float _410 = _404 + _408;
        _412 = _410;
        _414 = true;
    }
    else
    {
        float _416 = float(_90);
        float _418 = 1.0 / _416;
        float _420 = _124 * _418;
        _412 = _420;
    }
    _414 = false;
    float _422 = _412;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _426 = _422 + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _430 = _422 + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _434 = _422 + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _448 = 1.0 / _438;
    bool _450 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _452 = 1.0 / _446;
    bool _454 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _456 = isnan(_422);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = 1.0 / _442;
    float _468 = _426 * _448;
    bool _470 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _472 = isnan(_422);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    bool _482 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _484 = isnan(_422);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = -_480;
    float _496 = _494 + 1.0;
    float _498 = _430 * _452;
    bool _500 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _502 = isnan(_422);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _512;
    float _516 = _464 * _496;
    float _518 = -_464;
    float _520 = _518 + 1.0;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _526 = -_510;
    float _528 = _526 + 1.0;
    float _530 = _434 * _466;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _536;
    float _540 = _492 * _528;
    float _542 = fma(_514, _530, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _544 = fma(_534, _530, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _546 = fma(_538, _530, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _548 = _510 * _520;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _554 = _544 * _540;
    float _556 = _546 * _540;
    float _558 = _542 * _540;
    float _560 = -_492;
    float _562 = _560 + 1.0;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _568 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[107].x, _554);
    float _570 = fma(_552, _498, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _572;
    float _576 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[107].y, _556);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _578;
    float _582 = fma(_524, _498, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _584 = fma(_566, _498, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _586 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[107].z, _558);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _588;
    float _592 = fma(_580, _468, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _594 = fma(_570, _548, _576);
    float _596 = fma(_582, _548, _568);
    float _598 = fma(_574, _468, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _600 = fma(_590, _468, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _602 = fma(_584, _548, _586);
    float _604 = fma(_592, _516, _594);
    float _606 = fma(_598, _516, _596);
    float _608 = fma(_600, _516, _602);
    float _610 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[110].y, _604);
    float _612 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[110].x, _606);
    float _614 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[110].z, _608);
    bool _616 = !_450;
    float _634;
    if (!_616)
    {
        float _618 = in.m_53.x;
        float _620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _622 = _618 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _626 = _624 * _620;
        float _628 = floor(_626);
        float _630 = -_628;
        float _632 = _626 + _630;
        _634 = _632;
        _636 = true;
    }
    else
    {
        float _638 = float(_90);
        float _640 = 1.0 / _638;
        float _642 = _124 * _640;
        _634 = _642;
    }
    _636 = false;
    float _644 = _634;
    float _646 = _612 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _648 = _610 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _654 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _656 = isnan(_644);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _666;
    float _670 = 1.0 / _652;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _674 = _672 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _676 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _678 = isnan(_644);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = -_664;
    float _690 = _688 + 1.0;
    bool _692 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _694 = isnan(_644);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _708 = -_686;
    float _710 = _708 + 1.0;
    float _712 = 1.0 / _674;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _716 = _644 + _714;
    float _718 = _702 * _710;
    float _720 = _614 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _722 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _724 = _668 * _670;
    float _726 = _686 * _690;
    bool _728 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _730 = isnan(_644);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = -_702;
    float _742 = _740 + 1.0;
    float _744 = 1.0 / _706;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _750 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _752 = isnan(_644);
    bool _754 = _750 || _752;
    bool _756 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _758 = _754 || _756;
    float _760 = float(_758);
    float _762 = -_738;
    float _764 = _762 + 1.0;
    float _766 = _738 * _742;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _770 = _768 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _772 = fma(_724, _716, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _778 = 1.0 / _748;
    float _780 = _760 * _764;
    float _782 = _776 * _712;
    float _784 = -_760;
    float _786 = _784 + 1.0;
    float _788 = _772 * _780;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _792 = _644 + _790;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _798 = 1.0 / _770;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _800;
    float _804 = fma(_782, _792, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _806 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[115].x, _788);
    float _808 = _802 * _744;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _812 = _644 + _810;
    bool _814 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _816 = isnan(_644);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = _796 * _778;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _828;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _834 = _644 + _832;
    float _836 = fma(_808, _812, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _838 = fma(_804, _766, _806);
    float _840 = -_824;
    float _842 = _840 + 1.0;
    float _844 = fma(_826, _834, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _848 = _644 + _846;
    float _850 = _830 * _798;
    float _852 = fma(_836, _718, _838);
    float _854 = _664 * _842;
    float _856 = _648 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _858 = fma(_850, _848, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _860 = fma(_844, _726, _852);
    float _862 = _720 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _864 = fma(_858, _854, _860);
    float _866 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[120].x, _864);
    float _868 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _870 = _866 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _868;
    out.m_55.y = _856;
    out.m_55.z = _862;
    out.m_55.w = _870;
    bool _872 = !_722;
    float _890;
    if (!_872)
    {
        float _874 = in.m_53.x;
        float _876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _878 = _874 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _880 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _882 = _880 * _876;
        float _884 = floor(_882);
        float _886 = -_884;
        float _888 = _882 + _886;
        _890 = _888;
        _892 = true;
    }
    else
    {
        float _894 = float(_90);
        float _896 = 1.0 / _894;
        float _898 = _124 * _896;
        _890 = _898;
    }
    _892 = false;
    float _900 = _890;
    float _902 = in.m_53.z;
    float _904 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _906 = log2(_904);
    float _908 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _910 = in.m_53.x;
    float _912 = in.m_53.y;
    float _914 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _918 = _916 != 0;
    float _920 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _924 = _922 != 0;
    float _926 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _908);
    float _928 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _914);
    float _930 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _920);
    float _932 = _392 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _934 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _936 = isnan(0.0);
    bool _938 = _934 || _936;
    bool _940 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _942 = _938 || _940;
    float _944 = _388 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _946 = _906 * _124;
    float _948 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _926);
    bool _950 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _952 = isnan(1.0);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _958 = _954 || _956;
    float _960 = exp2(_946);
    float _962 = _390 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _964 = _902 * 2.0;
    float _966 = _912 * 2.0;
    float _968 = floor(_964);
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _974 = 1.0 + _972;
    float _976 = 1.0 / _974;
    float _978 = -_960;
    float _980 = _978 + 1.0;
    float _982 = _910 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _984 = _942 ? _980 : 0.0;
    float _986 = -_970;
    float _988 = fma(_982, 2.0, _986);
    bool _990 = _968 >= 0.0;
    bool _992 = isnan(_968);
    bool _994 = _990 || _992;
    bool _996 = isnan(0.0);
    bool _998 = _994 || _996;
    float _1000 = _912 + _910;
    float _1002 = _912 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1006 = _1004 != 0;
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1010 = _1008 != 0;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1014 = _1012 != 0;
    float _1016 = _910 * 2.0;
    int _1018 = _998 ? 0 : 1;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1022 = _968 > 0.0;
    float _1024 = floor(_1016);
    float _1026 = _1000 + (-1.0);
    float _1028 = fma(_1002, -2.0, _1020);
    int _1030 = ~_1018;
    int _1032 = _1030 + 1;
    int _1034 = _1032 + 1;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1038 = !_1010;
    int _1040 = _1038 ? 0 : 1;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1044 = floor(_966);
    float _1046 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1036);
    float _1048 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1050 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1042);
    float _1052 = -_124;
    float _1054 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[76].x, _988);
    float _1056 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1046);
    float _1058 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1028);
    float _1060 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1050);
    int _1062 = _1034;
    if (_958)
    {
        float _1064 = _984 * _976;
        _126 = _1064;
    }
    float _1066 = _126;
    bool _1068 = !_1006;
    int _1070 = _1068 ? 0 : 1;
    float _1072 = in.m_57.x;
    float _1074 = in.m_57.y;
    float _1076 = in.m_57.z;
    bool _1078 = _1024 > 0.0;
    float _1080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_1022)
    {
        int _1082 = ~_1018;
        int _1084 = _1082 + 1;
        _1062 = _1084;
    }
    int _1086 = _1062;
    bool _1088 = !_1014;
    int _1090 = _1088 ? 0 : 1;
    int _1092 = abs(_1070);
    bool _1094 = _1024 >= 0.0;
    bool _1096 = isnan(_1024);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan(0.0);
    bool _1102 = _1098 || _1100;
    bool _1104 = _1044 > 0.0;
    bool _1106 = _1044 >= 0.0;
    bool _1108 = isnan(_1044);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan(0.0);
    bool _1114 = _1110 || _1112;
    int _1116 = abs(_1040);
    int _1118 = abs(_1090);
    float _1120 = float(_1092);
    float _1122 = float(_1086);
    int _1124 = _1102 ? 0 : 1;
    float _1126 = _1120 * _1122;
    int _1128 = ~_1124;
    int _1130 = _1128 + 1;
    int _1132 = _1130 + 1;
    int _1134 = _1114 ? 0 : 1;
    float _1136 = _1126 * (-2.0);
    int _1138 = _1132;
    if (!_1078)
    {
        int _1140 = ~_1124;
        int _1142 = _1140 + 1;
        _1138 = _1142;
    }
    int _1144 = _1138;
    int _1146 = ~_1134;
    int _1148 = _1146 + 1;
    int _1150 = _1148 + 1;
    float _1152 = fma(_1136, _1072, _1072);
    int _1154 = _1150;
    if (!_1104)
    {
        int _1156 = ~_1134;
        int _1158 = _1156 + 1;
        _1154 = _1158;
    }
    int _1160 = _1154;
    float _1162 = in.m_59.y;
    float _1164 = float(_1144);
    float _1166 = fma(_1048, _1136, _1048);
    float _1168 = float(_1116);
    float _1170 = in.m_61.x;
    float _1172 = in.m_61.y;
    float _1174 = in.m_61.z;
    float _1176 = float(_1118);
    float _1178 = _910 + (-0.5);
    float _1180 = float(_1160);
    float _1182 = _1168 * _1164;
    float _1184 = _902 + _910;
    bool _1186 = _912 > 0.5;
    float _1188 = _1176 * _1180;
    float _1190 = _1182 * (-2.0);
    float _1192 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1152);
    float _1194 = _1188 * (-2.0);
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1196;
    float _1200 = fma(_1166, _1066, _1192);
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1206 = fma(_1194, _1076, _1076);
    float _1208 = _912 + _902;
    float _1210 = fma(_1190, _1074, _1074);
    float _1212 = _912 + (-0.5);
    float _1214 = 1.0 / _1204;
    float _1216 = _1208 + (-1.0);
    float _1218 = _1200 * 0.15915493667125701904296875;
    float _1220 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1210);
    float _1222 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1172);
    float _1224 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1226 = -_1162;
    float _1228 = _1226 + 1.0;
    float _1230 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1170);
    float _1232 = _1184 + (-1.0);
    float _1234 = 1.0 / _1198;
    float _1236 = _1162;
    if (_924)
    {
        float _1238 = _1186 ? _1228 : _1162;
        _1236 = _1238;
    }
    float _1240 = _1236;
    float _1242 = _902 + (-0.5);
    float _1244 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1246 = fma(_1224, _1190, _1224);
    float _1248 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1174);
    float _1250 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1206);
    float _1252 = fma(_1244, _1194, _1244);
    float _1254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1256 = fma(_1246, _1066, _1220);
    float _1258 = _932 * _1248;
    float _1260 = fma(_1252, _1066, _1250);
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1264 = _900 + _1262;
    float _1266 = _1256 * 0.15915493667125701904296875;
    float _1268 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _928);
    float _1270 = _1260 * 0.15915493667125701904296875;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1274 = _900 + _1272;
    float _1276 = _1218 * 6.283185482025146484375;
    float _1278 = sin(_1276);
    float _1280 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _930);
    float _1282 = _944 * _1230;
    float _1284 = _1264 * _1234;
    float _1286 = _1274 * _1214;
    float _1288 = _962 * _1222;
    float _1290 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1292 = _1218 * 6.283185482025146484375;
    float _1294 = cos(_1292);
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1298 = _900 + _1296;
    float _1300 = fma(_1290, _1240, -0.5);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1302;
    float _1306 = _1190;
    float _1308 = _1268;
    if (_918)
    {
        float _1310 = in.m_53.x;
        _1306 = _1310;
    }
    float _1312 = _1306;
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1314;
    float _1318 = -_1058;
    float _1320 = fma(_1060, _1300, _1318);
    float _1322 = _1266 * 6.283185482025146484375;
    float _1324 = sin(_1322);
    float _1326 = _1280 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1328 = fma(_1316, _1284, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1330;
    float _1334 = _1266 * 6.283185482025146484375;
    float _1336 = cos(_1334);
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1338;
    float _1342 = fma(_1332, _1284, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1344 = _1270 * 6.283185482025146484375;
    float _1346 = cos(_1344);
    float _1348 = _1294 * _1324;
    float _1350 = _1278 * _1324;
    bool _1352 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1354 = isnan(_900);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1360 = _1356 || _1358;
    float _1362 = float(_1360);
    bool _1364 = _1312 > 0.5;
    bool _1366 = _1364 && _918;
    float _1368 = _1270 * 6.283185482025146484375;
    float _1370 = sin(_1368);
    float _1372 = _1278 * _1336;
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1374;
    float _1378 = _1324 * _1346;
    float _1380 = _1294 * _1336;
    float _1382 = _1346 * _1288;
    float _1384 = _1336 * _1346;
    float _1386 = 1.0 / _1304;
    float _1388 = _1294 * _1382;
    float _1390 = _1278 * _1382;
    float _1392 = -_1348;
    float _1394 = fma(_1370, _1372, _1392);
    float _1396 = -_1372;
    float _1398 = fma(_1370, _1348, _1396);
    float _1400 = fma(_1370, _1380, _1350);
    float _1402 = -_1288;
    float _1404 = _1370 * _1402;
    float _1406 = fma(_1370, _1350, _1380);
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1410 = _1408 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1412 = fma(_1400, _1282, _1388);
    float _1414 = fma(_1384, _1282, _1404);
    float _1416 = fma(_1394, _1282, _1390);
    float _1418 = _948 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1420 = fma(_1398, _1258, _1412);
    float _1422 = fma(_1378, _1258, _1414);
    float _1424 = fma(_1406, _1258, _1416);
    float _1426 = _1298 * _1386;
    float _1428 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1430 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1432 = in.m_59.x;
    float _1434 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1428);
    float _1436 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1430);
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1440 = _1438 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1442;
    float _1446 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1434);
    float _1448 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1436);
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1452 = _1450 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1454 = fma(_1444, _1284, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1456 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1458 = _1448 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _1460 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1462 = isnan(_900);
    bool _1464 = _1460 || _1462;
    bool _1466 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1468 = _1464 || _1466;
    float _1470 = float(_1468);
    float _1472 = fma(_1452, _1286, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1474 = _1418 + _1456;
    float _1476 = _1326 + _1458;
    float _1478 = fma(_1410, _1286, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1480 = fma(_1440, _1286, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1482 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1484 = _1474 + _1482;
    float _1486 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1488 = _1476 + _1486;
    bool _1490 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1492 = isnan(_900);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1498 = _1494 || _1496;
    float _1500 = float(_1498);
    float _1502 = -_1470;
    float _1504 = _1502 + 1.0;
    float _1506 = _1484 * _1484;
    float _1508 = _1488 * _1488;
    float _1510 = fma(_1340, _1426, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1512 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1514 = isnan(_900);
    bool _1516 = _1512 || _1514;
    bool _1518 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1520 = _1516 || _1518;
    float _1522 = float(_1520);
    float _1524 = _1506 + _1508;
    float _1526 = _1500 * _1504;
    float _1528 = -_1500;
    float _1530 = _1528 + 1.0;
    float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1532;
    float _1536 = sqrt(_1524);
    float _1538 = -_1522;
    float _1540 = _1538 + 1.0;
    float _1542 = _1522 * _1530;
    float _1544 = fma(_1534, _1426, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1546 = fma(_1376, _1426, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1548 = 0.0;
    float _1550 = _1432;
    float _1552 = _1454;
    float _1554 = _1506;
    float _1556 = _1508;
    float _1558 = _1328;
    float _1560 = _1470;
    if (_918)
    {
        _1548 = _1432;
    }
    float _1562 = _1548;
    float _1564 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1566 = _1362 * _1540;
    float _1568 = -_1362;
    float _1570 = _1568 + 1.0;
    float _1572 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1564);
    float _1574 = _1562;
    if (_1366)
    {
        float _1576 = -_1562;
        float _1578 = _1576 + 1.0;
        _1574 = _1578;
    }
    float _1580 = _1574;
    float _1582 = _1454 * _1566;
    float _1584 = _1328 * _1566;
    float _1586 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1572);
    float _1588 = _1268 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1590 = _1536 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1592 = _1342 * _1566;
    float _1594 = _1586 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1596 = _1592;
    if (_918)
    {
        _1550 = _1580;
    }
    float _1598 = _1550;
    float _1600 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1602 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1582);
    float _1604 = _1588 + _1594;
    float _1606 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1584);
    float _1608 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1592);
    float _1610 = fma(_1600, _1598, -0.5);
    float _1612 = fma(_1472, _1542, _1602);
    if (!_1590)
    {
        _1308 = _1474;
    }
    float _1614 = _1308;
    float _1616 = _1614;
    if (!_1590)
    {
        _1552 = _1476;
    }
    float _1618 = _1552;
    float _1620 = _1618;
    if (!_1590)
    {
        _1596 = _1604;
    }
    float _1622 = _1596;
    bool _1624 = !_1590;
    float _1626 = _1622;
    if (!_1624)
    {
        float _1628 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1630 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1632 = _1536 + _1630;
        float _1634 = _1604 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1636 = rsqrt(_1524);
        float _1638 = _1632 * _1628;
        float _1640 = _1638 * 0.15915493667125701904296875;
        float _1642 = _1640 * 6.283185482025146484375;
        float _1644 = sin(_1642);
        float _1646 = _1640 * 6.283185482025146484375;
        float _1648 = cos(_1646);
        float _1650 = fma(_1644, _1634, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1652 = _1636 * _1650;
        float _1654 = fma(_1484, _1652, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1656 = _1648 + (-1.0);
        float _1658 = fma(_1488, _1652, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1660 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1662 = _1654 + _1660;
        float _1664 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1666 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1668 = _1658 + _1666;
        float _1670 = _1662 * _1662;
        float _1672 = fma(_1604, _1648, _1664);
        float _1674 = _1668 * _1668;
        _1626 = _1672;
        _1554 = _1670;
        _1556 = _1674;
        _1616 = _1654;
        _1620 = _1658;
        _1558 = _1664;
    }
    float _1676 = _1626;
    float _1678 = _1554;
    float _1680 = _1556;
    float _1682 = _1616;
    float _1684 = _1620;
    float _1686 = _1558;
    float _1688 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1690 = _1676 + _1688;
    float _1692 = fma(_1478, _1542, _1606);
    float _1694 = fma(_1480, _1542, _1608);
    float _1696 = fma(_1544, _1526, _1612);
    float _1698 = fma(_1690, _1690, _1678);
    float _1700 = fma(_1546, _1526, _1692);
    float _1702 = fma(_1510, _1526, _1694);
    float _1704 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1696);
    float _1706 = _1698 + _1680;
    float _1708 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1700);
    float _1710 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1702);
    float _1712 = _1320 + 0.5;
    float _1714 = fma(_1056, _1610, _1054);
    float _1716 = sqrt(_1706);
    float _1718 = _1704 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1720 = _1708 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1722 = _1710 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1724 = _1714 + 0.5;
    float _1726 = _1718 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1728 = _1720 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1730 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _1724;
    out.m_63.y = _1712;
    out.m_65.x = _1726;
    out.m_65.y = _1728;
    out.m_65.z = _1730;
    bool _1732 = _1716 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1734 = isnan(_1716);
    bool _1736 = _1732 || _1734;
    bool _1738 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1740 = _1736 || _1738;
    float _1742 = _1676;
    float _1744 = _1686;
    float _1746 = _1728;
    if (!_1740)
    {
        _1560 = 1.0;
    }
    float _1748 = _1560;
    bool _1750 = !_1740;
    float _1752 = _1748;
    if (!_1750)
    {
        bool _1754 = _1716 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1756 = isnan(_1716);
        bool _1758 = _1754 || _1756;
        bool _1760 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1762 = _1758 || _1760;
        if (!_1762)
        {
            float _1764 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1766 = _1716 + _1764;
            float _1768 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1770 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1768;
            float _1772 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1774 = _1772 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1776 = 1.0 / _1770;
            float _1778 = _1766 * _1776;
            float _1780 = fma(_1778, _1774, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1752 = _1780;
            _1782 = true;
        }
        else
        {
            bool _1784 = _1716 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1786 = isnan(_1716);
            bool _1788 = _1784 || _1786;
            bool _1790 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1792 = _1788 || _1790;
            if (!_1792)
            {
                float _1794 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1796 = _1716 + _1794;
                float _1798 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1800 = _1798 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1802 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1804 = _1802 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1806 = 1.0 / _1800;
                float _1808 = _1796 * _1806;
                float _1810 = fma(_1808, _1804, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1752 = _1810;
                _1782 = true;
            }
            else
            {
                _1752 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1782 = false;
    float _1812 = _1752;
    float _1814 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1816 = _1676 + _1814;
    float _1818 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1820 = _1682 + _1818;
    float _1822 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1824 = _1684 + _1822;
    float _1826 = fma(_1816, _1812, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1828 = fma(_1820, _1812, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1830 = fma(_1824, _1812, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1832 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1834 = _1826 + _1832;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1838 = _1828 + _1836;
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1842 = _1830 + _1840;
    float _1844 = _1834 * _1834;
    float _1846 = fma(_1838, _1838, _1844);
    float _1848 = fma(_1842, _1842, _1846);
    float _1850 = rsqrt(_1848);
    float _1852 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1854 = _1838 * _1852;
    float _1856 = _1842 * _1852;
    float _1858 = _1854 * _1854;
    float _1860 = _1856 * _1856;
    float _1862 = _1858 + _1860;
    float _1864 = sqrt(_1862);
    bool _1866 = _1864 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1868 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1870 = _1864 + _1868;
    float _1872 = _1842;
    float _1874 = _1870;
    float _1876 = _1834;
    if (_1866)
    {
        float _1878 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1872 = _1878;
    }
    float _1880 = _1872;
    if (_1866)
    {
        float _1882 = rsqrt(_1862);
        _1742 = _1882;
    }
    float _1884 = _1742;
    float _1886 = _1884;
    if (_1866)
    {
        float _1888 = _1870 * _1880;
        _1874 = _1888;
    }
    float _1890 = _1874;
    if (_1866)
    {
        float _1892 = _1890 * 0.15915493667125701904296875;
        _1744 = _1892;
    }
    float _1894 = _1744;
    float _1896 = _1850;
    if (_1866)
    {
        float _1898 = _1894 * 6.283185482025146484375;
        float _1900 = sin(_1898);
        _1896 = _1900;
    }
    float _1902 = _1896;
    float _1904 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1906 = precise::max(0.0, _1904);
    float _1908 = _1846;
    float _1910 = _1906;
    float _1912 = _1904;
    if (_1866)
    {
        float _1914 = _1894 * 6.283185482025146484375;
        float _1916 = cos(_1914);
        _1908 = _1916;
    }
    float _1918 = _1908;
    float _1920 = -_1852;
    float _1922 = -_1906;
    float _1924 = fma(_1834, _1920, _1922);
    if (!_1866)
    {
        _1910 = _1858;
    }
    float _1926 = _1910;
    float _1928 = _1926;
    if (_1866)
    {
        float _1930 = _1924 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1912 = _1930;
    }
    float _1932 = _1912;
    float _1934 = sqrt(_1848);
    float _1936 = _1902;
    float _1938 = _1932;
    if (_1866)
    {
        float _1940 = fma(_1902, _1932, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1876 = _1940;
    }
    float _1942 = _1876;
    float _1944 = _1942;
    if (!_1866)
    {
        _1936 = _1854;
    }
    float _1946 = _1936;
    float _1948 = _1946;
    float _1950 = _1918;
    if (_1866)
    {
        float _1952 = _1918 + (-1.0);
        _1938 = _1952;
    }
    float _1954 = _1938;
    float _1956 = _1954;
    if (_1866)
    {
        float _1958 = _1884 * _1942;
        _1746 = _1958;
    }
    float _1960 = _1746;
    if (!_1866)
    {
        _1944 = _1924;
    }
    float _1962 = _1944;
    float _1964 = _1962;
    if (_1866)
    {
        float _1966 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1886 = _1966;
    }
    float _1968 = _1886;
    if (_1866)
    {
        float _1970 = _1854 * _1960;
        _1948 = _1970;
    }
    float _1972 = _1948;
    if (!_1866)
    {
        _1956 = _1856;
    }
    float _1974 = _1956;
    float _1976 = _1974;
    if (_1866)
    {
        float _1978 = _1856 * _1960;
        _1976 = _1978;
    }
    float _1980 = _1976;
    if (_1866)
    {
        float _1982 = fma(_1924, _1918, _1968);
        _1964 = _1982;
    }
    float _1984 = _1964;
    if (_1866)
    {
        float _1986 = _1972 * _1972;
        _1928 = _1986;
    }
    float _1988 = _1928;
    if (!_1866)
    {
        _1950 = _1860;
    }
    float _1990 = _1950;
    float _1992 = _1990;
    if (_1866)
    {
        float _1994 = _1980 * _1980;
        _1992 = _1994;
    }
    float _1996 = _1992;
    float _1998 = fma(_1984, _1984, _1988);
    float _2000 = _1998 + _1996;
    float _2002 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2004 = fma(_1934, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2002);
    float _2006 = precise::clamp(_2004, 0.0, 1.0);
    float _2008 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2010 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2012 = rsqrt(_2000);
    float _2014 = -_2006;
    float _2016 = _2014 + 1.0;
    float _2018 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2008);
    float _2020 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2010);
    float _2022 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2024 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2026 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2018);
    float _2028 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2030 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2020);
    float _2032 = abs(_2016);
    float _2034 = log2(_2032);
    float _2036 = _2026 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2038 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2028);
    float _2040 = _2030 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2042 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2022);
    float _2044 = _2036 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2046 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2038);
    float _2048 = _2012 * _1972;
    float _2050 = _2012 * _1984;
    float _2052 = _2012 * _1980;
    float _2054 = _2046 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2056 = _2048 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2058 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2060 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2042);
    float _2062 = -_2044;
    float _2064 = fma(_2062, _2024, 1.0);
    float _2066 = -_2056;
    float _2068 = fma(_2050, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2066);
    float _2070 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2058);
    float _2072 = _2060 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2074 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2076 = -_2052;
    float _2078 = fma(_2076, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2068);
    float _2080 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2070);
    float _2082 = log2(_2064);
    float _2084 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2086 = fma(_2078, -0.5, 0.5);
    float _2088 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2080);
    float _2090 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2092 = fma(_2078, 0.5, 0.5);
    float _2094 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2084);
    float _2096 = _2050 + 1.0;
    float _2098 = exp2(_2074);
    float _2100 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2090);
    float _2102 = fma(_2092, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2104 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2094);
    float _2106 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2100);
    float _2108 = fma(_2092, _2102, -0.212114393711090087890625);
    float _2110 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2104);
    float _2112 = 1.0 / _2088;
    float _2114 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2106);
    float _2116 = _2082 * 0.693147182464599609375;
    float _2118 = fma(_2092, _2108, 1.570728778839111328125);
    float _2120 = sqrt(_2086);
    float _2122 = -_2050;
    float _2124 = fma(_2098, _2096, _2122);
    float _2126 = fma(_2124, 0.5, 0.5);
    float _2128 = _2110 * _2112;
    float _2130 = _2114 * _2112;
    float _2132 = _2116 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2134 = fma(_2128, 0.5, 0.5);
    float _2136 = fma(_2130, -0.5, 0.5);
    float _2138 = _2120 * 0.636619746685028076171875;
    float _2140 = -_2118;
    float _2142 = fma(_2138, _2140, 1.0);
    float3 _5710 = float3(_2134, _2136, _2132);
    float _2144 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5710, float3(0.0), isnan(_5710)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5710, float3(0.0), isnan(_5710)), level(0.0)).x;
    float3 _5721 = float3(_2134, _2136, _2132);
    float4 _2147 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5721, float3(0.0), isnan(_5721)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5721, float3(0.0), isnan(_5721)), level(0.0)).xyzw;
    float _2149 = _2147.x;
    float _2151 = _2147.y;
    float _2153 = _2147.z;
    float _2155 = _2147.w;
    float2 _5738 = float2(_2142, _2126);
    float3 _2159 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5738, float2(0.0), isnan(_5738)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5738, float2(0.0), isnan(_5738)), level(0.0)).xyz;
    float _2161 = _2159.x;
    float _2163 = _2159.y;
    float _2165 = _2159.z;
    float _2167 = _1588 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2169 = _1588 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2171 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2167);
    float _2173 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2169);
    float _2175 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2171);
    float _2177 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2173);
    float _2179 = _2175 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2181 = _2177 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2183 = 1.0 / _2179;
    float _2185 = _2181 + _2179;
    float _2187 = _2185 * _2183;
    float _2189 = _2187 * 0.5;
    float _2191 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2193 = fma(_2189, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2191);
    float _2195 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2197 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2199 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2201 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2203 = _2199 || _2201;
    bool _2205 = isnan(0.5);
    bool _2207 = _2203 || _2205;
    float _2209 = 1.0 / _2193;
    float _2211 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2195);
    float _2213 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2211);
    float _2215 = exp2(_2197);
    float _2217 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2213);
    float _2219 = _2211;
    float _2221 = _2036;
    if (_2207)
    {
        _2219 = 1.0;
    }
    float _2223 = _2219;
    float _2225 = _2223;
    if (_2207)
    {
        _2221 = 1.0;
    }
    float _2227 = _2221;
    float _2229 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2231 = _2209 * _2229;
    float _2233 = _2227;
    if (!_2207)
    {
        float _2235 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2237 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2239 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2237;
        float _2241 = _2235 * 0.15915493667125701904296875;
        float _2243 = _2241 * 6.283185482025146484375;
        float _2245 = cos(_2243);
        float _2247 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2249 = _2247 * 0.15915493667125701904296875;
        float _2251 = _2241 * 6.283185482025146484375;
        float _2253 = sin(_2251);
        float _2255 = 1.0 / _2245;
        float _2257 = _2249 * 6.283185482025146484375;
        float _2259 = cos(_2257);
        float _2261 = _2253 * _2255;
        float _2263 = _2249 * 6.283185482025146484375;
        float _2265 = sin(_2263);
        float _2267 = _2259 * _2261;
        float _2269 = 1.0 / _2239;
        float _2271 = 1.0 / _2267;
        float _2273 = _2265 * _2271;
        float _2275 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2277 = fma(_2231, _2273, _2275);
        float _2279 = _2277 * _2269;
        float _2281 = precise::clamp(_2279, 0.0, 1.0);
        _2225 = _2281;
    }
    float _2283 = _2225;
    if (!_2207)
    {
        float _2285 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2287 = _2285 * 0.15915493667125701904296875;
        float _2289 = _2287 * 6.283185482025146484375;
        float _2291 = cos(_2289);
        float _2293 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2295 = _2293 * 0.15915493667125701904296875;
        float _2297 = _2287 * 6.283185482025146484375;
        float _2299 = sin(_2297);
        float _2301 = 1.0 / _2291;
        float _2303 = _2295 * 6.283185482025146484375;
        float _2305 = cos(_2303);
        float _2307 = _2299 * _2301;
        float _2309 = _2295 * 6.283185482025146484375;
        float _2311 = sin(_2309);
        float _2313 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2315 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2313;
        float _2317 = _2305 * _2307;
        float _2319 = 1.0 / _2315;
        float _2321 = 1.0 / _2317;
        float _2323 = _2311 * _2321;
        float _2325 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2327 = fma(_2231, _2323, _2325);
        float _2329 = _2327 * _2319;
        float _2331 = precise::clamp(_2329, 0.0, 1.0);
        float _2333 = -_2331;
        float _2335 = _2333 + 1.0;
        _2233 = _2335;
    }
    float _2337 = _2233;
    float _2339 = _2283 * _2337;
    float _2341 = -_2215;
    float _2343 = _2341 + 1.0;
    bool _2345 = _2283 > 0.0;
    bool _2347 = isnan(_2283);
    bool _2349 = _2345 || _2347;
    bool _2351 = isnan(0.0);
    bool _2353 = _2349 || _2351;
    float _2355 = _2217 + _2088;
    float _2357 = _2339 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2359 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2361 = _2337 <= 0.0;
    bool _2363 = !_2353;
    bool _2365 = _2361 || _2363;
    out.m_67.x = _1828;
    out.m_67.y = _1826;
    out.m_67.z = _1830;
    float _2367 = _2359 * _2144;
    float _2369 = -_2359;
    float _2371 = _2369 + 1.0;
    out.gl_Position.x = _2110;
    out.gl_Position.y = _2114;
    out.gl_Position.z = _2217;
    out.gl_Position.w = _2088;
    float _2373 = _2355 * 0.5;
    float _2375 = _2155 * _2367;
    float _2377 = _2165 * _2367;
    float _2379 = _2357 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.z = _2373;
    out.m_69.w = _2088;
    float _2381 = fma(_2161, _2375, _2149);
    float _2383 = fma(_2163, _2375, _2151);
    float _2385 = _2155 * _2371;
    float _2387 = fma(_2155, _2377, _2153);
    out.m_47.x = _2379;
    out.m_71.x = _2381;
    out.m_71.y = _2383;
    out.m_71.z = _2387;
    out.m_71.w = _2385;
    if (!_2365)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2389 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2389;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

