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
    constant _16* vp_c13 [[id(6)]];
    texture3d<float> vp_t_tcb_32 [[id(7)]];
    sampler vp_t_tcb_32Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_30 [[id(9)]];
    sampler vp_t_tcb_30Smplr [[id(10)]];
    texture2d<float> vp_t_tcb_1C [[id(11)]];
    sampler vp_t_tcb_1CSmplr [[id(12)]];
    sampler vp_t_tcb_32Smplr_w [[id(13)]];
    sampler vp_t_tcb_30Smplr_w [[id(14)]];
    sampler vp_t_tcb_1CSmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_65 [[user(locn0)]];
    float4 m_79 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_91 [[user(locn3)]];
    float4 m_77 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_85 [[user(locn6)]];
    float4 m_83 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_75 [[attribute(8)]];
    float4 m_69 [[attribute(9)]];
    float4 m_61 [[attribute(10)]];
    float4 m_63 [[attribute(11)]];
    float4 m_67 [[attribute(12)]];
    float4 m_73 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2513 = false;
    bool _1862 = false;
    bool _610 = false;
    bool _456 = false;
    bool _234 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2812 = as_type<float>(_126);
        out.gl_Position.z = _2812;
    }
    if (!_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_51.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_110);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    if (_158)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _120;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2881 = as_type<float>(_164);
        out.gl_Position.z = _2881;
    }
    if (_158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _166 = in.m_53.x;
    float _168 = in.m_53.y;
    float _170 = in.m_53.z;
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    float _180 = in.m_57.x;
    float _182 = in.m_57.y;
    float _184 = in.m_57.z;
    float _186 = in.m_59.x;
    float _188 = in.m_59.y;
    float _190 = in.m_59.z;
    float _192 = _168 * _176;
    float _194 = _168 * _182;
    float _196 = fma(_166, _174, _192);
    float _198 = _168 * _188;
    float _200 = fma(_166, _180, _194);
    float _202 = fma(_170, _178, _196);
    float _204 = fma(_166, _186, _198);
    float _206 = fma(_170, _184, _200);
    float _208 = fma(_170, _190, _204);
    bool _210 = !_172;
    float _212 = _184;
    float _214 = _190;
    float _232;
    if (!_210)
    {
        float _216 = in.m_61.x;
        float _218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _220 = _216 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _222 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _224 = _222 * _218;
        float _226 = floor(_224);
        float _228 = -_226;
        float _230 = _224 + _228;
        _232 = _230;
        _234 = true;
    }
    else
    {
        float _236 = float(_110);
        float _238 = 1.0 / _236;
        float _240 = _144 * _238;
        _232 = _240;
    }
    _234 = false;
    float _242 = _232;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _246 = _242 + _244;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _250 = _242 + _248;
    bool _252 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _254 = isnan(_242);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _270 = _268 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _278 = _242 + _276;
    float _280 = 1.0 / _266;
    bool _282 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_242);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    bool _294 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _296 = 1.0 / _274;
    float _298 = 1.0 / _270;
    float _300 = _246 * _280;
    bool _302 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _304 = isnan(_242);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -_312;
    float _316 = _314 + 1.0;
    float _318 = _250 * _296;
    bool _320 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _322 = isnan(_242);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _332;
    float _336 = _262 * _316;
    float _338 = -_262;
    float _340 = _338 + 1.0;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _346 = -_330;
    float _348 = _346 + 1.0;
    float _350 = fma(_334, _300, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _352 = _278 * _298;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _358;
    float _362 = _292 * _348;
    float _364 = fma(_344, _352, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _366 = fma(_356, _300, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _368 = fma(_360, _300, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _370 = _330 * _340;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _380 = _366 * _362;
    float _382 = _368 * _362;
    float _384 = _350 * _362;
    float _386 = fma(_374, _352, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _388 = fma(_378, _352, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _390 = -_292;
    float _392 = _390 + 1.0;
    float _394 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].y, _382);
    float _396 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].x, _380);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _398;
    float _402 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].z, _384);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _408;
    float _412 = fma(_364, _370, _396);
    float _414 = fma(_400, _318, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _416 = fma(_406, _318, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _418 = fma(_410, _318, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _420 = fma(_386, _370, _394);
    float _422 = fma(_388, _370, _402);
    float _424 = fma(_416, _336, _412);
    float _426 = fma(_414, _336, _420);
    float _428 = fma(_418, _336, _422);
    float _430 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[146].x, _424);
    float _432 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[146].y, _426);
    float _434 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[146].z, _428);
    bool _436 = !_294;
    float _454;
    if (!_436)
    {
        float _438 = in.m_61.x;
        float _440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _442 = _438 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _446 = _444 * _440;
        float _448 = floor(_446);
        float _450 = -_448;
        float _452 = _446 + _450;
        _454 = _452;
        _456 = true;
    }
    else
    {
        float _458 = float(_110);
        float _460 = 1.0 / _458;
        float _462 = _144 * _460;
        _454 = _462;
    }
    _456 = false;
    float _464 = _454;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _464 + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _474 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _476 = isnan(_464);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _490 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _492 = isnan(_464);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _502;
    bool _506 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _508 = isnan(_464);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = 1.0 / _472;
    float _520 = -_484;
    float _522 = _520 + 1.0;
    bool _524 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _526 = _500 * _522;
    float _528 = -_500;
    float _530 = _528 + 1.0;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _534 = 1.0 / _488;
    float _536 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _538 = _504 * _518;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _544 = fma(_538, _468, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _546 = -_516;
    float _548 = _546 + 1.0;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _552 = _544 * _526;
    float _554 = _542 * _534;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _558 = _464 + _556;
    float _560 = _484 * _548;
    float _562 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[115].x, _552);
    float _564 = _550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _566 = fma(_554, _558, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _568 = fma(_566, _560, _562);
    float _570 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[117].x, _568);
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _574 = in.m_63.x;
    float _576 = in.m_63.y;
    float _578 = in.m_63.z;
    float _580 = _570 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _582 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _564;
    out.m_65.y = _582;
    out.m_65.z = _536;
    out.m_65.w = _580;
    float _584 = _434 * _578;
    float _586 = _432 * _576;
    float _588 = _430 * _574;
    bool _590 = !_524;
    float _608;
    if (!_590)
    {
        float _592 = in.m_61.x;
        float _594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _596 = _592 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _598 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _600 = _598 * _594;
        float _602 = floor(_600);
        float _604 = -_602;
        float _606 = _600 + _604;
        _608 = _606;
        _610 = true;
    }
    else
    {
        float _612 = float(_110);
        float _614 = 1.0 / _612;
        float _616 = _144 * _614;
        _608 = _616;
    }
    _610 = false;
    float _618 = _608;
    float _620 = in.m_67.y;
    float _622 = _586 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _624 = in.m_61.w;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _628 = _626 != 0;
    float _630 = _202 * _202;
    int _632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _634 = _632 != 0;
    float _636 = in.m_61.y;
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _640 = _638 != 0;
    float _642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _646 = _644 != 0;
    float _648 = in.m_46.x;
    float _650 = in.m_46.y;
    float _652 = in.m_46.z;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _656 = _654 != 0;
    float _658 = fma(_206, _206, _630);
    float _660 = in.m_61.x;
    float _662 = fma(_208, _208, _658);
    float _664 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _666 = log2(_664);
    float _668 = in.m_61.z;
    float _670 = _584 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _672 = -_620;
    float _674 = _672 + 1.0;
    float _676 = in.m_57.w;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _680 = rsqrt(_662);
    bool _682 = _624 > 0.5;
    float _684 = in.m_67.x;
    int _686 = _682 ? as_type<int>(_674) : as_type<int>(_620);
    float _688 = in.m_69.x;
    float _690 = in.m_69.y;
    float _692 = in.m_69.z;
    bool _694 = _636 > 0.5;
    float _696 = _182 * _650;
    float _698 = _176 * _650;
    float _700 = _188 * _650;
    float _702 = _646 ? as_type<float>(_686) : _620;
    float _704 = fma(_180, _648, _696);
    float _706 = _620;
    if (_628)
    {
        float _708 = _694 ? _674 : _620;
        _706 = _708;
    }
    float _710 = _706;
    float _712 = fma(_186, _648, _700);
    int _714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _716 = _714 != 0;
    int _718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _720 = _718 != 0;
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _724 = _722 != 0;
    float _726 = fma(_174, _648, _698);
    float _728 = fma(_184, _652, _704);
    float _730 = fma(_178, _652, _726);
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _734 = _732 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _736 = _660 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _740 = 1.0 / _734;
    float _742 = -_738;
    float _744 = fma(_736, 2.0, _742);
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _748 = _636 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _754 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _690);
    float _756 = fma(_748, -2.0, _746);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _762 = 1.0 / _752;
    float _764 = _622 * _754;
    float _766 = _660 * 2.0;
    float _768 = fma(_190, _652, _712);
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _770;
    bool _774 = _694;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _778 = _760;
    float _780 = _766;
    int _782 = as_type<int>(_768);
    int _784 = as_type<int>(_730);
    if (!_656)
    {
        _212 = _668;
    }
    float _786 = _212;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _792 = _786;
    if (_640)
    {
        bool _794 = _668 > 0.5;
        _774 = _794;
    }
    bool _796 = _774;
    float _798 = 1.0 / _760;
    float _800 = _772 * _740;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _806 = 0.0;
    if (!_656)
    {
        _806 = _636;
    }
    float _808 = _806;
    float _810 = _206 * _680;
    float _812 = _808;
    if (!_656)
    {
        _776 = _660;
    }
    float _814 = _776;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _816;
    float _820 = floor(_766);
    float _822 = _804 * _762;
    float _824 = _814;
    if (!_656)
    {
        _778 = _786;
    }
    float _826 = _778;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _832 = _826;
    if (_656)
    {
        _792 = _668;
    }
    float _834 = _792;
    float _836 = -_144;
    float _838 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[76].x, _744);
    if (!_656)
    {
        _214 = _826;
    }
    float _840 = _214;
    float _842 = in.m_55.w;
    float _844 = _818 * _798;
    float _846 = _660 + _636;
    float _848 = 1.0 / _790;
    float _850 = _846 + (-1.0);
    float _852 = _840;
    if (!_656)
    {
        _780 = _636;
    }
    float _854 = _780;
    float _856 = _854;
    if (_656)
    {
        _812 = _660;
    }
    float _858 = _812;
    float _860 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _864 = _618 + _862;
    float _866 = _636 * 2.0;
    if (_656)
    {
        _856 = _660;
    }
    float _868 = _856;
    if (_656)
    {
        _824 = _834;
    }
    float _870 = _824;
    float _872 = floor(_866);
    if (_656)
    {
        _852 = _636;
    }
    float _874 = _852;
    float _876 = fma(_822, _864, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    if (_656)
    {
        _832 = _636;
    }
    float _878 = _832;
    float _880 = _642 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _882 = _820 >= 0.0;
    bool _884 = isnan(_820);
    bool _886 = _882 || _884;
    bool _888 = isnan(0.0);
    bool _890 = _886 || _888;
    float _892 = _666 * _144;
    float _894 = _830 * _848;
    float _896 = fma(_702, _880, -0.5);
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _900 = _618 + _898;
    int _902 = _890 ? 0 : 1;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _906 = _618 + _904;
    bool _908 = _820 > 0.0;
    float _910 = fma(_844, _900, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _912 = exp2(_892);
    float _914 = fma(_800, _906, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _916 = ~_902;
    int _918 = _916 + 1;
    int _920 = _918 + 1;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _926 = _618 + _924;
    float _928 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[83].z, _922);
    float _930 = _202 * _680;
    float _932 = _208 * _680;
    float _934 = _728 + _676;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _938 = _858 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _940 = fma(_894, _926, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    int _942 = _920;
    float _944 = _894;
    if (!_908)
    {
        int _946 = ~_902;
        int _948 = _946 + 1;
        _942 = _948;
    }
    int _950 = _942;
    float _952 = -_936;
    float _954 = fma(_938, 2.0, _952);
    bool _956 = _872 >= 0.0;
    bool _958 = isnan(_872);
    bool _960 = _956 || _958;
    bool _962 = isnan(0.0);
    bool _964 = _960 || _962;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _968 = _874 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _970 = _964 ? 0 : 1;
    float _972 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[83].w, _966);
    float _974 = fma(_968, -2.0, _678);
    bool _976 = _872 > 0.0;
    float _978 = _636 + _834;
    float _980 = _660 + _834;
    float _982 = _872;
    if (!_634)
    {
        _982 = _684;
    }
    float _984 = _982;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _988 = _978 + (-1.0);
    float _990 = _980 + (-1.0);
    float _992 = _984;
    if (!_634)
    {
        _944 = _984;
    }
    float _994 = _944;
    float _996 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[84].z, _986);
    float _998 = _994;
    if (_634)
    {
        _992 = _684;
    }
    float _1000 = _992;
    float _1002 = _834 * 2.0;
    float _1004 = -_912;
    float _1006 = _1004 + 1.0;
    float _1008 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1010 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1012 = !_720;
    int _1014 = _1012 ? 0 : 1;
    float _1016 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[84].x, _996);
    bool _1018 = !_724;
    int _1020 = _1018 ? 0 : 1;
    float _1022 = floor(_1002);
    int _1024 = ~_970;
    int _1026 = _1024 + 1;
    int _1028 = _1026 + 1;
    float _1030 = _834 + (-0.5);
    int _1032 = _1028;
    if (!_976)
    {
        int _1034 = ~_970;
        int _1036 = _1034 + 1;
        _1032 = _1036;
    }
    int _1038 = _1032;
    float _1040 = _1016 * (-0.15915493667125701904296875);
    int _1042 = abs(_1014);
    int _1044 = abs(_1020);
    float _1046 = in.m_71.x;
    float _1048 = in.m_71.y;
    float _1050 = in.m_71.z;
    bool _1052 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1054 = isnan(0.0);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1042);
    float _1064 = float(_950);
    float _1066 = _1060 ? _1006 : 0.0;
    bool _1068 = _1022 > 0.0;
    float _1070 = _1062 * _1064;
    bool _1072 = _1022 >= 0.0;
    bool _1074 = isnan(_1022);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan(0.0);
    bool _1080 = _1076 || _1078;
    bool _1082 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1084 = isnan(1.0);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1090 = _1086 || _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1094 = 1.0 + _1092;
    float _1096 = float(_1044);
    float _1098 = _1070 * (-2.0);
    float _1100 = 1.0 / _1094;
    float _1102 = float(_1038);
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1106 = fma(_1008, _1098, _1008);
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1110 = fma(_1098, _1048, _1048);
    float _1112 = _1096 * _1102;
    float _1114 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1104);
    float _1116 = -_144;
    float _1118 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[81].x, _954);
    float _1120 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[191].x, _660);
    float _1122 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1108);
    float _1124 = _1112 * (-2.0);
    float _1126 = _636 + (-0.5);
    int _1128 = _1080 ? 0 : 1;
    float _1130 = _1120 + _690;
    float _1132 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1122);
    bool _1134 = !_716;
    int _1136 = _1134 ? 0 : 1;
    float _1138 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1114);
    float _1140 = fma(_1010, _1124, _1010);
    float _1142 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _756);
    float _1144 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _928);
    float _1146 = fma(_1124, _1050, _1050);
    float _1148 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1110);
    float _1150 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _972);
    int _1152 = ~_1128;
    int _1154 = _1152 + 1;
    int _1156 = _1154 + 1;
    float _1158 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1162 = _930 * _1160;
    int _1164 = _1156;
    bool _1166 = _1068;
    if (!_1068)
    {
        int _1168 = ~_1128;
        int _1170 = _1168 + 1;
        _1164 = _1170;
    }
    int _1172 = _1164;
    float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1176 = _932 * _1174;
    int _1178 = abs(_1136);
    float _1180 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _974);
    if (_1090)
    {
        float _1182 = _1066 * _1100;
        _148 = _1182;
    }
    float _1184 = _148;
    float _1186 = _1158 * 0.15915493667125701904296875;
    float _1188 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1190 = -_1162;
    float _1192 = fma(_932, _1188, _1190);
    float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1196 = -_1176;
    float _1198 = fma(_810, _1194, _1196);
    float _1200 = float(_1178);
    float _1202 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1204 = _810 * _1202;
    float _1206 = float(_1172);
    float _1208 = _1198 * _1198;
    float _1210 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1146);
    float _1212 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1214 = -_1204;
    float _1216 = fma(_930, _1212, _1214);
    float _1218 = fma(_1106, _1184, _1148);
    float _1220 = _1200 * _1206;
    float _1222 = fma(_1192, _1192, _1208);
    float _1224 = fma(_1140, _1184, _1210);
    float _1226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1228 = _1220 * (-2.0);
    float _1230 = in.m_59.w;
    float _1232 = fma(_1216, _1216, _1222);
    bool _1234 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1236 = isnan(_618);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1242 = _1238 || _1240;
    float _1244 = float(_1242);
    float _1246 = fma(_860, _1228, _860);
    float _1248 = _1218 * 0.15915493667125701904296875;
    float _1250 = in.m_73.x;
    float _1252 = _1186 * 6.283185482025146484375;
    float _1254 = sin(_1252);
    if (_634)
    {
        bool _1256 = _660 > 0.5;
        _1166 = _1256;
    }
    bool _1258 = _1166;
    float _1260 = _660 + (-0.5);
    bool _1262 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1264 = isnan(_618);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1270 = _1266 || _1268;
    float _1272 = float(_1270);
    float _1274 = -_1244;
    float _1276 = _1274 + 1.0;
    float _1278 = _1224 * 0.15915493667125701904296875;
    float _1280 = -_1272;
    float _1282 = _1280 + 1.0;
    float _1284 = fma(_1228, _1046, _1046);
    bool _1286 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1288 = isnan(_618);
    bool _1290 = _1286 || _1288;
    bool _1292 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1294 = _1290 || _1292;
    float _1296 = float(_1294);
    float _1298 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1300 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1302 = isnan(_618);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1308 = _1304 || _1306;
    float _1310 = float(_1308);
    float _1312 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1284);
    bool _1314 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1316 = isnan(_618);
    bool _1318 = _1314 || _1316;
    bool _1320 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1322 = _1318 || _1320;
    float _1324 = float(_1322);
    float _1326 = -_1296;
    float _1328 = _1326 + 1.0;
    float _1330 = _1296 * _1276;
    float _1332 = fma(_1246, _1184, _1312);
    float _1334 = _730 + _842;
    float _1336 = _1272 * _1328;
    float _1338 = _1310 * _1282;
    float _1340 = -_1310;
    float _1342 = _1340 + 1.0;
    float _1344 = _1332 * 0.15915493667125701904296875;
    float _1346 = _768 + _1230;
    float _1348 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1350 = _1324 * _1342;
    float _1352 = _1248 * 6.283185482025146484375;
    float _1354 = cos(_1352);
    float _1356 = fma(_1298, _710, -0.5);
    float _1358 = _1342;
    if (_634)
    {
        float _1360 = -_1000;
        float _1362 = _1360 + 1.0;
        _782 = as_type<int>(_1362);
    }
    int _1364 = _782;
    float _1366 = _914 * _1350;
    if (_640)
    {
        float _1368 = -_1000;
        float _1370 = _1368 + 1.0;
        _784 = as_type<int>(_1370);
    }
    int _1372 = _784;
    float _1374 = -_1324;
    float _1376 = _1374 + 1.0;
    float _1378 = _1348 * _1250;
    if (!_640)
    {
        _1358 = _1000;
    }
    float _1380 = _1358;
    float _1382 = _1278 * 6.283185482025146484375;
    float _1384 = cos(_1382);
    float _1386 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1366);
    float _1388 = _1380;
    if (_634)
    {
        float _1390 = _1258 ? as_type<float>(_1364) : _1000;
        _998 = _1390;
    }
    float _1392 = _998;
    float _1394 = _1378 + _692;
    if (_640)
    {
        float _1396 = _796 ? as_type<float>(_1372) : _1000;
        _1388 = _1396;
    }
    float _1398 = _1388;
    float _1400 = _1378 + _688;
    float _1402 = _588 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1404 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1394);
    float _1406 = _1344 * 6.283185482025146484375;
    float _1408 = sin(_1406);
    float _1410 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1400);
    float _1412 = -_1142;
    float _1414 = fma(_1138, _1356, _1412);
    float _1416 = _670 * _1404;
    float _1418 = fma(_876, _1338, _1386);
    float _1420 = _1402 * _1410;
    bool _1422 = _690 != 0.0;
    bool _1424 = isnan(_690);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan(0.0);
    bool _1430 = _1426 || _1428;
    float _1432 = _1248 * 6.283185482025146484375;
    float _1434 = sin(_1432);
    float _1436 = _1354 * _1384;
    float _1438 = -_688;
    bool _1440 = _1378 == _1438;
    bool _1442 = !_1430;
    bool _1444 = _1440 && _1442;
    float _1446 = -_692;
    bool _1448 = _1378 == _1446;
    bool _1450 = _1448 && _1444;
    float _1452 = _1344 * 6.283185482025146484375;
    float _1454 = cos(_1452);
    float _1456 = _1408 * _1354;
    float _1458 = rsqrt(_1232);
    float _1460 = _1434 * _1384;
    float _1462 = _1408 * _1434;
    float _1464 = _1408 * _1384;
    float _1466 = _1278 * 6.283185482025146484375;
    float _1468 = sin(_1466);
    float _1470 = _1454 * _1354;
    float _1472 = _1454 * _1434;
    float _1474 = _1454 * _1384;
    float _1476 = _1192 * _1458;
    float _1478 = _1198 * _1458;
    float _1480 = _1216 * _1458;
    float _1482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1484 = _930 * _1480;
    float _1486 = fma(_1468, _1470, _1462);
    float _1488 = fma(_1468, _1462, _1470);
    float _1490 = -_1472;
    float _1492 = fma(_1468, _1456, _1490);
    float _1494 = -_1456;
    float _1496 = fma(_1468, _1472, _1494);
    float _1498 = _1474 * _810;
    float _1500 = _810 * _1478;
    float _1502 = _1474 * _932;
    float _1504 = -_1484;
    float _1506 = fma(_932, _1478, _1504);
    float _1508 = -_1468;
    float _1510 = fma(_1508, _1476, _1498);
    float _1512 = -_1500;
    float _1514 = fma(_930, _1476, _1512);
    float _1516 = _1486 * _810;
    float _1518 = -_1468;
    float _1520 = fma(_1518, _1480, _1502);
    float _1522 = _1486 * _932;
    float _1524 = _1496 * _932;
    float _1526 = fma(_1436, _1476, _1516);
    float _1528 = _1496 * _810;
    float _1530 = fma(_1436, _1480, _1522);
    float _1532 = fma(_1464, _1506, _1510);
    float _1534 = fma(_1464, _1514, _1520);
    float _1536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1538 = fma(_1460, _1480, _1524);
    float _1540 = fma(_1492, _1506, _1526);
    float _1542 = fma(_1460, _1476, _1528);
    float _1544 = fma(_1492, _1514, _1530);
    float _1546 = _764 * _1532;
    float _1548 = _764 * _1534;
    float _1550 = fma(_1488, _1506, _1542);
    float _1552 = fma(_1488, _1514, _1538);
    float _1554 = fma(_1420, _1540, _1546);
    float _1556 = fma(_1420, _1544, _1548);
    float _1558 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1560 = fma(_910, _1336, _1418);
    float _1562 = fma(_1416, _1550, _1554);
    float _1564 = fma(_1416, _1552, _1556);
    float _1566 = _932 * _1476;
    float _1568 = _1536 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1570 = _934 + _1562;
    float _1572 = _1346 + _1564;
    float _1574 = fma(_1558, _1392, -0.5);
    float _1576 = fma(_1568, _1398, -0.5);
    float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1580 = _1570 + _1578;
    float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1584 = _1572 + _1582;
    float _1586 = fma(_1132, _1574, _838);
    float _1588 = _1474 * _930;
    float _1590 = _1580 * _1580;
    float _1592 = _1584 * _1584;
    float _1594 = in.m_75.x;
    float _1596 = in.m_75.y;
    float _1598 = in.m_75.z;
    float _1600 = _1040 * 6.283185482025146484375;
    float _1602 = sin(_1600);
    float _1604 = -_1566;
    float _1606 = fma(_810, _1480, _1604);
    float _1608 = _1590 + _1592;
    float _1610 = _1486 * _930;
    float _1612 = -_1468;
    float _1614 = fma(_1612, _1478, _1588);
    float _1616 = _1496 * _930;
    float _1618 = fma(_940, _1330, _1560);
    float _1620 = fma(_1436, _1478, _1610);
    float _1622 = sqrt(_1608);
    float _1624 = fma(_1464, _1606, _1614);
    float _1626 = fma(_1460, _1478, _1616);
    float _1628 = fma(_1492, _1606, _1620);
    float _1630 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1618);
    float _1632 = _764 * _1624;
    float _1634 = fma(_1488, _1606, _1626);
    float _1636 = _1040 * 6.283185482025146484375;
    float _1638 = cos(_1636);
    float _1640 = fma(_1420, _1628, _1632);
    float _1642 = _1602 * _896;
    float _1644 = fma(_1416, _1634, _1640);
    float _1646 = _1596;
    float _1648 = _1594;
    float _1650 = _1590;
    float _1652 = _1592;
    float _1654 = _1570;
    float _1656 = _1572;
    float _1658 = _1644;
    float _1660 = _1598;
    if (!_1450)
    {
        float _1662 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1596);
        _1646 = _1662;
    }
    float _1664 = _1646;
    bool _1666 = _1622 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1668 = _1334 + _1644;
    if (!_1450)
    {
        float _1670 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1594);
        _1648 = _1670;
    }
    float _1672 = _1648;
    float _1674 = _1532 * _1664;
    float _1676 = _1534 * _1664;
    float _1678 = _1638 * _896;
    float _1680 = -_1642;
    float _1682 = fma(_1638, _1576, _1680);
    float _1684 = fma(_1602, _1576, _1678);
    float _1686 = fma(_1144, _1682, _1118);
    float _1688 = _1682;
    if (!_1666)
    {
        _1688 = _1668;
    }
    float _1690 = _1688;
    float _1692 = -_1180;
    float _1694 = fma(_1150, _1684, _1692);
    float _1696 = _1624 * _1664;
    bool _1698 = !_1666;
    float _1700 = _1690;
    if (!_1698)
    {
        float _1702 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1704 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1706 = _1622 + _1704;
        float _1708 = rsqrt(_1608);
        float _1710 = _1706 * _1702;
        float _1712 = _1668 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1714 = _1710 * 0.15915493667125701904296875;
        float _1716 = _1714 * 6.283185482025146484375;
        float _1718 = sin(_1716);
        float _1720 = _1714 * 6.283185482025146484375;
        float _1722 = cos(_1720);
        float _1724 = fma(_1718, _1712, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1726 = _1708 * _1724;
        float _1728 = fma(_1580, _1726, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1730 = _1722 + (-1.0);
        float _1732 = fma(_1584, _1726, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1736 = _1728 + _1734;
        float _1738 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1740 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1742 = _1732 + _1740;
        float _1744 = _1736 * _1736;
        float _1746 = fma(_1668, _1722, _1738);
        float _1748 = _1742 * _1742;
        _1700 = _1746;
        _1650 = _1744;
        _1652 = _1748;
        _1654 = _1728;
        _1656 = _1732;
        _1658 = _1714;
    }
    float _1750 = _1700;
    float _1752 = _1650;
    float _1754 = _1652;
    float _1756 = _1654;
    float _1758 = _1656;
    float _1760 = _1658;
    float _1762 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1764 = _1750 + _1762;
    float _1766 = fma(_1540, _1672, _1674);
    float _1768 = fma(_1764, _1764, _1752);
    float _1770 = fma(_1628, _1672, _1696);
    float _1772 = _1760;
    if (!_1450)
    {
        float _1774 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1598);
        _1660 = _1774;
    }
    float _1776 = _1660;
    float _1778 = _1768 + _1754;
    float _1780 = fma(_1544, _1672, _1676);
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1786 = sqrt(_1778);
    float _1788 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1790 = fma(_1550, _1776, _1766);
    float _1792 = fma(_1634, _1776, _1770);
    float _1794 = _1782 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1796 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1798 = _1788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1800 = _1414 + 0.5;
    float _1802 = _1586 + 0.5;
    float _1804 = _1630 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1806 = _1686 + 0.5;
    float _1808 = _1694 + 0.5;
    float _1810 = fma(_1552, _1776, _1780);
    out.m_77.x = _1250;
    bool _1812 = _1786 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1814 = isnan(_1786);
    bool _1816 = _1812 || _1814;
    bool _1818 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1820 = _1816 || _1818;
    out.m_79.x = _1794;
    out.m_79.y = _1796;
    out.m_79.z = _1798;
    out.m_79.w = _1804;
    out.m_81.x = _1802;
    out.m_81.y = _1800;
    out.m_81.z = _1806;
    out.m_81.w = _1808;
    out.m_83.x = _1790;
    out.m_83.y = _1792;
    out.m_83.z = _1810;
    float _1822 = _1798;
    float _1824 = _1804;
    float _1826 = _1800;
    if (!_1820)
    {
        _1772 = 1.0;
    }
    float _1828 = _1772;
    bool _1830 = !_1820;
    float _1832 = _1828;
    if (!_1830)
    {
        bool _1834 = _1786 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1836 = isnan(_1786);
        bool _1838 = _1834 || _1836;
        bool _1840 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1842 = _1838 || _1840;
        if (!_1842)
        {
            float _1844 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1846 = _1786 + _1844;
            float _1848 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1850 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1848;
            float _1852 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1854 = _1852 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1856 = 1.0 / _1850;
            float _1858 = _1846 * _1856;
            float _1860 = fma(_1858, _1854, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1832 = _1860;
            _1862 = true;
        }
        else
        {
            bool _1864 = _1786 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1866 = isnan(_1786);
            bool _1868 = _1864 || _1866;
            bool _1870 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1872 = _1868 || _1870;
            if (!_1872)
            {
                float _1874 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1876 = _1786 + _1874;
                float _1878 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1880 = _1878 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1882 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1884 = _1882 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1886 = 1.0 / _1880;
                float _1888 = _1876 * _1886;
                float _1890 = fma(_1888, _1884, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1832 = _1890;
                _1862 = true;
            }
            else
            {
                _1832 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1862 = false;
    float _1892 = _1832;
    float _1894 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1896 = _1750 + _1894;
    float _1898 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1900 = _1756 + _1898;
    float _1902 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1904 = _1758 + _1902;
    float _1906 = fma(_1896, _1892, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1908 = fma(_1900, _1892, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1910 = fma(_1904, _1892, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1912 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1914 = _1906 + _1912;
    float _1916 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1918 = _1908 + _1916;
    float _1920 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1922 = _1910 + _1920;
    float _1924 = _1914 * _1914;
    float _1926 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1928 = fma(_1918, _1918, _1924);
    float _1930 = fma(_1922, _1922, _1928);
    float _1932 = rsqrt(_1930);
    float _1934 = _1932 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1936 = _1918 * _1934;
    float _1938 = _1922 * _1934;
    float _1940 = _1936 * _1936;
    float _1942 = _1938 * _1938;
    float _1944 = _1940 + _1942;
    float _1946 = sqrt(_1944);
    bool _1948 = _1946 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1950 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1952 = _1946 + _1950;
    float _1954 = _1922;
    float _1956 = _1952;
    float _1958 = _1934;
    float _1960 = _1936;
    if (_1948)
    {
        float _1962 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1954 = _1962;
    }
    float _1964 = _1954;
    if (_1948)
    {
        float _1966 = rsqrt(_1944);
        _1822 = _1966;
    }
    float _1968 = _1822;
    float _1970 = _1968;
    if (_1948)
    {
        float _1972 = _1952 * _1964;
        _1956 = _1972;
    }
    float _1974 = _1956;
    if (_1948)
    {
        float _1976 = _1974 * 0.15915493667125701904296875;
        _1824 = _1976;
    }
    float _1978 = _1824;
    float _1980 = _1932;
    if (_1948)
    {
        float _1982 = _1978 * 6.283185482025146484375;
        float _1984 = sin(_1982);
        _1980 = _1984;
    }
    float _1986 = _1980;
    float _1988 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1990 = precise::max(0.0, _1988);
    float _1992 = _1796;
    float _1994 = _1990;
    float _1996 = _1988;
    if (_1948)
    {
        float _1998 = _1978 * 6.283185482025146484375;
        float _2000 = cos(_1998);
        _1992 = _2000;
    }
    float _2002 = _1992;
    float _2004 = -_1934;
    float _2006 = -_1990;
    float _2008 = fma(_1914, _2004, _2006);
    float _2010 = _2008;
    if (_1948)
    {
        float _2012 = _2008 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1994 = _2012;
    }
    float _2014 = _1994;
    float _2016 = _1986;
    float _2018 = _2014;
    if (_1948)
    {
        float _2020 = fma(_1986, _2014, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2016 = _2020;
    }
    float _2022 = _2016;
    float _2024 = _2022;
    if (!_1948)
    {
        _2018 = _1938;
    }
    float _2026 = _2018;
    float _2028 = _2026;
    if (_1948)
    {
        float _2030 = _2002 + (-1.0);
        _1996 = _2030;
    }
    float _2032 = _1996;
    if (_1948)
    {
        float _2034 = _1968 * _2022;
        _1826 = _2034;
    }
    float _2036 = _1826;
    if (!_1948)
    {
        _2024 = _2008;
    }
    float _2038 = _2024;
    float _2040 = _2038;
    if (_1948)
    {
        float _2042 = _2032 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1958 = _2042;
    }
    float _2044 = _1958;
    if (_1948)
    {
        float _2046 = _1936 * _2036;
        _1960 = _2046;
    }
    float _2048 = _1960;
    if (!_1948)
    {
        _1970 = _1940;
    }
    float _2050 = _1970;
    float _2052 = _2050;
    if (_1948)
    {
        float _2054 = _1938 * _2036;
        _2028 = _2054;
    }
    float _2056 = _2028;
    if (_1948)
    {
        float _2058 = fma(_2008, _2002, _2044);
        _2040 = _2058;
    }
    float _2060 = _2040;
    if (_1948)
    {
        float _2062 = _2048 * _2048;
        _2052 = _2062;
    }
    float _2064 = _2052;
    if (!_1948)
    {
        _2010 = _1942;
    }
    float _2066 = _2010;
    float _2068 = sqrt(_1930);
    float _2070 = _2066;
    if (_1948)
    {
        float _2072 = _2056 * _2056;
        _2070 = _2072;
    }
    float _2074 = _2070;
    float _2076 = fma(_2060, _2060, _2064);
    float _2078 = _1906 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2080 = _1906 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2082 = _1906 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2084 = _2076 + _2074;
    float _2086 = _1906 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2088 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2078);
    float _2090 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2080);
    float _2092 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2082);
    float _2094 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2086);
    float _2096 = rsqrt(_2084);
    float _2098 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2088);
    float _2100 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2090);
    float _2102 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2094);
    float _2104 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2106 = fma(_2068, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2104);
    float _2108 = precise::clamp(_2106, 0.0, 1.0);
    float _2110 = _2098 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2112 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2092);
    float _2114 = _2100 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2116 = -_2108;
    float _2118 = _2116 + 1.0;
    float _2120 = _2102 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2122 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2124 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2126 = _2112 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2128 = abs(_2118);
    float _2130 = log2(_2128);
    float _2132 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2122);
    float _2134 = _2096 * _2048;
    float _2136 = _2096 * _2060;
    float _2138 = _2096 * _2056;
    float _2140 = -_2124;
    float _2142 = fma(_2140, _1926, 1.0);
    float _2144 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2146 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2132);
    float _2148 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2150 = -_2144;
    float _2152 = fma(_2136, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2150);
    float _2154 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2146);
    float _2156 = log2(_2142);
    float _2158 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2148);
    float _2160 = -_2138;
    float _2162 = fma(_2160, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2152);
    float _2164 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2166 = _2130 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2168 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2158);
    float _2170 = fma(_2162, -0.5, 0.5);
    float _2172 = fma(_2162, 0.5, 0.5);
    float _2174 = 1.0 / _2154;
    float _2176 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2164);
    float _2178 = _2136 + 1.0;
    float _2180 = fma(_2172, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2182 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2168);
    float _2184 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2176);
    float _2186 = fma(_2172, _2180, -0.212114393711090087890625);
    float _2188 = exp2(_2166);
    float _2190 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2184);
    float _2192 = _2156 * 0.693147182464599609375;
    float _2194 = fma(_2172, _2186, 1.570728778839111328125);
    float _2196 = _2192 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2198 = sqrt(_2170);
    float _2200 = _2190 * _2174;
    float _2202 = fma(_2200, 0.5, 0.5);
    float _2204 = -_2136;
    float _2206 = fma(_2188, _2178, _2204);
    float _2208 = _2182 * _2174;
    float _2210 = fma(_2206, 0.5, 0.5);
    float _2212 = fma(_2208, -0.5, 0.5);
    float _2214 = _2198 * 0.636619746685028076171875;
    float _2216 = -_2194;
    float _2218 = fma(_2214, _2216, 1.0);
    float3 _6171 = float3(_2202, _2212, _2196);
    float _2220 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6171, float3(0.0), isnan(_6171)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6171, float3(0.0), isnan(_6171)), level(0.0)).x;
    float3 _6182 = float3(_2202, _2212, _2196);
    float4 _2223 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6182, float3(0.0), isnan(_6182)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6182, float3(0.0), isnan(_6182)), level(0.0)).xyzw;
    float _2225 = _2223.x;
    float _2227 = _2223.y;
    float _2229 = _2223.z;
    float _2231 = _2223.w;
    float2 _6199 = float2(_2218, _2210);
    float3 _2235 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6199, float2(0.0), isnan(_6199)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6199, float2(0.0), isnan(_6199)), level(0.0)).xyz;
    float _2237 = _2235.x;
    float _2239 = _2235.y;
    float _2241 = _2235.z;
    float _2243 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2245 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2247 = _2130 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2249 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2243);
    float _2251 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2245);
    float _2253 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2255 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2249);
    float _2257 = exp2(_2247);
    float _2259 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2253);
    float _2261 = _2255 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2263 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2251);
    float _2265 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2259);
    bool _2267 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2269 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2271 = _2267 || _2269;
    bool _2273 = isnan(0.5);
    bool _2275 = _2271 || _2273;
    float _2277 = _2190 + _2154;
    float _2279 = 1.0 / _2261;
    float _2281 = _2263 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2283 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2265);
    float _2285 = _2277 * 0.5;
    float _2287 = _2281 + _2261;
    float _2289 = _2283 + _2154;
    float _2291 = -_2257;
    float _2293 = _2291 + 1.0;
    float _2295 = _2289 * 0.5;
    float _2297 = _2287 * _2279;
    float _2299 = _2297 * 0.5;
    float _2301 = _2154 * 0.5;
    float _2303 = _2293 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2305 = _2293;
    float _2307 = _2283;
    float _2309 = _2182;
    float _2311 = _2190;
    if (_2275)
    {
        _2305 = 1.0;
    }
    float _2313 = _2305;
    float _2315 = fma(_2182, -0.5, _2301);
    float _2317 = _2313;
    float _2319 = _2227;
    float _2321 = _2225;
    if (!_2275)
    {
        float _2323 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2325 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2327 = fma(_2299, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2325);
        float _2329 = _2323 * 0.15915493667125701904296875;
        float _2331 = _2329 * 6.283185482025146484375;
        float _2333 = cos(_2331);
        float _2335 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2337 = _2335 * 0.15915493667125701904296875;
        float _2339 = _2329 * 6.283185482025146484375;
        float _2341 = sin(_2339);
        float _2343 = 1.0 / _2333;
        float _2345 = _2337 * 6.283185482025146484375;
        float _2347 = cos(_2345);
        float _2349 = _2341 * _2343;
        float _2351 = 1.0 / _2327;
        float _2353 = _2347 * _2349;
        float _2355 = _2337 * 6.283185482025146484375;
        float _2357 = sin(_2355);
        float _2359 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2361 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2359;
        float _2363 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2365 = _2351 * _2363;
        float _2367 = 1.0 / _2353;
        float _2369 = 1.0 / _2361;
        float _2371 = _2357 * _2367;
        float _2373 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2375 = fma(_2371, _2365, _2373);
        float _2377 = _2375 * _2369;
        float _2379 = precise::clamp(_2377, 0.0, 1.0);
        _2317 = _2379;
    }
    float _2381 = _2317;
    float _2383 = _2303 * _2220;
    float _2385 = -_2303;
    float _2387 = _2385 + 1.0;
    out.m_85.x = _2285;
    out.m_85.y = _2315;
    out.m_85.z = _2295;
    out.m_85.w = _2154;
    bool _2389 = _2068 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2391 = isnan(_2068);
    bool _2393 = _2389 || _2391;
    bool _2395 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2397 = _2393 || _2395;
    float _2399 = _2231 * _2383;
    float _2401 = _2241 * _2383;
    float _2403 = _2231 * _2387;
    float _2405 = fma(_2237, _2399, _2225);
    float _2407 = fma(_2239, _2399, _2227);
    float _2409 = fma(_2231, _2401, _2229);
    out.gl_Position.x = _2190;
    out.gl_Position.y = _2182;
    out.gl_Position.z = _2283;
    out.gl_Position.w = _2154;
    out.m_87.x = _2405;
    out.m_87.y = _2407;
    out.m_87.z = _2409;
    out.m_87.w = _2403;
    float _2411 = _2399;
    if (!_2397)
    {
        _2319 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2413 = _2319;
    float _2415 = _2413;
    float _2417 = _2413;
    if (!_2397)
    {
        _2321 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2419 = _2321;
    float _2421 = _2419;
    float _2423 = _2419;
    if (!_2397)
    {
        _2411 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2425 = _2411;
    float _2427 = _2381 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2429 = _2425;
    float _2431 = _2425;
    if (!_2397)
    {
        _2307 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2433 = _2307;
    float _2435 = _2433;
    float _2437 = _2433;
    if (!_2397)
    {
        _2309 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2439 = _2309;
    float _2441 = _2439;
    float _2443 = _2439;
    if (!_2397)
    {
        _2311 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2445 = _2311;
    bool _2447 = !_2397;
    float _2449 = _2445;
    float _2451 = _2445;
    if (!_2447)
    {
        bool _2453 = _2068 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2455 = isnan(_2068);
        bool _2457 = _2453 || _2455;
        bool _2459 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2461 = _2457 || _2459;
        if (!_2461)
        {
            float _2463 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2465 = _2068 + _2463;
            float _2467 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2469 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2467;
            float _2471 = 1.0 / _2469;
            float _2473 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2475 = _2473 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2477 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2479 = _2477 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2481 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2483 = _2481 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2487 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2491 = _2489 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2493 = _2465 * _2471;
            float _2495 = precise::clamp(_2493, 0.0, 1.0);
            float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2499 = _2497 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2501 = fma(_2495, _2475, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2503 = fma(_2495, _2499, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2505 = fma(_2495, _2479, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2507 = fma(_2495, _2483, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2509 = fma(_2495, _2487, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2511 = fma(_2495, _2491, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2443 = _2503;
            _2423 = _2509;
            _2437 = _2501;
            _2417 = _2507;
            _2451 = _2505;
            _2431 = _2511;
            _2513 = true;
        }
        else
        {
            bool _2515 = _2068 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2517 = isnan(_2068);
            bool _2519 = _2515 || _2517;
            bool _2521 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2523 = _2519 || _2521;
            if (!_2523)
            {
                _2435 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2525 = _2435;
            _2437 = _2525;
            if (!_2523)
            {
                _2441 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2527 = _2441;
            _2443 = _2527;
            if (!_2523)
            {
                _2449 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2529 = _2449;
            _2451 = _2529;
            if (!_2523)
            {
                _2415 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2531 = _2415;
            _2417 = _2531;
            if (!_2523)
            {
                _2421 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2533 = _2421;
            _2423 = _2533;
            if (!_2523)
            {
                _2429 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2535 = _2429;
            bool _2537 = !_2523;
            _2431 = _2535;
            if (!_2537)
            {
                bool _2539 = _2068 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2541 = isnan(_2068);
                bool _2543 = _2539 || _2541;
                bool _2545 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2547 = _2543 || _2545;
                if (!_2547)
                {
                    float _2549 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2551 = _2068 + _2549;
                    float _2553 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2555 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2553;
                    float _2557 = 1.0 / _2555;
                    float _2559 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2561 = _2559 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2563 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2565 = _2563 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2567 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2569 = _2567 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2571 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2573 = _2571 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2575 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2577 = _2575 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2579 = _2551 * _2557;
                    float _2581 = precise::clamp(_2579, 0.0, 1.0);
                    float _2583 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2585 = _2583 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2587 = fma(_2581, _2561, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2589 = fma(_2581, _2585, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2591 = fma(_2581, _2565, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2593 = fma(_2581, _2569, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2595 = fma(_2581, _2573, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2597 = fma(_2581, _2577, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2443 = _2589;
                    _2423 = _2595;
                    _2437 = _2587;
                    _2417 = _2593;
                    _2451 = _2591;
                    _2431 = _2597;
                    _2513 = true;
                }
                else
                {
                    _2443 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2423 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2437 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2417 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2451 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2431 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2513 = false;
    float _2599 = _2443;
    float _2601 = _2423;
    float _2603 = _2437;
    float _2605 = _2417;
    float _2607 = _2451;
    float _2609 = _2431;
    float _2611 = fma(_1792, -0.5, 0.5);
    float _2613 = precise::clamp(_2611, 0.0, 1.0);
    float _2615 = -_2599;
    float _2617 = _2615 + _2601;
    float _2619 = _2427 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2621 = -_2603;
    float _2623 = _2621 + _2605;
    out.m_89.x = 0.0;
    float _2625 = fma(_2613, _2617, _2599);
    float _2627 = fma(_2613, _2623, _2603);
    out.m_49.x = _2619;
    float _2629 = -_2607;
    float _2631 = _2629 + _2609;
    float _2633 = _2625 * 0.586610972881317138671875;
    bool _2635 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2637 = fma(_2613, _2631, _2607);
    float _2639 = fma(_2627, 0.298911988735198974609375, _2633);
    bool _2641 = _2381 > 0.0;
    bool _2643 = isnan(_2381);
    bool _2645 = _2641 || _2643;
    bool _2647 = isnan(0.0);
    bool _2649 = _2645 || _2647;
    float _2651 = fma(_2637, 0.114477999508380889892578125, _2639);
    float _2653 = -_2651;
    float _2655 = _2627 + _2653;
    float _2657 = -_2651;
    float _2659 = _2625 + _2657;
    float _2661 = -_2651;
    float _2663 = _2637 + _2661;
    float _2665 = fma(_2655, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2651);
    float _2667 = fma(_2659, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2651);
    float _2669 = fma(_2663, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2651);
    bool _2671 = !_2635;
    if (!_2671)
    {
        float _2673 = -_1906;
        float _2675 = _2673 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2677 = -_1908;
        float _2679 = _2677 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2681 = -_1910;
        float _2683 = _2681 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2685 = _2675 * _2675;
        float _2687 = fma(_2679, _2679, _2685);
        float _2689 = fma(_2683, _2683, _2687);
        float _2691 = sqrt(_2689);
        float _2693 = rsqrt(_2689);
        float _2695 = -_2691;
        float _2697 = _2695 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2699 = _2697 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2701 = precise::clamp(_2699, 0.0, 1.0);
        float _2703 = _2679 * _2693;
        float _2705 = _2675 * _2693;
        float _2707 = abs(_2701);
        float _2709 = log2(_2707);
        float _2711 = _2683 * _2693;
        float _2713 = _2703 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2715 = _1792 * _2705;
        float _2717 = -_2705;
        float _2719 = -_2713;
        float _2721 = fma(_2717, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2719);
        float _2723 = fma(_1790, _2703, _2715);
        float _2725 = -_2711;
        float _2727 = fma(_2725, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2721);
        float _2729 = fma(_1810, _2711, _2723);
        float _2731 = precise::clamp(_2729, 0.0, 1.0);
        float _2733 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2735 = _2727 + _2733;
        float _2737 = _2709 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2739 = _2735 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2741 = precise::clamp(_2739, 0.0, 1.0);
        float _2743 = exp2(_2737);
        float _2745 = _2743 * _2741;
        float _2747 = _2731 * _2745;
        float _2749 = _2747 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2751 = _2747 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2753 = _2747 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2749;
        out.m_89.y = _2751;
        out.m_89.z = _2753;
    }
    out.m_91.x = _2665;
    out.m_91.y = _2667;
    out.m_91.z = _2669;
    if (_2649)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2755 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2755;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2513 = false;
    bool _1862 = false;
    bool _610 = false;
    bool _456 = false;
    bool _234 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2812 = as_type<float>(_126);
        out.gl_Position.z = _2812;
    }
    if (!_114)
    {
        return out;
    }
    float _130 = in.m_51.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_110);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    if (_158)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _120;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2881 = as_type<float>(_164);
        out.gl_Position.z = _2881;
    }
    if (_158)
    {
        return out;
    }
    float _166 = in.m_53.x;
    float _168 = in.m_53.y;
    float _170 = in.m_53.z;
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    float _180 = in.m_57.x;
    float _182 = in.m_57.y;
    float _184 = in.m_57.z;
    float _186 = in.m_59.x;
    float _188 = in.m_59.y;
    float _190 = in.m_59.z;
    float _192 = _168 * _176;
    float _194 = _168 * _182;
    float _196 = fma(_166, _174, _192);
    float _198 = _168 * _188;
    float _200 = fma(_166, _180, _194);
    float _202 = fma(_170, _178, _196);
    float _204 = fma(_166, _186, _198);
    float _206 = fma(_170, _184, _200);
    float _208 = fma(_170, _190, _204);
    bool _210 = !_172;
    float _212 = _184;
    float _214 = _190;
    float _232;
    if (!_210)
    {
        float _216 = in.m_61.x;
        float _218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _220 = _216 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _222 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _224 = _222 * _218;
        float _226 = floor(_224);
        float _228 = -_226;
        float _230 = _224 + _228;
        _232 = _230;
        _234 = true;
    }
    else
    {
        float _236 = float(_110);
        float _238 = 1.0 / _236;
        float _240 = _144 * _238;
        _232 = _240;
    }
    _234 = false;
    float _242 = _232;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _246 = _242 + _244;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _250 = _242 + _248;
    bool _252 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _254 = isnan(_242);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _270 = _268 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _278 = _242 + _276;
    float _280 = 1.0 / _266;
    bool _282 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_242);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    bool _294 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _296 = 1.0 / _274;
    float _298 = 1.0 / _270;
    float _300 = _246 * _280;
    bool _302 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _304 = isnan(_242);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -_312;
    float _316 = _314 + 1.0;
    float _318 = _250 * _296;
    bool _320 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _322 = isnan(_242);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _332;
    float _336 = _262 * _316;
    float _338 = -_262;
    float _340 = _338 + 1.0;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _346 = -_330;
    float _348 = _346 + 1.0;
    float _350 = fma(_334, _300, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _352 = _278 * _298;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _358;
    float _362 = _292 * _348;
    float _364 = fma(_344, _352, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _366 = fma(_356, _300, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _368 = fma(_360, _300, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _370 = _330 * _340;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _380 = _366 * _362;
    float _382 = _368 * _362;
    float _384 = _350 * _362;
    float _386 = fma(_374, _352, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _388 = fma(_378, _352, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _390 = -_292;
    float _392 = _390 + 1.0;
    float _394 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].y, _382);
    float _396 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].x, _380);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _398;
    float _402 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].z, _384);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _408;
    float _412 = fma(_364, _370, _396);
    float _414 = fma(_400, _318, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _416 = fma(_406, _318, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _418 = fma(_410, _318, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _420 = fma(_386, _370, _394);
    float _422 = fma(_388, _370, _402);
    float _424 = fma(_416, _336, _412);
    float _426 = fma(_414, _336, _420);
    float _428 = fma(_418, _336, _422);
    float _430 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[146].x, _424);
    float _432 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[146].y, _426);
    float _434 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[146].z, _428);
    bool _436 = !_294;
    float _454;
    if (!_436)
    {
        float _438 = in.m_61.x;
        float _440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _442 = _438 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _446 = _444 * _440;
        float _448 = floor(_446);
        float _450 = -_448;
        float _452 = _446 + _450;
        _454 = _452;
        _456 = true;
    }
    else
    {
        float _458 = float(_110);
        float _460 = 1.0 / _458;
        float _462 = _144 * _460;
        _454 = _462;
    }
    _456 = false;
    float _464 = _454;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _464 + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _474 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _476 = isnan(_464);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _490 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _492 = isnan(_464);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _502;
    bool _506 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _508 = isnan(_464);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = 1.0 / _472;
    float _520 = -_484;
    float _522 = _520 + 1.0;
    bool _524 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _526 = _500 * _522;
    float _528 = -_500;
    float _530 = _528 + 1.0;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _534 = 1.0 / _488;
    float _536 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _538 = _504 * _518;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _544 = fma(_538, _468, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _546 = -_516;
    float _548 = _546 + 1.0;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _552 = _544 * _526;
    float _554 = _542 * _534;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _558 = _464 + _556;
    float _560 = _484 * _548;
    float _562 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[115].x, _552);
    float _564 = _550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _566 = fma(_554, _558, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _568 = fma(_566, _560, _562);
    float _570 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[117].x, _568);
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _574 = in.m_63.x;
    float _576 = in.m_63.y;
    float _578 = in.m_63.z;
    float _580 = _570 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _582 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _564;
    out.m_65.y = _582;
    out.m_65.z = _536;
    out.m_65.w = _580;
    float _584 = _434 * _578;
    float _586 = _432 * _576;
    float _588 = _430 * _574;
    bool _590 = !_524;
    float _608;
    if (!_590)
    {
        float _592 = in.m_61.x;
        float _594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _596 = _592 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _598 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _600 = _598 * _594;
        float _602 = floor(_600);
        float _604 = -_602;
        float _606 = _600 + _604;
        _608 = _606;
        _610 = true;
    }
    else
    {
        float _612 = float(_110);
        float _614 = 1.0 / _612;
        float _616 = _144 * _614;
        _608 = _616;
    }
    _610 = false;
    float _618 = _608;
    float _620 = in.m_67.y;
    float _622 = _586 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _624 = in.m_61.w;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _628 = _626 != 0;
    float _630 = _202 * _202;
    int _632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _634 = _632 != 0;
    float _636 = in.m_61.y;
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _640 = _638 != 0;
    float _642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _646 = _644 != 0;
    float _648 = in.m_46.x;
    float _650 = in.m_46.y;
    float _652 = in.m_46.z;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _656 = _654 != 0;
    float _658 = fma(_206, _206, _630);
    float _660 = in.m_61.x;
    float _662 = fma(_208, _208, _658);
    float _664 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _666 = log2(_664);
    float _668 = in.m_61.z;
    float _670 = _584 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _672 = -_620;
    float _674 = _672 + 1.0;
    float _676 = in.m_57.w;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _680 = rsqrt(_662);
    bool _682 = _624 > 0.5;
    float _684 = in.m_67.x;
    int _686 = _682 ? as_type<int>(_674) : as_type<int>(_620);
    float _688 = in.m_69.x;
    float _690 = in.m_69.y;
    float _692 = in.m_69.z;
    bool _694 = _636 > 0.5;
    float _696 = _182 * _650;
    float _698 = _176 * _650;
    float _700 = _188 * _650;
    float _702 = _646 ? as_type<float>(_686) : _620;
    float _704 = fma(_180, _648, _696);
    float _706 = _620;
    if (_628)
    {
        float _708 = _694 ? _674 : _620;
        _706 = _708;
    }
    float _710 = _706;
    float _712 = fma(_186, _648, _700);
    int _714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _716 = _714 != 0;
    int _718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _720 = _718 != 0;
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _724 = _722 != 0;
    float _726 = fma(_174, _648, _698);
    float _728 = fma(_184, _652, _704);
    float _730 = fma(_178, _652, _726);
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _734 = _732 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _736 = _660 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _740 = 1.0 / _734;
    float _742 = -_738;
    float _744 = fma(_736, 2.0, _742);
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _748 = _636 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _754 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _690);
    float _756 = fma(_748, -2.0, _746);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _762 = 1.0 / _752;
    float _764 = _622 * _754;
    float _766 = _660 * 2.0;
    float _768 = fma(_190, _652, _712);
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _770;
    bool _774 = _694;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _778 = _760;
    float _780 = _766;
    int _782 = as_type<int>(_768);
    int _784 = as_type<int>(_730);
    if (!_656)
    {
        _212 = _668;
    }
    float _786 = _212;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _792 = _786;
    if (_640)
    {
        bool _794 = _668 > 0.5;
        _774 = _794;
    }
    bool _796 = _774;
    float _798 = 1.0 / _760;
    float _800 = _772 * _740;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _806 = 0.0;
    if (!_656)
    {
        _806 = _636;
    }
    float _808 = _806;
    float _810 = _206 * _680;
    float _812 = _808;
    if (!_656)
    {
        _776 = _660;
    }
    float _814 = _776;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _816;
    float _820 = floor(_766);
    float _822 = _804 * _762;
    float _824 = _814;
    if (!_656)
    {
        _778 = _786;
    }
    float _826 = _778;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _832 = _826;
    if (_656)
    {
        _792 = _668;
    }
    float _834 = _792;
    float _836 = -_144;
    float _838 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[76].x, _744);
    if (!_656)
    {
        _214 = _826;
    }
    float _840 = _214;
    float _842 = in.m_55.w;
    float _844 = _818 * _798;
    float _846 = _660 + _636;
    float _848 = 1.0 / _790;
    float _850 = _846 + (-1.0);
    float _852 = _840;
    if (!_656)
    {
        _780 = _636;
    }
    float _854 = _780;
    float _856 = _854;
    if (_656)
    {
        _812 = _660;
    }
    float _858 = _812;
    float _860 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _864 = _618 + _862;
    float _866 = _636 * 2.0;
    if (_656)
    {
        _856 = _660;
    }
    float _868 = _856;
    if (_656)
    {
        _824 = _834;
    }
    float _870 = _824;
    float _872 = floor(_866);
    if (_656)
    {
        _852 = _636;
    }
    float _874 = _852;
    float _876 = fma(_822, _864, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    if (_656)
    {
        _832 = _636;
    }
    float _878 = _832;
    float _880 = _642 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _882 = _820 >= 0.0;
    bool _884 = isnan(_820);
    bool _886 = _882 || _884;
    bool _888 = isnan(0.0);
    bool _890 = _886 || _888;
    float _892 = _666 * _144;
    float _894 = _830 * _848;
    float _896 = fma(_702, _880, -0.5);
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _900 = _618 + _898;
    int _902 = _890 ? 0 : 1;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _906 = _618 + _904;
    bool _908 = _820 > 0.0;
    float _910 = fma(_844, _900, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _912 = exp2(_892);
    float _914 = fma(_800, _906, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _916 = ~_902;
    int _918 = _916 + 1;
    int _920 = _918 + 1;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _926 = _618 + _924;
    float _928 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[83].z, _922);
    float _930 = _202 * _680;
    float _932 = _208 * _680;
    float _934 = _728 + _676;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _938 = _858 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _940 = fma(_894, _926, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    int _942 = _920;
    float _944 = _894;
    if (!_908)
    {
        int _946 = ~_902;
        int _948 = _946 + 1;
        _942 = _948;
    }
    int _950 = _942;
    float _952 = -_936;
    float _954 = fma(_938, 2.0, _952);
    bool _956 = _872 >= 0.0;
    bool _958 = isnan(_872);
    bool _960 = _956 || _958;
    bool _962 = isnan(0.0);
    bool _964 = _960 || _962;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _968 = _874 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _970 = _964 ? 0 : 1;
    float _972 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[83].w, _966);
    float _974 = fma(_968, -2.0, _678);
    bool _976 = _872 > 0.0;
    float _978 = _636 + _834;
    float _980 = _660 + _834;
    float _982 = _872;
    if (!_634)
    {
        _982 = _684;
    }
    float _984 = _982;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _988 = _978 + (-1.0);
    float _990 = _980 + (-1.0);
    float _992 = _984;
    if (!_634)
    {
        _944 = _984;
    }
    float _994 = _944;
    float _996 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[84].z, _986);
    float _998 = _994;
    if (_634)
    {
        _992 = _684;
    }
    float _1000 = _992;
    float _1002 = _834 * 2.0;
    float _1004 = -_912;
    float _1006 = _1004 + 1.0;
    float _1008 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1010 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1012 = !_720;
    int _1014 = _1012 ? 0 : 1;
    float _1016 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[84].x, _996);
    bool _1018 = !_724;
    int _1020 = _1018 ? 0 : 1;
    float _1022 = floor(_1002);
    int _1024 = ~_970;
    int _1026 = _1024 + 1;
    int _1028 = _1026 + 1;
    float _1030 = _834 + (-0.5);
    int _1032 = _1028;
    if (!_976)
    {
        int _1034 = ~_970;
        int _1036 = _1034 + 1;
        _1032 = _1036;
    }
    int _1038 = _1032;
    float _1040 = _1016 * (-0.15915493667125701904296875);
    int _1042 = abs(_1014);
    int _1044 = abs(_1020);
    float _1046 = in.m_71.x;
    float _1048 = in.m_71.y;
    float _1050 = in.m_71.z;
    bool _1052 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1054 = isnan(0.0);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1042);
    float _1064 = float(_950);
    float _1066 = _1060 ? _1006 : 0.0;
    bool _1068 = _1022 > 0.0;
    float _1070 = _1062 * _1064;
    bool _1072 = _1022 >= 0.0;
    bool _1074 = isnan(_1022);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan(0.0);
    bool _1080 = _1076 || _1078;
    bool _1082 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1084 = isnan(1.0);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1090 = _1086 || _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1094 = 1.0 + _1092;
    float _1096 = float(_1044);
    float _1098 = _1070 * (-2.0);
    float _1100 = 1.0 / _1094;
    float _1102 = float(_1038);
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1106 = fma(_1008, _1098, _1008);
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1110 = fma(_1098, _1048, _1048);
    float _1112 = _1096 * _1102;
    float _1114 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1104);
    float _1116 = -_144;
    float _1118 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[81].x, _954);
    float _1120 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[191].x, _660);
    float _1122 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1108);
    float _1124 = _1112 * (-2.0);
    float _1126 = _636 + (-0.5);
    int _1128 = _1080 ? 0 : 1;
    float _1130 = _1120 + _690;
    float _1132 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1122);
    bool _1134 = !_716;
    int _1136 = _1134 ? 0 : 1;
    float _1138 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1114);
    float _1140 = fma(_1010, _1124, _1010);
    float _1142 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _756);
    float _1144 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _928);
    float _1146 = fma(_1124, _1050, _1050);
    float _1148 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1110);
    float _1150 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _972);
    int _1152 = ~_1128;
    int _1154 = _1152 + 1;
    int _1156 = _1154 + 1;
    float _1158 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1162 = _930 * _1160;
    int _1164 = _1156;
    bool _1166 = _1068;
    if (!_1068)
    {
        int _1168 = ~_1128;
        int _1170 = _1168 + 1;
        _1164 = _1170;
    }
    int _1172 = _1164;
    float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1176 = _932 * _1174;
    int _1178 = abs(_1136);
    float _1180 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _974);
    if (_1090)
    {
        float _1182 = _1066 * _1100;
        _148 = _1182;
    }
    float _1184 = _148;
    float _1186 = _1158 * 0.15915493667125701904296875;
    float _1188 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1190 = -_1162;
    float _1192 = fma(_932, _1188, _1190);
    float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1196 = -_1176;
    float _1198 = fma(_810, _1194, _1196);
    float _1200 = float(_1178);
    float _1202 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1204 = _810 * _1202;
    float _1206 = float(_1172);
    float _1208 = _1198 * _1198;
    float _1210 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1146);
    float _1212 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1214 = -_1204;
    float _1216 = fma(_930, _1212, _1214);
    float _1218 = fma(_1106, _1184, _1148);
    float _1220 = _1200 * _1206;
    float _1222 = fma(_1192, _1192, _1208);
    float _1224 = fma(_1140, _1184, _1210);
    float _1226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1228 = _1220 * (-2.0);
    float _1230 = in.m_59.w;
    float _1232 = fma(_1216, _1216, _1222);
    bool _1234 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1236 = isnan(_618);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1242 = _1238 || _1240;
    float _1244 = float(_1242);
    float _1246 = fma(_860, _1228, _860);
    float _1248 = _1218 * 0.15915493667125701904296875;
    float _1250 = in.m_73.x;
    float _1252 = _1186 * 6.283185482025146484375;
    float _1254 = sin(_1252);
    if (_634)
    {
        bool _1256 = _660 > 0.5;
        _1166 = _1256;
    }
    bool _1258 = _1166;
    float _1260 = _660 + (-0.5);
    bool _1262 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1264 = isnan(_618);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1270 = _1266 || _1268;
    float _1272 = float(_1270);
    float _1274 = -_1244;
    float _1276 = _1274 + 1.0;
    float _1278 = _1224 * 0.15915493667125701904296875;
    float _1280 = -_1272;
    float _1282 = _1280 + 1.0;
    float _1284 = fma(_1228, _1046, _1046);
    bool _1286 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1288 = isnan(_618);
    bool _1290 = _1286 || _1288;
    bool _1292 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1294 = _1290 || _1292;
    float _1296 = float(_1294);
    float _1298 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1300 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1302 = isnan(_618);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1308 = _1304 || _1306;
    float _1310 = float(_1308);
    float _1312 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1284);
    bool _1314 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1316 = isnan(_618);
    bool _1318 = _1314 || _1316;
    bool _1320 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1322 = _1318 || _1320;
    float _1324 = float(_1322);
    float _1326 = -_1296;
    float _1328 = _1326 + 1.0;
    float _1330 = _1296 * _1276;
    float _1332 = fma(_1246, _1184, _1312);
    float _1334 = _730 + _842;
    float _1336 = _1272 * _1328;
    float _1338 = _1310 * _1282;
    float _1340 = -_1310;
    float _1342 = _1340 + 1.0;
    float _1344 = _1332 * 0.15915493667125701904296875;
    float _1346 = _768 + _1230;
    float _1348 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1350 = _1324 * _1342;
    float _1352 = _1248 * 6.283185482025146484375;
    float _1354 = cos(_1352);
    float _1356 = fma(_1298, _710, -0.5);
    float _1358 = _1342;
    if (_634)
    {
        float _1360 = -_1000;
        float _1362 = _1360 + 1.0;
        _782 = as_type<int>(_1362);
    }
    int _1364 = _782;
    float _1366 = _914 * _1350;
    if (_640)
    {
        float _1368 = -_1000;
        float _1370 = _1368 + 1.0;
        _784 = as_type<int>(_1370);
    }
    int _1372 = _784;
    float _1374 = -_1324;
    float _1376 = _1374 + 1.0;
    float _1378 = _1348 * _1250;
    if (!_640)
    {
        _1358 = _1000;
    }
    float _1380 = _1358;
    float _1382 = _1278 * 6.283185482025146484375;
    float _1384 = cos(_1382);
    float _1386 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1366);
    float _1388 = _1380;
    if (_634)
    {
        float _1390 = _1258 ? as_type<float>(_1364) : _1000;
        _998 = _1390;
    }
    float _1392 = _998;
    float _1394 = _1378 + _692;
    if (_640)
    {
        float _1396 = _796 ? as_type<float>(_1372) : _1000;
        _1388 = _1396;
    }
    float _1398 = _1388;
    float _1400 = _1378 + _688;
    float _1402 = _588 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1404 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1394);
    float _1406 = _1344 * 6.283185482025146484375;
    float _1408 = sin(_1406);
    float _1410 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1400);
    float _1412 = -_1142;
    float _1414 = fma(_1138, _1356, _1412);
    float _1416 = _670 * _1404;
    float _1418 = fma(_876, _1338, _1386);
    float _1420 = _1402 * _1410;
    bool _1422 = _690 != 0.0;
    bool _1424 = isnan(_690);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan(0.0);
    bool _1430 = _1426 || _1428;
    float _1432 = _1248 * 6.283185482025146484375;
    float _1434 = sin(_1432);
    float _1436 = _1354 * _1384;
    float _1438 = -_688;
    bool _1440 = _1378 == _1438;
    bool _1442 = !_1430;
    bool _1444 = _1440 && _1442;
    float _1446 = -_692;
    bool _1448 = _1378 == _1446;
    bool _1450 = _1448 && _1444;
    float _1452 = _1344 * 6.283185482025146484375;
    float _1454 = cos(_1452);
    float _1456 = _1408 * _1354;
    float _1458 = rsqrt(_1232);
    float _1460 = _1434 * _1384;
    float _1462 = _1408 * _1434;
    float _1464 = _1408 * _1384;
    float _1466 = _1278 * 6.283185482025146484375;
    float _1468 = sin(_1466);
    float _1470 = _1454 * _1354;
    float _1472 = _1454 * _1434;
    float _1474 = _1454 * _1384;
    float _1476 = _1192 * _1458;
    float _1478 = _1198 * _1458;
    float _1480 = _1216 * _1458;
    float _1482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1484 = _930 * _1480;
    float _1486 = fma(_1468, _1470, _1462);
    float _1488 = fma(_1468, _1462, _1470);
    float _1490 = -_1472;
    float _1492 = fma(_1468, _1456, _1490);
    float _1494 = -_1456;
    float _1496 = fma(_1468, _1472, _1494);
    float _1498 = _1474 * _810;
    float _1500 = _810 * _1478;
    float _1502 = _1474 * _932;
    float _1504 = -_1484;
    float _1506 = fma(_932, _1478, _1504);
    float _1508 = -_1468;
    float _1510 = fma(_1508, _1476, _1498);
    float _1512 = -_1500;
    float _1514 = fma(_930, _1476, _1512);
    float _1516 = _1486 * _810;
    float _1518 = -_1468;
    float _1520 = fma(_1518, _1480, _1502);
    float _1522 = _1486 * _932;
    float _1524 = _1496 * _932;
    float _1526 = fma(_1436, _1476, _1516);
    float _1528 = _1496 * _810;
    float _1530 = fma(_1436, _1480, _1522);
    float _1532 = fma(_1464, _1506, _1510);
    float _1534 = fma(_1464, _1514, _1520);
    float _1536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1538 = fma(_1460, _1480, _1524);
    float _1540 = fma(_1492, _1506, _1526);
    float _1542 = fma(_1460, _1476, _1528);
    float _1544 = fma(_1492, _1514, _1530);
    float _1546 = _764 * _1532;
    float _1548 = _764 * _1534;
    float _1550 = fma(_1488, _1506, _1542);
    float _1552 = fma(_1488, _1514, _1538);
    float _1554 = fma(_1420, _1540, _1546);
    float _1556 = fma(_1420, _1544, _1548);
    float _1558 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1560 = fma(_910, _1336, _1418);
    float _1562 = fma(_1416, _1550, _1554);
    float _1564 = fma(_1416, _1552, _1556);
    float _1566 = _932 * _1476;
    float _1568 = _1536 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1570 = _934 + _1562;
    float _1572 = _1346 + _1564;
    float _1574 = fma(_1558, _1392, -0.5);
    float _1576 = fma(_1568, _1398, -0.5);
    float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1580 = _1570 + _1578;
    float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1584 = _1572 + _1582;
    float _1586 = fma(_1132, _1574, _838);
    float _1588 = _1474 * _930;
    float _1590 = _1580 * _1580;
    float _1592 = _1584 * _1584;
    float _1594 = in.m_75.x;
    float _1596 = in.m_75.y;
    float _1598 = in.m_75.z;
    float _1600 = _1040 * 6.283185482025146484375;
    float _1602 = sin(_1600);
    float _1604 = -_1566;
    float _1606 = fma(_810, _1480, _1604);
    float _1608 = _1590 + _1592;
    float _1610 = _1486 * _930;
    float _1612 = -_1468;
    float _1614 = fma(_1612, _1478, _1588);
    float _1616 = _1496 * _930;
    float _1618 = fma(_940, _1330, _1560);
    float _1620 = fma(_1436, _1478, _1610);
    float _1622 = sqrt(_1608);
    float _1624 = fma(_1464, _1606, _1614);
    float _1626 = fma(_1460, _1478, _1616);
    float _1628 = fma(_1492, _1606, _1620);
    float _1630 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1618);
    float _1632 = _764 * _1624;
    float _1634 = fma(_1488, _1606, _1626);
    float _1636 = _1040 * 6.283185482025146484375;
    float _1638 = cos(_1636);
    float _1640 = fma(_1420, _1628, _1632);
    float _1642 = _1602 * _896;
    float _1644 = fma(_1416, _1634, _1640);
    float _1646 = _1596;
    float _1648 = _1594;
    float _1650 = _1590;
    float _1652 = _1592;
    float _1654 = _1570;
    float _1656 = _1572;
    float _1658 = _1644;
    float _1660 = _1598;
    if (!_1450)
    {
        float _1662 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1596);
        _1646 = _1662;
    }
    float _1664 = _1646;
    bool _1666 = _1622 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1668 = _1334 + _1644;
    if (!_1450)
    {
        float _1670 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1594);
        _1648 = _1670;
    }
    float _1672 = _1648;
    float _1674 = _1532 * _1664;
    float _1676 = _1534 * _1664;
    float _1678 = _1638 * _896;
    float _1680 = -_1642;
    float _1682 = fma(_1638, _1576, _1680);
    float _1684 = fma(_1602, _1576, _1678);
    float _1686 = fma(_1144, _1682, _1118);
    float _1688 = _1682;
    if (!_1666)
    {
        _1688 = _1668;
    }
    float _1690 = _1688;
    float _1692 = -_1180;
    float _1694 = fma(_1150, _1684, _1692);
    float _1696 = _1624 * _1664;
    bool _1698 = !_1666;
    float _1700 = _1690;
    if (!_1698)
    {
        float _1702 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1704 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1706 = _1622 + _1704;
        float _1708 = rsqrt(_1608);
        float _1710 = _1706 * _1702;
        float _1712 = _1668 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1714 = _1710 * 0.15915493667125701904296875;
        float _1716 = _1714 * 6.283185482025146484375;
        float _1718 = sin(_1716);
        float _1720 = _1714 * 6.283185482025146484375;
        float _1722 = cos(_1720);
        float _1724 = fma(_1718, _1712, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1726 = _1708 * _1724;
        float _1728 = fma(_1580, _1726, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1730 = _1722 + (-1.0);
        float _1732 = fma(_1584, _1726, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1736 = _1728 + _1734;
        float _1738 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1740 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1742 = _1732 + _1740;
        float _1744 = _1736 * _1736;
        float _1746 = fma(_1668, _1722, _1738);
        float _1748 = _1742 * _1742;
        _1700 = _1746;
        _1650 = _1744;
        _1652 = _1748;
        _1654 = _1728;
        _1656 = _1732;
        _1658 = _1714;
    }
    float _1750 = _1700;
    float _1752 = _1650;
    float _1754 = _1652;
    float _1756 = _1654;
    float _1758 = _1656;
    float _1760 = _1658;
    float _1762 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1764 = _1750 + _1762;
    float _1766 = fma(_1540, _1672, _1674);
    float _1768 = fma(_1764, _1764, _1752);
    float _1770 = fma(_1628, _1672, _1696);
    float _1772 = _1760;
    if (!_1450)
    {
        float _1774 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1598);
        _1660 = _1774;
    }
    float _1776 = _1660;
    float _1778 = _1768 + _1754;
    float _1780 = fma(_1544, _1672, _1676);
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1786 = sqrt(_1778);
    float _1788 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1790 = fma(_1550, _1776, _1766);
    float _1792 = fma(_1634, _1776, _1770);
    float _1794 = _1782 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1796 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1798 = _1788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1800 = _1414 + 0.5;
    float _1802 = _1586 + 0.5;
    float _1804 = _1630 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1806 = _1686 + 0.5;
    float _1808 = _1694 + 0.5;
    float _1810 = fma(_1552, _1776, _1780);
    out.m_77.x = _1250;
    bool _1812 = _1786 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1814 = isnan(_1786);
    bool _1816 = _1812 || _1814;
    bool _1818 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1820 = _1816 || _1818;
    out.m_79.x = _1794;
    out.m_79.y = _1796;
    out.m_79.z = _1798;
    out.m_79.w = _1804;
    out.m_81.x = _1802;
    out.m_81.y = _1800;
    out.m_81.z = _1806;
    out.m_81.w = _1808;
    out.m_83.x = _1790;
    out.m_83.y = _1792;
    out.m_83.z = _1810;
    float _1822 = _1798;
    float _1824 = _1804;
    float _1826 = _1800;
    if (!_1820)
    {
        _1772 = 1.0;
    }
    float _1828 = _1772;
    bool _1830 = !_1820;
    float _1832 = _1828;
    if (!_1830)
    {
        bool _1834 = _1786 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1836 = isnan(_1786);
        bool _1838 = _1834 || _1836;
        bool _1840 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1842 = _1838 || _1840;
        if (!_1842)
        {
            float _1844 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1846 = _1786 + _1844;
            float _1848 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1850 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1848;
            float _1852 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1854 = _1852 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1856 = 1.0 / _1850;
            float _1858 = _1846 * _1856;
            float _1860 = fma(_1858, _1854, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1832 = _1860;
            _1862 = true;
        }
        else
        {
            bool _1864 = _1786 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1866 = isnan(_1786);
            bool _1868 = _1864 || _1866;
            bool _1870 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1872 = _1868 || _1870;
            if (!_1872)
            {
                float _1874 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1876 = _1786 + _1874;
                float _1878 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1880 = _1878 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1882 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1884 = _1882 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1886 = 1.0 / _1880;
                float _1888 = _1876 * _1886;
                float _1890 = fma(_1888, _1884, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1832 = _1890;
                _1862 = true;
            }
            else
            {
                _1832 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1862 = false;
    float _1892 = _1832;
    float _1894 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1896 = _1750 + _1894;
    float _1898 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1900 = _1756 + _1898;
    float _1902 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1904 = _1758 + _1902;
    float _1906 = fma(_1896, _1892, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1908 = fma(_1900, _1892, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1910 = fma(_1904, _1892, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1912 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1914 = _1906 + _1912;
    float _1916 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1918 = _1908 + _1916;
    float _1920 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1922 = _1910 + _1920;
    float _1924 = _1914 * _1914;
    float _1926 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1928 = fma(_1918, _1918, _1924);
    float _1930 = fma(_1922, _1922, _1928);
    float _1932 = rsqrt(_1930);
    float _1934 = _1932 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1936 = _1918 * _1934;
    float _1938 = _1922 * _1934;
    float _1940 = _1936 * _1936;
    float _1942 = _1938 * _1938;
    float _1944 = _1940 + _1942;
    float _1946 = sqrt(_1944);
    bool _1948 = _1946 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1950 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1952 = _1946 + _1950;
    float _1954 = _1922;
    float _1956 = _1952;
    float _1958 = _1934;
    float _1960 = _1936;
    if (_1948)
    {
        float _1962 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1954 = _1962;
    }
    float _1964 = _1954;
    if (_1948)
    {
        float _1966 = rsqrt(_1944);
        _1822 = _1966;
    }
    float _1968 = _1822;
    float _1970 = _1968;
    if (_1948)
    {
        float _1972 = _1952 * _1964;
        _1956 = _1972;
    }
    float _1974 = _1956;
    if (_1948)
    {
        float _1976 = _1974 * 0.15915493667125701904296875;
        _1824 = _1976;
    }
    float _1978 = _1824;
    float _1980 = _1932;
    if (_1948)
    {
        float _1982 = _1978 * 6.283185482025146484375;
        float _1984 = sin(_1982);
        _1980 = _1984;
    }
    float _1986 = _1980;
    float _1988 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1990 = precise::max(0.0, _1988);
    float _1992 = _1796;
    float _1994 = _1990;
    float _1996 = _1988;
    if (_1948)
    {
        float _1998 = _1978 * 6.283185482025146484375;
        float _2000 = cos(_1998);
        _1992 = _2000;
    }
    float _2002 = _1992;
    float _2004 = -_1934;
    float _2006 = -_1990;
    float _2008 = fma(_1914, _2004, _2006);
    float _2010 = _2008;
    if (_1948)
    {
        float _2012 = _2008 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1994 = _2012;
    }
    float _2014 = _1994;
    float _2016 = _1986;
    float _2018 = _2014;
    if (_1948)
    {
        float _2020 = fma(_1986, _2014, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2016 = _2020;
    }
    float _2022 = _2016;
    float _2024 = _2022;
    if (!_1948)
    {
        _2018 = _1938;
    }
    float _2026 = _2018;
    float _2028 = _2026;
    if (_1948)
    {
        float _2030 = _2002 + (-1.0);
        _1996 = _2030;
    }
    float _2032 = _1996;
    if (_1948)
    {
        float _2034 = _1968 * _2022;
        _1826 = _2034;
    }
    float _2036 = _1826;
    if (!_1948)
    {
        _2024 = _2008;
    }
    float _2038 = _2024;
    float _2040 = _2038;
    if (_1948)
    {
        float _2042 = _2032 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1958 = _2042;
    }
    float _2044 = _1958;
    if (_1948)
    {
        float _2046 = _1936 * _2036;
        _1960 = _2046;
    }
    float _2048 = _1960;
    if (!_1948)
    {
        _1970 = _1940;
    }
    float _2050 = _1970;
    float _2052 = _2050;
    if (_1948)
    {
        float _2054 = _1938 * _2036;
        _2028 = _2054;
    }
    float _2056 = _2028;
    if (_1948)
    {
        float _2058 = fma(_2008, _2002, _2044);
        _2040 = _2058;
    }
    float _2060 = _2040;
    if (_1948)
    {
        float _2062 = _2048 * _2048;
        _2052 = _2062;
    }
    float _2064 = _2052;
    if (!_1948)
    {
        _2010 = _1942;
    }
    float _2066 = _2010;
    float _2068 = sqrt(_1930);
    float _2070 = _2066;
    if (_1948)
    {
        float _2072 = _2056 * _2056;
        _2070 = _2072;
    }
    float _2074 = _2070;
    float _2076 = fma(_2060, _2060, _2064);
    float _2078 = _1906 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2080 = _1906 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2082 = _1906 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2084 = _2076 + _2074;
    float _2086 = _1906 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2088 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2078);
    float _2090 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2080);
    float _2092 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2082);
    float _2094 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2086);
    float _2096 = rsqrt(_2084);
    float _2098 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2088);
    float _2100 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2090);
    float _2102 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2094);
    float _2104 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2106 = fma(_2068, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2104);
    float _2108 = precise::clamp(_2106, 0.0, 1.0);
    float _2110 = _2098 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2112 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2092);
    float _2114 = _2100 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2116 = -_2108;
    float _2118 = _2116 + 1.0;
    float _2120 = _2102 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2122 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2124 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2126 = _2112 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2128 = abs(_2118);
    float _2130 = log2(_2128);
    float _2132 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2122);
    float _2134 = _2096 * _2048;
    float _2136 = _2096 * _2060;
    float _2138 = _2096 * _2056;
    float _2140 = -_2124;
    float _2142 = fma(_2140, _1926, 1.0);
    float _2144 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2146 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2132);
    float _2148 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2150 = -_2144;
    float _2152 = fma(_2136, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2150);
    float _2154 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2146);
    float _2156 = log2(_2142);
    float _2158 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2148);
    float _2160 = -_2138;
    float _2162 = fma(_2160, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2152);
    float _2164 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2166 = _2130 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2168 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2158);
    float _2170 = fma(_2162, -0.5, 0.5);
    float _2172 = fma(_2162, 0.5, 0.5);
    float _2174 = 1.0 / _2154;
    float _2176 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2164);
    float _2178 = _2136 + 1.0;
    float _2180 = fma(_2172, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2182 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2168);
    float _2184 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2176);
    float _2186 = fma(_2172, _2180, -0.212114393711090087890625);
    float _2188 = exp2(_2166);
    float _2190 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2184);
    float _2192 = _2156 * 0.693147182464599609375;
    float _2194 = fma(_2172, _2186, 1.570728778839111328125);
    float _2196 = _2192 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2198 = sqrt(_2170);
    float _2200 = _2190 * _2174;
    float _2202 = fma(_2200, 0.5, 0.5);
    float _2204 = -_2136;
    float _2206 = fma(_2188, _2178, _2204);
    float _2208 = _2182 * _2174;
    float _2210 = fma(_2206, 0.5, 0.5);
    float _2212 = fma(_2208, -0.5, 0.5);
    float _2214 = _2198 * 0.636619746685028076171875;
    float _2216 = -_2194;
    float _2218 = fma(_2214, _2216, 1.0);
    float3 _6171 = float3(_2202, _2212, _2196);
    float _2220 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6171, float3(0.0), isnan(_6171)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6171, float3(0.0), isnan(_6171)), level(0.0)).x;
    float3 _6182 = float3(_2202, _2212, _2196);
    float4 _2223 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6182, float3(0.0), isnan(_6182)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6182, float3(0.0), isnan(_6182)), level(0.0)).xyzw;
    float _2225 = _2223.x;
    float _2227 = _2223.y;
    float _2229 = _2223.z;
    float _2231 = _2223.w;
    float2 _6199 = float2(_2218, _2210);
    float3 _2235 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6199, float2(0.0), isnan(_6199)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6199, float2(0.0), isnan(_6199)), level(0.0)).xyz;
    float _2237 = _2235.x;
    float _2239 = _2235.y;
    float _2241 = _2235.z;
    float _2243 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2245 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2247 = _2130 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2249 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2243);
    float _2251 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2245);
    float _2253 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2255 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2249);
    float _2257 = exp2(_2247);
    float _2259 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2253);
    float _2261 = _2255 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2263 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2251);
    float _2265 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2259);
    bool _2267 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2269 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2271 = _2267 || _2269;
    bool _2273 = isnan(0.5);
    bool _2275 = _2271 || _2273;
    float _2277 = _2190 + _2154;
    float _2279 = 1.0 / _2261;
    float _2281 = _2263 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2283 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2265);
    float _2285 = _2277 * 0.5;
    float _2287 = _2281 + _2261;
    float _2289 = _2283 + _2154;
    float _2291 = -_2257;
    float _2293 = _2291 + 1.0;
    float _2295 = _2289 * 0.5;
    float _2297 = _2287 * _2279;
    float _2299 = _2297 * 0.5;
    float _2301 = _2154 * 0.5;
    float _2303 = _2293 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2305 = _2293;
    float _2307 = _2283;
    float _2309 = _2182;
    float _2311 = _2190;
    if (_2275)
    {
        _2305 = 1.0;
    }
    float _2313 = _2305;
    float _2315 = fma(_2182, -0.5, _2301);
    float _2317 = _2313;
    float _2319 = _2227;
    float _2321 = _2225;
    if (!_2275)
    {
        float _2323 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2325 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2327 = fma(_2299, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2325);
        float _2329 = _2323 * 0.15915493667125701904296875;
        float _2331 = _2329 * 6.283185482025146484375;
        float _2333 = cos(_2331);
        float _2335 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2337 = _2335 * 0.15915493667125701904296875;
        float _2339 = _2329 * 6.283185482025146484375;
        float _2341 = sin(_2339);
        float _2343 = 1.0 / _2333;
        float _2345 = _2337 * 6.283185482025146484375;
        float _2347 = cos(_2345);
        float _2349 = _2341 * _2343;
        float _2351 = 1.0 / _2327;
        float _2353 = _2347 * _2349;
        float _2355 = _2337 * 6.283185482025146484375;
        float _2357 = sin(_2355);
        float _2359 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2361 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2359;
        float _2363 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2365 = _2351 * _2363;
        float _2367 = 1.0 / _2353;
        float _2369 = 1.0 / _2361;
        float _2371 = _2357 * _2367;
        float _2373 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2375 = fma(_2371, _2365, _2373);
        float _2377 = _2375 * _2369;
        float _2379 = precise::clamp(_2377, 0.0, 1.0);
        _2317 = _2379;
    }
    float _2381 = _2317;
    float _2383 = _2303 * _2220;
    float _2385 = -_2303;
    float _2387 = _2385 + 1.0;
    out.m_85.x = _2285;
    out.m_85.y = _2315;
    out.m_85.z = _2295;
    out.m_85.w = _2154;
    bool _2389 = _2068 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2391 = isnan(_2068);
    bool _2393 = _2389 || _2391;
    bool _2395 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2397 = _2393 || _2395;
    float _2399 = _2231 * _2383;
    float _2401 = _2241 * _2383;
    float _2403 = _2231 * _2387;
    float _2405 = fma(_2237, _2399, _2225);
    float _2407 = fma(_2239, _2399, _2227);
    float _2409 = fma(_2231, _2401, _2229);
    out.gl_Position.x = _2190;
    out.gl_Position.y = _2182;
    out.gl_Position.z = _2283;
    out.gl_Position.w = _2154;
    out.m_87.x = _2405;
    out.m_87.y = _2407;
    out.m_87.z = _2409;
    out.m_87.w = _2403;
    float _2411 = _2399;
    if (!_2397)
    {
        _2319 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2413 = _2319;
    float _2415 = _2413;
    float _2417 = _2413;
    if (!_2397)
    {
        _2321 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2419 = _2321;
    float _2421 = _2419;
    float _2423 = _2419;
    if (!_2397)
    {
        _2411 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2425 = _2411;
    float _2427 = _2381 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2429 = _2425;
    float _2431 = _2425;
    if (!_2397)
    {
        _2307 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2433 = _2307;
    float _2435 = _2433;
    float _2437 = _2433;
    if (!_2397)
    {
        _2309 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2439 = _2309;
    float _2441 = _2439;
    float _2443 = _2439;
    if (!_2397)
    {
        _2311 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2445 = _2311;
    bool _2447 = !_2397;
    float _2449 = _2445;
    float _2451 = _2445;
    if (!_2447)
    {
        bool _2453 = _2068 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2455 = isnan(_2068);
        bool _2457 = _2453 || _2455;
        bool _2459 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2461 = _2457 || _2459;
        if (!_2461)
        {
            float _2463 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2465 = _2068 + _2463;
            float _2467 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2469 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2467;
            float _2471 = 1.0 / _2469;
            float _2473 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2475 = _2473 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2477 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2479 = _2477 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2481 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2483 = _2481 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2487 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2491 = _2489 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2493 = _2465 * _2471;
            float _2495 = precise::clamp(_2493, 0.0, 1.0);
            float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2499 = _2497 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2501 = fma(_2495, _2475, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2503 = fma(_2495, _2499, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2505 = fma(_2495, _2479, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2507 = fma(_2495, _2483, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2509 = fma(_2495, _2487, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2511 = fma(_2495, _2491, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2443 = _2503;
            _2423 = _2509;
            _2437 = _2501;
            _2417 = _2507;
            _2451 = _2505;
            _2431 = _2511;
            _2513 = true;
        }
        else
        {
            bool _2515 = _2068 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2517 = isnan(_2068);
            bool _2519 = _2515 || _2517;
            bool _2521 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2523 = _2519 || _2521;
            if (!_2523)
            {
                _2435 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2525 = _2435;
            _2437 = _2525;
            if (!_2523)
            {
                _2441 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2527 = _2441;
            _2443 = _2527;
            if (!_2523)
            {
                _2449 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2529 = _2449;
            _2451 = _2529;
            if (!_2523)
            {
                _2415 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2531 = _2415;
            _2417 = _2531;
            if (!_2523)
            {
                _2421 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2533 = _2421;
            _2423 = _2533;
            if (!_2523)
            {
                _2429 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2535 = _2429;
            bool _2537 = !_2523;
            _2431 = _2535;
            if (!_2537)
            {
                bool _2539 = _2068 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2541 = isnan(_2068);
                bool _2543 = _2539 || _2541;
                bool _2545 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2547 = _2543 || _2545;
                if (!_2547)
                {
                    float _2549 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2551 = _2068 + _2549;
                    float _2553 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2555 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2553;
                    float _2557 = 1.0 / _2555;
                    float _2559 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2561 = _2559 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2563 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2565 = _2563 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2567 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2569 = _2567 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2571 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2573 = _2571 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2575 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2577 = _2575 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2579 = _2551 * _2557;
                    float _2581 = precise::clamp(_2579, 0.0, 1.0);
                    float _2583 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2585 = _2583 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2587 = fma(_2581, _2561, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2589 = fma(_2581, _2585, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2591 = fma(_2581, _2565, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2593 = fma(_2581, _2569, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2595 = fma(_2581, _2573, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2597 = fma(_2581, _2577, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2443 = _2589;
                    _2423 = _2595;
                    _2437 = _2587;
                    _2417 = _2593;
                    _2451 = _2591;
                    _2431 = _2597;
                    _2513 = true;
                }
                else
                {
                    _2443 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2423 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2437 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2417 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2451 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2431 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2513 = false;
    float _2599 = _2443;
    float _2601 = _2423;
    float _2603 = _2437;
    float _2605 = _2417;
    float _2607 = _2451;
    float _2609 = _2431;
    float _2611 = fma(_1792, -0.5, 0.5);
    float _2613 = precise::clamp(_2611, 0.0, 1.0);
    float _2615 = -_2599;
    float _2617 = _2615 + _2601;
    float _2619 = _2427 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2621 = -_2603;
    float _2623 = _2621 + _2605;
    out.m_89.x = 0.0;
    float _2625 = fma(_2613, _2617, _2599);
    float _2627 = fma(_2613, _2623, _2603);
    out.m_49.x = _2619;
    float _2629 = -_2607;
    float _2631 = _2629 + _2609;
    float _2633 = _2625 * 0.586610972881317138671875;
    bool _2635 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2637 = fma(_2613, _2631, _2607);
    float _2639 = fma(_2627, 0.298911988735198974609375, _2633);
    bool _2641 = _2381 > 0.0;
    bool _2643 = isnan(_2381);
    bool _2645 = _2641 || _2643;
    bool _2647 = isnan(0.0);
    bool _2649 = _2645 || _2647;
    float _2651 = fma(_2637, 0.114477999508380889892578125, _2639);
    float _2653 = -_2651;
    float _2655 = _2627 + _2653;
    float _2657 = -_2651;
    float _2659 = _2625 + _2657;
    float _2661 = -_2651;
    float _2663 = _2637 + _2661;
    float _2665 = fma(_2655, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2651);
    float _2667 = fma(_2659, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2651);
    float _2669 = fma(_2663, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2651);
    bool _2671 = !_2635;
    if (!_2671)
    {
        float _2673 = -_1906;
        float _2675 = _2673 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2677 = -_1908;
        float _2679 = _2677 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2681 = -_1910;
        float _2683 = _2681 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2685 = _2675 * _2675;
        float _2687 = fma(_2679, _2679, _2685);
        float _2689 = fma(_2683, _2683, _2687);
        float _2691 = sqrt(_2689);
        float _2693 = rsqrt(_2689);
        float _2695 = -_2691;
        float _2697 = _2695 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2699 = _2697 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2701 = precise::clamp(_2699, 0.0, 1.0);
        float _2703 = _2679 * _2693;
        float _2705 = _2675 * _2693;
        float _2707 = abs(_2701);
        float _2709 = log2(_2707);
        float _2711 = _2683 * _2693;
        float _2713 = _2703 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2715 = _1792 * _2705;
        float _2717 = -_2705;
        float _2719 = -_2713;
        float _2721 = fma(_2717, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2719);
        float _2723 = fma(_1790, _2703, _2715);
        float _2725 = -_2711;
        float _2727 = fma(_2725, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2721);
        float _2729 = fma(_1810, _2711, _2723);
        float _2731 = precise::clamp(_2729, 0.0, 1.0);
        float _2733 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2735 = _2727 + _2733;
        float _2737 = _2709 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2739 = _2735 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2741 = precise::clamp(_2739, 0.0, 1.0);
        float _2743 = exp2(_2737);
        float _2745 = _2743 * _2741;
        float _2747 = _2731 * _2745;
        float _2749 = _2747 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2751 = _2747 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2753 = _2747 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2749;
        out.m_89.y = _2751;
        out.m_89.z = _2753;
    }
    out.m_91.x = _2665;
    out.m_91.y = _2667;
    out.m_91.z = _2669;
    if (_2649)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2755 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2755;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2513 = false;
    bool _1862 = false;
    bool _610 = false;
    bool _456 = false;
    bool _234 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2812 = as_type<float>(_126);
        out.gl_Position.z = _2812;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_51.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_110);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    if (_158)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _120;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2881 = as_type<float>(_164);
        out.gl_Position.z = _2881;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _166 = in.m_53.x;
    float _168 = in.m_53.y;
    float _170 = in.m_53.z;
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    float _180 = in.m_57.x;
    float _182 = in.m_57.y;
    float _184 = in.m_57.z;
    float _186 = in.m_59.x;
    float _188 = in.m_59.y;
    float _190 = in.m_59.z;
    float _192 = _168 * _176;
    float _194 = _168 * _182;
    float _196 = fma(_166, _174, _192);
    float _198 = _168 * _188;
    float _200 = fma(_166, _180, _194);
    float _202 = fma(_170, _178, _196);
    float _204 = fma(_166, _186, _198);
    float _206 = fma(_170, _184, _200);
    float _208 = fma(_170, _190, _204);
    bool _210 = !_172;
    float _212 = _184;
    float _214 = _190;
    float _232;
    if (!_210)
    {
        float _216 = in.m_61.x;
        float _218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _220 = _216 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _222 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _224 = _222 * _218;
        float _226 = floor(_224);
        float _228 = -_226;
        float _230 = _224 + _228;
        _232 = _230;
        _234 = true;
    }
    else
    {
        float _236 = float(_110);
        float _238 = 1.0 / _236;
        float _240 = _144 * _238;
        _232 = _240;
    }
    _234 = false;
    float _242 = _232;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _246 = _242 + _244;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _250 = _242 + _248;
    bool _252 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _254 = isnan(_242);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _270 = _268 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _278 = _242 + _276;
    float _280 = 1.0 / _266;
    bool _282 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_242);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    bool _294 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _296 = 1.0 / _274;
    float _298 = 1.0 / _270;
    float _300 = _246 * _280;
    bool _302 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _304 = isnan(_242);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -_312;
    float _316 = _314 + 1.0;
    float _318 = _250 * _296;
    bool _320 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _322 = isnan(_242);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _332;
    float _336 = _262 * _316;
    float _338 = -_262;
    float _340 = _338 + 1.0;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _346 = -_330;
    float _348 = _346 + 1.0;
    float _350 = fma(_334, _300, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _352 = _278 * _298;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _358;
    float _362 = _292 * _348;
    float _364 = fma(_344, _352, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _366 = fma(_356, _300, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _368 = fma(_360, _300, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _370 = _330 * _340;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _380 = _366 * _362;
    float _382 = _368 * _362;
    float _384 = _350 * _362;
    float _386 = fma(_374, _352, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _388 = fma(_378, _352, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _390 = -_292;
    float _392 = _390 + 1.0;
    float _394 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].y, _382);
    float _396 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].x, _380);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _398;
    float _402 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].z, _384);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _408;
    float _412 = fma(_364, _370, _396);
    float _414 = fma(_400, _318, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _416 = fma(_406, _318, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _418 = fma(_410, _318, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _420 = fma(_386, _370, _394);
    float _422 = fma(_388, _370, _402);
    float _424 = fma(_416, _336, _412);
    float _426 = fma(_414, _336, _420);
    float _428 = fma(_418, _336, _422);
    float _430 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[146].x, _424);
    float _432 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[146].y, _426);
    float _434 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[146].z, _428);
    bool _436 = !_294;
    float _454;
    if (!_436)
    {
        float _438 = in.m_61.x;
        float _440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _442 = _438 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _446 = _444 * _440;
        float _448 = floor(_446);
        float _450 = -_448;
        float _452 = _446 + _450;
        _454 = _452;
        _456 = true;
    }
    else
    {
        float _458 = float(_110);
        float _460 = 1.0 / _458;
        float _462 = _144 * _460;
        _454 = _462;
    }
    _456 = false;
    float _464 = _454;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _464 + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _474 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _476 = isnan(_464);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _490 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _492 = isnan(_464);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _502;
    bool _506 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _508 = isnan(_464);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = 1.0 / _472;
    float _520 = -_484;
    float _522 = _520 + 1.0;
    bool _524 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _526 = _500 * _522;
    float _528 = -_500;
    float _530 = _528 + 1.0;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _534 = 1.0 / _488;
    float _536 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _538 = _504 * _518;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _544 = fma(_538, _468, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _546 = -_516;
    float _548 = _546 + 1.0;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _552 = _544 * _526;
    float _554 = _542 * _534;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _558 = _464 + _556;
    float _560 = _484 * _548;
    float _562 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[115].x, _552);
    float _564 = _550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _566 = fma(_554, _558, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _568 = fma(_566, _560, _562);
    float _570 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[117].x, _568);
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _574 = in.m_63.x;
    float _576 = in.m_63.y;
    float _578 = in.m_63.z;
    float _580 = _570 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _582 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _564;
    out.m_65.y = _582;
    out.m_65.z = _536;
    out.m_65.w = _580;
    float _584 = _434 * _578;
    float _586 = _432 * _576;
    float _588 = _430 * _574;
    bool _590 = !_524;
    float _608;
    if (!_590)
    {
        float _592 = in.m_61.x;
        float _594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _596 = _592 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _598 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _600 = _598 * _594;
        float _602 = floor(_600);
        float _604 = -_602;
        float _606 = _600 + _604;
        _608 = _606;
        _610 = true;
    }
    else
    {
        float _612 = float(_110);
        float _614 = 1.0 / _612;
        float _616 = _144 * _614;
        _608 = _616;
    }
    _610 = false;
    float _618 = _608;
    float _620 = in.m_67.y;
    float _622 = _586 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _624 = in.m_61.w;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _628 = _626 != 0;
    float _630 = _202 * _202;
    int _632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _634 = _632 != 0;
    float _636 = in.m_61.y;
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _640 = _638 != 0;
    float _642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _646 = _644 != 0;
    float _648 = in.m_46.x;
    float _650 = in.m_46.y;
    float _652 = in.m_46.z;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _656 = _654 != 0;
    float _658 = fma(_206, _206, _630);
    float _660 = in.m_61.x;
    float _662 = fma(_208, _208, _658);
    float _664 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _666 = log2(_664);
    float _668 = in.m_61.z;
    float _670 = _584 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _672 = -_620;
    float _674 = _672 + 1.0;
    float _676 = in.m_57.w;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _680 = rsqrt(_662);
    bool _682 = _624 > 0.5;
    float _684 = in.m_67.x;
    int _686 = _682 ? as_type<int>(_674) : as_type<int>(_620);
    float _688 = in.m_69.x;
    float _690 = in.m_69.y;
    float _692 = in.m_69.z;
    bool _694 = _636 > 0.5;
    float _696 = _182 * _650;
    float _698 = _176 * _650;
    float _700 = _188 * _650;
    float _702 = _646 ? as_type<float>(_686) : _620;
    float _704 = fma(_180, _648, _696);
    float _706 = _620;
    if (_628)
    {
        float _708 = _694 ? _674 : _620;
        _706 = _708;
    }
    float _710 = _706;
    float _712 = fma(_186, _648, _700);
    int _714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _716 = _714 != 0;
    int _718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _720 = _718 != 0;
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _724 = _722 != 0;
    float _726 = fma(_174, _648, _698);
    float _728 = fma(_184, _652, _704);
    float _730 = fma(_178, _652, _726);
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _734 = _732 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _736 = _660 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _740 = 1.0 / _734;
    float _742 = -_738;
    float _744 = fma(_736, 2.0, _742);
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _748 = _636 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _754 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _690);
    float _756 = fma(_748, -2.0, _746);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _762 = 1.0 / _752;
    float _764 = _622 * _754;
    float _766 = _660 * 2.0;
    float _768 = fma(_190, _652, _712);
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _770;
    bool _774 = _694;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _778 = _760;
    float _780 = _766;
    int _782 = as_type<int>(_768);
    int _784 = as_type<int>(_730);
    if (!_656)
    {
        _212 = _668;
    }
    float _786 = _212;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _792 = _786;
    if (_640)
    {
        bool _794 = _668 > 0.5;
        _774 = _794;
    }
    bool _796 = _774;
    float _798 = 1.0 / _760;
    float _800 = _772 * _740;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _806 = 0.0;
    if (!_656)
    {
        _806 = _636;
    }
    float _808 = _806;
    float _810 = _206 * _680;
    float _812 = _808;
    if (!_656)
    {
        _776 = _660;
    }
    float _814 = _776;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _816;
    float _820 = floor(_766);
    float _822 = _804 * _762;
    float _824 = _814;
    if (!_656)
    {
        _778 = _786;
    }
    float _826 = _778;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _832 = _826;
    if (_656)
    {
        _792 = _668;
    }
    float _834 = _792;
    float _836 = -_144;
    float _838 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[76].x, _744);
    if (!_656)
    {
        _214 = _826;
    }
    float _840 = _214;
    float _842 = in.m_55.w;
    float _844 = _818 * _798;
    float _846 = _660 + _636;
    float _848 = 1.0 / _790;
    float _850 = _846 + (-1.0);
    float _852 = _840;
    if (!_656)
    {
        _780 = _636;
    }
    float _854 = _780;
    float _856 = _854;
    if (_656)
    {
        _812 = _660;
    }
    float _858 = _812;
    float _860 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _864 = _618 + _862;
    float _866 = _636 * 2.0;
    if (_656)
    {
        _856 = _660;
    }
    float _868 = _856;
    if (_656)
    {
        _824 = _834;
    }
    float _870 = _824;
    float _872 = floor(_866);
    if (_656)
    {
        _852 = _636;
    }
    float _874 = _852;
    float _876 = fma(_822, _864, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    if (_656)
    {
        _832 = _636;
    }
    float _878 = _832;
    float _880 = _642 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _882 = _820 >= 0.0;
    bool _884 = isnan(_820);
    bool _886 = _882 || _884;
    bool _888 = isnan(0.0);
    bool _890 = _886 || _888;
    float _892 = _666 * _144;
    float _894 = _830 * _848;
    float _896 = fma(_702, _880, -0.5);
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _900 = _618 + _898;
    int _902 = _890 ? 0 : 1;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _906 = _618 + _904;
    bool _908 = _820 > 0.0;
    float _910 = fma(_844, _900, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _912 = exp2(_892);
    float _914 = fma(_800, _906, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _916 = ~_902;
    int _918 = _916 + 1;
    int _920 = _918 + 1;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _926 = _618 + _924;
    float _928 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[83].z, _922);
    float _930 = _202 * _680;
    float _932 = _208 * _680;
    float _934 = _728 + _676;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _938 = _858 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _940 = fma(_894, _926, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    int _942 = _920;
    float _944 = _894;
    if (!_908)
    {
        int _946 = ~_902;
        int _948 = _946 + 1;
        _942 = _948;
    }
    int _950 = _942;
    float _952 = -_936;
    float _954 = fma(_938, 2.0, _952);
    bool _956 = _872 >= 0.0;
    bool _958 = isnan(_872);
    bool _960 = _956 || _958;
    bool _962 = isnan(0.0);
    bool _964 = _960 || _962;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _968 = _874 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _970 = _964 ? 0 : 1;
    float _972 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[83].w, _966);
    float _974 = fma(_968, -2.0, _678);
    bool _976 = _872 > 0.0;
    float _978 = _636 + _834;
    float _980 = _660 + _834;
    float _982 = _872;
    if (!_634)
    {
        _982 = _684;
    }
    float _984 = _982;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _988 = _978 + (-1.0);
    float _990 = _980 + (-1.0);
    float _992 = _984;
    if (!_634)
    {
        _944 = _984;
    }
    float _994 = _944;
    float _996 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[84].z, _986);
    float _998 = _994;
    if (_634)
    {
        _992 = _684;
    }
    float _1000 = _992;
    float _1002 = _834 * 2.0;
    float _1004 = -_912;
    float _1006 = _1004 + 1.0;
    float _1008 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1010 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1012 = !_720;
    int _1014 = _1012 ? 0 : 1;
    float _1016 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[84].x, _996);
    bool _1018 = !_724;
    int _1020 = _1018 ? 0 : 1;
    float _1022 = floor(_1002);
    int _1024 = ~_970;
    int _1026 = _1024 + 1;
    int _1028 = _1026 + 1;
    float _1030 = _834 + (-0.5);
    int _1032 = _1028;
    if (!_976)
    {
        int _1034 = ~_970;
        int _1036 = _1034 + 1;
        _1032 = _1036;
    }
    int _1038 = _1032;
    float _1040 = _1016 * (-0.15915493667125701904296875);
    int _1042 = abs(_1014);
    int _1044 = abs(_1020);
    float _1046 = in.m_71.x;
    float _1048 = in.m_71.y;
    float _1050 = in.m_71.z;
    bool _1052 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1054 = isnan(0.0);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1042);
    float _1064 = float(_950);
    float _1066 = _1060 ? _1006 : 0.0;
    bool _1068 = _1022 > 0.0;
    float _1070 = _1062 * _1064;
    bool _1072 = _1022 >= 0.0;
    bool _1074 = isnan(_1022);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan(0.0);
    bool _1080 = _1076 || _1078;
    bool _1082 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1084 = isnan(1.0);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1090 = _1086 || _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1094 = 1.0 + _1092;
    float _1096 = float(_1044);
    float _1098 = _1070 * (-2.0);
    float _1100 = 1.0 / _1094;
    float _1102 = float(_1038);
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1106 = fma(_1008, _1098, _1008);
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1110 = fma(_1098, _1048, _1048);
    float _1112 = _1096 * _1102;
    float _1114 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1104);
    float _1116 = -_144;
    float _1118 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[81].x, _954);
    float _1120 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[191].x, _660);
    float _1122 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1108);
    float _1124 = _1112 * (-2.0);
    float _1126 = _636 + (-0.5);
    int _1128 = _1080 ? 0 : 1;
    float _1130 = _1120 + _690;
    float _1132 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1122);
    bool _1134 = !_716;
    int _1136 = _1134 ? 0 : 1;
    float _1138 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1114);
    float _1140 = fma(_1010, _1124, _1010);
    float _1142 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _756);
    float _1144 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _928);
    float _1146 = fma(_1124, _1050, _1050);
    float _1148 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1110);
    float _1150 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _972);
    int _1152 = ~_1128;
    int _1154 = _1152 + 1;
    int _1156 = _1154 + 1;
    float _1158 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1162 = _930 * _1160;
    int _1164 = _1156;
    bool _1166 = _1068;
    if (!_1068)
    {
        int _1168 = ~_1128;
        int _1170 = _1168 + 1;
        _1164 = _1170;
    }
    int _1172 = _1164;
    float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1176 = _932 * _1174;
    int _1178 = abs(_1136);
    float _1180 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _974);
    if (_1090)
    {
        float _1182 = _1066 * _1100;
        _148 = _1182;
    }
    float _1184 = _148;
    float _1186 = _1158 * 0.15915493667125701904296875;
    float _1188 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1190 = -_1162;
    float _1192 = fma(_932, _1188, _1190);
    float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1196 = -_1176;
    float _1198 = fma(_810, _1194, _1196);
    float _1200 = float(_1178);
    float _1202 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1204 = _810 * _1202;
    float _1206 = float(_1172);
    float _1208 = _1198 * _1198;
    float _1210 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1146);
    float _1212 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1214 = -_1204;
    float _1216 = fma(_930, _1212, _1214);
    float _1218 = fma(_1106, _1184, _1148);
    float _1220 = _1200 * _1206;
    float _1222 = fma(_1192, _1192, _1208);
    float _1224 = fma(_1140, _1184, _1210);
    float _1226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1228 = _1220 * (-2.0);
    float _1230 = in.m_59.w;
    float _1232 = fma(_1216, _1216, _1222);
    bool _1234 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1236 = isnan(_618);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1242 = _1238 || _1240;
    float _1244 = float(_1242);
    float _1246 = fma(_860, _1228, _860);
    float _1248 = _1218 * 0.15915493667125701904296875;
    float _1250 = in.m_73.x;
    float _1252 = _1186 * 6.283185482025146484375;
    float _1254 = sin(_1252);
    if (_634)
    {
        bool _1256 = _660 > 0.5;
        _1166 = _1256;
    }
    bool _1258 = _1166;
    float _1260 = _660 + (-0.5);
    bool _1262 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1264 = isnan(_618);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1270 = _1266 || _1268;
    float _1272 = float(_1270);
    float _1274 = -_1244;
    float _1276 = _1274 + 1.0;
    float _1278 = _1224 * 0.15915493667125701904296875;
    float _1280 = -_1272;
    float _1282 = _1280 + 1.0;
    float _1284 = fma(_1228, _1046, _1046);
    bool _1286 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1288 = isnan(_618);
    bool _1290 = _1286 || _1288;
    bool _1292 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1294 = _1290 || _1292;
    float _1296 = float(_1294);
    float _1298 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1300 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1302 = isnan(_618);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1308 = _1304 || _1306;
    float _1310 = float(_1308);
    float _1312 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1284);
    bool _1314 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1316 = isnan(_618);
    bool _1318 = _1314 || _1316;
    bool _1320 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1322 = _1318 || _1320;
    float _1324 = float(_1322);
    float _1326 = -_1296;
    float _1328 = _1326 + 1.0;
    float _1330 = _1296 * _1276;
    float _1332 = fma(_1246, _1184, _1312);
    float _1334 = _730 + _842;
    float _1336 = _1272 * _1328;
    float _1338 = _1310 * _1282;
    float _1340 = -_1310;
    float _1342 = _1340 + 1.0;
    float _1344 = _1332 * 0.15915493667125701904296875;
    float _1346 = _768 + _1230;
    float _1348 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1350 = _1324 * _1342;
    float _1352 = _1248 * 6.283185482025146484375;
    float _1354 = cos(_1352);
    float _1356 = fma(_1298, _710, -0.5);
    float _1358 = _1342;
    if (_634)
    {
        float _1360 = -_1000;
        float _1362 = _1360 + 1.0;
        _782 = as_type<int>(_1362);
    }
    int _1364 = _782;
    float _1366 = _914 * _1350;
    if (_640)
    {
        float _1368 = -_1000;
        float _1370 = _1368 + 1.0;
        _784 = as_type<int>(_1370);
    }
    int _1372 = _784;
    float _1374 = -_1324;
    float _1376 = _1374 + 1.0;
    float _1378 = _1348 * _1250;
    if (!_640)
    {
        _1358 = _1000;
    }
    float _1380 = _1358;
    float _1382 = _1278 * 6.283185482025146484375;
    float _1384 = cos(_1382);
    float _1386 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1366);
    float _1388 = _1380;
    if (_634)
    {
        float _1390 = _1258 ? as_type<float>(_1364) : _1000;
        _998 = _1390;
    }
    float _1392 = _998;
    float _1394 = _1378 + _692;
    if (_640)
    {
        float _1396 = _796 ? as_type<float>(_1372) : _1000;
        _1388 = _1396;
    }
    float _1398 = _1388;
    float _1400 = _1378 + _688;
    float _1402 = _588 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1404 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1394);
    float _1406 = _1344 * 6.283185482025146484375;
    float _1408 = sin(_1406);
    float _1410 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1400);
    float _1412 = -_1142;
    float _1414 = fma(_1138, _1356, _1412);
    float _1416 = _670 * _1404;
    float _1418 = fma(_876, _1338, _1386);
    float _1420 = _1402 * _1410;
    bool _1422 = _690 != 0.0;
    bool _1424 = isnan(_690);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan(0.0);
    bool _1430 = _1426 || _1428;
    float _1432 = _1248 * 6.283185482025146484375;
    float _1434 = sin(_1432);
    float _1436 = _1354 * _1384;
    float _1438 = -_688;
    bool _1440 = _1378 == _1438;
    bool _1442 = !_1430;
    bool _1444 = _1440 && _1442;
    float _1446 = -_692;
    bool _1448 = _1378 == _1446;
    bool _1450 = _1448 && _1444;
    float _1452 = _1344 * 6.283185482025146484375;
    float _1454 = cos(_1452);
    float _1456 = _1408 * _1354;
    float _1458 = rsqrt(_1232);
    float _1460 = _1434 * _1384;
    float _1462 = _1408 * _1434;
    float _1464 = _1408 * _1384;
    float _1466 = _1278 * 6.283185482025146484375;
    float _1468 = sin(_1466);
    float _1470 = _1454 * _1354;
    float _1472 = _1454 * _1434;
    float _1474 = _1454 * _1384;
    float _1476 = _1192 * _1458;
    float _1478 = _1198 * _1458;
    float _1480 = _1216 * _1458;
    float _1482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1484 = _930 * _1480;
    float _1486 = fma(_1468, _1470, _1462);
    float _1488 = fma(_1468, _1462, _1470);
    float _1490 = -_1472;
    float _1492 = fma(_1468, _1456, _1490);
    float _1494 = -_1456;
    float _1496 = fma(_1468, _1472, _1494);
    float _1498 = _1474 * _810;
    float _1500 = _810 * _1478;
    float _1502 = _1474 * _932;
    float _1504 = -_1484;
    float _1506 = fma(_932, _1478, _1504);
    float _1508 = -_1468;
    float _1510 = fma(_1508, _1476, _1498);
    float _1512 = -_1500;
    float _1514 = fma(_930, _1476, _1512);
    float _1516 = _1486 * _810;
    float _1518 = -_1468;
    float _1520 = fma(_1518, _1480, _1502);
    float _1522 = _1486 * _932;
    float _1524 = _1496 * _932;
    float _1526 = fma(_1436, _1476, _1516);
    float _1528 = _1496 * _810;
    float _1530 = fma(_1436, _1480, _1522);
    float _1532 = fma(_1464, _1506, _1510);
    float _1534 = fma(_1464, _1514, _1520);
    float _1536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1538 = fma(_1460, _1480, _1524);
    float _1540 = fma(_1492, _1506, _1526);
    float _1542 = fma(_1460, _1476, _1528);
    float _1544 = fma(_1492, _1514, _1530);
    float _1546 = _764 * _1532;
    float _1548 = _764 * _1534;
    float _1550 = fma(_1488, _1506, _1542);
    float _1552 = fma(_1488, _1514, _1538);
    float _1554 = fma(_1420, _1540, _1546);
    float _1556 = fma(_1420, _1544, _1548);
    float _1558 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1560 = fma(_910, _1336, _1418);
    float _1562 = fma(_1416, _1550, _1554);
    float _1564 = fma(_1416, _1552, _1556);
    float _1566 = _932 * _1476;
    float _1568 = _1536 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1570 = _934 + _1562;
    float _1572 = _1346 + _1564;
    float _1574 = fma(_1558, _1392, -0.5);
    float _1576 = fma(_1568, _1398, -0.5);
    float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1580 = _1570 + _1578;
    float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1584 = _1572 + _1582;
    float _1586 = fma(_1132, _1574, _838);
    float _1588 = _1474 * _930;
    float _1590 = _1580 * _1580;
    float _1592 = _1584 * _1584;
    float _1594 = in.m_75.x;
    float _1596 = in.m_75.y;
    float _1598 = in.m_75.z;
    float _1600 = _1040 * 6.283185482025146484375;
    float _1602 = sin(_1600);
    float _1604 = -_1566;
    float _1606 = fma(_810, _1480, _1604);
    float _1608 = _1590 + _1592;
    float _1610 = _1486 * _930;
    float _1612 = -_1468;
    float _1614 = fma(_1612, _1478, _1588);
    float _1616 = _1496 * _930;
    float _1618 = fma(_940, _1330, _1560);
    float _1620 = fma(_1436, _1478, _1610);
    float _1622 = sqrt(_1608);
    float _1624 = fma(_1464, _1606, _1614);
    float _1626 = fma(_1460, _1478, _1616);
    float _1628 = fma(_1492, _1606, _1620);
    float _1630 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1618);
    float _1632 = _764 * _1624;
    float _1634 = fma(_1488, _1606, _1626);
    float _1636 = _1040 * 6.283185482025146484375;
    float _1638 = cos(_1636);
    float _1640 = fma(_1420, _1628, _1632);
    float _1642 = _1602 * _896;
    float _1644 = fma(_1416, _1634, _1640);
    float _1646 = _1596;
    float _1648 = _1594;
    float _1650 = _1590;
    float _1652 = _1592;
    float _1654 = _1570;
    float _1656 = _1572;
    float _1658 = _1644;
    float _1660 = _1598;
    if (!_1450)
    {
        float _1662 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1596);
        _1646 = _1662;
    }
    float _1664 = _1646;
    bool _1666 = _1622 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1668 = _1334 + _1644;
    if (!_1450)
    {
        float _1670 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1594);
        _1648 = _1670;
    }
    float _1672 = _1648;
    float _1674 = _1532 * _1664;
    float _1676 = _1534 * _1664;
    float _1678 = _1638 * _896;
    float _1680 = -_1642;
    float _1682 = fma(_1638, _1576, _1680);
    float _1684 = fma(_1602, _1576, _1678);
    float _1686 = fma(_1144, _1682, _1118);
    float _1688 = _1682;
    if (!_1666)
    {
        _1688 = _1668;
    }
    float _1690 = _1688;
    float _1692 = -_1180;
    float _1694 = fma(_1150, _1684, _1692);
    float _1696 = _1624 * _1664;
    bool _1698 = !_1666;
    float _1700 = _1690;
    if (!_1698)
    {
        float _1702 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1704 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1706 = _1622 + _1704;
        float _1708 = rsqrt(_1608);
        float _1710 = _1706 * _1702;
        float _1712 = _1668 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1714 = _1710 * 0.15915493667125701904296875;
        float _1716 = _1714 * 6.283185482025146484375;
        float _1718 = sin(_1716);
        float _1720 = _1714 * 6.283185482025146484375;
        float _1722 = cos(_1720);
        float _1724 = fma(_1718, _1712, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1726 = _1708 * _1724;
        float _1728 = fma(_1580, _1726, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1730 = _1722 + (-1.0);
        float _1732 = fma(_1584, _1726, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1736 = _1728 + _1734;
        float _1738 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1740 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1742 = _1732 + _1740;
        float _1744 = _1736 * _1736;
        float _1746 = fma(_1668, _1722, _1738);
        float _1748 = _1742 * _1742;
        _1700 = _1746;
        _1650 = _1744;
        _1652 = _1748;
        _1654 = _1728;
        _1656 = _1732;
        _1658 = _1714;
    }
    float _1750 = _1700;
    float _1752 = _1650;
    float _1754 = _1652;
    float _1756 = _1654;
    float _1758 = _1656;
    float _1760 = _1658;
    float _1762 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1764 = _1750 + _1762;
    float _1766 = fma(_1540, _1672, _1674);
    float _1768 = fma(_1764, _1764, _1752);
    float _1770 = fma(_1628, _1672, _1696);
    float _1772 = _1760;
    if (!_1450)
    {
        float _1774 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1598);
        _1660 = _1774;
    }
    float _1776 = _1660;
    float _1778 = _1768 + _1754;
    float _1780 = fma(_1544, _1672, _1676);
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1786 = sqrt(_1778);
    float _1788 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1790 = fma(_1550, _1776, _1766);
    float _1792 = fma(_1634, _1776, _1770);
    float _1794 = _1782 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1796 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1798 = _1788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1800 = _1414 + 0.5;
    float _1802 = _1586 + 0.5;
    float _1804 = _1630 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1806 = _1686 + 0.5;
    float _1808 = _1694 + 0.5;
    float _1810 = fma(_1552, _1776, _1780);
    out.m_77.x = _1250;
    bool _1812 = _1786 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1814 = isnan(_1786);
    bool _1816 = _1812 || _1814;
    bool _1818 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1820 = _1816 || _1818;
    out.m_79.x = _1794;
    out.m_79.y = _1796;
    out.m_79.z = _1798;
    out.m_79.w = _1804;
    out.m_81.x = _1802;
    out.m_81.y = _1800;
    out.m_81.z = _1806;
    out.m_81.w = _1808;
    out.m_83.x = _1790;
    out.m_83.y = _1792;
    out.m_83.z = _1810;
    float _1822 = _1798;
    float _1824 = _1804;
    float _1826 = _1800;
    if (!_1820)
    {
        _1772 = 1.0;
    }
    float _1828 = _1772;
    bool _1830 = !_1820;
    float _1832 = _1828;
    if (!_1830)
    {
        bool _1834 = _1786 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1836 = isnan(_1786);
        bool _1838 = _1834 || _1836;
        bool _1840 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1842 = _1838 || _1840;
        if (!_1842)
        {
            float _1844 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1846 = _1786 + _1844;
            float _1848 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1850 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1848;
            float _1852 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1854 = _1852 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1856 = 1.0 / _1850;
            float _1858 = _1846 * _1856;
            float _1860 = fma(_1858, _1854, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1832 = _1860;
            _1862 = true;
        }
        else
        {
            bool _1864 = _1786 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1866 = isnan(_1786);
            bool _1868 = _1864 || _1866;
            bool _1870 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1872 = _1868 || _1870;
            if (!_1872)
            {
                float _1874 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1876 = _1786 + _1874;
                float _1878 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1880 = _1878 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1882 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1884 = _1882 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1886 = 1.0 / _1880;
                float _1888 = _1876 * _1886;
                float _1890 = fma(_1888, _1884, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1832 = _1890;
                _1862 = true;
            }
            else
            {
                _1832 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1862 = false;
    float _1892 = _1832;
    float _1894 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1896 = _1750 + _1894;
    float _1898 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1900 = _1756 + _1898;
    float _1902 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1904 = _1758 + _1902;
    float _1906 = fma(_1896, _1892, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1908 = fma(_1900, _1892, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1910 = fma(_1904, _1892, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1912 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1914 = _1906 + _1912;
    float _1916 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1918 = _1908 + _1916;
    float _1920 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1922 = _1910 + _1920;
    float _1924 = _1914 * _1914;
    float _1926 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1928 = fma(_1918, _1918, _1924);
    float _1930 = fma(_1922, _1922, _1928);
    float _1932 = rsqrt(_1930);
    float _1934 = _1932 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1936 = _1918 * _1934;
    float _1938 = _1922 * _1934;
    float _1940 = _1936 * _1936;
    float _1942 = _1938 * _1938;
    float _1944 = _1940 + _1942;
    float _1946 = sqrt(_1944);
    bool _1948 = _1946 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1950 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1952 = _1946 + _1950;
    float _1954 = _1922;
    float _1956 = _1952;
    float _1958 = _1934;
    float _1960 = _1936;
    if (_1948)
    {
        float _1962 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1954 = _1962;
    }
    float _1964 = _1954;
    if (_1948)
    {
        float _1966 = rsqrt(_1944);
        _1822 = _1966;
    }
    float _1968 = _1822;
    float _1970 = _1968;
    if (_1948)
    {
        float _1972 = _1952 * _1964;
        _1956 = _1972;
    }
    float _1974 = _1956;
    if (_1948)
    {
        float _1976 = _1974 * 0.15915493667125701904296875;
        _1824 = _1976;
    }
    float _1978 = _1824;
    float _1980 = _1932;
    if (_1948)
    {
        float _1982 = _1978 * 6.283185482025146484375;
        float _1984 = sin(_1982);
        _1980 = _1984;
    }
    float _1986 = _1980;
    float _1988 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1990 = precise::max(0.0, _1988);
    float _1992 = _1796;
    float _1994 = _1990;
    float _1996 = _1988;
    if (_1948)
    {
        float _1998 = _1978 * 6.283185482025146484375;
        float _2000 = cos(_1998);
        _1992 = _2000;
    }
    float _2002 = _1992;
    float _2004 = -_1934;
    float _2006 = -_1990;
    float _2008 = fma(_1914, _2004, _2006);
    float _2010 = _2008;
    if (_1948)
    {
        float _2012 = _2008 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1994 = _2012;
    }
    float _2014 = _1994;
    float _2016 = _1986;
    float _2018 = _2014;
    if (_1948)
    {
        float _2020 = fma(_1986, _2014, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2016 = _2020;
    }
    float _2022 = _2016;
    float _2024 = _2022;
    if (!_1948)
    {
        _2018 = _1938;
    }
    float _2026 = _2018;
    float _2028 = _2026;
    if (_1948)
    {
        float _2030 = _2002 + (-1.0);
        _1996 = _2030;
    }
    float _2032 = _1996;
    if (_1948)
    {
        float _2034 = _1968 * _2022;
        _1826 = _2034;
    }
    float _2036 = _1826;
    if (!_1948)
    {
        _2024 = _2008;
    }
    float _2038 = _2024;
    float _2040 = _2038;
    if (_1948)
    {
        float _2042 = _2032 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1958 = _2042;
    }
    float _2044 = _1958;
    if (_1948)
    {
        float _2046 = _1936 * _2036;
        _1960 = _2046;
    }
    float _2048 = _1960;
    if (!_1948)
    {
        _1970 = _1940;
    }
    float _2050 = _1970;
    float _2052 = _2050;
    if (_1948)
    {
        float _2054 = _1938 * _2036;
        _2028 = _2054;
    }
    float _2056 = _2028;
    if (_1948)
    {
        float _2058 = fma(_2008, _2002, _2044);
        _2040 = _2058;
    }
    float _2060 = _2040;
    if (_1948)
    {
        float _2062 = _2048 * _2048;
        _2052 = _2062;
    }
    float _2064 = _2052;
    if (!_1948)
    {
        _2010 = _1942;
    }
    float _2066 = _2010;
    float _2068 = sqrt(_1930);
    float _2070 = _2066;
    if (_1948)
    {
        float _2072 = _2056 * _2056;
        _2070 = _2072;
    }
    float _2074 = _2070;
    float _2076 = fma(_2060, _2060, _2064);
    float _2078 = _1906 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2080 = _1906 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2082 = _1906 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2084 = _2076 + _2074;
    float _2086 = _1906 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2088 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2078);
    float _2090 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2080);
    float _2092 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2082);
    float _2094 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2086);
    float _2096 = rsqrt(_2084);
    float _2098 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2088);
    float _2100 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2090);
    float _2102 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2094);
    float _2104 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2106 = fma(_2068, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2104);
    float _2108 = precise::clamp(_2106, 0.0, 1.0);
    float _2110 = _2098 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2112 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2092);
    float _2114 = _2100 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2116 = -_2108;
    float _2118 = _2116 + 1.0;
    float _2120 = _2102 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2122 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2124 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2126 = _2112 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2128 = abs(_2118);
    float _2130 = log2(_2128);
    float _2132 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2122);
    float _2134 = _2096 * _2048;
    float _2136 = _2096 * _2060;
    float _2138 = _2096 * _2056;
    float _2140 = -_2124;
    float _2142 = fma(_2140, _1926, 1.0);
    float _2144 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2146 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2132);
    float _2148 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2150 = -_2144;
    float _2152 = fma(_2136, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2150);
    float _2154 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2146);
    float _2156 = log2(_2142);
    float _2158 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2148);
    float _2160 = -_2138;
    float _2162 = fma(_2160, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2152);
    float _2164 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2166 = _2130 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2168 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2158);
    float _2170 = fma(_2162, -0.5, 0.5);
    float _2172 = fma(_2162, 0.5, 0.5);
    float _2174 = 1.0 / _2154;
    float _2176 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2164);
    float _2178 = _2136 + 1.0;
    float _2180 = fma(_2172, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2182 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2168);
    float _2184 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2176);
    float _2186 = fma(_2172, _2180, -0.212114393711090087890625);
    float _2188 = exp2(_2166);
    float _2190 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2184);
    float _2192 = _2156 * 0.693147182464599609375;
    float _2194 = fma(_2172, _2186, 1.570728778839111328125);
    float _2196 = _2192 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2198 = sqrt(_2170);
    float _2200 = _2190 * _2174;
    float _2202 = fma(_2200, 0.5, 0.5);
    float _2204 = -_2136;
    float _2206 = fma(_2188, _2178, _2204);
    float _2208 = _2182 * _2174;
    float _2210 = fma(_2206, 0.5, 0.5);
    float _2212 = fma(_2208, -0.5, 0.5);
    float _2214 = _2198 * 0.636619746685028076171875;
    float _2216 = -_2194;
    float _2218 = fma(_2214, _2216, 1.0);
    float3 _6171 = float3(_2202, _2212, _2196);
    float _2220 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6171, float3(0.0), isnan(_6171)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6171, float3(0.0), isnan(_6171)), level(0.0)).x;
    float3 _6182 = float3(_2202, _2212, _2196);
    float4 _2223 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6182, float3(0.0), isnan(_6182)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6182, float3(0.0), isnan(_6182)), level(0.0)).xyzw;
    float _2225 = _2223.x;
    float _2227 = _2223.y;
    float _2229 = _2223.z;
    float _2231 = _2223.w;
    float2 _6199 = float2(_2218, _2210);
    float3 _2235 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6199, float2(0.0), isnan(_6199)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6199, float2(0.0), isnan(_6199)), level(0.0)).xyz;
    float _2237 = _2235.x;
    float _2239 = _2235.y;
    float _2241 = _2235.z;
    float _2243 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2245 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2247 = _2130 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2249 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2243);
    float _2251 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2245);
    float _2253 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2255 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2249);
    float _2257 = exp2(_2247);
    float _2259 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2253);
    float _2261 = _2255 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2263 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2251);
    float _2265 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2259);
    bool _2267 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2269 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2271 = _2267 || _2269;
    bool _2273 = isnan(0.5);
    bool _2275 = _2271 || _2273;
    float _2277 = _2190 + _2154;
    float _2279 = 1.0 / _2261;
    float _2281 = _2263 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2283 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2265);
    float _2285 = _2277 * 0.5;
    float _2287 = _2281 + _2261;
    float _2289 = _2283 + _2154;
    float _2291 = -_2257;
    float _2293 = _2291 + 1.0;
    float _2295 = _2289 * 0.5;
    float _2297 = _2287 * _2279;
    float _2299 = _2297 * 0.5;
    float _2301 = _2154 * 0.5;
    float _2303 = _2293 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2305 = _2293;
    float _2307 = _2283;
    float _2309 = _2182;
    float _2311 = _2190;
    if (_2275)
    {
        _2305 = 1.0;
    }
    float _2313 = _2305;
    float _2315 = fma(_2182, -0.5, _2301);
    float _2317 = _2313;
    float _2319 = _2227;
    float _2321 = _2225;
    if (!_2275)
    {
        float _2323 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2325 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2327 = fma(_2299, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2325);
        float _2329 = _2323 * 0.15915493667125701904296875;
        float _2331 = _2329 * 6.283185482025146484375;
        float _2333 = cos(_2331);
        float _2335 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2337 = _2335 * 0.15915493667125701904296875;
        float _2339 = _2329 * 6.283185482025146484375;
        float _2341 = sin(_2339);
        float _2343 = 1.0 / _2333;
        float _2345 = _2337 * 6.283185482025146484375;
        float _2347 = cos(_2345);
        float _2349 = _2341 * _2343;
        float _2351 = 1.0 / _2327;
        float _2353 = _2347 * _2349;
        float _2355 = _2337 * 6.283185482025146484375;
        float _2357 = sin(_2355);
        float _2359 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2361 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2359;
        float _2363 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2365 = _2351 * _2363;
        float _2367 = 1.0 / _2353;
        float _2369 = 1.0 / _2361;
        float _2371 = _2357 * _2367;
        float _2373 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2375 = fma(_2371, _2365, _2373);
        float _2377 = _2375 * _2369;
        float _2379 = precise::clamp(_2377, 0.0, 1.0);
        _2317 = _2379;
    }
    float _2381 = _2317;
    float _2383 = _2303 * _2220;
    float _2385 = -_2303;
    float _2387 = _2385 + 1.0;
    out.m_85.x = _2285;
    out.m_85.y = _2315;
    out.m_85.z = _2295;
    out.m_85.w = _2154;
    bool _2389 = _2068 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2391 = isnan(_2068);
    bool _2393 = _2389 || _2391;
    bool _2395 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2397 = _2393 || _2395;
    float _2399 = _2231 * _2383;
    float _2401 = _2241 * _2383;
    float _2403 = _2231 * _2387;
    float _2405 = fma(_2237, _2399, _2225);
    float _2407 = fma(_2239, _2399, _2227);
    float _2409 = fma(_2231, _2401, _2229);
    out.gl_Position.x = _2190;
    out.gl_Position.y = _2182;
    out.gl_Position.z = _2283;
    out.gl_Position.w = _2154;
    out.m_87.x = _2405;
    out.m_87.y = _2407;
    out.m_87.z = _2409;
    out.m_87.w = _2403;
    float _2411 = _2399;
    if (!_2397)
    {
        _2319 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2413 = _2319;
    float _2415 = _2413;
    float _2417 = _2413;
    if (!_2397)
    {
        _2321 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2419 = _2321;
    float _2421 = _2419;
    float _2423 = _2419;
    if (!_2397)
    {
        _2411 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2425 = _2411;
    float _2427 = _2381 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2429 = _2425;
    float _2431 = _2425;
    if (!_2397)
    {
        _2307 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2433 = _2307;
    float _2435 = _2433;
    float _2437 = _2433;
    if (!_2397)
    {
        _2309 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2439 = _2309;
    float _2441 = _2439;
    float _2443 = _2439;
    if (!_2397)
    {
        _2311 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2445 = _2311;
    bool _2447 = !_2397;
    float _2449 = _2445;
    float _2451 = _2445;
    if (!_2447)
    {
        bool _2453 = _2068 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2455 = isnan(_2068);
        bool _2457 = _2453 || _2455;
        bool _2459 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2461 = _2457 || _2459;
        if (!_2461)
        {
            float _2463 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2465 = _2068 + _2463;
            float _2467 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2469 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2467;
            float _2471 = 1.0 / _2469;
            float _2473 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2475 = _2473 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2477 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2479 = _2477 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2481 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2483 = _2481 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2487 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2491 = _2489 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2493 = _2465 * _2471;
            float _2495 = precise::clamp(_2493, 0.0, 1.0);
            float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2499 = _2497 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2501 = fma(_2495, _2475, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2503 = fma(_2495, _2499, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2505 = fma(_2495, _2479, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2507 = fma(_2495, _2483, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2509 = fma(_2495, _2487, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2511 = fma(_2495, _2491, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2443 = _2503;
            _2423 = _2509;
            _2437 = _2501;
            _2417 = _2507;
            _2451 = _2505;
            _2431 = _2511;
            _2513 = true;
        }
        else
        {
            bool _2515 = _2068 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2517 = isnan(_2068);
            bool _2519 = _2515 || _2517;
            bool _2521 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2523 = _2519 || _2521;
            if (!_2523)
            {
                _2435 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2525 = _2435;
            _2437 = _2525;
            if (!_2523)
            {
                _2441 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2527 = _2441;
            _2443 = _2527;
            if (!_2523)
            {
                _2449 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2529 = _2449;
            _2451 = _2529;
            if (!_2523)
            {
                _2415 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2531 = _2415;
            _2417 = _2531;
            if (!_2523)
            {
                _2421 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2533 = _2421;
            _2423 = _2533;
            if (!_2523)
            {
                _2429 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2535 = _2429;
            bool _2537 = !_2523;
            _2431 = _2535;
            if (!_2537)
            {
                bool _2539 = _2068 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2541 = isnan(_2068);
                bool _2543 = _2539 || _2541;
                bool _2545 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2547 = _2543 || _2545;
                if (!_2547)
                {
                    float _2549 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2551 = _2068 + _2549;
                    float _2553 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2555 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2553;
                    float _2557 = 1.0 / _2555;
                    float _2559 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2561 = _2559 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2563 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2565 = _2563 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2567 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2569 = _2567 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2571 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2573 = _2571 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2575 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2577 = _2575 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2579 = _2551 * _2557;
                    float _2581 = precise::clamp(_2579, 0.0, 1.0);
                    float _2583 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2585 = _2583 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2587 = fma(_2581, _2561, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2589 = fma(_2581, _2585, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2591 = fma(_2581, _2565, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2593 = fma(_2581, _2569, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2595 = fma(_2581, _2573, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2597 = fma(_2581, _2577, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2443 = _2589;
                    _2423 = _2595;
                    _2437 = _2587;
                    _2417 = _2593;
                    _2451 = _2591;
                    _2431 = _2597;
                    _2513 = true;
                }
                else
                {
                    _2443 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2423 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2437 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2417 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2451 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2431 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2513 = false;
    float _2599 = _2443;
    float _2601 = _2423;
    float _2603 = _2437;
    float _2605 = _2417;
    float _2607 = _2451;
    float _2609 = _2431;
    float _2611 = fma(_1792, -0.5, 0.5);
    float _2613 = precise::clamp(_2611, 0.0, 1.0);
    float _2615 = -_2599;
    float _2617 = _2615 + _2601;
    float _2619 = _2427 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2621 = -_2603;
    float _2623 = _2621 + _2605;
    out.m_89.x = 0.0;
    float _2625 = fma(_2613, _2617, _2599);
    float _2627 = fma(_2613, _2623, _2603);
    out.m_49.x = _2619;
    float _2629 = -_2607;
    float _2631 = _2629 + _2609;
    float _2633 = _2625 * 0.586610972881317138671875;
    bool _2635 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2637 = fma(_2613, _2631, _2607);
    float _2639 = fma(_2627, 0.298911988735198974609375, _2633);
    bool _2641 = _2381 > 0.0;
    bool _2643 = isnan(_2381);
    bool _2645 = _2641 || _2643;
    bool _2647 = isnan(0.0);
    bool _2649 = _2645 || _2647;
    float _2651 = fma(_2637, 0.114477999508380889892578125, _2639);
    float _2653 = -_2651;
    float _2655 = _2627 + _2653;
    float _2657 = -_2651;
    float _2659 = _2625 + _2657;
    float _2661 = -_2651;
    float _2663 = _2637 + _2661;
    float _2665 = fma(_2655, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2651);
    float _2667 = fma(_2659, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2651);
    float _2669 = fma(_2663, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2651);
    bool _2671 = !_2635;
    if (!_2671)
    {
        float _2673 = -_1906;
        float _2675 = _2673 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2677 = -_1908;
        float _2679 = _2677 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2681 = -_1910;
        float _2683 = _2681 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2685 = _2675 * _2675;
        float _2687 = fma(_2679, _2679, _2685);
        float _2689 = fma(_2683, _2683, _2687);
        float _2691 = sqrt(_2689);
        float _2693 = rsqrt(_2689);
        float _2695 = -_2691;
        float _2697 = _2695 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2699 = _2697 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2701 = precise::clamp(_2699, 0.0, 1.0);
        float _2703 = _2679 * _2693;
        float _2705 = _2675 * _2693;
        float _2707 = abs(_2701);
        float _2709 = log2(_2707);
        float _2711 = _2683 * _2693;
        float _2713 = _2703 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2715 = _1792 * _2705;
        float _2717 = -_2705;
        float _2719 = -_2713;
        float _2721 = fma(_2717, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2719);
        float _2723 = fma(_1790, _2703, _2715);
        float _2725 = -_2711;
        float _2727 = fma(_2725, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2721);
        float _2729 = fma(_1810, _2711, _2723);
        float _2731 = precise::clamp(_2729, 0.0, 1.0);
        float _2733 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2735 = _2727 + _2733;
        float _2737 = _2709 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2739 = _2735 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2741 = precise::clamp(_2739, 0.0, 1.0);
        float _2743 = exp2(_2737);
        float _2745 = _2743 * _2741;
        float _2747 = _2731 * _2745;
        float _2749 = _2747 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2751 = _2747 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2753 = _2747 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2749;
        out.m_89.y = _2751;
        out.m_89.z = _2753;
    }
    out.m_91.x = _2665;
    out.m_91.y = _2667;
    out.m_91.z = _2669;
    if (_2649)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2755 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2755;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

