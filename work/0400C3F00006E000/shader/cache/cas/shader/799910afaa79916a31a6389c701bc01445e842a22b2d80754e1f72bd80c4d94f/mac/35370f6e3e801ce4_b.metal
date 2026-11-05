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
    float4 m_71 [[user(locn1)]];
    float4 m_83 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_69 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_73 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
    float4 m_51 [[attribute(9)]];
    float4 m_53 [[attribute(10)]];
    float4 m_75 [[attribute(11)]];
    float4 m_63 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2606 = false;
    bool _988 = false;
    bool _884 = false;
    bool _490 = false;
    bool _270 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3168 = as_type<float>(_120);
        out.gl_Position.z = _3168;
    }
    if (!_108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = _138;
    if (_134)
    {
        float _142 = float(_104);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _138 >= _144;
    bool _148 = !_134;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3238 = as_type<float>(_158);
        out.gl_Position.z = _3238;
    }
    if (_150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = in.m_51.x;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _138 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _168 = _166 != 0;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _172 = _170 != 0;
    int _174 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _176 = _174 != 0;
    float _178 = _164 * _162;
    float _180 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[20].x, _178);
    float _182 = _180 * 6.283185482025146484375;
    float _184 = floor(_180);
    float _186 = _182 * 0.15915493667125701904296875;
    bool _188 = !_168;
    int _190 = _188 ? 0 : 1;
    int _192 = abs(_190);
    float _194 = _186 * 6.283185482025146484375;
    float _196 = cos(_194);
    bool _198 = !_176;
    int _200 = _198 ? 0 : 1;
    bool _202 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _204 = abs(_200);
    float _206 = -_184;
    float _208 = _180 + _206;
    bool _210 = !_172;
    int _212 = _210 ? 0 : 1;
    int _214 = abs(_212);
    float _216 = -_208;
    float _218 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _220 = float(_192);
    float _222 = fma(_196, 0.5, 0.5);
    bool _224 = _208 < 0.5;
    float _226 = float(_224);
    float _228 = abs(_218);
    float _230 = _220 * _228;
    float _232 = -_222;
    float _234 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _236 = float(_204);
    float _238 = -_226;
    float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _242 = float(_214);
    float _244 = fma(_236, _234, _230);
    float _246 = abs(_240);
    float _248 = fma(_242, _246, _244);
    bool _250 = !_202;
    bool _252 = _172;
    float _268;
    if (!_250)
    {
        float _254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _256 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _258 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _260 = _258 * _254;
        float _262 = floor(_260);
        float _264 = -_262;
        float _266 = _260 + _264;
        _268 = _266;
        _270 = true;
    }
    else
    {
        float _272 = float(_104);
        float _274 = 1.0 / _272;
        float _276 = _138 * _274;
        _268 = _276;
    }
    _270 = false;
    float _278 = _268;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = _278 + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _286 = _278 + _284;
    bool _288 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _290 = isnan(_278);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = _278 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = 1.0 / _302;
    bool _318 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _320 = 1.0 / _314;
    float _322 = 1.0 / _310;
    float _324 = _282 * _316;
    bool _326 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _328 = isnan(_278);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -_298;
    float _340 = _338 + 1.0;
    float _342 = _336 * _340;
    float _344 = _286 * _320;
    bool _346 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _348 = isnan(_278);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _358;
    bool _362 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _364 = isnan(_278);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _376 = _374 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _378 = -_336;
    float _380 = _378 + 1.0;
    float _382 = -_356;
    float _384 = _382 + 1.0;
    float _386 = _306 * _322;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _388;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _392;
    float _396 = _372 * _384;
    float _398 = fma(_360, _386, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _400 = fma(_390, _386, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _402 = fma(_394, _386, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _404 = _356 * _380;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = _400 * _396;
    float _412 = _402 * _396;
    float _414 = _398 * _396;
    float _416 = -_372;
    float _418 = _416 + 1.0;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].x, _412);
    float _426 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].y, _410);
    float _428 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].z, _414);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _430;
    float _434 = fma(_376, _344, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _436 = fma(_422, _344, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _438 = fma(_408, _344, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _444;
    float _448 = fma(_434, _404, _424);
    float _450 = fma(_432, _324, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _452 = fma(_442, _324, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _454 = fma(_446, _324, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _456 = fma(_436, _404, _426);
    float _458 = fma(_438, _404, _428);
    float _460 = fma(_450, _342, _448);
    float _462 = fma(_452, _342, _456);
    float _464 = fma(_454, _342, _458);
    float _466 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[146].x, _460);
    float _468 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[146].y, _462);
    float _470 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[146].z, _464);
    bool _472 = !_318;
    float _488;
    if (!_472)
    {
        float _474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _476 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _478 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[11].x, _138);
        float _480 = _478 * _474;
        float _482 = floor(_480);
        float _484 = -_482;
        float _486 = _480 + _484;
        _488 = _486;
        _490 = true;
    }
    else
    {
        float _492 = float(_104);
        float _494 = 1.0 / _492;
        float _496 = _138 * _494;
        _488 = _496;
    }
    _490 = false;
    float _498 = _488;
    float _500 = in.m_53.x;
    float _502 = in.m_53.y;
    float _504 = in.m_53.z;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _506;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _522 = 1.0 / _508;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _532 = 1.0 / _512;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _536 = _498 + _534;
    bool _538 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _540 = isnan(_498);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    bool _550 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _552 = isnan(_498);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = 1.0 / _520;
    float _564 = _536 * _522;
    bool _566 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _568 = isnan(_498);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _580 = _498 + _578;
    float _582 = _470 * _504;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _586 = _498 + _584;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _590 = _498 + _588;
    float _592 = _468 * _502;
    float _594 = 1.0 / _526;
    bool _596 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _598 = isnan(_498);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = _580 * _532;
    float _610 = -_576;
    float _612 = _610 + 1.0;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _616 = _498 + _614;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _618;
    float _622 = -_606;
    float _624 = _622 + 1.0;
    float _626 = 1.0 / _530;
    float _628 = _586 * _562;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _630;
    float _634 = _466 * _500;
    bool _636 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _638 = 1.0 / _516;
    bool _640 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _642 = isnan(_498);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = _650 * _612;
    float _654 = _590 * _626;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _658 = _498 + _656;
    float _660 = -_650;
    float _662 = _660 + 1.0;
    float _664 = fma(_620, _564, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _666 = _658 * _594;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _668;
    float _672 = _606 * _662;
    float _674 = _616 * _638;
    float _676 = fma(_632, _564, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _678 = fma(_670, _564, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _680 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _682 = isnan(_498);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _700 = _548 * _624;
    float _702 = -_548;
    float _704 = _702 + 1.0;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    bool _710 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _712 = isnan(_498);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = fma(_698, _608, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _724 = _690 * _704;
    float _726 = fma(_694, _608, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _728 = fma(_708, _608, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _730 = -_690;
    float _732 = _730 + 1.0;
    float _734 = -_720;
    float _736 = _734 + 1.0;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _742;
    float _746 = _720 * _732;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _748;
    float _752 = _560 * _736;
    float _754 = fma(_740, _674, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _756 = -_560;
    float _758 = _756 + 1.0;
    float _760 = fma(_750, _674, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _762 = _678 * _752;
    float _764 = fma(_744, _674, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _766 = _664 * _752;
    float _768 = _676 * _752;
    float _770 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[107].z, _762);
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _776 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[107].x, _766);
    float _778 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[107].y, _768);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _784 = fma(_728, _746, _770);
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _788 = _786 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _790 = fma(_722, _746, _776);
    float _792 = fma(_726, _746, _778);
    float _794 = fma(_774, _628, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _796 = fma(_782, _628, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _798 = fma(_788, _628, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _800 = fma(_760, _724, _790);
    float _802 = fma(_754, _724, _792);
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _804;
    float _808 = fma(_764, _724, _784);
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _810;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _814;
    float _818 = fma(_806, _666, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _820 = fma(_794, _700, _800);
    float _822 = fma(_796, _700, _802);
    float _824 = fma(_798, _700, _808);
    float _826 = fma(_812, _666, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _836 = fma(_816, _666, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _842 = fma(_818, _672, _820);
    float _844 = fma(_830, _654, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _846 = fma(_834, _654, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _848 = fma(_840, _654, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _850 = fma(_826, _672, _822);
    float _852 = fma(_836, _672, _824);
    float _854 = fma(_844, _652, _842);
    float _856 = fma(_846, _652, _850);
    float _858 = fma(_848, _652, _852);
    float _860 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[113].x, _854);
    float _862 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[113].y, _856);
    float _864 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[113].z, _858);
    bool _866 = !_636;
    float _882;
    if (!_866)
    {
        float _868 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _870 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _872 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _874 = _872 * _868;
        float _876 = floor(_874);
        float _878 = -_876;
        float _880 = _874 + _878;
        _882 = _880;
        _884 = true;
    }
    else
    {
        float _886 = float(_104);
        float _888 = 1.0 / _886;
        float _890 = _138 * _888;
        _882 = _890;
    }
    _884 = false;
    float _892 = _882;
    bool _894 = _892 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _896 = isnan(_892);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _910 = _892 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _912 = isnan(_892);
    bool _914 = _910 || _912;
    bool _916 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _918 = _914 || _916;
    float _920 = float(_918);
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _922;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _928 = _892 + _926;
    float _930 = -_904;
    float _932 = _930 + 1.0;
    bool _934 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _936 = 1.0 / _908;
    float _938 = _920 * _932;
    float _940 = -_920;
    float _942 = _940 + 1.0;
    float _944 = _924 * _936;
    float _946 = _864 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _948 = fma(_944, _928, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _950 = _862 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _952 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _954 = _948 * _938;
    float _956 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[115].x, _954);
    float _960 = _860 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _962 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[116].x, _958);
    float _964 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _966 = _962 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _964;
    out.m_55.y = _956;
    out.m_55.z = _952;
    out.m_55.w = _966;
    bool _968 = !_934;
    bool _970 = _934;
    float _986;
    if (!_968)
    {
        float _972 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _974 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[11].z, _138);
        float _978 = _976 * _972;
        float _980 = floor(_978);
        float _982 = -_980;
        float _984 = _978 + _982;
        _986 = _984;
        _988 = true;
    }
    else
    {
        float _990 = float(_104);
        float _992 = 1.0 / _990;
        float _994 = _138 * _992;
        _986 = _994;
    }
    _988 = false;
    float _996 = _986;
    float _998 = in.m_44.x;
    float _1000 = in.m_44.y;
    float _1002 = in.m_44.z;
    float _1004 = _160 * 2.0;
    float _1006 = in.m_57.x;
    float _1008 = in.m_57.y;
    float _1010 = in.m_57.z;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1014 = _1012 != 0;
    float _1016 = floor(_1004);
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1020 = _1018 != 0;
    float _1022 = in.m_51.w;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1024;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1030 = _996 + _1028;
    float _1032 = in.m_59.x;
    float _1034 = in.m_59.y;
    float _1036 = in.m_59.z;
    int _1038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1040 = _1038 != 0;
    float _1042 = 1.0 / _1026;
    int _1044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1046 = _1044 != 0;
    float _1048 = in.m_61.x;
    float _1050 = in.m_61.y;
    float _1052 = in.m_61.z;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1056 = _996 + _1054;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1060 = _996 + _1058;
    float _1062 = in.m_63.x;
    int _1064 = as_type<int>(_1004);
    if (_1020)
    {
        bool _1066 = _160 > 0.5;
        _970 = _1066;
    }
    bool _1068 = _970;
    float _1070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1072;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[112].z;
    if (_1014)
    {
        float _1078 = in.m_51.z;
        _1076 = _1078;
    }
    float _1080 = _1076;
    float _1082 = _1000 * _1008;
    float _1084 = in.m_65.x;
    float _1086 = in.m_65.y;
    bool _1088 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1090 = isnan(_996);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1096 = _1092 || _1094;
    float _1098 = float(_1096);
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1100;
    bool _1104 = _1022 > 0.5;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1106;
    float _1110 = _1000 * _1034;
    float _1112 = _1000 * _1050;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1118 = fma(_998, _1006, _1082);
    float _1120 = fma(_998, _1032, _1110);
    float _1122 = in.m_51.z;
    float _1124 = 1.0 / _1074;
    float _1126 = _1050;
    float _1128 = _1048;
    if (_1020)
    {
        float _1130 = -_1062;
        float _1132 = _1130 + 1.0;
        _1064 = as_type<int>(_1132);
    }
    int _1134 = _1064;
    int _1136 = _1134;
    if (!_1020)
    {
        _1126 = _1062;
    }
    float _1138 = _1126;
    float _1140 = in.m_51.y;
    float _1142 = _1138;
    if (_1014)
    {
        bool _1144 = _1080 > 0.5;
        _252 = _1144;
    }
    bool _1146 = _252;
    float _1148 = fma(_998, _1048, _1112);
    if (_1020)
    {
        float _1150 = _1068 ? as_type<float>(_1134) : _1062;
        _1142 = _1150;
    }
    float _1152 = _1142;
    if (_1014)
    {
        float _1154 = -_1062;
        float _1156 = _1154 + 1.0;
        _1136 = as_type<int>(_1156);
    }
    int _1158 = _1136;
    float _1160 = in.m_63.y;
    if (!_1014)
    {
        _1128 = _1062;
    }
    float _1162 = _1128;
    float _1164 = 1.0 / _1116;
    float _1166 = _1162;
    if (_1014)
    {
        float _1168 = _1146 ? as_type<float>(_1158) : _1062;
        _1166 = _1168;
    }
    float _1170 = _1166;
    float _1172 = fma(_1002, _1010, _1118);
    float _1174 = abs(_1084);
    float _1176 = abs(_1086);
    float _1178 = precise::max(_1174, _1176);
    float _1180 = fma(_1002, _1052, _1148);
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1184 = _1182 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1186 = _1016 > 0.0;
    float _1188 = _1030 * _1124;
    bool _1190 = _1016 >= 0.0;
    bool _1192 = isnan(_1016);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan(0.0);
    bool _1198 = _1194 || _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1202 = _1200 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1204 = _1178 >= 16.0;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1206;
    float _1210 = _1122 * 2.0;
    float _1212 = fma(_1002, _1036, _1120);
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1216 = _996 + _1214;
    float _1218 = 1.0 / _1184;
    float _1220 = _1140 * 2.0;
    float _1222 = _160 + _1140;
    float _1224 = _1216 * _1042;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1228 = _996 + _1226;
    float _1230 = _1222 + (-1.0);
    float _1232 = -_1160;
    float _1234 = _1232 + 1.0;
    float _1236 = floor(_1210);
    float _1238 = _1140 + _1122;
    float _1240 = _1056 * _1164;
    float _1242 = _1238 + (-1.0);
    float _1244 = _1172 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1246;
    float _1250 = 1.0 / _1202;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1254 = _1252 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1256;
    float _1260 = fma(_1248, _1224, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1262 = _1212 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1264 = _1180 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1266 = fma(_1258, _1188, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1268 = floor(_1220);
    float _1270 = 1.0 / _1208;
    float _1272 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1274 = _1104 ? as_type<int>(_1234) : as_type<int>(_1160);
    float _1276 = _1228 * _1250;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1280 = _996 + _1278;
    bool _1282 = _1140 > 0.5;
    float _1284 = _1040 ? as_type<float>(_1274) : _1160;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1286;
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1292 = _1290 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1294 = _1160;
    if (_1046)
    {
        float _1296 = _1282 ? _1234 : _1160;
        _1294 = _1296;
    }
    float _1298 = _1294;
    float _1300 = fma(_1288, _1224, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1302 = _1236 > 0.0;
    float _1304 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1306 = _1280 * _1218;
    bool _1308 = _1236 >= 0.0;
    bool _1310 = isnan(_1236);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan(0.0);
    bool _1316 = _1312 || _1314;
    float _1318 = fma(_1292, _1240, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1320 = _1268 > 0.0;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1322;
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1328 = _1326 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _1330 = _1268 >= 0.0;
    bool _1332 = isnan(_1268);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan(0.0);
    bool _1338 = _1334 || _1336;
    float _1340 = _1060 * _1270;
    float _1342 = fma(_1324, _1224, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1344 = fma(_1328, _1240, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1346 = fma(_1254, _1240, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1348 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1350 = isnan(_996);
    bool _1352 = _1348 || _1350;
    bool _1354 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1356 = _1352 || _1354;
    float _1358 = float(_1356);
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1360;
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1366 = _1364 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1368;
    bool _1372 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1374 = isnan(_996);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1380 = _1376 || _1378;
    float _1382 = float(_1380);
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1386 = _1384 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1388 = -_1358;
    float _1390 = _1388 + 1.0;
    float _1392 = fma(_1362, _1188, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1394 = fma(_1370, _1188, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1396 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1398 = _1396 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1400 = fma(_1366, _1276, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1402 = _1382 * _1390;
    bool _1404 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1406 = isnan(_996);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1412 = _1408 || _1410;
    float _1414 = float(_1412);
    float _1416 = fma(_1398, _1276, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    bool _1418 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1420 = isnan(_996);
    bool _1422 = _1418 || _1420;
    bool _1424 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1426 = _1422 || _1424;
    float _1428 = float(_1426);
    float _1430 = fma(_1386, _1276, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1432 = -_1382;
    float _1434 = _1432 + 1.0;
    bool _1436 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1438 = isnan(_996);
    bool _1440 = _1436 || _1438;
    bool _1442 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1444 = _1440 || _1442;
    float _1446 = float(_1444);
    float _1448 = -_1414;
    float _1450 = _1448 + 1.0;
    float _1452 = -_1428;
    float _1454 = _1452 + 1.0;
    bool _1456 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1458 = isnan(_996);
    bool _1460 = _1456 || _1458;
    bool _1462 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1464 = _1460 || _1462;
    float _1466 = float(_1464);
    float _1468 = _1414 * _1434;
    float _1470 = _1428 * _1450;
    float _1472 = _1446 * _1454;
    float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1474;
    float _1478 = -_1446;
    float _1480 = _1478 + 1.0;
    float _1482 = -_1466;
    float _1484 = _1482 + 1.0;
    float _1486 = fma(_1102, _1340, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1488 = fma(_1476, _1340, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1490 = _1466 * _1480;
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1494 = _1492 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1498 = _1098 * _1484;
    float _1500 = fma(_1108, _1340, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1504 = _1502 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1508 = _1506 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    int _1510 = _1198 ? 0 : 1;
    float _1512 = _1260 * _1498;
    float _1514 = fma(_1504, _1306, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1516 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1518 = fma(_1508, _1306, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1520 = fma(_1494, _1306, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    int _1522 = _1338 ? 0 : 1;
    float _1524 = _1300 * _1498;
    int _1526 = ~_1510;
    int _1528 = _1526 + 1;
    int _1530 = _1528 + 1;
    float _1532 = _1342 * _1498;
    int _1534 = _1530;
    bool _1536 = _1302;
    float _1538 = _1488;
    if (!_1186)
    {
        int _1540 = ~_1510;
        int _1542 = _1540 + 1;
        _1534 = _1542;
    }
    int _1544 = _1534;
    float _1546 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1548 = _1316 ? 0 : 1;
    float _1550 = -_1098;
    float _1552 = _1550 + 1.0;
    int _1554 = ~_1522;
    int _1556 = _1554 + 1;
    int _1558 = _1556 + 1;
    float _1560 = _1284 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1562 = _1558;
    if (!_1320)
    {
        int _1564 = ~_1522;
        int _1566 = _1564 + 1;
        _1562 = _1566;
    }
    int _1568 = _1562;
    float _1570 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1572 = ~_1548;
    int _1574 = _1572 + 1;
    int _1576 = _1574 + 1;
    float _1578 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1532);
    int _1580 = _1576;
    if (!_1302)
    {
        int _1582 = ~_1548;
        int _1584 = _1582 + 1;
        _1580 = _1584;
    }
    int _1586 = _1580;
    float _1588 = _1152 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1590 = _1570 * _1496;
    float _1592 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1594 = fma(_1344, _1490, _1578);
    float _1596 = _1588 * _1070;
    float _1598 = _1086 * 0.0625;
    float _1600 = _1592 * _1516;
    float _1602 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1604 = _1244 + _1602;
    float _1606 = _1560 * _1546;
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1610 = _1262 + _1608;
    float _1612 = _1084 * 0.0625;
    float _1614 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1616 = _1204 ? _1598 : _1086;
    float _1618 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1524);
    float _1620 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1622 = _1264 + _1620;
    float _1624 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1614);
    float _1626 = _1604 * _1604;
    float _1628 = _1204 ? _1612 : _1084;
    float _1630 = fma(_1318, _1490, _1618);
    float _1632 = abs(_1616);
    bool _1634 = _1632 != 0.0;
    bool _1636 = isnan(_1632);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan(0.0);
    bool _1642 = _1638 || _1640;
    float _1644 = fma(_1610, _1610, _1626);
    float _1646 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1624);
    float _1648 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1512);
    float _1650 = abs(_1628);
    bool _1652 = _1650 == 0.0;
    bool _1654 = !_1642;
    bool _1656 = _1652 && _1654;
    float _1658 = fma(_1622, _1622, _1644);
    float _1660 = abs(_1628);
    bool _1662 = _1660 == 0.0;
    float _1664 = fma(_1346, _1490, _1648);
    bool _1666 = _1646 >= 0.0;
    float _1668 = fma(_1392, _1472, _1594);
    float _1670 = fma(_1266, _1472, _1630);
    float _1672 = rsqrt(_1658);
    float _1674 = fma(_1394, _1472, _1664);
    out.m_67.x = _1596;
    out.m_67.y = _1590;
    out.m_67.z = _1600;
    out.m_67.w = _1606;
    float _1676 = fma(_1416, _1470, _1668);
    float _1678 = fma(_1400, _1470, _1670);
    float _1680 = fma(_1430, _1470, _1674);
    int _1682 = as_type<int>(_1606);
    int _1684 = as_type<int>(_1600);
    if (_1656)
    {
        bool _1686 = as_type<int>(_1628) >= 0;
        _1536 = _1686;
    }
    bool _1688 = _1536;
    float _1690 = fma(_1488, _1468, _1676);
    float _1692 = fma(_1486, _1468, _1678);
    float _1694 = fma(_1500, _1468, _1680);
    int _1696 = _1688 ? (-1) : 0;
    if (_1666)
    {
        _1538 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1698 = _1538;
    if (_1656)
    {
        int _1700 = _1688 ? 0 : 1078530011;
        _1682 = _1700;
    }
    int _1702 = _1682;
    int _1704 = _1702;
    if (_1656)
    {
        int _1706 = int(0x80000000) & as_type<int>(_1616);
        int _1708 = _1702 | _1706;
        _1704 = _1708;
    }
    int _1710 = _1704;
    bool _1712 = !_1642;
    bool _1714 = _1712 && _1662;
    int _1716 = _1710;
    float _1718 = as_type<float>(_1710);
    if (!_1714)
    {
        float _1720 = abs(_1616);
        bool _1722 = _1720 != as_type<float>(0x7f800000u /* inf */);
        bool _1724 = isnan(_1720);
        bool _1726 = _1722 || _1724;
        bool _1728 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1730 = _1726 || _1728;
        float _1732 = abs(_1628);
        bool _1734 = _1732 == as_type<float>(0x7f800000u /* inf */);
        float _1736 = abs(_1628);
        bool _1738 = _1736 == as_type<float>(0x7f800000u /* inf */);
        bool _1740 = !_1730;
        bool _1742 = _1738 && _1740;
        if (_1742)
        {
            bool _1744 = as_type<int>(_1628) >= 0;
            _1696 = _1744 ? (-1) : 0;
        }
        int _1746 = _1696;
        if (_1742)
        {
            _1716 = 1075235812;
        }
        int _1748 = _1716;
        int _1750 = _1748;
        if (_1742)
        {
            int _1752 = ~_1746;
            int _1754 = (_1752 != 0) ? _1748 : 1061752795;
            _1750 = _1754;
        }
        int _1756 = _1750;
        float _1758 = as_type<float>(_1756);
        if (_1742)
        {
            int _1760 = int(0x80000000) & as_type<int>(_1616);
            int _1762 = _1756 | _1760;
            _1758 = as_type<float>(_1762);
        }
        float _1764 = _1758;
        bool _1766 = !_1730;
        bool _1768 = _1766 && _1734;
        _1718 = _1764;
        if (!_1768)
        {
            float _1770 = abs(_1616);
            float _1772 = abs(_1628);
            float _1774 = precise::max(_1770, _1772);
            float _1776 = abs(_1616);
            float _1778 = abs(_1628);
            float _1780 = precise::min(_1776, _1778);
            float _1782 = 1.0 / _1774;
            float _1784 = abs(_1616);
            float _1786 = abs(_1628);
            bool _1788 = _1784 > _1786;
            bool _1790 = as_type<int>(_1628) >= 0;
            float _1792 = _1780 * _1782;
            float _1794 = _1792 * _1792;
            float _1796 = _1794 + 11.33538818359375;
            float _1798 = fma(_1794, _1796, 28.84246826171875);
            float _1800 = fma(_1794, _1798, 19.6966705322265625);
            float _1802 = fma(_1794, -0.82336294651031494140625, -5.674867153167724609375);
            float _1804 = fma(_1794, _1802, -6.565555095672607421875);
            float _1806 = 1.0 / _1800;
            float _1808 = _1794 * _1804;
            float _1810 = abs(_1616);
            float _1812 = abs(_1628);
            float _1814 = _1810 + _1812;
            int _1816 = as_type<int>(_1616) & int(0x80000000);
            float _1818 = _1792 * _1808;
            bool _1820 = _1814 > as_type<float>(0x7f800000u /* inf */);
            bool _1822 = isnan(_1814);
            bool _1824 = _1820 || _1822;
            bool _1826 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1828 = _1824 || _1826;
            float _1830 = fma(_1818, _1806, _1792);
            float _1832 = _1830;
            _1684 = as_type<int>(_1818);
            _1718 = _1814;
            if (_1788)
            {
                float _1834 = -_1830;
                float _1836 = _1834 + 1.57079637050628662109375;
                _1832 = _1836;
            }
            float _1838 = _1832;
            int _1840 = as_type<int>(_1838);
            if (!_1790)
            {
                float _1842 = -_1838;
                float _1844 = _1842 + 3.1415927410125732421875;
                _1840 = as_type<int>(_1844);
            }
            int _1846 = _1840;
            if (!_1828)
            {
                int _1848 = _1816 | _1846;
                _1718 = as_type<float>(_1848);
            }
        }
    }
    int _1850 = _1684;
    float _1852 = _1718;
    float _1854 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1856 = log2(_1854);
    int _1858 = _1850;
    if (_1666)
    {
        float _1860 = _1698 * 5.0;
        _1858 = as_type<int>(_1860);
    }
    int _1862 = _1858;
    int _1864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1866 = _1864 != 0;
    int _1868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1870 = _1868 != 0;
    int _1872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1874 = _1872 != 0;
    float _1876 = fma(_1518, _1402, _1692);
    float _1878 = float(_1544);
    float _1880 = fma(_1520, _1402, _1694);
    if (_1666)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5975 = as_type<float>(_1862);
        out.gl_Position.z = _5975;
    }
    float _1882 = precise::max(_1852, -3.1415927410125732421875);
    float _1884 = fma(_1358, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1876);
    float _1886 = fma(_1358, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1880);
    float _1888 = precise::min(_1882, 3.1415927410125732421875);
    float _1890 = _1604 * _1672;
    float _1892 = float(_1586);
    float _1894 = fma(_1514, _1402, _1690);
    float _1896 = _1856 * _138;
    float _1898 = fma(_1888, 0.15915493667125701904296875, 0.5);
    float _1900 = _1610 * _1672;
    bool _1902 = !_1870;
    int _1904 = _1902 ? 0 : 1;
    float _1906 = -_1890;
    float _1908 = fma(_1906, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1604);
    float _1910 = exp2(_1896);
    bool _1912 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1914 = isnan(0.0);
    bool _1916 = _1912 || _1914;
    bool _1918 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1920 = _1916 || _1918;
    float _1922 = fma(_1358, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1894);
    int _1924 = abs(_1904);
    float _1926 = -_1900;
    float _1928 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1610);
    bool _1930 = !_1866;
    int _1932 = _1930 ? 0 : 1;
    float _1934 = _1908 * _1908;
    float _1936 = float(_1924);
    float _1938 = _1622 * _1672;
    int _1940 = abs(_1932);
    float _1942 = fma(_1928, _1928, _1934);
    float _1944 = in.m_69.x;
    float _1946 = in.m_69.y;
    float _1948 = in.m_69.z;
    float _1950 = _1936 * _1878;
    float _1952 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1954 = 1.0 + _1952;
    float _1956 = -_1938;
    float _1958 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1622);
    float _1960 = -_1910;
    float _1962 = _1960 + 1.0;
    float _1964 = float(_1940);
    float _1966 = _160 + (-0.5);
    bool _1968 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1970 = isnan(1.0);
    bool _1972 = _1968 || _1970;
    bool _1974 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1976 = _1972 || _1974;
    float _1978 = 1.0 / _1954;
    float _1980 = _1920 ? _1962 : 0.0;
    float _1982 = _1964 * _1892;
    float _1984 = _1884 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1986 = _1922 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1988 = _1886 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1990 = _1982 * (-2.0);
    float _1992 = fma(_1958, _1958, _1942);
    float _1994 = _1986 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1996 = _1984 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1998 = _1988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2000 = fma(_138, 0.06666667759418487548828125, _1898);
    float _2002 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2004 = fma(_1304, _1990, _1304);
    float _2006 = fma(_1990, _1944, _1944);
    if (_1976)
    {
        float _2008 = _1980 * _1978;
        _140 = _2008;
    }
    float _2010 = _140;
    float _2012 = _1950 * (-2.0);
    out.m_71.x = _1994;
    out.m_71.y = _1996;
    out.m_71.z = _1998;
    out.m_71.w = _2002;
    float _2014 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2006);
    float _2016 = _2000 * 6.283185482025146484375;
    float _2018 = sqrt(_1992);
    if (_1666)
    {
        out.m_47.x = 0.0;
    }
    float _2020 = fma(_1272, _2012, _1272);
    float _2022 = fma(_2012, _1946, _1946);
    float _2024 = fma(_2004, _2010, _2014);
    float _2026 = _1140 + (-0.5);
    float _2028 = float(_1568);
    bool _2030 = !_1874;
    int _2032 = _2030 ? 0 : 1;
    if (_1666)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2034 = -_1890;
    float _2036 = fma(_2034, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1244);
    float _2038 = -_1900;
    float _2040 = fma(_2038, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1262);
    int _2042 = abs(_2032);
    float _2044 = -_1938;
    float _2046 = fma(_2044, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1264);
    float _2048 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2050 = _2036 + _2048;
    float _2052 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2054 = _2040 + _2052;
    float _2056 = _160 + _1122;
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2060 = _2046 + _2058;
    float _2062 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2064 = _1122 + (-0.5);
    float _2066 = _2056 + (-1.0);
    float _2068 = fma(_2026, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2022);
    float _2070 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2062);
    float _2072 = float(_2042);
    float _2074 = in.m_65.z;
    float _2076 = fma(_2020, _2010, _2068);
    float _2078 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2070);
    float _2080 = _2016 * 0.15915493667125701904296875;
    float _2082 = _2072 * _2028;
    float _2084 = _2024 * 0.15915493667125701904296875;
    bool _2086 = _2078 >= 0.0;
    float _2088 = _2082 * (-2.0);
    float _2090 = _2080 * 6.283185482025146484375;
    float _2092 = sin(_2090);
    float _2094 = fma(_2088, _1948, _1948);
    float _2096 = fma(_2066, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2098 = _2076 * 0.15915493667125701904296875;
    float _2100 = fma(_2064, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2094);
    float _2102 = fma(_2096, _2088, _2096);
    float _2104 = _2084 * 6.283185482025146484375;
    float _2106 = sin(_2104);
    float _2108 = as_type<float>(_2042);
    int _2110 = as_type<int>(_2100);
    if (_2086)
    {
        _2108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2112 = _2108;
    if (_2086)
    {
        out.m_47.x = 0.0;
    }
    float _2114 = fma(_2102, _2010, _2100);
    if (_2086)
    {
        float _2116 = _2112 * 5.0;
        _2110 = as_type<int>(_2116);
    }
    int _2118 = _2110;
    float _2120 = _2114 * 0.15915493667125701904296875;
    float _2122 = _2084 * 6.283185482025146484375;
    float _2124 = cos(_2122);
    if (_2086)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6376 = as_type<float>(_2118);
        out.gl_Position.z = _6376;
    }
    float _2126 = _2098 * 6.283185482025146484375;
    float _2128 = sin(_2126);
    float _2130 = _2098 * 6.283185482025146484375;
    float _2132 = cos(_2130);
    float _2134 = _2120 * 6.283185482025146484375;
    float _2136 = sin(_2134);
    if (_2086)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2138 = _2120 * 6.283185482025146484375;
    float _2140 = cos(_2138);
    float _2142 = fma(_2092, 0.5, 1.5);
    float _2144 = _1672 * _2018;
    float _2146 = _2106 * _2128;
    float _2148 = _2124 * _2132;
    float _2150 = _2142 * _1086;
    float _2152 = _592 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2154 = _2142 * _1084;
    float _2156 = _2142 * _2074;
    float _2158 = _2106 * _2132;
    float _2160 = fma(_2136, _2148, _2146);
    float _2162 = _634 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2164 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2150);
    float _2166 = _2144 * _2152;
    float _2168 = fma(_2136, _2146, _2148);
    float _2170 = _2124 * _2128;
    float _2172 = _2124 * _2140;
    float _2174 = _2132 * _2140;
    float _2176 = _2106 * _2140;
    float _2178 = _2128 * _2140;
    float _2180 = _582 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2182 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2154);
    float _2184 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2156);
    float _2186 = _2144 * _2162;
    float _2188 = _2144 * _2180;
    float _2190 = _2164 * _2166;
    float _2192 = -_2170;
    float _2194 = fma(_2136, _2158, _2192);
    float _2196 = -_2158;
    float _2198 = fma(_2136, _2170, _2196);
    float _2200 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2202 = _2182 * _2186;
    float _2204 = _2184 * _2188;
    float _2206 = _2172 * _2190;
    float _2208 = _2172 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2210 = _2172 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2212 = _2172 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2214 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2216 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2218 = _2176 * _2190;
    float _2220 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2200);
    float _2222 = -_2190;
    float _2224 = _2136 * _2222;
    float _2226 = fma(_2160, _2202, _2206);
    float _2228 = -_2136;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2208);
    float _2232 = -_2136;
    float _2234 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2210);
    float _2236 = -_2136;
    float _2238 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2212);
    float _2240 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2214);
    float _2242 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2216);
    float _2244 = fma(_2194, _2202, _2218);
    float _2246 = fma(_2174, _2202, _2224);
    float _2248 = fma(_2198, _2204, _2226);
    float _2250 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2220);
    float _2252 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2240);
    float _2254 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2242);
    float _2256 = fma(_2168, _2204, _2244);
    float _2258 = _2198 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2260 = _2198 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2262 = _2198 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2264 = fma(_2178, _2204, _2246);
    float _2266 = _2248 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2268 = _2248 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2270 = in.m_73.x;
    float _2272 = in.m_73.y;
    float _2274 = in.m_73.z;
    float _2276 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2234);
    float _2278 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2266);
    float _2280 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2268);
    float _2282 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2230);
    float _2284 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2258);
    float _2286 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2278);
    float _2288 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2280);
    float _2290 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2260);
    float _2292 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2262);
    float _2294 = _2286 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2296 = _2288 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2298 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2238);
    bool _2300 = _2150 != 0.0;
    bool _2302 = isnan(_2150);
    bool _2304 = _2300 || _2302;
    bool _2306 = isnan(0.0);
    bool _2308 = _2304 || _2306;
    float _2310 = _1262 + _2294;
    float _2312 = _1264 + _2296;
    float _2314 = in.m_75.x;
    float _2316 = in.m_75.y;
    float _2318 = in.m_75.z;
    float _2320 = in.m_75.w;
    bool _2322 = _2154 == 0.0;
    bool _2324 = !_2308;
    bool _2326 = _2322 && _2324;
    float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2330 = _2310 + _2328;
    float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2334 = _2312 + _2332;
    float _2336 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2284);
    bool _2338 = _2156 == 0.0;
    bool _2340 = _2338 && _2326;
    float _2342 = _2330 * _2330;
    float _2344 = _2334 * _2334;
    float _2346 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2290);
    float _2348 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2292);
    float _2350 = _2342 + _2344;
    float _2352 = sqrt(_2350);
    float _2354 = _2294;
    float _2356 = _2220;
    float _2358 = _2230;
    float _2360 = _2342;
    float _2362 = _2344;
    float _2364 = _2310;
    float _2366 = _2312;
    float _2368 = _2144;
    if (_2340)
    {
        _2354 = _2272;
    }
    float _2370 = _2354;
    float _2372 = _2370;
    if (!_2340)
    {
        float _2374 = fma(_2150, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2272);
        _2372 = _2374;
    }
    float _2376 = _2372;
    if (_2340)
    {
        _2356 = _2270;
    }
    float _2378 = _2356;
    float _2380 = _2378;
    if (!_2340)
    {
        float _2382 = fma(_2154, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2270);
        _2380 = _2382;
    }
    float _2384 = _2380;
    float _2386 = _2248 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_2340)
    {
        _2358 = _2274;
    }
    float _2388 = _2358;
    float _2390 = _2282 * _2316;
    float _2392 = _2388;
    float _2394 = _2320;
    if (!_2340)
    {
        float _2396 = fma(_2156, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2274);
        _2392 = _2396;
    }
    float _2398 = _2392;
    float _2400 = _2276 * _2316;
    float _2402 = _2298 * _2316;
    float _2404 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2386);
    float _2406 = fma(_2250, _2314, _2390);
    float _2408 = _2314 * _2272;
    float _2410 = _2318 * _2270;
    float _2412 = _2316 * _2274;
    bool _2414 = _2352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2416 = fma(_2252, _2314, _2400);
    float _2418 = fma(_2254, _2314, _2402);
    float _2420 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2404);
    float _2422 = -_2408;
    float _2424 = fma(_2316, _2270, _2422);
    float _2426 = -_2410;
    float _2428 = fma(_2314, _2274, _2426);
    float _2430 = -_2412;
    float _2432 = fma(_2318, _2272, _2430);
    float _2434 = fma(_2336, _2318, _2406);
    float _2436 = fma(_2346, _2318, _2416);
    float _2438 = fma(_2348, _2318, _2418);
    float _2440 = _2420 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2442 = _2428 * _2320;
    float _2444 = _2432 * _2320;
    float _2446 = _2424 * _2320;
    float _2448 = _1244 + _2440;
    float _2450 = _2444;
    if (!_2414)
    {
        _2394 = _2448;
    }
    float _2452 = _2394;
    bool _2454 = !_2414;
    float _2456 = _2452;
    if (!_2454)
    {
        float _2458 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2462 = _2352 + _2460;
        float _2464 = _2448 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2466 = rsqrt(_2350);
        float _2468 = _2462 * _2458;
        float _2470 = _2468 * 0.15915493667125701904296875;
        float _2472 = _2470 * 6.283185482025146484375;
        float _2474 = sin(_2472);
        float _2476 = _2470 * 6.283185482025146484375;
        float _2478 = cos(_2476);
        float _2480 = fma(_2474, _2464, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2482 = _2466 * _2480;
        float _2484 = fma(_2330, _2482, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2486 = _2478 + (-1.0);
        float _2488 = fma(_2334, _2482, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2490 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2492 = _2484 + _2490;
        float _2494 = _2486 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2498 = _2488 + _2496;
        float _2500 = _2492 * _2492;
        float _2502 = fma(_2448, _2478, _2494);
        float _2504 = _2498 * _2498;
        _2456 = _2502;
        _2360 = _2500;
        _2362 = _2504;
        _2364 = _2484;
        _2366 = _2488;
    }
    float _2506 = _2456;
    float _2508 = _2360;
    float _2510 = _2362;
    float _2512 = _2364;
    float _2514 = _2366;
    float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2518 = _2506 + _2516;
    float _2520 = _2276 * _2376;
    float _2522 = _2298 * _2376;
    float _2524 = _2442 * _2282;
    float _2526 = fma(_2518, _2518, _2508);
    float _2528 = _2442 * _2276;
    float _2530 = _2282 * _2376;
    float _2532 = _2442 * _2298;
    float _2534 = _2526 + _2510;
    float _2536 = fma(_2252, _2384, _2520);
    float _2538 = fma(_2254, _2384, _2522);
    float _2540 = fma(_2444, _2250, _2524);
    float _2542 = fma(_2444, _2252, _2528);
    float _2544 = fma(_2250, _2384, _2530);
    float _2546 = sqrt(_2534);
    float _2548 = fma(_2444, _2254, _2532);
    float _2550 = fma(_2346, _2398, _2536);
    float _2552 = fma(_2446, _2336, _2540);
    float _2554 = fma(_2446, _2346, _2542);
    float _2556 = fma(_2336, _2398, _2544);
    float _2558 = fma(_2348, _2398, _2538);
    float _2560 = fma(_2446, _2348, _2548);
    out.m_77.x = _2434;
    out.m_77.y = _2436;
    out.m_77.z = _2438;
    out.m_79.x = _2556;
    out.m_79.y = _2550;
    out.m_79.z = _2558;
    out.m_81.x = _2552;
    out.m_81.y = _2554;
    out.m_81.z = _2560;
    bool _2562 = _2546 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2564 = isnan(_2546);
    bool _2566 = _2562 || _2564;
    bool _2568 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2570 = _2566 || _2568;
    if (!_2570)
    {
        _2450 = 1.0;
    }
    float _2572 = _2450;
    bool _2574 = !_2570;
    float _2576 = _2572;
    if (!_2574)
    {
        bool _2578 = _2546 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2580 = isnan(_2546);
        bool _2582 = _2578 || _2580;
        bool _2584 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2586 = _2582 || _2584;
        if (!_2586)
        {
            float _2588 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2590 = _2546 + _2588;
            float _2592 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2594 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2592;
            float _2596 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2598 = _2596 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2600 = 1.0 / _2594;
            float _2602 = _2590 * _2600;
            float _2604 = fma(_2602, _2598, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2576 = _2604;
            _2606 = true;
        }
        else
        {
            bool _2608 = _2546 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2610 = isnan(_2546);
            bool _2612 = _2608 || _2610;
            bool _2614 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2616 = _2612 || _2614;
            if (!_2616)
            {
                float _2618 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2620 = _2546 + _2618;
                float _2622 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2624 = _2622 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2626 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2628 = _2626 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2630 = 1.0 / _2624;
                float _2632 = _2620 * _2630;
                float _2634 = fma(_2632, _2628, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2576 = _2634;
                _2606 = true;
            }
            else
            {
                _2576 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2606 = false;
    float _2636 = _2576;
    float _2638 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2640 = _2512 + _2638;
    float _2642 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2644 = _2506 + _2642;
    bool _2646 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2648 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2650 = _2646 || _2648;
    bool _2652 = isnan(0.5);
    bool _2654 = _2650 || _2652;
    float _2656 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2658 = _2514 + _2656;
    float _2660 = fma(_2640, _2636, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2662 = fma(_2644, _2636, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2664 = fma(_2658, _2636, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2666 = -_1900;
    float _2668 = fma(_2666, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2660);
    float _2670 = -_1890;
    float _2672 = fma(_2670, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2662);
    float _2674 = -_1938;
    float _2676 = fma(_2674, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2664);
    float _2678 = _2672;
    float _2680 = _2668;
    float _2682 = _2676;
    float _2684 = _2662;
    if (!_2654)
    {
        float _2686 = _2050 * _2050;
        float _2688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2690 = -_1262;
        float _2692 = _2690 + _2660;
        float _2694 = -_1244;
        float _2696 = _2694 + _2662;
        float _2698 = fma(_2054, _2054, _2686);
        float _2700 = -_1264;
        float _2702 = _2700 + _2664;
        float _2704 = fma(_2060, _2060, _2698);
        float _2706 = 1.0 / _2144;
        float _2708 = sqrt(_2704);
        float _2710 = precise::min(_2708, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2712 = _2710 * _2688;
        float _2714 = _2712 * _2706;
        float _2716 = fma(_2692, _2714, _2040);
        float _2718 = fma(_2696, _2714, _2036);
        float _2720 = fma(_2702, _2714, _2046);
        _2678 = _2718;
        _2680 = _2716;
        _2682 = _2720;
    }
    float _2722 = _2678;
    float _2724 = _2680;
    float _2726 = _2682;
    float _2728 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2730 = _2722 + _2728;
    float _2732 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2734 = _2724 + _2732;
    float _2736 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2738 = _2726 + _2736;
    float _2740 = _2730 * _2730;
    float _2742 = fma(_2734, _2734, _2740);
    float _2744 = fma(_2738, _2738, _2742);
    float _2746 = rsqrt(_2744);
    float _2748 = sqrt(_2744);
    float _2750 = _2746 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2752 = _2734 * _2750;
    float _2754 = _2738 * _2750;
    float _2756 = _2752 * _2752;
    float _2758 = _2754 * _2754;
    float _2760 = _2756 + _2758;
    float _2762 = sqrt(_2760);
    bool _2764 = _2762 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2766 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2768 = _2762 + _2766;
    float _2770 = _2738;
    float _2772 = _2746;
    float _2774 = _2768;
    float _2776 = _2730;
    float _2778 = _2752;
    if (_2764)
    {
        float _2780 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2770 = _2780;
    }
    float _2782 = _2770;
    if (_2764)
    {
        float _2784 = rsqrt(_2760);
        _2772 = _2784;
    }
    float _2786 = _2772;
    float _2788 = _2786;
    if (_2764)
    {
        float _2790 = _2768 * _2782;
        _2774 = _2790;
    }
    float _2792 = _2774;
    if (_2764)
    {
        float _2794 = _2792 * 0.15915493667125701904296875;
        _2684 = _2794;
    }
    float _2796 = _2684;
    float _2798 = _2782;
    float _2800 = _2796;
    if (_2764)
    {
        float _2802 = _2796 * 6.283185482025146484375;
        float _2804 = sin(_2802);
        _2798 = _2804;
    }
    float _2806 = _2798;
    float _2808 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2810 = precise::max(0.0, _2808);
    float _2812 = _2558;
    float _2814 = _2810;
    if (_2764)
    {
        float _2816 = _2796 * 6.283185482025146484375;
        float _2818 = cos(_2816);
        _2812 = _2818;
    }
    float _2820 = _2812;
    float _2822 = -_2750;
    float _2824 = -_2810;
    float _2826 = fma(_2730, _2822, _2824);
    if (!_2764)
    {
        _2776 = _2756;
    }
    float _2828 = _2776;
    float _2830 = _2828;
    if (_2764)
    {
        float _2832 = _2826 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2814 = _2832;
    }
    float _2834 = _2814;
    float _2836 = _2806;
    float _2838 = _2834;
    if (_2764)
    {
        float _2840 = fma(_2806, _2834, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2836 = _2840;
    }
    float _2842 = _2836;
    float _2844 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2846 = _2842;
    if (_2764)
    {
        float _2848 = _2820 + (-1.0);
        _2838 = _2848;
    }
    float _2850 = _2838;
    float _2852 = _2850;
    if (_2764)
    {
        float _2854 = _2786 * _2842;
        _2368 = _2854;
    }
    float _2856 = _2368;
    if (!_2764)
    {
        _2788 = _2826;
    }
    float _2858 = _2788;
    float _2860 = _2858;
    if (_2764)
    {
        float _2862 = _2850 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2800 = _2862;
    }
    float _2864 = _2800;
    if (_2764)
    {
        float _2866 = _2752 * _2856;
        _2778 = _2866;
    }
    float _2868 = _2778;
    if (!_2764)
    {
        _2846 = _2754;
    }
    float _2870 = _2846;
    float _2872 = _2870;
    if (_2764)
    {
        float _2874 = _2754 * _2856;
        _2872 = _2874;
    }
    float _2876 = _2872;
    if (_2764)
    {
        float _2878 = fma(_2826, _2820, _2864);
        _2860 = _2878;
    }
    float _2880 = _2860;
    if (_2764)
    {
        float _2882 = _2868 * _2868;
        _2830 = _2882;
    }
    float _2884 = _2830;
    if (!_2764)
    {
        _2852 = _2758;
    }
    float _2886 = _2852;
    float _2888 = _2886;
    if (_2764)
    {
        float _2890 = _2876 * _2876;
        _2888 = _2890;
    }
    float _2892 = _2888;
    float _2894 = fma(_2880, _2880, _2884);
    float _2896 = _2722 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2898 = _2894 + _2892;
    float _2900 = _2722 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2902 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2904 = fma(_2748, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2902);
    float _2906 = precise::clamp(_2904, 0.0, 1.0);
    float _2908 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2896);
    float _2910 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2900);
    float _2912 = _2722 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2914 = rsqrt(_2898);
    float _2916 = -_2906;
    float _2918 = _2916 + 1.0;
    float _2920 = fma(_2726, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2910);
    float _2922 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2912);
    float _2924 = _2722 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2926 = fma(_2726, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2908);
    float _2928 = _2920 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2930 = fma(_2726, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2922);
    float _2932 = abs(_2918);
    float _2934 = log2(_2932);
    float _2936 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2924);
    float _2938 = _2928 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2940 = _2930 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2942 = _2926 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2944 = fma(_2726, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2936);
    float _2946 = -_2938;
    float _2948 = fma(_2946, _2844, 1.0);
    float _2950 = _2940 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2952 = _2914 * _2868;
    float _2954 = _2944 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2956 = _2914 * _2880;
    float _2958 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2950);
    float _2960 = _2952 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2962 = _2914 * _2876;
    float _2964 = _2940 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2966 = fma(_2928, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2958);
    float _2968 = _2934 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2970 = -_2960;
    float _2972 = fma(_2956, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2970);
    float _2974 = log2(_2948);
    float _2976 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2966);
    float _2978 = _2940 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2980 = -_2962;
    float _2982 = fma(_2980, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2972);
    float _2984 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2964);
    float _2986 = _2956 + 1.0;
    float _2988 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2978);
    float _2990 = fma(_2982, -0.5, 0.5);
    float _2992 = exp2(_2968);
    float _2994 = fma(_2982, 0.5, 0.5);
    float _2996 = fma(_2928, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2984);
    float _2998 = fma(_2928, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2988);
    float _3000 = fma(_2994, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3002 = 1.0 / _2976;
    float _3004 = fma(_2994, _3000, -0.212114393711090087890625);
    float _3006 = _2974 * 0.693147182464599609375;
    float _3008 = fma(_2994, _3004, 1.570728778839111328125);
    float _3010 = _3006 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3012 = sqrt(_2990);
    float _3014 = -_2956;
    float _3016 = fma(_2992, _2986, _3014);
    float _3018 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2996);
    float _3020 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2998);
    float _3022 = fma(_3016, 0.5, 0.5);
    float _3024 = _3018 * _3002;
    float _3026 = _3020 * _3002;
    float _3028 = fma(_3024, 0.5, 0.5);
    float _3030 = fma(_3026, -0.5, 0.5);
    float _3032 = _3012 * 0.636619746685028076171875;
    float3 _7903 = float3(_3028, _3030, _3010);
    float _3034 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7903, float3(0.0), isnan(_7903)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7903, float3(0.0), isnan(_7903)), level(0.0)).x;
    float3 _7914 = float3(_3028, _3030, _3010);
    float4 _3037 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7914, float3(0.0), isnan(_7914)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7914, float3(0.0), isnan(_7914)), level(0.0)).xyzw;
    float _3039 = _3037.x;
    float _3041 = _3037.y;
    float _3043 = _3037.z;
    float _3045 = _3037.w;
    float _3047 = -_3008;
    float _3049 = fma(_3032, _3047, 1.0);
    float2 _7936 = float2(_3049, _3022);
    float3 _3053 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7936, float2(0.0), isnan(_7936)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7936, float2(0.0), isnan(_7936)), level(0.0)).xyz;
    float _3055 = _3053.x;
    float _3057 = _3053.y;
    float _3059 = _3053.z;
    float _3061 = _2934 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3063 = _2940 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3065 = _248 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3067 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3063);
    float _3069 = exp2(_3061);
    float _3071 = _3065 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3073 = fma(_2928, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3067);
    float _3075 = _3018 + _2976;
    float _3077 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3073);
    float _3079 = _3075 * 0.5;
    float _3081 = _2976 * 0.5;
    out.m_47.x = _3071;
    float _3083 = _3077 + _2976;
    out.gl_Position.x = _3018;
    out.gl_Position.y = _3020;
    out.gl_Position.z = _3077;
    out.gl_Position.w = _2976;
    float _3085 = -_3069;
    float _3087 = _3085 + 1.0;
    float _3089 = fma(_3020, -0.5, _3081);
    float _3091 = _3083 * 0.5;
    float _3093 = _3087 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _3079;
    out.m_83.y = _3089;
    out.m_83.z = _3091;
    out.m_83.w = _2976;
    float _3095 = _3093 * _3034;
    float _3097 = -_3093;
    float _3099 = _3097 + 1.0;
    float _3101 = _3045 * _3095;
    float _3103 = _3059 * _3095;
    float _3105 = fma(_3055, _3101, _3039);
    float _3107 = fma(_3057, _3101, _3041);
    float _3109 = _3045 * _3099;
    float _3111 = fma(_3045, _3103, _3043);
    out.m_85.x = _3105;
    out.m_85.y = _3107;
    out.m_85.z = _3111;
    out.m_85.w = _3109;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2606 = false;
    bool _988 = false;
    bool _884 = false;
    bool _490 = false;
    bool _270 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3168 = as_type<float>(_120);
        out.gl_Position.z = _3168;
    }
    if (!_108)
    {
        return out;
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = _138;
    if (_134)
    {
        float _142 = float(_104);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _138 >= _144;
    bool _148 = !_134;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3238 = as_type<float>(_158);
        out.gl_Position.z = _3238;
    }
    if (_150)
    {
        return out;
    }
    float _160 = in.m_51.x;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _138 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _168 = _166 != 0;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _172 = _170 != 0;
    int _174 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _176 = _174 != 0;
    float _178 = _164 * _162;
    float _180 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[20].x, _178);
    float _182 = _180 * 6.283185482025146484375;
    float _184 = floor(_180);
    float _186 = _182 * 0.15915493667125701904296875;
    bool _188 = !_168;
    int _190 = _188 ? 0 : 1;
    int _192 = abs(_190);
    float _194 = _186 * 6.283185482025146484375;
    float _196 = cos(_194);
    bool _198 = !_176;
    int _200 = _198 ? 0 : 1;
    bool _202 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _204 = abs(_200);
    float _206 = -_184;
    float _208 = _180 + _206;
    bool _210 = !_172;
    int _212 = _210 ? 0 : 1;
    int _214 = abs(_212);
    float _216 = -_208;
    float _218 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _220 = float(_192);
    float _222 = fma(_196, 0.5, 0.5);
    bool _224 = _208 < 0.5;
    float _226 = float(_224);
    float _228 = abs(_218);
    float _230 = _220 * _228;
    float _232 = -_222;
    float _234 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _236 = float(_204);
    float _238 = -_226;
    float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _242 = float(_214);
    float _244 = fma(_236, _234, _230);
    float _246 = abs(_240);
    float _248 = fma(_242, _246, _244);
    bool _250 = !_202;
    bool _252 = _172;
    float _268;
    if (!_250)
    {
        float _254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _256 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _258 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _260 = _258 * _254;
        float _262 = floor(_260);
        float _264 = -_262;
        float _266 = _260 + _264;
        _268 = _266;
        _270 = true;
    }
    else
    {
        float _272 = float(_104);
        float _274 = 1.0 / _272;
        float _276 = _138 * _274;
        _268 = _276;
    }
    _270 = false;
    float _278 = _268;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = _278 + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _286 = _278 + _284;
    bool _288 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _290 = isnan(_278);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = _278 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = 1.0 / _302;
    bool _318 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _320 = 1.0 / _314;
    float _322 = 1.0 / _310;
    float _324 = _282 * _316;
    bool _326 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _328 = isnan(_278);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -_298;
    float _340 = _338 + 1.0;
    float _342 = _336 * _340;
    float _344 = _286 * _320;
    bool _346 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _348 = isnan(_278);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _358;
    bool _362 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _364 = isnan(_278);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _376 = _374 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _378 = -_336;
    float _380 = _378 + 1.0;
    float _382 = -_356;
    float _384 = _382 + 1.0;
    float _386 = _306 * _322;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _388;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _392;
    float _396 = _372 * _384;
    float _398 = fma(_360, _386, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _400 = fma(_390, _386, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _402 = fma(_394, _386, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _404 = _356 * _380;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = _400 * _396;
    float _412 = _402 * _396;
    float _414 = _398 * _396;
    float _416 = -_372;
    float _418 = _416 + 1.0;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].x, _412);
    float _426 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].y, _410);
    float _428 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].z, _414);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _430;
    float _434 = fma(_376, _344, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _436 = fma(_422, _344, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _438 = fma(_408, _344, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _444;
    float _448 = fma(_434, _404, _424);
    float _450 = fma(_432, _324, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _452 = fma(_442, _324, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _454 = fma(_446, _324, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _456 = fma(_436, _404, _426);
    float _458 = fma(_438, _404, _428);
    float _460 = fma(_450, _342, _448);
    float _462 = fma(_452, _342, _456);
    float _464 = fma(_454, _342, _458);
    float _466 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[146].x, _460);
    float _468 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[146].y, _462);
    float _470 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[146].z, _464);
    bool _472 = !_318;
    float _488;
    if (!_472)
    {
        float _474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _476 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _478 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[11].x, _138);
        float _480 = _478 * _474;
        float _482 = floor(_480);
        float _484 = -_482;
        float _486 = _480 + _484;
        _488 = _486;
        _490 = true;
    }
    else
    {
        float _492 = float(_104);
        float _494 = 1.0 / _492;
        float _496 = _138 * _494;
        _488 = _496;
    }
    _490 = false;
    float _498 = _488;
    float _500 = in.m_53.x;
    float _502 = in.m_53.y;
    float _504 = in.m_53.z;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _506;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _522 = 1.0 / _508;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _532 = 1.0 / _512;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _536 = _498 + _534;
    bool _538 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _540 = isnan(_498);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    bool _550 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _552 = isnan(_498);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = 1.0 / _520;
    float _564 = _536 * _522;
    bool _566 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _568 = isnan(_498);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _580 = _498 + _578;
    float _582 = _470 * _504;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _586 = _498 + _584;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _590 = _498 + _588;
    float _592 = _468 * _502;
    float _594 = 1.0 / _526;
    bool _596 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _598 = isnan(_498);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = _580 * _532;
    float _610 = -_576;
    float _612 = _610 + 1.0;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _616 = _498 + _614;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _618;
    float _622 = -_606;
    float _624 = _622 + 1.0;
    float _626 = 1.0 / _530;
    float _628 = _586 * _562;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _630;
    float _634 = _466 * _500;
    bool _636 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _638 = 1.0 / _516;
    bool _640 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _642 = isnan(_498);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = _650 * _612;
    float _654 = _590 * _626;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _658 = _498 + _656;
    float _660 = -_650;
    float _662 = _660 + 1.0;
    float _664 = fma(_620, _564, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _666 = _658 * _594;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _668;
    float _672 = _606 * _662;
    float _674 = _616 * _638;
    float _676 = fma(_632, _564, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _678 = fma(_670, _564, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _680 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _682 = isnan(_498);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _700 = _548 * _624;
    float _702 = -_548;
    float _704 = _702 + 1.0;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    bool _710 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _712 = isnan(_498);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = fma(_698, _608, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _724 = _690 * _704;
    float _726 = fma(_694, _608, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _728 = fma(_708, _608, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _730 = -_690;
    float _732 = _730 + 1.0;
    float _734 = -_720;
    float _736 = _734 + 1.0;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _742;
    float _746 = _720 * _732;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _748;
    float _752 = _560 * _736;
    float _754 = fma(_740, _674, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _756 = -_560;
    float _758 = _756 + 1.0;
    float _760 = fma(_750, _674, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _762 = _678 * _752;
    float _764 = fma(_744, _674, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _766 = _664 * _752;
    float _768 = _676 * _752;
    float _770 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[107].z, _762);
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _776 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[107].x, _766);
    float _778 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[107].y, _768);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _784 = fma(_728, _746, _770);
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _788 = _786 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _790 = fma(_722, _746, _776);
    float _792 = fma(_726, _746, _778);
    float _794 = fma(_774, _628, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _796 = fma(_782, _628, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _798 = fma(_788, _628, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _800 = fma(_760, _724, _790);
    float _802 = fma(_754, _724, _792);
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _804;
    float _808 = fma(_764, _724, _784);
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _810;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _814;
    float _818 = fma(_806, _666, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _820 = fma(_794, _700, _800);
    float _822 = fma(_796, _700, _802);
    float _824 = fma(_798, _700, _808);
    float _826 = fma(_812, _666, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _836 = fma(_816, _666, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _842 = fma(_818, _672, _820);
    float _844 = fma(_830, _654, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _846 = fma(_834, _654, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _848 = fma(_840, _654, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _850 = fma(_826, _672, _822);
    float _852 = fma(_836, _672, _824);
    float _854 = fma(_844, _652, _842);
    float _856 = fma(_846, _652, _850);
    float _858 = fma(_848, _652, _852);
    float _860 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[113].x, _854);
    float _862 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[113].y, _856);
    float _864 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[113].z, _858);
    bool _866 = !_636;
    float _882;
    if (!_866)
    {
        float _868 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _870 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _872 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _874 = _872 * _868;
        float _876 = floor(_874);
        float _878 = -_876;
        float _880 = _874 + _878;
        _882 = _880;
        _884 = true;
    }
    else
    {
        float _886 = float(_104);
        float _888 = 1.0 / _886;
        float _890 = _138 * _888;
        _882 = _890;
    }
    _884 = false;
    float _892 = _882;
    bool _894 = _892 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _896 = isnan(_892);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _910 = _892 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _912 = isnan(_892);
    bool _914 = _910 || _912;
    bool _916 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _918 = _914 || _916;
    float _920 = float(_918);
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _922;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _928 = _892 + _926;
    float _930 = -_904;
    float _932 = _930 + 1.0;
    bool _934 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _936 = 1.0 / _908;
    float _938 = _920 * _932;
    float _940 = -_920;
    float _942 = _940 + 1.0;
    float _944 = _924 * _936;
    float _946 = _864 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _948 = fma(_944, _928, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _950 = _862 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _952 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _954 = _948 * _938;
    float _956 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[115].x, _954);
    float _960 = _860 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _962 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[116].x, _958);
    float _964 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _966 = _962 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _964;
    out.m_55.y = _956;
    out.m_55.z = _952;
    out.m_55.w = _966;
    bool _968 = !_934;
    bool _970 = _934;
    float _986;
    if (!_968)
    {
        float _972 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _974 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[11].z, _138);
        float _978 = _976 * _972;
        float _980 = floor(_978);
        float _982 = -_980;
        float _984 = _978 + _982;
        _986 = _984;
        _988 = true;
    }
    else
    {
        float _990 = float(_104);
        float _992 = 1.0 / _990;
        float _994 = _138 * _992;
        _986 = _994;
    }
    _988 = false;
    float _996 = _986;
    float _998 = in.m_44.x;
    float _1000 = in.m_44.y;
    float _1002 = in.m_44.z;
    float _1004 = _160 * 2.0;
    float _1006 = in.m_57.x;
    float _1008 = in.m_57.y;
    float _1010 = in.m_57.z;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1014 = _1012 != 0;
    float _1016 = floor(_1004);
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1020 = _1018 != 0;
    float _1022 = in.m_51.w;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1024;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1030 = _996 + _1028;
    float _1032 = in.m_59.x;
    float _1034 = in.m_59.y;
    float _1036 = in.m_59.z;
    int _1038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1040 = _1038 != 0;
    float _1042 = 1.0 / _1026;
    int _1044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1046 = _1044 != 0;
    float _1048 = in.m_61.x;
    float _1050 = in.m_61.y;
    float _1052 = in.m_61.z;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1056 = _996 + _1054;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1060 = _996 + _1058;
    float _1062 = in.m_63.x;
    int _1064 = as_type<int>(_1004);
    if (_1020)
    {
        bool _1066 = _160 > 0.5;
        _970 = _1066;
    }
    bool _1068 = _970;
    float _1070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1072;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[112].z;
    if (_1014)
    {
        float _1078 = in.m_51.z;
        _1076 = _1078;
    }
    float _1080 = _1076;
    float _1082 = _1000 * _1008;
    float _1084 = in.m_65.x;
    float _1086 = in.m_65.y;
    bool _1088 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1090 = isnan(_996);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1096 = _1092 || _1094;
    float _1098 = float(_1096);
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1100;
    bool _1104 = _1022 > 0.5;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1106;
    float _1110 = _1000 * _1034;
    float _1112 = _1000 * _1050;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1118 = fma(_998, _1006, _1082);
    float _1120 = fma(_998, _1032, _1110);
    float _1122 = in.m_51.z;
    float _1124 = 1.0 / _1074;
    float _1126 = _1050;
    float _1128 = _1048;
    if (_1020)
    {
        float _1130 = -_1062;
        float _1132 = _1130 + 1.0;
        _1064 = as_type<int>(_1132);
    }
    int _1134 = _1064;
    int _1136 = _1134;
    if (!_1020)
    {
        _1126 = _1062;
    }
    float _1138 = _1126;
    float _1140 = in.m_51.y;
    float _1142 = _1138;
    if (_1014)
    {
        bool _1144 = _1080 > 0.5;
        _252 = _1144;
    }
    bool _1146 = _252;
    float _1148 = fma(_998, _1048, _1112);
    if (_1020)
    {
        float _1150 = _1068 ? as_type<float>(_1134) : _1062;
        _1142 = _1150;
    }
    float _1152 = _1142;
    if (_1014)
    {
        float _1154 = -_1062;
        float _1156 = _1154 + 1.0;
        _1136 = as_type<int>(_1156);
    }
    int _1158 = _1136;
    float _1160 = in.m_63.y;
    if (!_1014)
    {
        _1128 = _1062;
    }
    float _1162 = _1128;
    float _1164 = 1.0 / _1116;
    float _1166 = _1162;
    if (_1014)
    {
        float _1168 = _1146 ? as_type<float>(_1158) : _1062;
        _1166 = _1168;
    }
    float _1170 = _1166;
    float _1172 = fma(_1002, _1010, _1118);
    float _1174 = abs(_1084);
    float _1176 = abs(_1086);
    float _1178 = precise::max(_1174, _1176);
    float _1180 = fma(_1002, _1052, _1148);
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1184 = _1182 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1186 = _1016 > 0.0;
    float _1188 = _1030 * _1124;
    bool _1190 = _1016 >= 0.0;
    bool _1192 = isnan(_1016);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan(0.0);
    bool _1198 = _1194 || _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1202 = _1200 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1204 = _1178 >= 16.0;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1206;
    float _1210 = _1122 * 2.0;
    float _1212 = fma(_1002, _1036, _1120);
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1216 = _996 + _1214;
    float _1218 = 1.0 / _1184;
    float _1220 = _1140 * 2.0;
    float _1222 = _160 + _1140;
    float _1224 = _1216 * _1042;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1228 = _996 + _1226;
    float _1230 = _1222 + (-1.0);
    float _1232 = -_1160;
    float _1234 = _1232 + 1.0;
    float _1236 = floor(_1210);
    float _1238 = _1140 + _1122;
    float _1240 = _1056 * _1164;
    float _1242 = _1238 + (-1.0);
    float _1244 = _1172 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1246;
    float _1250 = 1.0 / _1202;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1254 = _1252 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1256;
    float _1260 = fma(_1248, _1224, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1262 = _1212 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1264 = _1180 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1266 = fma(_1258, _1188, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1268 = floor(_1220);
    float _1270 = 1.0 / _1208;
    float _1272 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1274 = _1104 ? as_type<int>(_1234) : as_type<int>(_1160);
    float _1276 = _1228 * _1250;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1280 = _996 + _1278;
    bool _1282 = _1140 > 0.5;
    float _1284 = _1040 ? as_type<float>(_1274) : _1160;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1286;
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1292 = _1290 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1294 = _1160;
    if (_1046)
    {
        float _1296 = _1282 ? _1234 : _1160;
        _1294 = _1296;
    }
    float _1298 = _1294;
    float _1300 = fma(_1288, _1224, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1302 = _1236 > 0.0;
    float _1304 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1306 = _1280 * _1218;
    bool _1308 = _1236 >= 0.0;
    bool _1310 = isnan(_1236);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan(0.0);
    bool _1316 = _1312 || _1314;
    float _1318 = fma(_1292, _1240, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1320 = _1268 > 0.0;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1322;
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1328 = _1326 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _1330 = _1268 >= 0.0;
    bool _1332 = isnan(_1268);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan(0.0);
    bool _1338 = _1334 || _1336;
    float _1340 = _1060 * _1270;
    float _1342 = fma(_1324, _1224, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1344 = fma(_1328, _1240, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1346 = fma(_1254, _1240, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1348 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1350 = isnan(_996);
    bool _1352 = _1348 || _1350;
    bool _1354 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1356 = _1352 || _1354;
    float _1358 = float(_1356);
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1360;
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1366 = _1364 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1368;
    bool _1372 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1374 = isnan(_996);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1380 = _1376 || _1378;
    float _1382 = float(_1380);
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1386 = _1384 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1388 = -_1358;
    float _1390 = _1388 + 1.0;
    float _1392 = fma(_1362, _1188, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1394 = fma(_1370, _1188, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1396 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1398 = _1396 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1400 = fma(_1366, _1276, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1402 = _1382 * _1390;
    bool _1404 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1406 = isnan(_996);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1412 = _1408 || _1410;
    float _1414 = float(_1412);
    float _1416 = fma(_1398, _1276, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    bool _1418 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1420 = isnan(_996);
    bool _1422 = _1418 || _1420;
    bool _1424 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1426 = _1422 || _1424;
    float _1428 = float(_1426);
    float _1430 = fma(_1386, _1276, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1432 = -_1382;
    float _1434 = _1432 + 1.0;
    bool _1436 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1438 = isnan(_996);
    bool _1440 = _1436 || _1438;
    bool _1442 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1444 = _1440 || _1442;
    float _1446 = float(_1444);
    float _1448 = -_1414;
    float _1450 = _1448 + 1.0;
    float _1452 = -_1428;
    float _1454 = _1452 + 1.0;
    bool _1456 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1458 = isnan(_996);
    bool _1460 = _1456 || _1458;
    bool _1462 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1464 = _1460 || _1462;
    float _1466 = float(_1464);
    float _1468 = _1414 * _1434;
    float _1470 = _1428 * _1450;
    float _1472 = _1446 * _1454;
    float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1474;
    float _1478 = -_1446;
    float _1480 = _1478 + 1.0;
    float _1482 = -_1466;
    float _1484 = _1482 + 1.0;
    float _1486 = fma(_1102, _1340, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1488 = fma(_1476, _1340, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1490 = _1466 * _1480;
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1494 = _1492 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1498 = _1098 * _1484;
    float _1500 = fma(_1108, _1340, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1504 = _1502 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1508 = _1506 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    int _1510 = _1198 ? 0 : 1;
    float _1512 = _1260 * _1498;
    float _1514 = fma(_1504, _1306, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1516 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1518 = fma(_1508, _1306, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1520 = fma(_1494, _1306, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    int _1522 = _1338 ? 0 : 1;
    float _1524 = _1300 * _1498;
    int _1526 = ~_1510;
    int _1528 = _1526 + 1;
    int _1530 = _1528 + 1;
    float _1532 = _1342 * _1498;
    int _1534 = _1530;
    bool _1536 = _1302;
    float _1538 = _1488;
    if (!_1186)
    {
        int _1540 = ~_1510;
        int _1542 = _1540 + 1;
        _1534 = _1542;
    }
    int _1544 = _1534;
    float _1546 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1548 = _1316 ? 0 : 1;
    float _1550 = -_1098;
    float _1552 = _1550 + 1.0;
    int _1554 = ~_1522;
    int _1556 = _1554 + 1;
    int _1558 = _1556 + 1;
    float _1560 = _1284 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1562 = _1558;
    if (!_1320)
    {
        int _1564 = ~_1522;
        int _1566 = _1564 + 1;
        _1562 = _1566;
    }
    int _1568 = _1562;
    float _1570 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1572 = ~_1548;
    int _1574 = _1572 + 1;
    int _1576 = _1574 + 1;
    float _1578 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1532);
    int _1580 = _1576;
    if (!_1302)
    {
        int _1582 = ~_1548;
        int _1584 = _1582 + 1;
        _1580 = _1584;
    }
    int _1586 = _1580;
    float _1588 = _1152 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1590 = _1570 * _1496;
    float _1592 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1594 = fma(_1344, _1490, _1578);
    float _1596 = _1588 * _1070;
    float _1598 = _1086 * 0.0625;
    float _1600 = _1592 * _1516;
    float _1602 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1604 = _1244 + _1602;
    float _1606 = _1560 * _1546;
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1610 = _1262 + _1608;
    float _1612 = _1084 * 0.0625;
    float _1614 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1616 = _1204 ? _1598 : _1086;
    float _1618 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1524);
    float _1620 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1622 = _1264 + _1620;
    float _1624 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1614);
    float _1626 = _1604 * _1604;
    float _1628 = _1204 ? _1612 : _1084;
    float _1630 = fma(_1318, _1490, _1618);
    float _1632 = abs(_1616);
    bool _1634 = _1632 != 0.0;
    bool _1636 = isnan(_1632);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan(0.0);
    bool _1642 = _1638 || _1640;
    float _1644 = fma(_1610, _1610, _1626);
    float _1646 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1624);
    float _1648 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1512);
    float _1650 = abs(_1628);
    bool _1652 = _1650 == 0.0;
    bool _1654 = !_1642;
    bool _1656 = _1652 && _1654;
    float _1658 = fma(_1622, _1622, _1644);
    float _1660 = abs(_1628);
    bool _1662 = _1660 == 0.0;
    float _1664 = fma(_1346, _1490, _1648);
    bool _1666 = _1646 >= 0.0;
    float _1668 = fma(_1392, _1472, _1594);
    float _1670 = fma(_1266, _1472, _1630);
    float _1672 = rsqrt(_1658);
    float _1674 = fma(_1394, _1472, _1664);
    out.m_67.x = _1596;
    out.m_67.y = _1590;
    out.m_67.z = _1600;
    out.m_67.w = _1606;
    float _1676 = fma(_1416, _1470, _1668);
    float _1678 = fma(_1400, _1470, _1670);
    float _1680 = fma(_1430, _1470, _1674);
    int _1682 = as_type<int>(_1606);
    int _1684 = as_type<int>(_1600);
    if (_1656)
    {
        bool _1686 = as_type<int>(_1628) >= 0;
        _1536 = _1686;
    }
    bool _1688 = _1536;
    float _1690 = fma(_1488, _1468, _1676);
    float _1692 = fma(_1486, _1468, _1678);
    float _1694 = fma(_1500, _1468, _1680);
    int _1696 = _1688 ? (-1) : 0;
    if (_1666)
    {
        _1538 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1698 = _1538;
    if (_1656)
    {
        int _1700 = _1688 ? 0 : 1078530011;
        _1682 = _1700;
    }
    int _1702 = _1682;
    int _1704 = _1702;
    if (_1656)
    {
        int _1706 = int(0x80000000) & as_type<int>(_1616);
        int _1708 = _1702 | _1706;
        _1704 = _1708;
    }
    int _1710 = _1704;
    bool _1712 = !_1642;
    bool _1714 = _1712 && _1662;
    int _1716 = _1710;
    float _1718 = as_type<float>(_1710);
    if (!_1714)
    {
        float _1720 = abs(_1616);
        bool _1722 = _1720 != as_type<float>(0x7f800000u /* inf */);
        bool _1724 = isnan(_1720);
        bool _1726 = _1722 || _1724;
        bool _1728 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1730 = _1726 || _1728;
        float _1732 = abs(_1628);
        bool _1734 = _1732 == as_type<float>(0x7f800000u /* inf */);
        float _1736 = abs(_1628);
        bool _1738 = _1736 == as_type<float>(0x7f800000u /* inf */);
        bool _1740 = !_1730;
        bool _1742 = _1738 && _1740;
        if (_1742)
        {
            bool _1744 = as_type<int>(_1628) >= 0;
            _1696 = _1744 ? (-1) : 0;
        }
        int _1746 = _1696;
        if (_1742)
        {
            _1716 = 1075235812;
        }
        int _1748 = _1716;
        int _1750 = _1748;
        if (_1742)
        {
            int _1752 = ~_1746;
            int _1754 = (_1752 != 0) ? _1748 : 1061752795;
            _1750 = _1754;
        }
        int _1756 = _1750;
        float _1758 = as_type<float>(_1756);
        if (_1742)
        {
            int _1760 = int(0x80000000) & as_type<int>(_1616);
            int _1762 = _1756 | _1760;
            _1758 = as_type<float>(_1762);
        }
        float _1764 = _1758;
        bool _1766 = !_1730;
        bool _1768 = _1766 && _1734;
        _1718 = _1764;
        if (!_1768)
        {
            float _1770 = abs(_1616);
            float _1772 = abs(_1628);
            float _1774 = precise::max(_1770, _1772);
            float _1776 = abs(_1616);
            float _1778 = abs(_1628);
            float _1780 = precise::min(_1776, _1778);
            float _1782 = 1.0 / _1774;
            float _1784 = abs(_1616);
            float _1786 = abs(_1628);
            bool _1788 = _1784 > _1786;
            bool _1790 = as_type<int>(_1628) >= 0;
            float _1792 = _1780 * _1782;
            float _1794 = _1792 * _1792;
            float _1796 = _1794 + 11.33538818359375;
            float _1798 = fma(_1794, _1796, 28.84246826171875);
            float _1800 = fma(_1794, _1798, 19.6966705322265625);
            float _1802 = fma(_1794, -0.82336294651031494140625, -5.674867153167724609375);
            float _1804 = fma(_1794, _1802, -6.565555095672607421875);
            float _1806 = 1.0 / _1800;
            float _1808 = _1794 * _1804;
            float _1810 = abs(_1616);
            float _1812 = abs(_1628);
            float _1814 = _1810 + _1812;
            int _1816 = as_type<int>(_1616) & int(0x80000000);
            float _1818 = _1792 * _1808;
            bool _1820 = _1814 > as_type<float>(0x7f800000u /* inf */);
            bool _1822 = isnan(_1814);
            bool _1824 = _1820 || _1822;
            bool _1826 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1828 = _1824 || _1826;
            float _1830 = fma(_1818, _1806, _1792);
            float _1832 = _1830;
            _1684 = as_type<int>(_1818);
            _1718 = _1814;
            if (_1788)
            {
                float _1834 = -_1830;
                float _1836 = _1834 + 1.57079637050628662109375;
                _1832 = _1836;
            }
            float _1838 = _1832;
            int _1840 = as_type<int>(_1838);
            if (!_1790)
            {
                float _1842 = -_1838;
                float _1844 = _1842 + 3.1415927410125732421875;
                _1840 = as_type<int>(_1844);
            }
            int _1846 = _1840;
            if (!_1828)
            {
                int _1848 = _1816 | _1846;
                _1718 = as_type<float>(_1848);
            }
        }
    }
    int _1850 = _1684;
    float _1852 = _1718;
    float _1854 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1856 = log2(_1854);
    int _1858 = _1850;
    if (_1666)
    {
        float _1860 = _1698 * 5.0;
        _1858 = as_type<int>(_1860);
    }
    int _1862 = _1858;
    int _1864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1866 = _1864 != 0;
    int _1868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1870 = _1868 != 0;
    int _1872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1874 = _1872 != 0;
    float _1876 = fma(_1518, _1402, _1692);
    float _1878 = float(_1544);
    float _1880 = fma(_1520, _1402, _1694);
    if (_1666)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5975 = as_type<float>(_1862);
        out.gl_Position.z = _5975;
    }
    float _1882 = precise::max(_1852, -3.1415927410125732421875);
    float _1884 = fma(_1358, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1876);
    float _1886 = fma(_1358, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1880);
    float _1888 = precise::min(_1882, 3.1415927410125732421875);
    float _1890 = _1604 * _1672;
    float _1892 = float(_1586);
    float _1894 = fma(_1514, _1402, _1690);
    float _1896 = _1856 * _138;
    float _1898 = fma(_1888, 0.15915493667125701904296875, 0.5);
    float _1900 = _1610 * _1672;
    bool _1902 = !_1870;
    int _1904 = _1902 ? 0 : 1;
    float _1906 = -_1890;
    float _1908 = fma(_1906, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1604);
    float _1910 = exp2(_1896);
    bool _1912 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1914 = isnan(0.0);
    bool _1916 = _1912 || _1914;
    bool _1918 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1920 = _1916 || _1918;
    float _1922 = fma(_1358, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1894);
    int _1924 = abs(_1904);
    float _1926 = -_1900;
    float _1928 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1610);
    bool _1930 = !_1866;
    int _1932 = _1930 ? 0 : 1;
    float _1934 = _1908 * _1908;
    float _1936 = float(_1924);
    float _1938 = _1622 * _1672;
    int _1940 = abs(_1932);
    float _1942 = fma(_1928, _1928, _1934);
    float _1944 = in.m_69.x;
    float _1946 = in.m_69.y;
    float _1948 = in.m_69.z;
    float _1950 = _1936 * _1878;
    float _1952 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1954 = 1.0 + _1952;
    float _1956 = -_1938;
    float _1958 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1622);
    float _1960 = -_1910;
    float _1962 = _1960 + 1.0;
    float _1964 = float(_1940);
    float _1966 = _160 + (-0.5);
    bool _1968 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1970 = isnan(1.0);
    bool _1972 = _1968 || _1970;
    bool _1974 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1976 = _1972 || _1974;
    float _1978 = 1.0 / _1954;
    float _1980 = _1920 ? _1962 : 0.0;
    float _1982 = _1964 * _1892;
    float _1984 = _1884 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1986 = _1922 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1988 = _1886 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1990 = _1982 * (-2.0);
    float _1992 = fma(_1958, _1958, _1942);
    float _1994 = _1986 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1996 = _1984 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1998 = _1988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2000 = fma(_138, 0.06666667759418487548828125, _1898);
    float _2002 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2004 = fma(_1304, _1990, _1304);
    float _2006 = fma(_1990, _1944, _1944);
    if (_1976)
    {
        float _2008 = _1980 * _1978;
        _140 = _2008;
    }
    float _2010 = _140;
    float _2012 = _1950 * (-2.0);
    out.m_71.x = _1994;
    out.m_71.y = _1996;
    out.m_71.z = _1998;
    out.m_71.w = _2002;
    float _2014 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2006);
    float _2016 = _2000 * 6.283185482025146484375;
    float _2018 = sqrt(_1992);
    if (_1666)
    {
        out.m_47.x = 0.0;
    }
    float _2020 = fma(_1272, _2012, _1272);
    float _2022 = fma(_2012, _1946, _1946);
    float _2024 = fma(_2004, _2010, _2014);
    float _2026 = _1140 + (-0.5);
    float _2028 = float(_1568);
    bool _2030 = !_1874;
    int _2032 = _2030 ? 0 : 1;
    if (_1666)
    {
        return out;
    }
    float _2034 = -_1890;
    float _2036 = fma(_2034, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1244);
    float _2038 = -_1900;
    float _2040 = fma(_2038, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1262);
    int _2042 = abs(_2032);
    float _2044 = -_1938;
    float _2046 = fma(_2044, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1264);
    float _2048 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2050 = _2036 + _2048;
    float _2052 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2054 = _2040 + _2052;
    float _2056 = _160 + _1122;
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2060 = _2046 + _2058;
    float _2062 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2064 = _1122 + (-0.5);
    float _2066 = _2056 + (-1.0);
    float _2068 = fma(_2026, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2022);
    float _2070 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2062);
    float _2072 = float(_2042);
    float _2074 = in.m_65.z;
    float _2076 = fma(_2020, _2010, _2068);
    float _2078 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2070);
    float _2080 = _2016 * 0.15915493667125701904296875;
    float _2082 = _2072 * _2028;
    float _2084 = _2024 * 0.15915493667125701904296875;
    bool _2086 = _2078 >= 0.0;
    float _2088 = _2082 * (-2.0);
    float _2090 = _2080 * 6.283185482025146484375;
    float _2092 = sin(_2090);
    float _2094 = fma(_2088, _1948, _1948);
    float _2096 = fma(_2066, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2098 = _2076 * 0.15915493667125701904296875;
    float _2100 = fma(_2064, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2094);
    float _2102 = fma(_2096, _2088, _2096);
    float _2104 = _2084 * 6.283185482025146484375;
    float _2106 = sin(_2104);
    float _2108 = as_type<float>(_2042);
    int _2110 = as_type<int>(_2100);
    if (_2086)
    {
        _2108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2112 = _2108;
    if (_2086)
    {
        out.m_47.x = 0.0;
    }
    float _2114 = fma(_2102, _2010, _2100);
    if (_2086)
    {
        float _2116 = _2112 * 5.0;
        _2110 = as_type<int>(_2116);
    }
    int _2118 = _2110;
    float _2120 = _2114 * 0.15915493667125701904296875;
    float _2122 = _2084 * 6.283185482025146484375;
    float _2124 = cos(_2122);
    if (_2086)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6376 = as_type<float>(_2118);
        out.gl_Position.z = _6376;
    }
    float _2126 = _2098 * 6.283185482025146484375;
    float _2128 = sin(_2126);
    float _2130 = _2098 * 6.283185482025146484375;
    float _2132 = cos(_2130);
    float _2134 = _2120 * 6.283185482025146484375;
    float _2136 = sin(_2134);
    if (_2086)
    {
        return out;
    }
    float _2138 = _2120 * 6.283185482025146484375;
    float _2140 = cos(_2138);
    float _2142 = fma(_2092, 0.5, 1.5);
    float _2144 = _1672 * _2018;
    float _2146 = _2106 * _2128;
    float _2148 = _2124 * _2132;
    float _2150 = _2142 * _1086;
    float _2152 = _592 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2154 = _2142 * _1084;
    float _2156 = _2142 * _2074;
    float _2158 = _2106 * _2132;
    float _2160 = fma(_2136, _2148, _2146);
    float _2162 = _634 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2164 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2150);
    float _2166 = _2144 * _2152;
    float _2168 = fma(_2136, _2146, _2148);
    float _2170 = _2124 * _2128;
    float _2172 = _2124 * _2140;
    float _2174 = _2132 * _2140;
    float _2176 = _2106 * _2140;
    float _2178 = _2128 * _2140;
    float _2180 = _582 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2182 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2154);
    float _2184 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2156);
    float _2186 = _2144 * _2162;
    float _2188 = _2144 * _2180;
    float _2190 = _2164 * _2166;
    float _2192 = -_2170;
    float _2194 = fma(_2136, _2158, _2192);
    float _2196 = -_2158;
    float _2198 = fma(_2136, _2170, _2196);
    float _2200 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2202 = _2182 * _2186;
    float _2204 = _2184 * _2188;
    float _2206 = _2172 * _2190;
    float _2208 = _2172 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2210 = _2172 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2212 = _2172 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2214 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2216 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2218 = _2176 * _2190;
    float _2220 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2200);
    float _2222 = -_2190;
    float _2224 = _2136 * _2222;
    float _2226 = fma(_2160, _2202, _2206);
    float _2228 = -_2136;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2208);
    float _2232 = -_2136;
    float _2234 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2210);
    float _2236 = -_2136;
    float _2238 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2212);
    float _2240 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2214);
    float _2242 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2216);
    float _2244 = fma(_2194, _2202, _2218);
    float _2246 = fma(_2174, _2202, _2224);
    float _2248 = fma(_2198, _2204, _2226);
    float _2250 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2220);
    float _2252 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2240);
    float _2254 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2242);
    float _2256 = fma(_2168, _2204, _2244);
    float _2258 = _2198 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2260 = _2198 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2262 = _2198 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2264 = fma(_2178, _2204, _2246);
    float _2266 = _2248 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2268 = _2248 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2270 = in.m_73.x;
    float _2272 = in.m_73.y;
    float _2274 = in.m_73.z;
    float _2276 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2234);
    float _2278 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2266);
    float _2280 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2268);
    float _2282 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2230);
    float _2284 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2258);
    float _2286 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2278);
    float _2288 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2280);
    float _2290 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2260);
    float _2292 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2262);
    float _2294 = _2286 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2296 = _2288 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2298 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2238);
    bool _2300 = _2150 != 0.0;
    bool _2302 = isnan(_2150);
    bool _2304 = _2300 || _2302;
    bool _2306 = isnan(0.0);
    bool _2308 = _2304 || _2306;
    float _2310 = _1262 + _2294;
    float _2312 = _1264 + _2296;
    float _2314 = in.m_75.x;
    float _2316 = in.m_75.y;
    float _2318 = in.m_75.z;
    float _2320 = in.m_75.w;
    bool _2322 = _2154 == 0.0;
    bool _2324 = !_2308;
    bool _2326 = _2322 && _2324;
    float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2330 = _2310 + _2328;
    float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2334 = _2312 + _2332;
    float _2336 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2284);
    bool _2338 = _2156 == 0.0;
    bool _2340 = _2338 && _2326;
    float _2342 = _2330 * _2330;
    float _2344 = _2334 * _2334;
    float _2346 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2290);
    float _2348 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2292);
    float _2350 = _2342 + _2344;
    float _2352 = sqrt(_2350);
    float _2354 = _2294;
    float _2356 = _2220;
    float _2358 = _2230;
    float _2360 = _2342;
    float _2362 = _2344;
    float _2364 = _2310;
    float _2366 = _2312;
    float _2368 = _2144;
    if (_2340)
    {
        _2354 = _2272;
    }
    float _2370 = _2354;
    float _2372 = _2370;
    if (!_2340)
    {
        float _2374 = fma(_2150, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2272);
        _2372 = _2374;
    }
    float _2376 = _2372;
    if (_2340)
    {
        _2356 = _2270;
    }
    float _2378 = _2356;
    float _2380 = _2378;
    if (!_2340)
    {
        float _2382 = fma(_2154, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2270);
        _2380 = _2382;
    }
    float _2384 = _2380;
    float _2386 = _2248 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_2340)
    {
        _2358 = _2274;
    }
    float _2388 = _2358;
    float _2390 = _2282 * _2316;
    float _2392 = _2388;
    float _2394 = _2320;
    if (!_2340)
    {
        float _2396 = fma(_2156, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2274);
        _2392 = _2396;
    }
    float _2398 = _2392;
    float _2400 = _2276 * _2316;
    float _2402 = _2298 * _2316;
    float _2404 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2386);
    float _2406 = fma(_2250, _2314, _2390);
    float _2408 = _2314 * _2272;
    float _2410 = _2318 * _2270;
    float _2412 = _2316 * _2274;
    bool _2414 = _2352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2416 = fma(_2252, _2314, _2400);
    float _2418 = fma(_2254, _2314, _2402);
    float _2420 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2404);
    float _2422 = -_2408;
    float _2424 = fma(_2316, _2270, _2422);
    float _2426 = -_2410;
    float _2428 = fma(_2314, _2274, _2426);
    float _2430 = -_2412;
    float _2432 = fma(_2318, _2272, _2430);
    float _2434 = fma(_2336, _2318, _2406);
    float _2436 = fma(_2346, _2318, _2416);
    float _2438 = fma(_2348, _2318, _2418);
    float _2440 = _2420 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2442 = _2428 * _2320;
    float _2444 = _2432 * _2320;
    float _2446 = _2424 * _2320;
    float _2448 = _1244 + _2440;
    float _2450 = _2444;
    if (!_2414)
    {
        _2394 = _2448;
    }
    float _2452 = _2394;
    bool _2454 = !_2414;
    float _2456 = _2452;
    if (!_2454)
    {
        float _2458 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2462 = _2352 + _2460;
        float _2464 = _2448 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2466 = rsqrt(_2350);
        float _2468 = _2462 * _2458;
        float _2470 = _2468 * 0.15915493667125701904296875;
        float _2472 = _2470 * 6.283185482025146484375;
        float _2474 = sin(_2472);
        float _2476 = _2470 * 6.283185482025146484375;
        float _2478 = cos(_2476);
        float _2480 = fma(_2474, _2464, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2482 = _2466 * _2480;
        float _2484 = fma(_2330, _2482, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2486 = _2478 + (-1.0);
        float _2488 = fma(_2334, _2482, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2490 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2492 = _2484 + _2490;
        float _2494 = _2486 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2498 = _2488 + _2496;
        float _2500 = _2492 * _2492;
        float _2502 = fma(_2448, _2478, _2494);
        float _2504 = _2498 * _2498;
        _2456 = _2502;
        _2360 = _2500;
        _2362 = _2504;
        _2364 = _2484;
        _2366 = _2488;
    }
    float _2506 = _2456;
    float _2508 = _2360;
    float _2510 = _2362;
    float _2512 = _2364;
    float _2514 = _2366;
    float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2518 = _2506 + _2516;
    float _2520 = _2276 * _2376;
    float _2522 = _2298 * _2376;
    float _2524 = _2442 * _2282;
    float _2526 = fma(_2518, _2518, _2508);
    float _2528 = _2442 * _2276;
    float _2530 = _2282 * _2376;
    float _2532 = _2442 * _2298;
    float _2534 = _2526 + _2510;
    float _2536 = fma(_2252, _2384, _2520);
    float _2538 = fma(_2254, _2384, _2522);
    float _2540 = fma(_2444, _2250, _2524);
    float _2542 = fma(_2444, _2252, _2528);
    float _2544 = fma(_2250, _2384, _2530);
    float _2546 = sqrt(_2534);
    float _2548 = fma(_2444, _2254, _2532);
    float _2550 = fma(_2346, _2398, _2536);
    float _2552 = fma(_2446, _2336, _2540);
    float _2554 = fma(_2446, _2346, _2542);
    float _2556 = fma(_2336, _2398, _2544);
    float _2558 = fma(_2348, _2398, _2538);
    float _2560 = fma(_2446, _2348, _2548);
    out.m_77.x = _2434;
    out.m_77.y = _2436;
    out.m_77.z = _2438;
    out.m_79.x = _2556;
    out.m_79.y = _2550;
    out.m_79.z = _2558;
    out.m_81.x = _2552;
    out.m_81.y = _2554;
    out.m_81.z = _2560;
    bool _2562 = _2546 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2564 = isnan(_2546);
    bool _2566 = _2562 || _2564;
    bool _2568 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2570 = _2566 || _2568;
    if (!_2570)
    {
        _2450 = 1.0;
    }
    float _2572 = _2450;
    bool _2574 = !_2570;
    float _2576 = _2572;
    if (!_2574)
    {
        bool _2578 = _2546 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2580 = isnan(_2546);
        bool _2582 = _2578 || _2580;
        bool _2584 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2586 = _2582 || _2584;
        if (!_2586)
        {
            float _2588 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2590 = _2546 + _2588;
            float _2592 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2594 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2592;
            float _2596 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2598 = _2596 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2600 = 1.0 / _2594;
            float _2602 = _2590 * _2600;
            float _2604 = fma(_2602, _2598, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2576 = _2604;
            _2606 = true;
        }
        else
        {
            bool _2608 = _2546 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2610 = isnan(_2546);
            bool _2612 = _2608 || _2610;
            bool _2614 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2616 = _2612 || _2614;
            if (!_2616)
            {
                float _2618 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2620 = _2546 + _2618;
                float _2622 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2624 = _2622 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2626 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2628 = _2626 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2630 = 1.0 / _2624;
                float _2632 = _2620 * _2630;
                float _2634 = fma(_2632, _2628, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2576 = _2634;
                _2606 = true;
            }
            else
            {
                _2576 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2606 = false;
    float _2636 = _2576;
    float _2638 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2640 = _2512 + _2638;
    float _2642 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2644 = _2506 + _2642;
    bool _2646 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2648 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2650 = _2646 || _2648;
    bool _2652 = isnan(0.5);
    bool _2654 = _2650 || _2652;
    float _2656 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2658 = _2514 + _2656;
    float _2660 = fma(_2640, _2636, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2662 = fma(_2644, _2636, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2664 = fma(_2658, _2636, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2666 = -_1900;
    float _2668 = fma(_2666, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2660);
    float _2670 = -_1890;
    float _2672 = fma(_2670, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2662);
    float _2674 = -_1938;
    float _2676 = fma(_2674, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2664);
    float _2678 = _2672;
    float _2680 = _2668;
    float _2682 = _2676;
    float _2684 = _2662;
    if (!_2654)
    {
        float _2686 = _2050 * _2050;
        float _2688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2690 = -_1262;
        float _2692 = _2690 + _2660;
        float _2694 = -_1244;
        float _2696 = _2694 + _2662;
        float _2698 = fma(_2054, _2054, _2686);
        float _2700 = -_1264;
        float _2702 = _2700 + _2664;
        float _2704 = fma(_2060, _2060, _2698);
        float _2706 = 1.0 / _2144;
        float _2708 = sqrt(_2704);
        float _2710 = precise::min(_2708, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2712 = _2710 * _2688;
        float _2714 = _2712 * _2706;
        float _2716 = fma(_2692, _2714, _2040);
        float _2718 = fma(_2696, _2714, _2036);
        float _2720 = fma(_2702, _2714, _2046);
        _2678 = _2718;
        _2680 = _2716;
        _2682 = _2720;
    }
    float _2722 = _2678;
    float _2724 = _2680;
    float _2726 = _2682;
    float _2728 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2730 = _2722 + _2728;
    float _2732 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2734 = _2724 + _2732;
    float _2736 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2738 = _2726 + _2736;
    float _2740 = _2730 * _2730;
    float _2742 = fma(_2734, _2734, _2740);
    float _2744 = fma(_2738, _2738, _2742);
    float _2746 = rsqrt(_2744);
    float _2748 = sqrt(_2744);
    float _2750 = _2746 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2752 = _2734 * _2750;
    float _2754 = _2738 * _2750;
    float _2756 = _2752 * _2752;
    float _2758 = _2754 * _2754;
    float _2760 = _2756 + _2758;
    float _2762 = sqrt(_2760);
    bool _2764 = _2762 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2766 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2768 = _2762 + _2766;
    float _2770 = _2738;
    float _2772 = _2746;
    float _2774 = _2768;
    float _2776 = _2730;
    float _2778 = _2752;
    if (_2764)
    {
        float _2780 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2770 = _2780;
    }
    float _2782 = _2770;
    if (_2764)
    {
        float _2784 = rsqrt(_2760);
        _2772 = _2784;
    }
    float _2786 = _2772;
    float _2788 = _2786;
    if (_2764)
    {
        float _2790 = _2768 * _2782;
        _2774 = _2790;
    }
    float _2792 = _2774;
    if (_2764)
    {
        float _2794 = _2792 * 0.15915493667125701904296875;
        _2684 = _2794;
    }
    float _2796 = _2684;
    float _2798 = _2782;
    float _2800 = _2796;
    if (_2764)
    {
        float _2802 = _2796 * 6.283185482025146484375;
        float _2804 = sin(_2802);
        _2798 = _2804;
    }
    float _2806 = _2798;
    float _2808 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2810 = precise::max(0.0, _2808);
    float _2812 = _2558;
    float _2814 = _2810;
    if (_2764)
    {
        float _2816 = _2796 * 6.283185482025146484375;
        float _2818 = cos(_2816);
        _2812 = _2818;
    }
    float _2820 = _2812;
    float _2822 = -_2750;
    float _2824 = -_2810;
    float _2826 = fma(_2730, _2822, _2824);
    if (!_2764)
    {
        _2776 = _2756;
    }
    float _2828 = _2776;
    float _2830 = _2828;
    if (_2764)
    {
        float _2832 = _2826 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2814 = _2832;
    }
    float _2834 = _2814;
    float _2836 = _2806;
    float _2838 = _2834;
    if (_2764)
    {
        float _2840 = fma(_2806, _2834, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2836 = _2840;
    }
    float _2842 = _2836;
    float _2844 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2846 = _2842;
    if (_2764)
    {
        float _2848 = _2820 + (-1.0);
        _2838 = _2848;
    }
    float _2850 = _2838;
    float _2852 = _2850;
    if (_2764)
    {
        float _2854 = _2786 * _2842;
        _2368 = _2854;
    }
    float _2856 = _2368;
    if (!_2764)
    {
        _2788 = _2826;
    }
    float _2858 = _2788;
    float _2860 = _2858;
    if (_2764)
    {
        float _2862 = _2850 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2800 = _2862;
    }
    float _2864 = _2800;
    if (_2764)
    {
        float _2866 = _2752 * _2856;
        _2778 = _2866;
    }
    float _2868 = _2778;
    if (!_2764)
    {
        _2846 = _2754;
    }
    float _2870 = _2846;
    float _2872 = _2870;
    if (_2764)
    {
        float _2874 = _2754 * _2856;
        _2872 = _2874;
    }
    float _2876 = _2872;
    if (_2764)
    {
        float _2878 = fma(_2826, _2820, _2864);
        _2860 = _2878;
    }
    float _2880 = _2860;
    if (_2764)
    {
        float _2882 = _2868 * _2868;
        _2830 = _2882;
    }
    float _2884 = _2830;
    if (!_2764)
    {
        _2852 = _2758;
    }
    float _2886 = _2852;
    float _2888 = _2886;
    if (_2764)
    {
        float _2890 = _2876 * _2876;
        _2888 = _2890;
    }
    float _2892 = _2888;
    float _2894 = fma(_2880, _2880, _2884);
    float _2896 = _2722 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2898 = _2894 + _2892;
    float _2900 = _2722 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2902 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2904 = fma(_2748, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2902);
    float _2906 = precise::clamp(_2904, 0.0, 1.0);
    float _2908 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2896);
    float _2910 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2900);
    float _2912 = _2722 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2914 = rsqrt(_2898);
    float _2916 = -_2906;
    float _2918 = _2916 + 1.0;
    float _2920 = fma(_2726, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2910);
    float _2922 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2912);
    float _2924 = _2722 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2926 = fma(_2726, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2908);
    float _2928 = _2920 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2930 = fma(_2726, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2922);
    float _2932 = abs(_2918);
    float _2934 = log2(_2932);
    float _2936 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2924);
    float _2938 = _2928 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2940 = _2930 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2942 = _2926 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2944 = fma(_2726, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2936);
    float _2946 = -_2938;
    float _2948 = fma(_2946, _2844, 1.0);
    float _2950 = _2940 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2952 = _2914 * _2868;
    float _2954 = _2944 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2956 = _2914 * _2880;
    float _2958 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2950);
    float _2960 = _2952 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2962 = _2914 * _2876;
    float _2964 = _2940 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2966 = fma(_2928, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2958);
    float _2968 = _2934 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2970 = -_2960;
    float _2972 = fma(_2956, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2970);
    float _2974 = log2(_2948);
    float _2976 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2966);
    float _2978 = _2940 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2980 = -_2962;
    float _2982 = fma(_2980, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2972);
    float _2984 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2964);
    float _2986 = _2956 + 1.0;
    float _2988 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2978);
    float _2990 = fma(_2982, -0.5, 0.5);
    float _2992 = exp2(_2968);
    float _2994 = fma(_2982, 0.5, 0.5);
    float _2996 = fma(_2928, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2984);
    float _2998 = fma(_2928, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2988);
    float _3000 = fma(_2994, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3002 = 1.0 / _2976;
    float _3004 = fma(_2994, _3000, -0.212114393711090087890625);
    float _3006 = _2974 * 0.693147182464599609375;
    float _3008 = fma(_2994, _3004, 1.570728778839111328125);
    float _3010 = _3006 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3012 = sqrt(_2990);
    float _3014 = -_2956;
    float _3016 = fma(_2992, _2986, _3014);
    float _3018 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2996);
    float _3020 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2998);
    float _3022 = fma(_3016, 0.5, 0.5);
    float _3024 = _3018 * _3002;
    float _3026 = _3020 * _3002;
    float _3028 = fma(_3024, 0.5, 0.5);
    float _3030 = fma(_3026, -0.5, 0.5);
    float _3032 = _3012 * 0.636619746685028076171875;
    float3 _7903 = float3(_3028, _3030, _3010);
    float _3034 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7903, float3(0.0), isnan(_7903)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7903, float3(0.0), isnan(_7903)), level(0.0)).x;
    float3 _7914 = float3(_3028, _3030, _3010);
    float4 _3037 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7914, float3(0.0), isnan(_7914)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7914, float3(0.0), isnan(_7914)), level(0.0)).xyzw;
    float _3039 = _3037.x;
    float _3041 = _3037.y;
    float _3043 = _3037.z;
    float _3045 = _3037.w;
    float _3047 = -_3008;
    float _3049 = fma(_3032, _3047, 1.0);
    float2 _7936 = float2(_3049, _3022);
    float3 _3053 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7936, float2(0.0), isnan(_7936)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7936, float2(0.0), isnan(_7936)), level(0.0)).xyz;
    float _3055 = _3053.x;
    float _3057 = _3053.y;
    float _3059 = _3053.z;
    float _3061 = _2934 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3063 = _2940 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3065 = _248 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3067 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3063);
    float _3069 = exp2(_3061);
    float _3071 = _3065 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3073 = fma(_2928, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3067);
    float _3075 = _3018 + _2976;
    float _3077 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3073);
    float _3079 = _3075 * 0.5;
    float _3081 = _2976 * 0.5;
    out.m_47.x = _3071;
    float _3083 = _3077 + _2976;
    out.gl_Position.x = _3018;
    out.gl_Position.y = _3020;
    out.gl_Position.z = _3077;
    out.gl_Position.w = _2976;
    float _3085 = -_3069;
    float _3087 = _3085 + 1.0;
    float _3089 = fma(_3020, -0.5, _3081);
    float _3091 = _3083 * 0.5;
    float _3093 = _3087 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _3079;
    out.m_83.y = _3089;
    out.m_83.z = _3091;
    out.m_83.w = _2976;
    float _3095 = _3093 * _3034;
    float _3097 = -_3093;
    float _3099 = _3097 + 1.0;
    float _3101 = _3045 * _3095;
    float _3103 = _3059 * _3095;
    float _3105 = fma(_3055, _3101, _3039);
    float _3107 = fma(_3057, _3101, _3041);
    float _3109 = _3045 * _3099;
    float _3111 = fma(_3045, _3103, _3043);
    out.m_85.x = _3105;
    out.m_85.y = _3107;
    out.m_85.z = _3111;
    out.m_85.w = _3109;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2606 = false;
    bool _988 = false;
    bool _884 = false;
    bool _490 = false;
    bool _270 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3168 = as_type<float>(_120);
        out.gl_Position.z = _3168;
    }
    if (!_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = _138;
    if (_134)
    {
        float _142 = float(_104);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _138 >= _144;
    bool _148 = !_134;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3238 = as_type<float>(_158);
        out.gl_Position.z = _3238;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = in.m_51.x;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _138 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _168 = _166 != 0;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _172 = _170 != 0;
    int _174 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _176 = _174 != 0;
    float _178 = _164 * _162;
    float _180 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[20].x, _178);
    float _182 = _180 * 6.283185482025146484375;
    float _184 = floor(_180);
    float _186 = _182 * 0.15915493667125701904296875;
    bool _188 = !_168;
    int _190 = _188 ? 0 : 1;
    int _192 = abs(_190);
    float _194 = _186 * 6.283185482025146484375;
    float _196 = cos(_194);
    bool _198 = !_176;
    int _200 = _198 ? 0 : 1;
    bool _202 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _204 = abs(_200);
    float _206 = -_184;
    float _208 = _180 + _206;
    bool _210 = !_172;
    int _212 = _210 ? 0 : 1;
    int _214 = abs(_212);
    float _216 = -_208;
    float _218 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _220 = float(_192);
    float _222 = fma(_196, 0.5, 0.5);
    bool _224 = _208 < 0.5;
    float _226 = float(_224);
    float _228 = abs(_218);
    float _230 = _220 * _228;
    float _232 = -_222;
    float _234 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _236 = float(_204);
    float _238 = -_226;
    float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _242 = float(_214);
    float _244 = fma(_236, _234, _230);
    float _246 = abs(_240);
    float _248 = fma(_242, _246, _244);
    bool _250 = !_202;
    bool _252 = _172;
    float _268;
    if (!_250)
    {
        float _254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _256 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _258 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _260 = _258 * _254;
        float _262 = floor(_260);
        float _264 = -_262;
        float _266 = _260 + _264;
        _268 = _266;
        _270 = true;
    }
    else
    {
        float _272 = float(_104);
        float _274 = 1.0 / _272;
        float _276 = _138 * _274;
        _268 = _276;
    }
    _270 = false;
    float _278 = _268;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = _278 + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _286 = _278 + _284;
    bool _288 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _290 = isnan(_278);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = _278 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = 1.0 / _302;
    bool _318 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _320 = 1.0 / _314;
    float _322 = 1.0 / _310;
    float _324 = _282 * _316;
    bool _326 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _328 = isnan(_278);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -_298;
    float _340 = _338 + 1.0;
    float _342 = _336 * _340;
    float _344 = _286 * _320;
    bool _346 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _348 = isnan(_278);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _358;
    bool _362 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _364 = isnan(_278);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _376 = _374 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _378 = -_336;
    float _380 = _378 + 1.0;
    float _382 = -_356;
    float _384 = _382 + 1.0;
    float _386 = _306 * _322;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _388;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _392;
    float _396 = _372 * _384;
    float _398 = fma(_360, _386, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _400 = fma(_390, _386, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _402 = fma(_394, _386, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _404 = _356 * _380;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = _400 * _396;
    float _412 = _402 * _396;
    float _414 = _398 * _396;
    float _416 = -_372;
    float _418 = _416 + 1.0;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].x, _412);
    float _426 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].y, _410);
    float _428 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].z, _414);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _430;
    float _434 = fma(_376, _344, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _436 = fma(_422, _344, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _438 = fma(_408, _344, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _444;
    float _448 = fma(_434, _404, _424);
    float _450 = fma(_432, _324, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _452 = fma(_442, _324, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _454 = fma(_446, _324, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _456 = fma(_436, _404, _426);
    float _458 = fma(_438, _404, _428);
    float _460 = fma(_450, _342, _448);
    float _462 = fma(_452, _342, _456);
    float _464 = fma(_454, _342, _458);
    float _466 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[146].x, _460);
    float _468 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[146].y, _462);
    float _470 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[146].z, _464);
    bool _472 = !_318;
    float _488;
    if (!_472)
    {
        float _474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _476 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _478 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[11].x, _138);
        float _480 = _478 * _474;
        float _482 = floor(_480);
        float _484 = -_482;
        float _486 = _480 + _484;
        _488 = _486;
        _490 = true;
    }
    else
    {
        float _492 = float(_104);
        float _494 = 1.0 / _492;
        float _496 = _138 * _494;
        _488 = _496;
    }
    _490 = false;
    float _498 = _488;
    float _500 = in.m_53.x;
    float _502 = in.m_53.y;
    float _504 = in.m_53.z;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _506;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _522 = 1.0 / _508;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _532 = 1.0 / _512;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _536 = _498 + _534;
    bool _538 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _540 = isnan(_498);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    bool _550 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _552 = isnan(_498);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = 1.0 / _520;
    float _564 = _536 * _522;
    bool _566 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _568 = isnan(_498);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _580 = _498 + _578;
    float _582 = _470 * _504;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _586 = _498 + _584;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _590 = _498 + _588;
    float _592 = _468 * _502;
    float _594 = 1.0 / _526;
    bool _596 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _598 = isnan(_498);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = _580 * _532;
    float _610 = -_576;
    float _612 = _610 + 1.0;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _616 = _498 + _614;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _618;
    float _622 = -_606;
    float _624 = _622 + 1.0;
    float _626 = 1.0 / _530;
    float _628 = _586 * _562;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _630;
    float _634 = _466 * _500;
    bool _636 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _638 = 1.0 / _516;
    bool _640 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _642 = isnan(_498);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = _650 * _612;
    float _654 = _590 * _626;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _658 = _498 + _656;
    float _660 = -_650;
    float _662 = _660 + 1.0;
    float _664 = fma(_620, _564, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _666 = _658 * _594;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _668;
    float _672 = _606 * _662;
    float _674 = _616 * _638;
    float _676 = fma(_632, _564, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _678 = fma(_670, _564, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _680 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _682 = isnan(_498);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _700 = _548 * _624;
    float _702 = -_548;
    float _704 = _702 + 1.0;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    bool _710 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _712 = isnan(_498);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = fma(_698, _608, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _724 = _690 * _704;
    float _726 = fma(_694, _608, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _728 = fma(_708, _608, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _730 = -_690;
    float _732 = _730 + 1.0;
    float _734 = -_720;
    float _736 = _734 + 1.0;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _742;
    float _746 = _720 * _732;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _748;
    float _752 = _560 * _736;
    float _754 = fma(_740, _674, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _756 = -_560;
    float _758 = _756 + 1.0;
    float _760 = fma(_750, _674, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _762 = _678 * _752;
    float _764 = fma(_744, _674, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _766 = _664 * _752;
    float _768 = _676 * _752;
    float _770 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[107].z, _762);
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _776 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[107].x, _766);
    float _778 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[107].y, _768);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _784 = fma(_728, _746, _770);
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _788 = _786 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _790 = fma(_722, _746, _776);
    float _792 = fma(_726, _746, _778);
    float _794 = fma(_774, _628, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _796 = fma(_782, _628, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _798 = fma(_788, _628, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _800 = fma(_760, _724, _790);
    float _802 = fma(_754, _724, _792);
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _804;
    float _808 = fma(_764, _724, _784);
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _810;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _814;
    float _818 = fma(_806, _666, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _820 = fma(_794, _700, _800);
    float _822 = fma(_796, _700, _802);
    float _824 = fma(_798, _700, _808);
    float _826 = fma(_812, _666, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _836 = fma(_816, _666, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _842 = fma(_818, _672, _820);
    float _844 = fma(_830, _654, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _846 = fma(_834, _654, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _848 = fma(_840, _654, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _850 = fma(_826, _672, _822);
    float _852 = fma(_836, _672, _824);
    float _854 = fma(_844, _652, _842);
    float _856 = fma(_846, _652, _850);
    float _858 = fma(_848, _652, _852);
    float _860 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[113].x, _854);
    float _862 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[113].y, _856);
    float _864 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[113].z, _858);
    bool _866 = !_636;
    float _882;
    if (!_866)
    {
        float _868 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _870 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _872 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _874 = _872 * _868;
        float _876 = floor(_874);
        float _878 = -_876;
        float _880 = _874 + _878;
        _882 = _880;
        _884 = true;
    }
    else
    {
        float _886 = float(_104);
        float _888 = 1.0 / _886;
        float _890 = _138 * _888;
        _882 = _890;
    }
    _884 = false;
    float _892 = _882;
    bool _894 = _892 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _896 = isnan(_892);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _910 = _892 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _912 = isnan(_892);
    bool _914 = _910 || _912;
    bool _916 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _918 = _914 || _916;
    float _920 = float(_918);
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _922;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _928 = _892 + _926;
    float _930 = -_904;
    float _932 = _930 + 1.0;
    bool _934 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _936 = 1.0 / _908;
    float _938 = _920 * _932;
    float _940 = -_920;
    float _942 = _940 + 1.0;
    float _944 = _924 * _936;
    float _946 = _864 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _948 = fma(_944, _928, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _950 = _862 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _952 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _954 = _948 * _938;
    float _956 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[115].x, _954);
    float _960 = _860 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _962 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[116].x, _958);
    float _964 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _966 = _962 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _964;
    out.m_55.y = _956;
    out.m_55.z = _952;
    out.m_55.w = _966;
    bool _968 = !_934;
    bool _970 = _934;
    float _986;
    if (!_968)
    {
        float _972 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _974 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[11].z, _138);
        float _978 = _976 * _972;
        float _980 = floor(_978);
        float _982 = -_980;
        float _984 = _978 + _982;
        _986 = _984;
        _988 = true;
    }
    else
    {
        float _990 = float(_104);
        float _992 = 1.0 / _990;
        float _994 = _138 * _992;
        _986 = _994;
    }
    _988 = false;
    float _996 = _986;
    float _998 = in.m_44.x;
    float _1000 = in.m_44.y;
    float _1002 = in.m_44.z;
    float _1004 = _160 * 2.0;
    float _1006 = in.m_57.x;
    float _1008 = in.m_57.y;
    float _1010 = in.m_57.z;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1014 = _1012 != 0;
    float _1016 = floor(_1004);
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1020 = _1018 != 0;
    float _1022 = in.m_51.w;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1024;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1030 = _996 + _1028;
    float _1032 = in.m_59.x;
    float _1034 = in.m_59.y;
    float _1036 = in.m_59.z;
    int _1038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1040 = _1038 != 0;
    float _1042 = 1.0 / _1026;
    int _1044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1046 = _1044 != 0;
    float _1048 = in.m_61.x;
    float _1050 = in.m_61.y;
    float _1052 = in.m_61.z;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1056 = _996 + _1054;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1060 = _996 + _1058;
    float _1062 = in.m_63.x;
    int _1064 = as_type<int>(_1004);
    if (_1020)
    {
        bool _1066 = _160 > 0.5;
        _970 = _1066;
    }
    bool _1068 = _970;
    float _1070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1072;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[112].z;
    if (_1014)
    {
        float _1078 = in.m_51.z;
        _1076 = _1078;
    }
    float _1080 = _1076;
    float _1082 = _1000 * _1008;
    float _1084 = in.m_65.x;
    float _1086 = in.m_65.y;
    bool _1088 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1090 = isnan(_996);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1096 = _1092 || _1094;
    float _1098 = float(_1096);
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1100;
    bool _1104 = _1022 > 0.5;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1106;
    float _1110 = _1000 * _1034;
    float _1112 = _1000 * _1050;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1118 = fma(_998, _1006, _1082);
    float _1120 = fma(_998, _1032, _1110);
    float _1122 = in.m_51.z;
    float _1124 = 1.0 / _1074;
    float _1126 = _1050;
    float _1128 = _1048;
    if (_1020)
    {
        float _1130 = -_1062;
        float _1132 = _1130 + 1.0;
        _1064 = as_type<int>(_1132);
    }
    int _1134 = _1064;
    int _1136 = _1134;
    if (!_1020)
    {
        _1126 = _1062;
    }
    float _1138 = _1126;
    float _1140 = in.m_51.y;
    float _1142 = _1138;
    if (_1014)
    {
        bool _1144 = _1080 > 0.5;
        _252 = _1144;
    }
    bool _1146 = _252;
    float _1148 = fma(_998, _1048, _1112);
    if (_1020)
    {
        float _1150 = _1068 ? as_type<float>(_1134) : _1062;
        _1142 = _1150;
    }
    float _1152 = _1142;
    if (_1014)
    {
        float _1154 = -_1062;
        float _1156 = _1154 + 1.0;
        _1136 = as_type<int>(_1156);
    }
    int _1158 = _1136;
    float _1160 = in.m_63.y;
    if (!_1014)
    {
        _1128 = _1062;
    }
    float _1162 = _1128;
    float _1164 = 1.0 / _1116;
    float _1166 = _1162;
    if (_1014)
    {
        float _1168 = _1146 ? as_type<float>(_1158) : _1062;
        _1166 = _1168;
    }
    float _1170 = _1166;
    float _1172 = fma(_1002, _1010, _1118);
    float _1174 = abs(_1084);
    float _1176 = abs(_1086);
    float _1178 = precise::max(_1174, _1176);
    float _1180 = fma(_1002, _1052, _1148);
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1184 = _1182 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1186 = _1016 > 0.0;
    float _1188 = _1030 * _1124;
    bool _1190 = _1016 >= 0.0;
    bool _1192 = isnan(_1016);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan(0.0);
    bool _1198 = _1194 || _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1202 = _1200 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1204 = _1178 >= 16.0;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1206;
    float _1210 = _1122 * 2.0;
    float _1212 = fma(_1002, _1036, _1120);
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1216 = _996 + _1214;
    float _1218 = 1.0 / _1184;
    float _1220 = _1140 * 2.0;
    float _1222 = _160 + _1140;
    float _1224 = _1216 * _1042;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1228 = _996 + _1226;
    float _1230 = _1222 + (-1.0);
    float _1232 = -_1160;
    float _1234 = _1232 + 1.0;
    float _1236 = floor(_1210);
    float _1238 = _1140 + _1122;
    float _1240 = _1056 * _1164;
    float _1242 = _1238 + (-1.0);
    float _1244 = _1172 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1246;
    float _1250 = 1.0 / _1202;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1254 = _1252 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1256;
    float _1260 = fma(_1248, _1224, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1262 = _1212 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1264 = _1180 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1266 = fma(_1258, _1188, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1268 = floor(_1220);
    float _1270 = 1.0 / _1208;
    float _1272 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1274 = _1104 ? as_type<int>(_1234) : as_type<int>(_1160);
    float _1276 = _1228 * _1250;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1280 = _996 + _1278;
    bool _1282 = _1140 > 0.5;
    float _1284 = _1040 ? as_type<float>(_1274) : _1160;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1286;
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1292 = _1290 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1294 = _1160;
    if (_1046)
    {
        float _1296 = _1282 ? _1234 : _1160;
        _1294 = _1296;
    }
    float _1298 = _1294;
    float _1300 = fma(_1288, _1224, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1302 = _1236 > 0.0;
    float _1304 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1306 = _1280 * _1218;
    bool _1308 = _1236 >= 0.0;
    bool _1310 = isnan(_1236);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan(0.0);
    bool _1316 = _1312 || _1314;
    float _1318 = fma(_1292, _1240, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1320 = _1268 > 0.0;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1322;
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1328 = _1326 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _1330 = _1268 >= 0.0;
    bool _1332 = isnan(_1268);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan(0.0);
    bool _1338 = _1334 || _1336;
    float _1340 = _1060 * _1270;
    float _1342 = fma(_1324, _1224, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1344 = fma(_1328, _1240, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1346 = fma(_1254, _1240, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1348 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1350 = isnan(_996);
    bool _1352 = _1348 || _1350;
    bool _1354 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1356 = _1352 || _1354;
    float _1358 = float(_1356);
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1360;
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1366 = _1364 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1368;
    bool _1372 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1374 = isnan(_996);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1380 = _1376 || _1378;
    float _1382 = float(_1380);
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1386 = _1384 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1388 = -_1358;
    float _1390 = _1388 + 1.0;
    float _1392 = fma(_1362, _1188, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1394 = fma(_1370, _1188, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1396 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1398 = _1396 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1400 = fma(_1366, _1276, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1402 = _1382 * _1390;
    bool _1404 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1406 = isnan(_996);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1412 = _1408 || _1410;
    float _1414 = float(_1412);
    float _1416 = fma(_1398, _1276, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    bool _1418 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1420 = isnan(_996);
    bool _1422 = _1418 || _1420;
    bool _1424 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1426 = _1422 || _1424;
    float _1428 = float(_1426);
    float _1430 = fma(_1386, _1276, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1432 = -_1382;
    float _1434 = _1432 + 1.0;
    bool _1436 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1438 = isnan(_996);
    bool _1440 = _1436 || _1438;
    bool _1442 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1444 = _1440 || _1442;
    float _1446 = float(_1444);
    float _1448 = -_1414;
    float _1450 = _1448 + 1.0;
    float _1452 = -_1428;
    float _1454 = _1452 + 1.0;
    bool _1456 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1458 = isnan(_996);
    bool _1460 = _1456 || _1458;
    bool _1462 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1464 = _1460 || _1462;
    float _1466 = float(_1464);
    float _1468 = _1414 * _1434;
    float _1470 = _1428 * _1450;
    float _1472 = _1446 * _1454;
    float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1474;
    float _1478 = -_1446;
    float _1480 = _1478 + 1.0;
    float _1482 = -_1466;
    float _1484 = _1482 + 1.0;
    float _1486 = fma(_1102, _1340, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1488 = fma(_1476, _1340, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1490 = _1466 * _1480;
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1494 = _1492 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1498 = _1098 * _1484;
    float _1500 = fma(_1108, _1340, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1504 = _1502 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1508 = _1506 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    int _1510 = _1198 ? 0 : 1;
    float _1512 = _1260 * _1498;
    float _1514 = fma(_1504, _1306, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1516 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1518 = fma(_1508, _1306, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1520 = fma(_1494, _1306, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    int _1522 = _1338 ? 0 : 1;
    float _1524 = _1300 * _1498;
    int _1526 = ~_1510;
    int _1528 = _1526 + 1;
    int _1530 = _1528 + 1;
    float _1532 = _1342 * _1498;
    int _1534 = _1530;
    bool _1536 = _1302;
    float _1538 = _1488;
    if (!_1186)
    {
        int _1540 = ~_1510;
        int _1542 = _1540 + 1;
        _1534 = _1542;
    }
    int _1544 = _1534;
    float _1546 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1548 = _1316 ? 0 : 1;
    float _1550 = -_1098;
    float _1552 = _1550 + 1.0;
    int _1554 = ~_1522;
    int _1556 = _1554 + 1;
    int _1558 = _1556 + 1;
    float _1560 = _1284 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1562 = _1558;
    if (!_1320)
    {
        int _1564 = ~_1522;
        int _1566 = _1564 + 1;
        _1562 = _1566;
    }
    int _1568 = _1562;
    float _1570 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1572 = ~_1548;
    int _1574 = _1572 + 1;
    int _1576 = _1574 + 1;
    float _1578 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1532);
    int _1580 = _1576;
    if (!_1302)
    {
        int _1582 = ~_1548;
        int _1584 = _1582 + 1;
        _1580 = _1584;
    }
    int _1586 = _1580;
    float _1588 = _1152 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1590 = _1570 * _1496;
    float _1592 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1594 = fma(_1344, _1490, _1578);
    float _1596 = _1588 * _1070;
    float _1598 = _1086 * 0.0625;
    float _1600 = _1592 * _1516;
    float _1602 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1604 = _1244 + _1602;
    float _1606 = _1560 * _1546;
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1610 = _1262 + _1608;
    float _1612 = _1084 * 0.0625;
    float _1614 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1616 = _1204 ? _1598 : _1086;
    float _1618 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1524);
    float _1620 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1622 = _1264 + _1620;
    float _1624 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1614);
    float _1626 = _1604 * _1604;
    float _1628 = _1204 ? _1612 : _1084;
    float _1630 = fma(_1318, _1490, _1618);
    float _1632 = abs(_1616);
    bool _1634 = _1632 != 0.0;
    bool _1636 = isnan(_1632);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan(0.0);
    bool _1642 = _1638 || _1640;
    float _1644 = fma(_1610, _1610, _1626);
    float _1646 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1624);
    float _1648 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1512);
    float _1650 = abs(_1628);
    bool _1652 = _1650 == 0.0;
    bool _1654 = !_1642;
    bool _1656 = _1652 && _1654;
    float _1658 = fma(_1622, _1622, _1644);
    float _1660 = abs(_1628);
    bool _1662 = _1660 == 0.0;
    float _1664 = fma(_1346, _1490, _1648);
    bool _1666 = _1646 >= 0.0;
    float _1668 = fma(_1392, _1472, _1594);
    float _1670 = fma(_1266, _1472, _1630);
    float _1672 = rsqrt(_1658);
    float _1674 = fma(_1394, _1472, _1664);
    out.m_67.x = _1596;
    out.m_67.y = _1590;
    out.m_67.z = _1600;
    out.m_67.w = _1606;
    float _1676 = fma(_1416, _1470, _1668);
    float _1678 = fma(_1400, _1470, _1670);
    float _1680 = fma(_1430, _1470, _1674);
    int _1682 = as_type<int>(_1606);
    int _1684 = as_type<int>(_1600);
    if (_1656)
    {
        bool _1686 = as_type<int>(_1628) >= 0;
        _1536 = _1686;
    }
    bool _1688 = _1536;
    float _1690 = fma(_1488, _1468, _1676);
    float _1692 = fma(_1486, _1468, _1678);
    float _1694 = fma(_1500, _1468, _1680);
    int _1696 = _1688 ? (-1) : 0;
    if (_1666)
    {
        _1538 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1698 = _1538;
    if (_1656)
    {
        int _1700 = _1688 ? 0 : 1078530011;
        _1682 = _1700;
    }
    int _1702 = _1682;
    int _1704 = _1702;
    if (_1656)
    {
        int _1706 = int(0x80000000) & as_type<int>(_1616);
        int _1708 = _1702 | _1706;
        _1704 = _1708;
    }
    int _1710 = _1704;
    bool _1712 = !_1642;
    bool _1714 = _1712 && _1662;
    int _1716 = _1710;
    float _1718 = as_type<float>(_1710);
    if (!_1714)
    {
        float _1720 = abs(_1616);
        bool _1722 = _1720 != as_type<float>(0x7f800000u /* inf */);
        bool _1724 = isnan(_1720);
        bool _1726 = _1722 || _1724;
        bool _1728 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1730 = _1726 || _1728;
        float _1732 = abs(_1628);
        bool _1734 = _1732 == as_type<float>(0x7f800000u /* inf */);
        float _1736 = abs(_1628);
        bool _1738 = _1736 == as_type<float>(0x7f800000u /* inf */);
        bool _1740 = !_1730;
        bool _1742 = _1738 && _1740;
        if (_1742)
        {
            bool _1744 = as_type<int>(_1628) >= 0;
            _1696 = _1744 ? (-1) : 0;
        }
        int _1746 = _1696;
        if (_1742)
        {
            _1716 = 1075235812;
        }
        int _1748 = _1716;
        int _1750 = _1748;
        if (_1742)
        {
            int _1752 = ~_1746;
            int _1754 = (_1752 != 0) ? _1748 : 1061752795;
            _1750 = _1754;
        }
        int _1756 = _1750;
        float _1758 = as_type<float>(_1756);
        if (_1742)
        {
            int _1760 = int(0x80000000) & as_type<int>(_1616);
            int _1762 = _1756 | _1760;
            _1758 = as_type<float>(_1762);
        }
        float _1764 = _1758;
        bool _1766 = !_1730;
        bool _1768 = _1766 && _1734;
        _1718 = _1764;
        if (!_1768)
        {
            float _1770 = abs(_1616);
            float _1772 = abs(_1628);
            float _1774 = precise::max(_1770, _1772);
            float _1776 = abs(_1616);
            float _1778 = abs(_1628);
            float _1780 = precise::min(_1776, _1778);
            float _1782 = 1.0 / _1774;
            float _1784 = abs(_1616);
            float _1786 = abs(_1628);
            bool _1788 = _1784 > _1786;
            bool _1790 = as_type<int>(_1628) >= 0;
            float _1792 = _1780 * _1782;
            float _1794 = _1792 * _1792;
            float _1796 = _1794 + 11.33538818359375;
            float _1798 = fma(_1794, _1796, 28.84246826171875);
            float _1800 = fma(_1794, _1798, 19.6966705322265625);
            float _1802 = fma(_1794, -0.82336294651031494140625, -5.674867153167724609375);
            float _1804 = fma(_1794, _1802, -6.565555095672607421875);
            float _1806 = 1.0 / _1800;
            float _1808 = _1794 * _1804;
            float _1810 = abs(_1616);
            float _1812 = abs(_1628);
            float _1814 = _1810 + _1812;
            int _1816 = as_type<int>(_1616) & int(0x80000000);
            float _1818 = _1792 * _1808;
            bool _1820 = _1814 > as_type<float>(0x7f800000u /* inf */);
            bool _1822 = isnan(_1814);
            bool _1824 = _1820 || _1822;
            bool _1826 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1828 = _1824 || _1826;
            float _1830 = fma(_1818, _1806, _1792);
            float _1832 = _1830;
            _1684 = as_type<int>(_1818);
            _1718 = _1814;
            if (_1788)
            {
                float _1834 = -_1830;
                float _1836 = _1834 + 1.57079637050628662109375;
                _1832 = _1836;
            }
            float _1838 = _1832;
            int _1840 = as_type<int>(_1838);
            if (!_1790)
            {
                float _1842 = -_1838;
                float _1844 = _1842 + 3.1415927410125732421875;
                _1840 = as_type<int>(_1844);
            }
            int _1846 = _1840;
            if (!_1828)
            {
                int _1848 = _1816 | _1846;
                _1718 = as_type<float>(_1848);
            }
        }
    }
    int _1850 = _1684;
    float _1852 = _1718;
    float _1854 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1856 = log2(_1854);
    int _1858 = _1850;
    if (_1666)
    {
        float _1860 = _1698 * 5.0;
        _1858 = as_type<int>(_1860);
    }
    int _1862 = _1858;
    int _1864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1866 = _1864 != 0;
    int _1868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1870 = _1868 != 0;
    int _1872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1874 = _1872 != 0;
    float _1876 = fma(_1518, _1402, _1692);
    float _1878 = float(_1544);
    float _1880 = fma(_1520, _1402, _1694);
    if (_1666)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5975 = as_type<float>(_1862);
        out.gl_Position.z = _5975;
    }
    float _1882 = precise::max(_1852, -3.1415927410125732421875);
    float _1884 = fma(_1358, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1876);
    float _1886 = fma(_1358, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1880);
    float _1888 = precise::min(_1882, 3.1415927410125732421875);
    float _1890 = _1604 * _1672;
    float _1892 = float(_1586);
    float _1894 = fma(_1514, _1402, _1690);
    float _1896 = _1856 * _138;
    float _1898 = fma(_1888, 0.15915493667125701904296875, 0.5);
    float _1900 = _1610 * _1672;
    bool _1902 = !_1870;
    int _1904 = _1902 ? 0 : 1;
    float _1906 = -_1890;
    float _1908 = fma(_1906, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1604);
    float _1910 = exp2(_1896);
    bool _1912 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1914 = isnan(0.0);
    bool _1916 = _1912 || _1914;
    bool _1918 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1920 = _1916 || _1918;
    float _1922 = fma(_1358, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1894);
    int _1924 = abs(_1904);
    float _1926 = -_1900;
    float _1928 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1610);
    bool _1930 = !_1866;
    int _1932 = _1930 ? 0 : 1;
    float _1934 = _1908 * _1908;
    float _1936 = float(_1924);
    float _1938 = _1622 * _1672;
    int _1940 = abs(_1932);
    float _1942 = fma(_1928, _1928, _1934);
    float _1944 = in.m_69.x;
    float _1946 = in.m_69.y;
    float _1948 = in.m_69.z;
    float _1950 = _1936 * _1878;
    float _1952 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1954 = 1.0 + _1952;
    float _1956 = -_1938;
    float _1958 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1622);
    float _1960 = -_1910;
    float _1962 = _1960 + 1.0;
    float _1964 = float(_1940);
    float _1966 = _160 + (-0.5);
    bool _1968 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1970 = isnan(1.0);
    bool _1972 = _1968 || _1970;
    bool _1974 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1976 = _1972 || _1974;
    float _1978 = 1.0 / _1954;
    float _1980 = _1920 ? _1962 : 0.0;
    float _1982 = _1964 * _1892;
    float _1984 = _1884 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1986 = _1922 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1988 = _1886 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1990 = _1982 * (-2.0);
    float _1992 = fma(_1958, _1958, _1942);
    float _1994 = _1986 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1996 = _1984 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1998 = _1988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2000 = fma(_138, 0.06666667759418487548828125, _1898);
    float _2002 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2004 = fma(_1304, _1990, _1304);
    float _2006 = fma(_1990, _1944, _1944);
    if (_1976)
    {
        float _2008 = _1980 * _1978;
        _140 = _2008;
    }
    float _2010 = _140;
    float _2012 = _1950 * (-2.0);
    out.m_71.x = _1994;
    out.m_71.y = _1996;
    out.m_71.z = _1998;
    out.m_71.w = _2002;
    float _2014 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2006);
    float _2016 = _2000 * 6.283185482025146484375;
    float _2018 = sqrt(_1992);
    if (_1666)
    {
        out.m_47.x = 0.0;
    }
    float _2020 = fma(_1272, _2012, _1272);
    float _2022 = fma(_2012, _1946, _1946);
    float _2024 = fma(_2004, _2010, _2014);
    float _2026 = _1140 + (-0.5);
    float _2028 = float(_1568);
    bool _2030 = !_1874;
    int _2032 = _2030 ? 0 : 1;
    if (_1666)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2034 = -_1890;
    float _2036 = fma(_2034, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1244);
    float _2038 = -_1900;
    float _2040 = fma(_2038, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1262);
    int _2042 = abs(_2032);
    float _2044 = -_1938;
    float _2046 = fma(_2044, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1264);
    float _2048 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2050 = _2036 + _2048;
    float _2052 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2054 = _2040 + _2052;
    float _2056 = _160 + _1122;
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2060 = _2046 + _2058;
    float _2062 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2064 = _1122 + (-0.5);
    float _2066 = _2056 + (-1.0);
    float _2068 = fma(_2026, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2022);
    float _2070 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2062);
    float _2072 = float(_2042);
    float _2074 = in.m_65.z;
    float _2076 = fma(_2020, _2010, _2068);
    float _2078 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2070);
    float _2080 = _2016 * 0.15915493667125701904296875;
    float _2082 = _2072 * _2028;
    float _2084 = _2024 * 0.15915493667125701904296875;
    bool _2086 = _2078 >= 0.0;
    float _2088 = _2082 * (-2.0);
    float _2090 = _2080 * 6.283185482025146484375;
    float _2092 = sin(_2090);
    float _2094 = fma(_2088, _1948, _1948);
    float _2096 = fma(_2066, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2098 = _2076 * 0.15915493667125701904296875;
    float _2100 = fma(_2064, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2094);
    float _2102 = fma(_2096, _2088, _2096);
    float _2104 = _2084 * 6.283185482025146484375;
    float _2106 = sin(_2104);
    float _2108 = as_type<float>(_2042);
    int _2110 = as_type<int>(_2100);
    if (_2086)
    {
        _2108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2112 = _2108;
    if (_2086)
    {
        out.m_47.x = 0.0;
    }
    float _2114 = fma(_2102, _2010, _2100);
    if (_2086)
    {
        float _2116 = _2112 * 5.0;
        _2110 = as_type<int>(_2116);
    }
    int _2118 = _2110;
    float _2120 = _2114 * 0.15915493667125701904296875;
    float _2122 = _2084 * 6.283185482025146484375;
    float _2124 = cos(_2122);
    if (_2086)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6376 = as_type<float>(_2118);
        out.gl_Position.z = _6376;
    }
    float _2126 = _2098 * 6.283185482025146484375;
    float _2128 = sin(_2126);
    float _2130 = _2098 * 6.283185482025146484375;
    float _2132 = cos(_2130);
    float _2134 = _2120 * 6.283185482025146484375;
    float _2136 = sin(_2134);
    if (_2086)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2138 = _2120 * 6.283185482025146484375;
    float _2140 = cos(_2138);
    float _2142 = fma(_2092, 0.5, 1.5);
    float _2144 = _1672 * _2018;
    float _2146 = _2106 * _2128;
    float _2148 = _2124 * _2132;
    float _2150 = _2142 * _1086;
    float _2152 = _592 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2154 = _2142 * _1084;
    float _2156 = _2142 * _2074;
    float _2158 = _2106 * _2132;
    float _2160 = fma(_2136, _2148, _2146);
    float _2162 = _634 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2164 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2150);
    float _2166 = _2144 * _2152;
    float _2168 = fma(_2136, _2146, _2148);
    float _2170 = _2124 * _2128;
    float _2172 = _2124 * _2140;
    float _2174 = _2132 * _2140;
    float _2176 = _2106 * _2140;
    float _2178 = _2128 * _2140;
    float _2180 = _582 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2182 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2154);
    float _2184 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2156);
    float _2186 = _2144 * _2162;
    float _2188 = _2144 * _2180;
    float _2190 = _2164 * _2166;
    float _2192 = -_2170;
    float _2194 = fma(_2136, _2158, _2192);
    float _2196 = -_2158;
    float _2198 = fma(_2136, _2170, _2196);
    float _2200 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2202 = _2182 * _2186;
    float _2204 = _2184 * _2188;
    float _2206 = _2172 * _2190;
    float _2208 = _2172 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2210 = _2172 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2212 = _2172 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2214 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2216 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2218 = _2176 * _2190;
    float _2220 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2200);
    float _2222 = -_2190;
    float _2224 = _2136 * _2222;
    float _2226 = fma(_2160, _2202, _2206);
    float _2228 = -_2136;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2208);
    float _2232 = -_2136;
    float _2234 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2210);
    float _2236 = -_2136;
    float _2238 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2212);
    float _2240 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2214);
    float _2242 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2216);
    float _2244 = fma(_2194, _2202, _2218);
    float _2246 = fma(_2174, _2202, _2224);
    float _2248 = fma(_2198, _2204, _2226);
    float _2250 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2220);
    float _2252 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2240);
    float _2254 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2242);
    float _2256 = fma(_2168, _2204, _2244);
    float _2258 = _2198 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2260 = _2198 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2262 = _2198 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2264 = fma(_2178, _2204, _2246);
    float _2266 = _2248 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2268 = _2248 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2270 = in.m_73.x;
    float _2272 = in.m_73.y;
    float _2274 = in.m_73.z;
    float _2276 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2234);
    float _2278 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2266);
    float _2280 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2268);
    float _2282 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2230);
    float _2284 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2258);
    float _2286 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2278);
    float _2288 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2280);
    float _2290 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2260);
    float _2292 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2262);
    float _2294 = _2286 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2296 = _2288 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2298 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2238);
    bool _2300 = _2150 != 0.0;
    bool _2302 = isnan(_2150);
    bool _2304 = _2300 || _2302;
    bool _2306 = isnan(0.0);
    bool _2308 = _2304 || _2306;
    float _2310 = _1262 + _2294;
    float _2312 = _1264 + _2296;
    float _2314 = in.m_75.x;
    float _2316 = in.m_75.y;
    float _2318 = in.m_75.z;
    float _2320 = in.m_75.w;
    bool _2322 = _2154 == 0.0;
    bool _2324 = !_2308;
    bool _2326 = _2322 && _2324;
    float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2330 = _2310 + _2328;
    float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2334 = _2312 + _2332;
    float _2336 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2284);
    bool _2338 = _2156 == 0.0;
    bool _2340 = _2338 && _2326;
    float _2342 = _2330 * _2330;
    float _2344 = _2334 * _2334;
    float _2346 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2290);
    float _2348 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2292);
    float _2350 = _2342 + _2344;
    float _2352 = sqrt(_2350);
    float _2354 = _2294;
    float _2356 = _2220;
    float _2358 = _2230;
    float _2360 = _2342;
    float _2362 = _2344;
    float _2364 = _2310;
    float _2366 = _2312;
    float _2368 = _2144;
    if (_2340)
    {
        _2354 = _2272;
    }
    float _2370 = _2354;
    float _2372 = _2370;
    if (!_2340)
    {
        float _2374 = fma(_2150, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2272);
        _2372 = _2374;
    }
    float _2376 = _2372;
    if (_2340)
    {
        _2356 = _2270;
    }
    float _2378 = _2356;
    float _2380 = _2378;
    if (!_2340)
    {
        float _2382 = fma(_2154, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2270);
        _2380 = _2382;
    }
    float _2384 = _2380;
    float _2386 = _2248 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_2340)
    {
        _2358 = _2274;
    }
    float _2388 = _2358;
    float _2390 = _2282 * _2316;
    float _2392 = _2388;
    float _2394 = _2320;
    if (!_2340)
    {
        float _2396 = fma(_2156, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2274);
        _2392 = _2396;
    }
    float _2398 = _2392;
    float _2400 = _2276 * _2316;
    float _2402 = _2298 * _2316;
    float _2404 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2386);
    float _2406 = fma(_2250, _2314, _2390);
    float _2408 = _2314 * _2272;
    float _2410 = _2318 * _2270;
    float _2412 = _2316 * _2274;
    bool _2414 = _2352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2416 = fma(_2252, _2314, _2400);
    float _2418 = fma(_2254, _2314, _2402);
    float _2420 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2404);
    float _2422 = -_2408;
    float _2424 = fma(_2316, _2270, _2422);
    float _2426 = -_2410;
    float _2428 = fma(_2314, _2274, _2426);
    float _2430 = -_2412;
    float _2432 = fma(_2318, _2272, _2430);
    float _2434 = fma(_2336, _2318, _2406);
    float _2436 = fma(_2346, _2318, _2416);
    float _2438 = fma(_2348, _2318, _2418);
    float _2440 = _2420 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2442 = _2428 * _2320;
    float _2444 = _2432 * _2320;
    float _2446 = _2424 * _2320;
    float _2448 = _1244 + _2440;
    float _2450 = _2444;
    if (!_2414)
    {
        _2394 = _2448;
    }
    float _2452 = _2394;
    bool _2454 = !_2414;
    float _2456 = _2452;
    if (!_2454)
    {
        float _2458 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2462 = _2352 + _2460;
        float _2464 = _2448 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2466 = rsqrt(_2350);
        float _2468 = _2462 * _2458;
        float _2470 = _2468 * 0.15915493667125701904296875;
        float _2472 = _2470 * 6.283185482025146484375;
        float _2474 = sin(_2472);
        float _2476 = _2470 * 6.283185482025146484375;
        float _2478 = cos(_2476);
        float _2480 = fma(_2474, _2464, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2482 = _2466 * _2480;
        float _2484 = fma(_2330, _2482, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2486 = _2478 + (-1.0);
        float _2488 = fma(_2334, _2482, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2490 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2492 = _2484 + _2490;
        float _2494 = _2486 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2498 = _2488 + _2496;
        float _2500 = _2492 * _2492;
        float _2502 = fma(_2448, _2478, _2494);
        float _2504 = _2498 * _2498;
        _2456 = _2502;
        _2360 = _2500;
        _2362 = _2504;
        _2364 = _2484;
        _2366 = _2488;
    }
    float _2506 = _2456;
    float _2508 = _2360;
    float _2510 = _2362;
    float _2512 = _2364;
    float _2514 = _2366;
    float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2518 = _2506 + _2516;
    float _2520 = _2276 * _2376;
    float _2522 = _2298 * _2376;
    float _2524 = _2442 * _2282;
    float _2526 = fma(_2518, _2518, _2508);
    float _2528 = _2442 * _2276;
    float _2530 = _2282 * _2376;
    float _2532 = _2442 * _2298;
    float _2534 = _2526 + _2510;
    float _2536 = fma(_2252, _2384, _2520);
    float _2538 = fma(_2254, _2384, _2522);
    float _2540 = fma(_2444, _2250, _2524);
    float _2542 = fma(_2444, _2252, _2528);
    float _2544 = fma(_2250, _2384, _2530);
    float _2546 = sqrt(_2534);
    float _2548 = fma(_2444, _2254, _2532);
    float _2550 = fma(_2346, _2398, _2536);
    float _2552 = fma(_2446, _2336, _2540);
    float _2554 = fma(_2446, _2346, _2542);
    float _2556 = fma(_2336, _2398, _2544);
    float _2558 = fma(_2348, _2398, _2538);
    float _2560 = fma(_2446, _2348, _2548);
    out.m_77.x = _2434;
    out.m_77.y = _2436;
    out.m_77.z = _2438;
    out.m_79.x = _2556;
    out.m_79.y = _2550;
    out.m_79.z = _2558;
    out.m_81.x = _2552;
    out.m_81.y = _2554;
    out.m_81.z = _2560;
    bool _2562 = _2546 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2564 = isnan(_2546);
    bool _2566 = _2562 || _2564;
    bool _2568 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2570 = _2566 || _2568;
    if (!_2570)
    {
        _2450 = 1.0;
    }
    float _2572 = _2450;
    bool _2574 = !_2570;
    float _2576 = _2572;
    if (!_2574)
    {
        bool _2578 = _2546 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2580 = isnan(_2546);
        bool _2582 = _2578 || _2580;
        bool _2584 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2586 = _2582 || _2584;
        if (!_2586)
        {
            float _2588 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2590 = _2546 + _2588;
            float _2592 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2594 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2592;
            float _2596 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2598 = _2596 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2600 = 1.0 / _2594;
            float _2602 = _2590 * _2600;
            float _2604 = fma(_2602, _2598, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2576 = _2604;
            _2606 = true;
        }
        else
        {
            bool _2608 = _2546 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2610 = isnan(_2546);
            bool _2612 = _2608 || _2610;
            bool _2614 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2616 = _2612 || _2614;
            if (!_2616)
            {
                float _2618 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2620 = _2546 + _2618;
                float _2622 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2624 = _2622 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2626 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2628 = _2626 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2630 = 1.0 / _2624;
                float _2632 = _2620 * _2630;
                float _2634 = fma(_2632, _2628, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2576 = _2634;
                _2606 = true;
            }
            else
            {
                _2576 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2606 = false;
    float _2636 = _2576;
    float _2638 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2640 = _2512 + _2638;
    float _2642 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2644 = _2506 + _2642;
    bool _2646 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2648 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2650 = _2646 || _2648;
    bool _2652 = isnan(0.5);
    bool _2654 = _2650 || _2652;
    float _2656 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2658 = _2514 + _2656;
    float _2660 = fma(_2640, _2636, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2662 = fma(_2644, _2636, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2664 = fma(_2658, _2636, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2666 = -_1900;
    float _2668 = fma(_2666, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2660);
    float _2670 = -_1890;
    float _2672 = fma(_2670, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2662);
    float _2674 = -_1938;
    float _2676 = fma(_2674, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2664);
    float _2678 = _2672;
    float _2680 = _2668;
    float _2682 = _2676;
    float _2684 = _2662;
    if (!_2654)
    {
        float _2686 = _2050 * _2050;
        float _2688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2690 = -_1262;
        float _2692 = _2690 + _2660;
        float _2694 = -_1244;
        float _2696 = _2694 + _2662;
        float _2698 = fma(_2054, _2054, _2686);
        float _2700 = -_1264;
        float _2702 = _2700 + _2664;
        float _2704 = fma(_2060, _2060, _2698);
        float _2706 = 1.0 / _2144;
        float _2708 = sqrt(_2704);
        float _2710 = precise::min(_2708, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2712 = _2710 * _2688;
        float _2714 = _2712 * _2706;
        float _2716 = fma(_2692, _2714, _2040);
        float _2718 = fma(_2696, _2714, _2036);
        float _2720 = fma(_2702, _2714, _2046);
        _2678 = _2718;
        _2680 = _2716;
        _2682 = _2720;
    }
    float _2722 = _2678;
    float _2724 = _2680;
    float _2726 = _2682;
    float _2728 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2730 = _2722 + _2728;
    float _2732 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2734 = _2724 + _2732;
    float _2736 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2738 = _2726 + _2736;
    float _2740 = _2730 * _2730;
    float _2742 = fma(_2734, _2734, _2740);
    float _2744 = fma(_2738, _2738, _2742);
    float _2746 = rsqrt(_2744);
    float _2748 = sqrt(_2744);
    float _2750 = _2746 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2752 = _2734 * _2750;
    float _2754 = _2738 * _2750;
    float _2756 = _2752 * _2752;
    float _2758 = _2754 * _2754;
    float _2760 = _2756 + _2758;
    float _2762 = sqrt(_2760);
    bool _2764 = _2762 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2766 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2768 = _2762 + _2766;
    float _2770 = _2738;
    float _2772 = _2746;
    float _2774 = _2768;
    float _2776 = _2730;
    float _2778 = _2752;
    if (_2764)
    {
        float _2780 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2770 = _2780;
    }
    float _2782 = _2770;
    if (_2764)
    {
        float _2784 = rsqrt(_2760);
        _2772 = _2784;
    }
    float _2786 = _2772;
    float _2788 = _2786;
    if (_2764)
    {
        float _2790 = _2768 * _2782;
        _2774 = _2790;
    }
    float _2792 = _2774;
    if (_2764)
    {
        float _2794 = _2792 * 0.15915493667125701904296875;
        _2684 = _2794;
    }
    float _2796 = _2684;
    float _2798 = _2782;
    float _2800 = _2796;
    if (_2764)
    {
        float _2802 = _2796 * 6.283185482025146484375;
        float _2804 = sin(_2802);
        _2798 = _2804;
    }
    float _2806 = _2798;
    float _2808 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2810 = precise::max(0.0, _2808);
    float _2812 = _2558;
    float _2814 = _2810;
    if (_2764)
    {
        float _2816 = _2796 * 6.283185482025146484375;
        float _2818 = cos(_2816);
        _2812 = _2818;
    }
    float _2820 = _2812;
    float _2822 = -_2750;
    float _2824 = -_2810;
    float _2826 = fma(_2730, _2822, _2824);
    if (!_2764)
    {
        _2776 = _2756;
    }
    float _2828 = _2776;
    float _2830 = _2828;
    if (_2764)
    {
        float _2832 = _2826 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2814 = _2832;
    }
    float _2834 = _2814;
    float _2836 = _2806;
    float _2838 = _2834;
    if (_2764)
    {
        float _2840 = fma(_2806, _2834, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2836 = _2840;
    }
    float _2842 = _2836;
    float _2844 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2846 = _2842;
    if (_2764)
    {
        float _2848 = _2820 + (-1.0);
        _2838 = _2848;
    }
    float _2850 = _2838;
    float _2852 = _2850;
    if (_2764)
    {
        float _2854 = _2786 * _2842;
        _2368 = _2854;
    }
    float _2856 = _2368;
    if (!_2764)
    {
        _2788 = _2826;
    }
    float _2858 = _2788;
    float _2860 = _2858;
    if (_2764)
    {
        float _2862 = _2850 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2800 = _2862;
    }
    float _2864 = _2800;
    if (_2764)
    {
        float _2866 = _2752 * _2856;
        _2778 = _2866;
    }
    float _2868 = _2778;
    if (!_2764)
    {
        _2846 = _2754;
    }
    float _2870 = _2846;
    float _2872 = _2870;
    if (_2764)
    {
        float _2874 = _2754 * _2856;
        _2872 = _2874;
    }
    float _2876 = _2872;
    if (_2764)
    {
        float _2878 = fma(_2826, _2820, _2864);
        _2860 = _2878;
    }
    float _2880 = _2860;
    if (_2764)
    {
        float _2882 = _2868 * _2868;
        _2830 = _2882;
    }
    float _2884 = _2830;
    if (!_2764)
    {
        _2852 = _2758;
    }
    float _2886 = _2852;
    float _2888 = _2886;
    if (_2764)
    {
        float _2890 = _2876 * _2876;
        _2888 = _2890;
    }
    float _2892 = _2888;
    float _2894 = fma(_2880, _2880, _2884);
    float _2896 = _2722 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2898 = _2894 + _2892;
    float _2900 = _2722 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2902 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2904 = fma(_2748, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2902);
    float _2906 = precise::clamp(_2904, 0.0, 1.0);
    float _2908 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2896);
    float _2910 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2900);
    float _2912 = _2722 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2914 = rsqrt(_2898);
    float _2916 = -_2906;
    float _2918 = _2916 + 1.0;
    float _2920 = fma(_2726, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2910);
    float _2922 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2912);
    float _2924 = _2722 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2926 = fma(_2726, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2908);
    float _2928 = _2920 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2930 = fma(_2726, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2922);
    float _2932 = abs(_2918);
    float _2934 = log2(_2932);
    float _2936 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2924);
    float _2938 = _2928 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2940 = _2930 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2942 = _2926 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2944 = fma(_2726, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2936);
    float _2946 = -_2938;
    float _2948 = fma(_2946, _2844, 1.0);
    float _2950 = _2940 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2952 = _2914 * _2868;
    float _2954 = _2944 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2956 = _2914 * _2880;
    float _2958 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2950);
    float _2960 = _2952 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2962 = _2914 * _2876;
    float _2964 = _2940 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2966 = fma(_2928, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2958);
    float _2968 = _2934 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2970 = -_2960;
    float _2972 = fma(_2956, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2970);
    float _2974 = log2(_2948);
    float _2976 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2966);
    float _2978 = _2940 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2980 = -_2962;
    float _2982 = fma(_2980, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2972);
    float _2984 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2964);
    float _2986 = _2956 + 1.0;
    float _2988 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2978);
    float _2990 = fma(_2982, -0.5, 0.5);
    float _2992 = exp2(_2968);
    float _2994 = fma(_2982, 0.5, 0.5);
    float _2996 = fma(_2928, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2984);
    float _2998 = fma(_2928, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2988);
    float _3000 = fma(_2994, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3002 = 1.0 / _2976;
    float _3004 = fma(_2994, _3000, -0.212114393711090087890625);
    float _3006 = _2974 * 0.693147182464599609375;
    float _3008 = fma(_2994, _3004, 1.570728778839111328125);
    float _3010 = _3006 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3012 = sqrt(_2990);
    float _3014 = -_2956;
    float _3016 = fma(_2992, _2986, _3014);
    float _3018 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2996);
    float _3020 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2998);
    float _3022 = fma(_3016, 0.5, 0.5);
    float _3024 = _3018 * _3002;
    float _3026 = _3020 * _3002;
    float _3028 = fma(_3024, 0.5, 0.5);
    float _3030 = fma(_3026, -0.5, 0.5);
    float _3032 = _3012 * 0.636619746685028076171875;
    float3 _7903 = float3(_3028, _3030, _3010);
    float _3034 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7903, float3(0.0), isnan(_7903)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7903, float3(0.0), isnan(_7903)), level(0.0)).x;
    float3 _7914 = float3(_3028, _3030, _3010);
    float4 _3037 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7914, float3(0.0), isnan(_7914)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7914, float3(0.0), isnan(_7914)), level(0.0)).xyzw;
    float _3039 = _3037.x;
    float _3041 = _3037.y;
    float _3043 = _3037.z;
    float _3045 = _3037.w;
    float _3047 = -_3008;
    float _3049 = fma(_3032, _3047, 1.0);
    float2 _7936 = float2(_3049, _3022);
    float3 _3053 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7936, float2(0.0), isnan(_7936)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7936, float2(0.0), isnan(_7936)), level(0.0)).xyz;
    float _3055 = _3053.x;
    float _3057 = _3053.y;
    float _3059 = _3053.z;
    float _3061 = _2934 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3063 = _2940 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3065 = _248 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3067 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3063);
    float _3069 = exp2(_3061);
    float _3071 = _3065 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3073 = fma(_2928, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3067);
    float _3075 = _3018 + _2976;
    float _3077 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3073);
    float _3079 = _3075 * 0.5;
    float _3081 = _2976 * 0.5;
    out.m_47.x = _3071;
    float _3083 = _3077 + _2976;
    out.gl_Position.x = _3018;
    out.gl_Position.y = _3020;
    out.gl_Position.z = _3077;
    out.gl_Position.w = _2976;
    float _3085 = -_3069;
    float _3087 = _3085 + 1.0;
    float _3089 = fma(_3020, -0.5, _3081);
    float _3091 = _3083 * 0.5;
    float _3093 = _3087 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _3079;
    out.m_83.y = _3089;
    out.m_83.z = _3091;
    out.m_83.w = _2976;
    float _3095 = _3093 * _3034;
    float _3097 = -_3093;
    float _3099 = _3097 + 1.0;
    float _3101 = _3045 * _3095;
    float _3103 = _3059 * _3095;
    float _3105 = fma(_3055, _3101, _3039);
    float _3107 = fma(_3057, _3101, _3041);
    float _3109 = _3045 * _3099;
    float _3111 = fma(_3045, _3103, _3043);
    out.m_85.x = _3105;
    out.m_85.y = _3107;
    out.m_85.z = _3111;
    out.m_85.w = _3109;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

