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
    float4 m_69 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_85 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
    float4 m_83 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_57 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_44 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_75 [[attribute(8)]];
    float4 m_71 [[attribute(9)]];
    float4 m_59 [[attribute(10)]];
    float4 m_73 [[attribute(11)]];
    float4 m_61 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2423 = false;
    bool _442 = false;
    bool _226 = false;
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
    float _112 = as_type<float>(_104);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2723 = as_type<float>(_120);
        out.gl_Position.z = _2723;
    }
    if (!_108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_49.w;
    float _126 = float(_104);
    float _128 = -_124;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_124);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    bool _142 = _130 >= _126;
    bool _144 = !_140;
    bool _146 = _142 || _144;
    float _148 = _130;
    if (_146)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _112;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _152 = _150 * 5.0;
        _122 = as_type<int>(_152);
    }
    int _154 = _122;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2787 = as_type<float>(_154);
        out.gl_Position.z = _2787;
    }
    if (_146)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _156 = in.m_51.x;
    float _158 = in.m_51.y;
    float _160 = in.m_51.z;
    float _162 = 1.0 / _126;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _166 = in.m_53.x;
    float _168 = in.m_53.y;
    float _170 = in.m_53.z;
    float _172 = in.m_55.x;
    float _174 = in.m_55.y;
    float _176 = in.m_55.z;
    float _178 = in.m_57.x;
    float _180 = in.m_57.y;
    float _182 = in.m_57.z;
    float _184 = _158 * _168;
    float _186 = _158 * _174;
    float _188 = fma(_156, _166, _184);
    float _190 = _158 * _180;
    float _192 = fma(_156, _172, _186);
    float _194 = fma(_160, _170, _188);
    float _196 = fma(_156, _178, _190);
    float _198 = fma(_160, _176, _192);
    float _200 = fma(_160, _182, _196);
    float _202 = _130 * _162;
    bool _204 = !_164;
    float _206 = _194;
    float _224;
    if (!_204)
    {
        float _208 = in.m_59.x;
        float _210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _212 = _208 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _214 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _216 = _214 * _210;
        float _218 = floor(_216);
        float _220 = -_218;
        float _222 = _216 + _220;
        _224 = _222;
        _226 = true;
    }
    else
    {
        _224 = _202;
    }
    _226 = false;
    float _228 = _224;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = _228 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _228 + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _240 = _228 + _238;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _246 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _250;
    float _254 = 1.0 / _244;
    bool _256 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _258 = isnan(_228);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _264 = _260 || _262;
    float _266 = float(_264);
    bool _268 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _270 = 1.0 / _248;
    float _272 = 1.0 / _252;
    float _274 = _232 * _254;
    bool _276 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _278 = isnan(_228);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _288;
    float _292 = -_286;
    float _294 = _292 + 1.0;
    float _296 = _236 * _270;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _302;
    float _306 = fma(_290, _274, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _308 = fma(_300, _274, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _310 = fma(_304, _274, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _312 = _240 * _272;
    bool _314 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _316 = isnan(_228);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    bool _326 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _328 = isnan(_228);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _342 = -_324;
    float _344 = _342 + 1.0;
    float _346 = _336 * _294;
    float _348 = -_336;
    float _350 = _348 + 1.0;
    float _352 = _266 * _344;
    float _354 = -_266;
    float _356 = _354 + 1.0;
    float _358 = fma(_340, _296, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _360 = _324 * _350;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = _306 * _352;
    float _368 = _308 * _352;
    float _370 = _310 * _352;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _376 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].x, _366);
    float _378 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].y, _368);
    float _380 = fma(_374, _296, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _382 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].z, _370);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _388;
    float _392 = fma(_364, _296, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _394;
    float _398 = fma(_358, _360, _376);
    float _400 = fma(_386, _312, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _402 = fma(_390, _312, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _404 = fma(_380, _360, _378);
    float _406 = fma(_396, _312, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _408 = fma(_392, _360, _382);
    float _410 = fma(_400, _346, _398);
    float _412 = fma(_402, _346, _404);
    float _414 = fma(_406, _346, _408);
    float _416 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[146].x, _410);
    float _418 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[146].y, _412);
    float _420 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[146].z, _414);
    bool _422 = !_268;
    float _440;
    if (!_422)
    {
        float _424 = in.m_59.x;
        float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _428 = _424 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _432 = _430 * _426;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = true;
    }
    else
    {
        _440 = _202;
    }
    _442 = false;
    float _444 = _440;
    float _446 = in.m_44.x;
    float _448 = in.m_44.y;
    float _450 = in.m_44.z;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _454 = _444 + _452;
    float _456 = in.m_61.x;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _460 = _458 != 0;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _464 = _444 + _462;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _468 = _466 != 0;
    float _470 = in.m_55.w;
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _474 = _472 != 0;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _478 = _476 != 0;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _482 = _480 != 0;
    float _484 = 0.0;
    bool _486 = false;
    if (_460)
    {
        float _488 = in.m_59.x;
        _484 = _488;
    }
    float _490 = _484;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _496 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _498 = _168 * _448;
    float _500 = _174 * _448;
    float _502 = _180 * _448;
    float _504 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _506 = fma(_166, _446, _498);
    float _508 = fma(_172, _446, _500);
    float _510 = fma(_178, _446, _502);
    float _512 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _504);
    float _514 = in.m_59.x;
    float _516 = in.m_59.y;
    float _518 = in.m_59.z;
    float _520 = 1.0 / _494;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _534 = 1.0 / _524;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _542 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _496);
    float _544 = fma(_176, _450, _508);
    float _546 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _548 = 1.0 / _528;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _552 = _536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _554 = _538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = _540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _558 = _518 * 2.0;
    float _560 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _546);
    float _562 = 1.0 / _532;
    float _564 = in.m_61.y;
    float _566 = fma(_170, _450, _506);
    float _568 = fma(_182, _450, _510);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _570;
    float _574 = _450;
    float _576 = _524;
    if (!_460)
    {
        _574 = _456;
    }
    float _578 = _574;
    out.m_63.x = _552;
    out.m_63.y = _554;
    out.m_63.z = _556;
    out.m_63.w = _550;
    float _580 = floor(_558);
    float _582 = _572 * _534;
    float _584 = _578;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[118].x);
    if (!_460)
    {
        _576 = _578;
    }
    float _588 = _576;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _594 = _588;
    if (_460)
    {
        _584 = _456;
    }
    float _596 = _584;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _602 = _592 * _520;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _604;
    float _608 = _600 * _562;
    if (_460)
    {
        float _610 = -_596;
        float _612 = _610 + 1.0;
        _586 = as_type<int>(_612);
    }
    int _614 = _586;
    float _616 = fma(_518, 0.0199999995529651641845703125, -0.00999999977648258209228515625);
    float _618 = _514 * 2.0;
    float _620 = _516 + _518;
    float _622 = _518 + _514;
    float _624 = _518 + (-0.5);
    float _626 = _516 * 2.0;
    if (_460)
    {
        bool _628 = _490 > 0.5;
        _486 = _628;
    }
    bool _630 = _486;
    float _632 = floor(_618);
    float _634 = _516 + _514;
    float _636 = _606 * _548;
    float _638 = _634 + (-1.0);
    if (_460)
    {
        float _640 = _630 ? as_type<float>(_614) : _596;
        _594 = _640;
    }
    float _642 = _594;
    float _644 = fma(0.00150000001303851604461669921875, _514, 0.00349999987520277500152587890625);
    bool _646 = _580 > 0.0;
    float _648 = floor(_626);
    bool _650 = _580 >= 0.0;
    bool _652 = isnan(_580);
    bool _654 = _650 || _652;
    bool _656 = isnan(0.0);
    bool _658 = _654 || _656;
    float _660 = _514 + (-0.5);
    float _662 = -_564;
    float _664 = _662 + 1.0;
    float _666 = _616 * _130;
    float _668 = _620 + (-1.0);
    bool _670 = _516 > 0.5;
    float _672 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _674 = _516 + (-0.5);
    float _676 = fma(_516, 6.283185482025146484375, _666);
    float _678 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _680 = _658 ? 0 : 1;
    float _682 = in.m_53.w;
    int _684 = _670 ? as_type<int>(_664) : as_type<int>(_564);
    float _686 = fma(_582, _454, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _688 = _544 + _470;
    bool _690 = _632 > 0.0;
    float _692 = fma(_636, _464, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _694 = _632 >= 0.0;
    bool _696 = isnan(_632);
    bool _698 = _694 || _696;
    bool _700 = isnan(0.0);
    bool _702 = _698 || _700;
    float _704 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _512);
    bool _706 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _708 = isnan(_444);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _560);
    float _720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _722 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _724 = isnan(_444);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = -_716;
    float _736 = _734 + 1.0;
    int _738 = ~_680;
    int _740 = _738 + 1;
    int _742 = _740 + 1;
    float _744 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _542);
    int _746 = _742;
    float _748 = _688;
    if (!_646)
    {
        int _750 = ~_680;
        int _752 = _750 + 1;
        _746 = _752;
    }
    int _754 = _746;
    float _756 = -_732;
    float _758 = _756 + 1.0;
    int _760 = _702 ? 0 : 1;
    float _762 = _732 * _736;
    bool _764 = _648 > 0.0;
    float _766 = in.m_57.w;
    bool _768 = _648 >= 0.0;
    bool _770 = isnan(_648);
    bool _772 = _768 || _770;
    bool _774 = isnan(0.0);
    bool _776 = _772 || _774;
    float _778 = _676 * (-0.01745329238474369049072265625);
    bool _780 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _782 = isnan(_444);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _794 = log2(_792);
    bool _796 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _798 = isnan(_444);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    float _808 = _778 * 0.15915493667125701904296875;
    bool _810 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _812 = isnan(_444);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = _790 * _758;
    float _824 = -_790;
    float _826 = _824 + 1.0;
    float _828 = -_806;
    float _830 = _828 + 1.0;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _834 = _444 + _832;
    float _836 = _468 ? as_type<float>(_684) : _564;
    float _838 = _806 * _826;
    float _840 = _820 * _830;
    float _842 = _808 * 6.283185482025146484375;
    float _844 = cos(_842);
    float _846 = fma(_602, _834, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _848 = -_820;
    float _850 = _848 + 1.0;
    float _852 = _686 * _840;
    float _854 = _566 + _682;
    int _856 = ~_760;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _864 = _444 + _862;
    float _866 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[115].x, _852);
    float _868 = _808 * 6.283185482025146484375;
    float _870 = sin(_868);
    float _872 = _568 + _766;
    bool _874 = !_478;
    int _876 = _874 ? 0 : 1;
    float _878 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _880 = _688 + _878;
    int _882 = _860;
    if (!_690)
    {
        int _884 = ~_760;
        int _886 = _884 + 1;
        _882 = _886;
    }
    int _888 = _882;
    float _890 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _892 = _854 + _890;
    int _894 = abs(_876);
    float _896 = _880 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _898 = _844 * _564;
    float _900 = fma(_846, _838, _866);
    bool _902 = !_474;
    int _904 = _902 ? 0 : 1;
    float _906 = fma(_608, _864, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _908 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _910 = _872 + _908;
    float _912 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _914 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[28].x, _896);
    float _916 = fma(_692, _822, _900);
    float _918 = fma(_870, _596, _898);
    float _920 = _794 * _130;
    int _922 = abs(_904);
    float _924 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[28].z, _914);
    float _926 = _836 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _928 = float(_922);
    float _930 = exp2(_920);
    float _932 = float(_754);
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _936 = 1.0 + _934;
    bool _938 = _924 >= 0.0;
    float _940 = fma(_906, _762, _916);
    bool _942 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _944 = isnan(1.0);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _950 = _946 || _948;
    float _952 = _928 * _932;
    float _954 = _642 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _956 = 1.0 / _936;
    float _958 = float(_894);
    float _960 = _926 * _720;
    float _962 = float(_888);
    float _964 = _954 * _912;
    float _966 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[119].x, _940);
    bool _968 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _970 = isnan(0.0);
    bool _972 = _968 || _970;
    bool _974 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _976 = _972 || _974;
    float _978 = _880 * _880;
    float _980 = -_930;
    float _982 = _980 + 1.0;
    float _984 = _958 * _962;
    out.m_65.x = _964;
    out.m_65.y = _960;
    float _986 = fma(_892, _892, _978);
    float _988 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[194].w, _130);
    float _990 = rsqrt(_704);
    float _992 = fma(_910, _910, _986);
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _998 = _960;
    int _1000 = as_type<int>(_982);
    if (_938)
    {
        _998 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1002 = _998;
    float _1004 = _976 ? _982 : 0.0;
    float _1006 = rsqrt(_992);
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    if (_938)
    {
        float _1010 = _1002 * 5.0;
        _1000 = as_type<int>(_1010);
    }
    int _1012 = _1000;
    float _1014 = _994 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_950)
    {
        float _1016 = _1004 * _956;
        _148 = _1016;
    }
    float _1018 = _148;
    float _1020 = _996 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1022 = in.m_67.x;
    float _1024 = in.m_67.y;
    float _1026 = in.m_67.z;
    float _1028 = _1008 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1030 = rsqrt(_718);
    float _1032 = _966 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_938)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4184 = as_type<float>(_1012);
        out.gl_Position.z = _4184;
    }
    bool _1034 = !_482;
    int _1036 = _1034 ? 0 : 1;
    float _1038 = _676 * 0.15915493667125701904296875;
    out.m_69.x = _1014;
    out.m_69.y = _1020;
    out.m_69.z = _1028;
    out.m_69.w = _1032;
    float _1040 = rsqrt(_744);
    float _1042 = _880 * _1006;
    if (_938)
    {
        out.m_47.x = 0.0;
    }
    float _1044 = _892 * _1006;
    if (_938)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1046 = -_1042;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _688);
    float _1050 = _952 * (-2.0);
    float _1052 = _910 * _1006;
    float _1054 = -_1044;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[18].w, _854);
    float _1058 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1060 = _1048 + _1058;
    float _1062 = fma(_1050, _1022, _1022);
    float _1064 = _984 * (-2.0);
    float _1066 = -_1052;
    float _1068 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[18].w, _872);
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1072 = _1056 + _1070;
    float _1074 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1076 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1062);
    float _1078 = fma(_678, _1064, _678);
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1082 = _1068 + _1080;
    float _1084 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1074);
    float _1086 = fma(_1064, _1024, _1024);
    int _1088 = _776 ? 0 : 1;
    float _1090 = fma(_672, _1050, _672);
    float _1092 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1084);
    float _1094 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1086);
    int _1096 = ~_1088;
    int _1098 = _1096 + 1;
    int _1100 = _1098 + 1;
    float _1102 = fma(_1090, _1018, _1076);
    int _1104 = abs(_1036);
    float _1106 = -_1042;
    float _1108 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[18].w, _880);
    int _1110 = _1100;
    float _1112 = _1102;
    if (!_764)
    {
        int _1114 = ~_1088;
        int _1116 = _1114 + 1;
        _1110 = _1116;
    }
    int _1118 = _1110;
    float _1120 = fma(_1078, _1018, _1094);
    bool _1122 = _1092 >= 0.0;
    float _1124 = _1102 * 0.15915493667125701904296875;
    float _1126 = _622 + (-1.0);
    float _1128 = float(_1104);
    float _1130 = -_1044;
    float _1132 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[18].w, _892);
    float _1134 = float(_1118);
    float _1136 = _1108 * _1108;
    float _1138 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1140 = _1124 * 6.283185482025146484375;
    float _1142 = sin(_1140);
    float _1144 = _1120 * 0.15915493667125701904296875;
    float _1146 = _1128 * _1134;
    float _1148 = fma(_1132, _1132, _1136);
    float _1150 = in.m_71.x;
    float _1152 = in.m_71.y;
    float _1154 = in.m_71.z;
    if (_1122)
    {
        _1112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1156 = _1112;
    float _1158 = _1146 * (-2.0);
    float _1160 = -_1052;
    float _1162 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[18].w, _910);
    float _1164 = _1124 * 6.283185482025146484375;
    float _1166 = cos(_1164);
    int _1168 = as_type<int>(_1156);
    if (_1122)
    {
        float _1170 = _1156 * 5.0;
        _1168 = as_type<int>(_1170);
    }
    int _1172 = _1168;
    if (_1122)
    {
        out.m_47.x = 0.0;
    }
    if (_1122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4425 = as_type<float>(_1172);
        out.gl_Position.z = _4425;
    }
    float _1174 = _1038 * 6.283185482025146484375;
    float _1176 = sin(_1174);
    float _1178 = in.m_73.x;
    float _1180 = in.m_73.y;
    float _1182 = in.m_73.z;
    float _1184 = _1038 * 6.283185482025146484375;
    float _1186 = cos(_1184);
    float _1188 = _1144 * 6.283185482025146484375;
    float _1190 = sin(_1188);
    float _1192 = _1144 * 6.283185482025146484375;
    float _1194 = cos(_1192);
    if (_1122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1196 = -_688;
    float _1198 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1200 = fma(_1158, _1026, _1026);
    float _1202 = -_854;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1206 = -_872;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1210 = _1198 * _1198;
    float _1212 = fma(_1138, _1158, _1138);
    float _1214 = fma(_1162, _1162, _1148);
    float _1216 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1200);
    float _1218 = fma(_1204, _1204, _1210);
    float _1220 = _202 * 0.001000000047497451305389404296875;
    float _1222 = _420 * _1182;
    float _1224 = sqrt(_1214);
    float _1226 = fma(_1208, _1208, _1218);
    float _1228 = fma(_1212, _1018, _1216);
    float _1230 = _988 * _1220;
    float _1232 = _1040 * _1154;
    float _1234 = _418 * _1180;
    float _1236 = _1222 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1238 = fma(_1230, -0.1500000059604644775390625, _644);
    float _1240 = rsqrt(_1226);
    float _1242 = _1186 * _1152;
    float _1244 = _988 * _1238;
    float _1246 = _1142 * _1194;
    float _1248 = fma(_1176, _1150, _1242);
    float _1250 = _1228 * 0.15915493667125701904296875;
    float _1252 = _1176 * _1152;
    float _1254 = _1006 * _1224;
    float _1256 = fma(_1244, 5.0, _1248);
    float _1258 = _416 * _1178;
    float _1260 = _1250 * 6.283185482025146484375;
    float _1262 = sin(_1260);
    float _1264 = -_1252;
    float _1266 = fma(_1186, _1150, _1264);
    float _1268 = _1142 * _1190;
    float _1270 = _1166 * _1194;
    float _1272 = _1256 + 0.100000001490116119384765625;
    float _1274 = _1204 * _1240;
    float _1276 = _1208 * _1240;
    float _1278 = _1198 * _1240;
    float _1280 = _1250 * 6.283185482025146484375;
    float _1282 = cos(_1280);
    float _1284 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1286 = _1274 * _1284;
    float _1288 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1290 = _1276 * _1288;
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1294 = _1278 * _1292;
    float _1296 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1298 = -_1286;
    float _1300 = fma(_1276, _1296, _1298);
    float _1302 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1304 = -_1290;
    float _1306 = fma(_1278, _1302, _1304);
    float _1308 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1310 = -_1294;
    float _1312 = fma(_1274, _1308, _1310);
    float _1314 = fma(_1262, _1270, _1268);
    float _1316 = _1300 * _1300;
    float _1318 = fma(_1262, _1268, _1270);
    float _1320 = _1272 * _1030;
    float _1322 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1324 = fma(_1306, _1306, _1316);
    float _1326 = _1266 * _990;
    float _1328 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1320);
    float _1330 = _1254 * _1322;
    float _1332 = fma(_1312, _1312, _1324);
    float _1334 = _1258 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1336 = _1142 * _1282;
    float _1338 = _1328 * _1330;
    float _1340 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1326);
    float _1342 = _1254 * _1334;
    float _1344 = rsqrt(_1332);
    float _1346 = _1166 * _1190;
    float _1348 = _1166 * _1282;
    float _1350 = _1194 * _1282;
    float _1352 = _1190 * _1282;
    float _1354 = _1254 * _1236;
    float _1356 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1232);
    float _1358 = _1340 * _1342;
    float _1360 = _1348 * _1338;
    float _1362 = -_1346;
    float _1364 = fma(_1262, _1246, _1362);
    float _1366 = _1356 * _1354;
    float _1368 = -_1246;
    float _1370 = fma(_1262, _1346, _1368);
    float _1372 = -_1338;
    float _1374 = _1262 * _1372;
    float _1376 = fma(_1314, _1358, _1360);
    float _1378 = _1336 * _1338;
    float _1380 = _1306 * _1344;
    float _1382 = _1300 * _1344;
    float _1384 = fma(_1350, _1358, _1374);
    float _1386 = _1312 * _1344;
    float _1388 = _1278 * _1380;
    float _1390 = fma(_1370, _1366, _1376);
    float _1392 = _1276 * _1382;
    float _1394 = fma(_1364, _1358, _1378);
    float _1396 = -_1388;
    float _1398 = fma(_1274, _1382, _1396);
    float _1400 = fma(_1352, _1366, _1384);
    float _1402 = -_1392;
    float _1404 = fma(_1278, _1386, _1402);
    float _1406 = fma(_1318, _1366, _1394);
    float _1408 = _1398 * _1390;
    float _1410 = _1274 * _1386;
    float _1412 = _1404 * _1390;
    float _1414 = fma(_1386, _1400, _1408);
    float _1416 = -_1410;
    float _1418 = fma(_1276, _1380, _1416);
    float _1420 = fma(_1380, _1400, _1412);
    float _1422 = fma(_1276, _1406, _1414);
    float _1424 = _1418 * _1390;
    float _1426 = fma(_1274, _1406, _1420);
    float _1428 = _872 + _1422;
    float _1430 = fma(_1382, _1400, _1424);
    float _1432 = _854 + _1426;
    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1436 = _1428 + _1434;
    float _1438 = fma(_1278, _1406, _1430);
    float _1440 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1442 = _1432 + _1440;
    float _1444 = _1436 * _1436;
    float _1446 = _688 + _1438;
    float _1448 = fma(_1442, _1442, _1444);
    float _1450 = sqrt(_1448);
    bool _1452 = _1450 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1454 = _1444;
    float _1456 = _1400;
    float _1458 = _1438;
    if (!_1452)
    {
        _1454 = _1432;
    }
    float _1460 = _1454;
    float _1462 = _1460;
    if (!_1452)
    {
        _1456 = _1428;
    }
    float _1464 = _1456;
    float _1466 = _1464;
    if (!_1452)
    {
        _1458 = _1446;
    }
    float _1468 = _1458;
    bool _1470 = !_1452;
    float _1472 = _1468;
    if (!_1470)
    {
        float _1474 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1476 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1478 = _1450 + _1476;
        float _1480 = rsqrt(_1448);
        float _1482 = _1478 * _1474;
        float _1484 = _1446 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1486 = _1482 * 0.15915493667125701904296875;
        float _1488 = _1486 * 6.283185482025146484375;
        float _1490 = cos(_1488);
        float _1492 = _1486 * 6.283185482025146484375;
        float _1494 = sin(_1492);
        float _1496 = _1490 + (-1.0);
        float _1498 = fma(_1494, _1484, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1500 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1502 = _1480 * _1498;
        float _1504 = fma(_1446, _1490, _1500);
        float _1506 = fma(_1442, _1502, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1508 = fma(_1436, _1502, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1472 = _1504;
        _1462 = _1506;
        _1466 = _1508;
    }
    float _1510 = _1472;
    float _1512 = _1462;
    float _1514 = _1466;
    float _1516 = -_688;
    float _1518 = _1516 + _1510;
    float _1520 = -_854;
    float _1522 = _1520 + _1512;
    float _1524 = -_872;
    float _1526 = _1524 + _1514;
    float _1528 = _1518 * _1518;
    bool _1530 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1532 = isnan(0.5);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1538 = _1534 || _1536;
    bool _1540 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1542 = isnan(0.5);
    bool _1544 = _1540 || _1542;
    bool _1546 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1548 = _1544 || _1546;
    float _1550 = fma(_1522, _1522, _1528);
    float _1552 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1554 = fma(_1526, _1526, _1550);
    float _1556 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1552);
    float _1558 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1560 = sqrt(_1554);
    float _1562 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1556);
    float _1564 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1558);
    float _1566 = _1562 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1568 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1564);
    float _1570 = _1568 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1572 = _1570 + _1566;
    bool _1574 = _1560 > 0.0;
    float _1576 = 1.0 / _1566;
    bool _1578 = !_1574;
    float _1580 = _1510;
    float _1582 = _1512;
    float _1584 = _1514;
    float _1586 = _1518;
    float _1588 = _1572;
    if (!_1578)
    {
        float _1590 = _198 * _198;
        float _1592 = rsqrt(_1554);
        float _1594 = fma(_194, _194, _1590);
        float _1596 = fma(_200, _200, _1594);
        float _1598 = sqrt(_1596);
        float _1600 = _1522 * _1592;
        float _1602 = _1526 * _1592;
        bool _1604 = _1598 > 0.0;
        float _1606 = _1518 * _1592;
        bool _1608 = !_1604;
        if (!_1608)
        {
            float _1610 = rsqrt(_1596);
            float _1612 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1614 = _198 * _1610;
            float _1616 = _194 * _1610;
            float _1618 = _1606 * _1614;
            float _1620 = _200 * _1610;
            float _1622 = fma(_1600, _1616, _1618);
            float _1624 = _1612 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1626 = fma(_1602, _1620, _1622);
            float _1628 = _1626 * _1624;
            float _1630 = fma(_194, _1628, _1512);
            float _1632 = fma(_198, _1628, _1510);
            float _1634 = fma(_200, _1628, _1514);
            _1580 = _1632;
            _1582 = _1630;
            _1584 = _1634;
            _1586 = _1616;
        }
    }
    float _1636 = _1580;
    float _1638 = _1582;
    float _1640 = _1584;
    float _1642 = _1586;
    float _1644 = -_1042;
    float _1646 = fma(_1644, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1636);
    float _1648 = _1572 * _1576;
    float _1650 = _1648 * 0.5;
    float _1652 = -_1044;
    float _1654 = fma(_1652, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1638);
    float _1656 = -_1052;
    float _1658 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1640);
    float _1660 = _1654;
    float _1662 = _1658;
    float _1664 = _1636;
    float _1666 = _1642;
    if (_1548)
    {
        _206 = 1.0;
    }
    float _1668 = _206;
    float _1670 = _1668;
    if (_1538)
    {
        _1588 = _1646;
    }
    float _1672 = _1588;
    float _1674 = _1672;
    if (!_1538)
    {
        float _1676 = _1060 * _1060;
        float _1678 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1680 = -_872;
        float _1682 = _1680 + _1640;
        float _1684 = -_854;
        float _1686 = _1684 + _1638;
        float _1688 = fma(_1072, _1072, _1676);
        float _1690 = -_688;
        float _1692 = _1690 + _1636;
        float _1694 = fma(_1082, _1082, _1688);
        float _1696 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1698 = sqrt(_1694);
        float _1700 = 1.0 / _1254;
        float _1702 = precise::min(_1698, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1704 = _1702 * _1678;
        float _1706 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1708 = _1704 * _1700;
        float _1710 = _1706 * _1708;
        float _1712 = _1682 * _1708;
        float _1714 = fma(_1686, _1710, _1056);
        float _1716 = fma(_1692, _1710, _1048);
        float _1718 = fma(_1706, _1712, _1068);
        _1674 = _1716;
        _1660 = _1714;
        _1662 = _1718;
        _748 = _1692;
    }
    float _1720 = _1674;
    float _1722 = _1660;
    float _1724 = _1662;
    float _1726 = _748;
    float _1728 = _1726;
    if (!_1548)
    {
        float _1730 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1732 = _1730 * 0.15915493667125701904296875;
        float _1734 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1736 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1738 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1736);
        float _1740 = _1732 * 6.283185482025146484375;
        float _1742 = cos(_1740);
        float _1744 = _1734 * 0.15915493667125701904296875;
        float _1746 = _1732 * 6.283185482025146484375;
        float _1748 = sin(_1746);
        float _1750 = 1.0 / _1742;
        float _1752 = _1744 * 6.283185482025146484375;
        float _1754 = cos(_1752);
        float _1756 = _1748 * _1750;
        float _1758 = _1744 * 6.283185482025146484375;
        float _1760 = sin(_1758);
        float _1762 = _1754 * _1756;
        float _1764 = 1.0 / _1738;
        float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1768 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1766;
        float _1770 = 1.0 / _1762;
        float _1772 = 1.0 / _1768;
        float _1774 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1776 = _1764 * _1774;
        float _1778 = _1760 * _1770;
        float _1780 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1782 = fma(_1778, _1776, _1780);
        float _1784 = _1782 * _1772;
        float _1786 = precise::clamp(_1784, 0.0, 1.0);
        _1664 = _1744;
        _1666 = _1732;
        _1670 = _1786;
    }
    float _1788 = _1664;
    float _1790 = _1666;
    float _1792 = _1670;
    float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1796 = _1720 + _1794;
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1800 = _1722 + _1798;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1804 = _1724 + _1802;
    float _1806 = _1796 * _1796;
    float _1808 = fma(_1800, _1800, _1806);
    float _1810 = fma(_1804, _1804, _1808);
    float _1812 = rsqrt(_1810);
    float _1814 = sqrt(_1810);
    float _1816 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1818 = _1800 * _1816;
    float _1820 = _1804 * _1816;
    float _1822 = _1818 * _1818;
    float _1824 = _1820 * _1820;
    float _1826 = _1822 + _1824;
    float _1828 = sqrt(_1826);
    bool _1830 = _1828 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1832 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1834 = _1828 + _1832;
    float _1836 = _1804;
    float _1838 = _1826;
    float _1840 = _1834;
    float _1842 = _1788;
    float _1844 = _1796;
    float _1846 = _1790;
    if (_1830)
    {
        float _1848 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1836 = _1848;
    }
    float _1850 = _1836;
    if (_1830)
    {
        float _1852 = rsqrt(_1826);
        _1838 = _1852;
    }
    float _1854 = _1838;
    float _1856 = _1854;
    if (_1830)
    {
        float _1858 = _1834 * _1850;
        _1840 = _1858;
    }
    float _1860 = _1840;
    if (_1830)
    {
        float _1862 = _1860 * 0.15915493667125701904296875;
        _1842 = _1862;
    }
    float _1864 = _1842;
    float _1866 = _1850;
    if (_1830)
    {
        float _1868 = _1864 * 6.283185482025146484375;
        float _1870 = sin(_1868);
        _1866 = _1870;
    }
    float _1872 = _1866;
    float _1874 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1876 = precise::max(0.0, _1874);
    float _1878 = _1812;
    float _1880 = _1876;
    if (_1830)
    {
        float _1882 = _1864 * 6.283185482025146484375;
        float _1884 = cos(_1882);
        _1878 = _1884;
    }
    float _1886 = _1878;
    float _1888 = -_1816;
    float _1890 = -_1876;
    float _1892 = fma(_1796, _1888, _1890);
    if (_1830)
    {
        float _1894 = _1892 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1880 = _1894;
    }
    float _1896 = _1880;
    float _1898 = _1896;
    float _1900 = _1872;
    if (_1830)
    {
        float _1902 = fma(_1872, _1896, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1898 = _1902;
    }
    float _1904 = _1898;
    float _1906 = _1904;
    if (!_1830)
    {
        _1900 = _1818;
    }
    float _1908 = _1900;
    float _1910 = _1908;
    float _1912 = _1886;
    if (_1830)
    {
        float _1914 = _1886 + (-1.0);
        _1844 = _1914;
    }
    float _1916 = _1844;
    float _1918 = _1916;
    if (_1830)
    {
        float _1920 = _1854 * _1904;
        _1728 = _1920;
    }
    float _1922 = _1728;
    if (!_1830)
    {
        _1906 = _1892;
    }
    float _1924 = _1906;
    float _1926 = _1924;
    if (_1830)
    {
        float _1928 = _1916 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1846 = _1928;
    }
    float _1930 = _1846;
    if (_1830)
    {
        float _1932 = _1818 * _1922;
        _1910 = _1932;
    }
    float _1934 = _1910;
    if (!_1830)
    {
        _1918 = _1820;
    }
    float _1936 = _1918;
    float _1938 = _1936;
    if (_1830)
    {
        float _1940 = _1820 * _1922;
        _1938 = _1940;
    }
    float _1942 = _1938;
    if (!_1830)
    {
        _1856 = _1822;
    }
    float _1944 = _1856;
    float _1946 = _1944;
    if (_1830)
    {
        float _1948 = fma(_1892, _1886, _1930);
        _1926 = _1948;
    }
    float _1950 = _1926;
    if (_1830)
    {
        float _1952 = _1934 * _1934;
        _1946 = _1952;
    }
    float _1954 = _1946;
    if (!_1830)
    {
        _1912 = _1824;
    }
    float _1956 = _1912;
    float _1958 = _1956;
    if (_1830)
    {
        float _1960 = _1942 * _1942;
        _1958 = _1960;
    }
    float _1962 = _1958;
    float _1964 = fma(_1950, _1950, _1954);
    float _1966 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1968 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1970 = _1964 + _1962;
    float _1972 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1966);
    float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1976 = fma(_1814, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1974);
    float _1978 = precise::clamp(_1976, 0.0, 1.0);
    float _1980 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1982 = rsqrt(_1970);
    float _1984 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1972);
    float _1986 = -_1978;
    float _1988 = _1986 + 1.0;
    float _1990 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1992 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1980);
    float _1994 = _1984 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1996 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1998 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1990);
    float _2000 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1992);
    float _2002 = abs(_1988);
    float _2004 = log2(_2002);
    float _2006 = _1994 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2008 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1998);
    float _2010 = _2000 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2012 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1996);
    float _2014 = -_2006;
    float _2016 = fma(_2014, _1968, 1.0);
    float _2018 = _2008 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2020 = _1982 * _1934;
    float _2022 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2024 = _1982 * _1950;
    float _2026 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2012);
    float _2028 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2030 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2022);
    float _2032 = _1982 * _1942;
    float _2034 = _2026 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2036 = -_2028;
    float _2038 = fma(_2024, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2036);
    float _2040 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2030);
    float _2042 = _2004 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2044 = log2(_2016);
    float _2046 = -_2032;
    float _2048 = fma(_2046, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2038);
    float _2050 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2040);
    float _2052 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2054 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2056 = fma(_2048, -0.5, 0.5);
    float _2058 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2052);
    float _2060 = exp2(_2042);
    float _2062 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2054);
    float _2064 = fma(_2048, 0.5, 0.5);
    float _2066 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2058);
    float _2068 = _2024 + 1.0;
    float _2070 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2062);
    float _2072 = fma(_2064, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2074 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2066);
    float _2076 = 1.0 / _2050;
    float _2078 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2070);
    float _2080 = fma(_2064, _2072, -0.212114393711090087890625);
    float _2082 = _2044 * 0.693147182464599609375;
    float _2084 = fma(_2064, _2080, 1.570728778839111328125);
    float _2086 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2088 = sqrt(_2056);
    float _2090 = -_2024;
    float _2092 = fma(_2060, _2068, _2090);
    float _2094 = _2074 * _2076;
    float _2096 = _2078 * _2076;
    float _2098 = fma(_2094, 0.5, 0.5);
    float _2100 = fma(_2096, -0.5, 0.5);
    float _2102 = _2088 * 0.636619746685028076171875;
    float3 _5882 = float3(_2098, _2100, _2086);
    float _2104 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5882, float3(0.0), isnan(_5882)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5882, float3(0.0), isnan(_5882)), level(0.0)).x;
    float _2106 = -_2084;
    float _2108 = fma(_2102, _2106, 1.0);
    float _2110 = fma(_2092, 0.5, 0.5);
    float3 _5900 = float3(_2098, _2100, _2086);
    float4 _2113 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5900, float3(0.0), isnan(_5900)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5900, float3(0.0), isnan(_5900)), level(0.0)).xyzw;
    float _2115 = _2113.x;
    float _2117 = _2113.y;
    float _2119 = _2113.z;
    float _2121 = _2113.w;
    float2 _5917 = float2(_2108, _2110);
    float3 _2125 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5917, float2(0.0), isnan(_5917)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5917, float2(0.0), isnan(_5917)), level(0.0)).xyz;
    float _2127 = _2125.x;
    float _2129 = _2125.y;
    float _2131 = _2125.z;
    float _2133 = _1348 * _1404;
    float _2135 = _1348 * _1418;
    float _2137 = _1348 * _1398;
    float _2139 = _1314 * _1404;
    float _2141 = _1314 * _1418;
    float _2143 = _1314 * _1398;
    bool _2145 = _1320 != 0.0;
    bool _2147 = isnan(_1320);
    bool _2149 = _2145 || _2147;
    bool _2151 = isnan(0.0);
    bool _2153 = _2149 || _2151;
    float _2155 = _2004 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2157 = in.m_75.x;
    float _2159 = in.m_75.y;
    float _2161 = in.m_75.z;
    float _2163 = _1370 * _1398;
    bool _2165 = _1326 == 0.0;
    bool _2167 = !_2153;
    bool _2169 = _2165 && _2167;
    float _2171 = _1370 * _1404;
    float _2173 = _1370 * _1418;
    float _2175 = exp2(_2155);
    bool _2177 = _1232 == 0.0;
    bool _2179 = _2177 && _2169;
    float _2181 = -_1262;
    float _2183 = fma(_2181, _1382, _2135);
    float _2185 = -_1262;
    float _2187 = fma(_2185, _1380, _2133);
    float _2189 = -_1262;
    float _2191 = fma(_2189, _1386, _2137);
    float _2193 = fma(_1350, _1380, _2139);
    float _2195 = fma(_1350, _1382, _2141);
    float _2197 = fma(_1350, _1386, _2143);
    float _2199 = fma(_1352, _1386, _2163);
    float _2201 = fma(_1336, _1278, _2183);
    float _2203 = fma(_1352, _1380, _2171);
    float _2205 = fma(_1352, _1382, _2173);
    float _2207 = fma(_1364, _1274, _2193);
    float _2209 = fma(_1364, _1278, _2195);
    float _2211 = fma(_1336, _1276, _2191);
    float _2213 = fma(_1364, _1276, _2197);
    float _2215 = fma(_1318, _1276, _2199);
    float _2217 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2219 = fma(_1336, _1274, _2187);
    float _2221 = _2159;
    float _2223 = _2157;
    float _2225 = _2161;
    float _2227 = _2207;
    float _2229 = _2050;
    float _2231 = _2078;
    float _2233 = _2074;
    if (!_2179)
    {
        float _2235 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2159);
        _2221 = _2235;
    }
    float _2237 = _2221;
    if (!_2179)
    {
        float _2239 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2157);
        _2223 = _2239;
    }
    float _2241 = _2223;
    float _2243 = fma(_1318, _1278, _2205);
    if (!_2179)
    {
        float _2245 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2161);
        _2225 = _2245;
    }
    float _2247 = _2225;
    float _2249 = _2201 * _2237;
    float _2251 = -_2175;
    float _2253 = _2251 + 1.0;
    float _2255 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2217);
    float _2257 = _2219 * _2237;
    float _2259 = fma(_2209, _2241, _2249);
    float _2261 = _2211 * _2237;
    float _2263 = _2050 * 0.5;
    float _2265 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2255);
    float _2267 = fma(_2243, _2247, _2259);
    float _2269 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2271 = fma(_2078, -0.5, _2263);
    float _2273 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2265);
    float _2275 = fma(_1318, _1274, _2203);
    float _2277 = fma(_2207, _2241, _2257);
    float _2279 = fma(_2213, _2241, _2261);
    float _2281 = _2273 + _2050;
    float _2283 = _2074 + _2050;
    float _2285 = fma(_2275, _2247, _2277);
    float _2287 = fma(_2215, _2247, _2279);
    float _2289 = _2281 * 0.5;
    float _2291 = _2283 * 0.5;
    bool _2293 = _1814 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2295 = isnan(_1814);
    bool _2297 = _2293 || _2295;
    bool _2299 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2301 = _2297 || _2299;
    out.m_77.x = _2285;
    out.m_77.y = _2267;
    out.m_77.z = _2287;
    out.m_79.x = _2291;
    out.m_79.y = _2271;
    out.m_79.z = _2289;
    out.m_79.w = _2050;
    out.gl_Position.x = _2074;
    out.gl_Position.y = _2078;
    out.gl_Position.z = _2273;
    out.gl_Position.w = _2050;
    float _2303 = _2273;
    if (!_2301)
    {
        _2227 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2305 = _2227;
    float _2307 = _2305;
    float _2309 = _2305;
    if (!_2301)
    {
        _2229 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2311 = _2229;
    float _2313 = _2311;
    float _2315 = _2311;
    if (!_2301)
    {
        _2303 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2317 = _2303;
    float _2319 = _2317;
    float _2321 = _2317;
    if (!_2301)
    {
        _2231 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2323 = _2231;
    float _2325 = _2323;
    float _2327 = _2323;
    if (!_2301)
    {
        _2233 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2329 = _2233;
    float _2331 = _2269 * _2104;
    float _2333 = -_2269;
    float _2335 = _2333 + 1.0;
    float _2337 = _2121 * _2331;
    float _2339 = _2121 * _2335;
    float _2341 = _2131 * _2331;
    float _2343 = fma(_2127, _2337, _2115);
    float _2345 = fma(_2129, _2337, _2117);
    float _2347 = _2115;
    float _2349 = _2329;
    float _2351 = _2329;
    if (!_2301)
    {
        _2347 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2353 = _2347;
    float _2355 = fma(_2121, _2341, _2119);
    out.m_81.x = _2343;
    out.m_81.y = _2345;
    out.m_81.z = _2355;
    out.m_81.w = _2339;
    bool _2357 = !_2301;
    float _2359 = _2353;
    float _2361 = _2353;
    if (!_2357)
    {
        bool _2363 = _1814 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2365 = isnan(_1814);
        bool _2367 = _2363 || _2365;
        bool _2369 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2371 = _2367 || _2369;
        if (!_2371)
        {
            float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2375 = _1814 + _2373;
            float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2379 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2377;
            float _2381 = 1.0 / _2379;
            float _2383 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2385 = _2383 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2387 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2389 = _2387 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2391 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2403 = _2375 * _2381;
            float _2405 = precise::clamp(_2403, 0.0, 1.0);
            float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2409 = _2407 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2411 = fma(_2405, _2385, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2413 = fma(_2405, _2409, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2415 = fma(_2405, _2389, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2417 = fma(_2405, _2393, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2419 = fma(_2405, _2397, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2421 = fma(_2405, _2401, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2361 = _2413;
            _2327 = _2419;
            _2309 = _2411;
            _2321 = _2417;
            _2315 = _2415;
            _2351 = _2421;
            _2423 = true;
        }
        else
        {
            bool _2425 = _1814 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2427 = isnan(_1814);
            bool _2429 = _2425 || _2427;
            bool _2431 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2433 = _2429 || _2431;
            if (!_2433)
            {
                _2307 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2435 = _2307;
            _2309 = _2435;
            if (!_2433)
            {
                _2359 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2437 = _2359;
            _2361 = _2437;
            if (!_2433)
            {
                _2313 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2439 = _2313;
            _2315 = _2439;
            if (!_2433)
            {
                _2319 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2441 = _2319;
            _2321 = _2441;
            if (!_2433)
            {
                _2325 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2443 = _2325;
            _2327 = _2443;
            if (!_2433)
            {
                _2349 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2445 = _2349;
            bool _2447 = !_2433;
            _2351 = _2445;
            if (!_2447)
            {
                bool _2449 = _1814 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2451 = isnan(_1814);
                bool _2453 = _2449 || _2451;
                bool _2455 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2457 = _2453 || _2455;
                if (!_2457)
                {
                    float _2459 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2461 = _1814 + _2459;
                    float _2463 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2465 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2463;
                    float _2467 = 1.0 / _2465;
                    float _2469 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2471 = _2469 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2473 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2475 = _2473 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2477 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2479 = _2477 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2481 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2483 = _2481 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2487 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2489 = _2461 * _2467;
                    float _2491 = precise::clamp(_2489, 0.0, 1.0);
                    float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2497 = fma(_2491, _2471, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2499 = fma(_2491, _2495, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2501 = fma(_2491, _2475, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2503 = fma(_2491, _2479, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2505 = fma(_2491, _2483, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2507 = fma(_2491, _2487, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2361 = _2499;
                    _2327 = _2505;
                    _2309 = _2497;
                    _2321 = _2503;
                    _2315 = _2501;
                    _2351 = _2507;
                    _2423 = true;
                }
                else
                {
                    _2361 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2327 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2309 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2321 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2315 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2351 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2423 = false;
    float _2509 = _2361;
    float _2511 = _2327;
    float _2513 = _2309;
    float _2515 = _2321;
    float _2517 = _2315;
    float _2519 = _2351;
    float _2521 = fma(_2267, -0.5, 0.5);
    float _2523 = precise::clamp(_2521, 0.0, 1.0);
    float _2525 = -_2509;
    float _2527 = _2525 + _2511;
    float _2529 = _1792 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2531 = -_2513;
    float _2533 = _2531 + _2515;
    float _2535 = fma(_2523, _2527, _2509);
    out.m_83.x = 0.0;
    float _2537 = -_2517;
    float _2539 = _2537 + _2519;
    float _2541 = fma(_2523, _2533, _2513);
    float _2543 = _2535 * 0.586610972881317138671875;
    out.m_47.x = _2529;
    bool _2545 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2547 = fma(_2523, _2539, _2517);
    float _2549 = fma(_2541, 0.298911988735198974609375, _2543);
    bool _2551 = _1792 > 0.0;
    bool _2553 = isnan(_1792);
    bool _2555 = _2551 || _2553;
    bool _2557 = isnan(0.0);
    bool _2559 = _2555 || _2557;
    float _2561 = fma(_2547, 0.114477999508380889892578125, _2549);
    float _2563 = -_2561;
    float _2565 = _2541 + _2563;
    float _2567 = -_2561;
    float _2569 = _2535 + _2567;
    float _2571 = -_2561;
    float _2573 = _2547 + _2571;
    float _2575 = fma(_2565, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2561);
    float _2577 = fma(_2569, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2561);
    float _2579 = fma(_2573, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2561);
    bool _2581 = !_2545;
    if (!_2581)
    {
        float _2583 = -_1720;
        float _2585 = _2583 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2587 = -_1722;
        float _2589 = _2587 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2591 = -_1724;
        float _2593 = _2591 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2595 = _2585 * _2585;
        float _2597 = fma(_2589, _2589, _2595);
        float _2599 = fma(_2593, _2593, _2597);
        float _2601 = sqrt(_2599);
        float _2603 = rsqrt(_2599);
        float _2605 = -_2601;
        float _2607 = _2605 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2609 = _2607 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2611 = precise::clamp(_2609, 0.0, 1.0);
        float _2613 = _2589 * _2603;
        float _2615 = _2585 * _2603;
        float _2617 = abs(_2611);
        float _2619 = log2(_2617);
        float _2621 = _2593 * _2603;
        float _2623 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2625 = _2267 * _2615;
        float _2627 = -_2615;
        float _2629 = -_2623;
        float _2631 = fma(_2627, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2629);
        float _2633 = fma(_2285, _2613, _2625);
        float _2635 = -_2621;
        float _2637 = fma(_2635, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2631);
        float _2639 = fma(_2287, _2621, _2633);
        float _2641 = precise::clamp(_2639, 0.0, 1.0);
        float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2645 = _2637 + _2643;
        float _2647 = _2619 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2649 = _2645 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2651 = precise::clamp(_2649, 0.0, 1.0);
        float _2653 = exp2(_2647);
        float _2655 = _2653 * _2651;
        float _2657 = _2641 * _2655;
        float _2659 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2661 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2663 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_83.x = _2659;
        out.m_83.y = _2661;
        out.m_83.z = _2663;
    }
    out.m_85.x = _2575;
    out.m_85.y = _2577;
    out.m_85.z = _2579;
    if (_2559)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2665 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2665;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2423 = false;
    bool _442 = false;
    bool _226 = false;
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
    float _112 = as_type<float>(_104);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2723 = as_type<float>(_120);
        out.gl_Position.z = _2723;
    }
    if (!_108)
    {
        return out;
    }
    float _124 = in.m_49.w;
    float _126 = float(_104);
    float _128 = -_124;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_124);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    bool _142 = _130 >= _126;
    bool _144 = !_140;
    bool _146 = _142 || _144;
    float _148 = _130;
    if (_146)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _112;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _152 = _150 * 5.0;
        _122 = as_type<int>(_152);
    }
    int _154 = _122;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2787 = as_type<float>(_154);
        out.gl_Position.z = _2787;
    }
    if (_146)
    {
        return out;
    }
    float _156 = in.m_51.x;
    float _158 = in.m_51.y;
    float _160 = in.m_51.z;
    float _162 = 1.0 / _126;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _166 = in.m_53.x;
    float _168 = in.m_53.y;
    float _170 = in.m_53.z;
    float _172 = in.m_55.x;
    float _174 = in.m_55.y;
    float _176 = in.m_55.z;
    float _178 = in.m_57.x;
    float _180 = in.m_57.y;
    float _182 = in.m_57.z;
    float _184 = _158 * _168;
    float _186 = _158 * _174;
    float _188 = fma(_156, _166, _184);
    float _190 = _158 * _180;
    float _192 = fma(_156, _172, _186);
    float _194 = fma(_160, _170, _188);
    float _196 = fma(_156, _178, _190);
    float _198 = fma(_160, _176, _192);
    float _200 = fma(_160, _182, _196);
    float _202 = _130 * _162;
    bool _204 = !_164;
    float _206 = _194;
    float _224;
    if (!_204)
    {
        float _208 = in.m_59.x;
        float _210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _212 = _208 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _214 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _216 = _214 * _210;
        float _218 = floor(_216);
        float _220 = -_218;
        float _222 = _216 + _220;
        _224 = _222;
        _226 = true;
    }
    else
    {
        _224 = _202;
    }
    _226 = false;
    float _228 = _224;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = _228 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _228 + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _240 = _228 + _238;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _246 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _250;
    float _254 = 1.0 / _244;
    bool _256 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _258 = isnan(_228);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _264 = _260 || _262;
    float _266 = float(_264);
    bool _268 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _270 = 1.0 / _248;
    float _272 = 1.0 / _252;
    float _274 = _232 * _254;
    bool _276 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _278 = isnan(_228);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _288;
    float _292 = -_286;
    float _294 = _292 + 1.0;
    float _296 = _236 * _270;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _302;
    float _306 = fma(_290, _274, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _308 = fma(_300, _274, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _310 = fma(_304, _274, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _312 = _240 * _272;
    bool _314 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _316 = isnan(_228);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    bool _326 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _328 = isnan(_228);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _342 = -_324;
    float _344 = _342 + 1.0;
    float _346 = _336 * _294;
    float _348 = -_336;
    float _350 = _348 + 1.0;
    float _352 = _266 * _344;
    float _354 = -_266;
    float _356 = _354 + 1.0;
    float _358 = fma(_340, _296, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _360 = _324 * _350;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = _306 * _352;
    float _368 = _308 * _352;
    float _370 = _310 * _352;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _376 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].x, _366);
    float _378 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].y, _368);
    float _380 = fma(_374, _296, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _382 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].z, _370);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _388;
    float _392 = fma(_364, _296, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _394;
    float _398 = fma(_358, _360, _376);
    float _400 = fma(_386, _312, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _402 = fma(_390, _312, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _404 = fma(_380, _360, _378);
    float _406 = fma(_396, _312, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _408 = fma(_392, _360, _382);
    float _410 = fma(_400, _346, _398);
    float _412 = fma(_402, _346, _404);
    float _414 = fma(_406, _346, _408);
    float _416 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[146].x, _410);
    float _418 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[146].y, _412);
    float _420 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[146].z, _414);
    bool _422 = !_268;
    float _440;
    if (!_422)
    {
        float _424 = in.m_59.x;
        float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _428 = _424 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _432 = _430 * _426;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = true;
    }
    else
    {
        _440 = _202;
    }
    _442 = false;
    float _444 = _440;
    float _446 = in.m_44.x;
    float _448 = in.m_44.y;
    float _450 = in.m_44.z;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _454 = _444 + _452;
    float _456 = in.m_61.x;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _460 = _458 != 0;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _464 = _444 + _462;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _468 = _466 != 0;
    float _470 = in.m_55.w;
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _474 = _472 != 0;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _478 = _476 != 0;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _482 = _480 != 0;
    float _484 = 0.0;
    bool _486 = false;
    if (_460)
    {
        float _488 = in.m_59.x;
        _484 = _488;
    }
    float _490 = _484;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _496 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _498 = _168 * _448;
    float _500 = _174 * _448;
    float _502 = _180 * _448;
    float _504 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _506 = fma(_166, _446, _498);
    float _508 = fma(_172, _446, _500);
    float _510 = fma(_178, _446, _502);
    float _512 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _504);
    float _514 = in.m_59.x;
    float _516 = in.m_59.y;
    float _518 = in.m_59.z;
    float _520 = 1.0 / _494;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _534 = 1.0 / _524;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _542 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _496);
    float _544 = fma(_176, _450, _508);
    float _546 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _548 = 1.0 / _528;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _552 = _536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _554 = _538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = _540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _558 = _518 * 2.0;
    float _560 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _546);
    float _562 = 1.0 / _532;
    float _564 = in.m_61.y;
    float _566 = fma(_170, _450, _506);
    float _568 = fma(_182, _450, _510);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _570;
    float _574 = _450;
    float _576 = _524;
    if (!_460)
    {
        _574 = _456;
    }
    float _578 = _574;
    out.m_63.x = _552;
    out.m_63.y = _554;
    out.m_63.z = _556;
    out.m_63.w = _550;
    float _580 = floor(_558);
    float _582 = _572 * _534;
    float _584 = _578;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[118].x);
    if (!_460)
    {
        _576 = _578;
    }
    float _588 = _576;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _594 = _588;
    if (_460)
    {
        _584 = _456;
    }
    float _596 = _584;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _602 = _592 * _520;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _604;
    float _608 = _600 * _562;
    if (_460)
    {
        float _610 = -_596;
        float _612 = _610 + 1.0;
        _586 = as_type<int>(_612);
    }
    int _614 = _586;
    float _616 = fma(_518, 0.0199999995529651641845703125, -0.00999999977648258209228515625);
    float _618 = _514 * 2.0;
    float _620 = _516 + _518;
    float _622 = _518 + _514;
    float _624 = _518 + (-0.5);
    float _626 = _516 * 2.0;
    if (_460)
    {
        bool _628 = _490 > 0.5;
        _486 = _628;
    }
    bool _630 = _486;
    float _632 = floor(_618);
    float _634 = _516 + _514;
    float _636 = _606 * _548;
    float _638 = _634 + (-1.0);
    if (_460)
    {
        float _640 = _630 ? as_type<float>(_614) : _596;
        _594 = _640;
    }
    float _642 = _594;
    float _644 = fma(0.00150000001303851604461669921875, _514, 0.00349999987520277500152587890625);
    bool _646 = _580 > 0.0;
    float _648 = floor(_626);
    bool _650 = _580 >= 0.0;
    bool _652 = isnan(_580);
    bool _654 = _650 || _652;
    bool _656 = isnan(0.0);
    bool _658 = _654 || _656;
    float _660 = _514 + (-0.5);
    float _662 = -_564;
    float _664 = _662 + 1.0;
    float _666 = _616 * _130;
    float _668 = _620 + (-1.0);
    bool _670 = _516 > 0.5;
    float _672 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _674 = _516 + (-0.5);
    float _676 = fma(_516, 6.283185482025146484375, _666);
    float _678 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _680 = _658 ? 0 : 1;
    float _682 = in.m_53.w;
    int _684 = _670 ? as_type<int>(_664) : as_type<int>(_564);
    float _686 = fma(_582, _454, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _688 = _544 + _470;
    bool _690 = _632 > 0.0;
    float _692 = fma(_636, _464, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _694 = _632 >= 0.0;
    bool _696 = isnan(_632);
    bool _698 = _694 || _696;
    bool _700 = isnan(0.0);
    bool _702 = _698 || _700;
    float _704 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _512);
    bool _706 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _708 = isnan(_444);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _560);
    float _720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _722 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _724 = isnan(_444);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = -_716;
    float _736 = _734 + 1.0;
    int _738 = ~_680;
    int _740 = _738 + 1;
    int _742 = _740 + 1;
    float _744 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _542);
    int _746 = _742;
    float _748 = _688;
    if (!_646)
    {
        int _750 = ~_680;
        int _752 = _750 + 1;
        _746 = _752;
    }
    int _754 = _746;
    float _756 = -_732;
    float _758 = _756 + 1.0;
    int _760 = _702 ? 0 : 1;
    float _762 = _732 * _736;
    bool _764 = _648 > 0.0;
    float _766 = in.m_57.w;
    bool _768 = _648 >= 0.0;
    bool _770 = isnan(_648);
    bool _772 = _768 || _770;
    bool _774 = isnan(0.0);
    bool _776 = _772 || _774;
    float _778 = _676 * (-0.01745329238474369049072265625);
    bool _780 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _782 = isnan(_444);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _794 = log2(_792);
    bool _796 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _798 = isnan(_444);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    float _808 = _778 * 0.15915493667125701904296875;
    bool _810 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _812 = isnan(_444);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = _790 * _758;
    float _824 = -_790;
    float _826 = _824 + 1.0;
    float _828 = -_806;
    float _830 = _828 + 1.0;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _834 = _444 + _832;
    float _836 = _468 ? as_type<float>(_684) : _564;
    float _838 = _806 * _826;
    float _840 = _820 * _830;
    float _842 = _808 * 6.283185482025146484375;
    float _844 = cos(_842);
    float _846 = fma(_602, _834, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _848 = -_820;
    float _850 = _848 + 1.0;
    float _852 = _686 * _840;
    float _854 = _566 + _682;
    int _856 = ~_760;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _864 = _444 + _862;
    float _866 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[115].x, _852);
    float _868 = _808 * 6.283185482025146484375;
    float _870 = sin(_868);
    float _872 = _568 + _766;
    bool _874 = !_478;
    int _876 = _874 ? 0 : 1;
    float _878 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _880 = _688 + _878;
    int _882 = _860;
    if (!_690)
    {
        int _884 = ~_760;
        int _886 = _884 + 1;
        _882 = _886;
    }
    int _888 = _882;
    float _890 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _892 = _854 + _890;
    int _894 = abs(_876);
    float _896 = _880 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _898 = _844 * _564;
    float _900 = fma(_846, _838, _866);
    bool _902 = !_474;
    int _904 = _902 ? 0 : 1;
    float _906 = fma(_608, _864, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _908 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _910 = _872 + _908;
    float _912 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _914 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[28].x, _896);
    float _916 = fma(_692, _822, _900);
    float _918 = fma(_870, _596, _898);
    float _920 = _794 * _130;
    int _922 = abs(_904);
    float _924 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[28].z, _914);
    float _926 = _836 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _928 = float(_922);
    float _930 = exp2(_920);
    float _932 = float(_754);
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _936 = 1.0 + _934;
    bool _938 = _924 >= 0.0;
    float _940 = fma(_906, _762, _916);
    bool _942 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _944 = isnan(1.0);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _950 = _946 || _948;
    float _952 = _928 * _932;
    float _954 = _642 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _956 = 1.0 / _936;
    float _958 = float(_894);
    float _960 = _926 * _720;
    float _962 = float(_888);
    float _964 = _954 * _912;
    float _966 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[119].x, _940);
    bool _968 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _970 = isnan(0.0);
    bool _972 = _968 || _970;
    bool _974 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _976 = _972 || _974;
    float _978 = _880 * _880;
    float _980 = -_930;
    float _982 = _980 + 1.0;
    float _984 = _958 * _962;
    out.m_65.x = _964;
    out.m_65.y = _960;
    float _986 = fma(_892, _892, _978);
    float _988 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[194].w, _130);
    float _990 = rsqrt(_704);
    float _992 = fma(_910, _910, _986);
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _998 = _960;
    int _1000 = as_type<int>(_982);
    if (_938)
    {
        _998 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1002 = _998;
    float _1004 = _976 ? _982 : 0.0;
    float _1006 = rsqrt(_992);
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    if (_938)
    {
        float _1010 = _1002 * 5.0;
        _1000 = as_type<int>(_1010);
    }
    int _1012 = _1000;
    float _1014 = _994 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_950)
    {
        float _1016 = _1004 * _956;
        _148 = _1016;
    }
    float _1018 = _148;
    float _1020 = _996 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1022 = in.m_67.x;
    float _1024 = in.m_67.y;
    float _1026 = in.m_67.z;
    float _1028 = _1008 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1030 = rsqrt(_718);
    float _1032 = _966 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_938)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4184 = as_type<float>(_1012);
        out.gl_Position.z = _4184;
    }
    bool _1034 = !_482;
    int _1036 = _1034 ? 0 : 1;
    float _1038 = _676 * 0.15915493667125701904296875;
    out.m_69.x = _1014;
    out.m_69.y = _1020;
    out.m_69.z = _1028;
    out.m_69.w = _1032;
    float _1040 = rsqrt(_744);
    float _1042 = _880 * _1006;
    if (_938)
    {
        out.m_47.x = 0.0;
    }
    float _1044 = _892 * _1006;
    if (_938)
    {
        return out;
    }
    float _1046 = -_1042;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _688);
    float _1050 = _952 * (-2.0);
    float _1052 = _910 * _1006;
    float _1054 = -_1044;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[18].w, _854);
    float _1058 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1060 = _1048 + _1058;
    float _1062 = fma(_1050, _1022, _1022);
    float _1064 = _984 * (-2.0);
    float _1066 = -_1052;
    float _1068 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[18].w, _872);
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1072 = _1056 + _1070;
    float _1074 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1076 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1062);
    float _1078 = fma(_678, _1064, _678);
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1082 = _1068 + _1080;
    float _1084 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1074);
    float _1086 = fma(_1064, _1024, _1024);
    int _1088 = _776 ? 0 : 1;
    float _1090 = fma(_672, _1050, _672);
    float _1092 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1084);
    float _1094 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1086);
    int _1096 = ~_1088;
    int _1098 = _1096 + 1;
    int _1100 = _1098 + 1;
    float _1102 = fma(_1090, _1018, _1076);
    int _1104 = abs(_1036);
    float _1106 = -_1042;
    float _1108 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[18].w, _880);
    int _1110 = _1100;
    float _1112 = _1102;
    if (!_764)
    {
        int _1114 = ~_1088;
        int _1116 = _1114 + 1;
        _1110 = _1116;
    }
    int _1118 = _1110;
    float _1120 = fma(_1078, _1018, _1094);
    bool _1122 = _1092 >= 0.0;
    float _1124 = _1102 * 0.15915493667125701904296875;
    float _1126 = _622 + (-1.0);
    float _1128 = float(_1104);
    float _1130 = -_1044;
    float _1132 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[18].w, _892);
    float _1134 = float(_1118);
    float _1136 = _1108 * _1108;
    float _1138 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1140 = _1124 * 6.283185482025146484375;
    float _1142 = sin(_1140);
    float _1144 = _1120 * 0.15915493667125701904296875;
    float _1146 = _1128 * _1134;
    float _1148 = fma(_1132, _1132, _1136);
    float _1150 = in.m_71.x;
    float _1152 = in.m_71.y;
    float _1154 = in.m_71.z;
    if (_1122)
    {
        _1112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1156 = _1112;
    float _1158 = _1146 * (-2.0);
    float _1160 = -_1052;
    float _1162 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[18].w, _910);
    float _1164 = _1124 * 6.283185482025146484375;
    float _1166 = cos(_1164);
    int _1168 = as_type<int>(_1156);
    if (_1122)
    {
        float _1170 = _1156 * 5.0;
        _1168 = as_type<int>(_1170);
    }
    int _1172 = _1168;
    if (_1122)
    {
        out.m_47.x = 0.0;
    }
    if (_1122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4425 = as_type<float>(_1172);
        out.gl_Position.z = _4425;
    }
    float _1174 = _1038 * 6.283185482025146484375;
    float _1176 = sin(_1174);
    float _1178 = in.m_73.x;
    float _1180 = in.m_73.y;
    float _1182 = in.m_73.z;
    float _1184 = _1038 * 6.283185482025146484375;
    float _1186 = cos(_1184);
    float _1188 = _1144 * 6.283185482025146484375;
    float _1190 = sin(_1188);
    float _1192 = _1144 * 6.283185482025146484375;
    float _1194 = cos(_1192);
    if (_1122)
    {
        return out;
    }
    float _1196 = -_688;
    float _1198 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1200 = fma(_1158, _1026, _1026);
    float _1202 = -_854;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1206 = -_872;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1210 = _1198 * _1198;
    float _1212 = fma(_1138, _1158, _1138);
    float _1214 = fma(_1162, _1162, _1148);
    float _1216 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1200);
    float _1218 = fma(_1204, _1204, _1210);
    float _1220 = _202 * 0.001000000047497451305389404296875;
    float _1222 = _420 * _1182;
    float _1224 = sqrt(_1214);
    float _1226 = fma(_1208, _1208, _1218);
    float _1228 = fma(_1212, _1018, _1216);
    float _1230 = _988 * _1220;
    float _1232 = _1040 * _1154;
    float _1234 = _418 * _1180;
    float _1236 = _1222 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1238 = fma(_1230, -0.1500000059604644775390625, _644);
    float _1240 = rsqrt(_1226);
    float _1242 = _1186 * _1152;
    float _1244 = _988 * _1238;
    float _1246 = _1142 * _1194;
    float _1248 = fma(_1176, _1150, _1242);
    float _1250 = _1228 * 0.15915493667125701904296875;
    float _1252 = _1176 * _1152;
    float _1254 = _1006 * _1224;
    float _1256 = fma(_1244, 5.0, _1248);
    float _1258 = _416 * _1178;
    float _1260 = _1250 * 6.283185482025146484375;
    float _1262 = sin(_1260);
    float _1264 = -_1252;
    float _1266 = fma(_1186, _1150, _1264);
    float _1268 = _1142 * _1190;
    float _1270 = _1166 * _1194;
    float _1272 = _1256 + 0.100000001490116119384765625;
    float _1274 = _1204 * _1240;
    float _1276 = _1208 * _1240;
    float _1278 = _1198 * _1240;
    float _1280 = _1250 * 6.283185482025146484375;
    float _1282 = cos(_1280);
    float _1284 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1286 = _1274 * _1284;
    float _1288 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1290 = _1276 * _1288;
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1294 = _1278 * _1292;
    float _1296 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1298 = -_1286;
    float _1300 = fma(_1276, _1296, _1298);
    float _1302 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1304 = -_1290;
    float _1306 = fma(_1278, _1302, _1304);
    float _1308 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1310 = -_1294;
    float _1312 = fma(_1274, _1308, _1310);
    float _1314 = fma(_1262, _1270, _1268);
    float _1316 = _1300 * _1300;
    float _1318 = fma(_1262, _1268, _1270);
    float _1320 = _1272 * _1030;
    float _1322 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1324 = fma(_1306, _1306, _1316);
    float _1326 = _1266 * _990;
    float _1328 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1320);
    float _1330 = _1254 * _1322;
    float _1332 = fma(_1312, _1312, _1324);
    float _1334 = _1258 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1336 = _1142 * _1282;
    float _1338 = _1328 * _1330;
    float _1340 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1326);
    float _1342 = _1254 * _1334;
    float _1344 = rsqrt(_1332);
    float _1346 = _1166 * _1190;
    float _1348 = _1166 * _1282;
    float _1350 = _1194 * _1282;
    float _1352 = _1190 * _1282;
    float _1354 = _1254 * _1236;
    float _1356 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1232);
    float _1358 = _1340 * _1342;
    float _1360 = _1348 * _1338;
    float _1362 = -_1346;
    float _1364 = fma(_1262, _1246, _1362);
    float _1366 = _1356 * _1354;
    float _1368 = -_1246;
    float _1370 = fma(_1262, _1346, _1368);
    float _1372 = -_1338;
    float _1374 = _1262 * _1372;
    float _1376 = fma(_1314, _1358, _1360);
    float _1378 = _1336 * _1338;
    float _1380 = _1306 * _1344;
    float _1382 = _1300 * _1344;
    float _1384 = fma(_1350, _1358, _1374);
    float _1386 = _1312 * _1344;
    float _1388 = _1278 * _1380;
    float _1390 = fma(_1370, _1366, _1376);
    float _1392 = _1276 * _1382;
    float _1394 = fma(_1364, _1358, _1378);
    float _1396 = -_1388;
    float _1398 = fma(_1274, _1382, _1396);
    float _1400 = fma(_1352, _1366, _1384);
    float _1402 = -_1392;
    float _1404 = fma(_1278, _1386, _1402);
    float _1406 = fma(_1318, _1366, _1394);
    float _1408 = _1398 * _1390;
    float _1410 = _1274 * _1386;
    float _1412 = _1404 * _1390;
    float _1414 = fma(_1386, _1400, _1408);
    float _1416 = -_1410;
    float _1418 = fma(_1276, _1380, _1416);
    float _1420 = fma(_1380, _1400, _1412);
    float _1422 = fma(_1276, _1406, _1414);
    float _1424 = _1418 * _1390;
    float _1426 = fma(_1274, _1406, _1420);
    float _1428 = _872 + _1422;
    float _1430 = fma(_1382, _1400, _1424);
    float _1432 = _854 + _1426;
    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1436 = _1428 + _1434;
    float _1438 = fma(_1278, _1406, _1430);
    float _1440 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1442 = _1432 + _1440;
    float _1444 = _1436 * _1436;
    float _1446 = _688 + _1438;
    float _1448 = fma(_1442, _1442, _1444);
    float _1450 = sqrt(_1448);
    bool _1452 = _1450 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1454 = _1444;
    float _1456 = _1400;
    float _1458 = _1438;
    if (!_1452)
    {
        _1454 = _1432;
    }
    float _1460 = _1454;
    float _1462 = _1460;
    if (!_1452)
    {
        _1456 = _1428;
    }
    float _1464 = _1456;
    float _1466 = _1464;
    if (!_1452)
    {
        _1458 = _1446;
    }
    float _1468 = _1458;
    bool _1470 = !_1452;
    float _1472 = _1468;
    if (!_1470)
    {
        float _1474 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1476 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1478 = _1450 + _1476;
        float _1480 = rsqrt(_1448);
        float _1482 = _1478 * _1474;
        float _1484 = _1446 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1486 = _1482 * 0.15915493667125701904296875;
        float _1488 = _1486 * 6.283185482025146484375;
        float _1490 = cos(_1488);
        float _1492 = _1486 * 6.283185482025146484375;
        float _1494 = sin(_1492);
        float _1496 = _1490 + (-1.0);
        float _1498 = fma(_1494, _1484, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1500 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1502 = _1480 * _1498;
        float _1504 = fma(_1446, _1490, _1500);
        float _1506 = fma(_1442, _1502, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1508 = fma(_1436, _1502, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1472 = _1504;
        _1462 = _1506;
        _1466 = _1508;
    }
    float _1510 = _1472;
    float _1512 = _1462;
    float _1514 = _1466;
    float _1516 = -_688;
    float _1518 = _1516 + _1510;
    float _1520 = -_854;
    float _1522 = _1520 + _1512;
    float _1524 = -_872;
    float _1526 = _1524 + _1514;
    float _1528 = _1518 * _1518;
    bool _1530 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1532 = isnan(0.5);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1538 = _1534 || _1536;
    bool _1540 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1542 = isnan(0.5);
    bool _1544 = _1540 || _1542;
    bool _1546 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1548 = _1544 || _1546;
    float _1550 = fma(_1522, _1522, _1528);
    float _1552 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1554 = fma(_1526, _1526, _1550);
    float _1556 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1552);
    float _1558 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1560 = sqrt(_1554);
    float _1562 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1556);
    float _1564 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1558);
    float _1566 = _1562 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1568 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1564);
    float _1570 = _1568 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1572 = _1570 + _1566;
    bool _1574 = _1560 > 0.0;
    float _1576 = 1.0 / _1566;
    bool _1578 = !_1574;
    float _1580 = _1510;
    float _1582 = _1512;
    float _1584 = _1514;
    float _1586 = _1518;
    float _1588 = _1572;
    if (!_1578)
    {
        float _1590 = _198 * _198;
        float _1592 = rsqrt(_1554);
        float _1594 = fma(_194, _194, _1590);
        float _1596 = fma(_200, _200, _1594);
        float _1598 = sqrt(_1596);
        float _1600 = _1522 * _1592;
        float _1602 = _1526 * _1592;
        bool _1604 = _1598 > 0.0;
        float _1606 = _1518 * _1592;
        bool _1608 = !_1604;
        if (!_1608)
        {
            float _1610 = rsqrt(_1596);
            float _1612 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1614 = _198 * _1610;
            float _1616 = _194 * _1610;
            float _1618 = _1606 * _1614;
            float _1620 = _200 * _1610;
            float _1622 = fma(_1600, _1616, _1618);
            float _1624 = _1612 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1626 = fma(_1602, _1620, _1622);
            float _1628 = _1626 * _1624;
            float _1630 = fma(_194, _1628, _1512);
            float _1632 = fma(_198, _1628, _1510);
            float _1634 = fma(_200, _1628, _1514);
            _1580 = _1632;
            _1582 = _1630;
            _1584 = _1634;
            _1586 = _1616;
        }
    }
    float _1636 = _1580;
    float _1638 = _1582;
    float _1640 = _1584;
    float _1642 = _1586;
    float _1644 = -_1042;
    float _1646 = fma(_1644, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1636);
    float _1648 = _1572 * _1576;
    float _1650 = _1648 * 0.5;
    float _1652 = -_1044;
    float _1654 = fma(_1652, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1638);
    float _1656 = -_1052;
    float _1658 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1640);
    float _1660 = _1654;
    float _1662 = _1658;
    float _1664 = _1636;
    float _1666 = _1642;
    if (_1548)
    {
        _206 = 1.0;
    }
    float _1668 = _206;
    float _1670 = _1668;
    if (_1538)
    {
        _1588 = _1646;
    }
    float _1672 = _1588;
    float _1674 = _1672;
    if (!_1538)
    {
        float _1676 = _1060 * _1060;
        float _1678 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1680 = -_872;
        float _1682 = _1680 + _1640;
        float _1684 = -_854;
        float _1686 = _1684 + _1638;
        float _1688 = fma(_1072, _1072, _1676);
        float _1690 = -_688;
        float _1692 = _1690 + _1636;
        float _1694 = fma(_1082, _1082, _1688);
        float _1696 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1698 = sqrt(_1694);
        float _1700 = 1.0 / _1254;
        float _1702 = precise::min(_1698, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1704 = _1702 * _1678;
        float _1706 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1708 = _1704 * _1700;
        float _1710 = _1706 * _1708;
        float _1712 = _1682 * _1708;
        float _1714 = fma(_1686, _1710, _1056);
        float _1716 = fma(_1692, _1710, _1048);
        float _1718 = fma(_1706, _1712, _1068);
        _1674 = _1716;
        _1660 = _1714;
        _1662 = _1718;
        _748 = _1692;
    }
    float _1720 = _1674;
    float _1722 = _1660;
    float _1724 = _1662;
    float _1726 = _748;
    float _1728 = _1726;
    if (!_1548)
    {
        float _1730 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1732 = _1730 * 0.15915493667125701904296875;
        float _1734 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1736 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1738 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1736);
        float _1740 = _1732 * 6.283185482025146484375;
        float _1742 = cos(_1740);
        float _1744 = _1734 * 0.15915493667125701904296875;
        float _1746 = _1732 * 6.283185482025146484375;
        float _1748 = sin(_1746);
        float _1750 = 1.0 / _1742;
        float _1752 = _1744 * 6.283185482025146484375;
        float _1754 = cos(_1752);
        float _1756 = _1748 * _1750;
        float _1758 = _1744 * 6.283185482025146484375;
        float _1760 = sin(_1758);
        float _1762 = _1754 * _1756;
        float _1764 = 1.0 / _1738;
        float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1768 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1766;
        float _1770 = 1.0 / _1762;
        float _1772 = 1.0 / _1768;
        float _1774 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1776 = _1764 * _1774;
        float _1778 = _1760 * _1770;
        float _1780 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1782 = fma(_1778, _1776, _1780);
        float _1784 = _1782 * _1772;
        float _1786 = precise::clamp(_1784, 0.0, 1.0);
        _1664 = _1744;
        _1666 = _1732;
        _1670 = _1786;
    }
    float _1788 = _1664;
    float _1790 = _1666;
    float _1792 = _1670;
    float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1796 = _1720 + _1794;
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1800 = _1722 + _1798;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1804 = _1724 + _1802;
    float _1806 = _1796 * _1796;
    float _1808 = fma(_1800, _1800, _1806);
    float _1810 = fma(_1804, _1804, _1808);
    float _1812 = rsqrt(_1810);
    float _1814 = sqrt(_1810);
    float _1816 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1818 = _1800 * _1816;
    float _1820 = _1804 * _1816;
    float _1822 = _1818 * _1818;
    float _1824 = _1820 * _1820;
    float _1826 = _1822 + _1824;
    float _1828 = sqrt(_1826);
    bool _1830 = _1828 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1832 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1834 = _1828 + _1832;
    float _1836 = _1804;
    float _1838 = _1826;
    float _1840 = _1834;
    float _1842 = _1788;
    float _1844 = _1796;
    float _1846 = _1790;
    if (_1830)
    {
        float _1848 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1836 = _1848;
    }
    float _1850 = _1836;
    if (_1830)
    {
        float _1852 = rsqrt(_1826);
        _1838 = _1852;
    }
    float _1854 = _1838;
    float _1856 = _1854;
    if (_1830)
    {
        float _1858 = _1834 * _1850;
        _1840 = _1858;
    }
    float _1860 = _1840;
    if (_1830)
    {
        float _1862 = _1860 * 0.15915493667125701904296875;
        _1842 = _1862;
    }
    float _1864 = _1842;
    float _1866 = _1850;
    if (_1830)
    {
        float _1868 = _1864 * 6.283185482025146484375;
        float _1870 = sin(_1868);
        _1866 = _1870;
    }
    float _1872 = _1866;
    float _1874 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1876 = precise::max(0.0, _1874);
    float _1878 = _1812;
    float _1880 = _1876;
    if (_1830)
    {
        float _1882 = _1864 * 6.283185482025146484375;
        float _1884 = cos(_1882);
        _1878 = _1884;
    }
    float _1886 = _1878;
    float _1888 = -_1816;
    float _1890 = -_1876;
    float _1892 = fma(_1796, _1888, _1890);
    if (_1830)
    {
        float _1894 = _1892 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1880 = _1894;
    }
    float _1896 = _1880;
    float _1898 = _1896;
    float _1900 = _1872;
    if (_1830)
    {
        float _1902 = fma(_1872, _1896, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1898 = _1902;
    }
    float _1904 = _1898;
    float _1906 = _1904;
    if (!_1830)
    {
        _1900 = _1818;
    }
    float _1908 = _1900;
    float _1910 = _1908;
    float _1912 = _1886;
    if (_1830)
    {
        float _1914 = _1886 + (-1.0);
        _1844 = _1914;
    }
    float _1916 = _1844;
    float _1918 = _1916;
    if (_1830)
    {
        float _1920 = _1854 * _1904;
        _1728 = _1920;
    }
    float _1922 = _1728;
    if (!_1830)
    {
        _1906 = _1892;
    }
    float _1924 = _1906;
    float _1926 = _1924;
    if (_1830)
    {
        float _1928 = _1916 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1846 = _1928;
    }
    float _1930 = _1846;
    if (_1830)
    {
        float _1932 = _1818 * _1922;
        _1910 = _1932;
    }
    float _1934 = _1910;
    if (!_1830)
    {
        _1918 = _1820;
    }
    float _1936 = _1918;
    float _1938 = _1936;
    if (_1830)
    {
        float _1940 = _1820 * _1922;
        _1938 = _1940;
    }
    float _1942 = _1938;
    if (!_1830)
    {
        _1856 = _1822;
    }
    float _1944 = _1856;
    float _1946 = _1944;
    if (_1830)
    {
        float _1948 = fma(_1892, _1886, _1930);
        _1926 = _1948;
    }
    float _1950 = _1926;
    if (_1830)
    {
        float _1952 = _1934 * _1934;
        _1946 = _1952;
    }
    float _1954 = _1946;
    if (!_1830)
    {
        _1912 = _1824;
    }
    float _1956 = _1912;
    float _1958 = _1956;
    if (_1830)
    {
        float _1960 = _1942 * _1942;
        _1958 = _1960;
    }
    float _1962 = _1958;
    float _1964 = fma(_1950, _1950, _1954);
    float _1966 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1968 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1970 = _1964 + _1962;
    float _1972 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1966);
    float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1976 = fma(_1814, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1974);
    float _1978 = precise::clamp(_1976, 0.0, 1.0);
    float _1980 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1982 = rsqrt(_1970);
    float _1984 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1972);
    float _1986 = -_1978;
    float _1988 = _1986 + 1.0;
    float _1990 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1992 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1980);
    float _1994 = _1984 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1996 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1998 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1990);
    float _2000 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1992);
    float _2002 = abs(_1988);
    float _2004 = log2(_2002);
    float _2006 = _1994 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2008 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1998);
    float _2010 = _2000 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2012 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1996);
    float _2014 = -_2006;
    float _2016 = fma(_2014, _1968, 1.0);
    float _2018 = _2008 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2020 = _1982 * _1934;
    float _2022 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2024 = _1982 * _1950;
    float _2026 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2012);
    float _2028 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2030 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2022);
    float _2032 = _1982 * _1942;
    float _2034 = _2026 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2036 = -_2028;
    float _2038 = fma(_2024, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2036);
    float _2040 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2030);
    float _2042 = _2004 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2044 = log2(_2016);
    float _2046 = -_2032;
    float _2048 = fma(_2046, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2038);
    float _2050 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2040);
    float _2052 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2054 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2056 = fma(_2048, -0.5, 0.5);
    float _2058 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2052);
    float _2060 = exp2(_2042);
    float _2062 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2054);
    float _2064 = fma(_2048, 0.5, 0.5);
    float _2066 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2058);
    float _2068 = _2024 + 1.0;
    float _2070 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2062);
    float _2072 = fma(_2064, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2074 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2066);
    float _2076 = 1.0 / _2050;
    float _2078 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2070);
    float _2080 = fma(_2064, _2072, -0.212114393711090087890625);
    float _2082 = _2044 * 0.693147182464599609375;
    float _2084 = fma(_2064, _2080, 1.570728778839111328125);
    float _2086 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2088 = sqrt(_2056);
    float _2090 = -_2024;
    float _2092 = fma(_2060, _2068, _2090);
    float _2094 = _2074 * _2076;
    float _2096 = _2078 * _2076;
    float _2098 = fma(_2094, 0.5, 0.5);
    float _2100 = fma(_2096, -0.5, 0.5);
    float _2102 = _2088 * 0.636619746685028076171875;
    float3 _5882 = float3(_2098, _2100, _2086);
    float _2104 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5882, float3(0.0), isnan(_5882)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5882, float3(0.0), isnan(_5882)), level(0.0)).x;
    float _2106 = -_2084;
    float _2108 = fma(_2102, _2106, 1.0);
    float _2110 = fma(_2092, 0.5, 0.5);
    float3 _5900 = float3(_2098, _2100, _2086);
    float4 _2113 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5900, float3(0.0), isnan(_5900)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5900, float3(0.0), isnan(_5900)), level(0.0)).xyzw;
    float _2115 = _2113.x;
    float _2117 = _2113.y;
    float _2119 = _2113.z;
    float _2121 = _2113.w;
    float2 _5917 = float2(_2108, _2110);
    float3 _2125 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5917, float2(0.0), isnan(_5917)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5917, float2(0.0), isnan(_5917)), level(0.0)).xyz;
    float _2127 = _2125.x;
    float _2129 = _2125.y;
    float _2131 = _2125.z;
    float _2133 = _1348 * _1404;
    float _2135 = _1348 * _1418;
    float _2137 = _1348 * _1398;
    float _2139 = _1314 * _1404;
    float _2141 = _1314 * _1418;
    float _2143 = _1314 * _1398;
    bool _2145 = _1320 != 0.0;
    bool _2147 = isnan(_1320);
    bool _2149 = _2145 || _2147;
    bool _2151 = isnan(0.0);
    bool _2153 = _2149 || _2151;
    float _2155 = _2004 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2157 = in.m_75.x;
    float _2159 = in.m_75.y;
    float _2161 = in.m_75.z;
    float _2163 = _1370 * _1398;
    bool _2165 = _1326 == 0.0;
    bool _2167 = !_2153;
    bool _2169 = _2165 && _2167;
    float _2171 = _1370 * _1404;
    float _2173 = _1370 * _1418;
    float _2175 = exp2(_2155);
    bool _2177 = _1232 == 0.0;
    bool _2179 = _2177 && _2169;
    float _2181 = -_1262;
    float _2183 = fma(_2181, _1382, _2135);
    float _2185 = -_1262;
    float _2187 = fma(_2185, _1380, _2133);
    float _2189 = -_1262;
    float _2191 = fma(_2189, _1386, _2137);
    float _2193 = fma(_1350, _1380, _2139);
    float _2195 = fma(_1350, _1382, _2141);
    float _2197 = fma(_1350, _1386, _2143);
    float _2199 = fma(_1352, _1386, _2163);
    float _2201 = fma(_1336, _1278, _2183);
    float _2203 = fma(_1352, _1380, _2171);
    float _2205 = fma(_1352, _1382, _2173);
    float _2207 = fma(_1364, _1274, _2193);
    float _2209 = fma(_1364, _1278, _2195);
    float _2211 = fma(_1336, _1276, _2191);
    float _2213 = fma(_1364, _1276, _2197);
    float _2215 = fma(_1318, _1276, _2199);
    float _2217 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2219 = fma(_1336, _1274, _2187);
    float _2221 = _2159;
    float _2223 = _2157;
    float _2225 = _2161;
    float _2227 = _2207;
    float _2229 = _2050;
    float _2231 = _2078;
    float _2233 = _2074;
    if (!_2179)
    {
        float _2235 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2159);
        _2221 = _2235;
    }
    float _2237 = _2221;
    if (!_2179)
    {
        float _2239 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2157);
        _2223 = _2239;
    }
    float _2241 = _2223;
    float _2243 = fma(_1318, _1278, _2205);
    if (!_2179)
    {
        float _2245 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2161);
        _2225 = _2245;
    }
    float _2247 = _2225;
    float _2249 = _2201 * _2237;
    float _2251 = -_2175;
    float _2253 = _2251 + 1.0;
    float _2255 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2217);
    float _2257 = _2219 * _2237;
    float _2259 = fma(_2209, _2241, _2249);
    float _2261 = _2211 * _2237;
    float _2263 = _2050 * 0.5;
    float _2265 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2255);
    float _2267 = fma(_2243, _2247, _2259);
    float _2269 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2271 = fma(_2078, -0.5, _2263);
    float _2273 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2265);
    float _2275 = fma(_1318, _1274, _2203);
    float _2277 = fma(_2207, _2241, _2257);
    float _2279 = fma(_2213, _2241, _2261);
    float _2281 = _2273 + _2050;
    float _2283 = _2074 + _2050;
    float _2285 = fma(_2275, _2247, _2277);
    float _2287 = fma(_2215, _2247, _2279);
    float _2289 = _2281 * 0.5;
    float _2291 = _2283 * 0.5;
    bool _2293 = _1814 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2295 = isnan(_1814);
    bool _2297 = _2293 || _2295;
    bool _2299 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2301 = _2297 || _2299;
    out.m_77.x = _2285;
    out.m_77.y = _2267;
    out.m_77.z = _2287;
    out.m_79.x = _2291;
    out.m_79.y = _2271;
    out.m_79.z = _2289;
    out.m_79.w = _2050;
    out.gl_Position.x = _2074;
    out.gl_Position.y = _2078;
    out.gl_Position.z = _2273;
    out.gl_Position.w = _2050;
    float _2303 = _2273;
    if (!_2301)
    {
        _2227 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2305 = _2227;
    float _2307 = _2305;
    float _2309 = _2305;
    if (!_2301)
    {
        _2229 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2311 = _2229;
    float _2313 = _2311;
    float _2315 = _2311;
    if (!_2301)
    {
        _2303 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2317 = _2303;
    float _2319 = _2317;
    float _2321 = _2317;
    if (!_2301)
    {
        _2231 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2323 = _2231;
    float _2325 = _2323;
    float _2327 = _2323;
    if (!_2301)
    {
        _2233 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2329 = _2233;
    float _2331 = _2269 * _2104;
    float _2333 = -_2269;
    float _2335 = _2333 + 1.0;
    float _2337 = _2121 * _2331;
    float _2339 = _2121 * _2335;
    float _2341 = _2131 * _2331;
    float _2343 = fma(_2127, _2337, _2115);
    float _2345 = fma(_2129, _2337, _2117);
    float _2347 = _2115;
    float _2349 = _2329;
    float _2351 = _2329;
    if (!_2301)
    {
        _2347 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2353 = _2347;
    float _2355 = fma(_2121, _2341, _2119);
    out.m_81.x = _2343;
    out.m_81.y = _2345;
    out.m_81.z = _2355;
    out.m_81.w = _2339;
    bool _2357 = !_2301;
    float _2359 = _2353;
    float _2361 = _2353;
    if (!_2357)
    {
        bool _2363 = _1814 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2365 = isnan(_1814);
        bool _2367 = _2363 || _2365;
        bool _2369 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2371 = _2367 || _2369;
        if (!_2371)
        {
            float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2375 = _1814 + _2373;
            float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2379 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2377;
            float _2381 = 1.0 / _2379;
            float _2383 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2385 = _2383 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2387 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2389 = _2387 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2391 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2403 = _2375 * _2381;
            float _2405 = precise::clamp(_2403, 0.0, 1.0);
            float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2409 = _2407 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2411 = fma(_2405, _2385, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2413 = fma(_2405, _2409, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2415 = fma(_2405, _2389, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2417 = fma(_2405, _2393, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2419 = fma(_2405, _2397, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2421 = fma(_2405, _2401, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2361 = _2413;
            _2327 = _2419;
            _2309 = _2411;
            _2321 = _2417;
            _2315 = _2415;
            _2351 = _2421;
            _2423 = true;
        }
        else
        {
            bool _2425 = _1814 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2427 = isnan(_1814);
            bool _2429 = _2425 || _2427;
            bool _2431 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2433 = _2429 || _2431;
            if (!_2433)
            {
                _2307 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2435 = _2307;
            _2309 = _2435;
            if (!_2433)
            {
                _2359 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2437 = _2359;
            _2361 = _2437;
            if (!_2433)
            {
                _2313 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2439 = _2313;
            _2315 = _2439;
            if (!_2433)
            {
                _2319 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2441 = _2319;
            _2321 = _2441;
            if (!_2433)
            {
                _2325 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2443 = _2325;
            _2327 = _2443;
            if (!_2433)
            {
                _2349 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2445 = _2349;
            bool _2447 = !_2433;
            _2351 = _2445;
            if (!_2447)
            {
                bool _2449 = _1814 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2451 = isnan(_1814);
                bool _2453 = _2449 || _2451;
                bool _2455 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2457 = _2453 || _2455;
                if (!_2457)
                {
                    float _2459 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2461 = _1814 + _2459;
                    float _2463 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2465 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2463;
                    float _2467 = 1.0 / _2465;
                    float _2469 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2471 = _2469 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2473 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2475 = _2473 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2477 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2479 = _2477 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2481 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2483 = _2481 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2487 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2489 = _2461 * _2467;
                    float _2491 = precise::clamp(_2489, 0.0, 1.0);
                    float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2497 = fma(_2491, _2471, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2499 = fma(_2491, _2495, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2501 = fma(_2491, _2475, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2503 = fma(_2491, _2479, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2505 = fma(_2491, _2483, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2507 = fma(_2491, _2487, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2361 = _2499;
                    _2327 = _2505;
                    _2309 = _2497;
                    _2321 = _2503;
                    _2315 = _2501;
                    _2351 = _2507;
                    _2423 = true;
                }
                else
                {
                    _2361 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2327 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2309 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2321 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2315 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2351 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2423 = false;
    float _2509 = _2361;
    float _2511 = _2327;
    float _2513 = _2309;
    float _2515 = _2321;
    float _2517 = _2315;
    float _2519 = _2351;
    float _2521 = fma(_2267, -0.5, 0.5);
    float _2523 = precise::clamp(_2521, 0.0, 1.0);
    float _2525 = -_2509;
    float _2527 = _2525 + _2511;
    float _2529 = _1792 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2531 = -_2513;
    float _2533 = _2531 + _2515;
    float _2535 = fma(_2523, _2527, _2509);
    out.m_83.x = 0.0;
    float _2537 = -_2517;
    float _2539 = _2537 + _2519;
    float _2541 = fma(_2523, _2533, _2513);
    float _2543 = _2535 * 0.586610972881317138671875;
    out.m_47.x = _2529;
    bool _2545 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2547 = fma(_2523, _2539, _2517);
    float _2549 = fma(_2541, 0.298911988735198974609375, _2543);
    bool _2551 = _1792 > 0.0;
    bool _2553 = isnan(_1792);
    bool _2555 = _2551 || _2553;
    bool _2557 = isnan(0.0);
    bool _2559 = _2555 || _2557;
    float _2561 = fma(_2547, 0.114477999508380889892578125, _2549);
    float _2563 = -_2561;
    float _2565 = _2541 + _2563;
    float _2567 = -_2561;
    float _2569 = _2535 + _2567;
    float _2571 = -_2561;
    float _2573 = _2547 + _2571;
    float _2575 = fma(_2565, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2561);
    float _2577 = fma(_2569, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2561);
    float _2579 = fma(_2573, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2561);
    bool _2581 = !_2545;
    if (!_2581)
    {
        float _2583 = -_1720;
        float _2585 = _2583 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2587 = -_1722;
        float _2589 = _2587 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2591 = -_1724;
        float _2593 = _2591 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2595 = _2585 * _2585;
        float _2597 = fma(_2589, _2589, _2595);
        float _2599 = fma(_2593, _2593, _2597);
        float _2601 = sqrt(_2599);
        float _2603 = rsqrt(_2599);
        float _2605 = -_2601;
        float _2607 = _2605 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2609 = _2607 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2611 = precise::clamp(_2609, 0.0, 1.0);
        float _2613 = _2589 * _2603;
        float _2615 = _2585 * _2603;
        float _2617 = abs(_2611);
        float _2619 = log2(_2617);
        float _2621 = _2593 * _2603;
        float _2623 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2625 = _2267 * _2615;
        float _2627 = -_2615;
        float _2629 = -_2623;
        float _2631 = fma(_2627, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2629);
        float _2633 = fma(_2285, _2613, _2625);
        float _2635 = -_2621;
        float _2637 = fma(_2635, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2631);
        float _2639 = fma(_2287, _2621, _2633);
        float _2641 = precise::clamp(_2639, 0.0, 1.0);
        float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2645 = _2637 + _2643;
        float _2647 = _2619 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2649 = _2645 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2651 = precise::clamp(_2649, 0.0, 1.0);
        float _2653 = exp2(_2647);
        float _2655 = _2653 * _2651;
        float _2657 = _2641 * _2655;
        float _2659 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2661 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2663 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_83.x = _2659;
        out.m_83.y = _2661;
        out.m_83.z = _2663;
    }
    out.m_85.x = _2575;
    out.m_85.y = _2577;
    out.m_85.z = _2579;
    if (_2559)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2665 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2665;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2423 = false;
    bool _442 = false;
    bool _226 = false;
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
    float _112 = as_type<float>(_104);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2723 = as_type<float>(_120);
        out.gl_Position.z = _2723;
    }
    if (!_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_49.w;
    float _126 = float(_104);
    float _128 = -_124;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_124);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    bool _142 = _130 >= _126;
    bool _144 = !_140;
    bool _146 = _142 || _144;
    float _148 = _130;
    if (_146)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _112;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _152 = _150 * 5.0;
        _122 = as_type<int>(_152);
    }
    int _154 = _122;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2787 = as_type<float>(_154);
        out.gl_Position.z = _2787;
    }
    if (_146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _156 = in.m_51.x;
    float _158 = in.m_51.y;
    float _160 = in.m_51.z;
    float _162 = 1.0 / _126;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _166 = in.m_53.x;
    float _168 = in.m_53.y;
    float _170 = in.m_53.z;
    float _172 = in.m_55.x;
    float _174 = in.m_55.y;
    float _176 = in.m_55.z;
    float _178 = in.m_57.x;
    float _180 = in.m_57.y;
    float _182 = in.m_57.z;
    float _184 = _158 * _168;
    float _186 = _158 * _174;
    float _188 = fma(_156, _166, _184);
    float _190 = _158 * _180;
    float _192 = fma(_156, _172, _186);
    float _194 = fma(_160, _170, _188);
    float _196 = fma(_156, _178, _190);
    float _198 = fma(_160, _176, _192);
    float _200 = fma(_160, _182, _196);
    float _202 = _130 * _162;
    bool _204 = !_164;
    float _206 = _194;
    float _224;
    if (!_204)
    {
        float _208 = in.m_59.x;
        float _210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _212 = _208 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _214 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _216 = _214 * _210;
        float _218 = floor(_216);
        float _220 = -_218;
        float _222 = _216 + _220;
        _224 = _222;
        _226 = true;
    }
    else
    {
        _224 = _202;
    }
    _226 = false;
    float _228 = _224;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = _228 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _228 + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _240 = _228 + _238;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _246 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _250;
    float _254 = 1.0 / _244;
    bool _256 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _258 = isnan(_228);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _264 = _260 || _262;
    float _266 = float(_264);
    bool _268 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _270 = 1.0 / _248;
    float _272 = 1.0 / _252;
    float _274 = _232 * _254;
    bool _276 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _278 = isnan(_228);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _288;
    float _292 = -_286;
    float _294 = _292 + 1.0;
    float _296 = _236 * _270;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _302;
    float _306 = fma(_290, _274, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _308 = fma(_300, _274, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _310 = fma(_304, _274, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _312 = _240 * _272;
    bool _314 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _316 = isnan(_228);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    bool _326 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _328 = isnan(_228);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _342 = -_324;
    float _344 = _342 + 1.0;
    float _346 = _336 * _294;
    float _348 = -_336;
    float _350 = _348 + 1.0;
    float _352 = _266 * _344;
    float _354 = -_266;
    float _356 = _354 + 1.0;
    float _358 = fma(_340, _296, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _360 = _324 * _350;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = _306 * _352;
    float _368 = _308 * _352;
    float _370 = _310 * _352;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _376 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].x, _366);
    float _378 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].y, _368);
    float _380 = fma(_374, _296, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _382 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].z, _370);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _388;
    float _392 = fma(_364, _296, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _394;
    float _398 = fma(_358, _360, _376);
    float _400 = fma(_386, _312, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _402 = fma(_390, _312, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _404 = fma(_380, _360, _378);
    float _406 = fma(_396, _312, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _408 = fma(_392, _360, _382);
    float _410 = fma(_400, _346, _398);
    float _412 = fma(_402, _346, _404);
    float _414 = fma(_406, _346, _408);
    float _416 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[146].x, _410);
    float _418 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[146].y, _412);
    float _420 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[146].z, _414);
    bool _422 = !_268;
    float _440;
    if (!_422)
    {
        float _424 = in.m_59.x;
        float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _428 = _424 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _432 = _430 * _426;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = true;
    }
    else
    {
        _440 = _202;
    }
    _442 = false;
    float _444 = _440;
    float _446 = in.m_44.x;
    float _448 = in.m_44.y;
    float _450 = in.m_44.z;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _454 = _444 + _452;
    float _456 = in.m_61.x;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _460 = _458 != 0;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _464 = _444 + _462;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _468 = _466 != 0;
    float _470 = in.m_55.w;
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _474 = _472 != 0;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _478 = _476 != 0;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _482 = _480 != 0;
    float _484 = 0.0;
    bool _486 = false;
    if (_460)
    {
        float _488 = in.m_59.x;
        _484 = _488;
    }
    float _490 = _484;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _496 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _498 = _168 * _448;
    float _500 = _174 * _448;
    float _502 = _180 * _448;
    float _504 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _506 = fma(_166, _446, _498);
    float _508 = fma(_172, _446, _500);
    float _510 = fma(_178, _446, _502);
    float _512 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _504);
    float _514 = in.m_59.x;
    float _516 = in.m_59.y;
    float _518 = in.m_59.z;
    float _520 = 1.0 / _494;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _534 = 1.0 / _524;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _542 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _496);
    float _544 = fma(_176, _450, _508);
    float _546 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _548 = 1.0 / _528;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _552 = _536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _554 = _538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = _540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _558 = _518 * 2.0;
    float _560 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _546);
    float _562 = 1.0 / _532;
    float _564 = in.m_61.y;
    float _566 = fma(_170, _450, _506);
    float _568 = fma(_182, _450, _510);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _570;
    float _574 = _450;
    float _576 = _524;
    if (!_460)
    {
        _574 = _456;
    }
    float _578 = _574;
    out.m_63.x = _552;
    out.m_63.y = _554;
    out.m_63.z = _556;
    out.m_63.w = _550;
    float _580 = floor(_558);
    float _582 = _572 * _534;
    float _584 = _578;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[118].x);
    if (!_460)
    {
        _576 = _578;
    }
    float _588 = _576;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _594 = _588;
    if (_460)
    {
        _584 = _456;
    }
    float _596 = _584;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _602 = _592 * _520;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _604;
    float _608 = _600 * _562;
    if (_460)
    {
        float _610 = -_596;
        float _612 = _610 + 1.0;
        _586 = as_type<int>(_612);
    }
    int _614 = _586;
    float _616 = fma(_518, 0.0199999995529651641845703125, -0.00999999977648258209228515625);
    float _618 = _514 * 2.0;
    float _620 = _516 + _518;
    float _622 = _518 + _514;
    float _624 = _518 + (-0.5);
    float _626 = _516 * 2.0;
    if (_460)
    {
        bool _628 = _490 > 0.5;
        _486 = _628;
    }
    bool _630 = _486;
    float _632 = floor(_618);
    float _634 = _516 + _514;
    float _636 = _606 * _548;
    float _638 = _634 + (-1.0);
    if (_460)
    {
        float _640 = _630 ? as_type<float>(_614) : _596;
        _594 = _640;
    }
    float _642 = _594;
    float _644 = fma(0.00150000001303851604461669921875, _514, 0.00349999987520277500152587890625);
    bool _646 = _580 > 0.0;
    float _648 = floor(_626);
    bool _650 = _580 >= 0.0;
    bool _652 = isnan(_580);
    bool _654 = _650 || _652;
    bool _656 = isnan(0.0);
    bool _658 = _654 || _656;
    float _660 = _514 + (-0.5);
    float _662 = -_564;
    float _664 = _662 + 1.0;
    float _666 = _616 * _130;
    float _668 = _620 + (-1.0);
    bool _670 = _516 > 0.5;
    float _672 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _674 = _516 + (-0.5);
    float _676 = fma(_516, 6.283185482025146484375, _666);
    float _678 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _680 = _658 ? 0 : 1;
    float _682 = in.m_53.w;
    int _684 = _670 ? as_type<int>(_664) : as_type<int>(_564);
    float _686 = fma(_582, _454, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _688 = _544 + _470;
    bool _690 = _632 > 0.0;
    float _692 = fma(_636, _464, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _694 = _632 >= 0.0;
    bool _696 = isnan(_632);
    bool _698 = _694 || _696;
    bool _700 = isnan(0.0);
    bool _702 = _698 || _700;
    float _704 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _512);
    bool _706 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _708 = isnan(_444);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _560);
    float _720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _722 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _724 = isnan(_444);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = -_716;
    float _736 = _734 + 1.0;
    int _738 = ~_680;
    int _740 = _738 + 1;
    int _742 = _740 + 1;
    float _744 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _542);
    int _746 = _742;
    float _748 = _688;
    if (!_646)
    {
        int _750 = ~_680;
        int _752 = _750 + 1;
        _746 = _752;
    }
    int _754 = _746;
    float _756 = -_732;
    float _758 = _756 + 1.0;
    int _760 = _702 ? 0 : 1;
    float _762 = _732 * _736;
    bool _764 = _648 > 0.0;
    float _766 = in.m_57.w;
    bool _768 = _648 >= 0.0;
    bool _770 = isnan(_648);
    bool _772 = _768 || _770;
    bool _774 = isnan(0.0);
    bool _776 = _772 || _774;
    float _778 = _676 * (-0.01745329238474369049072265625);
    bool _780 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _782 = isnan(_444);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _794 = log2(_792);
    bool _796 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _798 = isnan(_444);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    float _808 = _778 * 0.15915493667125701904296875;
    bool _810 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _812 = isnan(_444);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = _790 * _758;
    float _824 = -_790;
    float _826 = _824 + 1.0;
    float _828 = -_806;
    float _830 = _828 + 1.0;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _834 = _444 + _832;
    float _836 = _468 ? as_type<float>(_684) : _564;
    float _838 = _806 * _826;
    float _840 = _820 * _830;
    float _842 = _808 * 6.283185482025146484375;
    float _844 = cos(_842);
    float _846 = fma(_602, _834, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _848 = -_820;
    float _850 = _848 + 1.0;
    float _852 = _686 * _840;
    float _854 = _566 + _682;
    int _856 = ~_760;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _864 = _444 + _862;
    float _866 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[115].x, _852);
    float _868 = _808 * 6.283185482025146484375;
    float _870 = sin(_868);
    float _872 = _568 + _766;
    bool _874 = !_478;
    int _876 = _874 ? 0 : 1;
    float _878 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _880 = _688 + _878;
    int _882 = _860;
    if (!_690)
    {
        int _884 = ~_760;
        int _886 = _884 + 1;
        _882 = _886;
    }
    int _888 = _882;
    float _890 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _892 = _854 + _890;
    int _894 = abs(_876);
    float _896 = _880 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _898 = _844 * _564;
    float _900 = fma(_846, _838, _866);
    bool _902 = !_474;
    int _904 = _902 ? 0 : 1;
    float _906 = fma(_608, _864, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _908 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _910 = _872 + _908;
    float _912 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _914 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[28].x, _896);
    float _916 = fma(_692, _822, _900);
    float _918 = fma(_870, _596, _898);
    float _920 = _794 * _130;
    int _922 = abs(_904);
    float _924 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[28].z, _914);
    float _926 = _836 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _928 = float(_922);
    float _930 = exp2(_920);
    float _932 = float(_754);
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _936 = 1.0 + _934;
    bool _938 = _924 >= 0.0;
    float _940 = fma(_906, _762, _916);
    bool _942 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _944 = isnan(1.0);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _950 = _946 || _948;
    float _952 = _928 * _932;
    float _954 = _642 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _956 = 1.0 / _936;
    float _958 = float(_894);
    float _960 = _926 * _720;
    float _962 = float(_888);
    float _964 = _954 * _912;
    float _966 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[119].x, _940);
    bool _968 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _970 = isnan(0.0);
    bool _972 = _968 || _970;
    bool _974 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _976 = _972 || _974;
    float _978 = _880 * _880;
    float _980 = -_930;
    float _982 = _980 + 1.0;
    float _984 = _958 * _962;
    out.m_65.x = _964;
    out.m_65.y = _960;
    float _986 = fma(_892, _892, _978);
    float _988 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[194].w, _130);
    float _990 = rsqrt(_704);
    float _992 = fma(_910, _910, _986);
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _998 = _960;
    int _1000 = as_type<int>(_982);
    if (_938)
    {
        _998 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1002 = _998;
    float _1004 = _976 ? _982 : 0.0;
    float _1006 = rsqrt(_992);
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    if (_938)
    {
        float _1010 = _1002 * 5.0;
        _1000 = as_type<int>(_1010);
    }
    int _1012 = _1000;
    float _1014 = _994 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_950)
    {
        float _1016 = _1004 * _956;
        _148 = _1016;
    }
    float _1018 = _148;
    float _1020 = _996 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1022 = in.m_67.x;
    float _1024 = in.m_67.y;
    float _1026 = in.m_67.z;
    float _1028 = _1008 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1030 = rsqrt(_718);
    float _1032 = _966 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_938)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4184 = as_type<float>(_1012);
        out.gl_Position.z = _4184;
    }
    bool _1034 = !_482;
    int _1036 = _1034 ? 0 : 1;
    float _1038 = _676 * 0.15915493667125701904296875;
    out.m_69.x = _1014;
    out.m_69.y = _1020;
    out.m_69.z = _1028;
    out.m_69.w = _1032;
    float _1040 = rsqrt(_744);
    float _1042 = _880 * _1006;
    if (_938)
    {
        out.m_47.x = 0.0;
    }
    float _1044 = _892 * _1006;
    if (_938)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1046 = -_1042;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _688);
    float _1050 = _952 * (-2.0);
    float _1052 = _910 * _1006;
    float _1054 = -_1044;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[18].w, _854);
    float _1058 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1060 = _1048 + _1058;
    float _1062 = fma(_1050, _1022, _1022);
    float _1064 = _984 * (-2.0);
    float _1066 = -_1052;
    float _1068 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[18].w, _872);
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1072 = _1056 + _1070;
    float _1074 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1076 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1062);
    float _1078 = fma(_678, _1064, _678);
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1082 = _1068 + _1080;
    float _1084 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1074);
    float _1086 = fma(_1064, _1024, _1024);
    int _1088 = _776 ? 0 : 1;
    float _1090 = fma(_672, _1050, _672);
    float _1092 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1084);
    float _1094 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1086);
    int _1096 = ~_1088;
    int _1098 = _1096 + 1;
    int _1100 = _1098 + 1;
    float _1102 = fma(_1090, _1018, _1076);
    int _1104 = abs(_1036);
    float _1106 = -_1042;
    float _1108 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[18].w, _880);
    int _1110 = _1100;
    float _1112 = _1102;
    if (!_764)
    {
        int _1114 = ~_1088;
        int _1116 = _1114 + 1;
        _1110 = _1116;
    }
    int _1118 = _1110;
    float _1120 = fma(_1078, _1018, _1094);
    bool _1122 = _1092 >= 0.0;
    float _1124 = _1102 * 0.15915493667125701904296875;
    float _1126 = _622 + (-1.0);
    float _1128 = float(_1104);
    float _1130 = -_1044;
    float _1132 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[18].w, _892);
    float _1134 = float(_1118);
    float _1136 = _1108 * _1108;
    float _1138 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1140 = _1124 * 6.283185482025146484375;
    float _1142 = sin(_1140);
    float _1144 = _1120 * 0.15915493667125701904296875;
    float _1146 = _1128 * _1134;
    float _1148 = fma(_1132, _1132, _1136);
    float _1150 = in.m_71.x;
    float _1152 = in.m_71.y;
    float _1154 = in.m_71.z;
    if (_1122)
    {
        _1112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1156 = _1112;
    float _1158 = _1146 * (-2.0);
    float _1160 = -_1052;
    float _1162 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[18].w, _910);
    float _1164 = _1124 * 6.283185482025146484375;
    float _1166 = cos(_1164);
    int _1168 = as_type<int>(_1156);
    if (_1122)
    {
        float _1170 = _1156 * 5.0;
        _1168 = as_type<int>(_1170);
    }
    int _1172 = _1168;
    if (_1122)
    {
        out.m_47.x = 0.0;
    }
    if (_1122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4425 = as_type<float>(_1172);
        out.gl_Position.z = _4425;
    }
    float _1174 = _1038 * 6.283185482025146484375;
    float _1176 = sin(_1174);
    float _1178 = in.m_73.x;
    float _1180 = in.m_73.y;
    float _1182 = in.m_73.z;
    float _1184 = _1038 * 6.283185482025146484375;
    float _1186 = cos(_1184);
    float _1188 = _1144 * 6.283185482025146484375;
    float _1190 = sin(_1188);
    float _1192 = _1144 * 6.283185482025146484375;
    float _1194 = cos(_1192);
    if (_1122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1196 = -_688;
    float _1198 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1200 = fma(_1158, _1026, _1026);
    float _1202 = -_854;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1206 = -_872;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1210 = _1198 * _1198;
    float _1212 = fma(_1138, _1158, _1138);
    float _1214 = fma(_1162, _1162, _1148);
    float _1216 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1200);
    float _1218 = fma(_1204, _1204, _1210);
    float _1220 = _202 * 0.001000000047497451305389404296875;
    float _1222 = _420 * _1182;
    float _1224 = sqrt(_1214);
    float _1226 = fma(_1208, _1208, _1218);
    float _1228 = fma(_1212, _1018, _1216);
    float _1230 = _988 * _1220;
    float _1232 = _1040 * _1154;
    float _1234 = _418 * _1180;
    float _1236 = _1222 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1238 = fma(_1230, -0.1500000059604644775390625, _644);
    float _1240 = rsqrt(_1226);
    float _1242 = _1186 * _1152;
    float _1244 = _988 * _1238;
    float _1246 = _1142 * _1194;
    float _1248 = fma(_1176, _1150, _1242);
    float _1250 = _1228 * 0.15915493667125701904296875;
    float _1252 = _1176 * _1152;
    float _1254 = _1006 * _1224;
    float _1256 = fma(_1244, 5.0, _1248);
    float _1258 = _416 * _1178;
    float _1260 = _1250 * 6.283185482025146484375;
    float _1262 = sin(_1260);
    float _1264 = -_1252;
    float _1266 = fma(_1186, _1150, _1264);
    float _1268 = _1142 * _1190;
    float _1270 = _1166 * _1194;
    float _1272 = _1256 + 0.100000001490116119384765625;
    float _1274 = _1204 * _1240;
    float _1276 = _1208 * _1240;
    float _1278 = _1198 * _1240;
    float _1280 = _1250 * 6.283185482025146484375;
    float _1282 = cos(_1280);
    float _1284 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1286 = _1274 * _1284;
    float _1288 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1290 = _1276 * _1288;
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1294 = _1278 * _1292;
    float _1296 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1298 = -_1286;
    float _1300 = fma(_1276, _1296, _1298);
    float _1302 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1304 = -_1290;
    float _1306 = fma(_1278, _1302, _1304);
    float _1308 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1310 = -_1294;
    float _1312 = fma(_1274, _1308, _1310);
    float _1314 = fma(_1262, _1270, _1268);
    float _1316 = _1300 * _1300;
    float _1318 = fma(_1262, _1268, _1270);
    float _1320 = _1272 * _1030;
    float _1322 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1324 = fma(_1306, _1306, _1316);
    float _1326 = _1266 * _990;
    float _1328 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1320);
    float _1330 = _1254 * _1322;
    float _1332 = fma(_1312, _1312, _1324);
    float _1334 = _1258 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1336 = _1142 * _1282;
    float _1338 = _1328 * _1330;
    float _1340 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1326);
    float _1342 = _1254 * _1334;
    float _1344 = rsqrt(_1332);
    float _1346 = _1166 * _1190;
    float _1348 = _1166 * _1282;
    float _1350 = _1194 * _1282;
    float _1352 = _1190 * _1282;
    float _1354 = _1254 * _1236;
    float _1356 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1232);
    float _1358 = _1340 * _1342;
    float _1360 = _1348 * _1338;
    float _1362 = -_1346;
    float _1364 = fma(_1262, _1246, _1362);
    float _1366 = _1356 * _1354;
    float _1368 = -_1246;
    float _1370 = fma(_1262, _1346, _1368);
    float _1372 = -_1338;
    float _1374 = _1262 * _1372;
    float _1376 = fma(_1314, _1358, _1360);
    float _1378 = _1336 * _1338;
    float _1380 = _1306 * _1344;
    float _1382 = _1300 * _1344;
    float _1384 = fma(_1350, _1358, _1374);
    float _1386 = _1312 * _1344;
    float _1388 = _1278 * _1380;
    float _1390 = fma(_1370, _1366, _1376);
    float _1392 = _1276 * _1382;
    float _1394 = fma(_1364, _1358, _1378);
    float _1396 = -_1388;
    float _1398 = fma(_1274, _1382, _1396);
    float _1400 = fma(_1352, _1366, _1384);
    float _1402 = -_1392;
    float _1404 = fma(_1278, _1386, _1402);
    float _1406 = fma(_1318, _1366, _1394);
    float _1408 = _1398 * _1390;
    float _1410 = _1274 * _1386;
    float _1412 = _1404 * _1390;
    float _1414 = fma(_1386, _1400, _1408);
    float _1416 = -_1410;
    float _1418 = fma(_1276, _1380, _1416);
    float _1420 = fma(_1380, _1400, _1412);
    float _1422 = fma(_1276, _1406, _1414);
    float _1424 = _1418 * _1390;
    float _1426 = fma(_1274, _1406, _1420);
    float _1428 = _872 + _1422;
    float _1430 = fma(_1382, _1400, _1424);
    float _1432 = _854 + _1426;
    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1436 = _1428 + _1434;
    float _1438 = fma(_1278, _1406, _1430);
    float _1440 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1442 = _1432 + _1440;
    float _1444 = _1436 * _1436;
    float _1446 = _688 + _1438;
    float _1448 = fma(_1442, _1442, _1444);
    float _1450 = sqrt(_1448);
    bool _1452 = _1450 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1454 = _1444;
    float _1456 = _1400;
    float _1458 = _1438;
    if (!_1452)
    {
        _1454 = _1432;
    }
    float _1460 = _1454;
    float _1462 = _1460;
    if (!_1452)
    {
        _1456 = _1428;
    }
    float _1464 = _1456;
    float _1466 = _1464;
    if (!_1452)
    {
        _1458 = _1446;
    }
    float _1468 = _1458;
    bool _1470 = !_1452;
    float _1472 = _1468;
    if (!_1470)
    {
        float _1474 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1476 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1478 = _1450 + _1476;
        float _1480 = rsqrt(_1448);
        float _1482 = _1478 * _1474;
        float _1484 = _1446 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1486 = _1482 * 0.15915493667125701904296875;
        float _1488 = _1486 * 6.283185482025146484375;
        float _1490 = cos(_1488);
        float _1492 = _1486 * 6.283185482025146484375;
        float _1494 = sin(_1492);
        float _1496 = _1490 + (-1.0);
        float _1498 = fma(_1494, _1484, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1500 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1502 = _1480 * _1498;
        float _1504 = fma(_1446, _1490, _1500);
        float _1506 = fma(_1442, _1502, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1508 = fma(_1436, _1502, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1472 = _1504;
        _1462 = _1506;
        _1466 = _1508;
    }
    float _1510 = _1472;
    float _1512 = _1462;
    float _1514 = _1466;
    float _1516 = -_688;
    float _1518 = _1516 + _1510;
    float _1520 = -_854;
    float _1522 = _1520 + _1512;
    float _1524 = -_872;
    float _1526 = _1524 + _1514;
    float _1528 = _1518 * _1518;
    bool _1530 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1532 = isnan(0.5);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1538 = _1534 || _1536;
    bool _1540 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1542 = isnan(0.5);
    bool _1544 = _1540 || _1542;
    bool _1546 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1548 = _1544 || _1546;
    float _1550 = fma(_1522, _1522, _1528);
    float _1552 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1554 = fma(_1526, _1526, _1550);
    float _1556 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1552);
    float _1558 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1560 = sqrt(_1554);
    float _1562 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1556);
    float _1564 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1558);
    float _1566 = _1562 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1568 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1564);
    float _1570 = _1568 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1572 = _1570 + _1566;
    bool _1574 = _1560 > 0.0;
    float _1576 = 1.0 / _1566;
    bool _1578 = !_1574;
    float _1580 = _1510;
    float _1582 = _1512;
    float _1584 = _1514;
    float _1586 = _1518;
    float _1588 = _1572;
    if (!_1578)
    {
        float _1590 = _198 * _198;
        float _1592 = rsqrt(_1554);
        float _1594 = fma(_194, _194, _1590);
        float _1596 = fma(_200, _200, _1594);
        float _1598 = sqrt(_1596);
        float _1600 = _1522 * _1592;
        float _1602 = _1526 * _1592;
        bool _1604 = _1598 > 0.0;
        float _1606 = _1518 * _1592;
        bool _1608 = !_1604;
        if (!_1608)
        {
            float _1610 = rsqrt(_1596);
            float _1612 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1614 = _198 * _1610;
            float _1616 = _194 * _1610;
            float _1618 = _1606 * _1614;
            float _1620 = _200 * _1610;
            float _1622 = fma(_1600, _1616, _1618);
            float _1624 = _1612 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1626 = fma(_1602, _1620, _1622);
            float _1628 = _1626 * _1624;
            float _1630 = fma(_194, _1628, _1512);
            float _1632 = fma(_198, _1628, _1510);
            float _1634 = fma(_200, _1628, _1514);
            _1580 = _1632;
            _1582 = _1630;
            _1584 = _1634;
            _1586 = _1616;
        }
    }
    float _1636 = _1580;
    float _1638 = _1582;
    float _1640 = _1584;
    float _1642 = _1586;
    float _1644 = -_1042;
    float _1646 = fma(_1644, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1636);
    float _1648 = _1572 * _1576;
    float _1650 = _1648 * 0.5;
    float _1652 = -_1044;
    float _1654 = fma(_1652, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1638);
    float _1656 = -_1052;
    float _1658 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1640);
    float _1660 = _1654;
    float _1662 = _1658;
    float _1664 = _1636;
    float _1666 = _1642;
    if (_1548)
    {
        _206 = 1.0;
    }
    float _1668 = _206;
    float _1670 = _1668;
    if (_1538)
    {
        _1588 = _1646;
    }
    float _1672 = _1588;
    float _1674 = _1672;
    if (!_1538)
    {
        float _1676 = _1060 * _1060;
        float _1678 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1680 = -_872;
        float _1682 = _1680 + _1640;
        float _1684 = -_854;
        float _1686 = _1684 + _1638;
        float _1688 = fma(_1072, _1072, _1676);
        float _1690 = -_688;
        float _1692 = _1690 + _1636;
        float _1694 = fma(_1082, _1082, _1688);
        float _1696 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1698 = sqrt(_1694);
        float _1700 = 1.0 / _1254;
        float _1702 = precise::min(_1698, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1704 = _1702 * _1678;
        float _1706 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1708 = _1704 * _1700;
        float _1710 = _1706 * _1708;
        float _1712 = _1682 * _1708;
        float _1714 = fma(_1686, _1710, _1056);
        float _1716 = fma(_1692, _1710, _1048);
        float _1718 = fma(_1706, _1712, _1068);
        _1674 = _1716;
        _1660 = _1714;
        _1662 = _1718;
        _748 = _1692;
    }
    float _1720 = _1674;
    float _1722 = _1660;
    float _1724 = _1662;
    float _1726 = _748;
    float _1728 = _1726;
    if (!_1548)
    {
        float _1730 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1732 = _1730 * 0.15915493667125701904296875;
        float _1734 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1736 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1738 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1736);
        float _1740 = _1732 * 6.283185482025146484375;
        float _1742 = cos(_1740);
        float _1744 = _1734 * 0.15915493667125701904296875;
        float _1746 = _1732 * 6.283185482025146484375;
        float _1748 = sin(_1746);
        float _1750 = 1.0 / _1742;
        float _1752 = _1744 * 6.283185482025146484375;
        float _1754 = cos(_1752);
        float _1756 = _1748 * _1750;
        float _1758 = _1744 * 6.283185482025146484375;
        float _1760 = sin(_1758);
        float _1762 = _1754 * _1756;
        float _1764 = 1.0 / _1738;
        float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1768 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1766;
        float _1770 = 1.0 / _1762;
        float _1772 = 1.0 / _1768;
        float _1774 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1776 = _1764 * _1774;
        float _1778 = _1760 * _1770;
        float _1780 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1782 = fma(_1778, _1776, _1780);
        float _1784 = _1782 * _1772;
        float _1786 = precise::clamp(_1784, 0.0, 1.0);
        _1664 = _1744;
        _1666 = _1732;
        _1670 = _1786;
    }
    float _1788 = _1664;
    float _1790 = _1666;
    float _1792 = _1670;
    float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1796 = _1720 + _1794;
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1800 = _1722 + _1798;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1804 = _1724 + _1802;
    float _1806 = _1796 * _1796;
    float _1808 = fma(_1800, _1800, _1806);
    float _1810 = fma(_1804, _1804, _1808);
    float _1812 = rsqrt(_1810);
    float _1814 = sqrt(_1810);
    float _1816 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1818 = _1800 * _1816;
    float _1820 = _1804 * _1816;
    float _1822 = _1818 * _1818;
    float _1824 = _1820 * _1820;
    float _1826 = _1822 + _1824;
    float _1828 = sqrt(_1826);
    bool _1830 = _1828 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1832 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1834 = _1828 + _1832;
    float _1836 = _1804;
    float _1838 = _1826;
    float _1840 = _1834;
    float _1842 = _1788;
    float _1844 = _1796;
    float _1846 = _1790;
    if (_1830)
    {
        float _1848 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1836 = _1848;
    }
    float _1850 = _1836;
    if (_1830)
    {
        float _1852 = rsqrt(_1826);
        _1838 = _1852;
    }
    float _1854 = _1838;
    float _1856 = _1854;
    if (_1830)
    {
        float _1858 = _1834 * _1850;
        _1840 = _1858;
    }
    float _1860 = _1840;
    if (_1830)
    {
        float _1862 = _1860 * 0.15915493667125701904296875;
        _1842 = _1862;
    }
    float _1864 = _1842;
    float _1866 = _1850;
    if (_1830)
    {
        float _1868 = _1864 * 6.283185482025146484375;
        float _1870 = sin(_1868);
        _1866 = _1870;
    }
    float _1872 = _1866;
    float _1874 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1876 = precise::max(0.0, _1874);
    float _1878 = _1812;
    float _1880 = _1876;
    if (_1830)
    {
        float _1882 = _1864 * 6.283185482025146484375;
        float _1884 = cos(_1882);
        _1878 = _1884;
    }
    float _1886 = _1878;
    float _1888 = -_1816;
    float _1890 = -_1876;
    float _1892 = fma(_1796, _1888, _1890);
    if (_1830)
    {
        float _1894 = _1892 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1880 = _1894;
    }
    float _1896 = _1880;
    float _1898 = _1896;
    float _1900 = _1872;
    if (_1830)
    {
        float _1902 = fma(_1872, _1896, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1898 = _1902;
    }
    float _1904 = _1898;
    float _1906 = _1904;
    if (!_1830)
    {
        _1900 = _1818;
    }
    float _1908 = _1900;
    float _1910 = _1908;
    float _1912 = _1886;
    if (_1830)
    {
        float _1914 = _1886 + (-1.0);
        _1844 = _1914;
    }
    float _1916 = _1844;
    float _1918 = _1916;
    if (_1830)
    {
        float _1920 = _1854 * _1904;
        _1728 = _1920;
    }
    float _1922 = _1728;
    if (!_1830)
    {
        _1906 = _1892;
    }
    float _1924 = _1906;
    float _1926 = _1924;
    if (_1830)
    {
        float _1928 = _1916 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1846 = _1928;
    }
    float _1930 = _1846;
    if (_1830)
    {
        float _1932 = _1818 * _1922;
        _1910 = _1932;
    }
    float _1934 = _1910;
    if (!_1830)
    {
        _1918 = _1820;
    }
    float _1936 = _1918;
    float _1938 = _1936;
    if (_1830)
    {
        float _1940 = _1820 * _1922;
        _1938 = _1940;
    }
    float _1942 = _1938;
    if (!_1830)
    {
        _1856 = _1822;
    }
    float _1944 = _1856;
    float _1946 = _1944;
    if (_1830)
    {
        float _1948 = fma(_1892, _1886, _1930);
        _1926 = _1948;
    }
    float _1950 = _1926;
    if (_1830)
    {
        float _1952 = _1934 * _1934;
        _1946 = _1952;
    }
    float _1954 = _1946;
    if (!_1830)
    {
        _1912 = _1824;
    }
    float _1956 = _1912;
    float _1958 = _1956;
    if (_1830)
    {
        float _1960 = _1942 * _1942;
        _1958 = _1960;
    }
    float _1962 = _1958;
    float _1964 = fma(_1950, _1950, _1954);
    float _1966 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1968 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1970 = _1964 + _1962;
    float _1972 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1966);
    float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1976 = fma(_1814, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1974);
    float _1978 = precise::clamp(_1976, 0.0, 1.0);
    float _1980 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1982 = rsqrt(_1970);
    float _1984 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1972);
    float _1986 = -_1978;
    float _1988 = _1986 + 1.0;
    float _1990 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1992 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1980);
    float _1994 = _1984 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1996 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1998 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1990);
    float _2000 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1992);
    float _2002 = abs(_1988);
    float _2004 = log2(_2002);
    float _2006 = _1994 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2008 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1998);
    float _2010 = _2000 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2012 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1996);
    float _2014 = -_2006;
    float _2016 = fma(_2014, _1968, 1.0);
    float _2018 = _2008 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2020 = _1982 * _1934;
    float _2022 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2024 = _1982 * _1950;
    float _2026 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2012);
    float _2028 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2030 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2022);
    float _2032 = _1982 * _1942;
    float _2034 = _2026 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2036 = -_2028;
    float _2038 = fma(_2024, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2036);
    float _2040 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2030);
    float _2042 = _2004 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2044 = log2(_2016);
    float _2046 = -_2032;
    float _2048 = fma(_2046, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2038);
    float _2050 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2040);
    float _2052 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2054 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2056 = fma(_2048, -0.5, 0.5);
    float _2058 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2052);
    float _2060 = exp2(_2042);
    float _2062 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2054);
    float _2064 = fma(_2048, 0.5, 0.5);
    float _2066 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2058);
    float _2068 = _2024 + 1.0;
    float _2070 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2062);
    float _2072 = fma(_2064, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2074 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2066);
    float _2076 = 1.0 / _2050;
    float _2078 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2070);
    float _2080 = fma(_2064, _2072, -0.212114393711090087890625);
    float _2082 = _2044 * 0.693147182464599609375;
    float _2084 = fma(_2064, _2080, 1.570728778839111328125);
    float _2086 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2088 = sqrt(_2056);
    float _2090 = -_2024;
    float _2092 = fma(_2060, _2068, _2090);
    float _2094 = _2074 * _2076;
    float _2096 = _2078 * _2076;
    float _2098 = fma(_2094, 0.5, 0.5);
    float _2100 = fma(_2096, -0.5, 0.5);
    float _2102 = _2088 * 0.636619746685028076171875;
    float3 _5882 = float3(_2098, _2100, _2086);
    float _2104 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5882, float3(0.0), isnan(_5882)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5882, float3(0.0), isnan(_5882)), level(0.0)).x;
    float _2106 = -_2084;
    float _2108 = fma(_2102, _2106, 1.0);
    float _2110 = fma(_2092, 0.5, 0.5);
    float3 _5900 = float3(_2098, _2100, _2086);
    float4 _2113 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5900, float3(0.0), isnan(_5900)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5900, float3(0.0), isnan(_5900)), level(0.0)).xyzw;
    float _2115 = _2113.x;
    float _2117 = _2113.y;
    float _2119 = _2113.z;
    float _2121 = _2113.w;
    float2 _5917 = float2(_2108, _2110);
    float3 _2125 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5917, float2(0.0), isnan(_5917)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5917, float2(0.0), isnan(_5917)), level(0.0)).xyz;
    float _2127 = _2125.x;
    float _2129 = _2125.y;
    float _2131 = _2125.z;
    float _2133 = _1348 * _1404;
    float _2135 = _1348 * _1418;
    float _2137 = _1348 * _1398;
    float _2139 = _1314 * _1404;
    float _2141 = _1314 * _1418;
    float _2143 = _1314 * _1398;
    bool _2145 = _1320 != 0.0;
    bool _2147 = isnan(_1320);
    bool _2149 = _2145 || _2147;
    bool _2151 = isnan(0.0);
    bool _2153 = _2149 || _2151;
    float _2155 = _2004 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2157 = in.m_75.x;
    float _2159 = in.m_75.y;
    float _2161 = in.m_75.z;
    float _2163 = _1370 * _1398;
    bool _2165 = _1326 == 0.0;
    bool _2167 = !_2153;
    bool _2169 = _2165 && _2167;
    float _2171 = _1370 * _1404;
    float _2173 = _1370 * _1418;
    float _2175 = exp2(_2155);
    bool _2177 = _1232 == 0.0;
    bool _2179 = _2177 && _2169;
    float _2181 = -_1262;
    float _2183 = fma(_2181, _1382, _2135);
    float _2185 = -_1262;
    float _2187 = fma(_2185, _1380, _2133);
    float _2189 = -_1262;
    float _2191 = fma(_2189, _1386, _2137);
    float _2193 = fma(_1350, _1380, _2139);
    float _2195 = fma(_1350, _1382, _2141);
    float _2197 = fma(_1350, _1386, _2143);
    float _2199 = fma(_1352, _1386, _2163);
    float _2201 = fma(_1336, _1278, _2183);
    float _2203 = fma(_1352, _1380, _2171);
    float _2205 = fma(_1352, _1382, _2173);
    float _2207 = fma(_1364, _1274, _2193);
    float _2209 = fma(_1364, _1278, _2195);
    float _2211 = fma(_1336, _1276, _2191);
    float _2213 = fma(_1364, _1276, _2197);
    float _2215 = fma(_1318, _1276, _2199);
    float _2217 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2219 = fma(_1336, _1274, _2187);
    float _2221 = _2159;
    float _2223 = _2157;
    float _2225 = _2161;
    float _2227 = _2207;
    float _2229 = _2050;
    float _2231 = _2078;
    float _2233 = _2074;
    if (!_2179)
    {
        float _2235 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2159);
        _2221 = _2235;
    }
    float _2237 = _2221;
    if (!_2179)
    {
        float _2239 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2157);
        _2223 = _2239;
    }
    float _2241 = _2223;
    float _2243 = fma(_1318, _1278, _2205);
    if (!_2179)
    {
        float _2245 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2161);
        _2225 = _2245;
    }
    float _2247 = _2225;
    float _2249 = _2201 * _2237;
    float _2251 = -_2175;
    float _2253 = _2251 + 1.0;
    float _2255 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2217);
    float _2257 = _2219 * _2237;
    float _2259 = fma(_2209, _2241, _2249);
    float _2261 = _2211 * _2237;
    float _2263 = _2050 * 0.5;
    float _2265 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2255);
    float _2267 = fma(_2243, _2247, _2259);
    float _2269 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2271 = fma(_2078, -0.5, _2263);
    float _2273 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2265);
    float _2275 = fma(_1318, _1274, _2203);
    float _2277 = fma(_2207, _2241, _2257);
    float _2279 = fma(_2213, _2241, _2261);
    float _2281 = _2273 + _2050;
    float _2283 = _2074 + _2050;
    float _2285 = fma(_2275, _2247, _2277);
    float _2287 = fma(_2215, _2247, _2279);
    float _2289 = _2281 * 0.5;
    float _2291 = _2283 * 0.5;
    bool _2293 = _1814 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2295 = isnan(_1814);
    bool _2297 = _2293 || _2295;
    bool _2299 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2301 = _2297 || _2299;
    out.m_77.x = _2285;
    out.m_77.y = _2267;
    out.m_77.z = _2287;
    out.m_79.x = _2291;
    out.m_79.y = _2271;
    out.m_79.z = _2289;
    out.m_79.w = _2050;
    out.gl_Position.x = _2074;
    out.gl_Position.y = _2078;
    out.gl_Position.z = _2273;
    out.gl_Position.w = _2050;
    float _2303 = _2273;
    if (!_2301)
    {
        _2227 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2305 = _2227;
    float _2307 = _2305;
    float _2309 = _2305;
    if (!_2301)
    {
        _2229 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2311 = _2229;
    float _2313 = _2311;
    float _2315 = _2311;
    if (!_2301)
    {
        _2303 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2317 = _2303;
    float _2319 = _2317;
    float _2321 = _2317;
    if (!_2301)
    {
        _2231 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2323 = _2231;
    float _2325 = _2323;
    float _2327 = _2323;
    if (!_2301)
    {
        _2233 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2329 = _2233;
    float _2331 = _2269 * _2104;
    float _2333 = -_2269;
    float _2335 = _2333 + 1.0;
    float _2337 = _2121 * _2331;
    float _2339 = _2121 * _2335;
    float _2341 = _2131 * _2331;
    float _2343 = fma(_2127, _2337, _2115);
    float _2345 = fma(_2129, _2337, _2117);
    float _2347 = _2115;
    float _2349 = _2329;
    float _2351 = _2329;
    if (!_2301)
    {
        _2347 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2353 = _2347;
    float _2355 = fma(_2121, _2341, _2119);
    out.m_81.x = _2343;
    out.m_81.y = _2345;
    out.m_81.z = _2355;
    out.m_81.w = _2339;
    bool _2357 = !_2301;
    float _2359 = _2353;
    float _2361 = _2353;
    if (!_2357)
    {
        bool _2363 = _1814 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2365 = isnan(_1814);
        bool _2367 = _2363 || _2365;
        bool _2369 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2371 = _2367 || _2369;
        if (!_2371)
        {
            float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2375 = _1814 + _2373;
            float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2379 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2377;
            float _2381 = 1.0 / _2379;
            float _2383 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2385 = _2383 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2387 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2389 = _2387 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2391 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2403 = _2375 * _2381;
            float _2405 = precise::clamp(_2403, 0.0, 1.0);
            float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2409 = _2407 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2411 = fma(_2405, _2385, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2413 = fma(_2405, _2409, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2415 = fma(_2405, _2389, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2417 = fma(_2405, _2393, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2419 = fma(_2405, _2397, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2421 = fma(_2405, _2401, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2361 = _2413;
            _2327 = _2419;
            _2309 = _2411;
            _2321 = _2417;
            _2315 = _2415;
            _2351 = _2421;
            _2423 = true;
        }
        else
        {
            bool _2425 = _1814 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2427 = isnan(_1814);
            bool _2429 = _2425 || _2427;
            bool _2431 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2433 = _2429 || _2431;
            if (!_2433)
            {
                _2307 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2435 = _2307;
            _2309 = _2435;
            if (!_2433)
            {
                _2359 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2437 = _2359;
            _2361 = _2437;
            if (!_2433)
            {
                _2313 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2439 = _2313;
            _2315 = _2439;
            if (!_2433)
            {
                _2319 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2441 = _2319;
            _2321 = _2441;
            if (!_2433)
            {
                _2325 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2443 = _2325;
            _2327 = _2443;
            if (!_2433)
            {
                _2349 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2445 = _2349;
            bool _2447 = !_2433;
            _2351 = _2445;
            if (!_2447)
            {
                bool _2449 = _1814 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2451 = isnan(_1814);
                bool _2453 = _2449 || _2451;
                bool _2455 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2457 = _2453 || _2455;
                if (!_2457)
                {
                    float _2459 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2461 = _1814 + _2459;
                    float _2463 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2465 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2463;
                    float _2467 = 1.0 / _2465;
                    float _2469 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2471 = _2469 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2473 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2475 = _2473 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2477 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2479 = _2477 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2481 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2483 = _2481 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2487 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2489 = _2461 * _2467;
                    float _2491 = precise::clamp(_2489, 0.0, 1.0);
                    float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2497 = fma(_2491, _2471, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2499 = fma(_2491, _2495, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2501 = fma(_2491, _2475, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2503 = fma(_2491, _2479, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2505 = fma(_2491, _2483, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2507 = fma(_2491, _2487, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2361 = _2499;
                    _2327 = _2505;
                    _2309 = _2497;
                    _2321 = _2503;
                    _2315 = _2501;
                    _2351 = _2507;
                    _2423 = true;
                }
                else
                {
                    _2361 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2327 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2309 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2321 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2315 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2351 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2423 = false;
    float _2509 = _2361;
    float _2511 = _2327;
    float _2513 = _2309;
    float _2515 = _2321;
    float _2517 = _2315;
    float _2519 = _2351;
    float _2521 = fma(_2267, -0.5, 0.5);
    float _2523 = precise::clamp(_2521, 0.0, 1.0);
    float _2525 = -_2509;
    float _2527 = _2525 + _2511;
    float _2529 = _1792 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2531 = -_2513;
    float _2533 = _2531 + _2515;
    float _2535 = fma(_2523, _2527, _2509);
    out.m_83.x = 0.0;
    float _2537 = -_2517;
    float _2539 = _2537 + _2519;
    float _2541 = fma(_2523, _2533, _2513);
    float _2543 = _2535 * 0.586610972881317138671875;
    out.m_47.x = _2529;
    bool _2545 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2547 = fma(_2523, _2539, _2517);
    float _2549 = fma(_2541, 0.298911988735198974609375, _2543);
    bool _2551 = _1792 > 0.0;
    bool _2553 = isnan(_1792);
    bool _2555 = _2551 || _2553;
    bool _2557 = isnan(0.0);
    bool _2559 = _2555 || _2557;
    float _2561 = fma(_2547, 0.114477999508380889892578125, _2549);
    float _2563 = -_2561;
    float _2565 = _2541 + _2563;
    float _2567 = -_2561;
    float _2569 = _2535 + _2567;
    float _2571 = -_2561;
    float _2573 = _2547 + _2571;
    float _2575 = fma(_2565, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2561);
    float _2577 = fma(_2569, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2561);
    float _2579 = fma(_2573, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2561);
    bool _2581 = !_2545;
    if (!_2581)
    {
        float _2583 = -_1720;
        float _2585 = _2583 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2587 = -_1722;
        float _2589 = _2587 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2591 = -_1724;
        float _2593 = _2591 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2595 = _2585 * _2585;
        float _2597 = fma(_2589, _2589, _2595);
        float _2599 = fma(_2593, _2593, _2597);
        float _2601 = sqrt(_2599);
        float _2603 = rsqrt(_2599);
        float _2605 = -_2601;
        float _2607 = _2605 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2609 = _2607 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2611 = precise::clamp(_2609, 0.0, 1.0);
        float _2613 = _2589 * _2603;
        float _2615 = _2585 * _2603;
        float _2617 = abs(_2611);
        float _2619 = log2(_2617);
        float _2621 = _2593 * _2603;
        float _2623 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2625 = _2267 * _2615;
        float _2627 = -_2615;
        float _2629 = -_2623;
        float _2631 = fma(_2627, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2629);
        float _2633 = fma(_2285, _2613, _2625);
        float _2635 = -_2621;
        float _2637 = fma(_2635, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2631);
        float _2639 = fma(_2287, _2621, _2633);
        float _2641 = precise::clamp(_2639, 0.0, 1.0);
        float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2645 = _2637 + _2643;
        float _2647 = _2619 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2649 = _2645 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2651 = precise::clamp(_2649, 0.0, 1.0);
        float _2653 = exp2(_2647);
        float _2655 = _2653 * _2651;
        float _2657 = _2641 * _2655;
        float _2659 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2661 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2663 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_83.x = _2659;
        out.m_83.y = _2661;
        out.m_83.z = _2663;
    }
    out.m_85.x = _2575;
    out.m_85.y = _2577;
    out.m_85.z = _2579;
    if (_2559)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2665 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2665;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

